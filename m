Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D8D2ECF7
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 11:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi9c5-0004dz-SC; Tue, 20 Jan 2026 06:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9c4-0004aV-AF
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:09:32 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9c2-00048t-Ms
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:09:32 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so4535607f8f.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768907369; x=1769512169; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhjkzYRBTq9Ofw1jT3sPOsdw85Ujc7XaRUyDZIgIbkw=;
 b=fJ0S1wkPsYYBWvuSssMnw4rWH5eJ2eefAIpuRpJvyF41iK3YbgVKXF4dsmqI50wbgf
 XvEtk1i08Kow1sLmTfLCEIEAzXJ+JiqkFmFj0z/lFbNHfLX50f96eIqBcJwh0J/+QtOO
 Z4iZ41MHlpxRzV3bKnY7VdErK/p3KfnkfMpgXFrXC30ePh2XXEWILmJfKg1CYl6skDgi
 sbfQHVFfFMvKFQKu57upIjQmNELUcxEZ6qiO0ckiC7rSV0sbWFSx2KmxqPyVPv4tRKps
 u2h1H5gVukAIaYo5IqnWNaGx7yr5C7jjy8RMcKtYbVuXw/dWVeRLNsudGprExBYJknpv
 wtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768907369; x=1769512169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mhjkzYRBTq9Ofw1jT3sPOsdw85Ujc7XaRUyDZIgIbkw=;
 b=njGhNlIy2sov7agzXNZeTL2xzuUzDRtVYpETmtfobe7dy9Psfjpo/0BpAgkc6yjUYq
 NHiwbu80WZu5/I/t20rspq5IeNbi7lbRDlVB+PN6+Xyo/gdZSf9hh+nKpfb6DiDmQ9g3
 DXH6y24vu/+m/x+gCFM+mG0BLPj3dLeWEjBTFVFuVWfpb2aEYhhHnUoMyXKxtrzpz1mh
 eVT0OyrW0luIDXX1SVo+ePbCAJYc/Lu4AXRnK9K6+TYYsJLNXYY1gRls4JXF/HIwBIkz
 dKM6da7BQEjHZqvmAok5oW/yM8i8OBUCSU7bodiRKHs0CoGwyoZyCA/TQWvG2O+XsO+0
 x/Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCX41WHvqiwOPxlLdQycBrC1ftrQ2DLomEVkb7lv+LINlIpdrU6wp9goRiIjMcSa3SroKtfQ8FN1rQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw14g1GtezVKNpC6vif8iPZo8jVGrWQS/AJ+4jvuPHCj46d9Ego
 sWZf0y/ThjQUPH0TeEVk486ayLWSjW4WHY/iFU9wu9xk8b1ld0/vghz9xM/233Setfk=
X-Gm-Gg: AZuq6aL2+87LAbI2CHfSz/R+bVSv0z6BrzRmA2+taj/+XPRmpqYYJVyAUM+h4v1X+3V
 GZ/b2kndLg41T2rinrU7c6w8XgK8SKJe9pcktXc6v26yDfec/99bg9inh4cUEqCPysS7E5gcNMM
 DfU4FqbDNoKaQS6Cmbx1nuI4fX8be2o5q66VMl6BLhvU52tjscBrRp22FLqMbkwog5YKeR3DONK
 XzyZC4vloTMwhXSnhxlf1zmfEN0/D44zuryUGblOqqnhApY1WPR826jNcm4gPycAVaENAcsvHL/
 pUH/Gsv7zGCVWr6bpg0IsDpJKgiK/apLEyrHwLqP/JtD1SK2plf84SMQmUIBGZjNrIyw/pAa453
 oBsdwRT+SM+KYX9cOv5/GM6OjN1q8TjPo0JWlxaFYiiDtPMJxReBK7/+VcL6TmNczdCFM/h5smn
 v0Aqk+FwIfOBs76JVuqKTqNsTWxSy59iEJhRynFICr2eulIc0WSf85sQ==
X-Received: by 2002:a05:6000:2282:b0:430:fc63:8d0 with SMTP id
 ffacd0b85a97d-4356a0773aemr18404450f8f.36.1768907368829; 
 Tue, 20 Jan 2026 03:09:28 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4359333b924sm1778302f8f.13.2026.01.20.03.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:09:28 -0800 (PST)
