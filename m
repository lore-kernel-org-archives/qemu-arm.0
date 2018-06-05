Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp964416wrq;
        Tue, 5 Jun 2018 06:44:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKqjctAK8soPxKa+/Bh9ULjRh4iANG7kpqyZWC/i5EP62oGD/NZt/QoQMb/Q7400hVX3Pbr
X-Received: by 2002:a0c:9308:: with SMTP id d8-v6mr23894139qvd.191.1528206267955;
        Tue, 05 Jun 2018 06:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528206267; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3jWFIDbUDkSVvfqnb/FPsNZuR5lJNNXHhZxf2txbdVN8nQyJ2p9UAj1ThoPq3OBhN
         Q9wub2EngSDLD5BmrRVJdo2AsbWR6NkG4s0eenomqoVK03cxJzHBHDGO5fd2kAyxkzLW
         84Znd4yTawV784JxN3Yxh43E4Ng1P/wGQRz8cxLHb8bbR0ppi49SrO3YQqDlfM2UL8Sj
         8P/jX8wmUmv6nWw6sx8tMVEUwB9JtM1HULMvc6/YLo5pomjEf1aNdYl+EFXo2ab1e1rL
         GbPOs+JDv2faio/fkc7pjVmbtfLfQ+KWB4TwJzg2JcZjrEamYN2yM+8JClktSUUVFYrt
         z0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=U35P5RcaM5ytgKj2Iba42DNqYA1gomACrpQ5GhaC6co=;
        b=um8t8yYtObg7E+6ut5HctQEXBn+ckI5IXECDzSH/UgwjBGw4maZ0KOM1RKlpR5HJsr
         KH40BOcOiepwmqMQT6FhytNxhr2yWp1a66fmCUYqk/nspfphyuxZwnfSHjeYyWeSzXjr
         YPXRI6LtQMDa33fhG/yjtksksWNxdoekGv02SlGa3XWXvWLAKB4KwG9nCgwYwGVm/v+b
         svuVhTSf4GRWg0NjcL0mjYq5B8fR8/6xnx8Ik9sXDWNPRiB6YMS9yrmh7sKlj9AG8gpg
         lncpNdFSfExVwu84fxx9eBOg8arVBm8VRIv+mZf8++fbzmjn1OofI+VTvciYZNZ1PPHT
         fcCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si4996199qva.53.2018.06.05.06.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 06:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQCGB-0007JF-FO
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 09:44:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fQCFt-0007J4-W3
	for qemu-devel@nongnu.org; Tue, 05 Jun 2018 09:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fQCFq-00027R-3I
	for qemu-devel@nongnu.org; Tue, 05 Jun 2018 09:44:10 -0400
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:38729)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fQCFp-00026r-Se
	for qemu-devel@nongnu.org; Tue, 05 Jun 2018 09:44:06 -0400
Received: from player732.ha.ovh.net (unknown [10.109.120.11])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 35BC2161373
	for <qemu-devel@nongnu.org>; Tue,  5 Jun 2018 15:44:04 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id 2F9FB200BB;
	Tue,  5 Jun 2018 15:43:57 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180530075002.4618-1-clg@kaod.org>
	<CAFEAcA_a+nduAKWhLiwoKvoybL+cKN=51xV5M9f-VatPdbnf6w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e4840353-abf9-868f-20f1-3f07d13b84c8@kaod.org>
Date: Tue, 5 Jun 2018 15:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_a+nduAKWhLiwoKvoybL+cKN=51xV5M9f-VatPdbnf6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10638065271636003767
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrjeefgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.59.196
Subject: Re: [Qemu-devel] [PATCH 0/4] aspeed: add MMIO exec support to the
 FMC controller
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PadCTFtsidF9

On 05/30/2018 02:40 PM, Peter Maydell wrote:
> On 30 May 2018 at 08:49, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> When MMIO execution support is active, these changes let the Aspeed
>> SoC machine boot directly from CE0. As there is still some
>> issues, the feature is disabled by default and should be activated
>> with :
>>
>>         -global driver=3Daspeed.smc,property=3Dmmio-exec,value=3Dtrue
>=20
> I'd really rather not add another mmio-exec device until
> we've sorted out making it actually work properly...

Could we still take patch 1-2 which are good model cleanups
for the flash controller ?=20

Thanks,

C.=20


