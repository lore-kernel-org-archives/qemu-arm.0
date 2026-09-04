Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D2C61DD3
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 06:08:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2N5u-0002fW-Op; Fri, 04 Sep 2026 02:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1x2N5t-0002em-CS
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 02:08:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1x2N5r-0001R8-GB
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 02:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788502086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1L2vnFo353yjGYAyJ7gKR3siRLiMzHI6F79fs117Ik=;
 b=Vxv5AAE2EcP/5kbCitawJxywDyU3f98tQDd1lU0gAdLQEPoucT5g7jUwgKETO3lgtZuR9Z
 tZWNeFPZGXmLIvVAyY3f79w8b/8goN/TqPvwbVKeAIiRCZEplwficmWXVzPSQUeeX3afvU
 SPquqBwglrSztvyc8nVy69jcX0ZuGd4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-F0vArNm3MFCvppJZRp_rkw-1; Fri, 04 Sep 2026 02:08:05 -0400
X-MC-Unique: F0vArNm3MFCvppJZRp_rkw-1
X-Mimecast-MFC-AGG-ID: F0vArNm3MFCvppJZRp_rkw_1788502084
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-398d292eac1so1454484a91.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 23:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788502084; x=1789106884;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J1L2vnFo353yjGYAyJ7gKR3siRLiMzHI6F79fs117Ik=;
 b=qJwZkW1bCrUemual8B0oFRRsZSRWm/W8PM4HeqwXFfGFb+scIrHIuOjt+aPOInWC36
 EQTLyAR+wWurQFZ1YeFF7gN6od6jjqFoUW1lJY/UV0bRPFFr7kVduM1LFi/heQNSOAYp
 FsRzLppdzqqBs2/a7WiI36k8Kc1zMeNu+S1gjr3RLwOmSpAccIGFf7PTeLzR0HE3Bys8
 S0hjXL+TNU1r26ijSRyY3MEFgt8+dzptdNhTQtC2reSxvawwIdDDsCLZjDUulpxENTZT
 diK3XDrX1q7U7e/jGBDfOYixY0u9e1+yzlkGONuLJa1xBRnXcWP1Ek1hNpknLwue2KT+
 gH6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwa3RbKYl4FyigEgEWVGaz9lTIER3q0ei/+JEqngkZYS2D1qwzQxYxoIzW9yh8CQpihRToug1TdwQ==@nongnu.org
X-Gm-Message-State: AFuF++lO81N4IPnyBTDckTRmdKna240VkspbHDcEE4CHfGI48aEX3SW+
 mqDrIgOZIcNeF6IBdKtBjnGWRyMZewdH4JHM4ip0v+c/Atfz8Gk+H9Ei54yv/UC60oSQFpaK1mI
 VsndpaEGxrwavs/tbZNV/hSm0VdCE8KYBy/6swaSvzX7l8Hvxi2WvIw==
X-Gm-Gg: AYBFou04XpWMaKwsRKPbI2Vpf//OK5g7nmR1JYo9OXnTzCth9t6qvlzE4PJg3GA0m70
 psiul0jJoK5fP3zD5z/enXc6cDFsMqAU2poSQltHjgXQxBAOswr0i63fud0Cmk9PHG06bQYQecb
 tTS5OIkDU3viS3sxlBJ4GV4U2TZLQIjYHbny8kz6gvnkauBd89lP/FufjX7Wl05SI8U20HCr+QT
 bRJeilKa7Ws+mnj7OWPhFjY4GLDs/cjy9MqHnuAtdxtDmTrD07vV3pbaKV3okjp9/zsMyYgtj9n
 MNEXCUwxqdkoj7B3D/5ONeQprBHWa7vEeaCds7LiFBBQjaAHvKGvW84HKioBVnzluYRR6tVlr8W
 Tn1PMfiiVs5eoxQ5Q2eE0x3SKTs0GwxTQv3tcEzftXw==
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id
 98e67ed59e1d1-39b2623ef65mr6524689a91.24.1788502083875; 
 Thu, 03 Sep 2026 23:08:03 -0700 (PDT)
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id
 98e67ed59e1d1-39b2623ef65mr6523936a91.24.1788502077992; 
 Thu, 03 Sep 2026 23:07:57 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3339bdf26c5sm3852026eec.27.2026.09.03.23.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 23:07:57 -0700 (PDT)
