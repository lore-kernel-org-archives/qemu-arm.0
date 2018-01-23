Received: by 10.28.71.27 with SMTP id u27csp4158702wma;
        Tue, 23 Jan 2018 07:10:25 -0800 (PST)
X-Google-Smtp-Source: AH8x225InTk+F/i0+/wmc3yatf9qtNCWIWKIUwIIu0CSzr3fu/yyDLYE6rxWlhGmRJ/Y3EiT2F1l
X-Received: by 10.37.171.43 with SMTP id u40mr2778489ybi.393.1516720224954;
        Tue, 23 Jan 2018 07:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516720224; cv=none;
        d=google.com; s=arc-20160816;
        b=XOaLufjjnW3dCAvQYTqj2j9GOQZxMvS4q+rpYjnjhh/wTSzbrALbCmM/DUoi15bMrH
         g3Ep/RlIuBQA/Q7FblE2aWBwPdXBwJTCQJ7ra2GHCD9uBw1ovyB0l25dNIe5o+7OSKIS
         KnExrbdG96jr9jTPz9mOJrxD3a/gbbIBaHS83FumDwx5gHbfl7VTvsVyfovYcR7x/AxH
         5Aae803+omQHOMZwMXceAtCagt967yzwDuclR1tgO8wShRSMhU8wAWAHlLgjBa8V4Ikq
         n/A7toMukgCzgbdkj/pNtZL8Agx7HbR4Q4RBVOQNavTLpA1BR0dF4YV1EAyyEnFQxDBp
         l5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date
         :arc-authentication-results;
        bh=2MZlNY6nNpW83Ppvz2fML0I8OHNAnrq81XUBw7MESyg=;
        b=R54vIZ0zzSmIVZe+K5MkdRUCOO/oiHk/HgNZH+FtCymcnVMT1Qxxwdhi1C+wNKs/Th
         GabZ9EdvTTGwXpGkxr2dMnJ6F+VKMlp+3pMG6vqsNFWsUAa1fns8l71XuBKMWZl+CwMb
         Myq74LW/HSF9Mm1MixccBwsQ/uiJZ1UY8QZv0h3caVbXA5gbYRv+8ZNKowR6Y6waYpbi
         y3yNchPLAM8emKDdEMhQ7tOkH34Z3fpHhhEoaee/POtRGTjkz4AzVsNB8zuPKFTCibtt
         1my/P84kpn7/sAUUin//+a4mKx+WgFiHeyP+571i6jmgEtpyL33VlslRCKDlgMkXLDLb
         m/pA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si2414097ybc.34.2018.01.23.07.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:10:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee0DQ-00073a-EV
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:10:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ee0DD-0006zz-4o
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ee0D7-0005cM-H4
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 10:10:11 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:40540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ee0D7-0005Qx-6z; Tue, 23 Jan 2018 10:10:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E2F027456AF;
	Tue, 23 Jan 2018 16:09:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id C4ED37456A5; Tue, 23 Jan 2018 16:09:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id C41347456A2;
	Tue, 23 Jan 2018 16:09:55 +0100 (CET)
Date: Tue, 23 Jan 2018 16:09:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: bzt bzt <bztemail@gmail.com>
In-Reply-To: <CADYoBw36gPOyiK36WaS0v_2R=iuWYL-sQAtffrZZJU2DpMv5Bw@mail.gmail.com>
Message-ID: <alpine.BSF.2.21.1801231605460.67737@zero.eik.bme.hu>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
	<MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw1Ro5gxROvhCVXGv0=-Y8zXmGbKR3D6xOqhkb0zp__LkA@mail.gmail.com>
	<CADYoBw27wU3CsYPeP7ONFWt4aj+6tvzwU5roDSOKz8qq1n8GSg@mail.gmail.com>
	<CAFEAcA--i8RVKaBw5yXn4xRXBy5S+Yk=WDNKbuqzfDxn6jjtOA@mail.gmail.com>
	<CADYoBw36gPOyiK36WaS0v_2R=iuWYL-sQAtffrZZJU2DpMv5Bw@mail.gmail.com>
User-Agent: Alpine 2.21 (BSF 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChvVoQnAx2CE

On Tue, 23 Jan 2018, bzt bzt wrote:
> It is not annoying at all, it's simply silly. Are you really thought I
> would do *your* job?
> "Only two things are infinite, the universe and the human stupidity, and
> I'm not sure about the former!". Actually I'm very entertained :-D :-D :-D
>
> But seriously, I've showed you a way how to add raspi3, the rest is up to
> you. I won't do anything more about it, I'm not a paid qemu maintainer
> whatsoever!
> Again, my patch is working for me, it does not broke any existing raspi2
> machines, and I'm very happy about using it for more than half a year now!
> These are the facts, everything else is just talking.

OK, sorry for trying to help. I'm not a paid QEMU developer and don't use 
ARM emulation so I don't really care about it. Please exclude me from this 
thread in all furhter correspondence.

Thank you,
BALATON Zoltan
