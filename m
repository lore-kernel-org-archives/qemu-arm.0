Received: by 10.223.159.74 with SMTP id f10csp3223283wrg;
        Mon, 18 Dec 2017 15:11:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBovmPCyrWAYt/r6jPkFmRyU5W2orfNiykyLTIE+kpTYy+5MdLrvDZOVaNXxn2hnaGNYQxD5D
X-Received: by 10.13.192.2 with SMTP id b2mr994811ywd.463.1513638706160;
        Mon, 18 Dec 2017 15:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513638706; cv=none;
        d=google.com; s=arc-20160816;
        b=ti9Uq+baRJf8G++u7TmOjaYxeS/nab5yQdT5oOLJa2jUeAAa5e1PC1+eUnINDKujkC
         P/hg8uJRXRzI+0yWIiBqFIff8TP0vOBnmefRWLiHGCApRVR4GE3ACeKUk9+z22g7igZL
         9OiHNrvUg3xVBoTKi8gyl9l6kJZnwpSIpiTcVfLU1g2XR7qVtyOc7Y2448LkVy7ilyM2
         +MT1LGZj0SNcKOhyb9kO89UZ2ua65tr6W6gqXkmzlOCzvZEpHwIY9e91BDtgIPzFZYcD
         DDhWMGnLSCErYQQOF8TfqGl/upLmV20tIGvTJpBbCWcLRb32J0H1sYH1vaySy7GdFhht
         As0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=heM8GgLvBsvCQ63hUEA98zAPDDnotI2AK1m/zQl1vOc=;
        b=Uwe3hLa5gtSkHg6bwFIoLKLizafDTwMz55kIQLbVcwEjqYKREipwifm9Xo6YCFW/iQ
         N0qbM6B2wBQFVGzoHmZCiHjI745TDsXb/faJJGXrGRE66RtU0gNWYaUOC5gRVvvghJmG
         z3HpdbioIxdpZ7rUB2Ni+kOGhgekZMaocBZK+8M3WX/hqzbjXKf1+s/4jFDss7rtuVkQ
         mBCmXS6RmOnmrVwpM58UFrE0aQgpcBmx11Cdbgh9IGKnCAvtzNT5XXl7U27VJMr9IzsW
         b4gAEzb1+C24Qm22sgME3PseI0+kceJqKGz7kCf0dab2gyqIG2d3u+fRVrHcEVyvB0j8
         QgOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pVWG6qNW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10si507448ybb.538.2017.12.18.15.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 15:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pVWG6qNW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR4ZV-0001Pv-LB
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 18:11:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR4YD-0000me-R3
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 18:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR4YD-0001Vn-10
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 18:10:25 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR4Y8-0001Kw-AA; Mon, 18 Dec 2017 18:10:20 -0500
Received: by mail-qt0-x241.google.com with SMTP id e2so22158108qti.0;
	Mon, 18 Dec 2017 15:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=heM8GgLvBsvCQ63hUEA98zAPDDnotI2AK1m/zQl1vOc=;
	b=pVWG6qNWFXSHXuR5yGrKE5k82Ss1t9Z0jksLa462Ajs9ZipTIpGgz1ZExHy7Z2uz8W
	CNiX6YgozmPqQjSRGPDmOPCy6EpM2pbMlJ0GtdjfHb024GfZhwsruBbDyelLqNgd3MSO
	vy00eIBY7ALQNNEK/vBanGBpfMb72gZQ+Rxq6OEJ2GHTmr+T4NqbNJcq5Avgw2WmGPU6
	Gdv1RIbcu3BoXHP5gBQJZ/Tl6uy2wdANM+uJhx8ViinGFaN+4+MmZpeBFKA0k/QYgn9Q
	tJXyNaDCwJnMz+dwbvENN+0TnuohL6/Eqs4ne+KMTU1xJdDtl4cojowGro3yFCUTd/WN
	BAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=heM8GgLvBsvCQ63hUEA98zAPDDnotI2AK1m/zQl1vOc=;
	b=Av+saRi9pqTpnQgoN0XK+MmoNxn2XL+gNEKBGWYDiF3sCn4W3ENb7Q1062kzpIJGT5
	jG+f5nOtFghYlTz6O1gBoHAsc11CScN7qc7aCbyB33wd5uKHtJY/dJTpOvpZFGxhoUV2
	s/dhH2xAH8+g1mcoFwbYUKL6C//lZuEDjHSleowCeIAQVTiiPPk17LHDAfzqihtHxPzx
	ZZvoz5n6NrqA04KREO9ShZSjZh8EwNqDzDxvlqR1xYaK758fkI7F/OJiz45PJaZGJz8B
	1ooLGOrDsooji5nmpXUxE2M3t9g0IaQufWL9e/tUY5GRwPoby6kOl9LzADZFc1GylrkY
	LymQ==
X-Gm-Message-State: AKGB3mI8AYe3HPOAy1Nh/2fehHzP5661XSWY3znRSsIpawj6ELAAAxfC
	/h1UOPq5M3RI/UATZXa8vCc=
X-Received: by 10.237.63.184 with SMTP id s53mr2222566qth.89.1513638619836;
	Mon, 18 Dec 2017 15:10:19 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	v81sm8490692qkb.73.2017.12.18.15.10.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Dec 2017 15:10:19 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-17-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ee9ec12e-b559-a059-e0ab-3db30be4b1c6@amsat.org>
Date: Mon, 18 Dec 2017 20:10:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171215031547.31006-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-devel] [PATCH v2 16/20] sdhci: add qtest to check the SD
 Spec version
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rOlqzXMUvpm1

On 12/15/2017 12:15 AM, Philippe Mathieu-Daudé wrote:
> +static const struct sdhci_t {
> +    const char *arch;
> +    const char *machine;
> +    struct {
> +        uintptr_t addr;
> +        uint8_t version;
> +    } sdhci;
> +} models[] = {
> +    { "arm",    "smdkc210",
> +        {0x12510000, 2} },
> +    { "arm",    "sabrelite",
> +        {0x02190000, 3} },
> +    { "arm",    "raspi2",           /* bcm2835 */
> +        {0x3f300000, 3} },
> +    { "arm",    "xilinx-zynq-a9",   /* exynos4210 */

Just noticed this comment is for the smdkc210 above,
I'll fix in respin.

> +        {0xe0100000, 3} },
> +};
