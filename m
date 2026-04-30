Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4BBFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 11:10:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIPHV-0002mo-Km; Thu, 30 Apr 2026 07:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIPHS-0002ik-VT
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 07:10:07 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIPHP-0003dw-Er
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 07:10:06 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-651c366f7efso817332d50.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 04:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777547402; cv=none;
 d=google.com; s=arc-20240605;
 b=LXJfN3Ro/bcg1ngjOeeMOg1URfYxCEJc1z1ybU+/aYgVH2mb3YIcFqtR7ozC5XmE28
 SeF3APv7nQ0r2cTwYjfPqIbhTK3IgCmgBpdEe6QToKGvEtbMTTLsIxAyrxox3a6fodlD
 a3xSAkvAr0AxAPzJHwpvNKKqpqmgwsI6RbrldSjh6KAroMcUglaTxFCwmaV83mg+c8Su
 b0+RyZNOEAOuTkvkVTbGi7l67MWeZjJQ9eM2edtpSKp9yd0Sy00AZVYoguRDl8dtBCdF
 y2GdHL77WRVpH9LbMlaVFinY3c4+JGiof1/XARRJZx/aaoDLClbd7uE6036cIuHlsIlQ
 2Q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aseB9l6GWX4xSCD8Fhc5hWuLuugGOqqC/9kGLYdDHfM=;
 fh=Txvtx8S47EP/uWg3M0jyfN4dMsQs5OyHnP4aW3zEOkQ=;
 b=ccxyFn+s3VPqpIQwq6Fj8O1v7IH0VRaFAu5jvk8uq+/y92bfk4ikg/rpKgz+yrb3OJ
 xSW9y+lj5fXMyvHIgnQcwsDpGBZltF44sYq9YMyURiw+TqjYHR9fNEQ61CUd60fKy+11
 WItGKLJiYjPFsMfvvXzgIXh5szHv7mk8Ozss54bqItbYQCuPT8v38F6M55Dy9EcNpu2i
 P9eAE1tZmpRm2AHdOEAsu7xktiU3LAVjM4LLp3U1oLjA0D7dHSopkr8UdFgSGJ7p6wPy
 UuMiJV7gYw6HvqLaiG+WZmPapDNevrh/0SlOF0oJymOET1rBjH/XwD3goFzw0zbYlHKe
 dn2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777547402; x=1778152202; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aseB9l6GWX4xSCD8Fhc5hWuLuugGOqqC/9kGLYdDHfM=;
 b=K5RkJNAIXUoHiAlhMsxOsGvPz98xWvk7v8oYF5nrPy4eTuBIgGISjjN3dcZ39R7/KX
 93Zt5t4wfButThqRnDd8mSupFP6VpKctnEVzc+DeHPJO+FPaVzzgRjrhhubyfZPAOvTV
 f7hfuIGyKD9XFmF2upU2ScGuquQQYLUKre3WhtiGX21GcdDg2cqyANTj5AYunWKQ+luZ
 TKXtkD+pa0j51oJXAG8CFTTLtu12yX80TZ4M1aAAre9d8Ub58DIdQ250NsJoBaahtx4d
 xL+Sq3Pi3+LaffdK/je4LTACI8tCinwD7X/etXfRjITEl0X9KJwU8Ffbz/FSsDrhX6Ov
 jVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777547402; x=1778152202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aseB9l6GWX4xSCD8Fhc5hWuLuugGOqqC/9kGLYdDHfM=;
 b=pC3MOM4zRuO+1zqwYFQpAJLy/u6fwI6ECxBqs/Hs1q2EbrJv8v/j+RvJ/cc7WIXS6c
 DXQE9lLsPHNF1h10DFXFOaL+f+017/bowmhJbav1AfSLYBPRouVUv4wM6kFW0PSM68TX
 eu2LErNrr/L5RV7cz/eMJNBEax3ydAf0XB+hsZAL/Mknh/+ZD/dkEIJheFPEuF6iRnhh
 a2iayoTUJ0snVHIL0/Xszb7TeY34ZWfAT7ZcPalPqJOZjgRjLLf3rkugZK3sVXY2R/GD
 CwPeYTKHAWWL7TBP4v7YjKvXvya/yj8kmu1yxS7FZ/Z7QKa3USWUdGNQTa6Z0gFA7V00
 k+Ng==
