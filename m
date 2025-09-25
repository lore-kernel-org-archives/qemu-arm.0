Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FEECAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:45:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1mHK-0002Jw-Hu; Thu, 25 Sep 2025 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mHD-0002Io-5N
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:44:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1mH4-00082B-0d
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:44:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso2067067a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758807872; x=1759412672; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XEf7IIxIapDisSjejziNXR0vCW3+6EPHrcLxiF8BVZc=;
 b=nLCJenGvh8F1Mg5RXAYzcdZbSmcRl06GyhQHzWlm0kFOuj2UqYaheX0Vc4BAuR+gYg
 alwzy0kpubGtu1TSh/QLQGWwU/LcWJp71mZWhOeDw19q7YiFgOm9YaGKKbg6XoapzXwt
 G/Pjt2JjIKig/K3WeqC6LTdusnR4SL57ijCld6TIEpE38uvsGoulDRNj5oLBhNnt1V5/
 Fq09I6RuckgCvHrCeOGLEI+X5oaexfhMXO0VJR3sCwvoH37KsPfJZTxdn8yEdCbzlC3n
 tNmPQcOCMvWoeWr3sKVau9kF5BuVwTWwk9S9IjbeP4lf6uRNmaMUHPojL2F7HfWuTjOJ
 mHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758807872; x=1759412672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XEf7IIxIapDisSjejziNXR0vCW3+6EPHrcLxiF8BVZc=;
 b=BR0pdGv0R5hjNJv0Lp3P9GMBjiWEmuuDxOxa9pYiZtB1RPTcjufKIA+u/2DYoOvmaT
 937EI5aitVjA+XoK2ni5p60AyqzObA8AdyS3FI7J/hANGKuM4DdtlTN6we6z0OMMlj3K
 98mCWid28Sg4nRpi4lAvdqWmsgpzSaFIHZgUIEZZY8z/VcFdIW3/BLnIngHwnos2Tb9u
 c9aFji/0/A/oFAl3iNDxAU1G+XHQLpqI35oi6CHY+u+aP7EqjIlhzfB8SJ/qM6g8/rYL
 L7XM0SjgfNkCHvV3sOtjTO4JBHFHB0QNxdpv1UBBG4pgqPImLPnIoHyEuxz5rL2UTQjT
 CPqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC8NljLDRx6TPljgdiYDuYcQKa/oV+uckgP624VoEi7ApuyR+TIkWXAMxDzkwF25u1klyDUlMMRQ==@nongnu.org
X-Gm-Message-State: AOJu0YxteZD8QL5Ktiz35wFaz1rapG6kPaEfQ4DfqevCw8/Df2qzngQX
 tNaEv5Kp6C4B8vvd3aCJxYedfQKwwXlmFXgaNDEZ8VfLV1m/gwEs0w8lUtZ59HeoyCQwLGxVebS
 CW+t8G04VWcR73k8ofgMUfAHlzKlN/wjvxZuF6KQcSA==
X-Gm-Gg: ASbGncu/dDorLTDDRxpFTMfruGS+i4/YdR29j/sG2bsFa2a2cX77lMkLaIpXejQbf1s
 vlH5+2B7U2+/Q2AE0FSMtraCNdS8ftZEPCyuohU/z+p61lNV32XF1ncSHuG6bR3aJkhnOEuT993
 wD+hIADloNz9kqF2ARrjDg6irq2eKqrs0Qb6TKik0mmrXPCnETlSrMP5hdkkUMxYmaJt8JddxBo
 UR8fVqJ
X-Google-Smtp-Source: AGHT+IEPlREHAglVGm+UR8760EGdaub15l8BbFZ7G/qddQeU4ygyB8pYVJII3EwHDvYOn/9i2mbkO1sGwD5rzEbgFcs=
X-Received: by 2002:a05:6402:1659:b0:62f:1e7a:f842 with SMTP id
 4fb4d7f45d1cf-6349fa91f2bmr2541411a12.27.1758807871986; Thu, 25 Sep 2025
 06:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-24-richard.henderson@linaro.org>
In-Reply-To: <20250916142238.664316-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 14:44:19 +0100
X-Gm-Features: AS18NWCS2lDAS0b3vGjlAjM-lBhSDWnAxOGHieYHftyIMqo_lyCGRKKAj7uF66U
Message-ID: <CAFEAcA87gjN8DsnqOFP_1avwGuLqC6hb2hmfacpvhDr6AZq+VA@mail.gmail.com>
Subject: Re: [PATCH v2 23/36] target/arm: Move cpreg elimination to
 define_one_arm_cp_reg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 16 Sept 2025 at 15:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Eliminate unused registers earlier, so that by the time we
> arrive in add_cpreg_to_hashtable we never skip.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 123 +++++++++++++++++++++++---------------------
>  1 file changed, 64 insertions(+), 59 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

