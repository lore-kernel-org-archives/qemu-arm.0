Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE52CA5FC4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 04:17:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCUhZ-0004XH-QT; Fri, 02 Oct 2026 00:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCUhK-0004WH-ON
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 00:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1xCUh2-0001by-IF
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 00:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790914578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nY/HDfa1K8lHV/bOI9KXS6udwAbaiCBgMf0RYAo0w3g=;
 b=Mbaj/VsDuXYjNhetnFKUpTwhQWT69Bbr0Gbebag/0bPqc27u+15o9qrt7ZhTju5KtIBBdn
 aGIjj2vlJVRBz0/bxwo/zlfSUBtClgej0Us9+reWj9ieSNZeoqRzcOXUKM/2onmYIg8AUt
 eU9YuXPMTiOaMOD5+9b9o3zzWgIU/vU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-6NRqxTNKP5OJO_Bxgywz9g-1; Fri, 02 Oct 2026 00:16:17 -0400
X-MC-Unique: 6NRqxTNKP5OJO_Bxgywz9g-1
X-Mimecast-MFC-AGG-ID: 6NRqxTNKP5OJO_Bxgywz9g_1790914576
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-88679c4f94cso2427605b3a.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 21:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790914576; x=1791519376;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nY/HDfa1K8lHV/bOI9KXS6udwAbaiCBgMf0RYAo0w3g=;
 b=OxdvXyN27YCYt23G7T/ebHaN6whfDlctnlMdu1OfPKnAQhxESlLhhs5fEoitmd/+Ba
 uxVYlRbVTY3olYiYTHodGtU/NHSRbiwKlHZuArLfbQuCSYC44TmSrOts1TfNSOHK/B4H
 0xRJj/mz4OrXNIta8zUi3HEY6PWq6PbAGOzCRryFy/J3fHc8xLMQ7UqAy6L3AR8nA70Z
 nwruTc3Wf4DazqiKoJrHKs5zEVzLKGVAextjae2AvMFQ5qrGarFEuKPG3E9Fgxxv3DSJ
 mhtoXOJXmIx7C9FYTTYpOcSMvfsKFxv+rtdeKb/zlr91AKosvdPQYgHNsds+Edw+5X/N
 w1rQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxGqgn1BZP2GlTy2bCl0xMQOeJuIEiDhmJuFrjyehgqaoEKs5ak1Rlyu5fHK/IQOWJ5HBxdEtjWgQ==@nongnu.org
X-Gm-Message-State: AFuF++l9gWIZMPWlJdgV5/7dAbjFM6H2qmyXdyUk+5R9RtaUFXnkOdte
 yCctp2V1zw03ql46Pt/fdtNCMfAoCtFm4kQ5FFupAh2rUHIU9HbqXLCPR4Pu2cbT0xGVjtdrm7/
 cljGY8Gh5duGbcXPN5JkCQ6PUOB3Cr1lzHF8xxiFFbMGmw4xBH8vAjw==
X-Gm-Gg: AYBFou3olpOggdCzb8cyYjQz867TOeC54qZ92p6l3+TXIbutEgN/+2ZHW5nReLR6cSC
 7phn/PkrL99CLwtH7SbxZ1JkSMpowJ1gxmfPral7WLgVdMoE0im3NfDg1cQS8zFfEb4wreYWMR3
 c5CctnXHsnjXXxtGmMoJA7+U/4tniKjgWkr7nFpfhbiKcKcKya66Fj5EFXLbCMlz9xh/3xgqP5p
 YxGklo7Ths0AdwmAuwFzZ6gkvM46pEg1A5+PbOqsLX5X7oadC5gGSCszo/ks3qKdNX8X7D0qr5R
 RARZh4lnq7AtCLmeDwoScNlZCZ4X63lwD7fPPFJhuRaNvuPV7KVE92wJm7SgI6MIMADQ9ivWWL7
 rTF560WTZm6e1gBhKKq3M4/GtIhv49uIT5GCXBG76kg==
X-Received: by 2002:a05:6a00:13a1:b0:888:add:a07d with SMTP id
 d2e1a72fcca58-88af4b4844bmr1532489b3a.29.1790914576021; 
 Thu, 01 Oct 2026 21:16:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a1:b0:888:add:a07d with SMTP id
 d2e1a72fcca58-88af4b4844bmr1532459b3a.29.1790914575507; 
 Thu, 01 Oct 2026 21:16:15 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-88b0c1b1df0sm406453b3a.27.2026.10.01.21.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 21:16:14 -0700 (PDT)
Message-ID: <5fa30b18-7894-4024-9a87-8cb047979f2a@redhat.com>
Date: Fri, 2 Oct 2026 14:16:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 16/24] hw/arm/virt: Embed Realm VM type with IPA address
 space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-17-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-17-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CEfREKPHZUOYC2HdWYXozpOIMUrJCOj8u2CVFqpPZIo_1790914576
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/4/26 5:36 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Set the Ream VM bit in the IPA address space size when needed.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   hw/arm/virt.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 37211bc81926..61751aa31e0d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -97,6 +97,8 @@
>   #include "qemu/guest-random.h"
>   #include "hw/watchdog/sbsa_gwdt.h"
>   
> +#include <linux/kvm.h>
> +
>   static GlobalProperty arm_virt_compat_defaults[] = {
>       { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
>   };
> @@ -4053,9 +4055,12 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>       VirtMachineState *vms = VIRT_MACHINE(ms);
>       int max_vm_pa_size, requested_pa_size;
>       bool fixed_ipa;
> +    int vm_type;
>   

Lets initialize @vm_type when it's declared:

        VirtMachineState *vms = VIRT_MACHINE(ms)
        int vm_type = ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL;
        int max_vm_pa_size, requested_pa_size;
        bool fixed_ipa;

>       max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
>   
> +    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
> +
>       /* we freeze the memory map to compute the highest gpa */
>       virt_set_memmap(vms, max_vm_pa_size);
>   
> @@ -4080,7 +4085,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>        * the implicit legacy 40b IPA setting, in which case the kvm_type
>        * must be 0.
>        */
> -    return fixed_ipa ? 0 : requested_pa_size;
> +    if (fixed_ipa) {
> +        return 0;
> +    }
> +
> +    return requested_pa_size | vm_type;
>   }
>   
>   static int virt_get_physical_address_range(MachineState *ms,

Thanks,
Gavin


