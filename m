Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2338851ejb;
        Fri, 8 Dec 2023 06:00:54 -0800 (PST)
X-Received: by 2002:a5d:488b:0:b0:333:43b5:6ec0 with SMTP id g11-20020a5d488b000000b0033343b56ec0mr15166wrq.114.1702044053867;
        Fri, 08 Dec 2023 06:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702044053; cv=none;
        d=google.com; s=arc-20160816;
        b=tGLojKMnDmJXjHM2R3LKgiENnVwBhZZhPRyAzmW3Lj66GXbWlyiYgmp+qN+26ifMue
         74pi8Hpl0THy89U2Vmm+JFUSH4yyJ898BF88liwYK98w5WV99sypfGbH/6CTZvzG9a3X
         mDaLu3KkBMIASMwBuYdW0Y2BBg8rQpi2SeJ8nzcuNt8F94ZCofefK95i04wGQhAsCoIo
         COGa56dxCD3x6t+KLXvM3tQ3XA6IGNz4bEynZPU6pVq8bqzOR9S9XEE7xWQ23x2Q03Vl
         P8TYWmIhqyrEG1LM6ne5M2eXmSesqaeScPGNNu9LOybRWrarv9Rc4Yduq9ScqPpDO3+S
         8NHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6sbieA5Qc2+0DWsbpOrqV4Cag6SkOK2ipyny+MT0vvc=;
        fh=9cOVb+Ycbfrp7ZVqGgVb4aojJkw9k53B7TmGhlwoXWI=;
        b=qx/kCrFMIkThpHHAfLncCmbiDIDItp39vr7doQeTE+FDecUYWvvfo8HqOM6jEmR5Ac
         ire2fPWTsPCSdySUx+9bEjEeDum/Y6RnZNzXphq5H4yP511oPIOA7r6mlvkYmRFQQqE8
         MeFFfiXwdCLDj3+PuBeK0WwAVkgH6Xgatcf+r26UhUiw2EJehkpNFRxhOnPL3hsAfKZS
         KKGvOPG/Z6Dd1lhZwYPCWkgzBFpENc6LXiqDegotf8q6bmZtGiKnIgOFQLtLy1NjaYsO
         JnLR9heUQZaOCpA0TOQz0sgFjRuptS6PgQIjdAr+J5kZFo/6B4MDHdgfSJWe+hwkd9ZO
         vIZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EpgzJzrf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1-20020adff841000000b0033340c12001sor637927wrq.5.2023.12.08.06.00.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Dec 2023 06:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EpgzJzrf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702044053; x=1702648853; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sbieA5Qc2+0DWsbpOrqV4Cag6SkOK2ipyny+MT0vvc=;
        b=EpgzJzrfMXPwEwolXq5Xuhb2nzyjXnaI2nE0oFkCiJgltncICIvXuE2tgl3dnqVRl1
         RZdYDGVmv1PuFQdcogGJDJKLWGQcGXUOjt1m7VMns+WPZRggMhFKXrkPTTgAJHcgVRAR
         CiRoSu+BJ5xj1ZQG/H+RU60Pf1DAHuEzablGmJzU/zj1U05lic4wMJF0FRoTuVNE9Ewp
         6T9oGbrNRE9os7A2XuBJ5JV4oEYpDpA3P+q0dU/72fHJTO71gBTMi3L8w+oesy8Fok4y
         mJB4RtYHypG7qxtXQaoNVO23FgKunCcYus/6c5Qspf7AXYeigvoJgw47h3ZGNekqow0r
         kIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702044053; x=1702648853;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sbieA5Qc2+0DWsbpOrqV4Cag6SkOK2ipyny+MT0vvc=;
        b=KUSo7FtwHE8HaXgQUPmD53zcw8oGpYGicOLq89sZv3I2QlIj4pKPRrfvaB488vFidW
         OJDE11kH2uhjOOiWf+/zUq1TVhxWC9WHBOhcTJA8aSNgxPCsv5TMBOKhIY0XsSpw2Q1b
         MiKsmwoVes5Q9BHpwHaziOtkrRF/a9woCwapfjg8itGo87qE/mBUy70cm0HoAzCpuaHg
         oRn1b88NSWrVDTXdCsnanGFgw8zlQYQdhzvd8nr0K5SMiCx4e5tSIV1altNZbm1F84ZL
         ix7IXk+OlpUuQVoxW+fSRafBLKDLgwss/QEdNUP1nehrVEwBOHBXqjlj2+nzO0+RwZCF
         HORg==
