Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7663313eje;
        Thu, 20 Jul 2023 01:46:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGS3Sf9aF7dnd2F7VPQwJNIK5mG652zSJ+HWf9yx6j1zDLRuFxgpFoIASEtnUz6UHzH8PmP
X-Received: by 2002:a05:622a:1302:b0:3ff:24a8:4f26 with SMTP id v2-20020a05622a130200b003ff24a84f26mr29868193qtk.16.1689842787845;
        Thu, 20 Jul 2023 01:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689842787; cv=none;
        d=google.com; s=arc-20160816;
        b=Ye9MkSdJExpVZdLpeRwtDaiDSn6BDRlfaV4SP4qRe6d+0CfMLuMJlmogSHbiUeGbbk
         Wg6lLYeTRATx1GRLCwWDMXS8UCsRDCvZrlPU3zAk6KDO2XWZkga+g2HC34Os5ZhW7JvX
         +nttlGvy8KUE/AAGOBtg8L9zjjmKK+q8PAvj5POJWGLpLrTJnw9unOk0u5NrpaqDq7wi
         2tilRa6606sS/r90bNcriX3R8b9qLz/wwYBp0VU1OSM95sZOSWIOr5heGPhauYeeffYJ
         Jyi2K7NFi5t/Vc+4X2Cq5/L2ltKmvemjN3UwhhG3T/agPF6nuealHm/O/lQXBGMbdcSV
         Bc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CGTq1P2Y1uV5uSC7wiZItX+X++ASwHV6iVLZSdmwnAU=;
        fh=XsubhDhda3Jy2jwSl6ul4B/gOYNpncuz9O4UsSnbTZg=;
        b=ofPfmZe3vSULBN0OdZQYjov9nEzAhPNDJnuWx0f/3eE9UgeImfAIebZRz4HqugUGsd
         4hZ9h+foRs0zylDC7/PYIvJrgVsHY6250Q4bF2LBOEYT5AypRu8py0+2F1xsV4RKrmI+
         kjnh2C1FvDq9pLnhob28S0gS7ZMEUpFgx8fyQPErOBUfUqVNxsjXpPoiH71wzPxjkLze
         m4exXPTvqZdxLtJe3DEWzQ85efomrc71LdX9ElsMyChXUavy/Q6BnMpKqDqfMN+dJrdO
         NEWpkskni6OcLYr3s1rHNNS3/ItRmDN5SXS27FoHg9vq2JzlE+wqXYDINIjaqWFVFmjp
         cnsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RS4HzSE4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21-20020ac85bd5000000b00405433118e9si190126qtb.438.2023.07.20.01.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 01:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RS4HzSE4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qMPIb-0002ez-1i; Thu, 20 Jul 2023 04:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMPIZ-0002eB-3s
 for qemu-devel@nongnu.org; Thu, 20 Jul 2023 04:46:11 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qMPIW-0002Zq-Vq
 for qemu-devel@nongnu.org; Thu, 20 Jul 2023 04:46:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e5da802afso700258a12.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jul 2023 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689842767; x=1690447567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CGTq1P2Y1uV5uSC7wiZItX+X++ASwHV6iVLZSdmwnAU=;
 b=RS4HzSE4/FIoMyzpUm80pmAn2GSXlRLLoeUf57pBtFgGv4q4kDgLx1OtMrUNEdUhnE
 bzLcxg2U2Ctq4kg3qrL0HgtvN/VcmP9tmqLsWELnZRsqaCtGyGi2COmNCCUQJnOjj8ly
 wfLKk5czs1Vc05VG+dorbFvr0ki1c6ruj3MKTS32+eV7DvLtK2v99cIW+uTGyvXVp/+5
 GkQ72jNqB6mAoYddJ5HvKkOVA2yYIKBi+qXN6Nh7T+xOifxRcaTzmehJrZuow3W1UqAx
 DcqRo5fMWFwH3ataAI8usmWQStdI3v8chmQwGJRIj6V6qILOLvuI1T+EvgWXgBsO84gG
 JKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689842767; x=1690447567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CGTq1P2Y1uV5uSC7wiZItX+X++ASwHV6iVLZSdmwnAU=;
 b=InpLb7gH75s4hBrVPYaVSPon+er0sDQAIRGHxa/utD9YlC45dga+6K+bQ1iPzJsTHi
 KFloU6yKIyvO0D6ODInMlZn6tzpVFo/eDGA+AgyBNXSetqEQfadF1mpFtz1jCV3JWUgw
 TTXrNpOqyATvz7KrIfEJWa9oKuCsG9dvjROACC9Td0M6C2aEt/zQDW9KESDtJtzulnEZ
 x5KtGItebf6OHAw7dnyY0WoH4KO5oBByJktcuT9jfUt0n1k05wMC6L7jfXnIuObkkUhb
 TV8G+IjiatnEfQHBKz/hUi4TyzgCZKa5qfUL7Y5orNspuVXByFzSpL3zIZelA1S2G+Fs
 CiZw==
