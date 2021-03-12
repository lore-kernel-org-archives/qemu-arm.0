Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp804784lfg;
        Thu, 11 Mar 2021 17:50:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEDBd05eS7LpKQdrVuFibfwPLuqahuDnvmi5VXsIOPpEa4BuctlmMCvb4Jl1lsse/qgBGg
X-Received: by 2002:a05:6e02:1aa9:: with SMTP id l9mr1122878ilv.108.1615513847012;
        Thu, 11 Mar 2021 17:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615513847; cv=none;
        d=google.com; s=arc-20160816;
        b=D6/407JH7sLmqDeqwKlNqB7FLX2lMqdqDE01vqV9yhuwODU/2DWmw70VHtAROvHvxJ
         P/J1jhx3o2oyw7MiX+O0kow6VIDGPcwbKOQO4/zv8Oa5rAehACZiG4rjYYMq/8VdywaV
         OwvVM0O+hqqJcPbwMKBfEXnxc4zQP+tuKUVPQBr2NeJtVdi1iE1wNTOMyGqHjOJPTirC
         QEUaHG2uS4sUFyACGdZdFmD5mFmVzbm46S/OcTANqp4ccoy1EMilxxYU2PKeyOExD4LC
         JMLFSVR/cQoo/HPHn53bvl62eepKr+PXh6gZSZCtRcamKN1yLT51w8uy3ckAaWKLQH0M
         aMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKXrHldIIBsjvr3+URYqe96BijLsBRBaJyF4AeZ6as8=;
        b=JDl1H5c/uMoJ9D5pQHjkXuFNSr9XuezdQSG4M4jKkNdtVaOR0q3iR1TgVgH7zvV29l
         xpmpXe4J2zyb6/79IpLdZiYBlyaI+1BvbrSks42Hc8PiPd2+UbKLye0PxxzUFtgQqLhf
         XsOUH6JZLxQ0eWHL6jGyHLBSSBzc08F9EkI217vKHQQJBhy9nn3spm/8yUyU3QHHJoJL
         kV/8R2NnG7UB/ZDHjmi9CBwvO4EdcqWDp7wile4Ifs5SGffNmkK6ZvI0B4IgAJuViiGk
         6IVBk0yecZ5PGL+EkezWW4Wyh2nzCbr8IgmCTRKTx+p/vOOA9pudIAbSDwR+utJAbPft
         +dbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Jfj/dyFC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si4177561ion.29.2021.03.11.17.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 17:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Jfj/dyFC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKWww-0005ss-Ar
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 20:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWwd-0005ox-7g
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 20:50:28 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWwa-0004bR-Bs
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 20:50:27 -0500
Received: by mail-io1-xd2e.google.com with SMTP id y20so5784208iot.4
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 17:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKXrHldIIBsjvr3+URYqe96BijLsBRBaJyF4AeZ6as8=;
 b=Jfj/dyFChhSxyt8t3Sg5gNnEf7hpE5JVlvJPjcZFowbwKeT1sFeYb8HUaANIQN7jKw
 qpPsvJUdN5QhZ7le+pK7VsCfwna5If8ZKM7IgWOuw7uKxID4RpGREd7UFZxOpNWkZzYi
 D5zYcOdf6w82its0jrYaEdbjmCnVOJ7rzx33DHnLHdVbqWlHX+DKYZXwgJckmxVZ717q
 jVkUe/nANGUD9QrJEBKsm3WEm51rnp9oJ5zNqJzn6xB6b9iVH5PUTTl4FwBwQsepOyvP
 7wlnE0tVhsvp+eRusC1xPE4JS0IW6V+21O23k8kTmhbo/BKSerVjxK1kd3KT2oqSIaix
 GnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKXrHldIIBsjvr3+URYqe96BijLsBRBaJyF4AeZ6as8=;
 b=Wywq8flZKTGPATwJHn2Rac8U8ybzQdHZHIKUHeznQ6YHzyCR83WcpwbvkBByBLIKIz
 HbG+pSuRtGgI5sEU/vBvlpxHjsoqLG61Bx2JNIGIc5rfi78qP+dOt6mvVs7q2c7vFjNY
 k9Fgwkur6YhGSoOZdo6KCRhuHjh/uh2UeQ61fFmoO2D1cIKkcu5xsR33B/p6b+jSEonO
 qZYlpz8d99kyuC++de9EWGjB9y4hvcJ7/SUDtzaEBPR8fkzE6Tsh4J1/OJa+Qh6PrJm4
 BNAAgiYHeDLam7zL5qBrTV46DgYuJFfBC8VuyfokGas5mRC/wmZjM6VLc82mzTPbzejc
 1Gbw==
X-Gm-Message-State: AOAM532m7OdLuxEgeSR0r4axeYBkWfnaY5mX4qcuJLNVNiAfyE2wxBd3
 RGuvjRs2QYD3HhNwPoHnDgJfuhMCZq0UDHjkNrrD
X-Received: by 2002:a5e:9612:: with SMTP id a18mr8525268ioq.13.1615513823084; 
 Thu, 11 Mar 2021 17:50:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <ae69254130370fff4c9a38673deb1e3a27609e9c.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <ae69254130370fff4c9a38673deb1e3a27609e9c.1612747873.git.haibo.xu@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:50:11 +0800
Message-ID: <CAJc+Z1HST_3w_Cgm+7D_LUw_s5iEz2J0ey2JkSeZACHCkyj8pQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] Add APIs to get/set MTE tags
To: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3UU3VBE5vP4H

++ more migration experts!

On Mon, 8 Feb 2021 at 11:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
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
> index 23f34034db..4a6790d53b 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1608,3 +1608,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
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
> index eb81b7059e..1b94dbe7c8 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -358,6 +358,8 @@ int kvm_arm_vgic_probe(void);
>
>  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>  void kvm_arm_pmu_init(CPUState *cs);
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
>
>  /**
>   * kvm_arm_pvtime_init:
> --
> 2.17.1
>
