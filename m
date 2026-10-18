Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E790BCCF2C9
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 10:56:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIOYv-0008Sg-Kv; Sun, 18 Oct 2026 06:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOYt-0008SA-VB
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:56:19 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOYs-00039v-B7
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:56:19 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0a921ee46so8732457b3.2
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 03:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320977; cv=none;
 d=google.com; s=arc-20260327;
 b=i18CPP/vMLyUBQ24ZpfoozBZFLqieGL12WXbyvq3uP3MDY6YOY5VMmc8n8MRsStDpN
 TBaZ8TwoG4bsXtnkZaunODOzMqawlta3jziGL+mnHaKWOohmpb2IR9Xt2xrxOQbRuv55
 54ok4FqJaeqzU54OKFcfmhblmuV5lFjzYShxroimqIpZNYWZ/av/nFNeI9JrjFIxa9cR
 D4e4JwYk47VeG7dIROvdsJL2EI8zheSpducYPu+ODlckBSYT5PmqmNYLJz2jfHEK2K2C
 NHO8ehCObetR6rZvv92euyZGty47zEb1TbwSIa7WI5AM7jC9l/hOZPu6V0QFY35spmvs
 XxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QANdJ9Wx0Qdp3s9+/Wbyon45Q4YDAQdyvgVAf7Indvg=;
 fh=hceWwyfV/fYU0cZYiDjzTnUznnCHvpfEQlo1IRIuDm8=;
 b=op91+4PqyOh1fE5LFzIriAVxb0GzLqEjNnrmIUfNDqh0LH4N2D5X7SVNSSHMonkqa1
 4KAlzuDun1vlt7+7SbPrly3T+Qx/WOQ8O2/LYfi5YdyksPXty9S4fhQSdexY/1Os0SG7
 24V89Bp4qBkZk3UHt2+Q5WrdQgbRpBD5dGW8BKuyRDzJ8sLfw5EW1i3pC/+T7AcpneTV
 TRgS+c2ZCq2q7QRMR3XcE2/0/tsv2esH/6qviHZ4Lw8jCNKPKliC2HREXFpUXDeoE1hn
 OLV/9ulYvNEpg5f61QXorq8GCMCjNmxybiZdGxZMvw+p4DqOhgsN1VmKXzkeRoJyNuWN
 pTDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792320977; x=1792925777; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QANdJ9Wx0Qdp3s9+/Wbyon45Q4YDAQdyvgVAf7Indvg=;
 b=c30eaEoRYRBet5jMKR/8V80+jCLVbuMKTB2F8u1Gy9RDehXLn0km/3bQsr5X2Gr4jA
 XeMY7ybQGDJZ3mKLFXd7PbLYMhNUgrc7DNoLzxDA/cbEzjT5A39JZq2dbBlmek0r6jpb
 MT7IkRAxBoeL4GakKOg2IXkgxAcHkGbJEDIex8CJyWssJYTk3kZTSZRMwDtvRupG8Lsn
 6t8KH7DxkN7gu50ND0yhpbOjSWPW8GwfKNBSD18QHID1+VNG/wNVBvJrjtQSRCduKwQJ
 DYHAyuZVvieiFMxIv7fG3LPPAf3D8rT5i4pApRNnPgTi9tg/cphjczu8NoSYHsfa5aan
 sjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792320977; x=1792925777;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QANdJ9Wx0Qdp3s9+/Wbyon45Q4YDAQdyvgVAf7Indvg=;
 b=FpcJiXGfc13fM5FZttpm8bP1Pi0XfSn4ltVy3+2ILigiFWX1YNTceAeTHhpEiry0R6
 Z/R11qKz4m9qHjYwrAWn0eyg2TV/NUyLmtOVGo2JAtMa9YDHAN1eQvWNRAYQLQRMOAqx
 L6jK5O21lyU/ftzLoZ5jrIcKmYmBjyAu+77IYP6hyFXAfZdTwt/mFuPVVJWJpKT+pKja
 XuBkqk7oEzoW8EfkjqqWnPsbRaMDp/yHzkbX2F72cGxlmV6rBKgwdPi0q8jISx8yakW+
 JP99LKc/ED3szWlTDwtoJZnI0353BLEYh058nfdZKA9xUmg7SmSyN7bzcOthYGXO8QSK
 k57g==
