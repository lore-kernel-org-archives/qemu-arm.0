Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2554094dye;
        Mon, 30 Jun 2025 08:36:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrfBGl3MbABNIKt44K0tmmp/yp+9f0MXlD/adoHf/TRFqbKAD11ywol2K7sL/ucgtGRDfp7oef6KQW6A==@linaro.org
X-Google-Smtp-Source: AGHT+IHi1jG8tfg4VejxK6AtAjuVkjjmaHqYAaGdPjA4lqbrRmEyYhFFMCDjd0q0ndb4PYBqVeWx
X-Received: by 2002:a05:600c:8112:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4538ee5d268mr149410525e9.13.1751297797225;
        Mon, 30 Jun 2025 08:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751297797; cv=none;
        d=google.com; s=arc-20240605;
        b=hvkeTuuJ3MBHkDIWNTEe72cvvATBkLinUifio1k6A7g32YfJiTZfVNYmRRFPpYOoEn
         QWqD6P58RRGlOre/wcRK8f8WeQA0USsZYhV43eevqY1QJcXFVzOajVW0kZYU4Z7NdqL7
         k3yfmvoKDizeazttG9N3aBz0H1qG7mc2oAJ3GQiMXJoqE/NJtat05ADDbx7BUC2nemCZ
         VBESqMLGjnL5+UatfAbQYBU2739VFTiFvBB8zumKSgURUJSgvpZdzat/eHBALWMhAELc
         3iKMAdCEr0f6qFXgoW3vSAgxZFKNKin5//cz6kM81Gd+/4O5Ry0eCQZyJxD9RRyUSJJz
         opLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HZB1cxdvqhbIS/BrUQCEpbRpV8YcIFl4ZtW21ogiZbo=;
        fh=vOY/1lS8qwqU+4ew4BpedZmIfQwUZebsDiVi5GlGWTg=;
        b=lOUPmLu1giGkAOK2yik2FTJl3DhH1VqCnm+Ea+YRn697yHmZdwvZwMgb+LHc33scCA
         HB4Rwdptl+8Wh0HMHa9s1NLHQnozyqI3fo7+JIy99+US7CUxmPkIx++qNsE5nhKbajk1
         /SiKi4XB8IKTocKaTZUSTPkhM38LqwwZUe0eUhT/mxHoyxm6D/Rdx603fH45vhsYQlsl
         8cJvy39PkST0ArlMjXyH51qZwqVT6WmBn8nxnxf6t88ssBwhaiIdEphr8Idrq7f1Lsb3
         cysyTt96iVQrtG27Msmmd4Y2UUkXJRmuwuwq1jbbhZpON+abZh7a4aNq9LmBAWqRRdya
         pOYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJknmbxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a08186desi5875172f8f.739.2025.06.30.08.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 08:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJknmbxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWGY2-0003wA-HL; Mon, 30 Jun 2025 11:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWGXy-0003jE-62
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 11:35:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWGXv-0000iV-PU
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 11:35:53 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so16854235e9.3
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297744; x=1751902544; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HZB1cxdvqhbIS/BrUQCEpbRpV8YcIFl4ZtW21ogiZbo=;
 b=WJknmbxR0yGROFvHiRXaUHzyenY8upB11tH01JZnhaYzFCB1BrP4Pa+SHQle3Y/571
 9q3YTu09YUh38rnt4fBTN0rACFYTOgXdoKw4hqvtcbWMzCJouT77uSlQYfSKS3n8cLoN
 hLpGixzG1uh9SPgJAXs0L1v63XJMvX/ofMS40S5a+N7PHGu/rduqgcDA4PekYM864JMV
 EW5+8Qs2Hs+ihk+SsXD3bZM8xpVl0AfB/73AyUx9WaMxyG5OoVF0UZCj8mwciOpxhq3p
 ea1BaUxLXk0BsfzpQbBPazJV3AMPbYRJeeHWVJAC1lLEJj+5o5ILxUOf0u+LYIAg4fPM
 aVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297744; x=1751902544;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HZB1cxdvqhbIS/BrUQCEpbRpV8YcIFl4ZtW21ogiZbo=;
 b=SdzPGXFL7y3aBXccThKcFuVRLywM2+niuVFEOtWZ5QlMGzdZVZb4XNxBnSAtnuecTB
 /j5xVf4173Jhoa5bKB40Jp9w6KE9MzKruWRYA+dvkNQCjchJgP5HZjgYDti8Uhecsx7T
 eOBICY9UlmXdFQhxwGqTrPzUb3cmG5NKy7qaUwa3XXdhEIzXttcmaRy04QI/ONWJ+JQ4
 k29lGSiWJPFqBkZQQUoaurKFsdY1hr9Lt/SU1mH/mHYiDmZDpdPMih03aNmmRpIHUh6o
 bBGV0TnXIISNqBNtR7Bbd3irLPjrO/7R6PdIHukv4m/gGrmJ3WiP4O0g5hlmiCRIrJsP
 77WQ==
