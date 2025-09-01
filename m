Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24EACA0FFF
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 16:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut7Kt-0003Yh-Bf; Mon, 01 Sep 2025 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7Kq-0003Vt-4W
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 12:24:50 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7Kn-0006zV-PN
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 12:24:47 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e970acf352fso3798293276.2
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756743883; x=1757348683; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZiO3bgGR3inXbuuVf3DZOKCf6oPacdTtsD5CIWBAUh8=;
 b=yaYfcikHit0Y6pdl1Tbp3dRYk8DHRCTK/FBHlss8jJtI4Qse6HmoNr+K94jwksTdGq
 IAQbGKHpa0PIXWJfS1nFo9yL85gXyZSPv41fVy5Xd1QbiK36CLp7FzjsLSjXOyrCRofj
 kEA3QDn7UO+FsBljIrXTGPsRVNwF9NEO8e+G509ll+8rzcMb/3wHjiKrHYK7rReMDmvy
 1SbJpJbEvmSoNJu6P/WWPujnoo9LYQrO1Fh5f/8EhHcopZZSQwmSVLtsCAi8H8o8H77a
 BZ1uDpgvtHdzfXH1Hy6NskGFKeZCKpITT5EdNTPEpOUTllvXWP5kupLyTZYx+GUfdTD7
 wmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756743883; x=1757348683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZiO3bgGR3inXbuuVf3DZOKCf6oPacdTtsD5CIWBAUh8=;
 b=ZHPnBGUGJbBLHuyyb0zLWG45y4Oxe8G6OVTem7+iTPrz6MmfZGXeYiNiX8EyHqQCyA
 El0l+Yc+hNDRsrOXInvpxoZhdnqct+YrP7xZQ5dBuVUIFn1DqxX3bslRR/rblqOkJ0MP
 nmLZa2oUk6qqSHIF1/s1AAT4isHPtKB/MpcQJt+D5AnE3Zyji2WCeq+xqk9vEmRo4O+3
 2xusN6HlLbHoq2fyfAW83/TKhzqLQWliswpLktBa9Yr87aSzo84ZDrl1DwXdxg9JoV1w
 4gzaOCr/xS+l+fIPW0HnDZBbmzbbL2ublK4Yc1fHhY03Wz2XEciMGCyuIrVfbyFm85A6
 LT8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDkH6k7+zVOSVQYhQyGyAKP6v3tWQMaGRCn1ZurYtHqZU2y8eU491Pp7qbp+smK+21u3rQRQFhdw==@nongnu.org
X-Gm-Message-State: AOJu0YxALpvctdgzkGaFwo6U5qhNBx43sT9i/7lw/DFTA+BQT/hxGIJY
 h7D9b+Mt7MXGB55ZDPSspamG7Snc0E+i9mQOabu9cce/hIs65UwcVd0QShG/8Rw9/GsLWeJdzMV
 2i6/WHe2CxhpBeOYvwy2nwA0w4Gki+ONPGPxw8la+RA==
X-Gm-Gg: ASbGncu48YA49SgJUDBP1o3x9E0ccxSY6A/mmvQVLnawYcJnKxEixIaHavp4xntJt6u
 SY2C3CA4bfmyp/R/EEqwcfj/MSB6zNllJnNtqTYASng1NnDaryJc8Y+GQOXytGgA0C4vHvE935O
 VE09cvqQKglBDW0xnh3/Leq6P3/JABucj/XwmFh/aV1k11vLhBqYo3xsJ7FOfg25epL0asRRql/
 9vHA3qg
X-Google-Smtp-Source: AGHT+IGrlwuSzh5xqBTHQq3gYvKeoiVbuDREEyVeRqxuJmxIetmA1yvFdxzghWa8JKIu/8706cQkKsSfzTsWxuVlbDc=
X-Received: by 2002:a05:690c:6c85:b0:720:378:bee0 with SMTP id
 00721157ae682-72276333625mr96283437b3.11.1756743880700; Mon, 01 Sep 2025
 09:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250823150321.135527-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250823150321.135527-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Sep 2025 17:24:28 +0100
X-Gm-Features: Ac12FXzANCKs638TJhCJYAYTs4DygvlAzhCszA2C8iKjkMVFwy6aXuJs7GPa0NU
Message-ID: <CAFEAcA-GpC3ouaXTQ18VhcY7c-jXK_SF0MLiCMFW471U5Cqr9Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: replace fprintf with error_report
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Sat, 23 Aug 2025 at 16:03, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> Replace direct fprintf(stderr, =E2=80=A6) with QEMU's error_report() API,
> which ensures consistent formatting and integrates with QEMU's
> logging infrastructure.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  hw/arm/boot.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