X-Forwarded-Encrypted: i=1;
 AKwUvBympVDx5VaNuLJtQ5HWe5ahCb7yoncxiVOXF2LHaBion4Q2EbeU1FglNs71Q3mp9vE9jfcDxujbtw==@nongnu.org
X-Gm-Message-State: AFq9FYKCXgBT1hYCI1TOZ2FZ26/ZQgsL6c/Ok4ZsIgypFylJl2rBcJSG
 oN6VbbbSoL/drIV8Y5TvmJ+Y2l6BOgaZTg1TYxdJZNj+P96oJ35sL8SnHs5dREDdffyxqrHtieS
 gGnf3xuXjxAC2hCPmka2NKDFseDE+cF2Yr/ACqB0egA==
X-Gm-Gg: AYBFou13NDiaIByZhvUiCJc+9ItnkRh3OVyg7+tSeXeSFFmKJtbtSwa06ll8ZxBsEhz
 2A4Uos0X7PLe7KNQWbtBjtjm8UdCglKTcE1Z1bfZsFRME09kmTnt6mPvJD2w2ZRRUgVs8VCizZ0
 aLCz29r++fIuZOEaqhVl2oA68u/r9QzlByU2dS1lPLQ5lhvKhWMm1s9OB94joZwjCnMXsnHIlWV
 Ro4lxr/+JFBHDfq9IL/lnmw3mzRBrliXxpBHU5L8IvJWkpF5XeuLK0U6rcq3DJbj9fIXq1gq8IC
 jA1jVBBorYZJBRyxZ+ejQjO7Pm/6/7wCzjoJYFaIBJZhnKRLP7jJAyFq8ukljNIA9tBsgAmQAeB
 57I11gBQioJlugUqK8xD+YL134+TKLvl2GJ4xdQic
X-Received: by 2002:a05:690c:e20d:10b0:8b0:9e07:d8b3 with SMTP id
 00721157ae682-8b0f21dc83bmr10084897b3.48.1792320976603; Sun, 18 Oct 2026
 03:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101158.42101-1-corvin.koehne@gmail.com>
 <20260918101158.42101-5-corvin.koehne@gmail.com>
In-Reply-To: <20260918101158.42101-5-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2026 11:56:05 +0100
X-Gm-Features: AclHuK-HZKcyf6s8gcu18mFgDkRq1dyy41wbK1FpU5J5BM9Bw5InPgJ6piSwZfQ
Message-ID: <CAFEAcA-XezAELu7b55coyvBn975+SKtZn=7zmBaMj8aELmNxEw@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] hw/timer,
 cpu: Add Clock API support to A9MPCore timers
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, Corvin Koehne <C.Koehne@beckhoff.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Fri, 18 Sept 2026 at 11:12, Corvin K=C3=B6hne <corvin.koehne@gmail.com> =
wrote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add a clock input to a9gtimer, arm_mptimer and a9mpcore. a9mpcore
> distributes the clock to the other timers. If no clock is
> connected, falls back to 100 MHz for backward compatibility with
> existing machine types.
>
> Frequency calculation now uses the input clock and prescaler
> values according to ARM Cortex-A9 MPCore Technical Reference Manual.
>
> More information about the A9MPCore timers can be found here:
> https://developer.arm.com/documentation/ddi0407/c/timers-and-watchdog-reg=
isters?lang=3Den
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

Also, something in this commit has broken the functional test
for the realview board, so "make check-functional" fails
because the boot of that board hangs with no output.
You can run the individual test with
QEMU_TEST_QEMU_BINARY=3Dqemu-system-arm $BUILDDIR/run
tests/functional/arm/test_realview.py
(it won't have a timeout applied like that, so it just hangs).

thanks
-- PMM

