Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F118C83F0F
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:48:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFC1-0006yk-O6; Tue, 08 Jul 2025 16:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDmB-0003Mp-Ss
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDm3-0006rR-CO
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752002077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCc6X7dKrB7u2+4+jJD84N05Emla9+M/j2i1RXjqv8I=;
 b=F1vqHJBaepDcDeFwp8EIMUOhc6X11+bv2vZJsmHsY6izpRx+w/vHzc0lsdVlsDThwT6DbD
 xC83UErnzhKongJwNZM9vDDYIdGmKPFUt6whOfPNBDFSlM/fWN7ihxdN101z+Kz0ExJkCB
 uM1nbpHMw+ctTxCVXAsd5KDyHGcwl5Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-wBNvqjBBO0ieDMO0zu2n9A-1; Tue, 08 Jul 2025 12:00:26 -0400
X-MC-Unique: wBNvqjBBO0ieDMO0zu2n9A-1
X-Mimecast-MFC-AGG-ID: wBNvqjBBO0ieDMO0zu2n9A_1751990425
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45359bfe631so24722775e9.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 09:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751990425; x=1752595225;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iCc6X7dKrB7u2+4+jJD84N05Emla9+M/j2i1RXjqv8I=;
 b=CVjBQ+Geo0hnjz+LszTuqfmFEllNtE0g7OqCN+7OoooYiJSYw/8n+6w8Bapk5iqiFo
 Fd4i5p//KoTcwQX//NJdrlxbgbA7Nk793LjUISv4LX7rPbKq8EYLaFExq4/P4kT3TNdQ
 T4dQ6oCq1pMgHD0p7YTcpZSWHp/iALrRfe8TGGiv1D79RNrXEbqNeGcTziJ3KvkyeUsJ
 J3oB13nxSTEbe7s7y4HPbE5UxkK6yNih0zf0lBU7b2XddGRGX9iPtV1NCak5ypd4+KIa
 465CmWRgRyHhBkRbRqY/Z+atksmOopyMOjuePE72OfZjDs1Fs2ncuCehqECZas6Nvgk/
 gCUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8WszSAxdbrAmGCR5k4lCu29OFsu4TA0TKHBxp//m73zQBdluxo1JR2Q+BGrVEA6E3xG0NoZ6sSw==@nongnu.org
X-Gm-Message-State: AOJu0YxBoO7KoGJ+FpFMIEKqq4tplUQ32Qe+CIL3dWIkRAi9kPV5zVlZ
 P8Fxh3GHhCwIL0TMjRQKdkhRqtlL+fS1MpvbZT/iWbEXR9I5JnFwn4i2aB7eSG/0zua9gp57PFG
 XCO6CgpAz+1m4/nbNSEv/rJLnbFKpEh/PSsnl+7ZSEFKXmCBaOvSbEg==
X-Gm-Gg: ASbGncvItQCJ8vdFL0kLESxcsCJqqGKkNIJJ70A8/WWhQMZo7JESn0wjNcRlh3TQsoR
 iMzgfWe1Uvbf2yLsFlVv+vHIITSoJrDNiu+esFjNqcdgityB16Xz0dDLykAW+Nn0x2a1DM+PV7g
 XJYofm93f0MJa5G+d1pc7yi9zPiI9vVTRVibQu64V1uo0YdSrTjAJoNTJUB563kKXlk+sCK1741
 v8r/bnEaeoaPKib5vyt1e+NCJKyYCRkd33VIvCTpGNpt8zaumpslh8EZYSYCv53wWTP7Wr+FwOK
 HQG1PmwqlwLRn97yG0ydIfGhWgdClQ+HNRuouGDnJlLIOALQGPLz49RhYtJtErAVetCKFg==
X-Received: by 2002:a05:600c:35c2:b0:450:cabd:160 with SMTP id
 5b1f17b1804b1-454d3602f38mr2405225e9.3.1751990425077; 
 Tue, 08 Jul 2025 09:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGxT0GTl8h4OS+FpF8eC67m1mWUN5OrpfFNyzPe1fyP038ONeVUHWCWuXIL13Pln8E9b0Lqg==
X-Received: by 2002:a05:600c:35c2:b0:450:cabd:160 with SMTP id
 5b1f17b1804b1-454d3602f38mr2404685e9.3.1751990424560; 
 Tue, 08 Jul 2025 09:00:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd3d275fsm25890455e9.20.2025.07.08.09.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 09:00:23 -0700 (PDT)
Message-ID: <238ba0c1-3212-4903-9222-0b099342ff5a@redhat.com>
Date: Tue, 8 Jul 2025 18:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hw/intc/arm_gicv3_kvm: Migrate GICD_TYPER2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250708115238.667050-1-peter.maydell@linaro.org>
 <20250708115238.667050-3-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250708115238.667050-3-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: utyw3CKsLDfSEo57LdhYl2DZB7XCvJWsbo1lww24X7c_1751990425
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Peter,

