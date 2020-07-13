Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3082993lfm;
        Mon, 13 Jul 2020 01:49:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrfv8VmY81ESKO/oERgcBhwOLvYgIrG6xsLP2cFcDwvjLrODjf1Itu91FlHlU3g/2yJSql
X-Received: by 2002:a25:d046:: with SMTP id h67mr37732578ybg.458.1594630176753;
        Mon, 13 Jul 2020 01:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594630176; cv=none;
        d=google.com; s=arc-20160816;
        b=DJVYo2w523ctNXnHSWD9+Xdm7rK5RopNYoUaF9syl43RmfxoAH+abmrH0OPzv+GQ1H
         Z43nhK64Gv0YzQaRd3zduWeiO9ivHw9y4ZkfZj2SRzS5/RtEp/dw1RVv9Q9b9FIRTS0G
         sWNMQqrerPlhQ6lVCa6AvmaBWOU0blhMWoFtcsPgDfn+x53W3FvbnBMyd12xcWRfjs/S
         UtxMntZzrD34gHp8iSkhUCm0DM/XWONA3036gNCid5qdftGJExCLRcstp0V3DFkhihrC
         N78kQRvV9v9lZWZXi9MIQctTCKFfsRHtJvuzMr/c6efAJNTihWMAxG2X/nTNZEkZfImE
         0D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=PW90HBsCIGJfz8DaHaQi+pvUgYz2IHzp5BGt2uL4i/0=;
        b=MsqvcOfkKuVcNATP08/dSJtWvb0hgfgtfAJ5o/8Tn+6adt4Maq1iBx7qh0B2a8INxS
         Gzra0aNB7fB83tQwWCGs2/PObk9KK3cVsyzKrdI5k7vHtYgxO7Llap6ThvjUFZ8GRa0R
         Q4cwBv2aKLKalXKb8M/nG9r36Gonk85mYLkz8i3n2/djfH3IZ3m9gxtoHp00rJ7deivr
         dx3feMgEOGyoRUsaw4bHlTwYkuRqcKPnFXHpjd7YEbu0SrBjIKrukLrmfCnnwuTxCqiG
         5gPGTj9d7xMMxskansXPxfZRzHwk6PGqUEI0aeKf+/m+7owqY84+4cBfykRS6WwJ6Qp7
         914g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ib8x3zFC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si12999982ybb.99.2020.07.13.01.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 01:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ib8x3zFC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juu9Y-0006Bv-5K
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 04:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1juu9P-000688-Ly
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 04:49:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57264
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1juu9O-0001PU-1V
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 04:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594630165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PW90HBsCIGJfz8DaHaQi+pvUgYz2IHzp5BGt2uL4i/0=;
 b=Ib8x3zFCGrBOs6MNjYUkKj+cCV/KVDqEygr1UfdcrPWjXNUERKCXMjLyu6YD5kVMc6B2/6
 +KyGCwO/YiFYVhpv4exNxcJoFqopXBcawxNNXB0NltRlJtrJczSHyU4XLv/fP4Tp+cCwfV
 hO4YGiTxCYd2Wp9RK1e1jEXoFEtt2hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ANNcMN3hPxyOpf3luDd6tA-1; Mon, 13 Jul 2020 04:49:21 -0400
X-MC-Unique: ANNcMN3hPxyOpf3luDd6tA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 992E1100CCC0;
 Mon, 13 Jul 2020 08:49:20 +0000 (UTC)
Received: from localhost (unknown [10.40.208.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 040422E020;
 Mon, 13 Jul 2020 08:49:09 +0000 (UTC)
Date: Mon, 13 Jul 2020 10:49:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Message-ID: <20200713104907.335bf762@redhat.com>
In-Reply-To: <20200629140938.17566-4-drjones@redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 01:36:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ard.biesheuvel@arm.com, lersek@redhat.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jh9w9LPMwYKB

On Mon, 29 Jun 2020 16:09:37 +0200
Andrew Jones <drjones@redhat.com> wrote:

> The flash device is exclusively for the host-controlled firmware, so
> we should not expose it to the OS. Exposing it risks the OS messing
> with it, which could break firmware runtime services and surprise the
> OS when all its changes disappear after reboot.
> 
> As firmware needs the device and uses DT, we leave the device exposed
> there. It's up to firmware to remove the nodes from DT before sending
> it on to the OS. However, there's no need to force firmware to remove
> tables from ACPI (which it doesn't know how to do anyway), so we
> simply don't add the tables in the first place. But, as we've been
> adding the tables for quite some time and don't want to change the
> default hardware exposed to versioned machines, then we only stop
> exposing the flash device tables for 5.1 and later machine types.
> 
> Suggested-by: Ard Biesheuvel <ard.biesheuvel@arm.com>
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 5 ++++-
>  hw/arm/virt.c            | 3 +++
>  include/hw/arm/virt.h    | 1 +
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1384a2cf2ab4..91f0df7b13a3 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -749,6 +749,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      Aml *scope, *dsdt;
>      MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
> @@ -767,7 +768,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> -    acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> +    if (vmc->acpi_expose_flash) {
> +        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> +    }
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cd0834ce7faf..5adc9ff799ef 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2482,9 +2482,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
>  
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_5_1_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
>      mc->numa_mem_supported = true;
> +    vmc->acpi_expose_flash = true;

we usually do not version ACPI tables changes
(unless we have a good reason to do so)

>  }
>  DEFINE_VIRT_MACHINE(5, 0)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 31878ddc7223..c65be5fe0bb6 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -119,6 +119,7 @@ typedef struct {
>      bool no_highmem_ecam;
>      bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
>      bool kvm_no_adjvtime;
> +    bool acpi_expose_flash;
>  } VirtMachineClass;
>  
>  typedef struct {

