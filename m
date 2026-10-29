Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859B606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dji0cnk5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMMbY-0005BS-Mw; Thu, 29 Oct 2026 05:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xMMbX-00059z-49
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 05:39:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xMMbU-0007Ab-9b
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 05:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793266763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NP1mCJbsBfz3usRjgejt3jLi18Bxq0SToQ4xn+dDBL8=;
 b=Dji0cnk5bjEyMpyYwUX63h+LtXhdMI0pTL32fNO40arBx5VKKA80F6W9niEJcS6VbGM4/h
 5VYNgpKU+VgA8pGahgPfhVuOozai543WTTjm63ho/HpgjhkI/XpBvb047oS0YgTyizM13U
 DUQzRDAM279X8zTCfUjl01WWoeOVE88=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-NYCt09KSMKC1Z7-uNDvwcQ-1; Thu, 29 Oct 2026 05:39:22 -0400
X-MC-Unique: NYCt09KSMKC1Z7-uNDvwcQ-1
X-Mimecast-MFC-AGG-ID: NYCt09KSMKC1Z7-uNDvwcQ_1793266761
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4a35e1d2dddso17780615e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 02:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793266761; x=1793871561;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NP1mCJbsBfz3usRjgejt3jLi18Bxq0SToQ4xn+dDBL8=;
 b=H6vNWjHKZAm8WrRoV8MqNMU28D4+h4l/QVhGz86zm1sn86wHvx5ZCGwD40F6hFQ4tl
 yNNNpqEa8Vd7ZS0m1bZcY8v1M3FNJVEIQmpvEAr24G/O5AKlZiE9RzrV+ruk2Pq65uf2
 nsfu9rdhwu/uCfNV/c0+233b4t5KVfIv1ZK54n3kjjw0xXsqeddIu3hRQV8rr9H9xPTy
 f9q0BMa94Vo+l5FiCuVlAj42pvu+do9oHc5vhxoT+Pcl6RVtYlXGwKUzwoj8VMKHw2Ty
 ITn3KyaS66TUqaU079dNik5+3BhlNESdno9zkjCaOsdQrwzJirxcdENmTQrO8Rfwqt7/
 JQlA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcEsSeEUJ1EtkCjQAitjR+wz0L5EW5johxlC4m2q7F2QCI9cMsCbwUaAgQZfQClfFD8C6/ku2Sdg==@nongnu.org
X-Gm-Message-State: AFq9FYKjxJeA3lAqEb1uUOlhe9bzEgFgig4clIe3fLFOSuJtVpJCYAcW
 9wiD9YPEpRLkeA5FVsBUKdPrOceTBojK5hoX5TnhX8hKzf/KnKarlo72BB/5EVZxkC2ptgdOrZW
 X+3AHy2Ok7cCC4N0g9Xlf3Q8zKPRnlgPyszW0GpP02w+FjxShA5ExJw==
X-Gm-Gg: AYBFou3BD2IsADpLocKP10denXv9xVRBE6Hl3cJeZZRJ+7wNv13aSKhcRn1iYwuCsPL
 3TAruA3spVzmvDKR7mV8dssn5oAwursYl39egFUgh2UdznSUAIyxnrlVrvNYIU7NcHVLPXKSZ75
 80aWxCcxQIASyWpY273fbx8eiB5hCsePIfGOFkN7dYavOR9i1LWlVhrFu3PWHmz9QeStpGIEKW7
 k+adGNsX4SE9sGi65IPewUhurtM7Eq4VwnNH/6PzJrlXzq6lPUNwprukXnIDa1UVLo1p8vEbXkz
 4y8A6kL5c3QkEip9mLXGCBS66dPaslmFj4NOp7zsTbof9wfnDgNnaLyEWt3RXPPX+qZVm2H+szS
 y7bO5jMNIbIQvezI3XcgUXLbB6qkmMqyjXA==
X-Received: by 2002:a05:600c:8b72:b0:4a6:eca1:7d5c with SMTP id
 5b1f17b1804b1-4a9676d428amr102875505e9.32.1793266761037; 
 Thu, 29 Oct 2026 02:39:21 -0700 (PDT)
