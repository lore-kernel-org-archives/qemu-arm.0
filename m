Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41797F43688
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 09:57:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDfwl-0002Px-M7; Fri, 17 Apr 2026 05:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDfwk-0002Oj-D9
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 05:57:10 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDfwi-0002hO-Pj
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 05:57:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so3836465e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776419827; x=1777024627; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7JBchpr8kdinAWw7FIVLCoqS6Te+38czkXVKjGON3QU=;
 b=GiGzCcJf6LGmNzYKkv8ZwewIwwQc28xJxrOqP6IFtDn2Ke+VG0uxXkERBTavgnCQGQ
 jGE4JiELjtoYxbQ+mPArlOHXVh+qtVZma6HPuvbpGUf/yCIluajNxEmis/9nGMHGVDg9
 fDNWbhwyLLSX1iB2fR5Y4arU6Xh1JlTpVaHjGXHK76sVWY3Jv6pmFporWd/JCwe4w9Eh
 8j5OG8X4RB6TwEalNh34KDTEvZnsdKGQQbViEXaMMtfo1pWr9bMclQK5lSgDt52/Wn7y
 gJ4A2ldb4bzVFqlezAz45xlPFyT+7pESIoyK8xYuKxtfsfRlxs87tpyuUp5eRGDxPQsj
 fSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776419827; x=1777024627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7JBchpr8kdinAWw7FIVLCoqS6Te+38czkXVKjGON3QU=;
 b=rQj6IwVfX54od9j3oRvPNTlPZu1cjkJXTOyK4ukfzCCbApLs5WXz7KQpilHo8dBKcl
 v3KibsNZdRW2FL42QLq1UA2Y9mcQhPu3BDjyNLQ0xxv5fAlRD/GZOzU8fokFpLF9ToIk
 0Y5xKm936UpBM4I0j26aY221VIwnvv7DUulIyACvLijF1Fz7JF3BQGCWOoWP0AnjCgB+
 /bmk4lv56mVjkXzRErAYPyrJjg8ZM8RqjBczsXL0aa2zl+z08lPW4YSxFKODyz4hPTNx
 9J1vpvVUSpa5LTGlVABCd2Wz50AB2MlgI4Rw3swLj3P0ymgKVAycdHyFI0Tb6PQoL3Cq
 6Ynw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8gqbQ2imJTqxnnRUdcpni2muM6bdzZgUgA+Lg3dYn+d3P8c/cexb+1mwPngwZ9VvjC7jQexOz4w==@nongnu.org
X-Gm-Message-State: AOJu0YyE9U8bmqAm8a5DcPjqxUGnAWz+fxjMHlTfqmTnOgkrlvBq1o3x
 UTUZ9O1zLwrdIU3VF+h3Rmw0tNa75MBt+LdqXS0ZazNXa1uF0VYJl7xtJveHSbR0st0nUCGhfxO
 Ciycztbk=
X-Gm-Gg: AeBDietupb5X476wjo/qr0iIMLrPZXb3GXfgeNTEPC0Hz8W+GrnHPJ0Jrv2ng5R7H5o
 lSgdppoeTRnaIhtbcGBE4lmMBZkHhv+gIfbPoyXfTOjTxQDfDHt78Hy52LIWDXHQd+F0XypfN9V
 2sIy6BFcbRJPMSr3483zCxldfInVIC9auDXOaPdJuY4/Nfv76UchAJ9C6VnRXuTOWPYHDA2olId
 kBVH6f8qEwdM6II2Z04MYHTPHEZHzh35pNXkDQdlcXLn7gfZRqs8FF343MQvbQK2ZbFt9to6UZD
 23JJKBMLsSBiTBUS/QkTX45M+jckUs3tVHGaiMhDw1N9+TMzaimbYrBSeaPG/lVTTDTtTDjzlBl
 6SH1FaVwl/1VSmHRsuglqLGE59/optuiNnqGucPx4oCEpBmzaORQ9q79kJKgfXarm42HYA3Ni8S
 D7GfcCdPsEl3AO6Gi/jqNuiQaEmln7zgSKNF8ya9pU+temdH0AIcCTU/fm4+p2+w6q93znINKLB
 6Fo
X-Received: by 2002:a05:600c:321a:b0:488:fbf6:ea59 with SMTP id
 5b1f17b1804b1-488fbf6ed4amr15370805e9.12.1776419827019; 
 Fri, 17 Apr 2026 02:57:07 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1682sm3311299f8f.1.2026.04.17.02.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 02:57:05 -0700 (PDT)
Message-ID: <803470a9-5669-4c29-89fb-2c9be4656512@linaro.org>
Date: Fri, 17 Apr 2026 11:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
Content-Language: en-US
To: "Scott J. Goldman" <scottjgo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, rbolshakov@ddn.com,
 phil@philjordan.eu, agraf@csgraf.de, peter.maydell@linaro.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260410044726.61853-1-scottjgo@gmail.com>
 <20260410055045.63001-1-scottjgo@gmail.com>
 <86D19C52-2A31-4802-ADF2-703D9AE83E75@unpredictable.fr>
 <DHUW6DNJWPDC.1MEF4S1911AJ1@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <DHUW6DNJWPDC.1MEF4S1911AJ1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Scott,

On 16/4/26 23:20, Scott J. Goldman wrote:
> Philippe-- apologies for the nag here but this is a fix for a unfortunate
> regression. Any chance you could take a look? Thanks!
> 
> On Thu Apr 9, 2026 at 11:18 PM PDT, Mohamed Mediouni wrote:
>>
>>
>>> On 10. Apr 2026, at 07:50, Scott J. Goldman <scottjgo@gmail.com> wrote:
>>>
>>> Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>>> changed hvf_wfi() from blocking the vCPU thread with pselect() to
>>> returning EXCP_HLT, intending QEMU's main event loop to handle the
>>> idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
>>> always returns false and the vCPU thread spins at 100% CPU per core
>>> while the guest is idle.
>>>
>>> Fix this by:
>>>
>>> 1. Setting cpu->halted = 1 in hvf_wfi() so the vCPU thread sleeps on
>>>    halt_cond in qemu_process_cpu_events().
>>>
>>> 2. Arming a host-side QEMU_CLOCK_HOST timer to fire when the guest's
>>>    virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
>>>    because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
>>>    hv_vcpu_run(), which is not called while the CPU is halted. The
>>>    timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
>>>    vtimer IRQ through the GIC and marks vtimer_masked, causing the
>>>    interrupt delivery chain to wake the vCPU via qemu_cpu_kick().
>>>
>>> 3. Clearing cpu->halted in hvf_arch_vcpu_exec() when cpu_has_work()
>>>    indicates a pending interrupt, and cancelling the WFI timer.
>>>
>>> Fixes: b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>>> Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
>>
>> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>> ---
>>> include/system/hvf_int.h |  1 +
>>> target/arm/hvf/hvf.c     | 65 +++++++++++++++++++++++++++++++++++++++-
>>> 2 files changed, 65 insertions(+), 1 deletion(-)

I haven't looked at your patch yet. While looking at commit
b5f8f77271 I noticed the previous a14afa985e3 ("accel/hvf: Skip
WFI if CPU has work to do") is different in my local tree, where
I have:

-- >8 --
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd9..1a76c9cf402 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2037,6 +2037,11 @@ static int hvf_wfi(CPUState *cpu)
          return 0;
      }

+    if (cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
+        /* Interrupt pending, no need to wait */
+        return EXCP_INTERRUPT;
+    }
+
      return EXCP_HLT;
  }

---

Does that help? Now I'm really confused.

