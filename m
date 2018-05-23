Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp527671wre;
        Wed, 23 May 2018 02:13:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJGGt+CfYGloyG3N+VZbyyfiQOMmh19RFN2yEEOWoTHbREBkWPIpxncJxYHRAbVsTU8K7os
X-Received: by 2002:ac8:376b:: with SMTP id p40-v6mr1848800qtb.282.1527066826806;
        Wed, 23 May 2018 02:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527066826; cv=none;
        d=google.com; s=arc-20160816;
        b=WS2mNcaNAQ4/X2Qk4ypQOcFX8E/ZJvE6xYK2rMHmVlTbmnLl6c8BwpE3IQa1y0N0oX
         /gXAhy0+YWuPGWFVCImRYfXdqq8L28Ojqb7sSEhq7mjAONCHS/cP+rUqr85ZMCeZdkKH
         /IlfbAbKSwfyKbP478Lbq60cVkhidXBaqBgxxtDQGmonRcmmsyKqhWqI2Xb1w2wKi9RM
         /c+wzkFEPXL8dg4m+ZD/UhtKB+rsFcUCH3U2rk6/s4FVJlVdrOr1YgqB//Rph0sdt2Cu
         6WkVZCMzZa+FkjARrxNoNdVM1UnmHNq1hsx+syWrEBlJIHFUdbc3t+17NaLinBZf5KT5
         i3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Q3bODcTXRdyyZTlum98wNPa3QiWZvyhqu2gVaHvfLa0=;
        b=dwFLZ0L/QUFlLQkgv/+SejJ/5rAYtI7KKZJLdBbUWMoC5+Y8f5xPB34Mzb9YFPaAtZ
         UMGT5Eo72aF9Ehh98bJom2XKWyhJoMW5L5H3ttCmGyxCM5TYtIl9CB7Am+GiLbUZPoze
         GnjpOi1ln560AdaicKpgbhaXzzgwEma3h1UDCG/F4rZAxz5AdOKBn13o2NdltApnkggV
         LOWMjhqlkDxCCLBPQWF8CyE+V+kBcbFfJb4jnEXl1nzxzulb4Os5j//+M3IcyuhARlwl
         EwSq1iYJq7+I8WggcglgQyHqQ9E/JpcldQGnb/VH9cjDSRG9Eb5+XUCvz3MHV6ONZGcm
         Ns/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g186-v6si1275636qkg.63.2018.05.23.02.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 02:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLPq6-0004EI-B4
	for alex.bennee@linaro.org; Wed, 23 May 2018 05:13:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fLPpv-0004Cv-GN
	for qemu-arm@nongnu.org; Wed, 23 May 2018 05:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fLPps-0004hW-7H
	for qemu-arm@nongnu.org; Wed, 23 May 2018 05:13:35 -0400
Received: from 3.mo173.mail-out.ovh.net ([46.105.34.1]:42392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fLPps-0004gy-0O
	for qemu-arm@nongnu.org; Wed, 23 May 2018 05:13:32 -0400
Received: from player714.ha.ovh.net (unknown [10.109.120.111])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 4EF97C08AD
	for <qemu-arm@nongnu.org>; Wed, 23 May 2018 11:13:30 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id D21F73C00BE;
	Wed, 23 May 2018 11:13:26 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180522173713.26282-1-peter.maydell@linaro.org>
	<d8c13782-48b1-0975-ee2c-0d2ec2eecebe@kaod.org>
	<CAFEAcA_3P-JEsiz_3ZdVhG2kcQ+Y3yOAufLQtHknuzufRosANQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <013774a0-6ec4-7a37-79c7-d3068b4cc5bc@kaod.org>
Date: Wed, 23 May 2018 11:13:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3P-JEsiz_3ZdVhG2kcQ+Y3yOAufLQtHknuzufRosANQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3510837388035721987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrgeeggddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.34.1
Subject: Re: [Qemu-arm] [PATCH] Correct CPACR reset value for v7 cores
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F6lWden9/BJD

On 05/22/2018 09:26 PM, Peter Maydell wrote:
> On 22 May 2018 at 20:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 05/22/2018 07:37 PM, Peter Maydell wrote:
>>> This is sufficient that a save-and-reload while the romulus-bmc
>>> machine is in the bootloader will work. On the other hand if
>>> I do a save-and-reload after the kernel has started booting
>>> then we get the classic "guest hang after reload", so some
>>> state is still not being transferred somewhere (probably in
>>> a device in the machine model?)
>>
>> I see the problem. Bizarre.
>=20
> Usually it means that something in the path from timer device
> through to the CPU has failed to save-and-reload the state
> that it needs to, so that when the timer fires post-reload
> it doesn't actually cause a CPU interrupt. You can probably
> debug by putting a breakpoint on whatever looks like a likely
> timer device's 'set the irq line' function and stepping
> through to figure out what's happening.

OK. I will take a look.

What is bizarre is that the romulus-bmc and the palmetto-bmc
machines use the same timer controller model and the same Linux=20
driver. So only the CPU type would differ.
=20
> (You're not using trustzone, are you? I know of a bug with
> migration of cpus with TZ enabled which I'm probably going to
> look at later this week)

The PSR is :

	PSR=3D20000093 --C- A S svc32

'S' for secure. Is that also trustzone ?

Thanks,

C.=20
