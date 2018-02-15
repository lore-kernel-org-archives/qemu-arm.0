Received: by 10.28.71.27 with SMTP id u27csp2562934wma;
        Thu, 15 Feb 2018 05:15:40 -0800 (PST)
X-Google-Smtp-Source: AH8x226R2KkqcHX0yGK4j3xF5laKJrko9QRltlMXngZw6yNhNrcSbjIcYE51nW0dxkl8LESmlytm
X-Received: by 10.129.62.9 with SMTP id l9mr1833173ywa.244.1518700540830;
        Thu, 15 Feb 2018 05:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518700540; cv=none;
        d=google.com; s=arc-20160816;
        b=i/CZkxtB7BmhJFEbgxnRkhC5T9QTQvM9UVAaU3TsH6/mvumY3qkAw0S7JWRbuFT+lj
         mim2D+/qqRLK3m9rRXyf1jtmAVhzNiLuvR6Nkg7qqHeNKtoToa1TLPqWD7PvKu5lbrSZ
         5jTZbUfvbZCFLfk7vEZ+K2tHYFuPoCXaY/MqnDp4voS9m1fdVnRxDvwYO1NmWvG2wrcG
         zmwU6RnP0nSfffS4sSiqSRSwiuSdxGuZG6gZ+3uSimiFd8kZqZcmJsWpinTn66p+TMok
         Ej+bAsgDErVWZduAGvOXkBHQXej3zeb4LD8iRcrHOTR1J2FXwFc+dBcSTGNH/pP8m4iy
         XuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=sOCHqgdG7sw9Nxxj/As1B31+KOzUDZoyGNELRFnstyo=;
        b=ESfpN651+2NARByVGZzzcvsulFV2vxIO4gcjXdVmiZWR2pxFB1B4C+CzK48tYENbdu
         pQJF/JR3vX555Ct+s4PnxAYB3LeN9WQPKDXjaKDbvn/RgYIFLvIcB95gDMimlvazWsVT
         +D6+8dzNweOI1PPbvVdl9jWvPSbj7Pa3Yp24w1CpISY4QUZMBNtPoIMK9naAQ5YehZ7z
         xOQc44u6lt6uQ1kjrbA8ZOfWro2SCQ9SZx/5zNow5BcExb0+pdRQG4nKPskc0iz/rxxO
         CGVydePkaPCyF7K/QNMxcupJtflvKMDiWoayMjj2NEZe/+8FNeqrFTdL9i+m54ugyfCo
         VuLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g0/3KuJQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1si287538ybm.434.2018.02.15.05.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 05:15:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g0/3KuJQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emJO0-0006Lh-9R
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 08:15:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emJMl-0005Xa-R7
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emJMj-0000NX-5Y
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:14:23 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:39202)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emJMj-0000NO-0B; Thu, 15 Feb 2018 08:14:21 -0500
Received: by mail-qt0-x243.google.com with SMTP id f4so11765282qtj.6;
	Thu, 15 Feb 2018 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sOCHqgdG7sw9Nxxj/As1B31+KOzUDZoyGNELRFnstyo=;
	b=g0/3KuJQBSiZZRvaQoj2enbQhM4tlZr8QvO3xN9/eX9B+4zGPPkdt+vkPTEZ1yrjIk
	RUTXSdpDi7DTpX/APfXqexwT5GnHZQM/meOnx+wiMk+xd3e6RlvfRuoVkuj/csLg2AOf
	V3+7oXV1ZjeUrd8Ym5ju9lkHI1CL81TR8RcxOMFwZhla4e3jXR2sj5Vt97Hpzw++XCPq
	MSWpfNr9f56Q7kMyxg1U286tBDmCsz80PO4bFj9fS/QZp3RFkX8ybauw/wof0T2SU2A4
	CGKLWyX/JwqxpDVjxpGe7zndVO/nyB+lFX1ii8nypH4RwV4lIO2b8Ux9+0vanzd2afHJ
	5Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=sOCHqgdG7sw9Nxxj/As1B31+KOzUDZoyGNELRFnstyo=;
	b=W20pWjVYH3c2DILFM2mLvcmcG1DUfbyrOM+ayu4s4CPsOaf6k47mgdBSqzrx0Q9QeU
	jIJV6DYXlwDCibsm8us1YC1Zedf7wYp2OA8DWKICJEVQvXuzgy0GR94Dj5b0fFBYBUNp
	4N2Xr/XRtVpHOs9pz6pBXn4RpHpwUICIUi/qRgdracC7o6P0cwuUoL/52lSeUwMCPGzm
	oEkO4ZijGpmEsgZSQlwVM7/5mOcJe6+L8PwQ9ZIjfA0wJuc+5imPWFr7ABCbLU14khMl
	ZZRybckkojB1iUFZzks+aBw5QFFKntZCc8t5iv7lPBr++HKR9a1doKRZVIL9QrD+AUj9
	cIBw==
