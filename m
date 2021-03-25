Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp351011lfg;
        Thu, 25 Mar 2021 05:18:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxswZLajzhzOj2Zql+4BKQw+/5mRHLvo8lQaZrnrnQMHSZ1i0SeUW5/OTPwP7b4Ux2cboS3
X-Received: by 2002:aca:4188:: with SMTP id o130mr6121835oia.53.1616674738456;
        Thu, 25 Mar 2021 05:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616674738; cv=none;
        d=google.com; s=arc-20160816;
        b=rIyvu6sOytMbKe1OAGaJOTUhUmhGY1eiXu9JMhK7Kxe4qlT8BkfAKlypIK9nEsEqUc
         vpXd0hT7C8dTw26TIUluGAge8cLQFJPxb1sanw/unOybGP8g97q8ldIWuhH+zKfOyttZ
         3xfDdrZcG+3FQjHJdjrSSriddbFkv63vN6S47b2B6K+HiAFxit/WeSHJcbolCBKMaKs5
         tWbc+2kd3p05RsVgGEvlLnl+9/86hUK4ivriznjEMJUVyvCD7YGZn0Ud4kajVpPfRSFZ
         9jxGoc3vpRN5gvNCgbsFvNucEQJ3wJUEE9F21QY83oE8d8WoxitsPi5r3YQ6bPHK5vN4
         Xwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=jperPNLmhByLCS/rEka9DO+sGWRrZa+aR6WQ/k/a/3o=;
        b=iFSEApMWLTy5kCg8ufSDLnBdl8v9Csavf5Vr95NpctTsgo5fpj8N9wQGGsqwTEWL9t
         jLHam2kXyFDTz3KPUz/or5f1rmM7bs3Jiq3+wRnJ93Sn0e7mYWhqG0lO5nQlOpZfsiRf
         xymfP+R4AdyVJNnyBLg/8LZE3tCaOAlX4xZsDHOfytAgfMU0yFzBJ0xaNXSSjhGGCX1I
         38Uvz4M2jZZEmX6lt5/9uTiL/r5Z8KY/SZ0e9dFEJSPiYN7bMA2bTM7ielhF81XGhqUx
         TZC4BPWvMiUe8jV+JXgR6WvmphCID6m3UDrEyxoepTmCYA4hqVPPsOfvsp8/jaJF3jMm
         ZygQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aa211rrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si4675838ots.49.2021.03.25.05.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 05:18:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aa211rrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPOwz-0007xe-Os
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 08:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPOwr-0007xX-KT
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 08:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPOwp-0001VD-HD
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 08:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616674726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jperPNLmhByLCS/rEka9DO+sGWRrZa+aR6WQ/k/a/3o=;
 b=aa211rrRHOtBpkLLLkdB5a3U5CjNHVfWptlbX5z5o+e2G3ZMB4r5oeFZantLJHZWxeUf6F
 5wtFszMd06UDjV5eop97iHhD7ybeKrcVq4+5Z2u4ST0nBYgXzzSeAygaKDwyU0ddka1fGO
 QYt7uP8MGlQ9zgkWcaYyrCJEtCNG6V8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-Fo4qiMxdPzau7sSjrbga-w-1; Thu, 25 Mar 2021 08:18:44 -0400
X-MC-Unique: Fo4qiMxdPzau7sSjrbga-w-1
Received: by mail-wr1-f72.google.com with SMTP id t16so2554585wrn.20
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 05:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=jperPNLmhByLCS/rEka9DO+sGWRrZa+aR6WQ/k/a/3o=;
 b=MGzu5ueC2vIjDXa6otXvD1Vu/Cd2a4aeybEYh6Y8bp965+nw4nlbliADIYH6ZDKfBY
 qg3KcDtLU/J2rlv72K146Uf57AxbMvhX3pm3IJW+RF89nfkcLcdAYuWI11QK3ajSASrF
 s+up77fA27lnv9k06QRp7XOVpfTmzl3vLemSz7tAFwT7UPAweDD3TIayTRZYcmSYOmYK
 jnHMEuBIwa9lV0+sA5Tnw9M5wNp/4DJnN3uezE5G3Mc1x3rfoTArSBgpK8ItyVwOqgDD
 uoDJZtOVw3TxP8vBPsi0usAVzmm/nrLDd3PXjvO/7zQEbNnGutNuFJ/aUpsFo6B+V8SP
 8qfw==
X-Gm-Message-State: AOAM530jOJiuDG1PrXu13elslJUWkBUK/f6wOZyrgh50d7iBRMolnIXv
 Xo9n3qxaOYZ9hTcFi78zRSmK3Mlg+d96G8894/4I5fX/Y+2bIHdBT99S73ity2Et89kOkRgrjte
 bU5b6YDIfx4fs
X-Received: by 2002:a5d:4686:: with SMTP id u6mr8596608wrq.60.1616674722010;
 Thu, 25 Mar 2021 05:18:42 -0700 (PDT)
X-Received: by 2002:a5d:4686:: with SMTP id u6mr8596576wrq.60.1616674721758;
 Thu, 25 Mar 2021 05:18:41 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id c16sm8078071wrs.81.2021.03.25.05.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:18:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 3/5] Add APIs to get/set MTE tags
In-Reply-To: <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
 (Haibo Xu's message of "Wed, 17 Mar 2021 09:28:22 +0000")
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 25 Mar 2021 13:18:40 +0100
Message-ID: <87tuozo28v.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7U1L5fIqIwO0

Haibo Xu <haibo.xu@linaro.org> wrote:
> MTE spec provide instructions to retrieve the memory tags:
> (1) LDG, at 16 bytes granularity, and available in both user
>     and kernel space;
> (2) LDGM, at 256 bytes granularity in maximum, and only
>     available in kernel space
>
> To improve the performance, KVM has exposed the LDGM capability
> to user space by providing a new APIs. This patch is just a
> wrapper for the KVM APIs.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
>  target/arm/kvm_arm.h |  2 ++
>  2 files changed, 26 insertions(+)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 73a191f8e1..3157025316 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1606,3 +1606,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
>      }
>      return false;
>  }
> +
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> +{
> +    struct kvm_arm_copy_mte_tags args = {
> +        .guest_ipa = ipa,
> +        .length = len,
> +        .addr = buf,
> +        .flags = KVM_ARM_TAGS_FROM_GUEST,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);

Just a question, how fast/slow are this calls?

My understanding is that we are making a kvm call for each page that we
want to migrate, right?

Each time that we want to send it.

Later, Juan.


> +}
> +
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> +{
> +    struct kvm_arm_copy_mte_tags args = {
> +        .guest_ipa = ipa,
> +        .length = len,
> +        .addr = buf,
> +        .flags = KVM_ARM_TAGS_TO_GUEST,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
> +}
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..bbb833d6c6 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -360,6 +360,8 @@ int kvm_arm_vgic_probe(void);
>  
>  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>  void kvm_arm_pmu_init(CPUState *cs);
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
>  
>  /**
>   * kvm_arm_pvtime_init:

