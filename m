Received: by 10.223.150.237 with SMTP id u100csp711587wrb;
        Sat, 4 Nov 2017 01:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SrgEa4IMkC44BFprPonYdSZrDUY9C3kalBn9h3/l2ykS/7za2LrRt54RnzryVeooj3NEA+
X-Received: by 10.129.156.10 with SMTP id t10mr6375682ywg.9.1509785755905;
        Sat, 04 Nov 2017 01:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509785755; cv=none;
        d=google.com; s=arc-20160816;
        b=z9VyRkmh0aI5TfBBGCZyOImITrlNYnEwjdPlXcqsU9NhTV43A2W8o1g26CZwGEL5EL
         CzoZvf5NK/aXHVngqm/ov5BRGlAChcvMJ44OVL4/GJfdf+EH8m+MQwkee8jgAwV6U/jd
         txNdbMWj2d52V/69mH5N943TjVjCYEshq6UeFgXF1F7QcJ6yrHimeAJl7c5zXfRQ2JqE
         +Mty5PEgxFtAxBRwrXCLF9rO0XruBBG8GH3evV5rZRXXyypFw/1nvbjVXZFcJAD8QtUS
         oHRG12/bvdcuIpQNDMEXL2n2D/WZ903RSyPg5H2VagkLwd/81NjOquhf28LLD/4ZptlV
         4r+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=P5wqF/8kuFOUZaYZH5HgXH/4gWyLfr2GUjYfjo6qs5E=;
        b=LaF1d5LMzwNT/sePXjIKyHnQ6J0vZPO+Kj+CAXBOOv7gBdoJiw/SU8za82WkZwAuZR
         j0BoyEbMEtd2jm84UUUE+87taZI3WkpDMzjgxwJx1WodqVyC12iOsc5q4iz0sjXvKIlS
         mjQlinBqassQeaw4FKd5zJuzAViH+Ts0HrtRUPxctKyhq9nNJItqJVoSu8GbQ/wacxkF
         CyMeMoTP0rFWSm+A4bjluXy0HWaWfZR5hxXuYrKPlrIm1y6QBXnwu7t/XQ2aajgTDXcz
         YPgRLuN9egc/AQI1ZbB96QSpK0H/nx/pwKizcH1tLv3WOseEsVRWZMZJPTqA0QbX7zag
         JWXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e123si502046ywa.598.2017.11.04.01.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Nov 2017 01:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAuF9-0004Fz-Be
	for alex.bennee@linaro.org; Sat, 04 Nov 2017 04:55:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAuEy-0004Eq-LN
	for qemu-arm@nongnu.org; Sat, 04 Nov 2017 04:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAuEx-0000bl-Lm
	for qemu-arm@nongnu.org; Sat, 04 Nov 2017 04:55:44 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eAuEr-0000WC-1z; Sat, 04 Nov 2017 04:55:37 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MIjEq-1e8iNT2pom-002I3E; Sat, 04 Nov 2017 09:55:19 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
	<db255c93-a4c6-216d-8ea3-10f340a916f6@amsat.org>
	<257f2a30-6607-cb14-3bbf-27b95d962cf4@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <89487dfd-f941-871f-e822-68a6fbace6fe@vivier.eu>
Date: Sat, 4 Nov 2017 09:55:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <257f2a30-6607-cb14-3bbf-27b95d962cf4@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:0/S9sY+jhA2Gxe/0KICpmHhEwkFnSkzzzQSCI6lmpuYFXaHq4Rz
	+B1U5ysSOF4CPT3HEeXwbURbxv8jGxqZ6IQHZ5EZwZFfzmMElS+4LRnRfy9YUCTCQbwBgZG
	5IrlL2xdHeVDlQ87ea4HT03LHeRuUvgI1SEMOQ6zv89YN3VnbFYLAX5QCgGPIWjRFiW4CUd
	9x2PeJNZAdZQPut7bWO5w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wjxUAir7qsg=:3cQuNmSFk91NR3mMvc+Krw
	9tggUZ/tUhdrLx5aVsvGJlZZxG8iK8t85OFNT0RQjf/6LWgc65ve+NvuYhvuzQioIF8Tfv1iR
	Ss+CBTnsA8aeQ4xy9Bj67tEZCzMAAKkI7diQ9V6pvH6fqr5N3kGCUFbEIPwVkXNeFYDZISfuo
	xDr5gFQHs3eTbR1e8Nb6tA3blzQd83KDk8xtdB62ErrPO2MED+hSm1qxxjVk7SX16eXOc3oYE
	ZQqym27ENKwUSXj1LRjdls6qt8tt2UQGkKBVgQTUHy5nTGDldoLbnkM5rwKwsw0Z4AwaOzUXo
	QRDdIVNGA9BHuygCmSvVK2mhT5SbP+WjC4OYedVhj4fdnLZ6zK6XhgE/+Rru+iMGvSyWcmsgu
	hCAjvnQ9AVxESTOpg+63MAeu2B0PvCy9+VF1jye6likS/t4O6kFPig3kkb5K8pC5QNCx+7wpn
	rX8nQ1QY8U+xkTbWkdKboHO2jmNFGj65+bBc2n9c6bFASS4iRuVi3aqwl8GrTw0mDe8WbM1+9
	yJvcsixfqUoD4MUJH/5y7Se4aBflZ70UYfAtFk+OvVkFfmLE5a4YjToHkfF9Kd/WfNtDclTfR
	axL7yjd+RX2SAd0YyIxRiOjW0vtFe5zihvh1Jahdn6SodQFRiy6en3wUqu/O9v2HO9mgkChE2
	3QNh83nqjOhDHGi44kSBHiRfmg5zC2CINbYRcToAOXJKbYsPIEokCFQnoh1Imibwxi79aWI72
	RbkmgaM83eIj7O7FmUJ5J/YnoHkpxJIapRkKglXkdufyOxkj+cLsGwX5cGo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
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
X-TUID: 7VKM4SOJOBVY

