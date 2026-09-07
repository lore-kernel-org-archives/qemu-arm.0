Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F99C79FA0
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cK4-0005q1-Hl; Mon, 07 Sep 2026 12:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3cK2-0005pH-5w
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:35:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3cK0-0001uV-D1
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:35:53 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-86e7f44b773so39104977b3.2
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788798950; cv=none;
 d=google.com; s=arc-20260327;
 b=EbL1Sb4y1DEh3xrNN1RW/M3txjb06tdTH9XWcs7K1G7Wt+CZj9Jq3T0sKI+cqQxrTo
 NHQx/utdyH2aocPiOpXZuSI0aC6E/wAK1GaQdosmQk1a6X1vcAivC/AaQ6M0P4Cg8f01
 /0yxHrGOdDXN0iRX+vrAmHV6dRP49jAPtBCQih7DVxg/xpFLmemhdIkL0/qN59N42gjM
 9vnyjANMx7O48DZjKMp09ksNu37z90YnjNd2KqbsCGBklIu3/BhN0OZWh/Yc5olW+ZG8
 QhKaMYLW4niCOxZ9Xio0gE12euUi7HBFXr8iUN+eyM/meibLMlgEXzdaCZSbCPce7Yem
 ddoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wC8QCYmlScKzE/lvXIMEr9pFWPr8peXpZhK+kycZLog=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=R2RCzuZECzMNCnGLg7uNznseGJENFm+TZibcjLoNvBRhdWQPdE6JIuqQ9J1tEo6Tgz
 RZzaH0elXe7bisup0b9xWeWQ8FruAUZqTwYC/rYluJowebTQxu03q0foGiuezoNcc8HZ
 cQu8jGuxpkFyjvqxWafkjF9iWsQNQaVlHYMzHDKL7TsBLvmKDLDDlY3ddfEyWgGHM1Pv
 prWYASegtVTYjmq8eKUEI5HzPspBC2uSvDq9pF0ElTMWpIMO+60FGvHfZHCXIBPzqCsP
 kp6+B50hJU3dy7a30NaeBGEP8EkS/yDU31YnER3Oft29nXY9erN5Yc94NmkuPefgvziX
 8iVQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788798950; x=1789403750; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wC8QCYmlScKzE/lvXIMEr9pFWPr8peXpZhK+kycZLog=;
 b=o7YC4dbaqafOHXz3Y9uxs/37z+zWe83F4ruEON2gjZ1PXtAbO9sRnQoASNGVYmQDjj
 45++hYOQsEbG8EF4iuf0ztIJKYY11OZUY5X3kCdTFscTs4oggRWYipf/e+UbjUPpjZhL
 5n/W7pRhFydmSWFwtUKqzieDeBdqzAMWErQJEgOAHztKsofBMstEk+VhFJijFJyUrflD
 of+LLHdctkJ4ax8hME1ugOBTGHQP3K4x4X0F0BSEP8qcLzGePgC7qmfujhK7fvX2OQbm
 w3N0o4LTZamkCBRFTPHB0tYmqc6D08DYjtPjJY2/AxIpIMAMl19hU33bqxf2MScMzRz9
 r/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788798950; x=1789403750;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wC8QCYmlScKzE/lvXIMEr9pFWPr8peXpZhK+kycZLog=;
 b=WJcvtF8qmXc9pYr0trhW3/p8+0UWE+IqoG8hmRYHk5C6tyt0/bVLb4NpkyQNwyDg6A
 XCha9TM+W+QWkbj6JpEQVu6ilgMk8ANvJOj4DE531NbO3nlNTIS8Gzw2H/0nmJcKaimF
 af6fYq0MFq4B7g6stbd5WD4B36X0V/bs/9p7BtI2kdQO2mwawmEM2Pa2yM6EKd9q3nve
 tJaNwjz3WmvOwxDSwxDEvzkJdLzG3KZoRTCmFsqwrNwpc6tIN9kW58wew+BGsOgJQLAc
 t1s+kip0/J+7uQyG3sH0+RUXcC+byMrzx3/c9bQ8q+zNOS2LyZoWdGC9ebI1Af5JxMg8
 Q6Yw==
