Received: by 10.25.0.6 with SMTP id 6csp1635686lfa;
        Mon, 29 May 2017 20:44:12 -0700 (PDT)
X-Received: by 10.200.8.187 with SMTP id v56mr22852222qth.213.1496115852188;
        Mon, 29 May 2017 20:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496115852; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0SVyAXhyLfk1ZBTJskobUjXYp2dTtHmRxcP1iGxBiBLM3mJS2/WRWmwqiU2us4ovR
         im488q4FKJwmbEKiQxqlBS0Y3fSQgzaLvkk+F5MSRe3hvKX/W2vBbHf4RJ3e7cQcqz0y
         rOJf4KVM5CtPVVNQAk2b+fZiZY7w6zuIBjkqXKseepJ5NllyffvC4eEJRcQNf89Q0DJP
         JKbo3IOk9PkrmU7oFTEfKkwv/W7dVKfzPMHeXM46xjyf2MbMb6kU3CmPO/nwB0phNdwy
         VJzr2faiVr1xCERfh21p9h1WIVJN+xZZEc/PMm1lUvLcwcseXsEVBfez0vlnYNsiSWB2
         Q6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:date:from:message-id
         :content-transfer-encoding:mime-version:in-reply-to:references
         :dkim-signature:arc-authentication-results;
        bh=GVZDww1JEBC8Yh0+hVoPlQQ6KcFJwaSA22Kv95fhXv8=;
        b=uoki2uwHfUHSL1dIy4pDSTr3FdBPnQUXFHgygpJ68cd+aSxt98Zhda056PYkSd6O1d
         YaVoV0JFALUVveI2xkrg5nvhxAFAez05w+npKAsL7gI8TVJ7eBROUCydEv5vEsDTkog7
         diuAgTOjLz+iVr/HO+BwOQNB6jj1VjFXSKN2Bcs9Bkhfjgx7AfZKjYB8vNx4J+lg6SHD
         qIj3GOvQaoPhZa0Sf69hU52R2zPdXxaxLTR7Ia2GzjlWnkNSaMxA7rU5MJakz0/iRUYX
         L+ifvYvvQDY5vb+d1abdOUkaElnO9PvPol0+DzcXQNV8oRBG8fAKTP907cHCRcmXblq/
         1AAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si11576887qkf.3.2017.05.29.20.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 20:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFY4p-0000BF-Le
	for alex.bennee@linaro.org; Mon, 29 May 2017 23:44:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dFY4g-00009t-96
	for qemu-arm@nongnu.org; Mon, 29 May 2017 23:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dFY4f-0001Gm-AS
	for qemu-arm@nongnu.org; Mon, 29 May 2017 23:44:02 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dFY4a-0001GT-QB; Mon, 29 May 2017 23:43:56 -0400
Received: by mail-pf0-x244.google.com with SMTP id f27so14891319pfe.0;
	Mon, 29 May 2017 20:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:message-id:cc:from:subject:date:to;
	bh=GVZDww1JEBC8Yh0+hVoPlQQ6KcFJwaSA22Kv95fhXv8=;
	b=nPOlaynEyQEvMjSZTWbWw6cYV6GS+COU78ljsvV31y73NWfSatty3VRTuiFEW0YOCe
	VfOMWUGPmcZsNcCvHkL9CXJj1o//AdEJbgy6zwTFi8BnUaoMeLzTNw9xh1n9sA1uoVry
	lue5sDxlxxH75FbGdjtLhzx8jA+AcYmq3fRCa2tMTkTvErPw6p/i+Y3Lidlwirvb0ffG
	7HObpSO+w97kshc5LPAqSOebSV4Uw1ZdXg/uNXCfQT2JJiPuZ5y1ucEeQ3p2KmtzotKN
	/b5qy8U54mB9onOH/TpYoYYWjKAEjnWhx4nbsq4njwNrvciYSGKAX8A3tDYxtB9axiJf
	Nuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:in-reply-to:mime-version
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=GVZDww1JEBC8Yh0+hVoPlQQ6KcFJwaSA22Kv95fhXv8=;
	b=SEJuCEOtTHzeGiM/3GKPdLy7Tz31DXp/fq8a4hUWAKR8AVxkzWezK+ABltQZsRinCG
	pz9RJENak8sb3HqYL4HNYK3PuhsCrI8Ifv5VbrRW3JiJlgZMguT3fze3neAT3pH1LMMf
	r+uqX2maFFU/XGJhI/KJwVn/23KgcGJ+nRZOhdp2vo0bq1rMUOWDjaPde66KTpChe3Rj
	9/UR15t/kkfF+b5bVSFPyu+MyWvQAnVrYwEDBX1g9tOKg37pPgcl1afq0/woChanCJtA
	IGncZEHLNKx0Y+oO0eWwEvbbS2Y2Vah9g68y0JLU5PRCmVhknwQNuIN2bVh61iSZM2gS
	79IA==
