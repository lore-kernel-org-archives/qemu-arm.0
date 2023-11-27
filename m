Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp747460ejt;
        Sun, 26 Nov 2023 20:12:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtM1pvEo2IMbmhiJcjXEUJKam5tLdr0SUXhOyuqXKjRsdsHsVSc32ho52v+o4tBoY70Y+A
X-Received: by 2002:a05:622a:5106:b0:423:aa14:ea51 with SMTP id ev6-20020a05622a510600b00423aa14ea51mr7785749qtb.68.1701058348294;
        Sun, 26 Nov 2023 20:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701058348; cv=none;
        d=google.com; s=arc-20160816;
        b=j7bo6i2OJC5FqR2wvzThcL+IKqmSsj/n5jkvOGVqTKo06sV8w46oDhdUjQdSY049Bi
         tA7nG9PHgP/7ONwe4nkH1p8wdS0FXIpU3J/IlMhMfDJkNCcmT/FwLAG2A77IQREeEx6z
         LxApiU9BvVpcvdvOcCb2xDA+fvr47YanbKURjDGIWnbrTJqlWbrERtrNaV3FwGiRhzW/
         85ZZwxFQdrpotY2ru+BfCKyVMnqm7gJy7tDhbMc76+6BPMoeipnFqhlpi4KrIkxm7Mxs
         hSEGsKSzo8YwYHdqmnYl+yF8h1rEBWzmKoJIgsVuZ7pSFNyRPsYCFCNNefEqHnbHOoVz
         SBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=67A6reGph7OBDqrRqdMlH2sW1EYf0zn15yqP5FYtCnU=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=Fm5fXjADUwpXIWi7VjbyIc4nh7TBW72zEinAcxu0xOU39DlEiRQSnRXx0uYHJnitqI
         xdDCvtYBI2ulji7cRDITuBQZ3XWlARIxGxeYK8Ky+S3Wo8GtjJc/DGMsbS+DqaQmVnp7
         N8QOzRii4A+xbPyh4sc63fBSfc9dBCGadfbBn5+4gZY3BCzzoJBhZ8ruCv9o58ChA6lf
         aey+DGpqARSJdfjnurFbVWGNcO/C72IauAui5EYDpSV8sPz5cs8nU80+MiX3P/uP2JrF
         rvTTKbxc+F0sDHWQmUX0XKPnZ902TEakmGHcsOso+EYhxPNQLfI07p/P2LXSroC7fCUo
         qMxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuWK7e5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05622a119500b00423b49a1487si2794863qtk.670.2023.11.26.20.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 20:12:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuWK7e5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7Syr-0004nu-Uu; Sun, 26 Nov 2023 23:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Syq-0004nY-HE
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 23:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Syo-0005jw-SE
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 23:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701058337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67A6reGph7OBDqrRqdMlH2sW1EYf0zn15yqP5FYtCnU=;
 b=KuWK7e5xB2na2kL7p5VoAOqZ87YoruiQ/BfeuMqTpR//mYIzC54ZcorCFwpCK3pgIhHXWQ
 QY9IopiKEuGuwSvKWgJ4GkdEFb73iLPilbkb28XOy6RK1nf73hsBY/1yj85MD6dwyooKLg
 0IKrwD2jTBsEmkZvhHcCjHj9AdCNEu4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-cvXf2loHN-OPfXjDfLf-AQ-1; Sun, 26 Nov 2023 23:12:15 -0500
