Received: by 10.223.150.237 with SMTP id u100csp4775439wrb;
        Wed, 15 Nov 2017 05:14:06 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ4/ajc215PJqwKUQyz6+AmupJVPzMekEK2KgPFwrCscBYoZ3uzsH50UbKrMzYY6V1PPj7E
X-Received: by 10.129.102.8 with SMTP id a8mr4570650ywc.22.1510751646094;
        Wed, 15 Nov 2017 05:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510751646; cv=none;
        d=google.com; s=arc-20160816;
        b=kBA+KkJG/HnXq2UYrhGPxdDE2GJLlB+imUmr0lfjtqd6DKWW878AfDRbumdSBh7esL
         nES7DmOcSFV3e0F+FeZQTwC3bugulUC/u7Q1lfEjwEARvK/9mB1cBr5ZJYncUkud6rxO
         ClsrcfjVb7h/YZM/GLPZTs8zT74yWvp6oBXJH+Yd3A8WSfuvGbGkNsBXZ/ATJGwuftsL
         iQZcqrZ5z+Li+hus1DSVEDDL3w1Za1CHXnTQGYSdK6F6ACaITd7R6TVGcgeeBQPDQIwl
         uxx0jSGwew0+DnhZZKMkaxnTgYu9yPp4e4lpOO7Vt/Bo2pX2r6ZQNuMusUtg1v8y8SIJ
         Gw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=XimuKePKYc3djinDeoD5qB2fW3QgrHMVUePCuYcJxa4=;
        b=R7qjhhmrsbl0u/TgzPJnPM5vofEYENFAGLAzWcko60cXQkv4xbdzA3pd556gW4mbZs
         h3DmpUpT/bUbe9TaDW4X2/qAT9/PXM2UWXIUPGd2CjFLUijb5EZjECz2t+WTxCiqZiaX
         QfpSDitkaPJz3x4Om6MzraK7uptGd7xUcXtcuMKfysI6yBoiFOwgBZsiHrpmpD6KMXPh
         IORbCX9uzrf2WvHN2E8OSyx0bzq4EVPp83J8wiUsGv4uzWFXqRpw8hnmzL+uACQBUT5N
         Qc/izQgjRY+4yUD47Kk2ZFlkQkgOyyRIkfZAJdiXUE+SW2uQs6mlrxZDx3H9iD2L6RJG
         hafQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si4874548ywi.23.2017.11.15.05.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Nov 2017 05:14:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eExW1-0007NV-Gv
	for alex.bennee@linaro.org; Wed, 15 Nov 2017 08:14:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eExVn-0007J9-6L
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 08:13:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1eExVj-0005ls-4Y
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 08:13:51 -0500
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:55232)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1eExVi-0005j9-UO
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 08:13:47 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5EF37A8645
	for <qemu-arm@nongnu.org>; Wed, 15 Nov 2017 14:13:33 +0100 (CET)
Received: from zorba.kaod.org (deibp9eh1--blueice4n7.emea.ibm.com
	[195.212.29.185]) (Authenticated sender: postmaster@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 550331200AF;
	Wed, 15 Nov 2017 14:13:26 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171114122018.12204-1-joel@jms.id.au>
	<27983ce7-8de1-620f-ca06-ee4f92dab180@kaod.org>
	<CAFEAcA9udAJpnJVrkPcS9TrM5EAxPHn70tAjM5Bvr7HvUrqY=g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <724beabe-ce0b-1b51-f902-041fe75db794@kaod.org>
Date: Wed, 15 Nov 2017 13:13:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9udAJpnJVrkPcS9TrM5EAxPHn70tAjM5Bvr7HvUrqY=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4430416134376033195
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrjeefgdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.43.205
Subject: Re: [Qemu-arm] [PATCH v3] hw/arm/aspeed: Unlock SCU when running
 kernel
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5mungzzYPRaO

On 11/15/2017 11:56 AM, Peter Maydell wrote:
> On 15 November 2017 at 08:18, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> On 11/14/2017 01:20 PM, Joel Stanley wrote:
>>> The ASPEED hardware contains a lock register for the SCU that disable=
s
>>> any writes to the SCU when it is locked. The machine comes up with th=
e
>>> lock enabled, but on all known hardware u-boot will unlock it and lea=
ve
>>> it unlocked when loading the kernel.
>>>
>>> This means the kernel expects the SCU to be unlocked. When booting fr=
om
>>> an emulated ROM the normal u-boot unlock path is executed. Things don=
't
>>> go well when booting using the -kernel command line, as u-boot does n=
ot
>>> run first.
>>>
>>> Change behaviour so that when a kernel is passed to the machine, set =
the
>>> reset value of the SCU to be unlocked.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks. Should this go into 2.11 ? It sounds like the kind of
> bugfix that ought to...

Yes. Please.

Thanks,

C.
