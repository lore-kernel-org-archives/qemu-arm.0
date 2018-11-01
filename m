Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1084463wro;
        Thu, 1 Nov 2018 10:25:24 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cuy8G18dPAUbF/qSPHvXtWaz4/qxsDqT65yUX3Rtu/Py8CyGde9MxV+WMvrB2bQh/tDRch
X-Received: by 2002:a0c:b5e3:: with SMTP id o35mr7761529qvf.164.1541093124073;
        Thu, 01 Nov 2018 10:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541093124; cv=none;
        d=google.com; s=arc-20160816;
        b=ljO9F4a5Kx2RiMu02d/GrjUabbcUslh9kPFl2yAh+yJHW2WXkSUbgQy7nSYzt3MHMO
         qQuG3yWXIobfM6nRLIh6JCDe4zlSFHUsIEg3AJ2EohHFyejWIKRkfVhK39w7x7pY0eHK
         50prejqgPHwaXNr2cfc2E6mIyCRmPnYHkTIWFYPUvdWKDTr/QQ9NkpKWvCXJlmOR+Bl0
         TfshQbCJtKvmMoG2LYMEA6aV3LHsm8VOpnA7a/oPiFqHObaNAhPMwExH+jaeMRV0SwHC
         LFQZ09Ogf5Q/OXPI5LTdOuC2byOth0uFHn2cw+Yp7o+9oHkikAS/VSt5XV0lJ8FEgStb
         lfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=lX8dSoxAC8lCQ0Kd9q/Opy4KSxBnqj26eOf0by4stRg=;
        b=G+pAFVeXtSWQL2w+MhdwYYjSH0qgtayBEVw7ovvkJNz2qxyQrtNt3xXdctdg0JsHRG
         14QQyqbSdQ6PyMJwKyysYlLkoIJkNHAcczhIpc3gGRQYQ3FN7IBsGEkjs7SuHqQU4JOV
         d9Zizf/mFDNyQNppvE/ydklvSMHOl21keNqAANNdShseZTjrn8+D1UTeKbDS9o4eRBlH
         eheCtO/UgAAGFNsJCPco8knaj9Dy+B3YZSbL3szzos3wP6vTaj12Fp6IYjLF3GGxuCTU
         VCaeqZbAyS/ASxQiGnjgF6P3madSFIXHEx67d7SvL4IaSPi43pUA1Te+B4p1t6jJr1E7
         XB2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KkHXDEdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o127si4313150qkd.13.2018.11.01.10.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 10:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KkHXDEdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIGih-0002B9-JR
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 13:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIGhy-0001sF-7K
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIGhx-00025F-Fx
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:24:38 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIGhx-00024g-1a
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:24:37 -0400
Received: by mail-oi1-x242.google.com with SMTP id u130-v6so12518021oie.7
	for <qemu-arm@nongnu.org>; Thu, 01 Nov 2018 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lX8dSoxAC8lCQ0Kd9q/Opy4KSxBnqj26eOf0by4stRg=;
	b=KkHXDEdP57A5LlH0O1v7uMGcRyaMAvw4j94GIDkxyMBjJOEj878Aup1rI9HWosZ06V
	GeC0M4D59cKWtLKIe+9ycbAC5QDP+szeioDK7vBJ0s1ewyfTo2IO0AnR/KoW5TS40coQ
	Q2exvly1cvRyQHkpqRfVlux2bnGKxM4BDj4mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lX8dSoxAC8lCQ0Kd9q/Opy4KSxBnqj26eOf0by4stRg=;
	b=tVxgwjI7NOwwEs3L88RrLrNlzTxRhG0g0TMurYxHXWRAFDJamm2XJeqhT6/ZgSN5j1
	YTXUGseDKiT3SxO9xFlEJ8sUrisUwEMUFbaMkNnFI6Ud/FVapEjs0z0OpUQsZojnDHl5
	K9dUmt6wso+++W8uCIHML+/ACcAzLa//06CXf6IK19ZFf/t/7A3N5l6RBLmOB014mHjf
	8dmsXUxuNYUYrQ7XhYN6t9LIqvVZj57UPWR6kylb7f422kjgkmZm08W4BgaWVrpzfw7n
	T/B0D3aHk6gHchzYIIOY76m08td1x4tW5xsAxhrDsiyM/G5BUN2TwspDbFLwcZR/hhIJ
	BpEA==
X-Gm-Message-State: AGRZ1gIOBmLM9l0kmD2G5yD6QfFC+7GiHly3vh7hZoENSB+4QEhAGz29
	xk0nCqsUkOWdPTc5gtYUaiE/LN3R1oEcS3aJh3q2zw==
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr4600057oih.146.1541093076184; 
	Thu, 01 Nov 2018 10:24:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Thu, 1 Nov 2018 10:24:15 -0700 (PDT)
In-Reply-To: <20181030193044.25954-1-philmd@redhat.com>
References: <20181030193044.25954-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Nov 2018 17:24:15 +0000
Message-ID: <CAFEAcA-r=d-s0SS4_VDX1A=viaZkS0SxJW-3mVn6Brrx8QHCew@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v3] arm: exynos4: Add dma support for smdkc210
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1aVNj3G2OqbG

On 30 October 2018 at 19:30, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>
> QEMU already supports pl330. Instantiate it for smdkc210.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I don't suppose anybody has the SoC datasheet to crosscheck
the irq/address values (and maybe see if it lists any of
the other pl330 settings) ?

thanks
-- PMM
