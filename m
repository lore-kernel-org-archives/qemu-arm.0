Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp303733wrd;
        Tue, 18 Sep 2018 23:51:51 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbHpDOwnLt91tD2jPX6gl/WQt6/xFVMFcMVXTGCHhueZBSS9YWNDjMLuyYPF5X88FCuvCpw
X-Received: by 2002:aed:3584:: with SMTP id c4-v6mr23222520qte.155.1537339911266;
        Tue, 18 Sep 2018 23:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537339911; cv=none;
        d=google.com; s=arc-20160816;
        b=fPiR8B2YSg8u0Uk28RdIDRM2HoF6CST1n653lSWzHqjmDMwD2PSpjxlJ9D41/EQDVL
         GQSdhxdmLvMkGJkSt94GUTitARZpQOHuBEE5ewwZfJgcuJvFXE0H0ZgNXnJPcnHX9uHb
         pEMxbLaFewBZBXnoeyYHAm04Kgjk7SuMYIXvxBNt8QyYts1FtA31ZKJyqYBsNwkdLsPO
         p19NOTLfBJwKKmwrMgPnk6YQjZoN8t9HQmKeoDVN4xdBkk8OcOxF+9UPZC86z/lxkVrj
         slkAXBMrhHT4JluZci9cMfiC6gR/9CpP3Ejl3qDCdCj+iaEaScl5v4x7AjMNsnl7hmLV
         I0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=9GjtH5vJsAifIxyIqyQMCa3JlPXJNQp06LCzCD5qZOw=;
        b=IDoXcY96yW9gXGpn9WNaa/LCYIghUOxJAKGYqxOTSQy3MbhkqRFWWKjZPqI8lv5Epn
         JJmQlQYgVdnqyL1If+PVbgE/1xvBq9NOXH1xG6zhts2UO7PGx+qLQLSN4QX3Y9MHYO4z
         i7Ywxzx6ULLREDzyFHFRoaY2gz+aroSNBWMS4+GZopE5sKpjMDw1C7fB+NCPZyXtFsnW
         D58cQT+BvrIQ+z6v4e8TEYjvRAdvNej5ohS9cAvuTqtpkjZ4eyw4Dkr7h8V3/hameS5z
         MbxF46Ta6RxE1gcSqKtXmc1ync2vpGSGxXxejFuwNo1VlBGaJnCFyhQeGQngz8XnRFse
         OvVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27-v6si2954140qvu.77.2018.09.18.23.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 23:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2WL0-0006PA-Qp
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 02:51:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2WKs-0006Om-9T
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 02:51:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2WKo-0002fp-11
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 02:51:42 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:54094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2WKn-0002f9-Q8
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 02:51:37 -0400
Received: from player750.ha.ovh.net (unknown [10.109.146.5])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 5F35A1AAAE8
	for <qemu-arm@nongnu.org>; Wed, 19 Sep 2018 08:51:36 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 3203F1800AD;
	Wed, 19 Sep 2018 08:51:29 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-5-clg@kaod.org>
	<CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ce8fb63b-50d8-2d05-67a1-c89bb2e06e9a@kaod.org>
Date: Wed, 19 Sep 2018 08:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-C05P6dBwSr1QBJX9-B+QCy3LCvqKM+uZnx5NP-7BU6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17435685958049499986
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrkeejgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.129
Subject: Re: [Qemu-arm] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec'
 property to boot from the FMC flash module
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XCgCwEGycOvj

On 09/18/2018 08:44 PM, Peter Maydell wrote:
> On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Now that MMIO execution is supported, introduce a 'mmio-exec' property
>> to boot directly from CE0 of the FMC controller using a memory region
>> alias.
>=20
> The name of this property seems to be a reference to QEMU's
> internals: is there some other name that would make more sense
> to a user who cares more about the guest and the emulated hardware?

It is true that the user does not care about internals.=20

"execute-from-flash" as you proposed below ?=20

>> The overhead for the current firmware images using a custom U-Boot is
>> around 2 seconds, which is fine, but with a U-Boot from mainline, it
>> takes an extra 50 seconds or so to reach Linux. This might be related
>> to the fact that a device tree is used.
>=20
> Is this overhead just because we do a lot of execution from the
> mmio region and that's slower than execution from RAM ?

That is what it seems but I haven't dug further the problem. The mainline=
=20
U-Boot also has a rewritten DRAM calibration.

Using the logs is too painful so I would need to add some statistics on=20
what is being done. May be number of read/write ops on the flash model=20
that we could dump from the monitor, or some more low-level figures of=20
QEMU internals.=20

>> MMIO execution is not activated by default because until boot time is
>> improved.
>=20
> Can the guest tell the difference? I'm wondering how much we
> might need to care about backward compatibility if in future
> we fix the performance problem, or if we can just switch the
> default to execute-from-flash without breaking guests.

Yes that is a good a point. When performance is fixed, we should remove=20
the ROM region and the machine option. What I am proposing is a more of=20
a work around to analyze a problem than something we would keep in the=20
future.

Thanks,

C.

