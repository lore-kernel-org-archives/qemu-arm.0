Received: by 10.223.150.237 with SMTP id u100csp1036889wrb;
        Sat, 4 Nov 2017 09:19:18 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S/DHeBPNXvFuH8SCVgIQAF8Sy1Jqh7JVevWjjHk9YkabLlcdifrGjbtpIEbmlzm+obP53b
X-Received: by 10.37.209.215 with SMTP id i206mr6800988ybg.395.1509812358449;
        Sat, 04 Nov 2017 09:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509812358; cv=none;
        d=google.com; s=arc-20160816;
        b=ypmJcys2RjQ3d0+V8X62yMeXIvMT614956193s5IM/RY3CXjDRM9NuPPS+n6e6gZuy
         //NYEjK+P7qwls/ubo4rDahgeIi3m325V2N0osoEt3HJ70+tWao3RO6qqpOTlWqBsGd5
         9903iRgcaYskEzeLdBjtxRZVJMaES+BbWB3Yg0BNuXUnWm1WChgdDYN+Fqr+am6GDPrj
         f1u6/emHquCe+xkyWq675DnesVhzYC40eFOBDDma39Lj9l7tZWN0jGVHkhlvOReI9gwI
         8TCunKCvrCwrG8uVYPJMHWYs0AiMbsjQaDPLD/xtT6UL3liPNR32seE/0CPqg//nYUIv
         lvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=c02YumRrkKRR0By/7UeQ/IR69rvG0OhLNPQGBRhOOxA=;
        b=vfftaV8YG7IIFr6Vz1vMQu5drapmM4dLfYokKJCZ9kngHvpoNfvwpPAiAlRbTl2TkQ
         NEJ64oYKHk7ToBqi8Ipzx8ua/kEMb1kt5z+7oH4fzxgLQA7HGV22zk8WwJtkyoIXmclj
         WXN2vbB2xTaMbyMicR5C0y4NsEZhNqPH1MGpqTEOqtwdPGOC/rGBD9goOAjraB/3oBRL
         8/LXxy5JnnME1V081zUhiHZ1zsWYvOkRUc49pkEKlpFglCppCfjEU/mPzUamdWfi7Pde
         I7bOqJeru4aN3JxgZ1+VuLMAHxRgrgQlZquuhBgYV0jpjZnfhVgewKZHa9RNwOxJupky
         WlqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L2aK31ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w15si1958967ybk.102.2017.11.04.09.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Nov 2017 09:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L2aK31ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eB1AD-000092-T7
	for alex.bennee@linaro.org; Sat, 04 Nov 2017 12:19:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eB1A2-00006r-M0
	for qemu-arm@nongnu.org; Sat, 04 Nov 2017 12:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eB19z-0006Wx-I3
	for qemu-arm@nongnu.org; Sat, 04 Nov 2017 12:19:06 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:55333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eB19z-0006WV-DM; Sat, 04 Nov 2017 12:19:03 -0400
Received: by mail-qk0-x236.google.com with SMTP id x195so937989qkb.12;
	Sat, 04 Nov 2017 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=c02YumRrkKRR0By/7UeQ/IR69rvG0OhLNPQGBRhOOxA=;
	b=L2aK31ubrlQW7ujR+PmfgNwzxtOyIKZLv+h/UaJTYymXfX9BcRMbc1qkApK685eSgv
	+fvhzV/BjxIPqTq4sAsbPTkhRfQq92vkVi7xpN4XpbUqT3xmJOIO5f2vQNPVsL3HAp/u
	oWbXDjRxkXKzE+zcSbRfbPOTEHZFvVT6INMmbxnpPpzifXMhPF4p7ufdWFQUD2kOrEFb
	/rdWcy9oabEWYbZlPKV24g8fVGYis3+gHMDZB1zmLLcjE69bxZjyR+6TH8QU0nzrzkED
	Y7iRCIU8EYu+rgeVJV0gjM64KRXEdaQjxJM2CRpKPvjIr05K6gvHutYWeushHdApeZaq
	8iIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=c02YumRrkKRR0By/7UeQ/IR69rvG0OhLNPQGBRhOOxA=;
	b=Ojs7h7chfiUbnW4mqxlc6MFwv00gHHheslfM0OqV0EwEUBflaounzBj9b6HsnU0vvZ
	YIP4GlmxLWFLpHX60OzYYj9O06c5mCVILzX+JUzWgdcq0KQIZz8L5XRCJ3H3HmJjIFaI
	IpboUkNJNcXKy/wDXO3mFT3JyGK52Y1lx9ocQ5zdy96HX1uMwb5BN1vd0Ru2LdKdzGAY
	ec6AS5f7FXVVuv5IWENlH+k9uiVlKCmxd82ILeZk+kbWzSJ8inu5K7xDMkG1SXPmUylT
	CNZoXj0tkk5YxGjeqVncCE7+oTfywk4BVeSimTv7uJKGV5NbPHFLY9qvpYqCICFd5IcG
	FEFw==
