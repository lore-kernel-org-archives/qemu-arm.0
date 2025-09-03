Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94339CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 15:41:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utpbw-0004T4-Sv; Wed, 03 Sep 2025 11:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1utpbv-0004SV-2e
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 11:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1utpbr-0002IT-V3
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 11:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756914077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDXIPPdjvwfQ+HHoWg/C8mjLywqyjwXY/dJBQfl0Dj4=;
 b=CFhbNwvpXFACHq2OLK4iGf2GqSq7wuAB02BL8lQHzZIpEJ0KLzgU7SAnuigtoew35dyah8
 QAXn02ENnuZA5dy60SiOKwFNvCvCA4TQPfCFxVct2v7/omJf1XPCPB0bfsfv0C1U/DW6k+
 uDvDU+juCpjEW729guaZsFzYn1Jfh6o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-z1l5dPv5OOCibF7aSj8uuA-1; Wed, 03 Sep 2025 11:41:16 -0400
X-MC-Unique: z1l5dPv5OOCibF7aSj8uuA-1
X-Mimecast-MFC-AGG-ID: z1l5dPv5OOCibF7aSj8uuA_1756914075
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3cdd69ee330so35852f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756914075; x=1757518875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jDXIPPdjvwfQ+HHoWg/C8mjLywqyjwXY/dJBQfl0Dj4=;
 b=CUEniwoWv2bKu+V9NNHD8rHt2wK0T1Zy4/sDqTCFE9YX+EwDhRNDjd1sjeSk4hRRVK
 O9B2xU8CyOnxAMUiLmtboTulQYT3D465dEBig9U0vXObQ8ObEnTDp5/4I/ITdmsRF5ZY
 yBNlu2fWd13RjX2l/wb6Bq23xbZTSInIFlA/ordXvlbd3NTeSv43aDvGo94Uz8RKCli7
 KWZSrMfw7YXlWV1E+sn0MZtxXdpHuo9RPsd09f4HZEbM+dK1A3R3EUt/dK6VqTRBbcWs
 DZ+avx+TV4CxRqjLAu1PERWAVwB2CGdyHodciPDQV5/b4lKE3/wWoEtFw6W4t/9OhdDx
 DxMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW52rbAxxed1CALSqEe4E48D1FXeHmZrqUS32K8Pk89ybmDyK2AD2CNWNvvSn5ooZXrZP31X8mnFw==@nongnu.org
X-Gm-Message-State: AOJu0YxEZRAra0mR1ldolXHXJ3YY3y1VrFsEfcV40kj2sb9nSLIJDBtd
 X9LNgoE5xFxXLi7ZyFXVGxQ+XoxLvwfBCpv9S41va8iLcb6URyN4BpYTlvSXlaHr+TNFHiSAziu
 Ias9NDhS/s9DF9szqbpJVNMM7GjNAFvJ6L7a+VhXDwi5EFhmcRnyLmQ==
X-Gm-Gg: ASbGncvTwcRjMoB6LZGRQ6bXOt41TiQVUdTc14Mj245HcjI0pGKseMCCflo3pa+5tRI
 zIgA8o/Fy6F6EYh+2Hwp11scbK98e+HDaFvcsZF/+IWLHhC9rRRaBxxfjbHWK57/9106ADL1V3k
 qBcv7hNRfaSDY/D/0EopzmzzmxGGAS0ITrW5sDtcedoTwedIEz+138XAAubXAB6va9FExm91VBV
 F0S5ob6uTmcpTpTO7K7UN52HtjhUIEMAVCEWedGBH5znmOUWOoy75awUiqTPEwxYNgmagtCNdS+
 JNoFc4mPgLPIHLaGY0E8LFE6wu1yso4qnGHPLevdxDGdn70DRZqEO7g4IoM5EdpkgM9E1KM4qGN
 KtX7n5y/MbCY=
X-Received: by 2002:a05:6000:2381:b0:3d7:cd09:ae1e with SMTP id
 ffacd0b85a97d-3d7cd09b425mr7095531f8f.17.1756914075214; 
 Wed, 03 Sep 2025 08:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv1wHlAKo/RSP2raZs58PrHepTZWlEOgGPkhEDABpBmIJP3H28QeZ30RVVyRL75SkBliPJfg==
X-Received: by 2002:a05:6000:2381:b0:3d7:cd09:ae1e with SMTP id
 ffacd0b85a97d-3d7cd09b425mr7095505f8f.17.1756914074770; 
 Wed, 03 Sep 2025 08:41:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9c234b24sm59526795e9.16.2025.09.03.08.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:41:14 -0700 (PDT)
