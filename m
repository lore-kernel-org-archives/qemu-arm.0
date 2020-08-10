Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5133791lfy;
        Mon, 10 Aug 2020 04:17:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF2uGbrYbpGB0xFaJq2Z891xf+JNpFb4MOFj3MfzIJk+nJJN/nSqLqYzXMhevPi7K1nkJn
X-Received: by 2002:a25:dd84:: with SMTP id u126mr44386961ybg.269.1597058224906;
        Mon, 10 Aug 2020 04:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597058224; cv=none;
        d=google.com; s=arc-20160816;
        b=vPoFzYZbLot5drbpvVRCblcHV3eq7un6mRDJs0a8103Cy3Np9Zvte878Gj7OWbTKAN
         sF6NOms6GAzgSqLyLi76Z2Oy5+wjPu/p7uVHZ4W6MBrrNFx5f/c45laUeeMJZW1tEVhk
         E4bGPXyV90/hYioKX8U2D7u4LSEufN9+er8B14gbwcCXApAloSOkNSWEwH+6fVeGxJMB
         IoM6sN0zk4NWEISES1tqUip/wRDlaQ3iwNopzIxeycNphqd4wziD8tXxb5hxRG7DsCpx
         GH1y/tjHVtWgpjDIafZA8dNlULSimEpQddLTg58x74Ks85mF1D1kARwfdMooZZfceSXj
         HvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=tScTnjEVuwphYxuVRll+V25t9nbMWdIDFdXtVpdbdQA=;
        b=ZB6anZBX+1n06MTksvvGafGfCof+KqDEJdwBxZ3zs1184pWgAv+AfxDjT5TkXHe+Lo
         +bVLZwDkkQWKX2AhG8nCiMX1vO1kyz/qXy9OyL/rpWMMuN3xfYf/wlosbL5u1IWZizTG
         pShl9MzSDSk2sq+U/Dy8193kO/r/OsPds//9J9o/gbLFmrT0W4TOwO/LZadbOz7tGG9d
         dYpwhZldoLSNYSO2C01xsIX2x1caAbMym7Ui4tt1+wrQ622Y1BJb02B/fI59Z/Kofpyz
         k0TPQOi+PWcbKew2Zr+Lu8X1gt3k2UQ4ZnzgM7aqorQST9dqRkcZJPaZJGuPqKu7jeAU
         6mzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TzJD50gJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x190si16725242ybg.38.2020.08.10.04.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 04:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TzJD50gJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k55nc-00064I-AK
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 07:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k55nO-000613-QG
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 07:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k55nN-0000HK-5B
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 07:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597058208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tScTnjEVuwphYxuVRll+V25t9nbMWdIDFdXtVpdbdQA=;
 b=TzJD50gJ7QsONSCA5C5abEreQdhK/ohwULobS8NZYA9HH2cdB97RUwI5qa+e/MVLgVAcGj
 DmBz6WMSnFqG6ok/OWmvZTcAKn/uYC2KPmP0VCJgWXnSdHJ4k8eKM8MmJSuK7skeu1XD5+
 JM2lrzvDbRs5/w5uBzWWep+lP/6062s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-l76WE3qCOv-ls7EFM_uDSg-1; Mon, 10 Aug 2020 07:16:46 -0400
X-MC-Unique: l76WE3qCOv-ls7EFM_uDSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19BD3800477;
 Mon, 10 Aug 2020 11:16:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EBE48BD9E;
 Mon, 10 Aug 2020 11:16:43 +0000 (UTC)
Date: Mon, 10 Aug 2020 13:16:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH 7/7] target/arm/cpu: spe: Enable spe to work with host cpu
Message-ID: <20200810111640.ykejphmuyirncjwv@kamzik.brq.redhat.com>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 05:35:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksrGBMBdpJaP

On Fri, Aug 07, 2020 at 08:10:37AM +0000, Haibo Xu wrote:
> Turn on the spe cpu property by default when working with host
> cpu type in KVM mode, i.e. we can now do '-cpu host' to add the 
> vSPE, and '-cpu host,spe=off' to remove it. 

-cpu max with KVM should also enable it by default

> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   | 4 ++++
>  target/arm/kvm64.c | 9 +++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 67ab0089fd..42fa99953c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1719,6 +1719,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->pmceid1 = 0;
>      }   
>  
> +    if (!cpu->has_spe || !kvm_enabled()) {
> +        unset_feature(env, ARM_FEATURE_SPE);
> +    }

I don't think this should be necessary.

> +
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
>          /* Disable the hypervisor feature bits in the processor feature
>           * registers if we don't have EL2. These are id_pfr1[15:12] and
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index be045ccc5f..4ea58afc1d 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -679,6 +679,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      features |= 1ULL << ARM_FEATURE_AARCH64;
>      features |= 1ULL << ARM_FEATURE_PMU;
>      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
> +    features |= 1ULL << ARM_FEATURE_SPE;

No, SPE is not a feature we assume is present in v8.0 CPUs.

> 
>      ahcf->features = features;
> 
> @@ -826,6 +827,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      } else {
>          env->features &= ~(1ULL << ARM_FEATURE_PMU);
>      }
> +    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SPE_V1)) {
> +        cpu->has_spe = false;
> +    }
> +    if (cpu->has_spe) {
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
> +    } else {
> +        env->features &= ~(1ULL << ARM_FEATURE_SPE);
> +    }

The PMU code above this isn't a good pattern to copy. The SVE code below
is better. SVE uses an ID bit and doesn't do the redundant KVM cap check.
It'd be nice to cleanup the PMU code (with a separate patch) and then add
SPE in a better way.

>      if (cpu_isar_feature(aa64_sve, cpu)) {
>          assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> -- 
> 2.17.1
> 

Thanks,
drew

