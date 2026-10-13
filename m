Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C7ECC6B19
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 16:48:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGffq-0008Kp-6u; Tue, 13 Oct 2026 12:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGffo-0008KT-F2
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:48:20 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGffm-0000A4-Vc
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:48:20 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8565d77c277so22126207b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 09:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910098; cv=none;
 d=google.com; s=arc-20260327;
 b=Z5L7TP+Xk6YHL2TnBWMoZ3SJnUuuWPrBysQS9Ghh2/7tehHCI1ysKH02Pj62B0jvap
 XhONGUbOYrCoX1JM0Fb7F9u7HfG8i6Mw8P5ZsAPGY4l5V7GXB6DjP5EfK/QO/I3zMuYQ
 aUTPvFMyCBFma+iHAW31TzXqm/K9r2J0fi0ut85QiyxL6gKqlhiAz0uVkR/FE3rqm/Gd
 ANwKFMDo03Ei5gjPkvuxzwf0wOENjHW0kZ4qWfA+44ZbeHVoD1lJg1QhEjeA+4hjCHWl
 XzIFzGnxktvjDIJ61CreNCYrdq4zy/xgpPxTYJW8J9qzuCVOlVgoLmTGH/UCVvgyykgk
 RKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UbcTxUBPWUyFIA0yRh+V7xI5nZadhqOBoqHNTMUOxcI=;
 fh=tdNAYBsjNaCw0U1+8X8RTATQ2372qd/ZayWhf3Xtsd0=;
 b=PLJJ9EkPpxPOYroA2QNMAyEUnMPqxoIW1kv4gg/BarE5CIFkOkv7C11sxRtbFVlxG0
 njk8vER1oarTZJwebtN2UXivUB4YNc3+NxSyEkhP7rES6sQQKZHLEJ5S1mTy4AYVnv7O
 IsajJ4de6hHwkz5Wbkiz6cUnC0doRFEZWTgVRHF1JyWaWCQlA9FYofBKEv3FiUZIE8K5
 76gWJtn43M3myEtQ3DorW8WplOhv7AJ7OC6ee7aLRdsmVCtWwVFTs/+VgW2LDRBM19yr
 SIkh1b8UGBZEpnEMZ93Sq5Qqd1EUO4iZvgVGYcRREPsB6kFd1MUPjYJ9lqU1xups3dXx
 mpPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791910098; x=1792514898; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UbcTxUBPWUyFIA0yRh+V7xI5nZadhqOBoqHNTMUOxcI=;
 b=OCkK8X8vcZas9qBPKGPpKSctiSPfwna1Oqm+wo72Q6ItBzs6rPvECCt1wmh9d3TMwG
 nGGK5En+WBNSj6R8vxI9HgmBhqusn1Jqdr10+yjIf8ZJEqtVRb/Gl5+oM9ApFNI5K6na
 g3xJCGvZRtPclk3rUjkHJd6qy7OYx3gmeitJGbbZ7JKXjynpPBfMU4WhdtwyCsvobW7/
 FjonRjY/JNZnmQS0kC/YGa513GAV2wtz5jQj/cqj0k//RMhOdJYeqN+YMRdScOcSYOa6
 LbXP8S7HAMtRqXXMDsYCrNL7poGK6Ct4SxmQ8xCtN+UnTG92XsA6OWNUXXDIU7RQEVdF
 OAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791910098; x=1792514898;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UbcTxUBPWUyFIA0yRh+V7xI5nZadhqOBoqHNTMUOxcI=;
 b=eNSg9SRHOBgm0PUsHhT5OR8yCfHX1CMTcmUhhPJIju1nvaRdXMuiq87L4HsDMRpeyl
 ESUdr59WyVMx+1eSGNSV0qr3z/2vlMP6z1eauK+YpTeS9DQaysQabvSvbOoAcCRUjGVD
 6ERnpYKgXITO958wU8msK89QUc1yAr94XoKFiA7XEZHw+YRMNO5UGswfyrOeer6F036b
 P0tjvyQo0ePxjfKFWWV+i1yISGVAAgD9GSHUK36HNTAjS0/49A9LzLD9DnNEhDzOnTVB
 8YpPOjdagTA2KrNxLXHfdhccjqPd0KpVA0s90mB1AxNF5gcsYkHIF6w/JC3N+rDESoMS
 VJpg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxQwhsC0hx5hoKESads7IELs7FU61R/qgNULEauknWfVFWjlruS3d7X65A63Qy4Zmcg2ttHo+jMhg==@nongnu.org
