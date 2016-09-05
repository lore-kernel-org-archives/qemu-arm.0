Received: by 10.25.87.130 with SMTP id l124csp195272lfb;
        Mon, 5 Sep 2016 09:21:30 -0700 (PDT)
X-Received: by 10.55.125.199 with SMTP id y190mr38243427qkc.135.1473092490277;
        Mon, 05 Sep 2016 09:21:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g29si5677546qte.30.2016.09.05.09.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 09:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgweH-0004OS-GF
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 12:21:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgweD-0004MT-E2
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 12:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgweB-00015S-ER
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 12:21:24 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:34369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgweB-00015M-3f
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 12:21:23 -0400
Received: by mail-ua0-x22c.google.com with SMTP id u68so10140176uau.1
	for <qemu-arm@nongnu.org>; Mon, 05 Sep 2016 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5FIciXCHJnXuqeIpOm2mLHXdpY29ViaR56cHJqEiTGY=;
	b=T4oDc3c9t5pLFfyUypBdRyLHj41FP33ArhaHTgMb6UNvTrwltpIHGLyAjVVp+EUyes
	Opoo2gxf/vP4w5by+vOz2FFhwfkmKlOK8AEPxPVE2Uhb0cWzTjddQIscPbL8kH8RptPS
	WwtnTeYcqDv9LQRGaZxGjl1uHJFxZpkOOOkvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5FIciXCHJnXuqeIpOm2mLHXdpY29ViaR56cHJqEiTGY=;
	b=cEQ/N1W/5EhHn1YdJz5Gpd4UbqBJGqA2NFy740I1oHEhP3sdr5YYUA99coIuVaJP9X
	9qDmffjlzmXTwDTnT5MhFa2UHiGiyjm5Zyb0DU4393KHVJjLanPVM5x4Wg2U8UwQHR4U
	u3N8Tcl1HFnsoaNvC3EKfoOv/h6GTBxhxI5Va3x0sEaKodZvqClbL6xeoPagOLBmRl8J
	BIVpurPbcXls7wa7oYAiyr7CZl12dZ1HuIBHIzBrZYJ1lSP1ngpZOF/j2Z71xeSjuJbj
	PMub+73aX5GuwRSSUVSD26jfml/ch99cGgag0vV/G9p7DKOE5QIzLyoifk/+rpahhSpq
	xOjg==
X-Gm-Message-State: AE9vXwMvk2mpfErYUO+CRrNX2oq+29Ho7u8z/pEOeWlFj1u5tNCItV4IpUvYtXm5pb6qnxJWf1nteYoaT5xJAGmd
X-Received: by 10.176.0.120 with SMTP id 111mr9759339uai.17.1473092482655;
	Mon, 05 Sep 2016 09:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 09:21:02 -0700 (PDT)
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 17:21:02 +0100
Message-ID: <CAFEAcA_UQ51y79zNHme+k21HxPVQLVVsoy=9i7sVGs7FxRjekg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH v4 00/10] arm: add ast2500 support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EPW7mWVoQbgK

On 5 September 2016 at 06:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The AST2500 SoC being very close to the AST2400 SoC, the goal of the
> changes below is to modify the existing platform palmetto-bmc and the
> AST2400 SoC to take into account the small differences and avoid code
> duplication. This is mostly inspired by the realview and the rpi2
> platforms.
>
> First patches rework the 'palmetto-bmc' platform and the 'ast2400' SoC
> models to provide room to other platforms and SoCs which have a common
> design.
>
> The last patches add support for the new AST2500 SoC in the required
> controller (SDMC and SCU) and define a new platform for an Aspeed
> evaluation board.
>

Thanks, applied to target-arm.next.

-- PMM