X-Gm-Message-State: AFuF++lqjg+SatgpkTpDlLUHQOOiCLAZ2FgSUarhB9eyFuJDUYwHipvi
 ILuslMSrW+4LWxTRngAt491KSpe/kzvDSSd+k4bdY4R46T28KLFB+J6dnoh5evLkr4vOyiiHtZn
 IPaij6msl9Wtx0DslvTv5uFBEJ0/guVQJT3pxznkZeA==
X-Gm-Gg: AYBFou0TCkNmRyz8NQSWXocfkXr0go5JOkmwn5QsMZdBPseUFX3v56/8bXs3OLLee81
 ZR7k/vsXvClOG+yBD1BVWH6FNq5sTVBEn7eHihXhBFhh2N86lOVoWorn+uFRK0HdF9h4Tkp85/h
 1pJUE3YzFEdmf3XewvQVFsCjsUOxfYA8U8n7B0KlCJO9hZa8spPuqT20aInrTvk1lwgYBHX+yZi
 MyiGmPF/Iy9bUqSlpY1iGKdIJ2NEQwXqHUZpxcs9OJ8XXE2Mnr2DISD9khH67es4fjdij7RqgYp
 MxjYfER7nPevITXZdiEQyBkd+0S4IYq1mitBk4t2S0YjGQVN/WAmHeWrTIXdcTncca6R+UB2cjM
 pgzFqVBndpkjBy7a+QYxVYpxLrY6M
X-Received: by 2002:a05:690c:c511:b0:87c:62fb:9833 with SMTP id
 00721157ae682-87c62fb9b14mr8081127b3.6.1788798950237; Mon, 07 Sep 2026
 09:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260906171021.26568-1-clg@redhat.com>
In-Reply-To: <20260906171021.26568-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2026 17:35:36 +0100
X-Gm-Features: AcwNN1VMeTsjD3qRwLqlV0MnI72cqenBua2nTH49VMy45Mrc_2svJpIN0yF_ZVc
Message-ID: <CAFEAcA9DVfiBUTqvwG8DzWyBcDxF87q9vkJ4aANRe=OaYjBAcg@mail.gmail.com>
Subject: Re: [PULL 00/40] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, 6 Sept 2026 at 18:10, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit ff1d2d19d7e24893e2012d879f8e73077e17b9=
bd:
>
>   Merge tag 'pull-11.1-check-tcg-meson-040926-2' of https://gitlab.com/st=
squad/qemu into staging (2026-09-04 16:52:58 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20260906
>
> for you to fetch changes up to 1c05d7e94da04129ea16147074fe73158fb85ff9:
>
>   tests/functional: aspeed: optionally check the device tree model on boo=
t (2026-09-05 07:05:11 +0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Fixes AST2600 SCU protection key registers on reset
> * Fixes I2C byte latching for SMBus block reads
> * Hardens EHCI get_dwords()/put_dwords() with DMA error checking
> * Adds a second random number generator to the AST2600 SCU
> * Adds the ASPEED ACRY RSA accelerator model with ModExp qtest coverage
> * Adds ECDSA sign/verify support to the QEMU crypto akcipher layer
>   (gcrypt, nettle backends) with tests
> * Adds ECDSA verify command to the ASPEED SBC model with qtest  coverage
> * Adds the ASPEED UDC (USB Device Controller) with gadget device
>   and programmable endpoint DMA, wired on the AST2600
> * Reworks the TMP105 temperature sensor: Resettable reset, fault
>   queue enforcement, TMP75/TMP175/LM75B variants, and qtest coverage
> * Adds the Facebook SanMiguel BMC machine with EEPROM data
> * Uses real TMP75/LM75B models on the Catalina and Fuji boards
> * Adds optional device tree model checking to functional boot tests
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.2
for any user-visible changes.

-- PMM