X-Forwarded-Encrypted: i=1;
 AFNElJ++ePA1N2Xh+k7uae67tK5KpuCXR1V/wAO5p58n8mmnWR4QLnOeq7ZORe/PHaxLSwE0qpWLO9ZnCQ==@nongnu.org
X-Gm-Message-State: AOJu0YwWrMzZUrDczcIRnwcNtbIF3eDb0fzbAZdkVbmLv06NidRNY3t8
 dXnoc7SpbhwOC3rpMmLQxUCT6XG/1riTBdnn3muSmUGFKQZwFaCYaWgQBFbmvH1CqfZxUfseWJh
 teF+l8cWCenq3wRUVK33oFyfq+GWvMk6Qrf34PBcU3A==
X-Gm-Gg: AeBDiev6vycsfQ+w6z4pIKzJ0vh45fxF1KugcI7Kt6hXfTbVXwi4lgMgd36aFbvcMWi
 60JRZB8KD54Yx7GaVVsarKWBJfo1L87Zw1LduC5M2pVYEFJO3XqqKA66Tnc6/Bj/mrliX6CssnS
 MbiODB4sD8wXdBlK6g9aZeV9r7jea2uzS1ffLrL/IJUqXZPV2vAuLfsaFSYoSFYU3Fzypa2+ZGQ
 rz5nqbLV3JOFQ9czkWn+MpXPPN8S25gZDt7QMDZDNPUft677ofZHSCAVwSLr5+bAWalt5Co8zob
 2a2tw8vFz+x20SqyAL+6uVAlLX6lcpjMtTHL8SOxt41cy2HARmvy4y79xMIjxuCxJ4cB84vvoOZ
 JSg==
X-Received: by 2002:a05:690e:b45:b0:654:c28:598 with SMTP id
 956f58d0204a3-65c18aec741mr1748735d50.9.1777547401885; Thu, 30 Apr 2026
 04:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260409035015.132370-1-richard.henderson@linaro.org>
 <CAFEAcA-mEC7feX5r=W_bvawe-sFdO=8neP8V4-hvYHFYkugeZg@mail.gmail.com>
In-Reply-To: <CAFEAcA-mEC7feX5r=W_bvawe-sFdO=8neP8V4-hvYHFYkugeZg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 12:09:49 +0100
X-Gm-Features: AVHnY4LKwsPdXgUmz_WXlFwOzC0pGFxmLJX8iv9KEVmGRnL7tUhlqZ63dX5BI9s
Message-ID: <CAFEAcA9aDCCWzQ_zKnwPa7kwOMXramGT+SSeDv4YCECKfCWG9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/arm: Remove bswap_code
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 30 Apr 2026 at 11:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 9 Apr 2026 at 04:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Based-on: 20260407222208.271838-1-pierrick.bouvier@linaro.org
> > ("[PATCH v11 00/21] target/arm: single-binary")
> >
> > Version 2 here should probably be RFC.  This time around, all
> > instruction loading, and more decode, is done by translate.
> > A new CPUARMState field is added for passing data to EXCP_SWI
> > and EXCP_NWFPE.
> >
> >
> > r~
> >
> >
> > Richard Henderson (7):
> >   linux-user/arm: Restrict regpairs_aligned
> >   target/arm: Only define aarch64_untagged_addr for aarch64
> >   target/arm: Segregate target-specific user-only fields
>
> I've applied these first 3 patches to target-arm.next, as
> they're good cleanups independent of the bswap_code parts.

...the target/arm patches don't build; I guess they clash with
some of the single-binary work that's landed since:

../../target/arm/cpu.c:2422:15: error: attempt to use a poisoned identifier
 2422 | #elif defined(TARGET_AARCH64)

../../target/arm/cpu.h:815:15: error: attempt to use a poisoned identifier
  815 | #elif defined(TARGET_AARCH64)
      |               ^

So I've dropped those, and just kept the regpairs_aligned one.

thanks
-- PMM

