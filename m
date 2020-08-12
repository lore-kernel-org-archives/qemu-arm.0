Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1286130lfy;
        Wed, 12 Aug 2020 03:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm7qp/flrWDKyr+1wo3ksMn/MiC7Xx++Gu5XGG/Vm8QwN8wqBeptXbnncC0IMJtylEla7C
X-Received: by 2002:a25:9785:: with SMTP id i5mr52103968ybo.255.1597227434773;
        Wed, 12 Aug 2020 03:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597227434; cv=none;
        d=google.com; s=arc-20160816;
        b=o6LspK6BbtdBAhU72MBqC8yFg7hMNc1GXhTbDOHVnZA8JwpXLxhmpCowqHj8NWgifR
         3Y6HBtDHsSP5tQo+uUZGy/08IAwUEfSxoLWe8x8u6a45Lcq3e7RGLEpVSgH9FykbFCCe
         GpPDnoPbN0bNrpJyhBxXDzCR2NpmSvriB4r9/dKKurwVKtqMPuQ592qfGmOgAC19Sd5/
         5z5v+WwOzfpD2xBzsJbAaqAhDq+Hqrdgzm38rqXf3siMiJ4ROoLWCnhUciBEb5oXpceJ
         Ah+DmyD5A/1fPc74R5cgEiLoiCid8b30Ak+r/bybGYP/FxuatD//yI+xv/qlOs5qxoA9
         2SmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MnzlaKYNFz3iMfZp5mbtBo4BFRY9OVwtNVkAp9nZtZc=;
        b=g5FRQyScXG7fHfxcqZGvpeA7asojha4BRjrSft910JcQqtOs1S1pxuDXbSXkmJWfFy
         A53RF8L64wiH8xaczFPuoPcXyobCpEYWGNiGRypHE2pSqcroNjhM2xQahCGbiUdikB9q
         LJPY/cN62uE6sf3yHS0VMyoAbwqvLu9QxL6U81aGmndHtp2DjXd3NseHLr9bCbm3QNUD
         MhwcSazbvGQdilZzAToxrx1cMVuvjD5m0mYkByIeNCQEP2ziYScYvGQVF/3tbfBIBlmc
         pHL3/Q6d7H/7SnLB6AxX/+4DQ+g6JpFS2nFvn1WVgkUFN9LfDjwP8+WI4nqE3wLy89/o
         c+Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hgEMec2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si1855053ybc.111.2020.08.12.03.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 03:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hgEMec2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5non-0007qn-10
	for alex.bennee@linaro.org; Wed, 12 Aug 2020 06:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k5noM-0007ni-7J
 for qemu-arm@nongnu.org; Wed, 12 Aug 2020 06:16:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43244
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k5noK-00031C-Ko
 for qemu-arm@nongnu.org; Wed, 12 Aug 2020 06:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597227404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MnzlaKYNFz3iMfZp5mbtBo4BFRY9OVwtNVkAp9nZtZc=;
 b=hgEMec2ujuCw46aO15FWMMMrL374Opk3UI7XAoDVIcg4Mxa2obRiOdfl0GaGbgPHxA8XTd
 RJFo7/pl0ptLCVi3jWHrktFas2ft4MTLLut/hTftr3w3+DjBImhdcv5swe6oIEiNgYV4KE
 VSTy/D3YLeP7a5YP8xvMq8+9K6EF7zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-ryhu08r7PS6tzJ3S7RR1AQ-1; Wed, 12 Aug 2020 06:16:40 -0400
X-MC-Unique: ryhu08r7PS6tzJ3S7RR1AQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A26558017F4;
 Wed, 12 Aug 2020 10:16:39 +0000 (UTC)
Received: from [10.36.113.93] (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4FC55D6BD;
 Wed, 12 Aug 2020 10:16:38 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] hw/arm/virt: Move post cpu realize check into its
 own function
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200805091640.11134-1-drjones@redhat.com>
 <20200805091640.11134-4-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4b456c14-5eae-aad2-45a2-5e23c5ff47f9@redhat.com>
Date: Wed, 12 Aug 2020 12:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200805091640.11134-4-drjones@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqc88b4+nE+f

Hi Drew,

On 8/5/20 11:16 AM, Andrew Jones wrote:
> We'll add more to this new function in coming patches so we also
> state the gic must be created and call it below create_gic().
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 43 +++++++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index acf9bfbeceaf..2cba21fe3ad9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1672,6 +1672,31 @@ static void finalize_gic_version(VirtMachineState *vms)
>      }
>  }
>  
> +/*
> + * virt_cpu_post_init() must be called after the CPUs have
> + * been realized and the GIC has been created.
> + */
> +static void virt_cpu_post_init(VirtMachineState *vms)
> +{
> +    bool aarch64;
> +
> +    aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> +
> +    if (!kvm_enabled()) {
> +        if (aarch64 && vms->highmem) {
> +            int requested_pa_size = 64 - clz64(vms->highest_gpa);
> +            int pamax = arm_pamax(ARM_CPU(first_cpu));
> +
> +            if (pamax < requested_pa_size) {
> +                error_report("VCPU supports less PA bits (%d) than "
> +                             "requested by the memory map (%d)",
> +                             pamax, requested_pa_size);
> +                exit(1);
> +            }
> +        }
> +    }
> +}
> +
>  static void machvirt_init(MachineState *machine)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(machine);
> @@ -1886,22 +1911,6 @@ static void machvirt_init(MachineState *machine)
>      fdt_add_timer_nodes(vms);
>      fdt_add_cpu_nodes(vms);
>  
> -   if (!kvm_enabled()) {
> -        ARMCPU *cpu = ARM_CPU(first_cpu);
> -        bool aarch64 = object_property_get_bool(OBJECT(cpu), "aarch64", NULL);
> -
> -        if (aarch64 && vms->highmem) {
> -            int requested_pa_size, pamax = arm_pamax(cpu);
> -
> -            requested_pa_size = 64 - clz64(vms->highest_gpa);
> -            if (pamax < requested_pa_size) {
> -                error_report("VCPU supports less PA bits (%d) than requested "
> -                            "by the memory map (%d)", pamax, requested_pa_size);
> -                exit(1);
> -            }
> -        }
> -    }
> -
>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
>                                  machine->ram);
>      if (machine->device_memory) {
> @@ -1913,6 +1922,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_gic(vms);
>  
> +    virt_cpu_post_init(vms);
> +
>      fdt_add_pmu_nodes(vms);
>  
>      create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
> 

