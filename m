Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48E4C98314
	for <qemu-arm@archiver.kernel.org>; Thu, 24 Sep 2026 07:52:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9eFg-0004n8-SK; Thu, 24 Sep 2026 03:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9eFf-0004mO-2Y
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 03:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x9eFd-0002Ia-4l
 for qemu-arm@nongnu.org; Thu, 24 Sep 2026 03:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790236335;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLO1msRp/2LG5/BpgvzBWAQdAT0K72y8KNtstRsiuMI=;
 b=NA8GSlDecXO+BTmR0Jx++hfHcB9kRWxWaHKxUBIteUt3wINSNN+RHwPEOfR5knmjbHB9Jn
 Ew+x6T7AfCdWlyoGj5DlsQBWlNUddLspNcG3TDJhPq8SXATCiY7g8ytFeBsPSzvTGPWJ/6
 M40rUxsWSWYmypezt1FTakA/LW28fKM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-N9bs-7shN7q60J2Wjo4rBw-1; Thu, 24 Sep 2026 03:52:14 -0400
X-MC-Unique: N9bs-7shN7q60J2Wjo4rBw-1
X-Mimecast-MFC-AGG-ID: N9bs-7shN7q60J2Wjo4rBw_1790236333
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49e6c17ec1dso20198715e9.2
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2026 00:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790236333; x=1790841133;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DLO1msRp/2LG5/BpgvzBWAQdAT0K72y8KNtstRsiuMI=;
 b=zwaV0RHeqSMA8QlD6arA0deGmjhYHdukSBecy00lGVeiwIB9Dzss6D14M/+Afaax1b
 PvTclEPnfC243+Gt0JIZ9bVHOKKl1KzyW7I5Ze2AW25wk1D04YdZ6lEtdZuvzi4CG0Fy
 YMFNEOX4MUel1nQJtElZidjDvhe5KUkByojLdRr1p23AuNhFB8uvwhuAmrv3VftQV8KN
 fsVnARC4XPi/esdSQeiFjn6AcoPZaei+4/diAQRj+n+gVHuyeTDjvt/PR4Y15h55Xep4
 o9btJF3Y7KrwkIAeTYXMbmqkXjTAneny2Nf11ATfORCFaVdighhElRv0/5dhsKBgzVb3
 JjUg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw+xPvVbQhwqcU8ODwS38839j/shGalcEUth98FSMjAGOMCncOMZi0RKqeGlIeNeH5zvokH75ZJdQ==@nongnu.org
X-Gm-Message-State: AFuF++m39U9HWbiCEl9ugjICUxdrSMVv4WZG+Ez8skO0XSj8UhBp7Qjx
 ctmSTsP4oZEy43aOeyn0X9VrzPH0OZRs/h4h0ryprcnvcvFF89GOOzxVHy0BJhPDHt0PlL+6GhM
 MKFFXqY6rrvWbBLLLYMCniYTqdsPMBBtYZtXWD3w+7PjNsKghx/YO0g==
X-Gm-Gg: AYBFou2TojG3JLq9C7hxUm0vOm3i735Zdf3SN0e0IgGAFjDF9zqFX3BjbF2b1fanmc2
 56gW4/NEmy9cW367aXZ2hIjfrRCRLUmy/bDMj6GrpPtVKw/O6Cdj0ZjmdIt8rXC4nNQN+dNM8Lo
 g3eJ3zu+mCVGnOvKF0uM+DrGXSnzOtjnz5YtxIX/STctV4Ykczw1Yfn3M/RfNGLVAOSP6hzJcM/
 0+KnoNHUw6pq+u3zWDlVQogceu3IrLuQaJf2UkvddcFt28EjzvGTenwc2MCGcvZG14ojUlcl82X
 2MJei1phq3XO1OW8hL6T0BEIMGCMy/4lxSapi8MFjtkCimQIjfAn6dhCNkHBS4bwpV7mB4U4UGT
 qgdT/fRQsRP0NWbDIki3tOR+aPoR7bR/VObLpKhze+HG5PgN6
X-Received: by 2002:a05:600c:4e55:b0:49f:bd3c:bc1a with SMTP id
 5b1f17b1804b1-49fe66f506fmr24471845e9.21.1790236332832; 
 Thu, 24 Sep 2026 00:52:12 -0700 (PDT)
