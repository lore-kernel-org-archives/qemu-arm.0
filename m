Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2812481wru;
        Mon, 1 Jul 2019 09:10:49 -0700 (PDT)
X-Received: by 2002:a7b:c051:: with SMTP id u17mr44101wmc.25.1561997449357;
        Mon, 01 Jul 2019 09:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561997449; cv=none;
        d=google.com; s=arc-20160816;
        b=VM8iS+6qryhA1lnw9MXs/9wWqNFLqntjXN8OPDD/yt69TxKxFeTkCrWwRoB6yWz/Rj
         trA+2WF02jKqIzui4SDH5PPah/7DE06mWZdgSPHQhaPcVULTr0kqLzHjr/+13cRmU5Mf
         uhfM7UfwvN3BFkqUt+vcmtz5fn/McuSGLMHDt5zi6H22cMLD2klVzSLEFNaWRlU+wvzm
         tJAPaHb/bCrwhFhjtMKFi8jSRvXEVKwwxyWwxM+VNRN3suPIUllJaLPbRYkxwywbgTOe
         iYe9TOjnC0xS7+9D9qyQa4j8SzfvKo8tXdCY75lsvN7r5fshE7gI3iEdDlYJDjYkTqNS
         Nzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject;
        bh=10yZI/muh+73lK/04GqqDUvPPHFVE9whFCtaqA1pr88=;
        b=Oo7CnNsM6EYy7G5CurPtyLDAL4nTLKdxdhUK+M1uxY6e1vjNY+gLaeIlNop7djU3qG
         CgvLm3kbiGOLsZhtZsexuzwoEUq68Q5qqa5WpKedwrfa9QwBkmfSayPRkpe5H4nmB/8A
         rylG131AOgXlAEaPF/QNnI2+9uPTWL4PhGSo/uijDF4/OTT67nj9bV9QOUn/iPrDD7hn
         g8M2bfcEJxXqiBkRGyqVyDHTyZ5jueqo4kMb2imSxTWKTwfZWSCA29ZMk2gG5c8sJzGP
         q9VPBDl9n6ISfKbH6rBuq2SiOVIqvU6Uw/KQUg69iM9PFQaIxjQPNV2j+6l2QrTJm+iM
         NpMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i11sor2003726wrm.36.2019.07.01.09.10.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 09:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10yZI/muh+73lK/04GqqDUvPPHFVE9whFCtaqA1pr88=;
        b=U4Ip6eA94Jb+l0Y6O8zdCu0CYNbVUwxQt8UsnBsjsT3d0cPG/fFEl9CRgSc2LsxsXS
         QVdNfQJ22rq9A6SK+E8xmb+XxsxYivy/RKx8pL5YyMMi6+sJnuYsISEDFQRu0STiDXiw
         MP7EVUCNa/NlhAy28TrFxpIbbtjn0yX6bE3WP3zWo9IFAy9gL5WE5A5G+gMgOcD0p29r
         ciA8AHG3eDC7X0awSgX60ZjwKm2gFQfHWCYC/ASqhdD3imkjvZPe+70Bw7mUu6o8rfLJ
         jqQnLfgbSkD70ud81MwlFDwOb6p4LbUUOtiDPPZ5ouyEbL2avgno6pIObsyHsXKmM98h
         heJQ==
X-Gm-Message-State: APjAAAVmUbeyt9QFRvrg608rX/zHVL5Y2gIDvRMb4ew+6QoBP6xsgr5v
	OkdsCxZoeSJya/6x1aTSHjKSIA==
X-Google-Smtp-Source: APXvYqzt2r1DkpMn3PhTB7ogdQ6ANa0Q6a2okCO1M8rO93+ZJikDEgItmjacHoHpMItWhsv2feijbg==
X-Received: by 2002:adf:f706:: with SMTP id r6mr10399997wrp.23.1561997449027;
        Mon, 01 Jul 2019 09:10:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id p4sm11490618wrx.97.2019.07.01.09.10.47
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 09:10:47 -0700 (PDT)
Subject: Re: [PATCH v3 18/27] target/arm: Restrict semi-hosting to TCG
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong
 <yang.zhong@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Rob Bradford <robert.bradford@intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
References: <20190701132516.26392-1-philmd@redhat.com>
 <20190701132516.26392-19-philmd@redhat.com>
 <CAFEAcA_XGuB5x+m5zmdBSE3bQP=jBdfWDzj_v0iBeqWmrETsng@mail.gmail.com>
 <c1d7b9cf-5a31-3c58-0284-97b4249660d7@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1888add4-ae43-43fe-d8c3-8aa447742330@redhat.com>
Date: Mon, 1 Jul 2019 18:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c1d7b9cf-5a31-3c58-0284-97b4249660d7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1i01Opw/Ig4e

On 7/1/19 5:38 PM, Philippe Mathieu-Daudé wrote:
> On 7/1/19 5:25 PM, Peter Maydell wrote:
>> On Mon, 1 Jul 2019 at 14:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> Per Peter Maydell:
>>>
>>>   Semihosting hooks either SVC or HLT instructions, and inside KVM
>>>   both of those go to EL1, ie to the guest, and can't be trapped to
>>>   KVM.
>>>
>>> Let check_for_semihosting() return False when not running on TCG.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> v3: inline call to g_assert_not_reached if !TCG
>>> ---
>>>  target/arm/Makefile.objs | 2 +-
>>>  target/arm/cpu.h         | 7 +++++++
>>>  target/arm/helper.c      | 4 +++-
>>>  3 files changed, 11 insertions(+), 2 deletions(-)
>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 49a0f05cd1..1b4da7aa45 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -20,7 +20,6 @@
>>>  #include "qemu/qemu-print.h"
>>>  #include "exec/exec-all.h"
>>>  #include "exec/cpu_ldst.h"
>>> -#include "arm_ldst.h"
>>>  #include <zlib.h> /* For crc32 */
>>>  #include "hw/semihosting/semihost.h"
>>>  #include "sysemu/cpus.h"
>>> @@ -29,6 +28,9 @@
>>>  #include "qapi/qapi-commands-target.h"
>>>  #include "qapi/error.h"
>>>  #include "qemu/guest-random.h"
>>> +#ifdef CONFIG_TCG
>>> +#include "arm_ldst.h"
>>> +#endif
>>
>> Should this ifdeffing of the arm_ldst.h include have gone in
>> another patch? It doesn't seem related to the change described
>> in the commit message.
> 
> Surely patch 22 "Move M profile routines to m_helper.c"

The ifdef belongs to this patch, but some part of this patch slipped to
"Move M profile routines to m_helper.c" while rebasing:

-- >8 --
@@ -10401,6 +8260,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState
*cs)

 static inline bool check_for_semihosting(CPUState *cs)
 {
+#ifdef CONFIG_TCG
     /* Check whether this exception is a semihosting call; if so
      * then handle it and return true; otherwise return false.
      */
@@ -10476,6 +8336,9 @@ static inline bool check_for_semihosting(CPUState
*cs)
         env->regs[0] = do_arm_semihosting(env);
         return true;
     }
+#else
+    return false;
+#endif
 }
---

check_for_semihosting() is the only code using the ldst API.

Thanks for noticing this,

Phil.
