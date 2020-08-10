Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5116189lfy;
        Mon, 10 Aug 2020 03:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3ZgkkYxY3dTtwJmjJ80DJ1/EyWOFkpm7+nOZ4IGD68P3ntf8DNopFUt8LDYa3UuG7l5rO
X-Received: by 2002:a5b:992:: with SMTP id c18mr29073164ybq.110.1597056739988;
        Mon, 10 Aug 2020 03:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597056739; cv=none;
        d=google.com; s=arc-20160816;
        b=GTb33zW2b8Llm5x3UwYxGTEsvF5rv9Rr3yQ8eakqLYUZhtkpvpPoIRwUsrzwxn9tg8
         T6CNFyrRPNPOr19HgZKFbJmHfTtJETIGuef7T5sdNIkoeZ9pBqu6xOf+vCjmYOhcQ3Lk
         No4s2I41Zcqr7GuLMUUEGvz8fWZdp2Tr96HB9TvVgqFvunCh3WlAESSemVVpW7vNtRzB
         TPAy7pJOgSX2SXtQUvJYg8u/Q1+m0yk6Ai772rZFNuLjC3L51rRIXzoOT8aPSJ2PxxHi
         3PwJXhEQOmWcOjjkrdz/BuyyjG+2gsn04yj1ce7dKGaPAd/wAe98wGN158WKlagSQEpw
         zTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=emH8zSqV+iMF9EtZQBoOI36LI5z8+3a9ejx4ha9QdwA=;
        b=xtDvhip5L2TMR5YhExV4LoGpdRpl0Ry8ZPFOeADUcHr8iZrS4EVDh3beXVR+TNQpGb
         SWxMG4LvOreIw5P6A1AzeEsW4fglfUCDgJ6fN1a/TJpfY6uQSaEYdwLeUJu3dV0vBUX7
         CVOOLUcGNRSpXtu+Yta5Pb7Qz95frE1yiEUsUtZBxbyd9f6iCUjkAZPT2SrFvTrqLTH3
         bpCcNiR1y7z+7tYDMqkRBDhb5271fuzyFYCuilAd0rjqXIANFtWuVXucfWgQROvSH5GL
         GSOjKXRsX5TLbIbSBoU0QXkqOMNA1FyihNCUHJxS2kr4bOFCYowshaPIJp0xX0g24Mry
         5nOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LkuIwq8F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si11274207ybk.483.2020.08.10.03.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 03:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LkuIwq8F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k55Pf-00029p-9h
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 06:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k55OW-0000sV-Rw
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 06:51:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57383
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k55OU-000514-TY
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 06:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597056665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=emH8zSqV+iMF9EtZQBoOI36LI5z8+3a9ejx4ha9QdwA=;
 b=LkuIwq8FVsN2EkMSu4uru12Gk/AMW0csDdpHDrq3DG6ZpwEw5ffYh3Qjgz0LVNeJEEn4sa
 a1rWJ2uYM73dZAopPSgyjWMQEIgZENejFVPtAHsleHBLtzqX0LgTJowOWXPHAJk6ykae8I
 x5T+6inYjfXw2qSoktpXO5t9DlvQDlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-F_4v-QgENlWxzpRctLTwaA-1; Mon, 10 Aug 2020 06:51:02 -0400
X-MC-Unique: F_4v-QgENlWxzpRctLTwaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A62A19067F0;
 Mon, 10 Aug 2020 10:51:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CF619C71;
 Mon, 10 Aug 2020 10:50:59 +0000 (UTC)
Date: Mon, 10 Aug 2020 12:50:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH 3/7] target/arm/cpu: spe: Add an option to turn on/off
 vSPE support
Message-ID: <20200810105056.v33r35x6rex2ywdj@kamzik.brq.redhat.com>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:29:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jCWndLZfYGuT

On Fri, Aug 07, 2020 at 08:10:33AM +0000, Haibo Xu wrote:
> Adds a spe=[on/off] option to enable/disable vSPE support in
> guest vCPU. Note this option is only available for "-cpu host"
> with KVM mode, and default value is on. 
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c | 28 ++++++++++++++++++++++++++++
>  target/arm/cpu.h |  3 +++ 
>  2 files changed, 31 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 111579554f..40768b4d19 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1122,6 +1122,29 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
>      cpu->has_pmu = value;
>  }
>  
> +static bool arm_get_spe(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return cpu->has_spe;
> +}
> +
> +static void arm_set_spe(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (value) {
> +        if (kvm_enabled() && !kvm_arm_spe_supported()) {
> +            error_setg(errp, "'spe' feature not supported by KVM on this host");
> +            return;
> +        }
> +        set_feature(&cpu->env, ARM_FEATURE_SPE);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_SPE);

See below, we should be using ID register bits instead.

> +    }
> +    cpu->has_spe = value;
> +}
> +
>  unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
>  {
>      /*
> @@ -1195,6 +1218,11 @@ void arm_cpu_post_init(Object *obj)
>          object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
>      }
> 
> +    if (arm_feature(&cpu->env, ARM_FEATURE_SPE)) {
> +        cpu->has_spe = true;
> +        object_property_add_bool(obj, "spe", arm_get_spe, arm_set_spe);

The property should be available even when the host doesn't support the
feature. How else can one migrate from a host where the feature is
available, but disabled, to a host that doesn't support the feature?

> +    }
> +
>      /*
>       * Allow user to turn off VFP and Neon support, but only for TCG --
>       * KVM does not currently allow us to lie to the guest about its
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9e8ed423ea..fe0ac14386 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -822,6 +822,8 @@ struct ARMCPU {
>      bool has_el3;
>      /* CPU has PMU (Performance Monitor Unit) */
>      bool has_pmu;
> +    /* CPU has SPE (Statistical Profiling Extension) */
> +    bool has_spe;
>      /* CPU has VFP */
>      bool has_vfp;
>      /* CPU has Neon */
> @@ -1959,6 +1961,7 @@ enum arm_features {
>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> +    ARM_FEATURE_SPE, /* has SPE support */

We shouldn't need to add this feature bit. SPE should have an ID register
bit to use instead.

>  };
> 
>  static inline int arm_feature(CPUARMState *env, int feature)
> -- 
> 2.17.1
> 
>

Thanks,
drew 

