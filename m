Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1809454ejt;
        Tue, 28 Nov 2023 03:45:00 -0800 (PST)
X-Received: by 2002:a05:6402:d6b:b0:54b:1a4c:870a with SMTP id ec43-20020a0564020d6b00b0054b1a4c870amr6776884edb.5.1701171900698;
        Tue, 28 Nov 2023 03:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701171900; cv=none;
        d=google.com; s=arc-20160816;
        b=x9jSPbEMqf2AtnYbdK1AyDYQQ5nOzPQpsImbVL4H5nqRtM5/EpVRd5PM0as0pGa4Yr
         nJ7wENZ3+/XRMAnwnA+MCtAYr24hw01HbpV8XXdCjNFjF5TvUGKUVCxVP19m99CAoSUr
         KwhRdo9WhqUUQHly/0lB1biWyQfG2ohiudCcrng0UlDWQX29SvfXKIir02B69SpyaPAY
         rx0v925K6c+80o01TunMTrIMcXqIUp8Mfpe3TpnWOUniTnE93+R0DsFfqXHa/d2ILBds
         ZVbOsH3jBi0S/IPd3S7GZcvzwdIs64rTXWPxzAkmlI/Mt95J5f2PSTEKa9RkTDZD76py
         LTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fY+zgyNlH3HP/fcFI3nAgR1hmj5MinaOr/zzJ49EWhA=;
        fh=YjYa/2fMB6xNWEqzY61bQryuBlH6t+BIfyO3Kax7jCY=;
        b=Ft/6TpSJIZBp+XQv5AitZE+TGJSJ/pcadGPfoVtnhn2wIa73ROSIuE9+JAc6YQfryS
         gYdfl3r28CopM33lVSclLTdjlTSv9ggAy116TnptcHPdlvOzyXudN8jcPRAmc65riH9g
         REECROmfZa34/k9H+WfIByjVrvoT6RWmharVRrMgatQy1csmKt2+VJROjKFsoY6EBU6W
         +9BWKzhygGlWbdPODYpFF4biQy/rYF5uOtX6uBNn35lzvLB4LI7ZqqVOXY3mBC/LnOZi
         3uxvIo5LaJ3GBGM+IVvU1b9EjCfN7HlxZ1gPdLGtO23hCYTDwpN1/nomG6dNZCBxF7Kq
         rL8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xeYFNJq9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o4-20020aa7dd44000000b00543597cd198sor2493940edw.8.2023.11.28.03.45.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 03:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xeYFNJq9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701171900; x=1701776700; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fY+zgyNlH3HP/fcFI3nAgR1hmj5MinaOr/zzJ49EWhA=;
        b=xeYFNJq9oapb8medstgozesUMhoIERGLKVavdoLs2YZzGXFqFqpzcringJgWR3kORk
         So7uA9rRaPchI4+03eW9k5eGe8g5tN0bvZhnDV62ak4+U/BmSGB3zGZHDba8CAJfsRYO
         7JbSh/LIJuBdgdv92IHoYGPEiaKocFgwbGOFAkPaX5tEpYkH8pDO0CrQu0nLvHGXqVyH
         3vMn6vDSmPiI7Eyb8OYaeBEDkWMMFmJOptZ7YkWw6ZHsO/CPapWZ6rzIN0UGvLp8njbD
         P46s8cSqisg6MZvgm9pqgKGmhmb8Gfc8LyOKoSkgQQjnF8TNSeJQN2DkHRnSsOjCOLwQ
         hhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701171900; x=1701776700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fY+zgyNlH3HP/fcFI3nAgR1hmj5MinaOr/zzJ49EWhA=;
        b=gVQe9Cg4sMk4JiQHWRWEDu3KasXIf4J27RrRCYtAhvWRbbuGY7ACzh3Gnzn7m2uVJd
         K4z3OKvt/4NvbYtXt5NrGPQu6CphU3jbfOM+l3MSlcxwm25+6o/xPq026HT14Cf80TfS
         beYNSI1gUTaDph1H+reOFxn4L5F20OUm0jZVhjQOL04ib3jYm69jy+rAZvixCCvMl90n
         CAuvrnJr5SfhO7hYvK63PekqxCz4mTWwfZLu7jLW2U91aF0ksLlsgWO04Xh0GJFU3zaE
         t1QPsJZsCAnyNElIx2yYi5YGIOQw2QQJGBz446H27PZ3qMFTc8LjkCjnRsgY0m0TB2dE
         ib2w==
X-Gm-Message-State: AOJu0YwtPapc2e3nVqvVQLgbp2ujQFQP5xjXsQ+Coew1rEO0arKWsbJz
	xn4ga4aV32ed2byEIXwQkbbkl1oh
