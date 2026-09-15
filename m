Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13DAC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:23:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6T81-00063m-ER; Tue, 15 Sep 2026 09:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T7t-00062c-Vm
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:23:10 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T7q-0001O0-VW
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:23:08 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab201ebso2773823d50.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478585; cv=none;
 d=google.com; s=arc-20260327;
 b=Lt3Ua8aK3kyT6yLAoNLnlP+lzYOvbN5QgFovpabJqslTz1pG7xqr1UWUAdV2bWcvvR
 j6vFybsRYE7fNsoRbDx40+kiLB+qNcRDlkmV9GCitYt4RSLR3txI0sUNcsDkHNLrFT4C
 fq/6kqgd2uJSfMw+3KTcc6o4zAfR8r/FrYr4apQ9M9Q7po1p0piDaR0qeYf/zwr8RCJh
 o25431DIrQPS3U035XKb+b208dCuIvAs2qtGA1aPDW7G8PDjtBhssY5DC0aMWWndPLwW
 zuZL6hB1AJazGH6vFSrLo2JbUQtQ3i71otEPqRidvZa9+m6SCO/976eBGfoQgzzITO5p
 CKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Zm7hFCcvMRATtxpOOptn5yuEGAzWjEqC9Z/T3zc2rn4=;
 fh=TmsraWSq16WSX73t2yOB61bCyhEF3Lk2YZ+L97nDdWQ=;
 b=cxiX82bKLbFkrKs38ej33UuVkIA3pQtlwj9xC+bO8t3GDRNg5vPfNilyul9JVZvJ9K
 E6iNZL/cmwdDk2Ox+QflPMs+TaKTvzW3vFQQXENa4tSgpx5shjF1UGllywDovdRvrCJR
 kW9gFe/tA678IHJ2D+p38hnzVlutqFN+2W7QGPs3p2gnPMOL3mc2oheHk1ee/SaNv1mk
 tUqzJRgdh7j9KnC1YylvKP0rwf63k956GQQMHl7M3pUbtiHFyRPVvOz04OYhkwefLMn1
 LPtqu1FycGoEiqno4kftR6s4UVOYhul9jYU3Fszn637vNKHxE3j6DqbOLlAgYbIwwSUt
 lsUQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789478585; x=1790083385; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Zm7hFCcvMRATtxpOOptn5yuEGAzWjEqC9Z/T3zc2rn4=;
 b=GYFfmXGP3oHsVvyDzlSpQdlcSWMpAR8qsSmHGUafxWyB9RfDdesh0FUbR15uMQkqeT
 Ey0Z4CYteSNy5eMJjyDnvOSQEFkrN7MIJte7Mxd/aYkxuKPgilW2eXdHvl//XXKMOS9l
 HGL90wZowWrFiLW7st2b3Gu/vq98Natw8uo3mBQxkAavm97bR33Px6fsyEIbEg8OKgcv
 mC8mxOBUlWF54QNcQGZq/PwxhHoTFs8c8L/h+HyU17T/vHJpPpJdJzqYM1wBlPeSYXC6
 26mONPMymZZhXN0izLXDw0WtL3midO1M5uQntCQtB9tjlJtMzToIUFPWebXFIXovcyI2
 JbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789478585; x=1790083385;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Zm7hFCcvMRATtxpOOptn5yuEGAzWjEqC9Z/T3zc2rn4=;
 b=ROlUnc/7wK/YDKr+kg2KAT9CfrsK8XQ6Bak4rCbxruA4+bWj4QwhCVUFt7361hyAhz
 hqvfxji+7mBemuudouMWeI7E36pEpbDLhtSyDex0Wi2HhPm1cLrHR6qiEZ4eMYw/T7Ge
 GEEq2u0zcFOyySYTAuKB8LjdGpGYxd54rjq3Si51q0mOpVS7mc5puxUnjxVeauCuI9Rf
 KxeFfHamTJqvgffXbUBtAdqazbx9GkEprWsf9DzZzV79Iy+/FPan0WxpUOacKtdr/3hr
 75LVMaDN115SxR2cBZ2pbasYEEYExZg99YNKXA3JtJ+kaiPA9uqIsvHIZzqY0TKYRRYp
 S3Ug==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbiuW4Gp3oSpTOt8djHv9UVhr2h1xBCaAbzQ51c4EF1FsyZf+d8sd/U+jGiKZFl5eAhqr7umpJew==@nongnu.org
X-Gm-Message-State: AFuF++kugFC7HIYVYE+bCeUc7PgGjolbnC81yCvKdxg/C9TMfwBRR0/g
 k7442xNkxwqdoQ/Ecm5U0jYa0IiXpn+WXBs+fRLNEXqbVuM8KxltQ8YDlFvptsn6/j9qfSHOd76
 hlFX6UsxeK32VvjOZQ106JA14iKmSa2bH51329ZB0zA==
X-Gm-Gg: AYBFou3wfYcXLSZjXKyTWiOjlZtRNp9XQb7InfgLqRM172IK5gS2n6WZ0eLNmXX45Vk
 iV4eaSd3JWMJO6JGBpUHdEZqY8SbOjbrgzNobnOsYFPtNPO0GLy9bZOl9DN7xv+XsEHHZujdIY3
 9lwgy6O7ahcFGk6UhzgzeKfj2hidPHf7PxlI8ZLYHFT7fnI+yDhEc6aXRestHgpY1hksmvSqOHx
 OtjlI9TlsLxCh89/UC/h8EqTwnmLIcTM2aRKgBmr5haKRNmtv/oIN/mj3acnotsAJjaaXGTRpAW
 PaunGOePDfR3srVPQvMeBDu73VvY1bVktt3f7u/OPN86XeLkY7nEm+Ptja17jOsj8kNgxElLeMS
 ZwUWxMSVEJyqS81/Lm7Vy2vvnqWY5IuEc2QRereY=
X-Received: by 2002:a05:690e:12c8:b0:66d:132a:875f with SMTP id
 956f58d0204a3-6714e088222mr2226628d50.47.1789478585351; Tue, 15 Sep 2026
 06:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-6-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-6-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:22:53 +0100
X-Gm-Features: AcwNN1URoW9lEtypQTmGSNjzOHiUmk1QghvUUKmXc6uqBj5pFThsbuNjPmj2HRI
Message-ID: <CAFEAcA--HZowfkeqscvKiWEWbP8g4EvT1=4OHswG=9EZWvXaSg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/6] target/arm: fix MPU SIZE min for v6-M/v7-M/v7-R
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, 14 Sept 2026 at 20:28, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> The PMSAv7 walk accepted any non-zero region size field, but Armv6-M
> requires a minimum of 7 (256 B), Armv7-M requires 4 (32 B) and v7-R
> retains its current minimum of 1 (4 B). Introduce rsize_min based on
> ARM_FEATURE_M and ARM_FEATURE_V7 and reject smaller values. The PMSAv8
> path is handled earlier and remains unchanged.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

