Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1857794wre;
        Thu, 24 May 2018 06:21:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKwY/iovRkO0/VSzS610VHLntFmBndcIhiNLjKiauo6Io8rkJU2ydblT1fRvb57vJPjO4Ht
X-Received: by 2002:ac8:2c01:: with SMTP id d1-v6mr7254981qta.125.1527168110263;
        Thu, 24 May 2018 06:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527168110; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0E4YxgLxl8683e66rd80oHE9Pp2sMS6WbKNLiJ49O2qqbINacjrWPq43anmgJLKbM
         qcRtcsQY1P5t3M+35IirdWVMyuHvoJrlt+HUkcw/ZQYUEW4Ep7nqbWuidufU9hZLLcYg
         xYqv8e1DalVmx+B0xr+YW7raR1lBnYGja8Ab29//geHzP1rlTUtDPOHVNpuSsSFAQQLG
         Qx3NE56E36TnM77rFEa3pDDyXggyWr5hnDTzYS71LuRDqr8FkIdc5SS+OVPr3aQeYzUK
         C6ospkJKcSryfAahLrj1YNXWhgTuvPiPepzF1TEmCoL+lv30Bkzi78s7oGq34yFIqvrh
         KAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dziRiPcSdiFSYqT3nUCbYDrvs0hwDfR+KvPN04m4gkI=;
        b=ax3L794y1YXWHMvl927Bug9cAMHRMcK7cP7nOTesvfCYR9fPvLDE8imXt6D0oqlAKu
         GxbDSQSNjzGWCsD6YxQRoVdAxPGYxTNgpu25CTUOGzGT22Yim67o0tyh27VtriT57Z9j
         W89gLnDliFQUzuum7mS+xDVTp14zF+LK48MbBKRekGauNz52f8L9kiVBLzPEPH10+jqZ
         y+XsMs/1SDA2CsamXNk8VY+lJDEaMS0i/eP4m1xHz4vtLW1pQBu2v1rWjwiOTyjcqUTP
         IdwXLwfx5SptTjMJ67NOluQ/IBmCpjC6oenKURls7tSIZ3VXk7j6AaYsMjLnXCjspaQz
         4zYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qjkuo/HJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p21-v6si454580qta.22.2018.05.24.06.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qjkuo/HJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLqBh-0008KW-Pj
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:21:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLqBW-0008K9-Aq
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLqBV-0003sk-Gm
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:21:38 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLqBV-0003rz-Bm
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:21:37 -0400
Received: by mail-ot0-x244.google.com with SMTP id l22-v6so1892133otj.0
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dziRiPcSdiFSYqT3nUCbYDrvs0hwDfR+KvPN04m4gkI=;
	b=Qjkuo/HJiFCCQXFAd94vlCWPV16s6yZotJBmmTVnbPBv6DlLuhIEajGMEZ56epdHco
	4H2aliUy1sIc7nt6Qky+0SOuX2zlXUX/jWQOWz/GQVOx8SPOID0izolf0Sf9Zyw+enXx
	gvdRCw8eFyVGwAbWf+e0HbrNmTnrnz4/KXqw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dziRiPcSdiFSYqT3nUCbYDrvs0hwDfR+KvPN04m4gkI=;
	b=tE1xWfSP1UfNFGLjUUrcX95CvF6aa9mFaT07Z6Pk2mqmWJZSU4Tybe+e/fLBrWT16X
	wjiIWj+clcSzI/E9K5cYwLpg/u3jvR1ROVbOT3ZRY/rW1wwl7GWNcN2JWEdsvq8QWYak
	2Eb321fufzN52LH1iZXu/KEFkgkIaiQV9R6QiCnkqY2YTGADILvRXZ8jfwuUxLyytp5q
	wgGPoZzYp+hG0QPlSnHsLZ18cYHqYc1uV+CwU5RMZxpF6bIOJSTT9pA8KKvGswR6pga8
	gTRTd4NC6KGe1IjdxR7btxEF7SlHZ5eO5wSza/L9zo/AJNXBUXukkdoXI3MPgTat90/V
	Xigw==
X-Gm-Message-State: ALKqPwc6DL6d6YBe3pnK81TqofSLaT3rIb1JRQxP0GnFWzMeV6VM3Ek6
	Xcn4IvFWfMipIeYcCufp9dnsFG/2t3yjr9u0CBn1GQ==
X-Received: by 2002:a9d:2625:: with SMTP id
	a34-v6mr4747198otb.308.1527168096581; 
	Thu, 24 May 2018 06:21:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 06:21:16
	-0700 (PDT)
In-Reply-To: <20180522175629.24932-1-richard.henderson@linaro.org>
References: <20180522175629.24932-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 14:21:16 +0100
Message-ID: <CAFEAcA_-tuEXm0gGNkzs0xb2Rm90Nm_t2i3pYJRULay08h_FLg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH] tcg: Fix helper function vs host abi for
 float16
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
X-TUID: +hSR61b26/gH

On 22 May 2018 at 18:56, Richard Henderson <richard.henderson@linaro.org> wrote:
> Depending on the host abi, float16, aka uint16_t, values are
> passed and returned either zero-extended in the host register
> or with garbage at the top of the host register.
>
> The tcg code generator has so far been assuming garbage, as that
> matches the x86 abi, but this is incorrect for other host abis.
> Further, target/arm has so far been assuming zero-extended results,
> so that it may store the 16-bit value into a 32-bit slot with the
> high 16-bits already clear.
>
> Rectify both problems by mapping "f16" in the helper definition
> to uint32_t instead of (a typedef for) uint16_t.  This forces
> the host compiler to assume garbage in the upper 16 bits on input
> and to zero-extend the result on output.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to target-arm.next, thanks. Is it worth marking this as
cc:stable?

thanks
-- PMM
