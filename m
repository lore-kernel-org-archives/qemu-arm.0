Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp811764njc;
        Fri, 9 Aug 2024 03:02:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTyTJFs1ZsQm7ohwGwYDz/IIzoHbMdy8Ju+N0wlVLMIXRnHPPPRRubTpXw4JC16ZEWvrVEP2GbANK0Xpt25OEfr11foCai
X-Google-Smtp-Source: AGHT+IFOXymGPqmtNVLku3RlJS44lFxheQzmZSFCeqmKKc45TXaqLdWTZesHuC7yPhVzFqYLbcxO
X-Received: by 2002:a05:620a:288c:b0:7a2:a1d:c0f7 with SMTP id af79cd13be357-7a4c17b6b86mr101299685a.16.1723197728669;
        Fri, 09 Aug 2024 03:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723197728; cv=none;
        d=google.com; s=arc-20160816;
        b=C9dzZKnvs8Cv2FJeraJryaJFZqtZWqJBk+rPVWtdoXsIgIBf09wEeFTN4N8lobd3BW
         jDsOZABJRcGXmCjj9H13sYVwziUoJRmmSvYr+aHfrRmzoCugy18dealHuhndmccA3Ygp
         dOcvzbViO8n75BBfhdHieYezqsdmYoVacv05NZ4wSRTupNf35VqlwLCV8vYvjladn+yG
         1B1A8Qv5jLWxSr/GQqujMDijbVqlMR8SPWvU/GQyufBJQ72cu7hlWVGuAdcGLO1zdHVz
         ZKa7DiUIpWgCj+GdUBOE3oodUjyaIE0ioKeUI5jZPgIbUK3T0+2LmH/eWU6NKxZnZQTJ
         pj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bqTlc/7r7TFzilI+jp6vUYVKeFD/MTyOpFCRYa4eILk=;
        fh=XX+dgkgF1NhCVN+iBAG+rOLypjsAs0LmRKXD2YPrEGE=;
        b=fgNpq8SP1XMfSgcWDTYrZX6UdB8ODcryo/qebOOMAnyHtoqg4DazoslJG6QjhAlduu
         UI33p0DOLxlHDg16IPSQD8OiN0vsW4sUVUc/zSyGb5DW7L8Cr51jsIjywsnVVjKN2Av1
         vZSKjCTdLyrG9P1t3iNAwbXv5fXzdxdXVsaQt7Jz6W/49uSQqyEzBRAwK0YFpUjYjT9r
         B7XrPh4gPdU6AH0/aIaf83cp9GCmRv8pBV1okPS3uDztHURBjy4LFaan3sjgK3jAlA8q
         +FdPLRsCeUZbl9Fw+WiY4XC1T7dPBgvg/H1C3Ves65uQ20RR4GEcA7GLkBzeG9a8a+en
         WHTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSrAf8BJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a378805fefsi644068385a.244.2024.08.09.03.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 03:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KSrAf8BJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scMRQ-0005v6-8g; Fri, 09 Aug 2024 06:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scMRN-0005k3-Do
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 06:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scMRL-0004CA-ON
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 06:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723197702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqTlc/7r7TFzilI+jp6vUYVKeFD/MTyOpFCRYa4eILk=;
 b=KSrAf8BJNyZxIZMRDc6w1RVH+3XkkDxtFokwcynNT3uypjf+bb/BCA/JNVv9OlhDCDAVRY
 g5yVpcXVPm9Yqvw5TqwsNWKFkqbuOlA48PU9vfpLMl1S/Qe5j/i4JCK3cJMcvr8IYTs1Zq
 jBylB2t982Bgd80XgK9/GRg4OCL15Ww=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-bExV4k5oMdGW1anWl7xFkg-1; Fri, 09 Aug 2024 06:01:41 -0400
X-MC-Unique: bExV4k5oMdGW1anWl7xFkg-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1fc6f3ac7beso19262495ad.1
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2024 03:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723197700; x=1723802500;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bqTlc/7r7TFzilI+jp6vUYVKeFD/MTyOpFCRYa4eILk=;
 b=MXuiEsTAfDIy2ZgOB0Onm9gyAn7ZJCtJOJkg36J+jfBrEUWCs45yA/1o4WbSetwJuV
 ybDDxS7Vl+Vvw+Y+0h9FyU7Lw73HwBNFiampwHzIzZUODPXvYlxwrvHfNCKqwx3YTllg
 UxRrUoHTbZyOdHKmqa866blA/lLTFRxcdvpE80NI8O5VxcB83sw5uTU2M5XbgOCejkUo
 Uk8Qs2ZbMy+f2fw0kkrYpdGL/aAGkYIqblgxee15iCb+WqKOqUKsCCGP2QXpPPOdvPtr
 HJQ9uImQ66retIry2QBWLTwpPXOAWxFLXb2N8onMzfmB3boM/I4rado7LjQGlDenn3PJ
 fxgw==
