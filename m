Received: by 10.223.197.9 with SMTP id q9csp9054219wrf;
        Sat, 21 Oct 2017 11:06:03 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R8JGg6/xB1X7JvTsEml4VYZ0b911+aVTYIOAvnEUpwrU+1owO9mF1lnMdC+iziLyQoyAKE
X-Received: by 10.237.62.252 with SMTP id o57mr12690637qtf.144.1508609163868;
        Sat, 21 Oct 2017 11:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508609163; cv=none;
        d=google.com; s=arc-20160816;
        b=VM68kGbb55mEyqXg7QwzeBvZCT9QkccufybBKUZ7zT0fNlPk+5Lp0ExWXDWT3GsEP1
         svRHdK9LNRMC6j0RjExXZvhPnmIdSXa7L500/mMCRObBR1Rf6DmSXqE9YgiFTiJ5drsU
         SfnDjAljLJcDdqu8wCHU4B+JNOnjHoi7AL79PZW90bFd9FnHXUkVlbDniUHNV38WTXnV
         k3/aR/Z0ewapUjWodNLMMPLNl/AFORxxHY5OSyyiYdGlX54c1MqWAK8amyFLAsUDmXe8
         Eeqlbv7b3lVSmxb44+gPzcIJObb92JK7YosAng3prhbdFDVFon1g9oXiSxPwnNXPf8Mn
         YDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=zgitobt/dgXCThSnOkBq5omWitG2WQIoPGT4Hm3N09Y=;
        b=jDcgRRFGsXvL9sdGEeSzX7PxxqHJh/MBFks9KvBb6I2sEYQHYJ2Jm7/euOgN/Q7n3X
         +Wy8E6DIkok9pLCUAlnkWQ7t9ij6YyrqQscoL3nJ/hamEA2KYyrShsLe6UXZf/aqNKlS
         6Wtf3Ky1PlaoLMCp3vc5hOl6QnvwVGF4VdoLjJFPSjFdvPwB4Njriz2JWze1TSHQqtzb
         wo1FDMVuXfdUPgytWWpA3bS+vYB6MnKgWVm7ySz0uMobbhjfGm4l5KPiC62aXg46cJ0W
         /UQw8K8eSvqUhlQOslfGVPMzh48Vks8oOnXAgk6OFOThYjgRXO76y6Y0pdKOvel6+ZvW
         KLKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si2946816qkf.437.2017.10.21.11.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 11:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5y9p-0007zP-IH
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 14:06:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e5y9d-0007z2-N0
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e5y9a-00024W-HW
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:05:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:51600)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e5y9a-00022e-9C; Sat, 21 Oct 2017 14:05:46 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BB3A22191E;
	Sat, 21 Oct 2017 18:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3A22191E
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Sat, 21 Oct 2017 11:05:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8uH1+V4uYsA=XuuxHOLKvLyZ56ieAaS5K9QNoLYspOsQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710201110160.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710181439060.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA_v=UsQ4hfn2oVLt3MPU3yJUnHLfzZHrdkstQ0VVgSDbw@mail.gmail.com>
	<alpine.DEB.2.10.1710191354020.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA8uH1+V4uYsA=XuuxHOLKvLyZ56ieAaS5K9QNoLYspOsQ@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH] fix WFI/WFE length in syndrome register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQ0G1KNW87st

On Fri, 20 Oct 2017, Peter Maydell wrote:
> On 19 October 2017 at 21:56, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Thu, 19 Oct 2017, Peter Maydell wrote:
> >> On 18 October 2017 at 23:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >> > WFI/E are 4 bytes long: set ARM_EL_IL_SHIFT in the syndrome.
> >> >
> >> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> >> >
> >> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> >> > index 1f6efef..cf8c966 100644
> >> > --- a/target/arm/internals.h
> >> > +++ b/target/arm/internals.h
> >> > @@ -398,6 +398,7 @@ static inline uint32_t syn_breakpoint(int same_el)
> >> >  static inline uint32_t syn_wfx(int cv, int cond, int ti)
> >> >  {
> >> >      return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
> >> > +           (1 << ARM_EL_IL_SHIFT) |
> >> >             (cv << 24) | (cond << 20) | ti;
> >> >  }
> >>
> >> Hmm. What we do now is definitely wrong, but WFI and WFE can be 2 bytes:
> >> there is a T1 Thumb encoding that is 2 bytes.
> >>
> >> HELPER(wfi) doesn't get that right, though:
> >>     if (target_el) {
> >>         env->pc -= 4;
> >>         raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
> >>     }
> >>
> >> So I think that HELPER(wfi) needs to be passed an extra
> >> parameter is_16bit, which it can then use both in its adjustment
> >> of env->pc and to pass as an extra parameter to syn_wfx(),
> >> which is then syn_wfx(int cv, int cond, int ti, bool is_16bit).
> >>
> >> (In theory HELPER(wfe) should also be passed is_16bit, but
> >> since it doesn't currently ever raise an exception it
> >> doesn't matter.)
> >
> > Wouldn't it be better to just check on env->thumb like
> > HELPER(cpsr_write_eret) for example?
> 
> > diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> > index 3914145..ea16c9a 100644
> > --- a/target/arm/op_helper.c
> > +++ b/target/arm/op_helper.c
> > @@ -476,8 +476,8 @@ void HELPER(wfi)(CPUARMState *env)
> >      }
> >
> >      if (target_el) {
> > -        env->pc -= 4;
> > -        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
> > +        env->pc -= env->thumb ? 2 : 4;
> > +        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, env->thumb), target_el);
> >      }
> >
> >      cs->exception_index = EXCP_HLT;
> 
> This doesn't work, because there is also a 32 bit Thumb
> encoding of WFI. env->thumb says "we are in thumb mode",
> which isn't the same as "this insn is 16 bits".

OK, I understand your suggestion now. I'll send a new patch.