X-Gm-Message-State: ABy/qLaLWp3qWoEOcp16JUPmGa4LzZGFD9pu90lWP01FfZu9OOoBmqW+
 5fdG4CubEICIRWeVG/oHEtFfSEhZCLFFEjapiHXPeFTp/62kQX1A
X-Received: by 2002:a05:6402:6d6:b0:51d:9682:e30c with SMTP id
 n22-20020a05640206d600b0051d9682e30cmr1708622edy.5.1689842767305; Thu, 20 Jul
 2023 01:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230720072903.21390-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230720072903.21390-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2023 09:45:56 +0100
Message-ID: <CAFEAcA9BiXWweNEbMY1Xkso1B5-o3_85eW3QprQjerzM5nAo8g@mail.gmail.com>
Subject: Re: [PATCH RESEND] accel/kvm: Specify default IPA size for arm64
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xkLgQV9kkDaO

On Thu, 20 Jul 2023 at 08:29, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> libvirt uses "none" machine type to test KVM availability. Before this
> change, QEMU used to pass 0 as machine type when calling KVM_CREATE_VM.
>
> The kernel documentation says:
> > On arm64, the physical address size for a VM (IPA Size limit) is
> > limited to 40bits by default. The limit can be configured if the host
> > supports the extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
> > KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
> > identifier, where IPA_Bits is the maximum width of any physical
> > address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
> > machine type identifier.
> >
> > e.g, to configure a guest to use 48bit physical address size::
> >
> >     vm_fd = ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(48));
> >
> > The requested size (IPA_Bits) must be:
> >
> >  ==   =========================================================
> >   0   Implies default size, 40bits (for backward compatibility)
> >   N   Implies N bits, where N is a positive integer such that,
> >       32 <= N <= Host_IPA_Limit
> >  ==   =========================================================
>
> > Host_IPA_Limit is the maximum possible value for IPA_Bits on the host
> > and is dependent on the CPU capability and the kernel configuration.
> > The limit can be retrieved using KVM_CAP_ARM_VM_IPA_SIZE of the
> > KVM_CHECK_EXTENSION ioctl() at run-time.
> >
> > Creation of the VM will fail if the requested IPA size (whether it is
> > implicit or explicit) is unsupported on the host.
> https://docs.kernel.org/virt/kvm/api.html#kvm-create-vm
>
> So if Host_IPA_Limit < 40, such KVM_CREATE_VM will fail, and libvirt
> incorrectly thinks KVM is not available. This actually happened on M2
> MacBook Air.
>
> Fix this by specifying 32 for IPA_Bits as any arm64 system should
> support the value according to the documentation.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Resending due to inactivity.
>
>  accel/kvm/kvm-all.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 373d876c05..3bd362e346 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2458,7 +2458,11 @@ static int kvm_init(MachineState *ms)
>      KVMState *s;
>      const KVMCapabilityInfo *missing_cap;
>      int ret;
> +#ifdef TARGET_AARCH64
> +    int type = 32;
> +#else
>      int type = 0;
> +#endif
>      uint64_t dirty_log_manual_caps;
>
>      qemu_mutex_init(&kml_slots_lock);
> --
> 2.41.0

I think this was discussed in review the last time around on
this patch (which is why it wasn't applied), but I don't think
we should do this with a target ifdef in a common file. We should
have some kind of target hook for targets to specify what they need
to do here.

thanks
-- PMM
