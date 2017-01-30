Received: by 10.103.86.17 with SMTP id k17csp1519626vsb;
        Mon, 30 Jan 2017 08:52:08 -0800 (PST)
X-Received: by 10.55.22.233 with SMTP id 102mr25728954qkw.102.1485795128936;
        Mon, 30 Jan 2017 08:52:08 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id e49si9915025qta.160.2017.01.30.08.52.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jan 2017 08:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id h53so20065128qth.3;
        Mon, 30 Jan 2017 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=7QOnQeIbun89q9Ev8AuDWM8kZnaK2PcsKjd6eb04+Kk=;
        b=ly8d1uGr8LMdm80/cajn3KkfWz2xEkfc2QBpYBlDQzBV1Fa7qr6DPZ3ETCVFm+uDDG
         HDb90nnZxyBQ4RcFqnJlozQVQBR+cCg5PqDxnTpmvj6dfUxKlu45dkNb04VY+0p2+UBO
         7rB1AQJU9fxjE0mxpPMkfDrBRKKaciendFNx5E8W0yaSsKPmnC4Ufess2RKcDW2nu2M0
         W7MSFtBJ8Pgv/1xKCNOv+Uuid2Rh8QTWJwgz0I3Pu8q50TF/G99TgUaXu+AmxilhMhF1
         X10lWBv1jYz0PUuAwmfO5VDfqhfp6q5PdVXlP2oVFt4NbXrTPmBweD6PiWqn73cmwqlo
         2iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=7QOnQeIbun89q9Ev8AuDWM8kZnaK2PcsKjd6eb04+Kk=;
        b=F2f1vRFfzX/4Ahbscj/1Z9Dym7TGQ6kqqpVL3dgPb/lOza3PDEG7X4DVMjUISmDz2A
         ZU6kXfvkGxWxOQ2jG1k+YSFSsxZelqpjgU0kAQVDvfAOmpfVTukJeOr1DB04nYF0N7eu
         0fJrs2PJwD1o+Ph4eOzsae65uzkdygEx5bFTmFjYjDdjCNa5jrM9bWptXp5WXGNtj8Eh
         2tHSxhsOuD8xX5Tpn8G3Yx5+Bry1RrVtOMdBSNEDDippdxqBLC/gwWjf9K41F/2TsKte
         vXzhPs3WbbVvD7ZOQ42TvGMVSp6GSqDbMao13XmhO1fqtytnNPOnfY9+bjJjVUmvIgOZ
         q6Uw==
X-Gm-Message-State: AIkVDXJCJ4wwgM+/M7xpdBGjOuwi5qMLr9IqpIlD4CLRgi9ee5c5EmpDpVXPwuUKn1Vz1w==
X-Received: by 10.200.47.53 with SMTP id j50mr20247831qta.273.1485795128594;
        Mon, 30 Jan 2017 08:52:08 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net ([2602:47:d954:1500:221:9bff:feff:8add])
        by smtp.googlemail.com with ESMTPSA id q5sm12691995qtc.36.2017.01.30.08.52.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jan 2017 08:52:07 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v8 08/25] tcg: drop global lock during TCG code execution
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pranith Kumar <bobby.prani@gmail.com>
References: <20170127103922.19658-1-alex.bennee@linaro.org>
 <20170127103922.19658-9-alex.bennee@linaro.org> <871svlr1od.fsf@gmail.com>
 <87d1f47tvv.fsf@linaro.org>
Cc: mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, nikunj@linux.vnet.ibm.com,
 mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com,
 bamvor.zhangjian@linaro.org, Peter Crosthwaite
 <crosthwaite.peter@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <27a34e99-c862-a1c3-1357-9c937914ae10@twiddle.net>
Date: Mon, 30 Jan 2017 08:52:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <87d1f47tvv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: B/KQ/oIGBqeu

On 01/30/2017 01:57 AM, Alex Bennée wrote:
>>> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
>>> index a9ee7fddf9..2624d8d909 100644
>>> --- a/hw/intc/arm_gicv3_cpuif.c
>>> +++ b/hw/intc/arm_gicv3_cpuif.c
>>> @@ -14,6 +14,7 @@
>>>
>>>  #include "qemu/osdep.h"
>>>  #include "qemu/bitops.h"
>>> +#include "qemu/main-loop.h"
>>>  #include "trace.h"
>>>  #include "gicv3_internal.h"
>>>  #include "cpu.h"
>>> @@ -733,6 +734,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
>>>      ARMCPU *cpu = ARM_CPU(cs->cpu);
>>>      CPUARMState *env = &cpu->env;
>>>
>>> +    g_assert(qemu_mutex_iothread_locked());
>>> +
>> tcg_debug_assert()?
> Depends if KVM can use this for emulation as well (which I think it can).
> 

It probably could, but it shouldn't.  Let's not leak tcg_* into hw/.


r~