Message-ID: <b06c933e-b8fd-4e03-8f50-9a9086542ccf@redhat.com>
Date: Fri, 4 Sep 2026 16:07:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 01/24] linux-headers: Add RME related definitions
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
 lorenzo.pieralisi@linaro.org, enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-2-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260903193611.1058589-2-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VZjhwXAx9WhCDr7phzLYHneLi2mGKsqGbwP_Gr3qb8E_1788502084
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Mathieu,

On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> This is a temporary patch intended for testing purposes only. It provides
> definitions related to supporting Realms by the QEMU-VMM.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   linux-headers/asm-arm64/kvm.h |  9 +++++++++
>   linux-headers/linux/kvm.h     | 10 +++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
> index 6aefe7973814..4c08631ec7d2 100644
> --- a/linux-headers/asm-arm64/kvm.h
> +++ b/linux-headers/asm-arm64/kvm.h
> @@ -208,6 +208,15 @@ struct kvm_arm_counter_offset {
>   	__u64 reserved;
>   };
>   
> +#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE     (1 << 0)
> +struct kvm_arm_rmi_populate {
> +	__u64 base;
> +	__u64 size;
> +	__u64 source_uaddr;
> +	__u32 flags;
> +	__u32 reserved;
> +};
> +
>   #define KVM_ARM_TAGS_TO_GUEST		0
>   #define KVM_ARM_TAGS_FROM_GUEST		1
>   
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 29f81c05aca2..8b7627f11447 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -689,14 +689,19 @@ struct kvm_enable_cap {
>    * address size for the VM. Bits[7-0] are reserved for the guest
>    * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
>    * value 0 implies the default IPA size, 40bits.
> + *
> + * Bits[30-31] are reserved for the VM type
>    */
>   #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
>   #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
>   	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>   
> +#define KVM_VM_TYPE_ARM_NORMAL		0
> +#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
>   #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
>   #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> -					 KVM_VM_TYPE_ARM_PROTECTED)
> +					 KVM_VM_TYPE_ARM_PROTECTED | \
> +					 KVM_VM_TYPE_ARM_REALM)
>   
>   /*
>    * ioctls for /dev/kvm fds:
> @@ -719,6 +724,8 @@ struct kvm_enable_cap {
>   #define KVM_GET_EMULATED_CPUID	  _IOWR(KVMIO, 0x09, struct kvm_cpuid2)
>   #define KVM_GET_MSR_FEATURE_INDEX_LIST    _IOWR(KVMIO, 0x0a, struct kvm_msr_list)
>   
> +#define KVM_ARM_RMI_POPULATE	  _IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
> +
>   /*
>    * Extension capability list.
>    */
> @@ -988,6 +995,7 @@ struct kvm_enable_cap {
>   #define KVM_CAP_S390_HPAGE_2G 249
>   #define KVM_CAP_PPC_COMPAT_CAPS 250
>   #define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 251
> +#define KVM_CAP_ARM_RMI 252
>   

Both KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES and KVM_CAP_ARM_RMI aren't consistent to
the definitions in Steven Price's (v16) host series [1]. They need corrections as
below. Otherwise, realm VM can't be started and the following errors are raised by
qemu.

[1] https://lore.kernel.org/kvm/20260803134403.80630-14-steven.price@arm.com/

root@host:~# qemu-system-aarch64 -enable-kvm                  \
-object rme-guest,id=rme0,convert-in-place=on                 \
-machine virt,gic-version=3,confidential-guest-support=rme0   \
-m 2G -cpu host                                               \
-smp maxcpus=4,cpus=4,sockets=1,clusters=1,cores=2,threads=2  \
-object memory-backend-guest-memfd,id=mem0,size=2G,share=on   \
-numa node,nodeid=0,cpus=0-3,memdev=mem0                      \
-serial mon:stdio -monitor none -nographic -nodefaults        \
-kernel /mnt/linux/arch/arm64/boot/Image                      \
-initrd /mnt/buildroot/output/images/rootfs.cpio.xz           \
-append earlycon=pl011,mmio,0x10009000000
     :
qemu-system-aarch64: VM doesn't support Realms
qemu-system-aarch64: failed to initialize kvm: No such device


-#define KVM_CAP_PPC_COMPAT_CAPS 250
-#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 251
-#define KVM_CAP_ARM_RMI 252
+#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 250
+#define KVM_CAP_ARM_RMI 251

>   struct kvm_irq_routing_irqchip {
>   	__u32 irqchip;

Thanks,
Gavin


