Received: by 10.223.172.38 with SMTP id v35csp2788490wrc;
        Sun, 17 Sep 2017 06:22:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAaAOsTPvL8lJywRX2L+t83m92gEoywyw79ekSIkHuOEvJ69MtKp0OV3U+Bft34bGCIiDHj
X-Received: by 10.237.37.14 with SMTP id v14mr43063369qtc.116.1505654526710;
        Sun, 17 Sep 2017 06:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505654526; cv=none;
        d=google.com; s=arc-20160816;
        b=LATpFSLdoM/aVkv9dpz2mS67IK2hNNS3ee3ceDsFpLM6E56byqaFgK3Yb+M7PE2IQ+
         ovD24ggG4OwMh+yCvfvyePq7yBmhyADeTLcQrVPcXjlHpHxOIC05VTSimJPsPu6SB7aU
         WVZtJHf0Gyxk0xaq9bewRhJA4x9ZAbEO7v7ViK1RP1nBnMOiXFecOfR52ybopFjX0xqh
         c1dmcj1i1oOvAtSuub98L46Dk1Qfx0EtcRJmPhs7/p/f8+s8F68NJ+JUhXjnn8OnNViD
         UzpRH9ixSxuSMeuOqIj4k2QrlBbhrR1Yo64kJpqd7VzuDAYeXXLXKJbgtxbv98AqQX3Z
         inBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Dh/9/yD0+p3+FqDkxya+HggJMVALwXS/1yDGhTX4Kmw=;
        b=fgehgKmsgHU6QiHooeElQOOZt9PqeShYhHXmDFsMsPBzZJ2zyzfQH+6C6iNLGeIEtB
         ZIJptvx3l2jMT0fl6kryRDrY7C2GigNuqJUoBmZXMvRHzpqJHa9JcvUS22lgdPaj0N4c
         YxfFddy9VwMEj0QeDh/YN2GJhKMn9TQFWvUOayiDH7m4En+cSt1Ep4iqP7+JZt+z6crC
         uqAHEbkjYVO2z7Ml8S3QXURP7kE86gLjMoI+vquBnE/mmK17Ml5FMfVyE5ebOQB1WihS
         vLME8o0Zq3tHDwygRC4NHnNB+/CZm5x59H/41sM2xDwDCiDq/UvBE0h3j1xk7AWHvfCZ
         lK1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si4857791qte.547.2017.09.17.06.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 06:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtZWO-0005yt-Hr
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 09:22:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1dtZW2-0005oD-SW
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 09:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1dtZW2-0005Ff-6r
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 09:21:42 -0400
Received: from chuckie.co.uk ([82.165.15.123]:39172
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1dtZVx-0004yh-OA; Sun, 17 Sep 2017 09:21:37 -0400
Received: from host109-151-159-252.range109-151.btcentralplus.com
	([109.151.159.252] helo=[192.168.1.65])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1dtZVo-0004eF-Oc; Sun, 17 Sep 2017 14:21:29 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4e4c3ae1-853b-fb93-b891-8414c4aff493@ilande.co.uk>
Date: Sun, 17 Sep 2017 14:21:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.151.159.252
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] convert some omap/palm
 devices from using old_mmio
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 003JYx7MY9Oq

On 16/09/17 17:46, Peter Maydell wrote:

> This patchset converts a handful of old devices from the old_mmio
> fields in MemoryRegionOps. We don't have very many devices still
> using old_mmio, so it would be nice to get rid of the remainder
> and drop the field entirely at some point.

That reminds me - the macio IDE controller still uses old_mmio
accessors. I'm currently working around that area so I'll see if I can
slip a conversion into my next patchset.


ATB,

Mark.
