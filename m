Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1274641wru;
        Mon, 16 Jul 2018 02:09:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeLUdT13ergroQYEDz94vehp4dqPLBthJCJfQlZxVnOzJX4/RAZzkcHwHHHVaBy+Wc17ln7
X-Received: by 2002:a0c:9208:: with SMTP id a8-v6mr17170234qva.47.1531732172818;
        Mon, 16 Jul 2018 02:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531732172; cv=none;
        d=google.com; s=arc-20160816;
        b=iNm/7nL0okuVkFYCZykthIIcsXq3Aatqpn/xynHeTHljOLPWujt+jYTDAKrEzDEEee
         EVPfb/C0Ff3/TFdqeRO5FQw3/Ga+Z+FOQv0Kqmnl2ymQGEBaiX5JWMK/TKCexsiTuGc7
         QjK8ZaHkMJIW/fYX8KP7m7J1ZF543JNTqvueER8LDpWNQncZnCv5hTe1Ixbsq5KqaIkf
         eGv0THihNmrJAzKKp0ZMOK6iMNFgmw9RAEvq7L2q7n1m0ysuCD1+Ht03DXf/zC1AI6b5
         /5qDzKBY0l46kHJBtfc+dbiOxvHtjWIuc5A9WN+krVq2PElVAwoAw1//EcGtBepffkEy
         cPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8e2dmdEKEzrhvYBaEXXNDF79Fd9/JzhBFOclQrRtjyU=;
        b=bjmirge7VOMf9QnyhadnNkj8D7XK58Ks4ZPFTxasiBFH+0fJWDL8lWJVXCLb3sw5D1
         li9bfNTKyEgHHI1HTph+yfRzvRpWPBULQRsK0FM0lpdMZKj9iOhpWEnMxThlR5BC8o3p
         +mKBjHGFNqmF2d3G5//PySrpIAawwCq1oLcaqc5gNbCFsr3DF5F+r1aqUi4CAIPtb1B2
         skt783e0toditAKRFHWGn9BJgyJExk4L8ge/ORuOYb9a/qrFzYkSEkK0PTS33nDJcWOD
         OB3PIUZBOdJZU9zSox7RI4tTYbWnK7Hi9SpB5Lvo3PI6sUVfmVmV4+t/4L/EvbryiXYQ
         yCLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hi25QxzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17-v6si2095117qvj.275.2018.07.16.02.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 02:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hi25QxzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fezVc-0005Ha-AC
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 05:09:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fezVQ-0005GC-Q5
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 05:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fezVP-0005Dc-KI
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 05:09:20 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fezVP-0005D5-D7
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 05:09:19 -0400
Received: by mail-oi0-x243.google.com with SMTP id i12-v6so73429917oik.2
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8e2dmdEKEzrhvYBaEXXNDF79Fd9/JzhBFOclQrRtjyU=;
	b=Hi25QxzO8sdJvT27MDtlf0SE9B40kwlgbNPPZqiKVSRGCjtYQB1PeeTnCTeK9MQAZC
	isTQGtU7OYYm0BOKVWAe8JkxV1zdezXShLdx+FOgJTvIY1w2pOALemGJFUb6TJ79Ihs9
	mkkkjHa0sgB3od9GbW3UQwpKAC2q9Nbh//MSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8e2dmdEKEzrhvYBaEXXNDF79Fd9/JzhBFOclQrRtjyU=;
	b=izjZNe0qEuFws/B5O74C4OOQZiQ4QiWDuzodkD38X/J0aFNeg0PugEYW2z8UyuKYx1
	nyyYxqk/GVnwkxXItlQIWc11O6HatYlkLqALpsWNx+Ji2FHx5LTUxdMFZj9x+aAl1Ory
	ZnoR9a0k/McrAjDe0iGyvb2ZNkYoIMrFl1cXU/H5xJRjmHXBiBPwgdNsLw+VTlsGcdXl
	ClZF41pJeN6LnPFByRzJAjQq6Q61WerMN+Si1GGe12F2EC+fP+J2c8YSKm2ifyloQH6U
	RZU5wCp/5o3pCbjER59WBhzfq16G+vu3eqp8ElfJ4h2ymbLumFS+i65ycSgyX/hG+iC1
	GSBA==
X-Gm-Message-State: AOUpUlH9sT8r9xIeX8nElQZBA72gHjD5q/TtdEMhT8ebEXe5BYdObsPi
	lfDvTRMtCVb4v+4qoMn12JNXiLqZ2nG3w+hzN+a7F3Fh
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr18348621oih.102.1531732158774; 
	Mon, 16 Jul 2018 02:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 02:08:58
	-0700 (PDT)
In-Reply-To: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 10:08:58 +0100
Message-ID: <CAFEAcA9W88G8rd4iMq7qsNd2C2fRiYJ32dVooZLyzY10__5piw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman
 (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ZEPi9AhdWC8

On 15 July 2018 at 23:06, Guenter Roeck <linux@roeck-us.net> wrote:
> Add basic support for BCM283x CPRMAN. Provide support for reading and
> writing CPRMAN registers and initialize registers with sensible default
> values. During runtime retain any written values.
>
> Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
> and raspi3 systems.

I can boot Linux on raspi3 with current upstream's level
of cprman support:
https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspberry-pi-3-model/

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I don't seriously expect this patch to get accepted, but I thought
> it might be valuable enough for others to use it when playing with
> raspi2 and raspi3 emulations.

I'm not necessarily going to rule it out entirely, but I'm
definitely not very happy about having a model of hardware
that's very clearly "do something that Linux likes". I'd
really rather see hardware documentation here -- presumably
whoever is writing the Linux drivers has that?

thanks
-- PMM