X-Gm-Message-State: AOJu0Yz7mX4S0FqUKazXfrrqtxrSbkhtiI4G/mp+98KZGGzGIa8rRbtj
	4G7vTDb1w5GkYXU1qRswyQN7a79k
X-Google-Smtp-Source: AGHT+IFeRdN8+YwGS3C/fXLQ/p7CNU7I9tWdbbQYTaNS4jTERa6VFgGPDZDonjezPxZALhU2KiWT1g==
X-Received: by 2002:adf:ef0f:0:b0:333:f5e:7d58 with SMTP id e15-20020adfef0f000000b003330f5e7d58mr17885wro.62.1702044053393;
        Fri, 08 Dec 2023 06:00:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.146.181])
        by smtp.gmail.com with ESMTPSA id i16-20020adffc10000000b003333fd29854sm2115148wrr.45.2023.12.08.06.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 06:00:52 -0800 (PST)
Message-ID: <debe5041-3a8d-4fc0-a487-059f990aac98@linaro.org>
Date: Fri, 8 Dec 2023 15:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] target/arm: Ensure icount is enabled when
 emulating INST_RETIRED
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Aaron Lindsay <aaron@os.amperecomputing.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-3-philmd@linaro.org>
 <9508bf5e-a554-468f-ba94-4d6f1a5be7bf@linaro.org>
 <323be810-5f4e-4218-812a-7c0ebc858599@linaro.org>
 <CAFEAcA-HVf8vWLzmdStEo2NrSKQdZV612rBjiaj-gLW4vXyvpA@mail.gmail.com>
 <793e3c8f-497f-468e-b6b5-accc79e2bef0@linaro.org>
In-Reply-To: <793e3c8f-497f-468e-b6b5-accc79e2bef0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wI8sVKO96gY6

On 8/12/23 12:23, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> On 8/12/23 11:59, Peter Maydell wrote:
>> On Fri, 8 Dec 2023 at 10:36, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> On 7/12/23 23:12, Richard Henderson wrote:
>>>> On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
>>>>> pmu_init() register its event checking the pm_event::supported()
>>>>> handler. For INST_RETIRED, the event is only registered and the
>>>>> bit enabled in the PMU Common Event Identification register when
>>>>> icount is enabled as ICOUNT_PRECISE.
>>>>>
>>>>> Assert the pm_event::get_count() and pm_event::ns_per_count()
>>>>> handler will only be called under this icount mode.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>>    target/arm/helper.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>>> index adb0960bba..333fd5f4bf 100644
>>>>> --- a/target/arm/helper.c
>>>>> +++ b/target/arm/helper.c
>>>>> @@ -940,11 +940,13 @@ static bool instructions_supported(CPUARMState
>>>>> *env)
>>>>>    static uint64_t instructions_get_count(CPUARMState *env)
>>>>>    {
>>>>> +    assert(icount_enabled() == ICOUNT_PRECISE);
>>>>>        return (uint64_t)icount_get_raw();
>>>>>    }
>>>>>    static int64_t instructions_ns_per(uint64_t icount)
>>>>>    {
>>>>> +    assert(icount_enabled() == ICOUNT_PRECISE);
>>>>>        return icount_to_ns((int64_t)icount);
>>>>>    }
>>>>>    #endif
>>>>
>>>> I don't think an assert is required -- that's exactly what the
>>>> .supported field is for. If you think this needs additional
>>>> clarification, a comment is sufficient.
>>>
>>> Without this I'm getting this link failure with TCG disabled:
>>>
>>> ld: Undefined symbols:
>>>     _icount_to_ns, referenced from:
>>>         _instructions_ns_per in target_arm_helper.c.o
>>> clang: error: linker command failed with exit code 1 (use -v to see
>>> invocation)
>>
>> I think we should fix this earlier by not trying to enable
>> these TCG-only PMU event types in a non-TCG config.
> 
> I agree... but (as discussed yesterday on IRC), this is a bigger rework.

Giving it a try, I figured HVF emulates PMC (cycle counter) within
some vPMU, containing "a single event source: the cycle counter"
(per Alex).
Some helpers are duplicated, such pmu_update_irq().