X-MC-Unique: cvXf2loHN-OPfXjDfLf-AQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-5c19a2f606dso3711440a12.3
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 20:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701058334; x=1701663134;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67A6reGph7OBDqrRqdMlH2sW1EYf0zn15yqP5FYtCnU=;
 b=fhcrQ0r4dM2dCqhd9LBc7s1QD8SHOqsZbZq/h15G6nBKGjSm+S55cwUzY7aubw2mP7
 lYZSnglC4Jl9O7U2pDMN6MSOU8IeYAKDqBCUsiQhGqBcZLoj8bMey7vjV1crtENrASJ5
 QhNCwegBrIq29xuUwMchEGR7ADOFq6Gid5j9Qdyu9RScGeZtvzQY4CIw1wUadY5d8hh1
 pReyW3NLwO0G3XZ92QYMRzVjPaVTyYLQ4zn2vDMCEu4SckwvyR0rnla9/8Evm1d0UMr2
 9huxbgLQndDLnrmwW2NJai3/c9ShVcOnGbBxCef3xOZ4I4sSuoE1NqV6QP+KgtTH83Hg
 Bf8w==
X-Gm-Message-State: AOJu0YyMZQT3jlRdfhQmDj42Ng/0GD9pK1OEq18me8B70vKqekUl9O7C
 y0QmNmCRN+z3z4Ma1xWXW3Dku6fLf78cfFhB7+NDV/GeqKUKm6pHRGxsM08jQu5xcc0DxtagbYY
 QFRjQ3tN5PFo1
X-Received: by 2002:a05:6a20:7d89:b0:189:b618:1736 with SMTP id
 v9-20020a056a207d8900b00189b6181736mr12382810pzj.57.1701058334715; 
 Sun, 26 Nov 2023 20:12:14 -0800 (PST)
X-Received: by 2002:a05:6a20:7d89:b0:189:b618:1736 with SMTP id
 v9-20020a056a207d8900b00189b6181736mr12382802pzj.57.1701058334453; 
 Sun, 26 Nov 2023 20:12:14 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ee8900b001ca86a9caccsm7173261pld.228.2023.11.26.20.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 20:12:14 -0800 (PST)
Message-ID: <54a38178-18ca-4bea-9d5d-af34114dda5b@redhat.com>
Date: Mon, 27 Nov 2023 15:12:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 05/16] target/arm/kvm: Have kvm_arm_sve_get_vls
 take a ARMCPU argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-6-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6Iw7ZwpsZLIS

Hi Phil,

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm_arm.h | 6 +++---
>   target/arm/cpu64.c   | 2 +-
>   target/arm/kvm.c     | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 6fb8a5f67e..84f87f5ed7 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -129,13 +129,13 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
>   
>   /**
>    * kvm_arm_sve_get_vls:
> - * @cs: CPUState
> + * @cpu: ARMCPU
>    *
>    * Get all the SVE vector lengths supported by the KVM host, setting
>    * the bits corresponding to their length in quadwords minus one
>    * (vq - 1) up to ARM_MAX_VQ.  Return the resulting map.
>    */
> -uint32_t kvm_arm_sve_get_vls(CPUState *cs);
> +uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu);
>   

Either @cs or @cpu isn't dereferenced in kvm_arm_sve_get_vls(). So I guess
the argument can be simply droped?

>   /**
>    * kvm_arm_set_cpu_features_from_host:
> @@ -278,7 +278,7 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
>       g_assert_not_reached();
>   }
>   
> -static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
> +static inline uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
>   {
>       g_assert_not_reached();
>   }
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1e9c6c85ae..8e30a7993e 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -66,7 +66,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>        */
>       if (kvm_enabled()) {
>           if (kvm_arm_sve_supported()) {
> -            cpu->sve_vq.supported = kvm_arm_sve_get_vls(CPU(cpu));
> +            cpu->sve_vq.supported = kvm_arm_sve_get_vls(cpu);
>               vq_supported = cpu->sve_vq.supported;
>           } else {
>               assert(!cpu_isar_feature(aa64_sve, cpu));
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 71833a845a..766a077bcf 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1803,7 +1803,7 @@ bool kvm_arm_sve_supported(void)
>   
>   QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>   
> -uint32_t kvm_arm_sve_get_vls(CPUState *cs)
> +uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
>   {
>       /* Only call this function if kvm_arm_sve_supported() returns true. */
>       static uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];

Thanks,
Gavin

