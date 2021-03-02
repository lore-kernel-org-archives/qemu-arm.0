Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4609626lfg;
        Tue, 2 Mar 2021 08:23:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR1QwHPaWX5PIQSDO0Tv5RIeYSgYfZwib6H40RZ2gpPhS8IXBrEZC4uqVw/9AnzEE8Yxkd
X-Received: by 2002:aca:bf0a:: with SMTP id p10mr3784763oif.97.1614702231107;
        Tue, 02 Mar 2021 08:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614702231; cv=none;
        d=google.com; s=arc-20160816;
        b=YZed6E+nqz2TI2he7q2hyEbYx0hyRnUcmLoberS2aHtDkOJIqYfoM/nxH/5FcBwinm
         tyQqwqouROp2FRaJcFoZph1m6fBd0PeuK+ORPJE8kGbtyveHO1NgAakvdB1vrdor5TKK
         leATXXtW9oA/phNqj6HvLYgTtOsSi0jhFkYIDu7Cv/hCL5/7zSzOe8U/7PDHCAVHDWY+
         aqnxsh2knl0RIp5pbRwZPJzbDzSEpvEBJKC5gbbSbeU0VmMvJDrL+TYxdGfgMlM6j6jK
         RHJflqwKS96r0NM++cvg/H9KDqUTuyKPJzqfgXCFNYOGeG9rGXFXShdCdkuzMB56MMXg
         dVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=fAOW4ZIEOKGBdHkFJZZpoIk1h+dZtH9CxaZJptfLmNc=;
        b=fbTdpR2qNDIzj85jlHMv2A8WhoG4K9IR3x66sJxO2RSBtHDud1MjZmBGQ7oP9TvhVy
         ybrdXbmxBTSsY3Z4NtmnQPcoAZniSQ08ebXS1IGkiyU6JjM6/Y05jyCG3aVth20SpWs8
         KNDWc+a+ySP2VmDiF27u+YF8CWHUbx3p1NzPaPwJubrNe0J3ewEagyx9pUodNeJTvpzT
         n3PeCWUwitkr1p+LvrU/6fPPS2Qsnc1zA73LzavlFMKUiJePDyJwJeEmABkrMrVxXgOL
         SPiST7OhB8m3BZGc3JHDibowoNs5S4ZyDzGT58Pce1WtLj8RGtANdHCOl1HgYhIjinGx
         H6EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zv6TgWq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si16652646oos.46.2021.03.02.08.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 08:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zv6TgWq2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH7oM-00030y-Aa
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 11:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lH7oE-00030l-CG
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 11:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lH7oC-0000qF-CZ
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 11:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614702219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAOW4ZIEOKGBdHkFJZZpoIk1h+dZtH9CxaZJptfLmNc=;
 b=Zv6TgWq2Jh3Azs/cRYyWbB7H48VnTZtNHR8cfu6LIHUVkFXg/yPI3iZ/N1HgGIPPWZHH6n
 0/5TrOx/B5KfQe0o422aXGYe4ctVcTR+SmEGl9I4gnaG/5OIW5t4ns/mvLwBgS++nUYxie
 zeQc+dgYaDop9DLfKwrged0SGVv6VZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306--J0OBTj4ONaQaYx8xte0og-1; Tue, 02 Mar 2021 11:23:37 -0500
X-MC-Unique: -J0OBTj4ONaQaYx8xte0og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 956061E565;
 Tue,  2 Mar 2021 16:23:36 +0000 (UTC)
Received: from MiWiFi-RA69-srv (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DD5E19D80;
 Tue,  2 Mar 2021 16:23:25 +0000 (UTC)
Date: Tue, 2 Mar 2021 17:23:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210302172323.6cac394a@MiWiFi-RA69-srv>
In-Reply-To: <20210301104833.45580-1-david@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bqh5+1HQM/IA

On Mon,  1 Mar 2021 11:48:33 +0100
David Hildenbrand <david@redhat.com> wrote:

CCing Laszlo,

to make sure there is no complications from firmware side
(especially when migration is progress, we've ironed it out for main tables blob
but my memory is a bit fussy about issues we had to deal with if there were any)

> The resizeable memory region that is created for the cmd blob has a maximum
> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
> we require more than 4k and can crash QEMU when trying to resize the
> resizeable memory region beyond its maximum size:
>   $ build/qemu-system-x86_64 --enable-kvm \
>       -machine q35,nvdimm=on \
>       -smp 1 \
>       -cpu host \
>       -m size=2G,slots=8,maxmem=4G \
>       -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
>       -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
>       -nodefaults \
>       -device vmgenid \
>       -device intel-iommu
> 
> Results in:
>   Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
>   qemu-system-x86_64: Size too large: /rom@etc/table-loader:
>     0x2000 > 0x1000: Invalid argument
> 
> We try growing the resizeable memory region (resizeable RAMBlock) beyond
> its maximum size. Let's increase the maximum size from 4k to 64k, which
> should be good enough for the near future.
> 
> Migration is not concerned with the maximum size of a RAMBlock, only
> with the used size - so existing setups are not affected. Of course, we
> cannot migrate a VM that would have crash when started on older QEMU from
> new QEMU to older QEMU without failing early on the destination when
> synchronizing the RAM state:
>     qemu-system-x86_64: Size too large: /rom@etc/table-loader: 0x2000 > 0x1000: Invalid argument
>     qemu-system-x86_64: error while loading state for instance 0x0 of device 'ram'
>     qemu-system-x86_64: load of migration failed: Invalid argument
> 
> While at it, replace "etc/table-loader" by ACPI_BUILD_LOADER_FILE in
> the microvm.
> 
> Note: we could warn for problematic setups that migration might not
> always be possible - similar to how we handle the table blob; or we
> could disallow setups that would have crashed until now for compat
> machines. But I am not sure if the effort (messing compat machine
> properties) is worth it as we fail migration in a safe way early.
> 
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c    | 3 ++-
>  hw/i386/acpi-build.c        | 3 ++-
>  hw/i386/acpi-microvm.c      | 3 ++-
>  include/hw/acpi/aml-build.h | 1 +
>  4 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f9c9df916c..a91550de6f 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -865,7 +865,8 @@ void virt_acpi_setup(VirtMachineState *vms)
>  
>      build_state->linker_mr =
>          acpi_add_rom_blob(virt_acpi_build_update, build_state,
> -                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
> +                          ACPI_BUILD_LOADER_MAX_SIZE);
>  
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 31a5f6f4a5..a75138ea5a 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2524,7 +2524,8 @@ void acpi_setup(void)
>  
>      build_state->linker_mr =
>          acpi_add_rom_blob(acpi_build_update, build_state,
> -                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
> +                          ACPI_BUILD_LOADER_MAX_SIZE);
>  
>      fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 54b3af478a..fe8a965fe6 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
>                        ACPI_BUILD_TABLE_MAX_SIZE);
>      acpi_add_rom_blob(acpi_build_no_update, NULL,
>                        tables.linker->cmd_blob,
> -                      "etc/table-loader", 0);
> +                      ACPI_BUILD_LOADER_FILE,
> +                      ACPI_BUILD_LOADER_MAX_SIZE);
>      acpi_add_rom_blob(acpi_build_no_update, NULL,
>                        tables.rsdp,
>                        ACPI_BUILD_RSDP_FILE, 0);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 380d3e3924..93cdfd4006 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -6,6 +6,7 @@
>  
>  /* Reserve RAM space for tables: add another order of magnitude. */
>  #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
> +#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
>  
>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>  #define ACPI_BUILD_APPNAME8 "BXPC    "