Message-ID: <a1b95dc7-cd3d-40e3-b8ac-bbcc6e154298@linaro.org>
Date: Tue, 20 Jan 2026 12:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 16/26] whpx: change memory management logic
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-17-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-17-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/1/26 14:52, Mohamed Mediouni wrote:
> This allows edk2 to work on Arm, although u-boot is still not functional.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   accel/whpx/whpx-common.c | 97 +++++++++++++++-------------------------
>   1 file changed, 36 insertions(+), 61 deletions(-)
> 
> diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
> index 827f50f3e0..f018a8f5c7 100644
> --- a/accel/whpx/whpx-common.c
> +++ b/accel/whpx/whpx-common.c
> @@ -255,89 +255,64 @@ void whpx_vcpu_kick(CPUState *cpu)
>    * Memory support.
>    */
>   
> -static void whpx_update_mapping(hwaddr start_pa, ram_addr_t size,
> -                                void *host_va, int add, int rom,
> -                                const char *name)
> +static void whpx_set_phys_mem(MemoryRegionSection *section, bool add)
>   {
>       struct whpx_state *whpx = &whpx_global;
> +    MemoryRegion *area = section->mr;
> +    bool writable = !area->readonly && !area->rom_device;
> +    WHV_MAP_GPA_RANGE_FLAGS flags;
> +    uint64_t page_size = qemu_real_host_page_size();
> +    uint64_t gva = section->offset_within_address_space;
> +    uint64_t size = int128_get64(section->size);
>       HRESULT hr;
> +    void *mem;
>   
> -    /*
> -    if (add) {
> -        printf("WHPX: ADD PA:%p Size:%p, Host:%p, %s, '%s'\n",
> -               (void*)start_pa, (void*)size, host_va,
> -               (rom ? "ROM" : "RAM"), name);
> -    } else {
> -        printf("WHPX: DEL PA:%p Size:%p, Host:%p,      '%s'\n",
> -               (void*)start_pa, (void*)size, host_va, name);
> -    }
> -    */
> -
> -    if (add) {
> -        hr = whp_dispatch.WHvMapGpaRange(whpx->partition,
> -                                         host_va,
> -                                         start_pa,
> -                                         size,
> -                                         (WHvMapGpaRangeFlagRead |
> -                                          WHvMapGpaRangeFlagExecute |
> -                                          (rom ? 0 : WHvMapGpaRangeFlagWrite)));
> -    } else {
> -        hr = whp_dispatch.WHvUnmapGpaRange(whpx->partition,
> -                                           start_pa,
> -                                           size);
> -    }
> -
> -    if (FAILED(hr)) {
> -        error_report("WHPX: Failed to %s GPA range '%s' PA:%p, Size:%p bytes,"
> -                     " Host:%p, hr=%08lx",
> -                     (add ? "MAP" : "UNMAP"), name,
> -                     (void *)(uintptr_t)start_pa, (void *)size, host_va, hr);
> +    if (!memory_region_is_ram(area)) {
> +        if (writable) {
> +            return;
> +        } else if (!memory_region_is_romd(area)) {
> +            add = false;
> +        }
>       }
> -}
> -
> -static void whpx_process_section(MemoryRegionSection *section, int add)
> -{
> -    MemoryRegion *mr = section->mr;
> -    hwaddr start_pa = section->offset_within_address_space;
> -    ram_addr_t size = int128_get64(section->size);
> -    unsigned int delta;
> -    uint64_t host_va;
>   
> -    if (!memory_region_is_ram(mr)) {
> -        return;
> +    if (!QEMU_IS_ALIGNED(size, page_size) ||
> +        !QEMU_IS_ALIGNED(gva, page_size)) {
> +        /* Not page aligned, so we can not map as RAM */
> +        add = false;
>       }
>   
> -    delta = qemu_real_host_page_size() - (start_pa & ~qemu_real_host_page_mask());
> -    delta &= ~qemu_real_host_page_mask();
> -    if (delta > size) {
> -        return;
> -    }
> -    start_pa += delta;
> -    size -= delta;
> -    size &= qemu_real_host_page_mask();
> -    if (!size || (start_pa & ~qemu_real_host_page_mask())) {
> +    if (!add) {
> +        hr = whp_dispatch.WHvUnmapGpaRange(whpx->partition,
> +                gva, size);
> +        if (FAILED(hr)) {
> +            error_report("WHPX: failed to unmap GPA range");
> +            abort();
> +        }
>           return;
>       }
>   
> -    host_va = (uintptr_t)memory_region_get_ram_ptr(mr)
> -            + section->offset_within_region + delta;
> +    flags = WHvMapGpaRangeFlagRead | WHvMapGpaRangeFlagExecute
> +     | (writable ? WHvMapGpaRangeFlagWrite : 0);
> +    mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
>   
> -    whpx_update_mapping(start_pa, size, (void *)(uintptr_t)host_va, add,
> -                        memory_region_is_rom(mr), mr->name);
> +    hr = whp_dispatch.WHvMapGpaRange(whpx->partition,
> +         mem, gva, size, flags);
> +    if (FAILED(hr)) {
> +        error_report("WHPX: failed to map GPA range");
> +        abort();

Maybe aborting is too violent (i.e. trying to start a SBSA-Ref guest)
and we could just exit(1)... Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    }
>   }


