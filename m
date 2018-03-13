Received: by 10.28.91.67 with SMTP id p64csp1297391wmb;
        Tue, 13 Mar 2018 16:46:12 -0700 (PDT)
X-Google-Smtp-Source: AG47ELudHZO3oRT6E5WFQ/DNZLDG0gqrPX0dfRcIZa04KTaqw8qKyowrJ8qTNF/304akbIfJMi8t
X-Received: by 10.55.78.134 with SMTP id c128mr3963663qkb.226.1520984772750;
        Tue, 13 Mar 2018 16:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984772; cv=none;
        d=google.com; s=arc-20160816;
        b=tk4cwoMFWBYuPLcpzaMvyOZehh4NemMP1r+lhzyRNSLmt0CppyKd37TyYr7iOf5yqb
         phgV7fyRN8Kom8QTR67YK45hxc7zzsTfhnCVOmX7y7GoeCZ/qPaMY/YZ9Qj4i46MuTQe
         F6tNeD20cyBGhwy+DZqnxJCzcow//7GUwBbhxwtFAiqGLZoFsn0RgLSoVZrRuqL0IUz/
         QciNaVF8bvryyHkj5e/qHCYvV467ES5+OZYOikJnR+935827OGB5vPQwTAZlEeI3ERDJ
         3tNiu/eeKE0AczupstGG/S2l6y5LwBlfYzdJN7ufpwRorgctr7tbg4jhEA6vg9f8NEaj
         sylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=p6CeBZyQdlSyYfYnZiEnZr5tAKrn9fambR6Djb85xD4=;
        b=PZc5SAGYArGTJIco4YYe1MIS4GsEOh9EwcIuZj9DHAfaLion6rRynrSKqEzz1czpPl
         vOwX3tDfmha6BjBQgcn7UEo8YnqRoFnI7ViVySWyNV95iivzFF3oGBclTou1ZxPanDmu
         hP59iY2ppQ8HnEhVNfZTWPIuEF7fYvf9NP475U8gsLgj47KeaI68/TlPMzdGVTKwkJ7Z
         gRQMrQR+NTCiNoaqGfxxekOkP6TmohRxnoH31qN63NobIucTiEM/GCQnOivzzQ70sjbD
         jRIyxCkXCeiRidirGkJkRmWQSOqxriOWZdTJQWumjHllvoAWGCBWd13CQYt9pa/M+136
         K8sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nO3Tw3cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p14si1420159qtj.222.2018.03.13.16.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nO3Tw3cd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtcS-0006Ax-8g
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtAH-0004iA-4g
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtAG-0001Qt-1f
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:17:05 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:40196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evtAB-0001Nz-5z; Tue, 13 Mar 2018 19:16:59 -0400
Received: by mail-wr0-x229.google.com with SMTP id s12so105064wre.7;
	Tue, 13 Mar 2018 16:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p6CeBZyQdlSyYfYnZiEnZr5tAKrn9fambR6Djb85xD4=;
	b=nO3Tw3cdIfA0YmDqOrx/YqRILb6CaaXxxvZqHihNmwHyPWayTkhTnjHF6vV0UyGdpo
	915HhgKCFgvKJASQ1hoZTUv8aYgY6SQcl2BdZLsMS/2fU9UsRMe0/Y6dqdn4ndWrNMlo
	xR39xYNItxjO9dXX5Z+TZi0J/nc7veBKxNZepLMd3yM8ywBciaTw9tqJQkFjvISJeKK3
	bxlO8+fZEf21Sr4ErKS4UMCMH3ndHgCHFS7B7mN+39TlBr4ldQOzND9w1RK2NZWJrPUB
	j6oMjQeiHaOTklntywFGx36TtEKVPsdi/8QDaDlkvvNG1YHbiiS/A9FnJ5Ie+sP7+d6O
	Zarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=p6CeBZyQdlSyYfYnZiEnZr5tAKrn9fambR6Djb85xD4=;
	b=CZTBl6+S/RX/mX3P95tnduzcrToLYcezhz/rRreTAG/OVM2jFSU2eLmxsebWmKQBgD
	NAV9Q7+6XcjllSEDlrHTliNNl4BL3gjGwTaLcsj55D5eVlbnqozY+pvnPiJaYXjf15B7
	cIvX/w2aXPv+ugbGc8BSySmJ04G0/xCerA9bAcOV32pNZCz9CVhWBIR7UrfXlL5U3qRd
	TZTjnSnumIbMe9YrSHUn0ihka3tdvGMZb8lmvtiE1fuHF+CruBbv9u6n93NiJTm/ka7E
	W8WTXow/zvTR1jKW1agFKyNFJCH5Zxwt8Y8UE88WwpwlNNj06+F5E7DYnlwj+k+lNOH5
	Iv/w==
X-Gm-Message-State: AElRT7ELCuQL0BLD8sLiysZOagT6CnQ0q/wT/+bkq/+i+ggb1/u24TgH
	yFFCKOwNC7UttRGr0jLqpFw=
X-Received: by 10.223.199.138 with SMTP id l10mr2028509wrg.137.1520983018180; 
	Tue, 13 Mar 2018 16:16:58 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65]) by smtp.gmail.com with ESMTPSA id
	i12sm1342705wrc.28.2018.03.13.16.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:16:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair23@gmail.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
	<CAFEAcA8O7EEhoS83eRLH5bVmog_Qu1tAgUzR6NsE+GD2a7FsDw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <742160b4-2ab0-fba1-dd2f-78823c194558@amsat.org>
Date: Wed, 14 Mar 2018 00:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8O7EEhoS83eRLH5bVmog_Qu1tAgUzR6NsE+GD2a7FsDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
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
X-TUID: 7nV6U/JrCDla

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
