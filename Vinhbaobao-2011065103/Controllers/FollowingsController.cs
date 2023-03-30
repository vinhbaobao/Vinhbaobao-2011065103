using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vinhbaobao_2011065103.Models;
using Vinhbaobao_2011065103.DTOs;
using System.Web.Http;
using Microsoft.AspNet.Identity;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;

namespace Vinhbaobao_2011065103.Controllers
{
    public class FollowingsController : ApiController
    {
        private readonly ApplicationDbContext _dbConText;
        public FollowingsController()
        {
            _dbConText = new ApplicationDbContext();
        }
        [HttpPost]
        public IHttpActionResult Follow(FollowingDto followingDto)
        {
            var userId = User.Identity.GetUserId();
            if (_dbConText.Followings.Any(f => f.FollowerId == userId && f.FolloweeId == followingDto.FolloweeId))
                return BadRequest("Folowing already exists!");
            var folowing = new Following
            {
                FollowerId = userId,
                FolloweeId = followingDto.FolloweeId
            };
            _dbConText.Followings.Add(folowing);
            _dbConText.SaveChanges();
            return Ok();
        }
    }
}