X-Gm-Message-State: AOJu0YwP0R3RodA6aq0akv3za2keo0ytva4caYeFHil6l3b2W3GOOOdM
 VEFBltzdti188buMV29NoKPoIxuJVqFM/xidCXSRkHNn1tfP+XxowrhCh151M+yFrqY=
X-Gm-Gg: ASbGncssxm8UowzBAcY938cLrfDM8FK/WzlJ4OC6eUe9fA6P6SYG+z5OSvMlcQrlyF3
 s/kovfy4E+LOuGRj0q7yucgB+LhxJ2Wxhe2sw1alxzxNYlzmHgvIcX/z5iXbF9htQXltkEJyb6F
 QppGNrTBAYXLxKDj+iuWLBjVsvFqCqFnOwqwOSE6p/A/8yd/NpAI1bLD1TA7+h4J9NTs7bgWgTV
 kYcGKotk0O1pWTT+AGFN6XC/LZbbxSSlXvn8/QM1M2N1SCmveDgp0TTWgffwpgt67mLOqu9dmyg
 DbPmZzwykFnsm1Q8Xlxx+UZrYBhNGTxEOZxwLiC50XB9JUopJi8MYIofG+HscihjDMPhqL6W7Bp
 CPX3ahOFyZqCG6HlYyZBZRV0vgqCmvGjWMkuNlAmf
X-Received: by 2002:a05:600c:3152:b0:453:c39:d0c6 with SMTP id
 5b1f17b1804b1-4538eea44a4mr133370855e9.32.1751297744497; 
 Mon, 30 Jun 2025 08:35:44 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52c8esm10832082f8f.55.2025.06.30.08.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:35:43 -0700 (PDT)
Message-ID: <4edfdda0-a627-48f3-a2fa-94d7545eff2c@linaro.org>
Date: Mon, 30 Jun 2025 17:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] target/arm: Allow arm_cpu_tlb_fill_align optionally
 set CPUTLBEntryFull
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-7-philmd@linaro.org>
 <8141d048-42e5-4b79-a90d-0ef1857d5857@linaro.org>
Content-Language: en-US
Cc: qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8141d048-42e5-4b79-a90d-0ef1857d5857@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PizM5WdQprOs

On 30/6/25 15:56, Richard Henderson wrote:
> On 6/30/25 07:09, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/tcg/tlb_helper.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
>> index 23c72a99f5c..df04ef351d1 100644
>> --- a/target/arm/tcg/tlb_helper.c
>> +++ b/target/arm/tcg/tlb_helper.c
>> @@ -349,7 +349,9 @@ bool arm_cpu_tlb_fill_align(CPUState *cs, 
>> CPUTLBEntryFull *out, vaddr address,
>>                                 &res, fi)) {
>>           res.f.extra.arm.pte_attrs = res.cacheattrs.attrs;
>>           res.f.extra.arm.shareability = res.cacheattrs.shareability;
>> -        *out = res.f;
>> +        if (out) {
>> +            *out = res.f;
>> +        }
>>           return true;
>>       }
>>       if (probe) {
> 
> Why?  There's no other way to get the phys addr result.
> Are you only calling this for the raise-exception side effect?

Yes:

-- >8 --
@@ -2121,6 +2121,25 @@ int hvf_vcpu_exec(CPUState *cpu)
              hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
          }
          break;
+    case EC_INSNABORT: {
+        uint32_t set = (syndrome >> 12) & 3;
+        bool fnv = (syndrome >> 10) & 1;
+        bool ea = (syndrome >> 9) & 1;
+        bool s1ptw = (syndrome >> 7) & 1;
+        uint32_t ifsc = (syndrome >> 0) & 0x3f;
+
+        trace_hvf_insn_abort(env->pc, set, fnv, ea, s1ptw, ifsc);
+
+        cpu_synchronize_state(cpu);
+        if (tcg_enabled()) {
+            ret = EXCP_EMULATE;
+            arm_cpu_tlb_fill_align(cpu, NULL, env->pc, MMU_INST_FETCH,
+                                   arm_env_mmu_index(env), MO_32, 4, 
false, -1);
+        }
+        break;
+    }
      default:
          cpu_synchronize_state(cpu);
          trace_hvf_exit(syndrome, ec, env->pc);
---

I see probe_access_full_mmu() uses discard_tlb, I can use a similar
stack variable if you rather.