X-Gm-Message-State: AFq9FYIWkO05pWMIq5mafJd82QuMfYtECkr/GXvzVKJa2a0aCoam0Eq4
 AccO3XnbeyqKYecl2AjPRbxBbCMnUZLaG61Wf4ftf6vbae9aC4rv0U/jCvcRP+at2JWYKyxpBi9
 2a2HbHJN9AAVOAgI5p+ziV8sR3fQWVH4Y+kg4I/wTca2qLkIRY1/gPlA=
X-Gm-Gg: AYBFou2u14EBVFB1zclkQmzSK6owEd7k5yEIlpGITY+HNQo1lkGHlq5CVIHaD+MMx1p
 GuJdnfBYXfvvWKeQzDI22S4EkDkf1sVw3Dl0OfeDHedlI6ljIhKcHoJiW2uQbkWQPI7t+SaTrQp
 NdEbwMS4Cu0K2nTjk8yQbrHxTenxoqYhf5+D1sdYEwIAtlT9HXLaKsgy/Qa8Izr5/zodY3Qb9yQ
 33NX8PGGrGPQT+2UVFxFzDdsvL0kS9kLMiqmx3R7e+4cQFzIYK8fBR7f8oBG+m8HzOMFatiPNrl
 GqTj6MeLWnwDZWf3D4Ter9FlHILtqic2cDTL2Cc+OMi93oe1jWQd3uuK0JRIhHWi4aM6cKmbw1o
 mALH5Z+YeQY13xhPK/qXtIO2sc2wUx9kandI8j8I=
X-Received: by 2002:a05:690c:64c9:b0:873:5c6b:a303 with SMTP id
 00721157ae682-8b07ee3497fmr39342127b3.49.1791910097705; Tue, 13 Oct 2026
 09:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-mshv_accel_arm64_supp-v6-0-aefe5e76a0e3@linux.microsoft.com>
 <20261001-mshv_accel_arm64_supp-v6-4-aefe5e76a0e3@linux.microsoft.com>
In-Reply-To: <20261001-mshv_accel_arm64_supp-v6-4-aefe5e76a0e3@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:48:04 +0100
X-Gm-Features: AclHuK807kaRaph7r4pkL63cFbItPKEV6IXn2fB43vXfeDZ3f4hY5r4pdBLYolc
Message-ID: <CAFEAcA-FfUt2AmxnAqSPkca_-WBS9WBvRgzfj9f26by2FccqDA@mail.gmail.com>
Subject: Re: [PATCH v6 04/14] meson, target/arm/mshv: Enable arm64 build & add
 initial MSHV support
To: Aastha Rawat <aastharawat@linux.microsoft.com>
Cc: qemu-devel@nongnu.org, Magnus Kulke <magnuskulke@linux.microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>,
 =?UTF-8?Q?Doru_Bl=C3=A2nzeanu?= <dblanzeanu@linux.microsoft.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Anirudh Rayabharam <anirudh@anirudhrb.com>, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Thu, 1 Oct 2026 at 11:52, Aastha Rawat
<aastharawat@linux.microsoft.com> wrote:
>
> Enable the build of the MSHV accelerator for arm64 in the Meson build
> system. Introduce initial files and stub implementations to support MSHV
> for the ARM target.
>
> Signed-off-by: Aastha Rawat <aastharawat@linux.microsoft.com>
> ---
>  accel/mshv/mshv-all.c       | 10 ++++--
>  hw/i386/mshv/clock.c        |  2 +-
>  include/system/mshv.h       |  2 +-
>  meson.build                 |  8 ++---
>  target/arm/meson.build      |  1 +
>  target/arm/mshv/meson.build |  7 ++++
>  target/arm/mshv/mshv-all.c  | 81 +++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 103 insertions(+), 8 deletions(-)
>
> diff --git a/accel/mshv/mshv-all.c b/accel/mshv/mshv-all.c
> index efe19a3914..f3f1825b0b 100644
> --- a/accel/mshv/mshv-all.c
> +++ b/accel/mshv/mshv-all.c
> @@ -142,8 +142,10 @@ static int create_partition(int mshv_fd, int *vm_fd)
>  {
>      int ret;
>      uint64_t pt_flags, host_proc_features;
> -    union hv_partition_processor_xsave_features disabled_xsave_features;
>      union hv_partition_processor_features disabled_partition_features = {0};
> +#if defined(__x86_64__)
> +    union hv_partition_processor_xsave_features disabled_xsave_features;
> +#endif

This is the common mshv file; if you are adding __x86_64__ ifdefs
to it then something is in the wrong place and needs to be moved
to an architecture-specific file/function.

thanks
-- PMM

