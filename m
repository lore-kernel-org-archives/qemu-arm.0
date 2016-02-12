Received: by 10.25.159.19 with SMTP id i19csp881432lfe;
        Fri, 12 Feb 2016 07:18:18 -0800 (PST)
X-Received: by 10.140.37.100 with SMTP id q91mr2600686qgq.6.1455290298904;
        Fri, 12 Feb 2016 07:18:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si16193815qgd.93.2016.02.12.07.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:18:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFUA-00029F-8K
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:18:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFU0-0001x1-L5
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:18:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aUFTz-000408-HO
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:18:08 -0500
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:35398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aUFTt-0003wi-A6; Fri, 12 Feb 2016 10:18:01 -0500
Received: by mail-pa0-x244.google.com with SMTP id fl4so3923481pad.2;
	Fri, 12 Feb 2016 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sapUNXZmJUF2d0jtkGNWyqpDpfVjrApquLI7bvD0ZJk=;
	b=HwnGBBb/V9CJWzIcXZNv4l+w9+k1hIH2NzlGXaVGoWehm74TTbDpS2CVVJqwstlPe7
	aWt02AhIAG73Tz7mOakCl8CZSZHZZZyfw9L2dzHeKkBNXSLBE/gLwtGZImEpgG/g2rV+
	B/i1qpwHZQflwPMogIvvg8KdC6UmS0LGz66IrGLBavgZ8tXKEkYe4R3x+2buP3/qZRkW
	puMb/Oclmq9k5BV7B8+EW5efQM4MBxfJsubflYbJNafQB9l8QgORVQjR4es49bI/Z3gH
	9VUgNg5iwCuEeqNg6/gDsSo9mtlz0GFft/r0+OZ+L9R2CjK/52ORifaUK33LYYU0DS1B
	FP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=sapUNXZmJUF2d0jtkGNWyqpDpfVjrApquLI7bvD0ZJk=;
	b=bk44aaNN93P4/ca8vNMQlc7Mj9Gt53chq7s0/YxYoo4zur+02itUcl7Oc8+kX0f5Fh
	tGK8ss73KHwHZOKmxJX5jjWv6MrwrRdrc+/B2bpMzO+l45O8RqirPd3S6OjAu7m542uR
	UJ7lrJGnVpVx40i9vYZeWfDLk7DGhGSlU4SyQUtdyamPNi3nkWmFzjJ7Gug8AJyNSxPY
	9HACIqNSJy1JqvFiOgdOFRAYDprNtcne+9Zuze6KTdGs8P4V9+TjPW37MXnxsypnlTBA
	XqaoO9mzmBQbP0PH9spp5h5GEODpn5rY+ZBv1uE2ntLEB+OgcddcjL81KD49hy0k7XYu
	uneA==
X-Gm-Message-State: AG10YOTeg22v/hm75MtHyIRlriYqkJdqSqdHQElZVaiCXgZgdkbQyZjhoAPrL+LSarSMjw==
X-Received: by 10.66.164.39 with SMTP id yn7mr2832496pab.107.1455290280715;
	Fri, 12 Feb 2016 07:18:00 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	t12sm20193302pfa.54.2016.02.12.07.17.58
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 07:18:00 -0800 (PST)
Date: Fri, 12 Feb 2016 16:15:32 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160212151532.GH31433@toto>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
	<20160212151218.GG31433@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160212151218.GG31433@toto>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and
 softmmu get/set_r13_banked()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0uwKJLB8/5BX

On Fri, Feb 12, 2016 at 04:12:18PM +0100, Edgar E. Iglesias wrote:
> On Thu, Feb 11, 2016 at 07:11:48PM +0000, Peter Maydell wrote:
> > The user-mode versions of get/set_r13_banked() exist just to assert
> > if they're ever called -- the translate time code should never
> > emit calls to them because SRS from user mode always UNDEF.
> > There's no code in the softmmu versions that can't compile in
> > CONFIG_USER_ONLY, so combine the two functions rather than
> > having completely split versions under ifdefs.
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Hi Peter,
> 
> Do we really need the assert?
> If we keep it, can't we have it for both -user and -softmmu (avoiding the ifdef)?

e.g:

assert(arm_current_el(env) != 0);

Allthough, I'd probably vote for removing it...

Cheers,
Edgar



> 
> Cheers,
> Edgar
> 
> 
> 
> > ---
> >  target-arm/op_helper.c | 25 ++++++-------------------
> >  1 file changed, 6 insertions(+), 19 deletions(-)
> > 
> > diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> > index 053e9b6..05f97a7 100644
> > --- a/target-arm/op_helper.c
> > +++ b/target-arm/op_helper.c
> > @@ -457,26 +457,11 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
> >      }
> >  }
> >  
> > -#if defined(CONFIG_USER_ONLY)
> > -void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> > -{
> > -    ARMCPU *cpu = arm_env_get_cpu(env);
> > -
> > -    cpu_abort(CPU(cpu), "banked r13 write\n");
> > -}
> > -
> > -uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> > -{
> > -    ARMCPU *cpu = arm_env_get_cpu(env);
> > -
> > -    cpu_abort(CPU(cpu), "banked r13 read\n");
> > -    return 0;
> > -}
> > -
> > -#else
> > -
> >  void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> >  {
> > +#if defined(CONFIG_USER_ONLY)
> > +    g_assert_not_reached();
> > +#endif
> >      if ((env->uncached_cpsr & CPSR_M) == mode) {
> >          env->regs[13] = val;
> >      } else {
> > @@ -486,13 +471,15 @@ void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
> >  
> >  uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
> >  {
> > +#if defined(CONFIG_USER_ONLY)
> > +    g_assert_not_reached();
> > +#endif
> >      if ((env->uncached_cpsr & CPSR_M) == mode) {
> >          return env->regs[13];
> >      } else {
> >          return env->banked_r13[bank_number(mode)];
> >      }
> >  }
> > -#endif
> >  
> >  void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
> >                                   uint32_t isread)
> > -- 
> > 1.9.1
> > 
