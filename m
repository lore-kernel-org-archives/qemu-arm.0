Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C8606A31D
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=amdpKRSf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMMb4-0004ue-77; Thu, 29 Oct 2026 05:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xMMb0-0004sD-WA
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 05:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xMMay-00076U-NS
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 05:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793266730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0E+nBUT05eTM3l1EiviXbl6+Mza2XfiLiD9Gk2HdqHo=;
 b=amdpKRSfhKaIuKYqzO3ijOhmr0hlm7PSAXONKUUttaLE6i6V1yZtPUOb7K6D/PDeTF/GMA
 hAbbFayzrPtVw205nsr2XbwbJS/BoYFAF03xLsF3h6i7te+NrX1SDSgytav/AdorHAycjw
 54JKKSK3fRtVwLiCsFylr5SetQj1nv0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-W837a-czMSORXNL07neoYA-1; Thu, 29 Oct 2026 05:38:49 -0400
X-MC-Unique: W837a-czMSORXNL07neoYA-1
X-Mimecast-MFC-AGG-ID: W837a-czMSORXNL07neoYA_1793266728
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a009f82bedso13677645e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 02:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793266728; x=1793871528;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0E+nBUT05eTM3l1EiviXbl6+Mza2XfiLiD9Gk2HdqHo=;
 b=dcDEoY/ioOmdU7B09DSl83h2wtvtHIPPpjru0gaOvnoQfnypCs3bLvKW4IahQYibdW
 l7UECSg5lHfa9NKDIKV7DqWNXoIVmbX03+Av+77jBCsHA1is/pOwO6oZoWGNCFo9Pwn2
 VHtVXOQE90cIRJP9NUXWVWqG3Jx9/nZSNdQDkzgXial5+qINvBg88mt3RT7nlQt5aT4s
 eh3ucN7OoOsKttoEmtWQ5izFdvKi3r1wKYHOYWkiAhH+BFQjB6v406JLF0lMXDOGBa2N
 dKAcaQnvEa6s2pbll4v6vMCi2Be3U4vc+AeHYA261ww7EQsO4Q+jCqGyTFDeDoEplite
 LZTw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqoxXh9Kqd8KeLU0cV82m02zx+NQ7/MpIMuLjIDXrqRAAgK50mZA0BnfM3KulAfMjZ1YkFdc15Ng==@nongnu.org
X-Gm-Message-State: AFq9FYLwqUYGSkBlEnovRFMEtBBPemPoqGxOupCgQx83BOZCZtTWTCC5
 vv37x6ko73+UNAlOSsqVqBmijbooR6kbxM9QR3A1ZWlc3pkVtZj0Xdd5AHzMmwIfngO1aOjLbny
 KCWoBSf71ceApW7xP98Q6I5P6Dbg734FwZLm9h2Dg1GZRUFL+2/UUAA==
X-Gm-Gg: AYBFou2SS9wRUg2QPtYlEzKhEEqDGTU9La3emXFXbOKSwtdSUVdRp5d1o15NAGaJgZC
 BCv5JQ/OrmxctOnp/NbwSj74CUw+LLm0tC1Ki/OBF9gnbcpn1d4I4njxXevE9tTx6VBiOl0HpXq
 6McBeHIXNEhiMrf8KUD6Sfd+rKJj9C3ih4/+SsYL9Wec2X/X7xYTwTJVwnLTeCZHAGcgYtjwY1M
 copXq0JiI3lI2q4ETGFDDzBr6cOWS+5s88+qqhxhwIoiX8PC/pV15+SNirxCCj7fHvKUdtubEcB
 nhGkDV/d0RlfNsne0NXbOYQKQ5N/2HgIRG+Z0c8l9U1M2OEbpTe/3RAlsYG9CDck0Oh8ULxtp3p
 rlhx71HwDEojW189QstQ5yApSFFdPzMQoeQ==
X-Received: by 2002:a05:600c:530d:b0:49e:7c8c:361d with SMTP id
 5b1f17b1804b1-4a966774cbemr103020635e9.22.1793266728073; 
 Thu, 29 Oct 2026 02:38:48 -0700 (PDT)
X-Received: by 2002:a05:600c:530d:b0:49e:7c8c:361d with SMTP id
 5b1f17b1804b1-4a966774cbemr103020065e9.22.1793266727697; 
 Thu, 29 Oct 2026 02:38:47 -0700 (PDT)
