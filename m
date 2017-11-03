Received: by 10.223.150.237 with SMTP id u100csp304087wrb;
        Fri, 3 Nov 2017 14:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SRzWN9ebBEeMVmmg4Cps2MpMZRubDtzxQr2WBXQkF/Dn/+bHnKvXRxchLYekrU0FLJGs7m
X-Received: by 10.129.92.212 with SMTP id q203mr5486430ywb.492.1509745902294;
        Fri, 03 Nov 2017 14:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509745902; cv=none;
        d=google.com; s=arc-20160816;
        b=UWJU9WEE6J7cJ6kUT2He1QoomCEbI2TIg3jaxmVoThvYumbA9Alngi8H/zegBnSTgi
         aWtFmYDr5/0OCvMbQh811z/EwgAX6EEmSdTQ2cC0RWzXlx9PoIYE/zWnisTjseLkc2Av
         ZY29A+48D3b3wefLWH4QyysaiVWfOoXNxfgkX8vcfXBumVwZqRBEI7xKK+6SibmI8Y8q
         5zVFtazrAM3oRQTWloF0h7b2DqsIXdv8Gq0uT9uL/jrZ5KWo6bFdMAfqs7gpfvSt4OLS
         xbRLbWufNl8Z0kVsO8m/JUL639OHROfKL6xE+76tRnANhdVkJqpRiJhuz/wZWj0pADlh
         2iYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=kJTLf8eye438g5sFFFmb3yOJRR3J1o4MQ2fEJfiTSNs=;
        b=euSOVYj8GU8zzcHIk8ivQZSkXWW3owmNqgPyPGuej7AiRCjMh3BGWT9Z1dclPf2oif
         oW4j9SzG98527mnEMfUz4XZml1S8C63/mJfHp0Qt+8CtLZTFEbkNmWDMWOBRTHHgjaA3
         EW+3L5DtFbuxOSvB75EBeP3mEHTxYnoqfdaP8UDiiHGofOyvnrH+k9Ir/A0MWYSz4lR/
         JT+IGyi6NkBExLp4K3v4Wn1SxUFmLA7639BsntAJ+X8bEsItzUSA394oV1s0QjRgAw2V
         r/y5UncuZX+BtqeDrsyUe+msSzSUqt/A3ViBmOCHeZcpingFtQvifhFmTtQRHPGyaKxH
         /ZCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tuqd+fhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j62si1620525ybb.500.2017.11.03.14.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 14:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tuqd+fhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAjsL-0005a6-P9
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 17:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eAjsC-0005YI-03
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 17:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eAjs8-0007q3-Ti
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 17:51:32 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:45499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eAjs8-0007pL-Pi; Fri, 03 Nov 2017 17:51:28 -0400
Received: by mail-qt0-x232.google.com with SMTP id p1so4950112qtg.2;
	Fri, 03 Nov 2017 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kJTLf8eye438g5sFFFmb3yOJRR3J1o4MQ2fEJfiTSNs=;
	b=tuqd+fhpfhNoEwghGR4/fuWlFCN00i4Ji/M6OTgSZ5G0zjI0Sr1Ui2NZmobgEwnoGh
	TQ7ocRNfcA0O614NzOR8b0l7AVOHdJ0sn1+akzX4824wsPvzgiXIRZlNfiU7M1xrigfg
	MN53vDrteBmPCa4F6K55IivSLdf89uqkVp7wSx8rEZR6FvMwfiYhenQUdlsNVwuk0DC2
	N1w4iNM96LmChgw8/Gqr8H+6wMcbiPjY8CTRKyscxuxCC9pELxwNLP3viqLx2kZRTu1K
	kExZCXSX1zY2iGDx0OTIdvqx9hwajq97UAhJu1CtIwDvdGrsRiAMURjZ1F1DVtfbJtCn
	5BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=kJTLf8eye438g5sFFFmb3yOJRR3J1o4MQ2fEJfiTSNs=;
	b=cZIafel40QOqh2s0HQE5qqPQdqtkGX5Yc8hWpDTYg5390vR6BuGoyhHq6O3JtB/JrB
	5lItqvM3XmfXGmwKTQKUigjtSEso7lChQM4qtxZf+0vqsTI7mrO/mMBHn1BuhqlBLlTK
	SIsrruN4IMhXh6h5zyCWdIcpkOaXT/4Y0tfiYKVn4P1TOGLmMx4HVMg7UOq3UbNlUf4n
	2MtBVPZq11gQQzTIB91MOvrQEKrzuZxZw+uB7HztutG0I3yQ4SNlPQS+hD1kIwOsgvzj
	eXlHzdnFTdvIAA+tJi6amBngJcnxXvMEgTxanOlqqfipRwsAP90Lwv1CjCqK95hCC/jV
	yX6g==
