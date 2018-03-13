Received: by 10.28.91.67 with SMTP id p64csp969676wmb;
        Tue, 13 Mar 2018 10:28:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELttjmVM5MxdmCtiS861mcxEW6NqSfyeHC0qkfvIGxFz3N4uDDuJtE+1nO3LD5JDsP2gnTTB
X-Received: by 10.55.120.5 with SMTP id t5mr2085520qkc.14.1520962138665;
        Tue, 13 Mar 2018 10:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520962138; cv=none;
        d=google.com; s=arc-20160816;
        b=EJBYoAr9SRx0xBG8nhHkWkeqyEsuGcrA9DLcppM5Bgq4hKKe/heSQZwdVb3iHC7MVz
         QUTrmfB5y87nApQpsA7Pj6Y7yAiAelB5wdfKvMNhQnKQ4euLQIiuJAlO3SBYclGE0Thi
         SNPrn5YsLpBhT84lPKyfa4DMNxRm8/QIYTp+SkI8xtwyKsCvSmbRFufamkYTquRbt0FW
         8gJOXNUTJCCImn1VXzJuKS8+l5shS05/sz74TEREqP7jMk8apyxZQR+lm8baagmucxdT
         4dG7k4qwwzs7Cim0wJf/hPgQAFBc5pz1r5Xpj6jc5fbbqPiMhfzBs2nwgLKlHUkFWlir
         sz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9+FV24HNaVd1/02/ir1eW6Q1yORDGs/8JEtQsqNv2p4=;
        b=UIRK0HCwo1EfLV0djdDTok8uE749XGxdEDgS2QPF31mLgASpjUlHX7E28WsAipGZf0
         e4TPW5LUUBAS+/mK4xpGnXnB/iCX9oRcAMbVHHAQShxyG2e3FZnKAJZLkS7u6qNUOqom
         /TQn2rSuYYmdXRxJjPncKJKBigttwnzTOFACcr1S63MClVpOsE8a5qRU1GXclGs5oS5X
         CSxMLtR5Z65EXx4QHoHCjIZjQpmtiy6c6h/gKOSLNja2zZb5JuzYjh90LDiphSMB8Y3y
         KQKyamQwhtQD2SQZmy06Li6yton3hWpoPf8GdFxZqMd6ZIp12WgnrjxLJoqKO9GpLHCK
         1c9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcPw1AVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k41si661120qta.252.2018.03.13.10.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcPw1AVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnjO-0003UB-42
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:28:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evnQu-0003o7-1C
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 13:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evnQt-00064R-3N
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 13:09:51 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:43468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evnQs-00063D-Va
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 13:09:51 -0400
Received: by mail-ot0-x234.google.com with SMTP id m22-v6so344841otf.10
	for <qemu-arm@nongnu.org>; Tue, 13 Mar 2018 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9+FV24HNaVd1/02/ir1eW6Q1yORDGs/8JEtQsqNv2p4=;
	b=JcPw1AVWY/lzXfWxU7h7JmylEZ+SVcFeYnxI6GI42l7XgYQLgBx++EFlK0IpEdgm4k
	c8coBB5Ahyy6BU9pFml7vgbdmTJRigvDKu1r8A62/MTUOlQVkOD79sR+5n1MNeIDmSvL
	oAPJkHPRZActlhRfHHUCWAaIaRx+IYoTsqRrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9+FV24HNaVd1/02/ir1eW6Q1yORDGs/8JEtQsqNv2p4=;
	b=Dj7s7aQO/ZVVMPcFi6GqCTWKqDIr6vFKpPVOt0pHVsJSJNgyXl/VFPVG6dpIj+UlxP
	ANqCzxnsbmn1L+gdnQvbt068Er+UXsta207MzMZQPKhaK7Q1GAg5nyp+fYJ8SCIPDvKP
	yKqtrOJ2K4oF/UHnFLcBPayYeTqCUSjalMJQK1nbugBJCiv5SGL2EYmhMurdwwsA01k5
	CnucvHWzA7hsl1k77b6SNHlxeh4OwJUh1nrcQGRHy7gzoRy3K7by9sU5z6XWHNGKC6q4
	7m6U++IIGERsdDZoHYdZkAl0+dbheLRPhGlORS/ZpKoaIVfjAAO3Xv33GGnmm/F1rN4l
	t+Ng==
X-Gm-Message-State: AElRT7GwAtem8bXGgMWTGLniQrACdT3V+VnhQWtvHlJxZZ2WL9f7V87K
	tdLZr1pndPHnzohasfwpjSYmemxyl23Gnq+i619A4g==
X-Received: by 10.157.72.231 with SMTP id a36mr1013234otj.308.1520960990371;
	Tue, 13 Mar 2018 10:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Tue, 13 Mar 2018 10:09:30
	-0700 (PDT)
In-Reply-To: <MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Mar 2018 17:09:30 +0000
Message-ID: <CAFEAcA8O7EEhoS83eRLH5bVmog_Qu1tAgUzR6NsE+GD2a7FsDw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
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
Cc: Pekka Enberg <penberg@iki.fi>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9V6S0lbz6bwJ

On 13 March 2018 at 16:55, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>> From: Qemu-devel <qemu-devel-
>> bounces+andrew.baumann=microsoft.com@nongnu.org> On Behalf Of Peter
>> Maydell
>> Sent: Tuesday, 13 March 2018 08:35
>>
>> Now we have separate types for BCM2386 and BCM2387, we might as well
>> just hard-code the CPU type they use rather than having it passed
>> through as an object property. This then lets us put the initialization
>> of the CPU object in init rather than realize.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>>  static const BCM283XInfo bcm283x_socs[] = {
>>      {
>>          .name = TYPE_BCM2836,
>> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
>
> At some point I remember seeing a patch to change this to cortex-a7. Is there a reason we didn't make that change?
>
> (Background: the real Pi2 has an A7. When I first implemented the machine model there was no A7 emulation in QEMU, so I used the A15 which was the closest equivalent.)

Yeah, we should do that. I'd forgotten about that, I think
things just got lost in the shuffle of having several
patchsets that tried to change the same things at once.

I guess the simplest thing is to add a patch at the end of
the series that fixes the cpu type for bcm2836.


>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -150,8 +150,6 @@ static void raspi_init(MachineState *machine, int
>> version)
>>      /* Setup the SOC */
>>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
>>                                     &error_abort);
>> -    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
>> -                            &error_abort);
>>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>>                              &error_abort);
>>      int board_rev = version == 3 ? 0xa02082 : 0xa21041;
>
> What about the default_cpu_type field of MachineClass set in
> raspi[23]_machine_init? That seems irrelevant now...

Mmm. It doesn't hurt anything, though.

> Also, if anyone cares (I don't), we also just lost the ability
> to override the CPU type of a raspi model.

Yeah, that's deliberate -- I think that letting the user randomly
plug nonexistent combinations together just confuses people when
they don't work. I guess I should call it out in the commit message
though.

thanks
-- PMM
