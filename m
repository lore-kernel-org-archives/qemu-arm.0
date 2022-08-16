Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1896528ejf;
        Tue, 16 Aug 2022 09:27:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6dLNFG1lLnVsblfhB58q4owG7RlbrWXO9qYrNG+PGsHaXxUiLnI17o+CfQSK35pf66IV6D
X-Received: by 2002:a05:622a:5cb:b0:344:551a:c804 with SMTP id d11-20020a05622a05cb00b00344551ac804mr12118602qtb.645.1660667230359;
        Tue, 16 Aug 2022 09:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660667230; cv=none;
        d=google.com; s=arc-20160816;
        b=qmYfOUk7TEo7tT9aN+MF8Y9HVe5SkJguqNDG0gbTRdtrgOWaPT+DvrcqMJ8QwqAoyk
         VKDOmlxqF1fxsGcXKuFcmciUjeuDt3HDtPVtKz8KDflXgst8eyikpawKQT2ybBeqTQOX
         0cbZXfJPQ4H9RLhTn+mzNN7G1MNh8as9aEpehFxv4IzLiOrJLV4JxyKusy7eX9hwpWrc
         2ZfBc+ppI6SI21gBlzlU9gdHQUhrRoIf7vIWkbWYRlgoiCra2i5vyI3vgiqWsKLVZU0C
         CxhYDpAZaFvKNKvlIK+0rGzYnLT/ZdARqhbnJTnYmUfnkcGIXtEJyvswNaclWkRz8Tko
         Xwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SZmbzNOS8NjSoBbl17bufFSjI9Oge7FAiTEfq0le+Wc=;
        b=rhMkq3Wb/6xxb1mdv7592Uygnz69u99V6748GD3BgACE8AMJZWuB3MFqT2NhiP9YfH
         LJ/qqDMt60KzufE3CdveGbwmoxLuA0WRmumzv7Qr0/Bgje5ErbvdQXuKPEl2inc3ZTnz
         5DqVtsVIcl9Z4w2XfVf/0wJ17CSwBbK18inXqT+qkFYIkfl0+uY5Nddep/aScd3np7Sg
         gc/hn0b6ZxPjhUFI9X1pbOMAG3AIS89hwenqUgHoaOFkMNE8d96R7gE1Lhm0vcw24Lwv
         peMZleiUki4go715O6tiy0rsOIqxfg9SlrrsiCKqHmdT/7AXmHGXUK+HduoV95XQYA7r
         +O4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R1rHdmFq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a05620a294a00b006bb6780f14fsi1105356qkp.496.2022.08.16.09.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Aug 2022 09:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R1rHdmFq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNzPJ-0007gT-Lx
	for alex.bennee@linaro.org; Tue, 16 Aug 2022 12:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oNmrB-0007L6-0v
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 23:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1oNmr7-0007x4-TB
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 23:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660618981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SZmbzNOS8NjSoBbl17bufFSjI9Oge7FAiTEfq0le+Wc=;
 b=R1rHdmFq9LF307+9qE0dtkDqDuec51Y/NFsUIKLnmtE6HKwpRDvJCxJYnGi80YdJBp7of3
 wBlpdfYtWw/y4k0Lf6eN0Xf1XtUSSivI5E7n5BNHZp76gEO/WMvocK+jWhJyGMUqchoVoz
 j9S7kl54DSgxJRRfIaXPetMdQE17Vvg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-8i8BSGH-MMK3jDbya4di6w-1; Mon, 15 Aug 2022 23:01:49 -0400
