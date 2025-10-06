Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B05CCA470
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 19:08:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5qZC-00010v-TM; Mon, 06 Oct 2025 15:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5qZ9-000108-Dz
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 15:08:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v5qZ7-0007N4-NE
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 15:08:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so3401423f8f.1
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759777687; x=1760382487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qOTKjETXMBOffS9s6NtRmA9z9L3u3pZARMneJShhpiY=;
 b=y3FiaNgPzEB96LWl1mIoeq9T+J8sICmznS+ts5vsRY1TTZxDXen2+XLPid1qVF5Vi+
 XdYb97E8RXnc1nEWNU2Ur3WdG7AIo1LFpdcLNDEd0FHD4WZUnL3pGBTFlI+2lEKNOkwQ
 OjxSMEEMjM51DCRP4FUgQr8EONIJgnDQPuLwYH7MEEPLr7br24gCou6xPMi2mCG4yA93
 y1CqmraWq7Yuk2U5vguQiaCBJciujZbeItL9FkpJ7q+LwF0HD/OB+N/vnEsAR1mWwuZ3
 an0eaWmvaJMb8meGowhmmXf1pZoF+qQ3BQ3KtgyGBvdmJWYkpN/tco51zJY6qHGoILxx
 lFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759777687; x=1760382487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qOTKjETXMBOffS9s6NtRmA9z9L3u3pZARMneJShhpiY=;
 b=CYe1Vz03XTl/DBqsP+Jqo+nq7kkyKIWw24dSHjSIqTKpk3AcH4b91ds2DVzDaDb02J
 lCEt2xv+SGG4vNsWb8Zbd+YsPKRhkRLzWHRNA486MXfYmVHyHgHNF/48bkMvwtWhM2d2
 R+2UjQFbhUI6uHv0hVEtCl1hDbktDJ8bzNYu7G/+lEcW2JzEFgMFDARYb6Uw9o/xHssu
 GE7dXmKr0NjD16B/v+kDFpv4nQe5f9QSGM2zpGWpLe1ttd0xIxzT3zQptP3jo/mmEc12
 GE0Puvgec4li3j/sgVgQT1vhUQnEQWKVhQMwBpT5G0347Vtszv+5ILml1wqrRndpQkuw
 6R9Q==
X-Gm-Message-State: AOJu0YxQ+GfJyMjKJhqZlVDZrHomLT99RvVQonXBp8QI/0ENpwlhs5xU
 ay2Uh1twlKVtPHgOJeUg5w5ego8DKDnoykazAYSpWRosiivj9/5uqbL/kxuNwMpxbL4=
X-Gm-Gg: ASbGncstE8bPfzBh8XIW3KY0GeiXctYqDHTvZYhrAwpB0CMwT5Fgo74GqFgbtm4FN0J
 TnJBLutdAui19FGETXIyUqknO107myaHfpcZR4hDRk7YVbOEWqWTZ8/ZNcBvb37GzoVdTSEPbws
 PdRvDY1xWQWjXRg9JVC+w7DplgxGccktcoiEshusP5kN12emv5zEYdv12JOrQ+KtmgfVhupyFxO
 nBk/d6dWymA2PxAoySHvkQr8gQ30b5i3YhAmwHOQEfr1hGYufgb8lUIvxpBWHanNg9PbFybT4Co
 jfpx3M5a+ZU7nkfo8WjgFzlPfe+diefit1k1RVd8kJGDef+UW1qxdyQqSvdu/WNzOHCQoRDJbGf
 HLdvtHJPkOjNt4YqRK9kEGMZ1gmmA+ZdvODRH0IBtgmaPFnvEFg0o9ArDADKs/x3v3X/iBlox06
 mEzbDouywp9K07faO148hCoR27ccsN
X-Google-Smtp-Source: AGHT+IE2zLackfX9ZmIkhfmMyE2JVkQ+ZGcyT5zj/rwa3m7atUT6XMgApWF9mKJEjUhhtKZj1BNVvA==
X-Received: by 2002:a05:6000:2f87:b0:3f2:41c4:c7d5 with SMTP id
 ffacd0b85a97d-4256719ea7dmr9732894f8f.36.1759777687534; 
 Mon, 06 Oct 2025 12:08:07 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4ab0sm22005734f8f.52.2025.10.06.12.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 12:08:06 -0700 (PDT)
Message-ID: <e68dc6a2-17fb-475f-9f70-cb2cbac6f652@linaro.org>
Date: Mon, 6 Oct 2025 21:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] exec/cpu: Declare cpu_memory_rw_debug() in
 'hw/core/cpu.h' and document
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20251001150529.14122-1-philmd@linaro.org>
 <20251001150529.14122-22-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001150529.14122-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

(ping for this single patch)

On 1/10/25 17:05, Philippe Mathieu-Daudé wrote:
> cpu_memory_rw_debug() dispatches to CPUClass::memory_rw_debug(),
> move its declaration closer to the CPU API. Document.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-common.h |  4 ----
>   include/hw/core/cpu.h     | 20 ++++++++++++++++++++
>   2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 910e1c2afb9..ce64a999035 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -150,10 +150,6 @@ typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
>   
>   int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
>   
> -/* Returns: 0 on success, -1 on error */
> -int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
> -                        void *ptr, size_t len, bool is_write);
> -
>   /* vl.c */
>   void list_cpus(void);
>   
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 0f7eda1a10d..1e928f57c99 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -685,6 +685,26 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
>   int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
>                                void *opaque);
>   
> +/**
> + * cpu_memory_rw_debug:
> + * @cpu: The CPU whose memory is to be accessed
> + * @addr: guest virtual address
> + * @ptr: buffer with the data transferred
> + * @len: the number of bytes to read or write
> + * @is_write: indicates the transfer direction
> + *
> + * Take a virtual address, convert it to a physical address via
> + * an MMU lookup using the current settings of the specified CPU,
> + * and then perform the access (using address_space_rw() for
> + * reads or address_space_write_rom() for writes).
> + *
> + * This function is intended for use by the GDB stub and similar code.
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
> +                        void *ptr, size_t len, bool is_write);
> +
>   /**
>    * cpu_get_crash_info:
>    * @cpu: The CPU to get crash information for


