Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2694197ejc;
        Tue, 17 Jan 2023 11:38:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvHl6vmd6OmJHhr/gDe/wydmluyNdWvvW2bHiOiwWrmDfc5miBnWNd+PHa+ArjbxyFBY0ON
X-Received: by 2002:a05:6214:3991:b0:51e:a23c:92b7 with SMTP id ny17-20020a056214399100b0051ea23c92b7mr6040861qvb.21.1673984281382;
        Tue, 17 Jan 2023 11:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673984281; cv=none;
        d=google.com; s=arc-20160816;
        b=MP2W9B+uapQAS0Jzc0k1UNtDXZ5Tk5sOjn9wKQePcz8ShprT7glaKOa0Habhvh1pIj
         mpijDUF+gK/ohqbn98/MB9XNA1zl4jkWj8YIvQZoyu+xF3zDG+2wqEiqc0Nnfhp4fyrF
         l2Ppgfh5VP0VNkem9g1lNLuHhN5El3N0fvFNHHnC12bGl4BBXvKMJPAd8zSeF8fwUecR
         GvGShgQv/Zt3C2hGJ3URmgDUm8KJa10O1wdSadxBpGn9KZ1iBWPGoqYbMDHO2hfGw/5C
         vF3QaMiFPCyd9XePRCy8qmjv9+O94BUBWJC07rxIxNbkNTPepmUlWWsZMLdL7E6ziNwN
         WhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eh5fgoocbdbY9QY3UdCKSmuuIr/thlgxwnXp5dQZBHA=;
        b=ZoAXeLVZgb6GpoVnlExQnMaLgAb2L1v7DE3LWSNRmI0SCcRohLZ5ADUsPjjaskMcU/
         RMQvSdT1Hj2HfMiJeY7aBDNpo/HzXi1KxcZtB0HTiVhAbMT7JzQCEdGloSF0CqfsYS8Z
         Rhn7aGAN/yNixsCYxiPZiPT1x66+tYJBPeQ86csaYdVRePsAM0OHR3x/nH6xpJcfx38J
         yN0SOmr3LxeP0L+GpRkJO6KM9SYXzDCBM+I9A7tQ/VXdZjT3KfXJPyYFRfNoU1Y9sVjM
         mHxzd2qDbyapWbPpVtngKgyTjcHasR69nHBL/xYIyF3/aXyzhEl9kcfNCfbavxifZ24U
         qgdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPyGE1CO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a05621420ad00b0053512d36d3asi3387503qvd.491.2023.01.17.11.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 11:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPyGE1CO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHrmK-0006VV-8v; Tue, 17 Jan 2023 14:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHrmJ-0006VF-5E
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 14:37:51 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHrmH-0000Tw-G7
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 14:37:50 -0500
Received: by mail-pf1-x42c.google.com with SMTP id c26so19949122pfp.10
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eh5fgoocbdbY9QY3UdCKSmuuIr/thlgxwnXp5dQZBHA=;
 b=dPyGE1COVGOI2KxD4ZLRpUmZW5v859qkiMT9GvN9GjTLLr2HXvcvIzdCz+65WF/+hc
 GwKOx2pfkRRPRPFbo1NhDhnPtvwv8c57ySRFvlbSLtCmAcGyV8cK2uIv1akauf2ioUQb
 B5dC6Gwlk8iBjl3QS7sP3NdrFnJTR/ZvyBuXEf0vQN4TGZME4HMFDh5W05eFPRL5gya7
 JNZUzS2z8spJybYAQhNsqiqcSfhEl/3LGQ7XGkHbGxBFS5LY46e9W5IyZifzJ+Ipx5Dc
 7Kke/y2GOvvihori32lT7k7XBMlVabnhfOz42NjRhB7YB0LGgLN+KN4La6AHIDYgrF91
 OA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eh5fgoocbdbY9QY3UdCKSmuuIr/thlgxwnXp5dQZBHA=;
 b=bvPcpdZDr4g1RQ8wwOrwllyt8q9/5gL1qU8VUIDKfrdm/yVGY5ugnCE9pkdEOkB6z0
 9Wl8blKIz5yVGLvHrILwprsFegodQ/U+lRIOZdzjc1YyU7c506Bcb+6AC2XwXNtxJAD1
 1Q7hVMZ0AOdtNzCt5BMq6xmBIhm5HseM2SMnVils4fw+nBqhgG5XT/bdlcqM3TTuosso
 qLTbw6y6s+mFYW9ru9tHPhCGCNQL6AbrHEogpbnnz3Na0Pfm7cQ21No5fjALkrcbDesn
 bvKDlRHy5s/BKzZsgwcQzh4eSihB7pdIze9ca8AvW+SEzrJhDA2oNfD6QjzC7l/3agAY
 R/HQ==
