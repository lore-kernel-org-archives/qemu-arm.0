Received: by 10.223.150.237 with SMTP id u100csp121539wrb;
        Tue, 7 Nov 2017 06:52:52 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RCrjNP/mahswiWh2gS9TD1bPtAFW8BJr3t6RXFBeK08zA3TgjoAvmv1xzMIBnBksgg3xt/
X-Received: by 10.37.99.86 with SMTP id x83mr511147ybb.268.1510066372811;
        Tue, 07 Nov 2017 06:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510066372; cv=none;
        d=google.com; s=arc-20160816;
        b=H5gCZMIleMhG5VmbdMT6jKRFUolHrez2vg3JqIbHXwA5vwqcxTiUR6BqEcSOBks+Ui
         nOT259exf2f9N4oVSfygOLl5EZ39vIdpdYM30HIzBeRcaldfs6I1mfOSSGuUbEPZScxc
         L2gEeR5FyfEg6SvXFA+VfXS1dxcb9QK8S/+v4MuDSiO7kmzogDm2wZcU3e1MJld/kr6r
         kekgcxx97qZnlgYnB3l5o4A2DOGijaarNz8Sge7SB4+nMUNCey0sJOYnomDW+EMZOCdK
         ipJfiHJiphrhVYdDr2dbMZ4/pENPzIfvbVVHAdiZGfmutpMzoplKNpdgWxwtwQOB4qug
         5+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=thK4KnViic2C0+CocHAQyu6NDmGv+yA8bQKdsiKZTK0=;
        b=lUBbH4Oyl1MPN70DdkskT7r2LMuQ8DZ2uU/kiS+CLLF6aFOElosv3ULRtKQmOXhVy3
         2yLaUx9z8DvJ3MJRPVlQdS6P52y4yyZ3QkBITxoxxdNsysOfzZj7VKydIY1QPV3FUlKE
         yMmdRnTmdVd7nOpcNuXKsz+f3slhhsIye8QoPtOUXpHUdMgHDaoYaD2nm90loBNK6cPr
         5ZiaF2vp8Rnc1AX0EOXCfUwJguU5bhQpj/mmJamtIu88VHjQj1C9x0VGcekbKuf34Dsd
         H1BCnshOnMHavDRr5A2KKmZ6v9jDZXbpDOT0FZrq4eEP4VB6HVVGOCvQjNxy1elcc7uO
         luOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WYED3rzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o72si318475yba.515.2017.11.07.06.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 06:52:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WYED3rzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC5FE-0000O5-As
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 09:52:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC5Ez-0000JW-Eb
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:52:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC5Eu-0001Kp-Il
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 09:52:37 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46208)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eC5Eu-0001KK-8o; Tue, 07 Nov 2017 09:52:32 -0500
Received: by mail-qk0-x242.google.com with SMTP id o6so8579843qkh.3;
	Tue, 07 Nov 2017 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=thK4KnViic2C0+CocHAQyu6NDmGv+yA8bQKdsiKZTK0=;
	b=WYED3rzEa45c3G8yYdQRD4/Wt/ENg3KTybRCv1NF5A3BO1r+TdoYFizDU/Wh9W9xHv
	2TsQCM3RqHGQVCqyJP2pkDzTkyIQ6WHmNNwsAwdZrSvI9vlWUQwVpB1du3GdcrOw8NvY
	npmrGuruuUIM9rbp+3ZqRHZ3295tFvgAuTwPbHfK934jmLKpxSnl6wGJaujOxB+F9EOA
	AE3LfUoZydFo7P6/W+GIybfpLY3oVXOMkdbirXGFSPkd4zrgJNc0KcUCZ+GbvX3P+eBg
	miaL7dGczH3GRy0QSmqeFKcMRtNQi5xtpq7MjRcUxZIYGuhnWb1lQIbrrJAaE7y72vtC
	v7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=thK4KnViic2C0+CocHAQyu6NDmGv+yA8bQKdsiKZTK0=;
	b=L1PMGMYISCm5aLGTZ9YYRX0V0a0AOVy8LutYBALEsIs/mbshdbdSdUu6xc9dAwpfYN
	Pt8ayd3hywQNcRclOnbFNNr4MfLlIZaiyoobodVuwz5/cS7VYJpeYL1FPhhJpnb2/jh3
	En6Lt/wq1ZruCHojoVbFIlPygUcyHdHU/qtsLPeM1aD8uL110n5/Kgf/g+U/FobQjD8Q
	L1BKqXi/Df+C/hRzyGJAVPQBhiw8+FGeNbH+k582b+r0Tu2MVui1H7uuDTyl5DKP20y4
	cILDJ51PZQDIjwluHXVZ5Q24AGA5hYNVwT1x6u0PlaDJV/u9rAsqfmZh/pCRoY7DWJ9l
	DNhQ==