X-Received: by 2002:a05:600c:8b72:b0:4a6:eca1:7d5c with SMTP id
 5b1f17b1804b1-4a9676d428amr102875155e9.32.1793266760710; 
 Thu, 29 Oct 2026 02:39:20 -0700 (PDT)
Received: from x1 ([151.41.153.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80286fc6sm60137785e9.15.2026.10.29.02.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 02:39:20 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:39:16 +0100
From: Gustavo Romero <gromero@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn,
 harshpb@linux.ibm.com, 
 amachhiw@linux.ibm.com, daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, 
 farman@linux.ibm.com, cohuck@redhat.com, armbru@redhat.com, mbawa@redhat.com
Subject: Re: [PATCH for-11.2 6/9] target/arm/kvm: Pass an error handle to
 kvm_arm_init_cpreg_list
Message-ID: <7olgxurssdwq4g2r3tfmshmjerynxk5in7j6uwusepsfz5y467@myddnvnmhl2b>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-7-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029092307.281287-7-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nf0dHq5IRFdoX-eOAsx_cYIPPvEBMCiYAaX7VUdsmvE_1793266761
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Oct 29, 2026 at 10:20:18AM +0100, Eric Auger wrote:
> Pass an error handle to kvm_arm_init_cpreg_list(). A Subsequent patch
> will do the same with kvm_arch_init_vcpu().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 28f199c03f..d454346037 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -872,6 +872,7 @@ static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
>  /**
>   * kvm_arm_init_cpreg_list:
>   * @cpu: ARMCPU
> + * @errp: Error handle
>   *
>   * Initialize the ARMCPU cpreg list according to the kernel's
>   * definition of what CPU registers it knows about (and throw away
> @@ -879,7 +880,7 @@ static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
>   *
>   * Returns: 0 if success, else < 0 error code
>   */
> -static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
> +static int kvm_arm_init_cpreg_list(ARMCPU *cpu, Error **errp)
>  {
>      struct kvm_reg_list rl;
>      struct kvm_reg_list *rlp;
> @@ -889,12 +890,17 @@ static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>      rl.n = 0;
>      ret = kvm_vcpu_ioctl(cs, KVM_GET_REG_LIST, &rl);
>      if (ret != -E2BIG) {
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "failed to get KVM register list size");
> +        }
>          return ret;
>      }
>      rlp = g_malloc(sizeof(struct kvm_reg_list) + rl.n * sizeof(uint64_t));
>      rlp->n = rl.n;
>      ret = kvm_vcpu_ioctl(cs, KVM_GET_REG_LIST, rlp);
>      if (ret) {
> +        error_setg_errno(errp, -ret, "failed to get KVM register list");
>          goto out;
>      }
>      /* Sort the list we get back from the kernel, since cpreg_tuples
> @@ -911,7 +917,7 @@ static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>          case KVM_REG_SIZE_U64:
>              break;
>          default:
> -            fprintf(stderr, "Can't handle size of register in kernel list\n");
> +            error_setg(errp, "Can't handle size of register in kernel list");
>              ret = -EINVAL;
>              goto out;
>          }
> @@ -937,7 +943,7 @@ static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>          /* Shouldn't happen unless kernel is inconsistent about
>           * what registers exist.
>           */
> -        fprintf(stderr, "Initial read of kernel register state failed\n");
> +        error_setg(errp, "Initial read of kernel register state failed");
>          ret = -EINVAL;
>          goto out;
>      }
> @@ -2015,6 +2021,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      uint64_t mpidr;
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> +    Error *local_err = NULL;
>      uint64_t psciver;
>  
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE) {
> @@ -2113,7 +2120,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      SET_IDREG(&cpu->isar, MPIDR, mpidr);
>      cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>  
> -    return kvm_arm_init_cpreg_list(cpu);
> +    ret = kvm_arm_init_cpreg_list(cpu, &local_err);
> +    if (ret < 0) {
> +        error_report_err(local_err);
> +    }
> +    return ret;
>  }
>  
>  int kvm_arch_destroy_vcpu(CPUState *cs)
> -- 
> 2.53.0
> 
> 

Reviewed-by: Gustavo Romero <gromero@redhat.com>


Cheers,
Gustavo