X-Gm-Message-State: AFqh2kqoC/y+BoOWGMmhcvr6Wj4vy/BPz+W5tcCvyWL+gMEMVgd6hiaF
 Lfqc+y54oEuILCpEtY2UkQRR7w==
X-Received: by 2002:a05:6a00:705:b0:58b:ca40:cd03 with SMTP id
 5-20020a056a00070500b0058bca40cd03mr4808468pfl.15.1673984267715; 
 Tue, 17 Jan 2023 11:37:47 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o189-20020a62cdc6000000b0058baa6586f3sm9512207pfg.135.2023.01.17.11.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 11:37:47 -0800 (PST)
Message-ID: <b92e6786-acc6-50ef-8804-e4e3ef4eb2d6@linaro.org>
Date: Tue, 17 Jan 2023 09:37:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111161317.52250-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: o+tq7ipaIj0t

On 1/11/23 06:13, Cornelia Huck wrote:
> @@ -2136,7 +2136,7 @@ static void machvirt_init(MachineState *machine)
>   
>       if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>           error_report("mach-virt: %s does not support providing "
> -                     "MTE to the guest CPU",
> +                     "emulated MTE to the guest CPU",
>                        kvm_enabled() ? "KVM" : "HVF");

Not your bug, but noticing this should use current_accel_name().

> +static inline bool arm_machine_has_tag_memory(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
> +
> +    /* so far, only the virt machine has support for tag memory */
> +    if (obj) {
> +        VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +        return vms->mte;
> +    }
> +#endif
> +    return false;
> +}

True for CONFIG_USER_ONLY, via page_get_target_data().
You should have seen check-tcg test failures...

> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    bool enable_mte;
> +
> +    switch (cpu->prop_mte) {
> +    case ON_OFF_AUTO_OFF:
> +        enable_mte = false;
> +        break;
> +    case ON_OFF_AUTO_ON:
> +        if (!kvm_enabled()) {

tcg_enabled(), here and everywhere else you test for !kvm.

> +#ifdef CONFIG_KVM
> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {

kvm_arm.h should get a stub inline returning false, so that the ifdef is removed.
See e.g. kvm_arm_sve_supported().

> +    default: /* AUTO */
> +        if (!kvm_enabled()) {

tcg_enabled.

> +    /* accelerator-specific enablement */
> +    if (kvm_enabled()) {
> +#ifdef CONFIG_KVM
> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
> +            error_setg(errp, "Failed to enable KVM_CAP_ARM_MTE");

Ideally this ifdef could go away as well.

> +        } else {
> +            /* TODO: add proper migration support with MTE enabled */
> +            if (!mte_migration_blocker) {

Move the global variable here, as a local static?

I guess this check is to avoid adding one blocker per cpu?
I would guess the cap doesn't need enabling more than once either?


> +                error_setg(&mte_migration_blocker,
> +                           "Live migration disabled due to MTE enabled");
> +                if (migrate_add_blocker(mte_migration_blocker, NULL)) {

You pass NULL to the migrate_add_blocker errp argument...

> +                    error_setg(errp, "Failed to add MTE migration blocker");

... then make up your own generic reason for why it failed.
In this case it seems only related to another command-line option: --only-migratable.


Anyway, I wonder about hiding all of this in target/arm/kvm.c:

bool kvm_arm_enable_mte(Error *errp)
{
     static bool once = false;
     Error *blocker;

     if (once) {
         return;
     }
     once = true;

     if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
         error_setg_errno(errp, "Failed to enable KVM_CAP_ARM_MTE");
         return false;
     }

     blocker = g_new0(Error);
     error_setg(blocker, "Live migration disabled....");
     return !migrate_add_blocker(blocker, errp);
}

with

static inline bool kvm_arm_enable_mte(Error *errp)
{
     g_assert_not_reached();
}

in the !CONFIG_KVM block in kvm_arm.h.


