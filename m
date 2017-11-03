Received: by 10.223.150.237 with SMTP id u100csp288307wrb;
        Fri, 3 Nov 2017 14:27:52 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TzlA5ciOVr04yWZsPvLQ1O4qKoJtQBdv7MNobZ09/0H3L+HTrjvZqhwzb0MzWGeA06Vyxt
X-Received: by 10.129.158.208 with SMTP id v199mr5432236ywg.49.1509744472890;
        Fri, 03 Nov 2017 14:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509744472; cv=none;
        d=google.com; s=arc-20160816;
        b=Qz8Csb8c9PD+O8NwhSS8OJKkIlt14s17FGaqJUIliD/F2WVFQvyY0SJ5p+FAUaEk6j
         OiQdrXSOVFMrKs5uBUEk/bYl9HC0PDbPZCVAXhvt3zjAGgyfsvX45GLmHAkHVheVtI1y
         lTl/RhrslzPEqswspUUJYJFyRRGEl4kbVog0XnWdYIWEwJh7wKjF7vYwRCm/c0+suDGx
         oQZbhvfUIYaLdc4IOLH+F+5qAPQGZdlHcn/Z0TQHRCXquvK4Py8G/8Z+YLjFboWiKEfU
         wBI8P88iyF6SfgF/e0IQmRAUTMEseT6HU5kAFfxRH4sdANhcYchvPiLiTLmFc1Lu5p0l
         uvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VXDTgZHECqPMbigliUFPcfrHxDwHAS6KQyXZRU/ECwU=;
        b=PcN7+ef5I4ctuXypPHwxzsA2gLofcl8KkDzE4KSPovQfQqAw11Fegsp0nyZt2R86B8
         OaMAEoKCfKNL55dvrsmXRFTRJKTKBSM0WO5ZBx3JifDLI46N+StuwDFgledTKxUqWWne
         vyob0M15eFw2LBki8aDLNpx97DkDxFpyvpXUXZC+d2Gsy+NNcDMGZ7K4IcwqzABP/971
         rQvyUKD7YFHmFMI1RPw87kXAp4W277CqS7WbGcu+wUJhPdj2TsV7JNQTI/qAZCB1A65G
         pk5muaTPwbFdg3yDs61Io3m57JaDXL6SuZlb7+B3xwWlmEE+2QbOzYm7aFmDziHWEzmg
         BdeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eUnGmoVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x66si1605466ybx.647.2017.11.03.14.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 14:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eUnGmoVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAjVI-00012j-D7
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 17:27:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eAjVB-00012d-Rx
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 17:27:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eAjV8-000294-O5
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 17:27:45 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46338)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eAjV8-00028o-KD; Fri, 03 Nov 2017 17:27:42 -0400
Received: by mail-qt0-x243.google.com with SMTP id 1so4885789qtn.3;
	Fri, 03 Nov 2017 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VXDTgZHECqPMbigliUFPcfrHxDwHAS6KQyXZRU/ECwU=;
	b=eUnGmoVdhMpwdMMgZhokkIDrRSHwAbdcqlKtDuzvPrL/4GRN41D3YEfvRHQMLzRJkp
	7dTxm6Xu1QQ1rei7LMPYMAyBX1TbfSw+fZbH19vqatzTUbzhPNEjEouCdvG2bTMkKgBZ
	6YoaKxaAj2YoXoHNVCqfbcbVfWTJFQ73v+A5Uq/Ke85LJUYR0zVLXm+o6d2XNWe9dWDK
	H/VMv2BqZtTXVLYU5FaX4+TSzg8rV6iB7O3QB4PJ9xT66cJQu2Xwbvsuut/k3BGY63KR
	i5casYiTgAgBoibyGOmS0Z4Nvz9VjLDwOoHEJndzARRuXGxVG0fyaGQQ5WOIm+4fAwHp
	VB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VXDTgZHECqPMbigliUFPcfrHxDwHAS6KQyXZRU/ECwU=;
	b=oOuC96WQ3ntTjtaDZZ2X1BON1IZorKMEg6azo7wimWhCGJUulDH4VPpa4Y9CKszHay
	e1nLdTZcWT2LikrHVfZEkrt+j54goPLTxh9SQfy+3w2kTyMTCiM2WQK7owjEfI26MAPB
	OZo9EZxBBDKrvmwZxS9YB4ZFZ7xGxNKC4au3QjU7n2QCycRgwzQ7IyOofyUmyK4Pl3aR
	IzmVmH14Xbwgf88OYjl3MzZ8b66y1Qf8KVsZoHd7m1BfwL9SP/vIRauOakSjkGXWXQts
	X80ok4I30XKgMvlTVfym8ysTvXjOne4Fol8P/b9qknSoKy/uaotyBBHFkUk2SoUOm4Br
	mOvQ==
X-Gm-Message-State: AJaThX6k4qgWc1gZC/OFoX44E4V5kvvICgimtSAwvZAs97MA96G5P0vH
	5CKKbZZx4qAP7SvFXZI8mKY=
X-Received: by 10.237.55.200 with SMTP id j66mr12205202qtb.210.1509744462080; 
	Fri, 03 Nov 2017 14:27:42 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	s22sm4569787qta.67.2017.11.03.14.27.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Nov 2017 14:27:41 -0700 (PDT)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20171103202624.5956-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <db255c93-a4c6-216d-8ea3-10f340a916f6@amsat.org>
Date: Fri, 3 Nov 2017 18:27:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103202624.5956-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
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
X-TUID: 0ZhW3glOzcm0

Hi Laurent,

On 11/03/2017 05:26 PM, Laurent Vivier wrote:
> This series fixes some errors found by
> enabling USE_SOFTFLOAT_STRUCT_TYPES.
> 
> Most of them are helpers using int types
> instead of float types.
> This also requires the use of floatXX_val()
> and make_floatXX().
> 
> Laurent Vivier (4):
>   arm: fix float64 helper definitions
>   openrisc: fix float32 and float64 helper definitions
>   tricore: use make_float32() and float32_val()
>   softfloat: use floatXX_val() in XX_minmax()
> 
>  fpu/softfloat.c              |  8 +++----
>  target/arm/helper-a64.h      |  6 ++---
>  target/openrisc/fpu_helper.c | 52 ++++++++++++++++++++++----------------------
>  target/openrisc/helper.h     | 20 ++++++++---------
>  target/tricore/fpu_helper.c  | 34 ++++++++++++++---------------
>  5 files changed, 60 insertions(+), 60 deletions(-)
> 

I'm getting those errors:

$ make subdir-arm-softmmu -j2

/source/qemu/migration/vmstate-types.c:430:5: error: conversion to
non-scalar type requested
     qemu_put_be64(f, float64_val(*v));
     ^~~~~~~~~~~~~
make: *** [migration/vmstate-types.o] Error 1

In file included from /source/qemu/fpu/softfloat.c:87:0:
/source/qemu/fpu/softfloat-specialize.h: In function ‘float16_default_nan’:
/source/qemu/include/fpu/softfloat.h:117:26: error: expected expression
before ‘{’ token
 #define const_float16(x) { x }
                          ^
/source/qemu/fpu/softfloat-specialize.h:95:12: note: in expansion of
macro ‘const_float16’
     return const_float16(0x7E00);
            ^~~~~~~~~~~~~
make: *** [fpu/softfloat.o] Error 1
