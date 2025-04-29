Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp353442njm;
        Tue, 29 Apr 2025 08:46:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhEgy3Fq4z9yF/PLQWyrHSfLvLoTZQDWFcagkhegCFMVsWraw9l0dRbgh9/rFr7q7pvex7bYOHnlQA7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEaiMp+N1o2W76ncY0D922TkdV6e7ah3M9M93UseKpZe94T4AJkeclPbjHWVkJ+p+HA8M01
X-Received: by 2002:a05:622a:1ccd:b0:472:bbb:1bab with SMTP id d75a77b69052e-48871755324mr49254621cf.24.1745941572474;
        Tue, 29 Apr 2025 08:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745941572; cv=none;
        d=google.com; s=arc-20240605;
        b=NERfxA4VAJm8vfnsgothPNpcQp2ZTW9cDwGgfgbo+MQOoZML0WUpoiZRuYlfnuw8Z+
         uFLyUKM8L7oyWz/1c+ApH7qRxes629t1C05BGWMPS3ZFOzd0lVPg4e455SIX2BA6KBHM
         WyilxZa/JZ7pi5zA++uaVq8deATMh8nNZLE+dBXwRfSTD1C4vm1LVsXzAlm3E+P7Wcyy
         1Tm/9m3juX6JXGZEvRhwEitWDceP5bqtbf/0Jvjk3yxaJBGwHkJfKStEkmF9TmeT4uY4
         /n2cQKGRW/4yedTkcoRPnSGU+FErGDLGziwxDLsnvmgSNvJWpAODY1tjwVUuz/Eem/sb
         xY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=np9xqL918gw2Ubbb/06D9MCBoIwQQnlrKQUY8EH6ues=;
        fh=g4RabPuBY2n0d62TIIZ8TV3YuZJH5wkpPLz6l5gwfRs=;
        b=C10RLi7aEhcl+n9ehvwmPq2Vmo+jdtglydVHdHitV0b8aZQOyPv9YWIMw/pDIrcEXW
         YWJu9c7rwRTOk3b2d5VzrdEp+zNFFOjZf6ic9NkAOeapSZyF2D2jwtgEBsZ3Sui5GySZ
         7efjJXHcs2wE5hFlChfjbtvHDBqDm5haKZcprE86H/WSqj/3mohxAMo9qp8TUG6VJBNU
         XXpGi7qpg5PRn/hKIUMHcikZGm5bMiLzRcTOmol6iwB8p8PKA4WIsLLPm92Z4ZXvuuyo
         qm/KMuyn1lty3laeiGLTfayfe1AmNQYaEQiS+OLLm+IsEiUhWb+TOsrl+7RNZFIvPLSe
         Lu+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JU2YKuM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-489a04db45bsi284571cf.123.2025.04.29.08.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 08:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JU2YKuM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9n9g-0004Dc-GA; Tue, 29 Apr 2025 11:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n9R-0004CY-6E
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:45:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n9P-0000kX-Ba
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:45:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c14016868so6272755f8f.1
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745941537; x=1746546337; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=np9xqL918gw2Ubbb/06D9MCBoIwQQnlrKQUY8EH6ues=;
 b=JU2YKuM+NKMoqG6fvWnm2Cw0IxypUjsNsMfNlq1BE2c6Oiw5f2zVNh8Cel84cx86fn
 sZbhLsUF4wzsPURzN6AGWpy+sZXGo9xcy8/rIa2PjetinYhXuopEXfZmwA1v4aLdSiq8
 fBIWnQm6e/6pCMpYw4Pyybjh6H6/QIF+9rK/Upc1DpQe4/ODssyOrkETGcJyWKItcdLY
 IviD40pAEqMiK0Z3CtQAUdvo2DrhKp76VqbIxx8oFGThij35JK1bLV/9DKN4XXP8SYGh
 XXOL91Qq6p19+tCTIg6365LoATWFnyyqPU7JB+AdwEv0h+HJxnVlqvJ0Fv7V1Ujw8RG5
 VKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745941537; x=1746546337;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=np9xqL918gw2Ubbb/06D9MCBoIwQQnlrKQUY8EH6ues=;
 b=m26hveZo6wUkXbr1O6Cn/O1skdKjCKEVmpEW5GwcdE7BXbKUPCm3CFjTnWuzlQS7qH
 NQu7GNgIbZsldZqyrv869A7xGkpiVbsjp1VzetYcBDSpbfWhzPGJQ+QyAtSdaOVBRqMp
 GxjbSaYk9B02vm668k7O0sbZhcZ97cnQljT/BOROePetwHxuqOfPabU6ahsv747PkoCX
 1/0T+NgL6VmaUBtet1vWoo14Y/Sycq5gJMzYXx5yPYohNv2aYZW0HHvAaPzR3klMx7Jn
 pEf5tgxxK88seRJS94ra3ZCadLYGa/xuwhPzqWTL87rzvhYAQotBOFOTzjT1DtY39NeY
 pFyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Zbn0IrVZ1emoc9LXuHziuaM0XUgFAEHH2QmIhU9rMRCVqMNER+lEM4e75bTHWHQXHP4ViQTTgg==@nongnu.org