Message-ID: <238a1cde-614f-453e-bfba-3fb722d70467@redhat.com>
Date: Wed, 3 Sep 2025 17:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/virt: Remove the lower bound of HighMem IO
 Regions
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20250901-virt-v2-1-ac2379402c80@rsg.ci.i.u-tokyo.ac.jp>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250901-virt-v2-1-ac2379402c80@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2_knq0r44Ozjj_iQNMGe4kn1g_pZaFbzFBcA_dsDXo4_1756914075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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

Hi,
On 9/1/25 2:00 PM, Akihiko Odaki wrote:
> Remove the lower bound of the Highmem IO Regions' addresses for the
> latest machine version to increase the chance to fit the regions in the
> PA space.
>
> The lower bound was especially problematic when using virt-install on
> Apple M2. virt-install 5.0.0 adds multiple pcie-root-port devices that
> require sufficient space in the ECAM region. However, the Highmem ECAM
> region did not fit in the limited PA space on the hardware, and the ECAM
> region size was limited to 16 MiB. If virt-install had added more than
> 16 devices to the root bridge, the region overflowed, which prevented
> edk2-stable202505 from scanning PCI devices, including the boot disk,
> causing boot failures.
>
> Ideally, a virtual machine with more than 16 devices added to the root
> bridge should just work so that users and management layers do not have
> to care whether they use constrained hardware.
>
> The base address of the Highmem IO Regions was fixed when commit
> f90747c4e8fb ("hw/arm/virt: GICv3 DT node with one or two redistributor
> regions") added the first Highmem IO Region. Later, commit 957e32cffa57
> ("hw/arm/virt: Dynamic memory map depending on RAM requirements")
> allowed moving the Highmem IO Regions to higher addresses to accommodate
> RAM more than 255 GiB, but the lower bound remained to keep the legacy
> memory map.
>
> Remove the lower bound for the latest machine version to accommodate more
> devices with the root bridge. Keeping the lower bound for the old
> machine versions ensures the compatibility is still maintained.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
This looks good to me.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
> Changes in v2:
> - Rebased.
> - Link to v1: https://lore.kernel.org/qemu-devel/20250728-virt-v1-1-0ab9682262c8@rsg.ci.i.u-tokyo.ac.jp
> ---
>  include/hw/arm/virt.h |  1 +
>  hw/arm/virt.c         | 16 ++++++++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 365a28b082cae36321ed906d9a13242997fa543a..341eb171d084b911e05b9861b9f4ba516fa2888e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -120,6 +120,7 @@ typedef enum VirtGICType {
>  
>  struct VirtMachineClass {
>      MachineClass parent;
> +    hwaddr min_highmem_base;
>      bool no_tcg_its;
>      bool no_highmem_compact;
>      bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1e63f40fbece3997dedc8aa953957471f930d44c..3cb978dae2ec0cdd9e7b902b3b427dac8a27bebf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1887,6 +1887,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>  static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      hwaddr base, device_memory_base, device_memory_size, memtop;
>      int i;
>  
> @@ -1913,8 +1914,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> -     * is aligned on 1GiB. We never put the high IO region below 256GiB
> -     * so that if maxram_size is < 255GiB we keep the legacy memory map.
> +     * is aligned on 1GiB.
>       * The device region size assumes 1GiB page max alignment per slot.
>       */
>      device_memory_base =
> @@ -1932,8 +1932,8 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>          error_report("maxmem/slots too huge");
>          exit(EXIT_FAILURE);
>      }
> -    if (base < vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES) {
> -        base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
> +    if (base < vmc->min_highmem_base) {
> +        base = vmc->min_highmem_base;
>      }
>  
>      /* We know for sure that at least the memory fits in the PA space */
> @@ -3464,8 +3464,16 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 2)
>  
>  static void virt_machine_10_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_10_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_10_1, hw_compat_10_1_len);
> +
> +    /*
> +     * Do not put the high IO region below 256GiB so that if maxram_size is
> +     * < 255GiB we keep the legacy memory map.
> +     */
> +    vmc->min_highmem_base = base_memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
>  }
>  DEFINE_VIRT_MACHINE(10, 1)
>  
>
> ---
> base-commit: e101d33792530093fa0b0a6e5f43e4d8cfe4581e
> change-id: 20250728-virt-833dafa6c11b
>
> Best regards,