pmu_counter_enabled() diff (-KVM +HVF):

  /*
   * Returns true if the counter (pass 31 for PMCCNTR) should count 
events using
   * the current EL, security state, and register configuration.
   */
  static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
  {
      uint64_t filter;
-    bool e, p, u, nsk, nsu, nsh, m;
-    bool enabled, prohibited = false, filtered;
-    bool secure = arm_is_secure(env);
+    bool enabled, filtered = true;
      int el = arm_current_el(env);
-    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
-    uint8_t hpmn = mdcr_el2 & MDCR_HPMN;

-    if (!arm_feature(env, ARM_FEATURE_PMU)) {
-        return false;
-    }
-
-    if (!arm_feature(env, ARM_FEATURE_EL2) ||
-            (counter < hpmn || counter == 31)) {
-        e = env->cp15.c9_pmcr & PMCRE;
-    } else {
-        e = mdcr_el2 & MDCR_HPME;
-    }
-    enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
-
-    /* Is event counting prohibited? */
-    if (el == 2 && (counter < hpmn || counter == 31)) {
-        prohibited = mdcr_el2 & MDCR_HPMD;
-    }
-    if (secure) {
-        prohibited = prohibited || !(env->cp15.mdcr_el3 & MDCR_SPME);
-    }
-
-    if (counter == 31) {
-        /*
-         * The cycle counter defaults to running. PMCR.DP says "disable
-         * the cycle counter when event counting is prohibited".
-         * Some MDCR bits disable the cycle counter specifically.
-         */
-        prohibited = prohibited && env->cp15.c9_pmcr & PMCRDP;
-        if (cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
-            if (secure) {
-                prohibited = prohibited || (env->cp15.mdcr_el3 & 
MDCR_SCCD);
-            }
-            if (el == 2) {
-                prohibited = prohibited || (mdcr_el2 & MDCR_HCCD);
-            }
-        }
-    }
+    enabled = (env->cp15.c9_pmcr & PMCRE) &&
+              (env->cp15.c9_pmcnten & (1 << counter));

      if (counter == 31) {
          filter = env->cp15.pmccfiltr_el0;
      } else {
          filter = env->cp15.c14_pmevtyper[counter];
      }

-    p   = filter & PMXEVTYPER_P;
-    u   = filter & PMXEVTYPER_U;
-    nsk = arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_NSK);
-    nsu = arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_NSU);
-    nsh = arm_feature(env, ARM_FEATURE_EL2) && (filter & PMXEVTYPER_NSH);
-    m   = arm_el_is_aa64(env, 1) &&
-              arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_M);
-
      if (el == 0) {
-        filtered = secure ? u : u != nsu;
+        filtered = filter & PMXEVTYPER_U;
      } else if (el == 1) {
-        filtered = secure ? p : p != nsk;
-    } else if (el == 2) {
-        filtered = !nsh;
-    } else { /* EL3 */
-        filtered = m != p;
+        filtered = filter & PMXEVTYPER_P;
      }

      if (counter != 31) {
          /*
           * If not checking PMCCNTR, ensure the counter is setup to an 
event we
           * support
           */
          uint16_t event = filter & PMXEVTYPER_EVTCOUNT;
-        if (!event_supported(event)) {
+        if (!pmu_event_supported(event)) {
              return false;
          }
      }

-    return enabled && !prohibited && !filtered;
+    return enabled && !filtered;
  }

I could link HVF without PMU a few surgery such:
---
@@ -1493,12 +1486,12 @@ static int hvf_sysreg_write(CPUState *cpu, 
uint32_t reg, uint64_t val)

      switch (reg) {
      case SYSREG_PMCCNTR_EL0:
-        pmu_op_start(env);
+        pmccntr_op_start(env);
          env->cp15.c15_ccnt = val;
-        pmu_op_finish(env);
+        pmccntr_op_finish(env);
          break;
      case SYSREG_PMCR_EL0:
-        pmu_op_start(env);
+        pmccntr_op_start(env);

---

I'll try to split as:

- target/arm/pmu_common_helper.c (?)
- target/arm/pmc_helper.c
- target/arm/tcg/pmu_helper.c

Ideally pmu_counter_enabled() should be unified, but I
don't feel confident enough to do it.

Regards,

Phil.
