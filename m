Received: by 10.28.91.67 with SMTP id p64csp1297212wmb;
        Tue, 13 Mar 2018 16:45:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv69qxHijK2ZyR2wfcr651THJDmnF82m94Wvzk+KXx65mK/3QUUHhyU3V+Lsv5v1/5OWoXD
X-Received: by 10.55.19.102 with SMTP id d99mr3584288qkh.355.1520984758185;
        Tue, 13 Mar 2018 16:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984758; cv=none;
        d=google.com; s=arc-20160816;
        b=Gv5jK68LT3K3eMtXm/tjR42pikV4dBasZy2zbzWcztZuQspiUzas8edoH7+DzoQaak
         Sb66LmfDrwpB6/1ZNOL/RMJwd3fJ3bMhDwvLEjLbu3zn9zqgHPLCDaNIJBpVvJ/hCFON
         92nWlVq2l78E2VvWIgQBqlBmV3hnOpbriMblhyvPlk1/BwS+x0E5u4Td0rWjTHXQid0K
         HIE7k+buIBQDzS5+SMSIHZO6fSjwdEttCQHNI3y7al2b6rtFZYm4qOiPw0gyBiBrNxGR
         IcG5/hyFZi9W+jgSlImFxaemi86+di7EnrvsufnJFCaOnrWFRiArfjeieAvn15/Ygk1S
         O2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=p6CeBZyQdlSyYfYnZiEnZr5tAKrn9fambR6Djb85xD4=;
        b=HIH3O7EBJz5Gt1rhcjRhQomHB9rRxSC9j7O0IMFV6GpqAoF8NBgR6k7AehvUcAFhH1
         farBk2sTzvR5OF0YIdYPXIE05D1Cnu+7VYelOtNNlIJ2ziBEWM5QMtcPNiMQCDKXJwfz
         dT3de1PQrG7POmiS799ZTSJkrIIqdg5CmlzG5ovAeIBficLpDzt2tMIvP3/hEC8rPxjC
         GX5e7DWe4wuXLwDz699B5Alk5XJrt8VIagUSY09Izspiny9q8FWZ4HNwxGNUPMGIYZ2Q
         +Ha1mzduNV7m5Nwn+02rBj7sIdXH4E9+YzvdX8gQ0sbQ78Jec0pIJVTTZ5ikwKCuf3RY
         1TXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pMcebihi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e29si1353204qta.14.2018.03.13.16.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pMcebihi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtcD-0005v7-JJ
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtA0-0004PD-24
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evt9y-0001JV-U5
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:16:48 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:33185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evt9u-0001H4-5D; Tue, 13 Mar 2018 19:16:42 -0400
Received: by mail-wr0-x235.google.com with SMTP id r8so2685530wrg.0;
	Tue, 13 Mar 2018 16:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p6CeBZyQdlSyYfYnZiEnZr5tAKrn9fambR6Djb85xD4=;
	b=pMcebihisOlReIhzl3Cr93oXp3DE4QsPgNXh6DMyM+9Y+Tt2qDxGrZHWrvP3StqImr
	z1av6TziQbyOGkWNnLjiwdVw4QEgmwy1pTLdkqtJH0N8BwqgFFp5/CqO/fY+J7TxiZbW
	mpA5g+0apLmg1aNMSlcAjeIHBZmeUEcBd1wxb6BzzjnJtIyINILsMtgexkB4DUCnjcjY
	QM+9JyNklPn/ym08aOjOD+yo4uVSenXJmArz/c71aVfHGFZTI/ZzCHEF8h3eoml1cdFt
	SjTeTRRutNJ9lhRnX3Xt6PJjOXSbH39y7dNbfYJnLLX1V7kMIFzRFQoAekXgGhVjyOHt
	2YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=p6CeBZyQdlSyYfYnZiEnZr5tAKrn9fambR6Djb85xD4=;
	b=qqMMqd2m7g/z3IMR3TXhKhKJghJAHg66fYOgqFv+y9XpuD5QNGEwyRMVyMYjq7bhRb
	AgA9SyzhVleuhaCCqFzxCiO0/BAKx648acOvJFr/wC5xfTQDBXTAcsQKM0gFTvjXYOQz
	1qWu6ZxImgCXmMXPa5Kcq/tHI0BapvSBGVHBY/4Wo4ErA/DMmbV8Xpg3njRFr0IUKLY6
	PP6OrVLVs8ZbqQdczgZCeA0NyA/dWbuPIn0tS8XBDeOGaGQEXeSYz4qsuaHzR5GOpAOr
	UK8Nq8Yj+dAULf4KEPR9M9YNXQyoB7pJdJ3wfjfiVYdXrhIRYJ/S557TfesDXCbxhnDS
	5IzQ==