Received: from x1 ([151.41.153.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3c5bsm33929868f8f.9.2026.10.29.02.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 02:38:47 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:38:44 +0100
From: Gustavo Romero <gromero@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn,
 harshpb@linux.ibm.com, 
 amachhiw@linux.ibm.com, daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, 
 farman@linux.ibm.com, cohuck@redhat.com, armbru@redhat.com, mbawa@redhat.com
Subject: Re: [PATCH for-11.2 5/9] target/arm/kvm: Pass an error handle to
 kvm_arm_create_scratch_host_vcpu
Message-ID: <4kr6kbmss3hfgrqngrahqbhk52cfr4kb2b5igvpknn3whbtfwr@anbbss4xhs6b>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-6-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029092307.281287-6-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wq-QYWw_cbVPwWKtscyV2sXQeM6OgOQHhCeRi6TLSZc_1793266728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Eric,

On Thu, Oct 29, 2026 at 10:20:17AM +0100, Eric Auger wrote:
> This allows to report a precise error message if any error occurs.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm_arm.h |  3 ++-
>  target/arm/kvm.c     | 15 ++++++++++++---
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index e7c40fb003..9c7e7f654a 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -105,6 +105,7 @@ struct kvm_vcpu_init;
>   * @init: filled in with the necessary values for creating a host
>   * vcpu. If NULL is provided, will not init the vCPU (though the cpufd
>   * will still be set up).
> + * @errp: Error handle
>   *
>   * Create a scratch vcpu in its own VM of the type preferred by the host
>   * kernel (as would be used for '-cpu host'), for purposes of probing it
> @@ -114,7 +115,7 @@ struct kvm_vcpu_init;
>   * false on failure (and fdarray and init are not valid).
>   */
>  bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
> -                                      struct kvm_vcpu_init *init);
> +                                      struct kvm_vcpu_init *init, Error **errp);
>  
>  /**
>   * kvm_arm_destroy_scratch_host_vcpu:
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 724bc08edf..28f199c03f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -104,13 +104,14 @@ static int kvm_arm_vcpu_finalize(ARMCPU *cpu, int feature)
>  }
>  
>  bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
> -                                      struct kvm_vcpu_init *init)
> +                                      struct kvm_vcpu_init *init, Error **errp)
>  {
>      int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
>      int max_vm_pa_size;
>  
>      kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
>      if (kvmfd < 0) {
> +        error_setg(errp, "Failed opening /dev/kvm");
>          goto err;
>      }
>      max_vm_pa_size = ioctl(kvmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE);
> @@ -121,6 +122,7 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>          vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
>      } while (vmfd == -1 && errno == EINTR);
>      if (vmfd < 0) {
> +        error_setg(errp, "Failed creating the scratch VM");
>          goto err;
>      }
>  
> @@ -140,6 +142,7 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>  
>      cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>      if (cpufd < 0) {
> +        error_setg(errp, "Failed creating the scratch VCPU");
>          goto err;
>      }
>  
> @@ -153,12 +156,14 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
>  
>          ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
>          if (ret < 0) {
> +            error_setg(errp, "Failed getting the preferred target");
>              goto err;
>          }
>          init->target = preferred.target;
>      }
>      ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
>      if (ret < 0) {
> +        error_setg(errp, "Failed the init of the scratch vcpu");
>          goto err;
>      }
>  
> @@ -324,6 +329,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      bool el2_supported;
>      bool pmu_supported = false;
>      uint64_t features = 0;
> +    Error *local_err = NULL;
>      int err;
>  
>      ahcf->target = QEMU_KVM_ARM_TARGET_NONE;
> @@ -371,7 +377,8 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          features |= 1ULL << ARM_FEATURE_PMU;
>      }
>  
> -    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init, &local_err)) {
> +        error_report_err(local_err);
>          return;
>      }
>  
> @@ -2653,8 +2660,10 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
>  void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
>  {
>      int fdarray[3];
> +    Error *local_err = NULL;
>  
> -    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL, &local_err)) {
> +        error_report_err(local_err);
>          return;
>      }
>  
> -- 
> 2.53.0
> 
> 

Reviewed-by: Gustavo Romero <gromero@redhat.com>


Cheers,
Gustavo