Le 03/11/2017 à 22:51, Philippe Mathieu-Daudé a écrit :
>> On 11/03/2017 05:26 PM, Laurent Vivier wrote:
>>> This series fixes some errors found by
>>> enabling USE_SOFTFLOAT_STRUCT_TYPES.
> [...]
>>
>> I'm getting those errors:
>>
>> $ make subdir-arm-softmmu -j2
>>
>> /source/qemu/migration/vmstate-types.c:430:5: error: conversion to
>> non-scalar type requested
>>      qemu_put_be64(f, float64_val(*v));
>>      ^~~~~~~~~~~~~
>> make: *** [migration/vmstate-types.o] Error 1
>>
>> In file included from /source/qemu/fpu/softfloat.c:87:0:
>> /source/qemu/fpu/softfloat-specialize.h: In function ‘float16_default_nan’:
>> /source/qemu/include/fpu/softfloat.h:117:26: error: expected expression
>> before ‘{’ token
>>  #define const_float16(x) { x }
>>                           ^
>> /source/qemu/fpu/softfloat-specialize.h:95:12: note: in expansion of
>> macro ‘const_float16’
>>      return const_float16(0x7E00);
>>             ^~~~~~~~~~~~~
>> make: *** [fpu/softfloat.o] Error 1
>>
> 
> Also:
> 
> $ make subdir-armeb-linux-user -j2
> 
>   CC      linux-user/signal.o
> In file included from /source/qemu/linux-user/signal.c:24:0:
> /source/qemu/linux-user/signal.c: In function ‘restore_sigframe_v2_vfp’:
> /source/qemu/linux-user/qemu.h:472:8: error: lvalue required as left
> operand of assignment
>    ((x) = (typeof(*hptr))(                                             \
>         ^
> /source/qemu/linux-user/qemu.h:481:31: note: in expansion of macro
> ‘__get_user_e’
>  # define __get_user(x, hptr)  __get_user_e(x, hptr, be)
>                                ^~~~~~~~~~~~
> /source/qemu/linux-user/signal.c:2209:9: note: in expansion of macro
> ‘__get_user’
>          __get_user(float64_val(env->vfp.regs[i]),
> &vfpframe->ufp.fpregs[i]);
>          ^~~~~~~~~~
> /source/qemu/linux-user/qemu.h:477:13: error: left-hand operand of comma
> expression has no effect [-Werror=unused-value]
>       (hptr)), (void)0)
>              ^
> /source/qemu/linux-user/qemu.h:481:31: note: in expansion of macro
> ‘__get_user_e’
>  # define __get_user(x, hptr)  __get_user_e(x, hptr, be)
>                                ^~~~~~~~~~~~
> /source/qemu/linux-user/signal.c:2209:9: note: in expansion of macro
> ‘__get_user’
>          __get_user(float64_val(env->vfp.regs[i]),
> &vfpframe->ufp.fpregs[i]);
>          ^~~~~~~~~~
> cc1: all warnings being treated as errors
> /source/qemu/rules.mak:66: recipe for target 'linux-user/signal.o' failed
> 
>   CC      linux-user/arm/nwfpe/fpa11_cpdt.o
> ...
> /source/qemu/linux-user/arm/nwfpe/fpa11_cpdt.c:37:4: note: in expansion
> of macro ‘get_user_u32’
>     get_user_u32(float32_val(fpa11->fpreg[Fn].fSingle), addr);
>     ^~~~~~~~~~~~
> /source/qemu/linux-user/qemu.h:515:13: error: lvalue required as left
> operand of assignment
>          (x) = 0;       \
>              ^
> /source/qemu/linux-user/qemu.h:536:32: note: in expansion of macro
> ‘get_user’
>  #define get_user_u32(x, gaddr) get_user((x), (gaddr), uint32_t)
>                                 ^~~~~~~~
> /source/qemu/linux-user/arm/nwfpe/fpa11_cpdt.c:37:4: note: in expansion
> of macro ‘get_user_u32’
>     get_user_u32(float32_val(fpa11->fpreg[Fn].fSingle), addr);
>     ^~~~~~~~~~~~
> 

These series doesn't fix all the problems, only the easiest to fix...

for this one, you need:

diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index 48184c380d..0c273d616a 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -425,7 +425,7 @@ static int get_float64(QEMUFile *f, void *pv, size_t
size,
 static int put_float64(QEMUFile *f, void *pv, size_t size, VMStateField
*field,
                        QJSON *vmdesc)
 {
-    uint64_t *v = pv;
+    float64 *v = pv;

     qemu_put_be64(f, float64_val(*v));
     return 0;

Thanks,
Laurent