X-Gm-Message-State: AElRT7FySi24nobyqBBvvaXhQT40bqw+MMdukNhGPztoJQFXqBbgKy5L
	w9PYQKPbeXgBqAMq/rwowmk=
X-Received: by 10.223.183.75 with SMTP id n11mr1918669wre.22.1520983001096;
	Tue, 13 Mar 2018 16:16:41 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65]) by smtp.gmail.com with ESMTPSA id
	c14sm1751584wmh.15.2018.03.13.16.16.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:16:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
	<CAFEAcA8O7EEhoS83eRLH5bVmog_Qu1tAgUzR6NsE+GD2a7FsDw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <837c5be7-a153-5a7e-8e2c-dccdb9945a4e@amsat.org>
Date: Wed, 14 Mar 2018 00:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8O7EEhoS83eRLH5bVmog_Qu1tAgUzR6NsE+GD2a7FsDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode
 correct CPU type
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aB7ueNaGcUh/

On 03/13/2018 06:09 PM, Peter Maydell wrote:
> On 13 March 2018 at 16:55, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>>> From: Qemu-devel <qemu-devel-
>>> bounces+andrew.baumann=microsoft.com@nongnu.org> On Behalf Of Peter
>>> Maydell
>>> Sent: Tuesday, 13 March 2018 08:35
>>>
>>> Now we have separate types for BCM2386 and BCM2387, we might as well
>>> just hard-code the CPU type they use rather than having it passed
>>> through as an object property. This then lets us put the initialization
>>> of the CPU object in init rather than realize.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
>>>  static const BCM283XInfo bcm283x_socs[] = {
>>>      {
>>>          .name = TYPE_BCM2836,
>>> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
>>
>> At some point I remember seeing a patch to change this to cortex-a7. Is there a reason we didn't make that change?
>>
>> (Background: the real Pi2 has an A7. When I first implemented the machine model there was no A7 emulation in QEMU, so I used the A15 which was the closest equivalent.)
> 
> Yeah, we should do that. I'd forgotten about that, I think
> things just got lost in the shuffle of having several
> patchsets that tried to change the same things at once.
> 
> I guess the simplest thing is to add a patch at the end of
> the series that fixes the cpu type for bcm2836.

Peter, here is the patch Andrew remembered (maybe can be applied at the
end):
http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg04286.html

> 
> 
>>> --- a/hw/arm/raspi.c
>>> +++ b/hw/arm/raspi.c
>>> @@ -150,8 +150,6 @@ static void raspi_init(MachineState *machine, int
>>> version)
>>>      /* Setup the SOC */
>>>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
>>>                                     &error_abort);
>>> -    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
>>> -                            &error_abort);
>>>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>>>                              &error_abort);
>>>      int board_rev = version == 3 ? 0xa02082 : 0xa21041;
>>
>> What about the default_cpu_type field of MachineClass set in
>> raspi[23]_machine_init? That seems irrelevant now...
> 
> Mmm. It doesn't hurt anything, though.
> 
>> Also, if anyone cares (I don't), we also just lost the ability
>> to override the CPU type of a raspi model.
> 
> Yeah, that's deliberate -- I think that letting the user randomly
> plug nonexistent combinations together just confuses people when
> they don't work. I guess I should call it out in the commit message
> though.
> 
> thanks
> -- PMM
> 