X-Gm-Message-State: AMCzsaXxBYjOn698uVInSvZh62l22rD/j8xyfAzs6VBNeG6XXxbXDsj1
	XSh0TL1abbCtImsST3k0tPc=
X-Received: by 10.200.1.72 with SMTP id f8mr11639923qtg.146.1509745888195;
	Fri, 03 Nov 2017 14:51:28 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	t81sm4328377qka.37.2017.11.03.14.51.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 14:51:27 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<db255c93-a4c6-216d-8ea3-10f340a916f6@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <257f2a30-6607-cb14-3bbf-27b95d962cf4@amsat.org>
Date: Fri, 3 Nov 2017 18:51:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <db255c93-a4c6-216d-8ea3-10f340a916f6@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
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
X-TUID: MPoUGiCRXTsz

> On 11/03/2017 05:26 PM, Laurent Vivier wrote:
>> This series fixes some errors found by
>> enabling USE_SOFTFLOAT_STRUCT_TYPES.
[...]
>
> I'm getting those errors:
> 
> $ make subdir-arm-softmmu -j2
> 
> /source/qemu/migration/vmstate-types.c:430:5: error: conversion to
> non-scalar type requested
>      qemu_put_be64(f, float64_val(*v));
>      ^~~~~~~~~~~~~
> make: *** [migration/vmstate-types.o] Error 1
> 
> In file included from /source/qemu/fpu/softfloat.c:87:0:
> /source/qemu/fpu/softfloat-specialize.h: In function ‘float16_default_nan’:
> /source/qemu/include/fpu/softfloat.h:117:26: error: expected expression
> before ‘{’ token
>  #define const_float16(x) { x }
>                           ^
> /source/qemu/fpu/softfloat-specialize.h:95:12: note: in expansion of
> macro ‘const_float16’
>      return const_float16(0x7E00);
>             ^~~~~~~~~~~~~
> make: *** [fpu/softfloat.o] Error 1
> 

Also:

$ make subdir-armeb-linux-user -j2

  CC      linux-user/signal.o
In file included from /source/qemu/linux-user/signal.c:24:0:
/source/qemu/linux-user/signal.c: In function ‘restore_sigframe_v2_vfp’:
/source/qemu/linux-user/qemu.h:472:8: error: lvalue required as left
operand of assignment
   ((x) = (typeof(*hptr))(                                             \
        ^
/source/qemu/linux-user/qemu.h:481:31: note: in expansion of macro
‘__get_user_e’
 # define __get_user(x, hptr)  __get_user_e(x, hptr, be)
                               ^~~~~~~~~~~~
/source/qemu/linux-user/signal.c:2209:9: note: in expansion of macro
‘__get_user’
         __get_user(float64_val(env->vfp.regs[i]),
&vfpframe->ufp.fpregs[i]);
         ^~~~~~~~~~
/source/qemu/linux-user/qemu.h:477:13: error: left-hand operand of comma
expression has no effect [-Werror=unused-value]
      (hptr)), (void)0)
             ^
/source/qemu/linux-user/qemu.h:481:31: note: in expansion of macro
‘__get_user_e’
 # define __get_user(x, hptr)  __get_user_e(x, hptr, be)
                               ^~~~~~~~~~~~
/source/qemu/linux-user/signal.c:2209:9: note: in expansion of macro
‘__get_user’
         __get_user(float64_val(env->vfp.regs[i]),
&vfpframe->ufp.fpregs[i]);
         ^~~~~~~~~~
cc1: all warnings being treated as errors
/source/qemu/rules.mak:66: recipe for target 'linux-user/signal.o' failed

  CC      linux-user/arm/nwfpe/fpa11_cpdt.o
...
/source/qemu/linux-user/arm/nwfpe/fpa11_cpdt.c:37:4: note: in expansion
of macro ‘get_user_u32’
    get_user_u32(float32_val(fpa11->fpreg[Fn].fSingle), addr);
    ^~~~~~~~~~~~
/source/qemu/linux-user/qemu.h:515:13: error: lvalue required as left
operand of assignment
         (x) = 0;       \
             ^
/source/qemu/linux-user/qemu.h:536:32: note: in expansion of macro
‘get_user’
 #define get_user_u32(x, gaddr) get_user((x), (gaddr), uint32_t)
                                ^~~~~~~~
/source/qemu/linux-user/arm/nwfpe/fpa11_cpdt.c:37:4: note: in expansion
of macro ‘get_user_u32’
    get_user_u32(float32_val(fpa11->fpreg[Fn].fSingle), addr);
    ^~~~~~~~~~~~
