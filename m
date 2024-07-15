Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2502590nji;
        Mon, 15 Jul 2024 14:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbCO+0omZpO4rrORGc1dBk/BY3I/FM4wQmNDD4Yg07dtZ928LYGwgLL10hk3MnciRMEiwtbkIJDX8F26DpX8e4EYpLrDB3
X-Google-Smtp-Source: AGHT+IHt31rvZX7qXdgEO1tDmm8+rASmTftdruK2kFF6GYY7rzxpWFIOA2l0bCGo46ULEcRMzSs6
X-Received: by 2002:a05:620a:4507:b0:79f:bd7:d24b with SMTP id af79cd13be357-7a17b98843bmr39070985a.7.1721079827832;
        Mon, 15 Jul 2024 14:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721079827; cv=none;
        d=google.com; s=arc-20160816;
        b=QITlupLFruEyNdoS3UFCYmKsUCKGo5MgJ2lYstHcDXiQ0eZEgKSIFl06IwkEc4ZObI
         833Ovm5GrXbY6DCuU2cT/APgGVTPnhHC6wDemfxB3sLCGHAXhwi5Y4LxAFAuFVaM1qsF
         FVBLq+76+NUyYMKVOIJKBBDLH9GLU3IxPVXcQykuwyjYiJLaD1FSd1l2CCKy8lJszbD9
         EQ2ucinpTr4e9L45gUGZQGxO/2BvAMK7GmtOJkCpL+3YqFu6NuxwrAXqbFKG8Q3+U5/3
         6zCzazzYSEK9UnBdCA+gx0XMry8GPe1BEPLtgEVsBWdzQIxUbUge5VDQxi8Ft06QcQBs
         5AHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qFlJThacqRcUbiwz/H0Z0GPMFjEVS/7KcMwKMYneQwU=;
        fh=JyBJwgE/lNv6QKVReyhTYzZcfA9WvCHjmDt2IWUz+v8=;
        b=ufO6IajdoAPPVE1N1c4NDtyj620dkEB6jhJSrRTw6TfwnWVXTkz9sDIR5h1L91EhFT
         zjVr9FLrC34OMc714XvGMg3TwlfqiYEJTOwobLWYcICPgYD71eCYTAt1pe7HpziAeITe
         u8iWNERF98K+SYGNHNpip59SAj5B/6Pwa+lPz4RpQYRMOHX9yYhqW8gq3nqca6Fqaizb
         bRqh8UuEwWI/fEkcXhm634TvW95vgQEpC4NdeddQSXsL4N2liSHGoEz+Qj7W8MuCuzjU
         OXdIiLLN683Ez6MIlz39heVGIvXi8cky0DEaqMLbIkBTqicAU10culPQXoWZbjdK2JXd
         rSyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HezLn9xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c68b75si606674585a.387.2024.07.15.14.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2024 14:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HezLn9xn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTTTQ-0007zb-Cm; Mon, 15 Jul 2024 17:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTTTN-0007sa-Hg
 for qemu-arm@nongnu.org; Mon, 15 Jul 2024 17:43:06 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTTTK-0000um-Oa
 for qemu-arm@nongnu.org; Mon, 15 Jul 2024 17:43:05 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7928d2abe0aso939746a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jul 2024 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721079780; x=1721684580; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qFlJThacqRcUbiwz/H0Z0GPMFjEVS/7KcMwKMYneQwU=;
 b=HezLn9xnu1Hawn9UhCN0+Ubdy4LvecBS/6KvggRxafYfSpZzEeZ/v2I1ItV/hwS1WM
 3GngV0FTsvc2rs70rSmGG3jyqfAuTUsumGEy++rBS6k4Ht2Z0DpWhTu/s7igbpI061T/
 uYFJ7lmi+Optryha49aWAxDl/xDBliLAH0hLBUVDRQoFCXtSHtsk3LqZOQA1ELhhGTIE
 UzguNTfc4bFuVTigpjjXzG/ocj6pAa8ya+JFHgfN1coEmVeeqYNrm7GwVZrroLAipdmv
 gv4ju+WC6lCXnL4Nhs/CTlAJCY7NHY37WB9ME2dMHuADutuTITHArExPhQ9A72c7uk6f
 Bgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721079780; x=1721684580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qFlJThacqRcUbiwz/H0Z0GPMFjEVS/7KcMwKMYneQwU=;
 b=PA9SrNWJNVKpdnJdWe47TFbS6h2bekhITrcL8gtN/tzmqJPm+1qZ5WXqut2GDVWJyF
 SdGQk67Zwz74qdIhASTgshq3jaetIoADsCqxuwU6v6ccZ8O3mb09BQtj1HuoWCip5eOf
 xr9fzEEdrQQs+1oVk5Po9UNeEErWcBo9aSHg6P4AfQ8JpLIthGivDLUHXZCPgNu6SMPm
 8rKhms62cRTqRd3HPX3mVqv00wAw+j/70U0/2VwXWt8fmovP6LskO30l3oAwBk/D5tIl
 jG6loorxZrav8dEsuBLJl3BOD/qjwbJaWZzLkJOfFtKrtkIcf8SjN8ha0KNvHFMqEvon
 pfeA==