X-Gm-Message-State: AOJu0YzycxiqPxQ6+wW0MJfg6ebEkt54r6rwueW1pTG1GtfK8SHbw7lT
 3VULguJJcsqM4UJIimqpf9SeE8BfO4nCOPBMbKDGAegPeuOXyJsFqGlpebmLoG8=
X-Gm-Gg: ASbGncvLNPCivN7cns2m0LP8qLxYqAGH7P+K3jLRGvg3NXO6nQA5WWwfGPrtnfAbcPm
 pqWLLI948BYtjbKx1itredJIdOCmX8SAE7lbxay5Gc2kOo48Px6Cv+wW8OpG+uDDfMX+JlfBKnJ
 gBiMOJ+Jaad/4uCyLYO67+oVhmP1ZUO7shceRQCR/pISMqta+H25RljvLGPE+gTg8t71TAqRPYs
 Knj5wyFaM8OrTT/IhdMQTHssv7/19Fp0Vjgq7jAY1HkDdipp+8Gmtg+dImvXu1/XEt/8Iw0UHX+
 Vf5Yv+b65E75EQ0WKn2fbrdJ58omiQpsyM3l2LqrYaplWPLS0o7ChN/vu4aPdjrHD2wUZABRXoF
 hwosz6N090BIfTA==
X-Received: by 2002:a05:6000:dd2:b0:39c:142a:ed6c with SMTP id
 ffacd0b85a97d-3a08949d877mr3492048f8f.40.1745941536969; 
 Tue, 29 Apr 2025 08:45:36 -0700 (PDT)
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e4684csm14227934f8f.76.2025.04.29.08.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 08:45:35 -0700 (PDT)
Message-ID: <3c2c4f90-92a2-41e0-b6c8-71c058ffab7f@linaro.org>
Date: Tue, 29 Apr 2025 17:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 03/13] hw/arm/virt: Remove
 VirtMachineClass::disallow_affinity_adjustment
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-4-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250116145944.38028-4-philmd@linaro.org>
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
X-TUID: oOo8YNQvW7fJ

On 16/1/25 15:59, Philippe Mathieu-Daudé wrote:
> The VirtMachineClass::disallow_affinity_adjustment
> field was only used by virt-2.6 machine, which got
> removed. Remove it and simplify virt_cpu_mp_affinity().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/virt.h |  1 -
>   hw/arm/virt.c         | 30 +++++++++++++++---------------
>   2 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 27c5bb585cb..5d3b25509ff 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -117,7 +117,6 @@ typedef enum VirtGICType {
>   
>   struct VirtMachineClass {
>       MachineClass parent;
> -    bool disallow_affinity_adjustment;
>       bool no_its;
>       bool no_tcg_its;
>       bool claim_edge_triggered_timers;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0080577e1a9..53f4a96e517 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1759,24 +1759,24 @@ void virt_machine_done(Notifier *notifier, void *data)
>   
>   static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>   {
> -    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
> +    uint8_t clustersz;
>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>   
> -    if (!vmc->disallow_affinity_adjustment) {
> -        /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
> -         * GIC's target-list limitations. 32-bit KVM hosts currently
> -         * always create clusters of 4 CPUs, but that is expected to
> -         * change when they gain support for gicv3. When KVM is enabled
> -         * it will override the changes we make here, therefore our
> -         * purposes are to make TCG consistent (with 64-bit KVM hosts)
> -         * and to improve SGI efficiency.
> -         */
> -        if (vms->gic_version == VIRT_GIC_VERSION_2) {
> -            clustersz = GIC_TARGETLIST_BITS;
> -        } else {
> -            clustersz = GICV3_TARGETLIST_BITS;
> -        }
> +    /*
> +     * Adjust MPIDR like 64-bit KVM hosts, which incorporate the
> +     * GIC's target-list limitations. 32-bit KVM hosts currently
> +     * always create clusters of 4 CPUs, but that is expected to
> +     * change when they gain support for gicv3. When KVM is enabled
> +     * it will override the changes we make here, therefore our
> +     * purposes are to make TCG consistent (with 64-bit KVM hosts)
> +     * and to improve SGI efficiency.
> +     */
> +    if (vms->gic_version == VIRT_GIC_VERSION_2) {
> +        clustersz = GIC_TARGETLIST_BITS;
> +    } else {
> +        clustersz = GICV3_TARGETLIST_BITS;
>       }
> +
>       return arm_build_mp_affinity(idx, clustersz);
>   }
>   

Missing:

-- >8 --
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f4e5a93f0c5..9a6cd085a37 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1766,3 +1766,2 @@ static uint64_t 
virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
      uint8_t clustersz;
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
---