X-Gm-Message-State: AMCzsaVb1yju6HRwNlhjJnmSn6FPslbEEW07Ifwm8TvqVqJ0BoEfNrRq
	ilJKC906MrXdIAyp4FRnsrs=
X-Received: by 10.55.115.130 with SMTP id o124mr14548707qkc.83.1509812342177; 
	Sat, 04 Nov 2017 09:19:02 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	g128sm5424093qkb.16.2017.11.04.09.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Nov 2017 09:19:01 -0700 (PDT)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<db255c93-a4c6-216d-8ea3-10f340a916f6@amsat.org>
	<257f2a30-6607-cb14-3bbf-27b95d962cf4@amsat.org>
	<89487dfd-f941-871f-e822-68a6fbace6fe@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <23b10dc0-2bb6-b53d-dfaa-a641630f8aaf@amsat.org>
Date: Sat, 4 Nov 2017 13:18:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <89487dfd-f941-871f-e822-68a6fbace6fe@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
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
X-TUID: vC9NjC6mFJTr

On 11/04/2017 05:55 AM, Laurent Vivier wrote:
> Le 03/11/2017 à 22:51, Philippe Mathieu-Daudé a écrit :
>>> On 11/03/2017 05:26 PM, Laurent Vivier wrote:
>>>> This series fixes some errors found by
>>>> enabling USE_SOFTFLOAT_STRUCT_TYPES.
>> [...]
>>>
>>> I'm getting those errors:
>>>
>>> $ make subdir-arm-softmmu -j2
>>>
>>> /source/qemu/migration/vmstate-types.c:430:5: error: conversion to
>>> non-scalar type requested
>>>      qemu_put_be64(f, float64_val(*v));
>>>      ^~~~~~~~~~~~~
>>> make: *** [migration/vmstate-types.o] Error 1
[...]
> 
> These series doesn't fix all the problems, only the easiest to fix...
> 
> for this one, you need:
> 
> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
> index 48184c380d..0c273d616a 100644
> --- a/migration/vmstate-types.c
> +++ b/migration/vmstate-types.c
> @@ -425,7 +425,7 @@ static int get_float64(QEMUFile *f, void *pv, size_t
> size,
>  static int put_float64(QEMUFile *f, void *pv, size_t size, VMStateField
> *field,
>                         QJSON *vmdesc)
>  {
> -    uint64_t *v = pv;
> +    float64 *v = pv;
> 
>      qemu_put_be64(f, float64_val(*v));
>      return 0;

If you respin with this one you can add my Reviewed-by + Tested-by.

Another error:

$ make subdir-aarch64-softmmu
[...]
  CC      target/arm/helper-a64.o
/source/qemu/target/arm/helper-a64.c: In function ‘helper_simd_tbl’:
/source/qemu/target/arm/helper-a64.c:162:38: error: incompatible type
for argument 1 of ‘extract64’
             uint64_t val = extract64(env->vfp.regs[elt], bitidx, 8);
                                      ^~~
In file included from /source/qemu/include/qemu/bitmap.h:16:0,
                 from /source/qemu/include/hw/qdev-core.h:6,
                 from /source/qemu/include/qom/cpu.h:23,
                 from /source/qemu/target/arm/cpu-qom.h:23,
                 from /source/qemu/target/arm/cpu.h:39,
                 from /source/qemu/target/arm/helper-a64.c:21:
/source/qemu/include/qemu/bitops.h:316:24: note: expected ‘uint64_t {aka
long unsigned int}’ but argument is of type ‘float64 {aka struct
<anonymous>}’
 static inline uint64_t extract64(uint64_t value, int start, int length)
                        ^~~~~~~~~
make: *** [target/arm/helper-a64.o] Error 1
