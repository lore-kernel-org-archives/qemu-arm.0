Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D5CCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:03:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAqTM-0000MZ-Qb; Mon, 20 Oct 2025 10:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqTK-0000Lx-IY
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:02:51 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAqTI-00068K-9y
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:02:50 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7849f01e56eso11837857b3.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760968966; x=1761573766; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6oefEeElhYPYPCx1qUppDDmR2fZgIlurlDig6wAbh7M=;
 b=x+NXrDa1TF6xQUWnPSSeBPMnOFatQexBPVsINco+01w/xqqaJW9w34+SOIgrqtKpFm
 c573Y9k8rgCRRdFf1sbDkB0THifORVvzqzOehmI2ba3s3DlE0BjfAUdMTG6svyccGGHQ
 AH4lENU4CsjXqfXtIb2ZAoSKVvBXMYieQ5pAlwHh8aC/0QsZW7yWOuRFUiWTcn2r8kp0
 0uGAiLK+xfrSkOxtAYbmz3BwPRAHQj/QMdOSPz0moZl+TxhHUAhKeUKWCkA+v13X5ZQT
 2+y/8Qym22ilmFPJum16uGKKDPmgcd4rvFBbx2bhBQ57ZYFXHqgHV4RkkLLKKpGysLrL
 ootA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760968966; x=1761573766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6oefEeElhYPYPCx1qUppDDmR2fZgIlurlDig6wAbh7M=;
 b=eegbd3rXuaCbqPv+6IYmuXuy7DzsbDOomXoHz3egrx5Bjy4idYcjhFidw2rtkgEW3n
 1/93b+qZ1F64la+bx8wL5SddiAs3gAVIhDkgu4l9XX/tCwjdmNNa4wRcTb8o2TMIYo1l
 +wOI2ghbm3T4lUg70qXuSebL+nj1RmY6FjyYVsvsT6bSZLGMSmjZm7Rbu3BWanI7nG6x
 GUQUlw++S8VMQugfvI7lOTrIIB0lOM1m0lgdtXi708EacRyByzkL/yu8PgTp0GJTEdPq
 /MsF5JPfhg7qqMey3BAOJ7/fH2D63rNhl/w02YVY1Ol3Vdb5vGjsy0EYlwXNYZbya7Qp
 XmjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJOlLfWP1/dIkQIxvgC4MQHdluJikUwe0aKBSvuUKq3hzwXF044RVvJNcNPTkrQfOOnaQi2njq7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx1A+st4A1fhASD/aBuxYoWFCetJuW3RhAkirWJ7yWf3wW79o3f
 LhQpU9mWOozmXO5yDHkOq0615u0bnN9EQQqo/uKYLXj64g9sxrw8ehUQT/XYy+r2zKFrAWc9+x3
 vsrlq92tKHJk4CMiyzBAUdnfHEkenpeWnvSBuSaC30g==
X-Gm-Gg: ASbGncvwpKgcNs0DueOc1KJ5vTuKPkOLayKibLH+fnmv7QhABb9YxRpH0mg/vdicTd3
 GR3TR7Y/0+s/GvTWPOjLurS3XkiGjsTMKUNW45lmz6RTJyo6/eDv1Cdq/vXPLp4/OCGGLRtHFtC
 b7q/D5gZTDyUTy6+l9D3gJKihUltNUr0eHs4+Vy16iXcoUg28/mNytgHRXBhApxjrF7puwVmYmE
 vjZ2sqcq80E1a2Sf0KeVWU32uwa8J3ncKRMjGXd26kbVI/gYV+UWXwqwWCYU9PrMDEzn1YMsBao
 7wsro+U=
X-Google-Smtp-Source: AGHT+IHyR71RpTTAZYNB+rqqkildeyPeFQBbf7p05glcaf1EnasO72ZD71W/Ri0nV/PyC6JQ1ZdilqoMpy4hqcQCXLs=
X-Received: by 2002:a05:690e:134f:b0:63e:4264:878b with SMTP id
 956f58d0204a3-63e42648febmr813507d50.58.1760968965760; Mon, 20 Oct 2025
 07:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-24-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:02:34 +0100
X-Gm-Features: AS18NWBYAnMgSSKYIOOzfTHtcZVH1S3l2zaPhCouSn-oVl0S9hyz1hhcGB75uxA
Message-ID: <CAFEAcA9MUijSfAZpcQGMw5DM2qoBstviAA2HF+aJb+L7-tsS6g@mail.gmail.com>
Subject: Re: [PATCH v2 23/37] target/arm: Split out flush_if_asid_change
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 14 Oct 2025 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

