Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp91371wrq;
        Thu, 7 Feb 2019 09:29:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYbrNU3l53ar9E7qqrWIRoiJJGJNS6UO6sSwNmFr/urZ797JoOlN1JTgLXYGMBuMDTXYKZs
X-Received: by 2002:a0d:f145:: with SMTP id a66mr13942841ywf.251.1549560549255;
        Thu, 07 Feb 2019 09:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549560549; cv=none;
        d=google.com; s=arc-20160816;
        b=w9ER786U4WF6ATyN3aLKJnQmGbZdkEvkeqYqhvlQUVFbtBAYghZ5zrhKHAP9dEwIeq
         ChAp7IjPPk3qpc82/pXIz9dE430osKkdtxdrnh4mmKQqRKG+qF6qDz+DCjk7PfIFw4gU
         OR8hv+Td027vE7SN0/89PaeMp/4oUiAmq3B+40R4VZUyUp1G86AIihwZkKlHSXqBzNWn
         0CkCc5jF38fxls/ZeUGBKKzVMlxognn+agNCV3BA2Fu0c/J2D+GsqmGzyv525xlwtF6I
         SJIATJi0WO4vqGr3BRNBTEvoJh3ziDsXsrDwOmL01+TqjmzVghX41GWEZaD7+CP+vXUT
         YcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=95W7crR/mDKM6GDUrA+T2imj0G3E0w1wtJINjksudrs=;
        b=lesBIW+9Kg/sVcjzRBHszqi7Pw8cO9gyX2dQY0d/LTNiVYRFwcnE1Vk6zfzclccicQ
         tCwGvQD6aHmYEpm4M0RPgkQpp5UGVkEasZUPn4KLuGyclOVW8udsZS18rKeTvCuBZji7
         GgAZ/yk5LJP1+ybbyCZpG7cQ3OvcpYagbT/YInXFoxOAZaZkthXBXwypJs2w69i0dvAi
         zfGXvejopirg/43+xnXArmruiX4tDat4j2UMYnBmV2CLa9kbWeGkbS7gXrPOq8xfZolX
         Bgy5XnfYhXTSZCCZlwCwdJHY4EpS3lP+6H5iLyU/QgUlvR2k+n/7S0TMedCbVyYwWd/H
         SU+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=di6+EPGd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v190si6197767ywf.283.2019.02.07.09.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=di6+EPGd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnU4-0005CT-Kf
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnTq-0005Bb-0s
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:28:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnTp-0005yP-0j
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:28:54 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grnTo-0005x7-Qi
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:28:52 -0500
Received: by mail-ot1-x344.google.com with SMTP id n8so1134143otl.6
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 09:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=95W7crR/mDKM6GDUrA+T2imj0G3E0w1wtJINjksudrs=;
	b=di6+EPGdLBnmSiT0YN97wAHjV6DanvewVjqXaPs6uRqJ8QXqBA3tWXol34u9p6/lOh
	9M79a0dHyDhvcGVClm6CJcuGh081TA+kCHL7EkzBAgH9K4TQXgor8f+M0CQHjDgUQwWW
	urWn6ZDFx0xQjdFx3TsDRLF7Em5dxE7AcphPDMy9efmnmy+Wi84mi6UiwuGOm8zBUBpF
	5bpNPusnsosywmxJTJCOn2TgcLyxCUzWyRvoZJuLv4OIXCkEbTZ0fuHDFLRFM3mcwM4t
	V9HyMgWN+Bhl3Y0P3QwrtUtjfqR/NtDq+X5f609V/8cDwKxtsstsFvCP/tRgLeT4j0xP
	Ti4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=95W7crR/mDKM6GDUrA+T2imj0G3E0w1wtJINjksudrs=;
	b=Q71httB/wB+sC4vju/vm9zDTdLmUWbP+q0enS4P2Ii/a8TNhyY5o9hw07nGwcchOP1
	x+azMBl0A76u75AVKZ3vueNKIjB9SQDZOvaqw777gMZpbIyVj1tti5/BA+atVw52qKm1
	eL/Q9UaB/g7KPibmb2hXMaVKcQpCcjHIQrjX3veCVkhnBx5xXDbAquWrpQvtkQyzpRmn
	MDGSFYx7RHHdRMOYrL6p90WxQ5hrhV+wXtx/6sK0zW/fSJ4S4EVs1o8iu9nDSU6kiM4u
	usF4Xs1Jn7vUd+Or0QCkD69XRFcPc+bmSEcP1yRWQY9DOhiGFGo9zU7k6unJFNPhsjMZ
	ZZeA==
