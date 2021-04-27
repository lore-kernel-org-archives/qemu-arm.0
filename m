Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4573122lfb;
        Tue, 27 Apr 2021 01:27:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNN6nIUHbpkFhgmzwcqyhCdnKf2SglK30mtH/Typ2TYOFVXWn0LN2uqltH1E0Hg7FnloEG
X-Received: by 2002:a25:3c1:: with SMTP id 184mr22489838ybd.76.1619512051601;
        Tue, 27 Apr 2021 01:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619512051; cv=none;
        d=google.com; s=arc-20160816;
        b=AzuZqN/ut3LKLZUWc1kFcV8QQ3sMWKichRC9iyPbWw8bAVWax5yf/6N+z1zHJK4LJm
         VYLUU35d2ZRfrSY8ODw+DM5bVxTwqOXFBoo6lW8pFkoQSOf/ujTAFlxoM/GUAGXULlTe
         rxduQTsW/lw2yeO7G86irBbpEhh9LWGRkQQQfGdYmg/v75tRcMM7amhCYezkx3N95v9o
         8+744USNFvaU5jMFq/kCiJqFa3fCfbryFDaA39GE6aX7tWebXkcMISBG1XrRXYt0fPmL
         2/8f6eFTe2tn5+QHWSRl7mFsqCzBVZwXMZjelBIzzQoRWUmi/cm91ELuwOxa8QqUBfkU
         hvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=h02zWZVZ0wy/MS60LG8WdzUDH1c3ZTHhixBtflejkCU=;
        b=y4Rae5Yr5c3h2qr0UmGLfZHIfEtKi/56/hr2wAdTTUeayqoFcc98KVT5Im6g8NXnVh
         Ki+2XwUQermyYsgf9IkZlkDbg4/cbv9eE3rU3byAN6EVD01aqnHMaHJBETHBcKqE3J2I
         CkUzqL/aUBo7Eo9dPaxR4Kn+hXbIn7qfHmvq0J73w2om2aL77rPcVG6P+AmF3XrL9YUD
         LurQ18czwSv2w1b+4it3L6eaEKNx1gLLPRDMEO/EPvZdl0ioCdN10tJ6zdoIsXc8N6Q0
         KLQ9mE67FwSnsalVRDKac9w0lQOwQ1dIymBf/OfvYq2kGwgDwDzGjMh/FnA0N36QyKqz
         MU5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TFKnv/vj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si20094958ybc.315.2021.04.27.01.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 01:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TFKnv/vj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbJ46-0005OE-Vk
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 04:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJ3s-0005Kd-Va
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 04:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJ3q-0001WD-Mq
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 04:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h02zWZVZ0wy/MS60LG8WdzUDH1c3ZTHhixBtflejkCU=;
 b=TFKnv/vjD/nN0u3HG+NHmD4SphMXbKrFn/BgTecf4wLBtz0Sgo8GE9TiJtGGEsAM9UIbXA
 De07poRQflrt6UizS9R0KACbZKupKcSoBAwi/8kBDDq7wrNqprEb1qQDEG2580wXLAJg0s
 ACWVD0pnd8d2bg4teMOTEeB664e1JE0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-u8-aniBxMdqCMsqNS5Zw0g-1; Tue, 27 Apr 2021 04:27:10 -0400
X-MC-Unique: u8-aniBxMdqCMsqNS5Zw0g-1
Received: by mail-ed1-f72.google.com with SMTP id
 h13-20020a05640250cdb02903790a9c55acso24445762edb.4
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 01:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h02zWZVZ0wy/MS60LG8WdzUDH1c3ZTHhixBtflejkCU=;
 b=TDSb9r0JP/pKhboyUHINvXBobccU5aEoAnADrom3MYeNdjFZcE/DSiQOTs90LaG83B
 y4kBtumyZYOSOtzWZrHjmUgiMcoQDC+LOLcH+qGQ57XiWa0EIACsRm6670UYOcfduM+Q
 K+BnYi47N0GJfSvnYg73V/7AB19j11oqZ/Vb0NYSmztTJGlsyBXQm2Ll7W5CCxJJmGxZ
 jfG+0CV5MKUIsqaCHMQdGwwBk6hVOlcTtHrJhLSLwMZT56ng3/UzvqpTdrSBvaqkfiI9
 H69U0G80uNQjJ8ou0zYZMtBzHvmBU2VjRIvS3Mv0FyHhM8sQbDXaW6RHSXCVuTDHtd67
 RIcA==
X-Gm-Message-State: AOAM5316EBqtcP0IFgLxCTQw0DyghBLt6s1DrZ31/VG3joTMQIQVICCB
 HhgugQPnxrlt+5x0krSpjvxFiat4/ZVO5UksVaABYXMSZ+EbE2B+V3jztaq5ZRhePPD532mUY3e
 ztXtruoJUigDh
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr2866637edv.373.1619512029002; 
 Tue, 27 Apr 2021 01:27:09 -0700 (PDT)
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr2866619edv.373.1619512028822; 
 Tue, 27 Apr 2021 01:27:08 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id p9sm1764617edu.79.2021.04.27.01.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:27:08 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:27:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 2/6] target/arm/kvm: Add helper to detect el2
 when using KVM
Message-ID: <20210427082706.phzeothsgj66mnp5@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cuRZuQVpCaBU

On Thu, Apr 01, 2021 at 05:55:34AM -0700, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm64.c   |  5 +++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..9cacaf2eb8 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -721,6 +721,11 @@ bool kvm_arm_steal_time_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
>  }
>  
> +bool kvm_arm_el2_supported(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
> +}
> +
>  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>  
>  void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..7d7fc7981b 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -285,6 +285,14 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
>   */
>  bool kvm_arm_steal_time_supported(void);
>  
> +/**
> + * kvm_arm_el2_supported:
> + *
> + * Returns: true if KVM can enable el2(nested virtualization)
                                         ^ please add a space
> + * and false otherwise.
> + */
> +bool kvm_arm_el2_supported(void);
> +
>  /**
>   * kvm_arm_aarch32_supported:
>   *
> @@ -398,6 +406,11 @@ static inline bool kvm_arm_steal_time_supported(void)
>      return false;
>  }
>  
> +static inline bool kvm_arm_el2_supported(void)
> +{
> +    return false;
> +}
> +
>  /*
>   * These functions should never actually be called without KVM support.
>   */
> -- 
> 2.17.1
> 
> 

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>

