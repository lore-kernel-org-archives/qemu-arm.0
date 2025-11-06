Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ADACCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 09:40:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGwTh-0001zy-OH; Thu, 06 Nov 2025 04:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vGwTg-0001xc-Gf
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 04:40:24 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vGwTe-0005L2-Nh
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 04:40:24 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b70fb7b54cdso130407666b.1
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 01:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762422021; x=1763026821; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I9JtZzZZJ5Szb1swUQPzO9Qt81xOQJmVdlAU2ltZN3g=;
 b=cRP2knaI8mrRHqxvdCWqs2XEf4qqM7PaR4iMJ/5tM+4Hd8KD7IjY5w49rR8xjOLGH1
 We6FFfBvEcZOLjjd2Df8dzwV1rAorK15eh13vXnPKwQi14u0Z9eufy/BIPmiGGkL8Dx9
 GfG0dw0J89bRgeMtbO0PqlHeDMoF+lwf551ETaigw58CcvNf5Pa3amny1njKwhxVghhT
 xw3T27rHwgzvq1et+HHe4RAalZYI6Af+d7doskdYYduxPumcsaaDDeHHuygUC/T8T19d
 0QSMFTR0Nq0TVb94ytvpVJPzAHrSHFkqAreuIFdPRfZwMeZbZbVSX+XJYNwifD4IBIFb
 5rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762422021; x=1763026821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I9JtZzZZJ5Szb1swUQPzO9Qt81xOQJmVdlAU2ltZN3g=;
 b=Hh2jVAUOSJ2nxcXpRvRS+9DjDSAKzwYI2Wxt8I03nIerzpECN0BIpohxXR0lwe9mbO
 T3HGhauZjnIds1kEl8BKx0atPYIe69jngFW8BwDhmYtJz0zbsJZBUoBeN0KiZZC6XCew
 wtk8uhrZQW9qNn/bouI40AEBoPhd6TsxgeRRd8l2b0WhOmzADIuAIP25k04RlBeWnbQY
 KJFfKM8IY5xkTu7Bg8aFagDKwRoa35f3BSNeCgEtA93yO0+pmtE8CQsh2oIyWAoy6G+a
 MCSo20NU4/iHPtH+7hHFWjWK4+YEpzntl+3ufzny2oiZrGzt0gV7OIS8YvlDbPOYyb/i
 xlDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnOuIWQ6iKJfflsSPhQWfZPciKxwihSqoSJ58LB7N7IlTxro/PZTnq0JO6XHB/6THadIXH/oziJg==@nongnu.org
X-Gm-Message-State: AOJu0Yz24fyY1W/66M4+U79aSAYU1s0pqcy5ktkHVKfn3jKDGQiJ+hRH
 Zg3y1nuGtsXA0fuwuee6/4aRqugqQAzso5EAO3MvGhI+EAuM5l1WdGK6zgDTNGuHNWw=
X-Gm-Gg: ASbGncvZA2oyPQkOnXuufwXCNHjrF7HKYqHj8JHA9IA6cBqr1N+I7VkNGo0rNrqIENq
 C9LTUkBYP5L9U9g6J8MomU4efGTvD+CxXJLYXEKPxR8MysaoJtOB5KirUGKL0HQN7kQTVoCESb2
 cRe38wGerK/qJ+hjTq3yBcTH+l4vutbwDNtW4qBF73VSB+5/Sg2Vf6MjU6/t/GpZfgWhRVMbcOb
 JBNce7lhQOBeHDI9uiFeH8+7hEr9rjDlzfnCZ4f0AbmJ8hXqXhsLkOEazxT0ucK0XbwIvV2sw4X
 XoGfE+jK+HA/yieAdbIIiwZQQgH/tR7x6CK9wLLrh+O/qo7TQdNxQfXNlWHYfDNMg4KJtvtXRrL
 vL8SGbGBEibXf0E89nGbHkCfxnrvArOcKrRfbhFUjuaZNj/GWlbMD6SjH6etIPmH0Av7IPv/6Sx
 LThSRArTa6nXUU/KSkdvnk6KZN4wW705f/ng==
X-Google-Smtp-Source: AGHT+IEImNLvEv+BvoVzM3oQPw7O5b8dvobLF8MfGHU2pTrRO+7e3bcoq1UdHlWr9onQhn11vFBzbQ==
X-Received: by 2002:a17:907:7f0f:b0:b3f:f207:b748 with SMTP id
 a640c23a62f3a-b726515d4e2mr469991666b.10.1762422020826; 
 Thu, 06 Nov 2025 01:40:20 -0800 (PST)
Received: from [172.20.148.161] ([87.213.113.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7289644819sm173764566b.45.2025.11.06.01.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 01:40:20 -0800 (PST)
Message-ID: <e52c8dd0-d284-4dc0-ad0c-3832ce996884@linaro.org>
Date: Thu, 6 Nov 2025 10:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/28] hw: arm: virt-acpi-build: add hack
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20251029165510.45824-1-mohamed@unpredictable.fr>
 <20251029165510.45824-18-mohamed@unpredictable.fr>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20251029165510.45824-18-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ej1-x62f.google.com
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

Hi Mohamed and Phil,

On 10/29/25 17:54, Mohamed Mediouni wrote:
> Looks like in the prior Qemu ACPI table handling, GICv2 configurations
> had vms->its=1...

To me, ITS should not be present on machines that have GICv2, so we should not generate
any ACPI table advertising ITS when GICv2 is used.


Cheers,
Gustavo

> Match that assumption to not make the test suite fail. Probably not merge-worthy...
> 
> And then maybe see what to do for older releases too?
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt-acpi-build.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a6a56455a9..39dd3d1020 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -472,7 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           nb_nodes = num_smmus + 1; /* RC and SMMUv3 */
>           rc_mapping_count = rc_smmu_idmaps_len;
>   
> -        if (virt_is_its_enabled(vms)) {
> +        if (virt_is_its_enabled(vms) || vms->gic_version == 2) {
>               /*
>                * Knowing the ID ranges from the RC to the SMMU, it's possible to
>                * determine the ID ranges from RC that go directly to ITS.
> @@ -483,7 +483,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>               rc_mapping_count += rc_its_idmaps->len;
>           }
>       } else {
> -        if (virt_is_its_enabled(vms)) {
> +        if (virt_is_its_enabled(vms) || vms->gic_version == 2) {
>               nb_nodes = 2; /* RC and ITS */
>               rc_mapping_count = 1; /* Direct map to ITS */
>           } else {
> @@ -498,7 +498,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>       build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>   
> -    if (virt_is_its_enabled(vms)) {
> +    if (virt_is_its_enabled(vms) || vms->gic_version == 2) {
>           /* Table 12 ITS Group Format */
>           build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>           node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
> @@ -517,7 +517,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           int smmu_mapping_count, offset_to_id_array;
>           int irq = sdev->irq;
>   
> -        if (virt_is_its_enabled(vms)) {
> +        if (virt_is_its_enabled(vms) || vms->gic_version == 2) {
>               smmu_mapping_count = 1; /* ITS Group node */
>               offset_to_id_array = SMMU_V3_ENTRY_SIZE; /* Just after the header */
>           } else {
> @@ -610,7 +610,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>               }
>           }
>   
> -        if (virt_is_its_enabled(vms)) {
> +        if (virt_is_its_enabled(vms) || vms->gic_version == 2) {
>               /*
>                * Map bypassed (don't go through the SMMU) RIDs (input) to
>                * ITS Group node directly: RC -> ITS.