X-Gm-Message-State: APf1xPCS0m+9MzeGQ+ev1ZhUruoUgDY8L652mwH0t8vrUfvl3y6EDgX4
	fMsHGqJU+BS0Zbu0jxiP6mpZ81uxf3U=
X-Received: by 10.200.41.139 with SMTP id 11mr4084839qts.247.1518700460325;
	Thu, 15 Feb 2018 05:14:20 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	j10sm11801642qtj.89.2018.02.15.05.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 05:14:19 -0800 (PST)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Pekka Enberg <penberg@iki.fi>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-4-penberg@iki.fi>
	<CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
	<9c52a265-6659-5c9c-27c7-eced8528fb63@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a3f95aa2-3a13-8a67-4fe2-b7da6eace585@amsat.org>
Date: Thu, 15 Feb 2018 10:14:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <9c52a265-6659-5c9c-27c7-eced8528fb63@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v1 3/3] raspi: Add "raspi3"
 machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZqAGl8zaMbW

On 02/15/2018 09:49 AM, Philippe Mathieu-Daudé wrote:
> On 02/15/2018 09:39 AM, Peter Maydell wrote:
>> On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
>>> This patch adds a "raspi3" machine type, which can now be selected as
>>> the machine to run on by users via the "-M" command line option to QEMU.
>>>
>>> The machine type does *not* ignore memory transaction failures so we
>>> likely need to add some dummy devices later when people run something
>>> more complicated than what I'm using for testing.
>>>
>>> Signed-off-by: Pekka Enberg <penberg@iki.fi>
>>> ---
>>>  hw/arm/raspi.c | 21 +++++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>
>>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>>> index 66fe10e376..048ff23a51 100644
>>> --- a/hw/arm/raspi.c
>>> +++ b/hw/arm/raspi.c
>>> @@ -187,3 +187,24 @@ static void raspi2_machine_init(MachineClass *mc)
>>>      mc->ignore_memory_transaction_failures = true;
>>>  };
>>>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
>>> +
>>> +static void raspi3_init(MachineState *machine)
>>> +{
>>> +    raspi_init(machine, 3);
>>> +}
>>> +
>>> +static void raspi3_machine_init(MachineClass *mc)
>>> +{
>>> +    mc->desc = "Raspberry Pi 3";
>>> +    mc->init = raspi3_init;
>>> +    mc->block_default_type = IF_SD;
>>> +    mc->no_parallel = 1;
>>> +    mc->no_floppy = 1;
>>> +    mc->no_cdrom = 1;

Now I remember why I hesitated with this patch,

This part {

>>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
>>> +    mc->max_cpus = BCM2836_NCPUS;
>>> +    mc->min_cpus = BCM2836_NCPUS;
>>> +    mc->default_cpus = BCM2836_NCPUS;

} is the BCM2837 SoC, very similar to the BCM2836.

>>> +    mc->default_ram_size = 1024 * 1024 * 1024;
>>> +}
>>> +DEFINE_MACHINE("raspi3", raspi3_machine_init)
>>
>> Hi. This patch breaks "make check", because it adds the raspi3
>> to the arm-softmmu (32-bit guest CPUs only) build, where the
>> cortex-a53 CPU doesn't exist:
>>
>> e104462:xenial:qemu$ ./build/x86/arm-softmmu/qemu-system-arm -M raspi3
>> **
>> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:372:object_initialize_with_type:
>> assertion failed: (type != NULL)
>> Aborted (core dumped)
>>
>> The usual way we avoid this is that 64-bit only boards are
>> in their own source file, which is only compiled if the right
>> CONFIG_FOO is set by default-configs/aarch64-softmmu.mak.
>> In this case splitting the 64-bit board into its own source
>> file would be weird and awkward, so the simple thing is to
>> guard the raspi3 bits with #ifdef TARGET_AARCH64.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>>
>> (You might think we could define a CONFIG_RASPI3 in
>> aarch64-softmmu.mak and #ifdef on it, but for some reason
>> we don't expose those CONFIG_* to C code, possibly just because
>> we've never needed to in the past...)
>>
>> Since this was the only code change needed, I'm just going to make
>> it and apply the patchset to target-arm.next, rather than ask
>> you to do a respin. (There was also a stray space-at-end-of-line
>> in patch 2 which checkpatch grumbles about; I'll fix that up too.)
>>
>> thanks
>> -- PMM
>>