X-Google-Smtp-Source: AGHT+IEWu6MtBVGxT2PopjytuHZws/TRrw4z4Q/v/tur+qUVXEM1Cu3oXAVdoFiJTmoQKnWX7doj1Q==
X-Received: by 2002:a05:6402:d6b:b0:54b:1a4c:870a with SMTP id ec43-20020a0564020d6b00b0054b1a4c870amr6776874edb.5.1701171900323;
        Tue, 28 Nov 2023 03:45:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr. [176.184.13.61])
        by smtp.gmail.com with ESMTPSA id l1-20020a056402230100b00548ab6c9f12sm6279125eda.54.2023.11.28.03.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:45:00 -0800 (PST)
Message-ID: <2830159e-3d6d-430b-aed7-43b1b4fce56e@linaro.org>
Date: Tue, 28 Nov 2023 12:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, quintela@redhat.com,
 dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-5-beata.michalska@linaro.org>
 <95cc7c22-939f-4ce0-aecd-d0ff7b0e7c9c@linaro.org>
 <CAFEAcA-G7hbnRv52btWkpDs-1rgFqyVGgRVx-hG40i7zgsykaQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-G7hbnRv52btWkpDs-1rgFqyVGgRVx-hG40i7zgsykaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t5AtyB9e/CY2

On 28/11/23 12:34, Peter Maydell wrote:
> On Tue, 28 Nov 2023 at 11:24, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi,
>>
>> On 6/11/19 00:41, Beata Michalska wrote:
>>> ARMv8.2 introduced support for Data Cache Clean instructions
>>> to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persistence)
>>> - DV CVADP. Both specify conceptual points in a memory system where all writes
>>> that are to reach them are considered persistent.
>>> The support provided considers both to be actually the same so there is no
>>> distinction between the two. If none is available (there is no backing store
>>> for given memory) both will result in Data Cache Clean up to the point of
>>> coherency. Otherwise sync for the specified range shall be performed.
>>>
>>> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
>>> ---
>>>    linux-user/elfload.c |  2 ++
>>>    target/arm/cpu.h     | 10 ++++++++++
>>>    target/arm/cpu64.c   |  1 +
>>>    target/arm/helper.c  | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 69 insertions(+)
>>
>>
>>> +#ifndef CONFIG_USER_ONLY
>>> +static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
>>> +                          uint64_t value)
>>> +{
>>> +    ARMCPU *cpu = env_archcpu(env);
>>> +    /* CTR_EL0 System register -> DminLine, bits [19:16] */
>>> +    uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
>>> +    uint64_t vaddr_in = (uint64_t) value;
>>> +    uint64_t vaddr = vaddr_in & ~(dline_size - 1);
>>> +    void *haddr;
>>> +    int mem_idx = cpu_mmu_index(env, false);
>>> +
>>> +    /* This won't be crossing page boundaries */
>>> +    haddr = probe_read(env, vaddr, dline_size, mem_idx, GETPC());
>>> +    if (haddr) {
>>> +
>>> +        ram_addr_t offset;
>>> +        MemoryRegion *mr;
>>> +
>>> +        /* RCU lock is already being held */
>>> +        mr = memory_region_from_host(haddr, &offset);
>>> +
>>> +        if (mr) {
>>> +            memory_region_do_writeback(mr, offset, dline_size);
>>> +        }
>>> +    }
>>> +}
>>
>>
>>> +#ifndef CONFIG_USER_ONLY
>>> +    /* Data Cache clean instructions up to PoP */
>>> +    if (cpu_isar_feature(aa64_dcpop, cpu)) {
>>
>> Am I correct understanding this is a TCG-only feature?
> 
> For KVM, whether the vCPU implements these cache
> maintenance instructions is up to it -- like all insns,
> QEMU doesn't ever see if the guest executes them or not
> (either the host CPU just implements them, or the host
> kernel traps and handles them). The code in this patch is
> specifically for the QEMU TCG emulation of them.

Thank you Peter. In this case I'm compiling HVF, but this is the
same reasoning. I'll add #ifdef'ry similar to ats_write() (commit
9fb005b02d "target/arm: Restrict the Address Translate write operation
to TCG accel"):

-- >8 --
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 99c7da9ca4..a05e613e10 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7629,6 +7629,7 @@ static const ARMCPRegInfo rndr_reginfo[] = {
  static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
                            uint64_t value)
  {
+#ifdef CONFIG_TCG
      ARMCPU *cpu = env_archcpu(env);
      /* CTR_EL0 System register -> DminLine, bits [19:16] */
      uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
@@ -7653,6 +7654,10 @@ static void dccvap_writefn(CPUARMState *env, 
const ARMCPRegInfo *opaque,
          }
  #endif /*CONFIG_USER_ONLY*/
      }
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
  }
---

Regards,

Phil.
