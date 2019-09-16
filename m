Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4193358wrp;
        Mon, 16 Sep 2019 09:09:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzV/2b3v7KqG/92ODuiDqspgjDwt05xtgpWr9O9cTzYyO7K95Dofo25Rec6dohMn04FZVAn
X-Received: by 2002:a50:ccd3:: with SMTP id b19mr7911edj.257.1568650179140;
        Mon, 16 Sep 2019 09:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568650179; cv=none;
        d=google.com; s=arc-20160816;
        b=OWTVbsds7VehxT13fFO1Nu4K0YcMnHOTwBZwxJTMiyRVSBDAZT9wMWwMwYDFpmN44s
         pIh2wexwUnaoUjs0xuMjjoWu7Ul0kQbUGBmLZYws1/fOKFQ1sxQzZgh2Qinr0a+6rdWt
         smsWVggZ/mspjIws7xWpieu9xFidMKgPjKKMShv7xPA7ubp+awZNgw+z3kWdmTuQCDHX
         fx3DpCmiolkYPJqmlks0NQUdz8GtKgEVaG1CBXqyPRZCZS3h8+kRbcOpVKVH70jkbzZ6
         CoaAPRnbjL/bVM4N7/9cVgJ4TbPy7YMvNCIwapvZK9za6bJPHdHWDAozN+gYvVEFlFx+
         4F/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=uhDhPfEOl+NTYIAkxoiBzfyFaA4CWvlT+7jOYAB5Cmw=;
        b=Iwa6IKwfUTUFK4kQjTxtUkRu5Oop3ayUEB+iaCuNXXLH5zWoCbtRBzzSodikuT5n1q
         W0OywnKLDrfBew2lNLRVQSiQQFpSwBnjsm8HdukPYYr2k5sh3p4A0hSSZAtATNymKs7M
         vFa1LQqCVCuM4zD2ftijp7AfVVor3AM3DTAGA9jV3eyVHVrfmqckNDmo9vvIwSnWWwBz
         OHjxit9orQNmgD4OdsWVkMF7T10mAdO0JgAQGnc22MdV1LxoU+Nua71y+t2QcpI/oNIU
         O96gaD7NGSwOpx+IFiESnRG6sdhVvaxknC36Mx8hMrcMxa50iCmMYubywbFJMHBSeF8N
         MiJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si4355606edo.143.2019.09.16.09.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 09:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9tYH-0001dU-T3
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 12:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1i9sMn-0006XF-3E
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 10:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1i9sMl-0002sy-Re
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 10:52:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1i9sMl-0002sp-Lx; Mon, 16 Sep 2019 10:52:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E9104307D8B9;
 Mon, 16 Sep 2019 14:52:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A21600F8;
 Mon, 16 Sep 2019 14:52:30 +0000 (UTC)
Date: Mon, 16 Sep 2019 16:52:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190916145228.bn7g6bdyntro7zxi@kamzik.brq.redhat.com>
References: <20190913095639.25447-1-eric.auger@redhat.com>
 <20190913095639.25447-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913095639.25447-4-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 16 Sep 2019 14:52:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 3/3] ARM: KVM: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fb1RmbTPrrL+

On Fri, Sep 13, 2019 at 11:56:39AM +0200, Eric Auger wrote:
> Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=512
> for ARM. The actual capability to instantiate more than 256 vcpus
> was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
> vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
> a single KVM IO device instead of 2.
> 
> So let's check this capability when attempting to use more than 256
> vcpus within any ARM kvm accelerated machine.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - Implement the check in kvm_arch_init as suggested by Peter
> ---
>  target/arm/kvm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b10581fa06..b473c63edb 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -182,6 +182,7 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>  
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
> +    int ret = 0;
>      /* For ARM interrupt delivery is always asynchronous,
>       * whether we are using an in-kernel VGIC or not.
>       */
> @@ -195,7 +196,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>  
>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>  
> -    return 0;
> +    if (ms->smp.cpus > 256 &&
> +        !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
> +        error_report("Using more than 256 vcpus requires a host kernel "
> +                     "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
> +        ret = -EINVAL;
> +    }
> +
> +    return ret;
>  }
>  
>  unsigned long kvm_arch_vcpu_id(CPUState *cpu)
> -- 
> 2.20.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