X-MC-Unique: 8i8BSGH-MMK3jDbya4di6w-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-31f4b76446aso86005657b3.7
 for <qemu-arm@nongnu.org>; Mon, 15 Aug 2022 20:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SZmbzNOS8NjSoBbl17bufFSjI9Oge7FAiTEfq0le+Wc=;
 b=diRBahR+eXjCb5xkEAXTnhk0Zcld/wsAJBq+sDc8Lrkoq8OKtoXPhjid4dpqLSeI0j
 1DsPaOiRCee2ZiTIunLzJgoFuiZ0JzKM8q7qzKza5qZMBGn6v7X0zsDobCxxJl0KaGV1
 bHWKi379t2y3lv89drbiWbo3YQzojMADfdVvLqOLWuh1FN3iKKpJElWb8mr/r8jF2hBF
 reCFmn33WRb5QLwEYiaY9s70yXytWcD0GjxQ8wZuCJf4KvezzRc5wyEOmAxoSQCtAUTq
 kgmWfh+iY5zWPzpdMH0kps9NBN9s7N0PQ+aI+J6VjNvRD/1qDFGuBpBEo8Fu5srWhBny
 upbA==
X-Gm-Message-State: ACgBeo36q1afihk81hwCJ0wfbSjq0FOl/1e+CCmo7t8FDQG1XzklpsTd
 R7Qk5zrl036toK4yy/bWwLbAR+wf0mZENgHJYUYz18JDDHeKB98e4DtiZN+K+wz9eQusIJlCsun
 sVkEfFpZHC4VzpmXtPK7iVSOYZvcR
X-Received: by 2002:a5b:b49:0:b0:67c:cf0:4565 with SMTP id
 b9-20020a5b0b49000000b0067c0cf04565mr13219080ybr.442.1660618908667; 
 Mon, 15 Aug 2022 20:01:48 -0700 (PDT)
X-Received: by 2002:a5b:b49:0:b0:67c:cf0:4565 with SMTP id
 b9-20020a5b0b49000000b0067c0cf04565mr13219062ybr.442.1660618908425; 
 Mon, 15 Aug 2022 20:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220815062958.100366-1-gshan@redhat.com>
 <20220815062958.100366-5-gshan@redhat.com>
In-Reply-To: <20220815062958.100366-5-gshan@redhat.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Tue, 16 Aug 2022 11:01:12 +0800
Message-ID: <CAJFLiB+2r2bphcMxjdaUcEs9LgtYXGODhpE47Deng03xN4Dz6A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] virt/hw/virt: Add virt_set_high_memmap() helper
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 Auger Eric <eric.auger@redhat.com>, cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 16 Aug 2022 12:26:58 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e58bkzXy7mXL

commit 49e00c1fe2ab24b73ac16908f3c05ebe88b9186d (HEAD -> master)
Author: Gavin Shan <gshan@redhat.com>
Date:   Mon Aug 15 14:29:58 2022 +0800

    virt/hw/virt: Add virt_set_high_memmap() helper

    The logic to assign high memory region's address in virt_set_memmap()
    is independent. Lets move the logic to virt_set_high_memmap() helper.
    "each device" is replaced by "each region" in the comments.

    No functional change intended.

    Signed-off-by: Gavin Shan <gshan@redhat.com>

The patchs works well on my Fujitsu host.

[root@hpe-apollo80-02-n00 qemu]# /home/qemu/build/qemu-system-aarch64 -version
QEMU emulator version 7.0.92 (v7.1.0-rc2-12-gd102b8162a)
[root@hpe-apollo80-02-n00 qemu]# /home/qemu/build/qemu-system-aarch64
-accel kvm -m 4096,maxmem=1023G -machine virt-2.12 -cpu host

[root@hpe-apollo80-02-n00 qemu]# /home/qemu/build/qemu-system-aarch64
-accel kvm -m 4096,maxmem=1024G -machine virt-2.12 -cpu host
qemu-system-aarch64: -accel kvm: Addressing limited to 40 bits, but
memory exceeds it by 1073741824 bytes

[root@hpe-apollo80-02-n00 qemu]# /home/qemu/build/qemu-system-aarch64
-accel kvm -m 4096,maxmem=1023G -machine virt -cpu host

[root@hpe-apollo80-02-n00 qemu]# /home/qemu/build/qemu-system-aarch64
-accel kvm -m 4096,maxmem=1024G -machine virt -cpu host
qemu-system-aarch64: -accel kvm: Addressing limited to 40 bits, but
memory exceeds it by 1073741824 bytes