X-Gm-Message-State: AOJu0Yw1H7NpggB+GedH5qGTHIf/RkmOsT4QwuTrunAzMxucBQ7Em9Sh
 nh7qUJkAY9DZtHcMhvXLw/jUKVLofdWCB0ZNx2ZrPg3bzaR6z5W/M8xklyoZelLRkhxBzJACWY9
 NaSCEasH+0ric5brW/y6EejW6dVgDxOC/gxj1zVAzEen3buLXPgFeSR0B9Kf9zRlkin1AVkC58t
 FBwLJrLU0hCk8rSXNIlfD9rux0AHQS5g==
X-Received: by 2002:a17:902:f54b:b0:1fd:9e6e:7c10 with SMTP id
 d9443c01a7336-200ae5e68e8mr7184005ad.41.1723197699554; 
 Fri, 09 Aug 2024 03:01:39 -0700 (PDT)
X-Received: by 2002:a17:902:f54b:b0:1fd:9e6e:7c10 with SMTP id
 d9443c01a7336-200ae5e68e8mr7183435ad.41.1723197698254; 
 Fri, 09 Aug 2024 03:01:38 -0700 (PDT)
Received: from [192.168.68.54] ([43.252.112.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f21723sm138749415ad.15.2024.08.09.03.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 03:01:37 -0700 (PDT)
Message-ID: <d75a3435-6ab4-47c2-aee5-71dc4f877639@redhat.com>
Date: Fri, 9 Aug 2024 20:01:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/arm/virt: Use kvm_arch_get_default_type()
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
References: <20240809035134.699830-1-gshan@redhat.com>
 <20240809035134.699830-4-gshan@redhat.com>
In-Reply-To: <20240809035134.699830-4-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fy9fyVz407u9

On 8/9/24 1:51 PM, Gavin Shan wrote:
> kvm_arch_get_default_type() and kvm_arm_get_max_vm_ipa_size() are
> interchangeable since the type is equivalent to IPA size (bits)
> with one exception that IPA size (bits) is 40 when the type is zero.
> 
> Replace kvm_arm_get_max_vm_ipa_size() with kvm_arch_get_default_type().
> After this, kvm_arm_get_max_vm_ipa_size() needn't to be a public API
> any more.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c        | 14 ++++++--------
>   target/arm/kvm.c     |  2 +-
>   target/arm/kvm_arm.h | 15 ---------------
>   3 files changed, 7 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 09b7a158a9..f35857aa95 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2995,10 +2995,12 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>   static int virt_kvm_type(MachineState *ms, const char *type_str)
>   {
>       VirtMachineState *vms = VIRT_MACHINE(ms);
> -    int max_vm_pa_size, requested_pa_size;
> +    int type, max_vm_pa_size, requested_pa_size;
>       bool fixed_ipa;
>   
> -    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
> +    /* The IPA size is 40 bits when the type is zero */
> +    type = kvm_arch_get_default_type(ms);
> +    max_vm_pa_size = (type == 0) ? 40 : type;
>   
>       /* we freeze the memory map to compute the highest gpa */
>       virt_set_memmap(vms, max_vm_pa_size);
> @@ -3017,12 +3019,8 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>                        requested_pa_size, max_vm_pa_size);
>           return -1;
>       }
> -    /*
> -     * We return the requested PA log size, unless KVM only supports
> -     * the implicit legacy 40b IPA setting, in which case the kvm_type
> -     * must be 0.
> -     */
> -    return fixed_ipa ? 0 : requested_pa_size;
> +
> +    return type;
>   }
>   #endif /* CONFIG_KVM */
>   

This actually needs to be something like below. It's incorrect to ignore
@requested_pa_size here.

         return (type == 0) ? 0 : requested_pa_size;

> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 849e2e21b3..65893c9c12 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -526,7 +526,7 @@ bool kvm_arm_pmu_supported(void)
>       return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
>   }
>   
> -int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
> +static int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
>   {
>       KVMState *s = KVM_STATE(ms->accelerator);
>       int ret;
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index cfaa0d9bc7..fd919d4738 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -188,16 +188,6 @@ bool kvm_arm_pmu_supported(void);
>    */
>   bool kvm_arm_sve_supported(void);
>   
> -/**
> - * kvm_arm_get_max_vm_ipa_size:
> - * @ms: Machine state handle
> - * @fixed_ipa: True when the IPA limit is fixed at 40. This is the case
> - * for legacy KVM.
> - *
> - * Returns the number of bits in the IPA address space supported by KVM
> - */
> -int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
> -
>   int kvm_arm_vgic_probe(void);
>   
>   void kvm_arm_pmu_init(ARMCPU *cpu);
> @@ -248,11 +238,6 @@ static inline void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>       g_assert_not_reached();
>   }
>   
> -static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
> -{
> -    g_assert_not_reached();
> -}
> -
>   static inline int kvm_arm_vgic_probe(void)
>   {
>       g_assert_not_reached();

Thanks,
Gavin

