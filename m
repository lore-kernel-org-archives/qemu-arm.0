Received: by 10.223.159.74 with SMTP id f10csp6361464wrg;
        Thu, 14 Dec 2017 06:11:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBosnafsjAfCk6DNVVaBEk6hccCV6gaGus1Vbrl2y7DBzCTRBCPlv1JsUpLLc2q4CRTs6dE1/
X-Received: by 10.13.214.130 with SMTP id y124mr4374683ywd.234.1513260706670;
        Thu, 14 Dec 2017 06:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513260706; cv=none;
        d=google.com; s=arc-20160816;
        b=CMDP2yj3Ddpmvwd0xKAJw6j/uNa1OTMZILBQuhKS9Fw4VZZ12gWDjBdKThCu49DLk/
         9/df/KhwiplwUcfJKs7POzh/L0/JSENLh/W2jO/0tUqmeyM5GRrpOFn6sv/IcFiWVTLO
         8qkFjWGY9rNH+UwUtNCuMHtq7bC98juFxsg3K/i7+f0QFDVmsBzCFe4Zd28PjnNeXGd+
         kWmZ1HcZEmYH3T8eveNCsF80j+36KfDJUriJ+6/1EvA5znsKYtEMWGGpmJ14CC3SJKPr
         g/f1FQNd56rAbdWrRy5FVk1EHWMRZFrFJtE4dfQaTelWPmFaYEtje1BdPYM9ChcIugdJ
         NvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=MgT9LLbKiAp9cQrtEU3RlC+lYsNOuuxF6vJon/tJJdE=;
        b=jT/9BWixkc4LHdxCaMLqEDnLO76mV+ycZ5vHO7S4hOjhoyvtplWDroRhXKDTVst7+y
         Hllik2BmuTmt08axWDn1mjZh0ol3oA7EA04h5pYQDnxcpQh0v05wbyHb3oX9bb/rR4K1
         EyLxamz0pCGr2pYT9RvLplER/3hn2waTFDsEjBv3xWTGfPd5wVbc+RY+HYjvwtikKJ5M
         zn4oBTZ4ihRngnStygqptOonOIF13eBWq0CSxj89a1JTelcXlH8Ah1MUqvlHzAFNs01j
         cfS2kR5lbWk4kC0fRyKXzGNStsgy2Wxz3PHxaV0LHBiGkDnLr4lr+Yqr1e+anJoZ9yGm
         cZEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jX9EymFe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2si381561ywe.469.2017.12.14.06.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jX9EymFe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUEk-0001Yj-3R
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:11:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUEZ-0001Xd-Lu
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:11:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUEY-0007aC-OA
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:11:35 -0500
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:45658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUEY-0007ZV-KD; Thu, 14 Dec 2017 09:11:34 -0500
Received: by mail-qt0-x22a.google.com with SMTP id g10so8014377qtj.12;
	Thu, 14 Dec 2017 06:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MgT9LLbKiAp9cQrtEU3RlC+lYsNOuuxF6vJon/tJJdE=;
	b=jX9EymFeTNSnKXMIVA7dFSntPiDBZNpm5esVmQjoJKI8rlL7+DcdhyFCc1mBe5G90a
	ifRJUZrBNTfGd6JWiteGrtpKjla3txIVeYDJnjVT1v8wtFDog4wq1eMYbpCFWZt1gw7W
	xxXXJIKP95RY3zKOTwFOdibY5oNt1wh5tLLiXIQ1mv2H8w4RCAXeZBdmwkWZJO972Yr2
	kW28yWRqqBosrgc0nxE85jfdq+Sbd6UJAKGcjbD8ORasHmRpu7uQR6cTbaVjxcP0Ycn/
	EAERcWez0GfrJHDMXsDRju0sK67Z9yBesOxhTSvEsSdEaQ9eJ/7HOuEH+8txZKlLB40X
	Vyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MgT9LLbKiAp9cQrtEU3RlC+lYsNOuuxF6vJon/tJJdE=;
	b=l+Sb/WwBXUh7PrqqwCC9Xc/lTCcoZlZNX0wXTsJdD2bCFuzT+jOUX8wgwQX/lpEqGb
	t+TjE2hbZYHOhREXaoxaZ1IF9ImDEYLvK0riF14MVeTGucRsUi04zU6K0qh6E8XuTb5I
	77+hTY2Lu6uxF44OzZSbrVj443HN5KoWxN4LoMEnSgdMIQFwIZB40Ged3J8ooZ6s1WGA
	NKBnSyBy2TadywbpSWvIT/iCJILMd5RnMn1hTImpXplf3p10qUY++xlfWkqw/AGfq9l3
	Ypwuik6a8n9QVYK5HLAP3PWkViI5PwxYM5l5njg+fRVGFROttoaRkOOn011VpdohaFS8
	FFiQ==
X-Gm-Message-State: AKGB3mI9mCB+ck5I55n2+1S201xQeicJT/E8rMIaTIXC1yDvsM21QnvP
	Mwxd+9Un/dMX/yUdiZG5rxqQOwZmn8unnQG5Zes=
X-Received: by 10.200.20.152 with SMTP id l24mr16430485qtj.31.1513260693910;
	Thu, 14 Dec 2017 06:11:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Thu, 14 Dec 2017 06:11:33 -0800 (PST)
In-Reply-To: <af0b2841-feb6-cf3b-ac7f-4b681916ee10@amsat.org>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<CAFEAcA-gEjU+rBWSL8V4d520DOVheZoJZ76p5=9hmkXk3NqeOw@mail.gmail.com>
	<af0b2841-feb6-cf3b-ac7f-4b681916ee10@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 14 Dec 2017 06:11:33 -0800
Message-ID: <CAHQ1cqE+4igRM3mtPP+SkwfCpa7kiw0qwqdkkzQBtf+SV4a_Wg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: Re: [Qemu-arm] [PATCH 00/13] i.MX FEC and SD changes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FSfXfixN+CpO

On Wed, Dec 13, 2017 at 6:09 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Andrey, Peter,
>
> On 12/12/2017 02:40 PM, Peter Maydell wrote:
>> On 11 December 2017 at 21:29, Andrey Smirnov <andrew.smirnov@gmail.com> =
wrote:
>>> Hi everyone,
>>>
>>> This patchset is a spin-off from original i.MX7 support submission
>>> found here [1], containing all of the patchest that are more or less
>>> agreed upon and are ready (hopefully!) for inclusion.
> [...]
>> Incidentally we should use the new i.MX SDHCI controller in the
>> imx6: coincidentally somebody ran into this bug recently:
>> https://stackoverflow.com/questions/47538951/qemu-freescale-i-mx6-dualli=
te-sabre-root-filesystem-does-not-mount/47552596
>>
>> I'll retest that this patchset works with my imx6 image, and
>> send a patch to sit on top of it to switch imx6 over to TYPE_IMX_USDHC.
>
> If you don't mind, I'd like to take the patches 12/13 (SDHCI) and adapt
> them to the SDHCI series I'm working on, to avoid a big diverge/clash.
>

I am fine with patches going in either way. I'll submit a v2 of my
patchset and if we decide to push SD portion of it as a part of your
work, then you can just pick those from there.

Thanks,
Andrey Smirnov
