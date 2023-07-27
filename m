Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1383310ejb;
        Thu, 27 Jul 2023 08:43:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHzAdAoEfTjqW4+2T/XMtFMKW6+0VIlYRT4gzs6yRVuWm3HLH/R9QKQt85l/uhGPjtzDuGp
X-Received: by 2002:a17:907:a06b:b0:992:3ac7:a2da with SMTP id ia11-20020a170907a06b00b009923ac7a2damr2227850ejc.30.1690472599505;
        Thu, 27 Jul 2023 08:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690472599; cv=none;
        d=google.com; s=arc-20160816;
        b=IyXSqeO8az77Lessa4KNZpZvNggf1YrBPZVScfFxtjaV6IlqydCemz/ogt+zk6hc7p
         vYKQk3JAHh7L8guutqmG2DF0nWMHE3heBB/s5Ii/RJmAfVQaoQGSRyyKJCcqSKHWpC8M
         hTjBizAfjX4BMXWmLbuSTT1RAlxX8TdOLSAPZkBx+cMsXpsy/kIJuUx1SbnZqVIet8Br
         uR0r5UbaAUYBRO/dixN/zFJcm7MxKsMwET3Of2MtoP7csiFfgDW3uNhbr0k2qweP+rbu
         kFa5cYojM1E+HLFXTm+jY6RfOIxbdKzU7KD1ZKli5YxtdfBiiWffvcFLUtNLIVLbFOeT
         FaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=hEX2yXanu6lI6E29oJscX+qcEyz7+geVl0H0uFbsIWY=;
        fh=S/Q60tZUkO5gCGP6lro87ssNscMNSvD9vGdsJZ6js8c=;
        b=Oo0I4fgdm6Wrk/kSRuyo4Tl2QwrdQvwZsIf9ASRy7Ug4IGTBiFJNfJyFuUBtcsCtWc
         dcuCB+k2GoTDPp+KkHCS8MiOpmp+8Ix1Ai7fJSrL7q7eVadwAiL6UpTlgAwISZCZHiVe
         cXgENC7+gzVeY+/FJi8FbfcReA/CmEmdRBGX2T1xQGLuO6et1gPWlrOVnF8Tf3AmB2W3
         Siv6qgQkXGFI4hbPMGdZ+F7H4dD5odT747fqUXaxNMOz5X4fLclP/GQPCq1cqHurhntd
         5SZoGAMEYZuNy2Kc1ft178s+yeKnotX6m42ILpieuz1Iuz4g5xlfzI5rKACy2eX3duRy
         HCrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hvd1QyVr;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id fi1-20020a170906da0100b00997e79e646esi1276513ejb.557.2023.07.27.08.43.19;
        Thu, 27 Jul 2023 08:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hvd1QyVr;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbjG0PnS (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 27 Jul 2023 11:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjG0PnQ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 27 Jul 2023 11:43:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DD0B4
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 08:43:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3177163aa97so1159086f8f.0
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690472593; x=1691077393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hEX2yXanu6lI6E29oJscX+qcEyz7+geVl0H0uFbsIWY=;
        b=hvd1QyVrBZDYC1iVAlTK2lIxwDqf3WPN47mB29iOitO2K9J2D1T5tREezyINzni2N7
         8jgHYX+s84S1LwmsB9fHcR3RjzljyFeT9d5TDQ3cOxrMDYvuI7CQZLmvNSxxwVwvn4aB
         /dS8y16OfiLNnqjVBCYQSVVuhSx75YMHceuNTKWp+INE1J+si8nGgDHKJuEw0G0o3Y1k
         SEGbpexUuzsQcY/Bi96Pi+L5A3ykGVe3quuVDwt7hVTmZbYR7qG5XgLkkOH9s3YRWuPo
         8BK7wFSBWZOJOR2l9fvRNAcoctJRaIWdkRi7hFNKAcX0+Egcjy4UootkNgG/YwoaJMkI
         qPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690472593; x=1691077393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEX2yXanu6lI6E29oJscX+qcEyz7+geVl0H0uFbsIWY=;
        b=EZqvA40TmfZaIf8yZVCWxml7VMkPqOVmw7KqTTL0IsvMMmrzbHtcAe6xwqoWknceTm
         ec7Otfyi2Cy9P4Keoqv3XU6thjYCYfW220h/zqdvsor5CQy2tz1lqScP3l7QZ2FbXJxV
         5IDIJVnTSYsbv2IUnHoI+nwTTBlnqIAATFN1EvTZl2bWn2AwOqsBxK9S3HefHHFu1cN8
         4U9h0EXcLYwG9e60dTn8XeKglaXHGTlQAZQDuvYI+JiVTjvt1eoYN9en7mAEUMPONjYS
         5s6hzk6qpR+2TV6B1MCeRozudWR7isum9RcAiZfs0dQVAyi/+8MifPafHTpGuVOq2BoO
         MNOA==
X-Gm-Message-State: ABy/qLaVbzO/u340s2B2kuidwIDJRDqi8XZEQpFYDFs7Jy0DgKuRLaBp
        tvJDM8hlTx5+UQQ6WfICq83W/v6NhLIw4uUEk2vOaw==
X-Received: by 2002:a5d:6706:0:b0:315:a043:5e03 with SMTP id
 o6-20020a5d6706000000b00315a0435e03mr2363865wru.55.1690472593068; Thu, 27 Jul
 2023 08:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230725150002.621-1-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20230725150002.621-1-shameerali.kolothum.thodi@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 27 Jul 2023 16:43:02 +0100
Message-ID: <CAFEAcA_3+=m8nt6_eJMiEpxyGcSAXJRC5LWMVvU3f9CHAxKzCw@mail.gmail.com>
Subject: Re: [RFC PATCH] arm/kvm: Enable support for KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
To:     Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, ricarkol@google.com,
        kvm@vger.kernel.org, jonathan.cameron@huawei.com,
        linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ty8BSw5iWgWG

On Tue, 25 Jul 2023 at 16:01, Shameer Kolothum
<shameerali.kolothum.thodi@huawei.com> wrote:
>
> Now that we have Eager Page Split support added for ARM in the kernel[0],
> enable it in Qemu. This adds,
>  -eager-split-size to Qemu options to set the eager page split chunk size.
>  -enable KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.

It looks from the code like you've added a new sub-option
to -accel, not a new global option. This is the right thing,
but your commit message should document the actual option syntax
to avoid confusion.

> The chunk size specifies how many pages to break at a time, using a
> single allocation. Bigger the chunk size, more pages need to be
> allocated ahead of time.
>
> Notes:
>  - I am not sure whether we need to call kvm_vm_check_extension() for
>    KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE or not as kernel seems to disable
>    eager page size by default and it will return zero always.
>
>   -ToDo: Update qemu-options.hx
>
> [0]: https://lore.kernel.org/all/168426111477.3193133.10748106199843780930.b4-ty@linux.dev/

Speaking of confusion, this message says "It's an optimization used
in Google Cloud since 2016 on x86, and for the last couple of months
on ARM." so I'm not sure why we've ended up with an Arm-specific
KVM_CAP and code in target/arm/kvm.c rather than something more
generic ?

If this is going to arrive for other architectures in the future
we should probably think about whether some of this code should
be generic, not arm-specific.

Also this seems to be an obscure tuning parameter -- it could
use good documentation so users have some idea when it can help.

As a more specific case of that: the kernel patchset says it
makes Arm do the same thing that x86 already does, and split
the huge pages automatically based on use of the dirty log.
If the kernel can do this automatically and we never felt
the need to provide a manual tuning knob for x86, do we even
need to expose the Arm manual control via QEMU?

Other than that, I have a few minor coding things below.

> +static bool kvm_arm_eager_split_size_valid(uint64_t req_size, uint32_t sizes)
> +{
> +    int i;
> +
> +    for (i = 0; i < sizeof(uint32_t) * BITS_PER_BYTE; i++) {
> +        if (!(sizes & (1 << i))) {
> +            continue;
> +        }
> +
> +        if (req_size == (1 << i)) {
> +            return true;
> +        }
> +    }

We know req_size is a power of 2 here, so if you also explicitly
rule out 0 then you can do
     return sizes & (1 << ctz64(req_size));
rather than having to loop through. (Need to rule out 0
because otherwise ctz64() returns 64 and the shift is UB.)

> +
> +    return false;
> +}
> +
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
>      int ret = 0;
> @@ -280,6 +298,21 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          }
>      }
>
> +    if (s->kvm_eager_split_size) {
> +        uint32_t sizes;
> +
> +        sizes = kvm_vm_check_extension(s, KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES);
> +        if (!sizes) {
> +            error_report("Eager Page Split not supported on host");
> +        } else if (!kvm_arm_eager_split_size_valid(s->kvm_eager_split_size,
> +                                                   sizes)) {
> +            error_report("Eager Page Split requested chunk size not valid");
> +        } else if (kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
> +                                     s->kvm_eager_split_size)) {
> +            error_report("Failed to set Eager Page Split chunk size");
> +        }
> +    }
> +
>      kvm_arm_init_debug(s);
>
>      return ret;
> @@ -1062,6 +1095,46 @@ bool kvm_arch_cpu_check_are_resettable(void)
>      return true;
>  }
>
> +static void kvm_arch_get_eager_split_size(Object *obj, Visitor *v,
> +                                          const char *name, void *opaque,
> +                                          Error **errp)
> +{
> +    KVMState *s = KVM_STATE(obj);
> +    uint64_t value = s->kvm_eager_split_size;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void kvm_arch_set_eager_split_size(Object *obj, Visitor *v,
> +                                          const char *name, void *opaque,
> +                                          Error **errp)
> +{
> +    KVMState *s = KVM_STATE(obj);
> +    uint64_t value;
> +
> +    if (s->fd != -1) {
> +        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
> +        return;
> +    }
> +
> +    if (!visit_type_size(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value & (value - 1)) {

"if (!is_power_of_2(value))" is a clearer way to write this.

> +        error_setg(errp, "early-split-size must be a power of two.");
> +        return;
> +    }
> +
> +    s->kvm_eager_split_size = value;
> +}
> +
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
> +    object_class_property_add(oc, "eager-split-size", "size",
> +                              kvm_arch_get_eager_split_size,
> +                              kvm_arch_set_eager_split_size, NULL, NULL);
> +
> +    object_class_property_set_description(oc, "eager-split-size",
> +        "Configure Eager Page Split chunk size for hugepages. (default: 0, disabled)");
>  }
> --

thanks
-- PMM
