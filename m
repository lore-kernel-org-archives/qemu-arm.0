Received: by 10.223.197.9 with SMTP id q9csp7225768wrf;
        Thu, 19 Oct 2017 13:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ROUQzzXTJ7VAde5ZNohbJA+wjSKK6nSoTjts576f7/551JGphAS+B3+QTdhaAJJ7IIsrq0
X-Received: by 10.55.80.3 with SMTP id e3mr3579541qkb.254.1508446638355;
        Thu, 19 Oct 2017 13:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508446638; cv=none;
        d=google.com; s=arc-20160816;
        b=RHyAy/5flLDbX/THp6J4QxREqoBi4PCqvfOTOPtuZvnWA9YJYCQX1f0X1hp04lACJl
         gdovYLrmrF6HjSCNTYyUYPMmt6A62wZftd54QI2pUt66gJ5+Ke/4XhwvBZ+a1O2K9CF0
         SFrGJ/Sf7+FauM6VmRtk9wafGPKSIyfhutYLR2u6uc04d4CYy8MnEiG3XrgJGa+nDk3x
         UIzIj/whWuM051gZ02HYQ5j7bRXb7+RcvijyNKRy7p6j81YR3SiiO5DZxxXVboJrr/IJ
         79LbOJPDJ6Pdmw+ue2wwK8298M0RmKrLboeL8FlWFFeSA0L+Eb3LYm4GHOCRpFFIsvGt
         PSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=lg+hl+Soza1Z7SbhbH0+/zyWAkJCeq80LQgX0zk7sIA=;
        b=rsQuAXW2j5xkqptCXYh99bMVmGCiocYy5BI9yyJGNnTHCY/mjqo8B0As5abxVvHso/
         id9BlR3Kszo0FzIPqb7xJg/D5UYJK8iI4/zTTb6aKeKTf0SJu5BdXT0AMQbVzF53z11K
         W6C6xoYqGVGPq8iq9/ixWvs2B3ptXjRzbb+hFxNcxSToDhGT5C+XLco0q7m4UVqY1ENf
         7F/7YvdldR/QILBN3gywi1zlPPbUHT0b1Uxy5e84OXDGRldHjmThkVQVgiZ6cuH4yI1p
         2HM6aZVeF02Zx4qm1l+sWx1CFkY5mRVVTbisyuC5v1VKvZiAdd5DmhN/iB2QlM8FtKoU
         FZzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q49si7259512qtf.25.2017.10.19.13.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 13:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5HsS-0000FX-36
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 16:57:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e5HsJ-0000F3-Kc
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 16:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e5HsG-0007xO-Ig
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 16:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:40854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e5HsG-0007va-9x; Thu, 19 Oct 2017 16:57:04 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 034402191C;
	Thu, 19 Oct 2017 20:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 034402191C
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Thu, 19 Oct 2017 13:56:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_v=UsQ4hfn2oVLt3MPU3yJUnHLfzZHrdkstQ0VVgSDbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710191354020.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710181439060.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA_v=UsQ4hfn2oVLt3MPU3yJUnHLfzZHrdkstQ0VVgSDbw@mail.gmail.com>
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
X-TUID: meZVNdh8v7pZ

On Thu, 19 Oct 2017, Peter Maydell wrote:
> On 18 October 2017 at 23:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > WFI/E are 4 bytes long: set ARM_EL_IL_SHIFT in the syndrome.
> >
> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> >
> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> > index 1f6efef..cf8c966 100644
> > --- a/target/arm/internals.h
> > +++ b/target/arm/internals.h
> > @@ -398,6 +398,7 @@ static inline uint32_t syn_breakpoint(int same_el)
> >  static inline uint32_t syn_wfx(int cv, int cond, int ti)
> >  {
> >      return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
> > +           (1 << ARM_EL_IL_SHIFT) |
> >             (cv << 24) | (cond << 20) | ti;
> >  }
> 
> Hmm. What we do now is definitely wrong, but WFI and WFE can be 2 bytes:
> there is a T1 Thumb encoding that is 2 bytes.
> 
> HELPER(wfi) doesn't get that right, though:
>     if (target_el) {
>         env->pc -= 4;
>         raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
>     }
> 
> So I think that HELPER(wfi) needs to be passed an extra
> parameter is_16bit, which it can then use both in its adjustment
> of env->pc and to pass as an extra parameter to syn_wfx(),
> which is then syn_wfx(int cv, int cond, int ti, bool is_16bit).
> 
> (In theory HELPER(wfe) should also be passed is_16bit, but
> since it doesn't currently ever raise an exception it
> doesn't matter.)

Wouldn't it be better to just check on env->thumb like
HELPER(cpsr_write_eret) for example?

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 670c07a..a451763 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 43106a2..55c70b4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -428,9 +428,10 @@ static inline uint32_t syn_breakpoint(int same_el)
         | ARM_EL_IL | 0x22;
 }
 
-static inline uint32_t syn_wfx(int cv, int cond, int ti)
+static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
 {
     return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
+           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
            (cv << 24) | (cond << 20) | ti;
 }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 3914145..ea16c9a 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -476,8 +476,8 @@ void HELPER(wfi)(CPUARMState *env)
     }
 
     if (target_el) {
-        env->pc -= 4;
-        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
+        env->pc -= env->thumb ? 2 : 4;
+        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, env->thumb), target_el);
     }
 
     cs->exception_index = EXCP_HLT;
