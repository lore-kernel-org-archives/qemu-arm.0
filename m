Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp803926lfg;
        Thu, 11 Mar 2021 17:49:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZFV9bwbdugUNWAKgXlMz8+SfowPcLcITNIE5SuMpMy1dE4COkI80LzDaU34JmrqGuJu1g
X-Received: by 2002:a92:d6cf:: with SMTP id z15mr1108071ilp.40.1615513752009;
        Thu, 11 Mar 2021 17:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615513752; cv=none;
        d=google.com; s=arc-20160816;
        b=sR+ywqvcpzL/kHKVGcgWSXCyipvF6ByIqrPxajkYhO6YUHNkmzs5jquiIOVXGxAFQy
         RsKUy7IgPA/1t+LHTbwQHM5GhLi67vSeAWnOKPF8v0RPh5+9vgnd6Hs8jU1a3RClAN1T
         Pe0Urw5tFe2g6R30OQqJqoGYI9xF4VBF42jybBoYqtpu/s6nyaHXUo12noUTi6ua4MAM
         WvEv29WX4d6PXt7OpYj529reOU+7pbvnydXZ76ichbGWac1Gw4Qnc8KVSItoekoqqyX4
         2qR+JJs/RcVdLO/GUPzREZjrbrNg7OseEoqxJ9chCAjKzRS2xOpQqSAzrmL1cHKkbjOD
         Qwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ccL+z8Dr/YWLz2NKXtdS3NF7qoZW6Vs6Ltc+OQVp0H4=;
        b=xbyEUfwWGEfrZg9vzKd0Px2DYIcvVj2xjTH7KBSHfVtJXIyznZee3+JyXositayj5h
         084qj9oFrtnDT4lnMSTuUekxgb/jj2fSF2kNqM/Ers4Q8k2YAKYO9uIcnGN3pvkfnpPn
         IzFIHxyGDv5Cfx3ofjVanjLjJDjM+f95foqVbHUnA0NjASqWYz77QSktdbZIbA7sMOFt
         3YOaiAJpTvlkVtVGqwC3vG1tZ+4NX0BzjBKWyBDrFqL7Rle+v8N3EwX6XL8p3UhlKOqy
         lM1+WEZcQFjf+D2zdigvBBLUJQ3xnPd7YPGTkFKOfWk/E9vJ2lFpArbC5GS5drABaJWl
         0YAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qPmteqeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f32si4242012jav.9.2021.03.11.17.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 17:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qPmteqeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKWvP-0004P2-AL
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 20:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWvH-0004Ne-1O
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 20:49:03 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:37210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWvE-00043N-Eh
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 20:49:02 -0500
Received: by mail-il1-x132.google.com with SMTP id k2so1192442ili.4
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ccL+z8Dr/YWLz2NKXtdS3NF7qoZW6Vs6Ltc+OQVp0H4=;
 b=qPmteqeXw61SweSIYu0RUcJQTOe/T0x81HNtA2uoVQf1hs433INgL8OoObg3SPx1eh
 d73GZS5HRfyH9dvX7OjvYdaub80lJ+/nLZ5WbW4uS24kOe7KCrFGuQ6ErxhcHoSj/eOa
 gstCmr9RnvkXJ/kBZXrf67YIWinpm5fZ8PnX2cUqOqyHKEjvpdDFQDL6tKeTu33A/6b+
 jap703ZvnEWeUhjqWG3B7wSNL5ucNB12prI6b3IQptOoBfYILSXj+A/zmOlxAZIkzRLP
 OMlMyNpLx1sRTIwJPaOkdqm6tf3XucUu+OUDWPycrOheouj6WcE0nV5WvdiD8MSOjcN5
 VqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ccL+z8Dr/YWLz2NKXtdS3NF7qoZW6Vs6Ltc+OQVp0H4=;
 b=M99ezDp+fiCovGXuIngzcCILEMZz3oRh4/sWtI5lyl/m/i2cgJdf060yMylMHvvIoq
 +YEcfwiGEjwuIlgcivaVqg0AwOU+fcL0cFohj7XDGSWXQITVddapIjrGPt06k6U4u097
 YBmktJ4Zq4VeCrnixnsA9hKrayQvLRmfrrQnRzslIto1hY8S9zp6XxLqMz/uxDL+RYHB
 yjHOFJmD/zXqY+KRwLPO5eIBcM0n8vVC03KH/nZBqj49E/u1WetmKNhawl9MGKp//Jom
 hTFapFXLoCDDG3D0FSmbM2I8mce2inmXbB4LB97GjHRtxkxhgcjfa9gSy91Yx+7wKTBJ
 M5kQ==
X-Gm-Message-State: AOAM530tL40OzhMpNBR5NRFHLagJnA8UNucDvh4TrR6WsFVdii3JL2qR
 M8MOPQjiwcFcoV836/M1qOY2jrWdMyeT2yyYWoYw
X-Received: by 2002:a92:b70a:: with SMTP id k10mr1062158ili.23.1615513735316; 
 Thu, 11 Mar 2021 17:48:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <432d5c0c6fb79e29f2e7aa4730cf4339d3d858f0.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <432d5c0c6fb79e29f2e7aa4730cf4339d3d858f0.1612747873.git.haibo.xu@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:48:43 +0800
Message-ID: <CAJc+Z1FfpbJtEz9VG_nC_22N8fQZs3+F+XAQvQzmuchCfTLcjA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] Update Linux headers with new MTE support
To: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x132.google.com
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
X-TUID: zfihL3BjRT6n

++ more migration experts!

On Mon, 8 Feb 2021 at 11:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  linux-headers/linux/kvm.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 020b62a619..6a291a9a35 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
>  #define KVM_CAP_SYS_HYPERV_CPUID 191
>  #define KVM_CAP_DIRTY_LOG_RING 192
> +#define KVM_CAP_ARM_MTE 193
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -1241,6 +1242,19 @@ struct kvm_arm_device_addr {
>         __u64 addr;
>  };
>
> +#define KVM_ARM_TAGS_TO_GUEST           0
> +#define KVM_ARM_TAGS_FROM_GUEST         1
> +
> +struct kvm_arm_copy_mte_tags {
> +       __u64 guest_ipa;
> +       __u64 length;
> +       union {
> +               void *addr;
> +               __u64 padding;
> +       };
> +       __u64 flags;
> +};
> +
>  /*
>   * Device control API, available with KVM_CAP_DEVICE_CTRL
>   */
> @@ -1396,6 +1410,7 @@ struct kvm_s390_ucas_mapping {
>  /* Available with KVM_CAP_PMU_EVENT_FILTER */
>  #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
>  #define KVM_PPC_SVM_OFF                  _IO(KVMIO,  0xb3)
> +#define KVM_ARM_MTE_COPY_TAGS    _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
>
>  /* ioctl for vm fd */
>  #define KVM_CREATE_DEVICE        _IOWR(KVMIO,  0xe0, struct kvm_create_device)
> --
> 2.17.1
>
