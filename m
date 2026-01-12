Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C88C9EC94
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJ85-00005i-Oj; Mon, 12 Jan 2026 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfJ7o-0008Ua-Jt
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:42:35 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfJ7l-0007t4-Tx
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:42:31 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6446d7a8eadso5732275d50.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768228948; x=1768833748; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buNAGQBfalbAJmlCHEuVbuvIMsReOMXWM8BJbuivDJc=;
 b=qOimXgvAW8qI/zxhusA8saXcmYfOPGdEanV1ZPP5KGYWAuQSmGmeiC/Oin8RXCLC7a
 Lp0pkv/kDXv2pWfg/jutsJub3Zh/7mVdNztuVlmgltUF1sg0owQg+gyzvh4VVdzY86cE
 JknM5lPtaBZUAYtJfnHsbOv7YoFEu+RygkmW63KYySA2Ar3W6A3XGH71wE7YZW8I/KN4
 7gFv3kjJgxNiSg4waVgVDWpr9VcIQLaG+9PvYwiB45byJCZrTVOhA0GMEaAKxZxbsSej
 QeNy946XdWuHQ6w+2URxLz+pHOdBBGstCLeDCJ0KvMOI+GzDIuN2S03nQTt9aSXf4uTJ
 Mflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768228948; x=1768833748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=buNAGQBfalbAJmlCHEuVbuvIMsReOMXWM8BJbuivDJc=;
 b=sAqrGWN7XTRdNo2fj24gLxlSxcq0tSgDNndXPQGM00Ln/2ED9hYuZ9GXEkI9CH0OOv
 FjuWTbZIjgfs4ATpbPDI7KeaY4yBBeixTo9RBKw53fyQUcWJIrQGrcYC2X8UchaeoJdd
 PM4ECpNwNnJ8KMr2RctmLtOfjmziU/FOBhTwZpVlM6f0dmQF78vWw+eyvIqMa6ZtgtB0
 PlCVL9ZEQrQECcrGqRsYmU0Z0n4GnXZ4EXTKdIYQt9OXj8nGFxkJReTzJXLaXodUNBOv
 gg12f3jSKRpYg5rAx3NKWLEWjTmvX2pI4eUE2ZV7MRUoP5z6i8OvDhPZvxiLrIj2dEkp
 CBIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYQauJZxQrsrZfLIq0wWMVLbsgDUIOud4UdCzjZSo9Z5YSO4Gn0PyXwFao/v1RpwR07xF87YG6RQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx3lkUCgPd78GB2KyAG3ROBUStbfSUVSeRYjXBiBI6Bt87yWOI/
 Tr63Mf1iYvkhoFresllQkhu07KRhimRHO+uSRO4rrW/A56b+OK1mcOIQTJJoRE4a7+ubgpRCiBm
 Hbgi8gvANkeh+JDH5e9yK26zkkaZUCvMi/G2co+tlIg==
X-Gm-Gg: AY/fxX7MWDTwWBLEHAhb+Pg6zBf5f6AN/UZWAVUzexRHAx5ICFtU5YRLDx90CnIIDhE
 C7aa6JInUVvCSKgBlupXQGBH+MCqdSewnlzqyRVV/wi6y92lFku+hoT3rYIKlfUXVbg6KLINDWc
 oaEzavSRTbLnCg/BKhSAgPkQHIgajxkJpUotyfOSoM9qSFEK1O/U0Uvf1vCFD2Unw3BB+blFD9A
 i2sgiChnwn/+0kLPMV+GTSn54GGD8k1Ab/I5UbrOmXIpzKgwdE3L35+K+f3XA8tlGMgtJkLRlaQ
 lqHr7laQ0D8tYa8SPRZCBhs=
X-Google-Smtp-Source: AGHT+IEM/F4U5UwuVj1leGNwdru4kViCn08eNM8SNVJiz1vZnSlviFWQND2aWv9k+Weo3aP2PD4aUmrO5K3wy17UrjI=
X-Received: by 2002:a05:690e:d8d:b0:643:79b:fb1b with SMTP id
 956f58d0204a3-64716b71fc2mr14212491d50.21.1768228948539; Mon, 12 Jan 2026
 06:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20251218214306.63667-1-philmd@linaro.org>
In-Reply-To: <20251218214306.63667-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jan 2026 14:42:16 +0000
X-Gm-Features: AZwV_QjOg70A_0pri56CpDZGx9brPDIUKsu3IHkSe4waXjTSNHPzwdGnkxhs3ag
Message-ID: <CAFEAcA-vKfpDQJws5m7C1H_N2taPmGXE=gH8hRFxHH7L3u+w=w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Re-enable the MAX78000FTHR machine in
 qemu-system-arm/aarch64
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Jackson Donaldson <jcksn@duck.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 18 Dec 2025 at 21:43, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Unfortunately while rebasing the series registering the
> ARM/Aarch64 machine interfaces and getting it merged as
> commit 38c5ab40031 ("hw/arm: Filter machine types for
> qemu-system-arm/aarch64 binaries") we missed the recent
> addition of the MAX78000FTHR machine in commit 51eb283dd0e.
> Correct that.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3248
> Fixes: 38c5ab40031 ("hw/arm: Filter machine types for single binary")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/max78000fthr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to target-arm.next, thanks.

Should we cc stable? (My feeling is 'yes'.)

-- PMM