X-Gm-Message-State: AHQUAub9Q0KpC7Sfdj14sM6NG3UrsELEpJvKUhailZSkPXF0CDl3lKhA
	RPnaL6RzDWt1Y51MYd0uCQ9BOXFAW7vMqao/03v+6A==
X-Received: by 2002:a9d:4b0f:: with SMTP id q15mr9654082otf.201.1549560531591; 
	Thu, 07 Feb 2019 09:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-8-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:28:38 +0000
Message-ID: <CAFEAcA9T2C0-KAhU5c=+r0g5Ti_ZtL_TJE0rqWS8qkqDO5MELg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 07/17] target/arm: Implement ADDG,
 SUBG instructions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XlKJ+di3TISA

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |  2 ++
>  target/arm/internals.h     |  3 ++
>  target/arm/mte_helper.c    | 34 ++++++++++++++++++
>  target/arm/translate-a64.c | 71 ++++++++++++++++++++++++++------------
>  4 files changed, 87 insertions(+), 23 deletions(-)
>
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index 7a6051fdab..47577207b2 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -105,3 +105,5 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
>
>  DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
>  DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
> +DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 2922324f63..a5a249b001 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1002,4 +1002,7 @@ static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
>      return sctlr != 0;
>  }
>
> +/* We associate one allocation tag per 16 bytes, the minimum.  */
> +#define LOG2_TAG_GRANULE 4
> +
>  #endif
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 1878393fc4..e2b1a5dd40 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -163,3 +163,37 @@ uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
>      }
>      return address_with_allocation_tag(rn, rtag);
>  }
> +
> +uint64_t HELPER(addg)(CPUARMState *env, uint64_t ptr,
> +                      uint32_t offset, uint32_t tag_offset)
> +{
> +    int el = arm_current_el(env);
> +    uint64_t sctlr = arm_sctlr(env, el);
> +    int rtag = 0;
> +
> +    if (allocation_tag_access_enabled(env, el, sctlr)) {
> +        int start_tag = allocation_tag_from_addr(ptr);
> +        uint16_t exclude = env->cp15.gcr_el1;

I'm not entirely convinced about this extraction of the 'exclude'
field from GCR_EL1 by silently assigning it to a uint16_t;
it's a bit non-obvious.

> +        rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
> +    }
> +
> +    offset <<= LOG2_TAG_GRANULE;
> +    return address_with_allocation_tag(ptr + offset, rtag);
> +}
> +
> +uint64_t HELPER(subg)(CPUARMState *env, uint64_t ptr,
> +                      uint32_t offset, uint32_t tag_offset)
> +{
> +    int el = arm_current_el(env);
> +    uint64_t sctlr = arm_sctlr(env, el);
> +    int rtag = 0;
> +
> +    if (allocation_tag_access_enabled(env, el, sctlr)) {
> +        int start_tag = allocation_tag_from_addr(ptr);
> +        uint16_t exclude = env->cp15.gcr_el1;
> +        rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
> +    }
> +
> +    offset <<= LOG2_TAG_GRANULE;
> +    return address_with_allocation_tag(ptr - offset, rtag);
> +}

You could have done the shift of the offset at translate time,
but I guess it doesn't make any difference given everything else
we're doing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