X-Gm-Message-State: AMCzsaUYKjtnLy7A1cYq5+vG5IsDkoRoquxoBxymXx9Jo15idD7qvLgQ
	RotX/tWPxhgg5pYIy1SU4+8=
X-Received: by 10.55.82.86 with SMTP id g83mr27050775qkb.342.1510066351592;
	Tue, 07 Nov 2017 06:52:31 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	f126sm986009qkd.20.2017.11.07.06.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 06:52:30 -0800 (PST)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<db255c93-a4c6-216d-8ea3-10f340a916f6@amsat.org>
	<257f2a30-6607-cb14-3bbf-27b95d962cf4@amsat.org>
	<89487dfd-f941-871f-e822-68a6fbace6fe@vivier.eu>
	<23b10dc0-2bb6-b53d-dfaa-a641630f8aaf@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8fdc98d4-edea-4239-a32f-23882fbff9d2@amsat.org>
Date: Tue, 7 Nov 2017 11:52:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <23b10dc0-2bb6-b53d-dfaa-a641630f8aaf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH 0/4] softfloat: fix some helper definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
	qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0JuNe7B1ozm

On 11/04/2017 01:18 PM, Philippe Mathieu-Daudé wrote:
> On 11/04/2017 05:55 AM, Laurent Vivier wrote:
>> Le 03/11/2017 à 22:51, Philippe Mathieu-Daudé a écrit :
>>>> On 11/03/2017 05:26 PM, Laurent Vivier wrote:
>>>>> This series fixes some errors found by
>>>>> enabling USE_SOFTFLOAT_STRUCT_TYPES.
>>> [...]
>>>>
>>>> I'm getting those errors:
>>>>
>>>> $ make subdir-arm-softmmu -j2
>>>>
>>>> /source/qemu/migration/vmstate-types.c:430:5: error: conversion to
>>>> non-scalar type requested
>>>>      qemu_put_be64(f, float64_val(*v));
>>>>      ^~~~~~~~~~~~~
>>>> make: *** [migration/vmstate-types.o] Error 1
> [...]
>>
>> These series doesn't fix all the problems, only the easiest to fix...
>>
>> for this one, you need:
>>
>> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
>> index 48184c380d..0c273d616a 100644
>> --- a/migration/vmstate-types.c
>> +++ b/migration/vmstate-types.c
>> @@ -425,7 +425,7 @@ static int get_float64(QEMUFile *f, void *pv, size_t
>> size,
>>  static int put_float64(QEMUFile *f, void *pv, size_t size, VMStateField
>> *field,
>>                         QJSON *vmdesc)
>>  {
>> -    uint64_t *v = pv;
>> +    float64 *v = pv;
>>
>>      qemu_put_be64(f, float64_val(*v));
>>      return 0;
> 
> If you respin with this one you can add my Reviewed-by + Tested-by.
> 
> Another error:
> 
> $ make subdir-aarch64-softmmu
> [...]
>   CC      target/arm/helper-a64.o
> /source/qemu/target/arm/helper-a64.c: In function ‘helper_simd_tbl’:
> /source/qemu/target/arm/helper-a64.c:162:38: error: incompatible type
> for argument 1 of ‘extract64’
>              uint64_t val = extract64(env->vfp.regs[elt], bitidx, 8);
>                                       ^~~
> In file included from /source/qemu/include/qemu/bitmap.h:16:0,
>                  from /source/qemu/include/hw/qdev-core.h:6,
>                  from /source/qemu/include/qom/cpu.h:23,
>                  from /source/qemu/target/arm/cpu-qom.h:23,
>                  from /source/qemu/target/arm/cpu.h:39,
>                  from /source/qemu/target/arm/helper-a64.c:21:
> /source/qemu/include/qemu/bitops.h:316:24: note: expected ‘uint64_t {aka
> long unsigned int}’ but argument is of type ‘float64 {aka struct
> <anonymous>}’
>  static inline uint64_t extract64(uint64_t value, int start, int length)
>                         ^~~~~~~~~
> make: *** [target/arm/helper-a64.o] Error 1

OK with:

- uint64_t val = extract64(env->vfp.regs[elt], bitidx, 8);
+ uint64_t val = extract64(float64_val(env->vfp.regs[elt]), bitidx, 8);


