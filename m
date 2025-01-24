Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp974266njk;
        Fri, 24 Jan 2025 09:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMWY0O67+cys7fgVM2fRBcyCSdXNm3wzwLvsFxo101fZZuZZNh1UvUi1PklOnQbnHz9rFLNxJUjkteWA==@linaro.org
X-Google-Smtp-Source: AGHT+IFA+stc0VgMrqH3KGnZ9aOxlP4jpQJ81LcHbKiP57RzYJLpNyTjaE90hdpj4dlP05cRhokw
X-Received: by 2002:a05:6214:246c:b0:6d8:d5f6:8c72 with SMTP id 6a1803df08f44-6e1b216c30emr524310286d6.19.1737740541109;
        Fri, 24 Jan 2025 09:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740541; cv=none;
        d=google.com; s=arc-20240605;
        b=efVq52aeeBnAomIPxrHUuxHQIU9xzxbCLvbQvcSj1QqCnVN/YtAvxfOCCE+5930US8
         PBzwdel5HAz/LDFqwy82M93oC7njJD9ejtN3LiLPnJzGHOSDfFTWFLLSVRRZWREscB11
         Dg7y5QY4hveVJVx6jiwdfgHKUt8Oi0rHlIV8nY83PbWJ1oeh8+jU4JY7uAHA2jt/FgU0
         4+DyNRxWAEhGb8qJBaFgA2FlGwPWokFJdh6Sb2r5P3n4DO5r075D6NTW85biK66mJobY
         Ij5AqVn+QgKjyKa8BMketiYgJy4657G8/edCe7UaiYJErf1Lna0Dn+8KC4AASvUK9WtY
         N60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a43/7Bt4MW4XTo3TsuSDc+PocOKZb0hbjZ5CqEhuwHg=;
        fh=7dUP2lGJ2DatqV2Tdbextv1prvMNNP7oQPaohiwa/pU=;
        b=O9U3zATR3m/Iei3wSNb+U7Y32NyDIXgfH+/7LTLLTwhjn98CIDXf8I9ePLiGKlrLvg
         6lZ8MQnByr9q/6Yh+YuoDrhkAjapw7/5Z7hSUZtx+xyko48Sl1g8pQe4gkXmRUlhjbT8
         I08EwfMYVTTugiq+3VRfnzq2ZicK5ZmHokNsFVPK/7pmPFPgML/QiIJi0Gyx922Xs2IW
         407mS3YDqH82et9pGOP+T+X7RzX2NH+NUWIFdimTC7ZsLL/LiGfnX66xa7MhSBvMQFNc
         U1DKkD8yu1pBUWsCrncNymZtjfrK8+SNaj+A/BELuzlNTRy6q0Nca4s4K23dl53tRf35
         QOUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NeMqTW7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e206134b5dsi26446256d6.498.2025.01.24.09.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NeMqTW7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNgv-0006Q8-2l; Fri, 24 Jan 2025 12:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbNgq-0006Ga-MZ
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:41:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tbNgm-00038P-Nh
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:41:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43626213fffso22627155e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740509; x=1738345309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a43/7Bt4MW4XTo3TsuSDc+PocOKZb0hbjZ5CqEhuwHg=;
 b=NeMqTW7i9zo51NKZHnyLgInlzOayUCfC93T/Uc5c0UEuDTbqo1+GSSIUPrDRT8L3+0
 fHA+2qYmjrI59EUJEBCwciZEhqK8njAcVCffJzgK15BYp3RHrkeX9Gjim1w+8dzviQLt
 w+GGqAdcIG6PH/5DQ77KaLdg29uehZihUspmVI3rO9AtVQVRxe2MENctWFNF3HB+kmzg
 S7HN2SFQCkEBz5Z3gwbtRzbMjEuy10cfJUvAjU7e1wBHgU/9GlRKNVGHBsQJqkWZ7EPH
 P7kA3HvrouBe4+z4lWWLH0iuINyU4199wXdTUrE1pHpQAAJ0skmvWR7B7sEqZHvm6/Nv
 k96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740509; x=1738345309;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a43/7Bt4MW4XTo3TsuSDc+PocOKZb0hbjZ5CqEhuwHg=;
 b=hZk1CG2lYoe/5oHTAVtMvjFwwcwO1bhn+Mri7P1qrjdk4dEVP6d7EtGt9/OEVBa0DK
 +CJsSoDxeVO69PWyLimAr5AVT3bahiymvwWRIR416nvuxSECGaEyzNTKFIrhJ34BLjnN
 Q6SCv34DSv9bVWOea0L+PS5kvZ+nQNLWDRwq2SgXYJCHvQMBoy43lR3ysQ6aeo8/xWVp
 v1+oL0bNTY5IXTeTchRNbnRkz+VrkWsZ5tmhFlu0F50R6PdoWRSG1ocgVPV42xrBRlZV
 vwfrEEHW2GXT/AOHJre/jWr9rXWestWKTQPKagB0p30uCyjwQFDc+MHA5fGCZkeXujTd
 4rUA==