X-Received: by 2002:a05:600c:4e55:b0:49f:bd3c:bc1a with SMTP id
 5b1f17b1804b1-49fe66f506fmr24471365e9.21.1790236332485; 
 Thu, 24 Sep 2026 00:52:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c5c41asm91577345e9.4.2026.09.24.00.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 00:52:11 -0700 (PDT)
Message-ID: <9f40a560-dccb-4c14-b6d0-2dfbd64badba@redhat.com>
Date: Thu, 24 Sep 2026 09:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 05/25] target/arm/kvm: read all ID registers from
 KVM
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-6-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-6-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4Ej6QsQhaIVAB8iGQqWgR0ep0ZtazCzsJ0tRn_ELnA_1790236333
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Khushit,

On 9/21/26 2:32 PM, Khushit Shah wrote:
> Try to read all ID registers from KVM. KVM may return ENOENT for
> registers that it does not support reading from userspace; ignore
> those registers. Some registers may still require special handling.
>
> This exposes a more complete host feature view to the management
> stack. For migration, both writable and non-writable ID registers
> must match.
>
> Add a tracepoint for ID register reads that fail with ENOENT.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/kvm.c        | 29 ++++++++++++++---------------
>  target/arm/trace-events |  1 +
>  2 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index f8d349a461..d9d0623a2a 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -330,12 +330,12 @@ static int kvm_feature_idx_to_idregs_idx(int kidx)
>  }
>  
>  /*
> - * get_host_cpu_idregs: Read all the writable ID reg host values
> + * get_host_cpu_idregs: Read all the ID reg host values
>   *
> - * Need to be called once the writable mask has been populated
> - * Note we may want to read all the known id regs but some of them are not
> - * writable and return an error, hence the choice of reading only those which
> - * are writable. Those are also readable!
> + * We currently try to read all the registers. If the read fails with
> + * ENOENT (KVM does not identify the ID register) ignore it.
> + * Some of the registers that errored with ENOENT will anyway need special
> + * handling.
>   */
>  static int get_host_cpu_idregs(int fd, ARMHostCPUFeatures *ahcf)
In the parent series I can add a parameter to select if we want only
writable id regs to be read or all id regs
>  {
> @@ -348,19 +348,18 @@ static int get_host_cpu_idregs(int fd, ARMHostCPUFeatures *ahcf)
>          uint64_t *reg;
>          int ret;
>  
> -        if (!sysregdesc->writable_mask) {
> -            continue;
> -        }
> -
>          reg = &ahcf->isar.idregs[i];
>          ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
> -        trace_get_host_cpu_idregs(sysregdesc->name, *reg);
>          if (ret) {
> -            error_report("%s error reading value of host %s register (%m)",
> -                         __func__, sysregdesc->name);
> -
> -            err = ret;
> +            if (errno == ENOENT) {
> +                trace_get_host_cpu_idreg_not_found(sysregdesc->name);
> +            } else {
> +                error_report("%s error reading value of host %s register"
> +                            " (%m)", __func__, sysregdesc->name);
> +                err = ret;
> +            }
>          }
> +        trace_get_host_cpu_idregs(sysregdesc->name, *reg);
>      }
>      return err;
>  }
> @@ -482,7 +481,7 @@ kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          SET_IDREG(&ahcf->isar, ID_AA64PFR0, 0x00000011); /* EL1&0, AArch64 only */
>          err = 0;
>      } else {
> -        /* Make sure all writable ID reg values are initialized */
> +        /* Try to read all the ID registers */
>          err |= get_host_cpu_idregs(fd, ahcf);
>  
>          /*
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index bbf2e5dfa2..2bb7766f7f 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -14,6 +14,7 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>  # kvm.c
>  kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>  get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
> +get_host_cpu_idreg_not_found(const char *name) "host %s register not readable from KVM"
>  kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
>  kvm_idreg_write_scratch_vcpu(const char *name, uint64_t oldfv, uint64_t newfv, uint64_t actualfv) "successful dry-run for %s old=0x%"PRIx64" new=0x%"PRIx64" actual=0x%"PRIx64
>  
Eric


