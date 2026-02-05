Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E394DEC1E9A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 11:00:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnx5r-0001xT-Fj; Thu, 05 Feb 2026 06:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnx5p-0001wm-Sk
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 06:00:13 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnx5n-0000Sx-Hu
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 06:00:12 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-794e0e933ccso8292797b3.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 03:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770289210; cv=none;
 d=google.com; s=arc-20240605;
 b=Aad3OI7ts5PlPJFirsj8+cfh3ctYqRBA3bCrR2RU2E+WITGVVUwRhYhtSPAZ2iReWA
 BjTqO5wONRM9xP5vR9SrWgC4Y0rBRQeGeI+lnO3Jep8WURjeqwG7MfKNg06pHmsozILG
 QJBO4iAflbzU3uIP2pk4PQAkgR2Nfrive+QNdph6lkvgouVNZHK2SR9cJHba5uhPUjTD
 wzKdaFuSjHIQRR6BaP7Bm/b81q0kf8TxSjf9QupFITTs/1Dd0uxgxS+Rovpiz9xrTyfV
 IaVOh87XdLcqkW5SZU14pOwkJGuuHfe8Acw2Ul41HUxLOtABoQya7sS/AeeHuoq8GfXs
 7Vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UTXQ+hL5pOtgRw7c+pwlRgQW/90K168Dme8+mjUgRzY=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=AYMhuC0bosQCn8/ZPzOeBbjt3+dM4sfrbFCGu4+NborT9SdTYujDh9nmKrNg3SFvoo
 R3d4NzO9xuloCB6ogETlP3yX6oT+4NEFyrYXiFGSpvehhfY+BtYFIsFgS+YvnFM6kgDg
 cJDdlh5XKO4gy/2teDNe6xiKOZ/V2AvI9RAzEHelwdX6i3vh2vBS2BMvZF4HjttZtevP
 iVWp+HE88SUhY9Og8ZSin8Ap/LSVfD1qsbzCLN0XYE6OwHsc/YJKiIdQC7yNR98B27/4
 Y/6JvspAHJn92PyYbt1e5mPq0galBBQrPdp1/xd8ii+0RsljFCK9Vq8i/PNRec+dr3zJ
 w9kw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770289210; x=1770894010; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTXQ+hL5pOtgRw7c+pwlRgQW/90K168Dme8+mjUgRzY=;
 b=jpqSPlhL/ktDK8cu1giKLnIZlSrA1ZiuO5e3U3BiUeQsZYqmILWMNMpuEpUzAKThT7
 0TFSKIu6C2K12hReVxifsKK7NgASjC3nuQtMXZDj5A0Lvv2ZLpHO3yEvDLVk4/dPQAla
 jlxe6mdOdQFSlK2JtlCmBsDpJf2YszriI0IZ6fv3foWIb0ffrNasBs9hwfexVW5yKTCa
 oiwpOm/TR+1omL85vs0YeyT18QelFm4Fya8sOiQopaKpBqba1DJNRQXX/1w9/s4QfntD
 tPhov9jF4dVYjTcnpbJmXTHoZC5aSx9eHyS8D93OYzLBthVqbUizIXyBHx8U3frp7fRr
 TcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770289210; x=1770894010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UTXQ+hL5pOtgRw7c+pwlRgQW/90K168Dme8+mjUgRzY=;
 b=vhIOb5QsOhnbLSBg9rwI1g/z3GFEOX1AuGVhM/ixxCkUhKrc2pHjMjkPrjbmXiIoO0
 U0CqGCWBJJ94d0Icpnc14hAQhx6pXDKRkDdqmFPm4YIWtXsVj7sjxEbNRa1xOBTpRtcF
 NxFkbBstcrlECrG2Lm/4qFK6GZfobY62FbfeMlNHGwHOJiVBk0tBjRgc/zYnuLLeSy2m
 fPk8vpOGrQpDw7u72TxTe42zYOZnb8hFWtaltKKR7l6AF0SoUw+im3LPTu6qi2bUqiQe
 77ZZh6FK2Zn8uI+x7mWcGflzd4xCjWh2UorAv9J7dR8BEAE74yZtAfIZlBJLPwmFlYc5
 4YWg==
X-Gm-Message-State: AOJu0Ywyvs+P/+T1j/gaweRTx18rZNLbgWdWaMMEbOpxZNepmVPY6WT3
 ZZUuGzizAO07pBCFT06ylFnEb+kuIHk5pAvo1jwOa+JdExvL40+xB3E5QMZ9yEy7dUV2phPwi5y
 GzrS87+5jM5bohB5RrvMmDsYiJfZBVSiEfCyQn6knp/ZgXiak1jJR
X-Gm-Gg: AZuq6aKblWntNO3lPVdaspKTBTvx0A7qevaezf+lh6b1Q84jy539NmlyHJTMCwuCSSt
 N69Z2TS1sbNbY6UI/lNq6cAWyfJbjdfcLKcNM8eulgxU1x3vwMAzmFXPn+JqHc5T2qBmrFTcA7f
 YAHX5hilewS8Ky0frwapE78Pme+4QePsEh5r0oH4J2iqac5oxmaNMQ1a/dKQ+53uQui1A3mOXlS
 N7WxWRvFQSY00VowrZzk+59mSBmmCvRgjGN4WgE5/eUmXrwz5AcnwDsRsYj6k2GtXzCa8vBQ1Sq
 b9oK
X-Received: by 2002:a05:690c:f:b0:794:d29b:4a3f with SMTP id
 00721157ae682-794fe695ea5mr62683867b3.29.1770289209502; Thu, 05 Feb 2026
 03:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20260204103136.1795455-1-clg@redhat.com>
In-Reply-To: <20260204103136.1795455-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 10:59:58 +0000
X-Gm-Features: AZwV_QjPAmVaqBP6vcgUxH9C4U5YcF0jFaGbAt6Ck5GLsu2fEdCNwV9ZVP2aggg
Message-ID: <CAFEAcA8bbux4ZurMeKF4=qPijBs_BLDN8CNpMT1PB9G_hmeKjg@mail.gmail.com>
Subject: Re: [PULL 00/45] aspeed queue
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
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Added support for the new AST1700 IO expander, including several
>   device models (LTPI, PWM, I2C, GPIO, etc.).
> * Updated the AST2700 SoC with LTPI support, EHCI IRQ fixes, and other
>   improvements.
> * Updated test images and test cases for various Aspeed platforms.
> * Fixed issues in the Aspeed I2C and ADC models.
> * Added support for pca9535 GPIO expander.
> * Updated documentation for Aspeed boards.
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