X-Gm-Message-State: AOJu0YxsnP9xKMbFXbZm9KBDqSSSRoPL4SK7dsWOOlXDZ2r+AkN7JyEe
 ltaCAb8arzzxL9OdhNB9fMkLtvuLJVV1Eq48N8XjjkO5DOzrfYGI2B6fE9oZkkk=
X-Gm-Gg: ASbGncs4LZgEXhD7vPmZflOFU+KMoAFCCPnU25DgV8N4/UwIgQ43CXNLD2ayCrkZBTl
 bwkny4SXh+69NqNA/htg/065uzmfNoiIuaja278xeL+7gU9uCgmw+ZT6et9g1uYn9hO9UbBkyEK
 uElQ5TF7zdbG5GbVLS/0V9+z75FqrUlJIaHqpaRYY+vgZjXuXw4vsdw15Fm8vtVeR/LmZaHNz/J
 8a3qsg7jtSogwVnd0GcpKAmsNHJ0sPt20UG+2B8f6sp1JaAhwxLkbleZuGOz+MqDqGe022KqI2b
 m77ByBlE1mBSa6nHfEzd9UIEqk9CWayUwhcuxIjqdT6mrRA3
X-Received: by 2002:a05:600c:1c86:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-438b88511eamr71347785e9.6.1737740509374; 
 Fri, 24 Jan 2025 09:41:49 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0f7sm33208455e9.28.2025.01.24.09.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:41:48 -0800 (PST)
Message-ID: <3672ec62-191d-4e89-bd99-cc10ef588c0e@linaro.org>
Date: Fri, 24 Jan 2025 18:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/28] target/riscv: Move has_work() from CPUClass to
 SysemuCPUOps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-21-philmd@linaro.org>
 <0bd61928-5bfc-44c7-8fc7-333f8e2e0b77@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0bd61928-5bfc-44c7-8fc7-333f8e2e0b77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 52NjZ2rQEm7y

On 24/1/25 18:17, Richard Henderson wrote:
> On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/riscv/cpu.h       | 9 +++++----
>>   target/riscv/internals.h | 3 ---
>>   target/riscv/cpu.c       | 8 +++-----
>>   3 files changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 97713681cbe..32e8e064f36 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -552,10 +552,6 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, 
>> GByteArray *buf, int reg);
>>   int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>>   int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int 
>> *out_rdzero);
>>   uint8_t riscv_cpu_default_priority(int irq);
>> -uint64_t riscv_cpu_all_pending(CPURISCVState *env);
>> -int riscv_cpu_mirq_pending(CPURISCVState *env);
>> -int riscv_cpu_sirq_pending(CPURISCVState *env);
>> -int riscv_cpu_vsirq_pending(CPURISCVState *env);
>>   bool riscv_cpu_fp_enabled(CPURISCVState *env);
>>   target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>>   void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>> @@ -576,6 +572,11 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
>>   bool riscv_cpu_option_set(const char *optname);
>>   #ifndef CONFIG_USER_ONLY
>> +bool riscv_cpu_has_work(CPUState *cs);
>> +uint64_t riscv_cpu_all_pending(CPURISCVState *env);
>> +int riscv_cpu_mirq_pending(CPURISCVState *env);
>> +int riscv_cpu_sirq_pending(CPURISCVState *env);
>> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>>   void riscv_cpu_do_interrupt(CPUState *cpu);
>>   void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
>>   void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index 67291933f84..86def39aec2 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -142,9 +142,6 @@ static inline float16 check_nanbox_h(CPURISCVState 
>> *env, uint64_t f)
>>       }
>>   }
>> -/* Our implementation of CPUClass::has_work */
>> -bool riscv_cpu_has_work(CPUState *cs);
>> -
> 
> Why move the declaration from internals.h to cpu.h?

I can't see a compelling reason, so I'll keep it there but add
!CONFIG_USER_ONLY guard.

