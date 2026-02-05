Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE208EC1EB9
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 13:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnzk1-0000R5-Tb; Thu, 05 Feb 2026 08:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnzk0-0000Qb-KK
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 08:49:52 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnzjy-0000k0-Qo
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 08:49:52 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-794fe16d032so7826967b3.3
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 05:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770299390; cv=none;
 d=google.com; s=arc-20240605;
 b=kC5iL5JIQHmlmOB9KUWomIv+86FP/8Q0HOXBzAsQq+zYxjQnUJenlmAoDRvRYcTRx7
 NNYKvKw8koogALPptDjYS7ncyLWreSJbgPvyEysCRnaVH4swSUUuV2YHOIrV12cft6WH
 I1qqeEWUtb2Om4lcATOwrRTD2sdUQl91XgyDhsnoTWpAV4Z5kY3TrCN177aMnbFIOdOZ
 iFC/VW4eCztdtBV7Iye+VZTULtNuUiRqdh81RStHys/xvciPfHMUtJZbE4oHhCSaA5/1
 K2cUSbSNcjCHFNilhaChJFaA4sZu7JjErg6vwnCF8a6M6mdIAOL4Mh1x5CXq5cld3rK4
 jOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VUJV7lO2Etxa8EI6mOIX+Zm3FnjXLmbHxih+VeV14YU=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=GKQeebCjgPbQHFkfaMR/0AbEY73L6FD0NTmQR1oHsOl7rprbZoSHXKiVFhXHBppCO3
 WhMmk6xNDjWHRxzRPa5O/tJsLlQnvhp8nFfLXcs+dYuUCwZns9SZwS9+XDb4zlkDWkYr
 bJzHm8z/KsB28HiEOoM7Fq4Ldd8okx9pSF2nNOFAMP1XbOMzcw38NZ+3E54W0KtMwpHT
 Pw5UteRuO2yA9GL1/D/2mm1oKLemg7BqOH6WxbtVRIPgRK1Syid5rH/E6ZniKDXyZuZR
 PT8a7xp4hJaa3WkylyJk20poeAzlPPJW7eeV1smLb3XkOTNzT5DLD+sg/v6mLpBNPRNQ
 W9Eg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770299390; x=1770904190; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUJV7lO2Etxa8EI6mOIX+Zm3FnjXLmbHxih+VeV14YU=;
 b=Usgnuw40Luv1ynAcwXAyActLl7WGTmRzyk7pU6xRjR7S3lFfJ0HSrR2Lg8z/HtzamA
 doVaB9eITev+op/FVR6W9KIiWdI3n+6jt43xmXnWPYALh+UEJ4OkWrWl2BC8RUJuyj3k
 5JOcd9WVp0mIpguz2CvwULr2hMQthI6+q1nQaS6DnWD0HLn9jQ4i52nVWH7+OE9d9q+4
 v6owNhAOnAci9wgZSJ8siBWKXJPSm4Vi5pErQS49YdVAIl0fctyvgM8hIc2Vu24Jb0Mp
 OXJY8W9yI87uRgnctICRjQ5rbGck1l91+/X7cnTlJRp5tbvv9xEKYBYQLYC68xG2kHKZ
 GJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770299390; x=1770904190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VUJV7lO2Etxa8EI6mOIX+Zm3FnjXLmbHxih+VeV14YU=;
 b=lGbYNwqaWQgXOAuqArf6uiUy7WdFuhosJcOuACcdblOrK+UNuUCZmuaLFYVegv5mvg
 ngN7VNU3hLn9X98DQpHQwc5AeuZVx1iyPB8GVuRdJwlSxGJu0fVKUJTdCNKaXgzYZ6Pk
 MYbl1Imm3D/hUOhSW9tZ9CMQoV/6rt0anCu0+yo3A5dzKUZi7MQe1WVVxyk1PHnAl92B
 SLdoz27ZqrP5g0s4STnoQKNtX25dVroLXDeyzeWoC1j4ALpd6i0/KLXZrRD6edv8DgtZ
 x0fFvROzkfk/HkGGuX05WCJx4Qnpz9kDMPMw4n3+/Z2wqyGlsMDSKKcYyIknCBqiulv7
 7rpA==
X-Gm-Message-State: AOJu0YzGXc5HAg4P1kLOO+n5gENnwAwDXeIFNtapSa+i9tu7uZenU4mj
 rPYmMZ/gRXblWraDGIMl83t1CxTYK9i4QYgz2KMgvHtXyhkn7MJc+1KtyE961CcsE83/saUcs7b
 6RnuipHm85jx8YhvawBdHIQD6GxHavOZTCXd/kV8wyixIrTwfcAH8
X-Gm-Gg: AZuq6aKsKGkBnhcIo+1A6mLj6fw0NZDgzaZmWDVFD5scnKFefCXV9GeGt3gHpo7xjRm
 U9DYbuuGIvcomS3gqiS3KS/8PszgM2RN9KRk9siJKI3IW2CAE+xdbS4HOONFcSwg1gydSUO8+k2
 U9Ww5TNT9/xZQPIrCkd5rG7FkWeUNgDR8Ul5NaRqB11Q2BUJmxuLUWXLygGbdVwErmuE8kx7EZs
 ei4uPp/Ey53szR5W82rz2d0AQf5Ac1dKHKMCFkscYCP34WHecIqi6AJSNEOFNBCL5pnjg==
X-Received: by 2002:a05:690c:9692:b0:794:b8c0:5a96 with SMTP id
 00721157ae682-794fe8b469cmr57914957b3.56.1770299389623; Thu, 05 Feb 2026
 05:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20260204103136.1795455-1-clg@redhat.com>
In-Reply-To: <20260204103136.1795455-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 13:49:37 +0000
X-Gm-Features: AZwV_Qghem5n2npTxlGOn-5VoMGTEnUpF91GxHZNzmgCxur4QQNh3CfnWRVtpMw
Message-ID: <CAFEAcA_w02hxyiCtOzWc9mmFR=6pLixObnSnenhBdJ4zixjfrA@mail.gmail.com>
Subject: Re: [PULL 00/45] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Wed, 4 Feb 2026 at 10:31, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit 28a6ca268c2cd3718b5bf24c2d97e3d1e95fc6=
04:
>
>   Merge tag 'single-binary-20260203' of https://github.com/philmd/qemu in=
to staging (2026-02-04 01:57:26 +1000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20260204
>
> for you to fetch changes up to e56e45d5bdc808ed52f943d1a785e4d885b6f18f:
>
>   tests/functional/aarch64: Add I2C test for AST1700 IO expanders (2026-0=
2-04 10:10:57 +0100)

I noticed this a bit late, but:

> ----------------------------------------------------------------
> C=C3=A9dric Le Goater (3):
>       Merge tag 'pull-vbootrom-20260116-v3' into aspeed-next

could you not include merge commits in your pull requests, please?
We don't generally do that (the last one I think where we had it
was back in 2023), and it will definitely cause you problems if
I ever bounce a pullreq back to you with "please rebase"...

thanks
-- PMM

