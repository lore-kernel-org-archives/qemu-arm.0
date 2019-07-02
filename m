Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3855483wru;
        Tue, 2 Jul 2019 07:18:15 -0700 (PDT)
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr3380633wmc.22.1562077095335;
        Tue, 02 Jul 2019 07:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562077095; cv=none;
        d=google.com; s=arc-20160816;
        b=wf3BvsJ8bQyDZipf1DurG7/Yf08NgTzkYWPNV7OiuMZ4G4Ply62JnTIc40TJfy9wGB
         L4D6P8hgFdg5/TDFV1O9CjCBfNbOObTohkWvDVlv03m/q9/n7ibSQC9bLC9RXTdxVmF3
         Vl9XI6IVpDgQq3qZ9oxVMsN+//ucWRrvIo7JiQ5dSaiLTF+TfYt5wlcJZf9ya7h+gAob
         qwNcCSw3XXEMVqiP9AMAIHHT9GOLkh70lrXfWB+aeB3mus78kEVqXFeG7fDqgyIfI7P3
         UjJorwZUnw8A838aaq+Z7BXUmfmS2wGsCzGqsg3PkR9LgWDDyR17FKH87hS5iLdWemwO
         psuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=ycPWOHZ1BiCQaixmh2lB3gnp7J7qHQ68WKc90qzNU5o=;
        b=r8x/t7EN6187/h0viS8h8C6FfaNdEuKsQOdIFsnbHFGBOy+1eZsMebrTM9oqvSq8QS
         VTVyCEAombqqtGHT8U5jaqbsQOnqRQcdDnwT1F35TLOrQbTnb3pJfgm7DgTqdVq43rMk
         amb/hKcfowOyT7e2igWDDFr1NwnghE6SMiHWgFpX6t8W0heFDt6kDBRU1hmrapoEB0pO
         SCj6nrxQhFhQP96WOS+Ah7NZI6TI6IFic+7mE+AJB4NgMhDSPW649T3zEj6HLQ4blyvT
         z6ohxKBhd8H2wzV2D3GAiYI5qf233nSfYuw57aU+byxF+iWewtzYUk3Zddb2wvTXPR4f
         B0bA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v17sor10564782wrw.44.2019.07.02.07.18.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 07:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ycPWOHZ1BiCQaixmh2lB3gnp7J7qHQ68WKc90qzNU5o=;
        b=UynlBdAGWmdxgGwCoJAXQN1r/00kDV1/SnEqmb6QPQkiT+4Ji7kTgllFKEZ+b1l95j
         Dgt8iDPh5mpLoYsJMBvB+Ny1xxMmMEppVHEZjjxiql+f9bPuviD3yiO3qE0kcPjBWmxY
         tpXl2ZVIgnyuRvYsjvsz0YG2jgNNie6hhdp6k7QsLcsIAVjwtKsb6o4VA21ig+MeWW61
         vbWXjY3JpMwdBakidSjsmZTaNWAy8k6iUoMZUAmznU6OXR9KaT3J+8I5ufnCq33iYoml
         M6ETkJf+OIVVqxzgXSLRAq8GN9jUcLRkMK6eUMziE/4THETtpQHmIMXYwsUuJ9zGDW3a
         cJ8g==
X-Gm-Message-State: APjAAAXAp6CueMJiwv5O4UNQcb528G4HqTr3y0d1sVxSd8K+NLtk6493
	VLeLNARChf0+MTS22appPV8+RVZ9ioA=
X-Google-Smtp-Source: APXvYqxcTBzxRQ/AnK8eUHsT+x0ZvCtrXznppplhoH60ie3qupT/91jV68QLyzTs9JLirWTPEqD7Hw==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr8019657wrn.52.1562077095111;
        Tue, 02 Jul 2019 07:18:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id z126sm4037859wmb.32.2019.07.02.07.18.13
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:18:14 -0700 (PDT)
Subject: Re: [PATCH v4 3/8] target/arm/helper: Move M profile routines to
 m_helper.c
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Jones <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, Thomas Huth <thuth@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
 <20190701194942.10092-4-philmd@redhat.com>
 <CAFEAcA99QK7u+Rev5C9Xb_vmnGSZvx9EO+8D_fFB1qFmiMejcA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e15783bc-660f-f8ba-e1ed-1ec870de9474@redhat.com>
Date: Tue, 2 Jul 2019 16:18:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99QK7u+Rev5C9Xb_vmnGSZvx9EO+8D_fFB1qFmiMejcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: MgfsAVG06Kkl

On 7/2/19 4:01 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 20:50, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> In preparation for supporting TCG disablement on ARM, we move most
>> of TCG related v7m/v8m helpers and APIs into their own file.
>>
>> Note: It is easier to review this commit using the 'histogram'
>>       diff algorithm:
>>
>>     $ git diff --diff-algorithm=histogram ...
>>   or
>>     $ git diff --histogram ...
>>
>> Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> patch generated with git diff --histogram.
>>
>> v4: rebased
>> ---
>>  target/arm/Makefile.objs |    1 +
>>  target/arm/helper.c      | 2661 +------------------------------------
>>  target/arm/m_helper.c    | 2676 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 2681 insertions(+), 2657 deletions(-)
>>  create mode 100644 target/arm/m_helper.c
> 
> This patch doesn't compile:
> 
>>
>> -hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>> -                                         MemTxAttrs *attrs)
>> -{
>> -    ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>> -    hwaddr phys_addr;
>> -    target_ulong page_size;
>> -    int prot;
>> -    bool ret;
>> -    ARMMMUFaultInfo fi = {};
>> -    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
>> -
>> -    *attrs = (MemTxAttrs) {};
>> -
>> -    ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
>> -                        attrs, &prot, &page_size, &fi, NULL);
>> -
>> -    if (ret) {
>> -        return -1;
>> -    }
>> -    return phys_addr;
>> -}
>> -
> 
> ...it deletes the definition of arm_cpu_get_phys_page_attrs_debug(),
> which should stay where it is.

Grrrrr I missed that rebase failure within the 2676 lines.

I am sorry and ambarassed I failed at notice it doesn't even compile.