Tested-by:zhenyzha@redhat.com


On Mon, Aug 15, 2022 at 2:30 PM Gavin Shan <gshan@redhat.com> wrote:
>
> The logic to assign high memory region's address in virt_set_memmap()
> is independent. Lets move the logic to virt_set_high_memmap() helper.
> "each device" is replaced by "each region" in the comments.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 92 ++++++++++++++++++++++++++++-----------------------
>  1 file changed, 50 insertions(+), 42 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e38b6919c9..4dde08a924 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1688,6 +1688,55 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>
> +static void virt_set_high_memmap(VirtMachineState *vms,
> +                                 hwaddr base, int pa_bits)
> +{
> +    hwaddr region_base, region_size;
> +    bool *region_enabled, fits;
> +    int i;
> +
> +    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> +        region_base = ROUND_UP(base, extended_memmap[i].size);
> +        region_size = extended_memmap[i].size;
> +
> +        switch (i) {
> +        case VIRT_HIGH_GIC_REDIST2:
> +            region_enabled = &vms->highmem_redists;
> +            break;
> +        case VIRT_HIGH_PCIE_ECAM:
> +            region_enabled = &vms->highmem_ecam;
> +            break;
> +        case VIRT_HIGH_PCIE_MMIO:
> +            region_enabled = &vms->highmem_mmio;
> +            break;
> +        default:
> +            region_enabled = NULL;
> +        }
> +
> +        /* Skip unknwon or disabled regions */
> +        if (!region_enabled || !*region_enabled) {
> +            continue;
> +        }
> +
> +        /*
> +         * Check each region to see if they fit in the PA space,
> +         * moving highest_gpa as we go.
> +         *
> +         * For each device that doesn't fit, disable it.
> +         */
> +        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> +        if (fits) {
> +            vms->memmap[i].base = region_base;
> +            vms->memmap[i].size = region_size;
> +
> +            base = region_base + region_size;
> +            vms->highest_gpa = region_base + region_size - 1;
> +        } else {
> +            *region_enabled = false;
> +        }
> +    }
> +}
> +
>  static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> @@ -1742,48 +1791,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>
>      /* We know for sure that at least the memory fits in the PA space */
>      vms->highest_gpa = memtop - 1;
> -
> -    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> -        hwaddr region_base = ROUND_UP(base, extended_memmap[i].size);
> -        hwaddr region_size = extended_memmap[i].size;
> -        bool *region_enabled, fits;
> -
> -        switch (i) {
> -        case VIRT_HIGH_GIC_REDIST2:
> -            region_enabled = &vms->highmem_redists;
> -            break;
> -        case VIRT_HIGH_PCIE_ECAM:
> -            region_enabled = &vms->highmem_ecam;
> -            break;
> -        case VIRT_HIGH_PCIE_MMIO:
> -            region_enabled = &vms->highmem_mmio;
> -            break;
> -        default:
> -            region_enabled = NULL;
> -        }
> -
> -        /* Skip unknwon or disabled regions */
> -        if (!region_enabled || !*region_enabled) {
> -            continue;
> -        }
> -
> -        /*
> -         * Check each device to see if they fit in the PA space,
> -         * moving highest_gpa as we go.
> -         *
> -         * For each device that doesn't fit, disable it.
> -         */
> -        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->memmap[i].base = region_base;
> -            vms->memmap[i].size = region_size;
> -
> -            base = region_base + region_size;
> -            vms->highest_gpa = region_base + region_size - 1;
> -        } else {
> -            *region_enabled = false;
> -        }
> -    }
> +    virt_set_high_memmap(vms, base, pa_bits);
>
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
> --
> 2.23.0
>


-- 
I respect your work/life balance, no need to reply to this email if it
is outside of your normal working hours.

Zhenyu Zhang

Senior Quality Engineer, Products And Technologies

Red Hat Software (Beijing) Co., R&D Branch

