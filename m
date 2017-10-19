Received: by 10.223.197.9 with SMTP id q9csp6945448wrf;
        Thu, 19 Oct 2017 08:40:02 -0700 (PDT)
X-Received: by 10.200.38.50 with SMTP id u47mr2611474qtu.112.1508427602303;
        Thu, 19 Oct 2017 08:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508427602; cv=none;
        d=google.com; s=arc-20160816;
        b=mh2WouxtvLl7bxJsh+93/CdwmUgfx2HOQZqTOAbXZ76o9n4saExosNDoHObyPROLVr
         EsnOz6uhCxq4WBxQINIR4vU+OS7ZCGzXO7a7TEZtcbMWPC/oIO2kF0kDFWTT8b+PNX0M
         he0Kau+1jT95wOgWV9PPOy0OKeLTJruiJo9X7aAwdmDIWQQ5z+JPLKSVgsXzQn60T6+I
         jeT2v8KGRsBA9nEOT12cU6ilTtbCcV+ASPwXFcya9DR9vHCNOeL+3LUuDHtSfgv04eIK
         nFzJuDo+Q6/eyDzxG9LbVWy5mXwEnl2ah2ZhGDcJTM4nMSUS0r58LXXzy/cMVc9WVX4i
         kzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bIxzXttVwlcilZLB6opizamOLgibjgZU6S4SnuqTaDU=;
        b=jhD9scRdG+j1l7h7C6wo4eF6j27KtW5oMAb+CS6fMTtjWE0wt6eSC3xgF+mlm83PIp
         Wk8lhgWJ7VCpftXs6eUa+MpcthMZnT46jkdNRyY29sJcEfy71sxlgwyw+yS/OBp7LGOk
         HyZmdP885sLKE9khfAaz/JLd92wrYmwftnold0520GoOzpraUyDvvw50J8dTLOP+y5Da
         3YDzQh7MWq+v0V4X4rykJ+f4WWz8kb5/t1AhAM0uXgYNYSEQ30gJpaLmZSAdJCcLjPj1
         ICgiG/CbVdW3At1k95gxyjR5+HNjWZUGqFyVPtjRrhpnIsd9I071PatElzkzEzfIrX3t
         2l2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R5pZlUwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e29si6301184qkh.252.2017.10.19.08.40.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R5pZlUwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CvQ-0008Uw-2u
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:40:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5CvC-0008TS-DQ
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5CvB-0000yl-H2
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:39:46 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:47638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5CvB-0000yM-8x
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:39:45 -0400
Received: by mail-wm0-x244.google.com with SMTP id t69so16874005wmt.2
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bIxzXttVwlcilZLB6opizamOLgibjgZU6S4SnuqTaDU=;
	b=R5pZlUwRwNpppXbjh/UiwkkcssN1MhA4P5/C2ZUdCrPfj1UsDBrRo96RblAHTe+2Xf
	UOMnxk3jdSVwJdt6XTYc83xBC0tV3knKOlTfdHgIPEBgJl8+Q2lZMepMYaH4kmmCqWrz
	VuNHOSuFx6Ko+0ALZBk3TAxqj176HoeM8aOLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bIxzXttVwlcilZLB6opizamOLgibjgZU6S4SnuqTaDU=;
	b=Xfh24uNFI4HduTNVA/mIm7GstL/FwYH9JTNJBgayQxwwxxDZgejB8OS7Yn2clBQfhM
	6G23j4xjcL83+geZRCPor89h3YH+y2kRhqQS/AKLJ+ugWaTdHHqKp7gSJYPEVeta/9QR
	3Mp62E+xloMTzcX+hJWUzl+LbjEUN6eN9QfwJKDu6taSio2s0m9QVQPtMdnERFxGQwul
	NAA0/dnOdqD3myVqt3nbQPl5xS9ArI98kL7nrF03FBQKprjHNlZG1ol2KJfCMZuayse6
	csEdrn8/vOlKo3pNBHvAAgvJIMLVwWIaIESKUmEXZCTFXuwqsxR9IFmQWu/7Bz8/4I58
	rcsA==
X-Gm-Message-State: AMCzsaXIX2ivDf3zwZAmYE5Nbl5RpPzw9i6O9QUH746bLF2SIEuyeQOo
	eMwBE7Wolc5355fU7VOMe7OsQCIXmRmUSfyEo8tjXQ==
X-Google-Smtp-Source: ABhQp+RMQJSAx5wJtGLmOW78A6KiydAOe69IXgypGiQJwkYEQi4UeniMi9c8ygjUi9sYVxtZavXIMHeNj0VmL8V/nlo=
X-Received: by 10.28.14.195 with SMTP id 186mr2062348wmo.56.1508427584121;
	Thu, 19 Oct 2017 08:39:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 08:39:23 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710181539580.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710181539580.27209@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 16:39:23 +0100
Message-ID: <CAFEAcA9t7i4JLbn2X5r2KqdA00fSEZPLEW4PpCsp_uyg8Gsm0A@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH] don't hardcode EL1 in
 extended_addresses_enabled
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9KQF72tyUGg8

On 18 October 2017 at 23:41, Stefano Stabellini <sstabellini@kernel.org> wrote:
> extended_addresses_enabled calls arm_el_is_aa64, hardcoding exception
> level 1. Instead, retrieve the current el calling arm_current_el.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1f6efef..63507d9 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -187,7 +187,7 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
>  static inline bool extended_addresses_enabled(CPUARMState *env)
>  {
>      TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
> -    return arm_el_is_aa64(env, 1) ||
> +    return arm_el_is_aa64(env, arm_current_el(env)) ||
>             (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
>  }

Hmm. The current code was definitely written under a "aarch64
only supports EL0 and EL1" assumption, but I'm not sure
this change is entirely correct.

We use this function in 3 places:

 * identifying whether to flush TLBs on CONTEXTIDR writes
    -- using current EL seems like the right thing (but I'm not
       sure -- perhaps we should pass in the S/NS from which
       version of the 32-bit banked register is being updated
       rather than using arm_is_secure(env) ???)
 * choosing a PAR format for ATS operations
    -- using the current EL is closer to correct that what we
       have now. There are cases for a 32-bit CPU in Hyp mode that
       this code mishandles, but we don't support that yet.
 * choosing an FSR value when taking a breakpoint or watchpoint trap
    -- here what we want the function to mean is "what is the
       FSR format for the EL we're about to take this debug
       exception to", which isn't necessarily the answer for the
       current EL (consider 32 bit EL0 under a 64-bit EL1)

So this change will fix the PAR format for ATS operations
made at AArch64 EL2 when EL1 is AArch32, but it will break
the FSR format for breakpoints/watchpoints hit at AArch32 EL0
and taken to AArch64 EL1, I think.

We probably need to separate out these uses to not all try
to use the same function, and clarify what they're checking.

thanks
-- PMM