X-Gm-Message-State: AODbwcBB48frcFcP6hxDPZfj1j+3NcUIZv1MDauXACBuXo9yf0yyjWl4
	x/7dnz4ziAqREQ==
X-Received: by 10.99.110.202 with SMTP id j193mr22583392pgc.141.1496115835289; 
	Mon, 29 May 2017 20:43:55 -0700 (PDT)
Received: from [10.6.0.169] (li982-213.members.linode.com. [45.33.32.213])
	by smtp.gmail.com with ESMTPSA id
	k86sm18996103pfk.125.2017.05.29.20.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 May 2017 20:43:54 -0700 (PDT)
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
	<20170526132114.6edc006e@nial.brq.redhat.com>
	<CAD8of+pw5Nh4oSkTuYX4fbJvA8=-CTmn6dgdXHPLERAcQM+Oyw@mail.gmail.com>
	<20170529124339.43eea1c5@nial.brq.redhat.com>
In-Reply-To: <20170529124339.43eea1c5@nial.brq.redhat.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=gb2312
Message-Id: <1B0ED5FF-7254-41AD-B53F-B7EE201C2A15@gmail.com>
X-Mailer: iPad Mail (14D27)
From: Li Zhang <zhlcindy@gmail.com>
Date: Tue, 30 May 2017 11:43:54 +0800
To: Igor Mammedov <imammedo@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/3] arm/virt: refine virt.c
 code and implement hot_add_cpu interface
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Li Zhang <li.zhang@hxt-semitech.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SgOwM975pJXO



> =D4=DA 2017=C4=EA5=D4=C229=C8=D5=A3=AC=CF=C2=CE=E76:43=A3=ACIgor Mammedov <=
imammedo@redhat.com> =D0=B4=B5=C0=A3=BA
>=20
> On Sat, 27 May 2017 10:32:33 +0800
> Li Zhang <zhlcindy@gmail.com> wrote:
>=20
>>> On Fri, May 26, 2017 at 7:21 PM, Igor Mammedov <imammedo@redhat.com> wro=
te:
>>> On Fri, 26 May 2017 17:21:05 +0800
>>> Li Zhang <zhlcindy@gmail.com> wrote:
>>>=20
>>>> From: Li Zhang <li.zhang@hxt-semitech.com>
>>>>=20
>>>> virt machine doesn't support hot_add_cpu interface. This patchset is to=
 implement
>>>> hot_add_cpu interface. A CPU can be added by QMP command with QEMU moni=
tor.
>>>>=20
>>>> Here is command to add a CPU with QMP command.
>>>>=20
>>>> * qemu-system-aarch64 -machine virt -cpu cortex-a15 -smp 1,maxcpus=3D4 \=

>>>>    -monitor telnet:127.0.0.1:4444,server,nowait -nographic
>>>> * connect monitor:      telnet 127.0.0.1 4444
>>>> * execute qmp command:  cpu-add 1 =20
>>> cpu-add command shouldn't be used for new cpu hotplug,
>>> pls use generic device_add for that. =20
>>=20
>> Ok,  I will drop this command and look at device_add.
>>=20
>>>=20
>>> The last time I looked at it, virt machine needed quite a bit of
>>> re-factoring of the way it creates/wires up CPUs. =20
>>=20
>> Yes, I am looking into it and see if I can do something:)
>>=20
>>>=20
>>> Pls see usage of following callbacks for example on how to implement
>>> device_add based cpu hotplug:
>>>=20
>>>  get_hotplug_handler
>>>  pc_cpu_pre_plug
>>>  pc_cpu_plug
>>>  pc_possible_cpu_arch_ids
>>>=20
>>> and pc_cpus_init() for initial cpu creation with above callbacks in use
>>>=20
>> Thanks, I will see it. :)
>>=20
>>>>=20
>>>> Currently, when KVM is enabled and add a CPU with QMP command, QEMU
>>>> reports error "kvm_init_vcpu failed: Device or resourc busy". KVM can't=

>>>> create a new CPU when vgic has been initialized and irqchip_in_kernel i=
n
>>>> function kvm_arch_vcpu_create. It needs to change KVM code in the futur=
e. =20
>>> if KVM isn't capable do it yet, then qemu should refuse cpu hotplug if r=
unning
>>> with KVM accelarator and allow it only in TCG mode. =20
>>=20
>> OK, I will add an assertion to allow hotplug only in TCG mode.
> instead of assert which will crash guest on hotplug,
> just disable hotplug gracefully (for example set error in pre_plug handler=
)

OK, got it.

>=20
>>=20
>>>=20
>>>>=20
>>>> Li Zhang (3):
>>>>  arm/virt: Refine fdt_add_cpu_nodes code
>>>>  arm/virt: Refine code of machvirt_init
>>>>  arm/virt: Implement hot_add_cpu interface
>>>>=20
>>>> hw/arm/virt.c | 344 ++++++++++++++++++++++++++++++++++-----------------=
-------
>>>> 1 file changed, 202 insertions(+), 142 deletions(-)
>>>>=20
>>>=20
>>=20
>>=20
>>=20
>=20