On 7/8/25 1:52 PM, Peter Maydell wrote:
> The GICD_TYPER2 register is new for GICv4.1.  As an ID register, we
> migrate it so that on the destination the kernel can check that the
> destination supports the same configuration that the source system
> had.  This avoids confusing behaviour if the user tries to migrate a
> VM from a GICv3 system to a GICv4.1 system or vice-versa.  (In
> practice the inability to migrate between different CPU types
> probably already prevented this.)
>
> Note that older kernels pre-dating GICv4.1 support in the KVM GIC
> will just ignore whatever userspace writes to GICD_TYPER2, so
> migration where the destination is one of those kernels won't have
> this safety-check.
>
> (The reporting of a mismatch will be a bit clunky, because this
> file currently uses error_abort for all failures to write the
> data to the kernel. Ideally we would fix this by making them
> propagate the failure information back up to the post_load hook
> return value, to cause a migration failure.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Looks good to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric
> ---
> v1->v2:
>  * fix comment missing bracket
>  * fix reset handling so this works on GICv4.1 hosts
>  * move get/put code to be with the other GICD regs
> ---
>  include/hw/intc/arm_gicv3_common.h |  6 ++++++
>  hw/intc/arm_gicv3_common.c         | 24 ++++++++++++++++++++++++
>  hw/intc/arm_gicv3_kvm.c            | 25 +++++++++++++++++++++++--
>  3 files changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index a3d6a0e5077..bcbcae1fbe7 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -267,6 +267,12 @@ struct GICv3State {
>      GICv3CPUState *gicd_irouter_target[GICV3_MAXIRQ];
>      uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
>  
> +    /*
> +     * GICv4.1 extended ID information. This is currently only needed
> +     * for migration of a KVM GIC.
> +     */
> +    uint32_t gicd_typer2;
> +
>      GICv3CPUState *cpu;
>      /* List of all ITSes connected to this GIC */
>      GPtrArray *itslist;
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 1cee68193ca..7b09771310e 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -275,6 +275,29 @@ const VMStateDescription vmstate_gicv3_gicd_nmi = {
>      }
>  };
>  
> +static bool gicv3_typer2_needed(void *opaque)
> +{
> +    /*
> +     * GICD_TYPER2 ID register for GICv4.1. Was RES0 for
> +     * GICv3 and GICv4.0; don't migrate if zero for backwards
> +     * compatibility.
> +     */
> +    GICv3State *cs = opaque;
> +
> +    return cs->gicd_typer2 != 0;
> +}
> +
> +const VMStateDescription vmstate_gicv3_gicd_typer2 = {
> +    .name = "arm_gicv3/gicd_typer2",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = gicv3_typer2_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT32(gicd_typer2, GICv3State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gicv3 = {
>      .name = "arm_gicv3",
>      .version_id = 1,
> @@ -304,6 +327,7 @@ static const VMStateDescription vmstate_gicv3 = {
>      .subsections = (const VMStateDescription * const []) {
>          &vmstate_gicv3_gicd_no_migration_shift_bug,
>          &vmstate_gicv3_gicd_nmi,
> +        &vmstate_gicv3_gicd_typer2,
>          NULL
>      }
>  };
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 3be3bf6c28d..8e34d08b415 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -405,7 +405,16 @@ static void kvm_arm_gicv3_put(GICv3State *s)
>          }
>      }
>  
> -    /* Distributor state (shared between all CPUs */
> +    /* Distributor state (shared between all CPUs) */
> +
> +    /*
> +     * This ID register is restored so that the kernel can fail
> +     * the write if the migration source is GICv4.1 but the
> +     * destination is not.
> +     */
> +    reg = s->gicd_typer2;
> +    kvm_gicd_access(s, GICD_TYPER2, &reg, true);
> +
>      reg = s->gicd_statusr[GICV3_NS];
>      kvm_gicd_access(s, GICD_STATUSR, &reg, true);
>  
> @@ -572,7 +581,10 @@ static void kvm_arm_gicv3_get(GICv3State *s)
>          }
>      }
>  
> -    /* Distributor state (shared between all CPUs */
> +    /* Distributor state (shared between all CPUs) */
> +
> +    kvm_gicd_access(s, GICD_TYPER2, &reg, false);
> +    s->gicd_typer2 = reg;
>  
>      kvm_gicd_access(s, GICD_STATUSR, &reg, false);
>      s->gicd_statusr[GICV3_NS] = reg;
> @@ -707,6 +719,7 @@ static void kvm_arm_gicv3_reset_hold(Object *obj, ResetType type)
>  {
>      GICv3State *s = ARM_GICV3_COMMON(obj);
>      KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
> +    uint32_t reg;
>  
>      DPRINTF("Reset\n");
>  
> @@ -719,6 +732,14 @@ static void kvm_arm_gicv3_reset_hold(Object *obj, ResetType type)
>          return;
>      }
>  
> +    /*
> +     * The reset value of the GICD_TYPER2 ID register should be whatever
> +     * the kernel says it is; otherwise the attempt to put the value
> +     * in kvm_arm_gicv3_put() will fail.
> +     */
> +    kvm_gicd_access(s, GICD_TYPER2, &reg, false);
> +    s->gicd_typer2 = reg;
> +
>      kvm_arm_gicv3_put(s);
>  }
>  