X-Gm-Message-State: AOJu0YwvgTyumn77aNchftUHOpCDjr28NsUPdTjOjhIpHIY1Fq1bYiTG
 gmB5COkYXoz45ZmbFhKH7HqHCvw9vRmHegZAz7htDpQV/TTD2Iylfmv/CkBzCEY=
X-Received: by 2002:a17:90a:6881:b0:2c8:2cd1:881b with SMTP id
 98e67ed59e1d1-2cb373389a9mr256669a91.20.1721079780052; 
 Mon, 15 Jul 2024 14:43:00 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2caedc1709esm4865416a91.34.2024.07.15.14.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 14:42:59 -0700 (PDT)
Message-ID: <3d86bfd4-e6ef-464a-a663-21e95e1f6cf6@linaro.org>
Date: Tue, 16 Jul 2024 07:42:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] target/riscv: Simplify probing in vext_ldff
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-14-richard.henderson@linaro.org>
 <5a83ce12-9a9c-4c9d-9fee-e37fb6afd19d@sifive.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5a83ce12-9a9c-4c9d-9fee-e37fb6afd19d@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: ZXfxzLGi+1U9

On 7/15/24 17:06, Max Chou wrote:
>> +                /* Probe nonfault on subsequent elements. */
>> +                flags = probe_access_flags(env, addr, offset, MMU_DATA_LOAD,
>> +                                           mmu_index, true, &host, 0);
>> +                if (flags) {
> According to the section 7.7. Unit-stride Fault-Only-First Loads in the v spec (v1.0)
> 
>       When the fault-only- data-watchpoint trap on an element after the      
> implementations should not reduce vl but instead should trigger the debug trap as 
> otherwise the event might be lost.

Hmm, ok.  Interesting.


> And I think that there is a potential issue in the original implementation that maybe we 
> can fix in this patch.
> 
> We need to assign the correct element load size to the probe_access_internal function 
> called by tlb_vaddr_to_host in original implementation or is called directly in this patch.
> The size parameter will be used by the pmp_hart_has_privs function to do the physical 
> memory protection (PMP) checking.
> If we set the size parameter to the remain page size, we may get unexpected trap caused by 
> the PMP rules that covered the regions of masked-off elements.
> 
> Maybe we can replace the while loop liked below.
> 
> 
> vext_ldff(void *vd, void *v0, target_ulong base,
>            ...
> {
>      ...
>      uint32_t size = nf << log2_esz;
> 
>      VSTART_CHECK_EARLY_EXIT(env);
> 
>      /* probe every access */
>      for (i = env->vstart; i < env->vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
>          addr = adjust_addr(env, base + i * size);
>          if (i == 0) {
>              probe_pages(env, addr, size, ra, MMU_DATA_LOAD);
>          } else {
>              /* if it triggers an exception, no need to check watchpoint */
>              void *host;
>              int flags;
> 
>              /* Probe nonfault on subsequent elements. */
>              flags = probe_access_flags(env, addr, size, MMU_DATA_LOAD,
>                      mmu_index, true, &host, 0);
>              if (flags & ~TLB_WATCHPOINT) {
>                  /*
>                   * Stop any flag bit set:
>                   *   invalid (unmapped)
>                   *   mmio (transaction failed)
>                   * In all cases, handle as the first load next time.
>                   */
>                  vl = i;
>                  break;
>              }
>          }
>      }

No, I don't think repeated probing is a good idea.
You'll lose everything you attempted to gain with the other improvements.

It seems, to handle watchpoints, you need to start by probing the entire length non-fault. 
  That will tell you if any portion of the length has any of the problem cases.  The fast 
path will not, of course.

After probing, you have flags for the 1 or two pages, and you can make a choice about the 
actual load length:

   - invalid on first page: either the first element faults,
     or you need to check PMP via some alternate mechanism.
     Do not be afraid to add something to CPUTLBEntryFull.extra.riscv
     during tlb_fill in order to accelerate this, if needed.

   - mmio on first page: just one element, as the second might fault
     during the transaction.

     It would be possible to enhance riscv_cpu_do_transaction_failed to
     suppress the fault and set a flag noting the fault.  This would allow
     multiple elements to be loaded, at the expense of another check after
     each element within the slow tlb-load path.  I don't know if this is
     desirable, really.  Using vector operations on mmio is usually a
     programming error.  :-)

   - invalid or mmio on second page, continue to the end of the first page.

Once we have the actual load length, handle watchpoints by hand.
See sve_cont_ldst_watchpoints.

Finally, the loop loading the elements, likely in ram via host pointer.


r~
