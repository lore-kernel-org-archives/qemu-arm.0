Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E956DC44501
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmdq-0006AT-4b; Thu, 09 Jul 2026 07:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmdp-0006A4-8r
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:10:05 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmdn-0007CJ-Pf
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:10:05 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66780d9d901so2266420d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783595402; cv=none;
 d=google.com; s=arc-20260327;
 b=aBUg/v18rJzaQXaTsKnTvTIFZ6I0SyU/nhYf2bwIInlEFMOnrraJ/9qd2hQJWTfu/2
 kTrw7vK2aNhxwMS8N6K8tnu3ztT8q2w4OIOFMy395rCMIrMG3jDp1dBbHJJ2i7DSL6F8
 JL0F24qfP6aN/Uh9bPEmBUISIF8WWcL8/RZkPd4eyA0mfwuBJn6ldChB6MvvBl0A+rUu
 IWX0IqLIcMvzg+ITOXYrEcxHaWQM21HPXtGJ34WAYcV1+fejo77DTTjhf8zXNUFy0URo
 3wsVpqhtV1nqV9ETD/eRxziZFqUCX7a0Fv4Xub2PWFphAcp1yiaIIxnIO4O5vdvjG5d2
 ZpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2cy4r1aLv3+SqsukA9CdP+qIivEgu2ttcn+KdatcOc8=;
 fh=oR7TsPg3OTmNosGgopAXF0ZXV9nY+FQmXuneIKe+VyU=;
 b=SK5AngWfJAdORDr3Kndc9wTCqcQAoh/fUZ5K/50qRmt17w03/IllUbuLWcEpvkfSrV
 tzUZTQEIedQE1vgpbqVXdEeumKOBDmNTrXTv8iKaT+Lutra+gkPB/ZhQWbWrzxqTkaYS
 IBI6oKUw0HuNpUxpABCtdqYkq7necqjlJ3ax4K/g9a0arODSAneBce3E8lZe1zil4VhA
 R5g0yr/1jyuyk8p8pjGZe/0V/MBnnwijkG7KRRX/+dgduRk2AV3QgBvc7aS6sivC9fPG
 OZjoC5vSvTTlrRBHVohgyFX56lo5QirJWdsQ9yTzYO4VEgcYLSRGkOWG8zXOUuANJB/x
 u3HA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783595402; x=1784200202; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2cy4r1aLv3+SqsukA9CdP+qIivEgu2ttcn+KdatcOc8=;
 b=zgli7USEF6oM62iEB7pRKS1LtgfS+2G2h93RjinuInQBhLfhObUuwwQJznYhqxauLF
 Gpz6mRnF3S78lF7IbWg5QMREFagjVAVW1YMNHpC9dFgMw+M/k364FNZ7l3dZbdIQmLjY
 y4zzQv206W4iO13VEwjlXm0vFm/cl0Jkr4gqSVXr8oQ9igC1FGNSkHvcLv/mJ6DkShm+
 wAs2nVeQ5EiS/ZO9QGuxpFxTNGfJyueIPzx5mV0eLlix5VeImvrpJDbt1XF/xFR3lXsC
 ltM7qfBnynV+lipwQT1g+yc7JYiPBW7jfdhPiJ1GuV0kqEPfXXId3ue9jCUJd0gx73sb
 7S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783595402; x=1784200202;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2cy4r1aLv3+SqsukA9CdP+qIivEgu2ttcn+KdatcOc8=;
 b=hlg5sXU0MKFOx3EJNh2WCoqNa3AbcwYSGA3P+04Dr3B/85bgtVdy6NZFWLNuL/omGq
 qbKiHHWi0PDwGnuwEDAPQFmhRA82yjGvGYGS010Ex2luLg8FBbRm9Kf734llaaa9XTHS
 3XJ36X2Qsbd7a15NchacFivvhC/RXg7q82v7MD1wCVamwoPdz0BHF6Jp/Q2xQS3ivz17
 q8AC5lIJWWAFyMNsUrupUiLDtQgj4+JYwzsXtTPxmim7itC/eiwwHc92wVJ46gN5AJ6j
 RZZDkv3LiyUJV+AZ1B2wxm4LoLdu1f00yCzjiSQdtGDkD7bMiztJyUAbw5E+qFY/xyDw
 X+CQ==
X-Gm-Message-State: AOJu0Ywf4HmC5YlHotNY+OCEZAopDCSKFn8pYObPnOFXPqmbX5f1vg2S
 COGb625iygXsQsya5XIuJwDLyl3OAfVc0TOxu9mENslwxrL7MsGr70RwnSTuBbkWGWdq2b9318g
 VTN4Q72KzwyzsJi4FyGkS970md7vbIF4oxGxQOKW4GA==
X-Gm-Gg: AfdE7ck4CHhuluTA9VHHvW6j6Ef7/LP1fzTNnc9gszUAlNSCltuaLLpoi50cRwlx+B5
 pGuvWyVjLrxHOBWZ1mVKKyxTL8l0/pZRB44gEECJZOwaxL1GYl+xnlZMfzW4z0MLkxSfZBNQzGF
 rNNWGXH3ovhuPqqYXZI8tuZGBLt5tS/X6vLEFUVso8OJGTZKq2FYkt7SbCCiL3NXGoAcHEm/yyK
 Y1YIPqPnAqPTFPOvdbkCvJ95E6ngw0lE7pO8Haxe4+4uw89p/lUXkt+R9LOKRdqYBLFyZB9ccrA
 JHbGzN7bI3iPJJ9vLn1rFNA58JGPaoltHhzEkBVtcbCJWCi6KEzlkFHJ
X-Received: by 2002:a05:690e:c4f:b0:664:b514:a086 with SMTP id
 956f58d0204a3-6679f140856mr5029775d50.52.1783595402209; Thu, 09 Jul 2026
 04:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-2-titusr@google.com>
In-Reply-To: <20260706230056.1888992-2-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:09:50 +0100
X-Gm-Features: AUfX_myERs1L9279KhurrylH9bbHwFfzyNfR2pwyiBgR0pjJvzaW3aewwEEuWT0
Message-ID: <CAFEAcA9kmrEFCiWLfL1FSLv7W34hSqvFaY7=BpcT+h-WnpKC_Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] osdep: add DIV_ROUND_CLOSEST
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 7 Jul 2026 at 00:01, Titus Rwantare <titusr@google.com> wrote:
>
> This is taken from linux/include/uapi/linux/const.h to match the driver
> behaviour when reading sensor values.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  include/qemu/osdep.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 1ec5b42230..a6a40ab8df 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -522,6 +522,20 @@ void QEMU_ERROR("code path is reachable")
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  #endif
>
> +#ifndef DIV_ROUND_CLOSEST
> +#define DIV_ROUND_CLOSEST(n, d) \
> +({ \
> +    typeof(n) __n = n; \
> +    typeof(d) __d = d; \
> +    (((typeof(n))-1) > 0 || \
> +     ((typeof(d))-1) > 0 || \
> +     (((__n) > 0) == ((__d) > 0))) ? \
> +        (((__n) + ((__d) / 2)) / (__d)) : \
> +        (((__n) - ((__d) / 2)) / (__d)); \
> +})
> +#endif

Can we also have the comment from the kernel header that
tells us what it does, please?

/*
 * Divide positive or negative dividend by positive or negative divisor
 * and round to closest integer. Result is undefined for negative
 * divisors if the dividend variable type is unsigned and for negative
 * dividends if the divisor variable type is unsigned.
 */

-- PMM

