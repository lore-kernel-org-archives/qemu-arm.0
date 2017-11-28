Received: by 10.223.159.82 with SMTP id f18csp2798361wrg;
        Tue, 28 Nov 2017 03:57:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaraHH2l+HU3tl78+t9wMfems+My7Gd2YIptML5an/nFsQkvP/bbKZTrD9d86VavCHtmiZM
X-Received: by 10.129.137.69 with SMTP id z66mr7612158ywf.495.1511870266596;
        Tue, 28 Nov 2017 03:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511870266; cv=none;
        d=google.com; s=arc-20160816;
        b=medj2yZk26lzctgdMgkNjkcj9SRh0FZaii8rrjZKuf/PtnE8gmdAgwMzgc1rZB+966
         G8Ej62kxSK2h2C1Akzn+BGbtRvLr6ITdREcRP0/E2XdE7EQLfT8hAlxpczvzrJWJ9ckT
         RcEKfDzUxndpFu7eLE8HwTtZ3txzVM3bXVUVwZQcYdDmD0wjnJcKyHfNwXVJ0PFHckCh
         PkDfhDNwaFeUjd2ts+2WnKwbBJKt4HECTdv7Mw8IKINoy5LHuYOslB0Y+DgClkLz+94s
         nX7RW20z8iteSG74Cx3G0mKBQQi9/b5840ahemiRoISEGvQDP73xEwq3z5UddyE4PFme
         7Rqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5ik3CQmZUbNM3h99c+KkK61PjgE1Ol0T6js2Z3Q/dDE=;
        b=EH+EwW1FqyCapbJRHom4K20813Lsz2wVYEj7DccqaH5IlACvvLAlR5Er3WukmhsHeS
         YYxC6G17qrkkLuIe0PYq61ddxdJ5D7rh8lywaCoQayHrB+NQBdxdrjFe8inXp+aBnoN2
         AbP04qz5UMiFT0DZfLMWuzI4r/EGahdFDxBTiGya8YojW/ZTgRREWRjO3mvfFvpaCUJj
         LsGgnGGCX2Q4anVhUkc2l0t4r1cWlZD+5ZqaKznfanKrTEdDFPV88LOgHL46f6nYcdIP
         FRTmdINLCaBj72VNT1yC3qQ2aDzgiH0AoupF8aVTAgvtME8FgIw1nMMBunNUz4cVgOJp
         bs3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQ9RiX2L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e68si6455159yba.96.2017.11.28.03.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 03:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQ9RiX2L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJeWI-0000EF-4D
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 06:57:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJeVC-0007Oh-Ov
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 06:56:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJeVC-0001LL-31
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 06:56:38 -0500
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:45515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eJeVB-0001Jx-T5
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 06:56:38 -0500
Received: by mail-oi0-x232.google.com with SMTP id v123so41686oif.12
	for <qemu-devel@nongnu.org>; Tue, 28 Nov 2017 03:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5ik3CQmZUbNM3h99c+KkK61PjgE1Ol0T6js2Z3Q/dDE=;
	b=VQ9RiX2LE0Qt/Zdn0mm6uqJqWpcaxCu03hhmi6Hq/mNKhlALJwaLWqCSyY48IO7880
	iiBt34pbd5Bf6WbB6TQ5ShOKA3zBe7m2GIizOXv4Kkx2Dtc8W7BN/AvzeN6SFLE2b4uy
	tUXrks78Enq5al/srZLOugiDNNQIa2zjm8fMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5ik3CQmZUbNM3h99c+KkK61PjgE1Ol0T6js2Z3Q/dDE=;
	b=Pkha15guLo4Phe1acFNkZ+UlfogJc27vOyzH17c8y5bbvcJMRRW1I20DYZQ1DUYMUH
	EEw+jlajkVYIrPhCEK3XL31RLKRwCjEEfoeWLcV2T6fb0F+TWU60jCLLMIiKE24qkuc2
	Q3RJs7IBuoL2owbkjz6Nwe75xX34vv4Utvzni2vfPMRuJdTgkbohph82KHykasqTWY3z
	RW5R5TcXmDKxYqMZ6gZHShlz57yltzGrgKYoTzq0NO5IB0441GyCVSBuG+5beUgp+jA7
	cXuXffUjK0k9/exTl8+r1Jij33PXp1NgpcPpdZRlGcouxTmGl99y2f6YxJf7bWXrgpV1
	RLLw==
X-Gm-Message-State: AJaThX79RuRAIPI06twOzcDRfeL1OXM6QA2Yg9vjJ8dbWRWVBki0tH+G
	OtqsXJWS1QannAvq9Gnpz/Mq4iGUfoelDwaw5CHLAg==
X-Received: by 10.202.199.134 with SMTP id x128mr28499135oif.63.1511870196737; 
	Tue, 28 Nov 2017 03:56:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 28 Nov 2017 03:56:16 -0800 (PST)
In-Reply-To: <CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Nov 2017 11:56:16 +0000
Message-ID: <CAFEAcA8iM_Qq=OMr_eo_MnUphzinrfhYNJtmuXx9nkK979H3Rg@mail.gmail.com>
To: bzt bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::232
Subject: Re: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7wzJDbA9Ar4p

On 28 November 2017 at 11:26, bzt bzt <bztemail@gmail.com> wrote:
> (Although I have a question. I'm not sure what's the preferred
> way to get MachineClass* object in bcm2836. Use a MachineState* cast on it's
> Object* argument with MACHINE_GET_CLASS() or should I use the parameterless
> qdev_get_machine() instead?)

bcm2836.c should be a self contained object, which its caller creates
and configures. The MachineClass is the board model object, and the
SoC object shouldn't have to access it. If there's something (like the
CPU model string) that the SoC needs, the SoC object should have a
property which the board model sets.

hw/arm/stm32f205_soc.c has an example of this (as do some of the
other SoC objects -- 'git grep cpu-type hw/arm' should bring them up).

thanks
-- PMM
