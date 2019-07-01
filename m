Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2781672wru;
        Mon, 1 Jul 2019 08:38:42 -0700 (PDT)
X-Received: by 2002:adf:aa93:: with SMTP id h19mr17240439wrc.3.1561995522024;
        Mon, 01 Jul 2019 08:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561995522; cv=none;
        d=google.com; s=arc-20160816;
        b=DVrK9MBEUZ+2TDe/0x3lGNuFg/Vef0c10s7EDPX1YpJmulnMQAREdH/fo3VsH/rLec
         La2DN+lXsjL1LgHWyBMqtdHVJpzRMalYknRUfAeBloqxWJ+t7Y8DZhj4BhQtX1fqAA3A
         52YPfzDAJYbtklOijVAKwlb8dShig15BDg9MxICWKDF99D9QjW7HkT7MtCWjkAxuVeRN
         kPdlpQ9IpDEUsmo2vwO+SxGfYq/eqo6XFaWuhsQCOMJ+QIxGAdl0o0A5bgpIK5MBVP+x
         N6Rd2WqY5bJI/zFVV2rWd2vS7QXcVvVH/fboXE+vooZ+pYtnTnqp9f6aR8DxIppi+A7W
         NTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=629NRyPUhZNuewwFSbDPwgl565ExKqQtzj/ELWQY6AM=;
        b=uxP1Jj69vbXmnulx1/XF4roHx2Yf16cyl1WBOghct+OrNBbZQ5fCKSxURCaGEaIzOm
         XAu2r1QRXfhEnN7QjUu8OC2dceyQpoh7OrE48FVY3OklUh04eLNsQAP7UTELobjFf7IN
         +BmAXlI15IpM6ZxDjdx1dMr594AOwGKKfBwLUhWTcW2t/MGHgVc25NO5bgazyZryjeOF
         EeT6DgGSzV0d26oYNElP4lABM2BUyiv4aE6QvrF/IbBHf9bHN09HMgE5JK03PwESzQOp
         3m+vovl7+OcFnDEqV6xAWKr2MM0llLvqLmlxQSYgMJupBqy+rtax34a/V7jFaCgykbsF
         CkuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t1sor5855054wmj.22.2019.07.01.08.38.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 08:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=629NRyPUhZNuewwFSbDPwgl565ExKqQtzj/ELWQY6AM=;
        b=CxaobAPLX1gKFTNYGgVRz4O7j5t8usBcv4artp3WFhiXjxJZN5ZIEhpp4PkHOaO4El
         7R82ho9KIVtMjdn/mVoeRiA268tw5grwHbG/i65Ua6p9qboOSSFOnSuMc+nrJD+irqn8
         iTttnC6KySUn3c/OPf8/PaotkNaZeVV6u0d8PK1oYPpJ7e7+9O/HHSKvjbQRgNKMf4px
         23fLycvSoyuYTB14EqS88fZDoGrCCRMqr6uZl+uKP2xpr4Q/Q+7n5uiKZsKgRVJJ+wsT
         LvfJDn8yyVeMm8bMMi4qrlU67JN3N5N2Gu3xileH1WyjpkoM0eKtUKkEpyWN2jB5IYDV
         69FQ==
X-Gm-Message-State: APjAAAUSVDG6kvBQ9W3NmZg3ZXeCOdBU6rQvl2D/kJ+73ZmDvo46sGav
	UV+X6ZXHLR5FHqzro5cXUu/28Q==
X-Google-Smtp-Source: APXvYqxA1IVwLGQghZhgm8oEIkJHfc7NFPxcNk2lOqh1ggwyybs4DBe3i/FcZ5cczg+xwfxrNvlwow==
X-Received: by 2002:a1c:eb16:: with SMTP id j22mr17086380wmh.140.1561995521740;
        Mon, 01 Jul 2019 08:38:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id q1sm8226051wmq.25.2019.07.01.08.38.40
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:38:41 -0700 (PDT)
Subject: Re: [PATCH v3 18/27] target/arm: Restrict semi-hosting to TCG
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong
 <yang.zhong@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Rob Bradford <robert.bradford@intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
References: <20190701132516.26392-1-philmd@redhat.com>
 <20190701132516.26392-19-philmd@redhat.com>
 <CAFEAcA_XGuB5x+m5zmdBSE3bQP=jBdfWDzj_v0iBeqWmrETsng@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c1d7b9cf-5a31-3c58-0284-97b4249660d7@redhat.com>
Date: Mon, 1 Jul 2019 17:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XGuB5x+m5zmdBSE3bQP=jBdfWDzj_v0iBeqWmrETsng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 5MuuYB2N1Djy

On 7/1/19 5:25 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 14:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Per Peter Maydell:
>>
>>   Semihosting hooks either SVC or HLT instructions, and inside KVM
>>   both of those go to EL1, ie to the guest, and can't be trapped to
>>   KVM.
>>
>> Let check_for_semihosting() return False when not running on TCG.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v3: inline call to g_assert_not_reached if !TCG
>> ---
>>  target/arm/Makefile.objs | 2 +-
>>  target/arm/cpu.h         | 7 +++++++
>>  target/arm/helper.c      | 4 +++-
>>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 49a0f05cd1..1b4da7aa45 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -20,7 +20,6 @@
>>  #include "qemu/qemu-print.h"
>>  #include "exec/exec-all.h"
>>  #include "exec/cpu_ldst.h"
>> -#include "arm_ldst.h"
>>  #include <zlib.h> /* For crc32 */
>>  #include "hw/semihosting/semihost.h"
>>  #include "sysemu/cpus.h"
>> @@ -29,6 +28,9 @@
>>  #include "qapi/qapi-commands-target.h"
>>  #include "qapi/error.h"
>>  #include "qemu/guest-random.h"
>> +#ifdef CONFIG_TCG
>> +#include "arm_ldst.h"
>> +#endif
> 
> Should this ifdeffing of the arm_ldst.h include have gone in
> another patch? It doesn't seem related to the change described
> in the commit message.

Surely patch 22 "Move M profile routines to m_helper.c"
