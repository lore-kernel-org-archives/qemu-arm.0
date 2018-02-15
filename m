Received: by 10.28.71.27 with SMTP id u27csp2567985wma;
        Thu, 15 Feb 2018 05:19:26 -0800 (PST)
X-Google-Smtp-Source: AH8x224vYF2Cz4gJyPrIyc21OQu+lrxLdpBlma7Gyk/QdrDCigvKd8zDw2VtaBRNWBTTJZ3g84vT
X-Received: by 10.37.35.212 with SMTP id j203mr855428ybj.44.1518700765969;
        Thu, 15 Feb 2018 05:19:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518700765; cv=none;
        d=google.com; s=arc-20160816;
        b=daCuEZA+oE+QVLq23EE2O5LCLqaNmGvtLm7JakCDrkXcJshApKxJDRNdQXnbKq4hSK
         Q8Dr5ErsMj43XoH+UDBpRohSk1ssLEcfCFIAu3UxFkVojwpAzliKeAMebhjP8yLH93I4
         DhQ4OSdAi1yomsryKFm+wWoA5CRhlbXCFSW7cfI4U9dm80cymijvv/C1RxaUTwtHsRvo
         l+YEFU393N1F0xi8WZBuEk1gxJniY44E8v1aHeJbhoyUpQAK6q4Q2j1pFyfBlUYKAhtT
         QAkoNb0jJ0kxUxVDjMsJSPK5nk57HWPeF58DAkenhdYqC6HNPMFTUdZRaEgDeNaqiHrw
         I33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=+gAv8F4KPSPDLbr50VJ+m33/YsdXb5oK1WxljRMHEBw=;
        b=VOkVHLXxvblj4gA9ZjTu/VMKyeIIUJhTLod85rtRcWYgtUEVo4NsNCjpeo+ylaLXse
         WuyZ+5mFm+mdSl2hza8YyEIaIw1nWe4VxJUhaXnUk3OivCZDuobjlKS05SC+8mKqrewR
         1cmURfAowS2yc45MqgQVqUpU8rc444xNhcUsMQVWVMlVjRDPg26oHdSzvwJEABdsEfl+
         SfExX2mVzJG4DIYWiAtw7El5c60P7zHvDOqI8hLZCdSxp69A600inCOA/R0TNr3AlwlC
         0CgLYgSiNsb4peUMnXRevAXmlVc/6UEVDuHGiHVAXP9T/ZiW+RVXBL1M+6bSQWkcWwUJ
         E5Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Od2JjEuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si2577959ywm.533.2018.02.15.05.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 05:19:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Od2JjEuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emJRd-0008Si-DE
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 08:19:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emJRP-0008QQ-V1
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:19:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emJRP-0002h6-2p
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:19:11 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1emJRO-0002gt-Tv
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:19:11 -0500
Received: by mail-ot0-x243.google.com with SMTP id 79so3166289oth.11
	for <qemu-arm@nongnu.org>; Thu, 15 Feb 2018 05:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+gAv8F4KPSPDLbr50VJ+m33/YsdXb5oK1WxljRMHEBw=;
	b=Od2JjEufy6z2TjdbkmL8r8r6GPrAb7P5+3mq9E00bYzZbxgokEwYX1vhNhbXxtMcn0
	WhLJA2PNyd9wUGBD5CG8V3Ku8d9QC2fRYq1vqg8epNo4yOzQ6XJPVkhXPwD9f1GYalYq
	qbQn/5IE79kMYs1AU4IIVXR5603fevR5UHBKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+gAv8F4KPSPDLbr50VJ+m33/YsdXb5oK1WxljRMHEBw=;
	b=jCLGmJ//HYCaNMdVsuxD4ZIVtd5xKm1BdWt87JvJQ8IoJ8vB6jSAmBdlxIlU7+HrKr
	s+Nf8mP7gruagqKTJQo0RrPn1N1gUKOD08UY/j12w5r0sx3pxJNo+Vcq48QU5iX246Qs
	FYsgShv4lumnumd4j4KqYeXMuEatmkraw3GUdRE08VMj0qOfY3XeFsjoxFKr0SGV9Mnv
	BxZK9+xLzVRXXmVfvsnho7jgYJP1PpO4AICz82O90IKw4GSCU9VQ44z6PFIt/apfRenq
	vl1hFnLL2mmiUJJwiKDZ/V3UY1RUB8IplY4xEqT7uOJovO0L/RyDA0wTL652x59JFoaK
	1XtQ==
X-Gm-Message-State: APf1xPDtaXJuBRvoo0GDJE2phCpyXgfNSJYuLU5dvbnlPy9VB4t5CZfm
	uNHINJFOun1Ch1aEILvH8ZZDrwDTV+2EoWipzKEHXw==
X-Received: by 10.157.41.203 with SMTP id g11mr1674324otd.110.1518700750224;
	Thu, 15 Feb 2018 05:19:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Thu, 15 Feb 2018 05:18:49 -0800 (PST)
In-Reply-To: <a3f95aa2-3a13-8a67-4fe2-b7da6eace585@amsat.org>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-4-penberg@iki.fi>
	<CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
	<9c52a265-6659-5c9c-27c7-eced8528fb63@amsat.org>
	<a3f95aa2-3a13-8a67-4fe2-b7da6eace585@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2018 13:18:49 +0000
Message-ID: <CAFEAcA8Zhih61YZNBEQQOFv_XKWknw7oN80pQbK+NgcB1mEsYQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v1 3/3] raspi: Add "raspi3" machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3h8OyMUFSz9R

On 15 February 2018 at 13:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 02/15/2018 09:49 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 02/15/2018 09:39 AM, Peter Maydell wrote:
>>> On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
>
> Now I remember why I hesitated with this patch,
>
> This part {
>
>>>> +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a53");
>>>> +    mc->max_cpus =3D BCM2836_NCPUS;
>>>> +    mc->min_cpus =3D BCM2836_NCPUS;
>>>> +    mc->default_cpus =3D BCM2836_NCPUS;
>
> } is the BCM2837 SoC, very similar to the BCM2836.

Yeah, we had a whole go-around about whether we should have a
BCM2837 object or just make the BCM2836 object have a configurable
CPU type. You could argue either way...

thanks
-- PMM
