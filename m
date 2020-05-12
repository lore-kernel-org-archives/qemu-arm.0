Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1210259lfb;
        Tue, 12 May 2020 07:27:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmTBefxsWnxj5F4MH/n89NJeWf3etYBGONf2xNCT65lF6UJIWmqogFPbZWeqfc7f+d6l79
X-Received: by 2002:aed:24ee:: with SMTP id u43mr21741667qtc.178.1589293672724;
        Tue, 12 May 2020 07:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589293672; cv=none;
        d=google.com; s=arc-20160816;
        b=CIjgdXty7AaQ0WvQ6Z7y63sGfksBxpZDI2QUpJm/fOC3tW9pg2sUQfMSW0Z9BzSPd1
         54dHNQ2GIjvZbCJ8f6dglvHTvrW5doe6Ys62Vk3mrmMFVpfpBymA5mhss05W7ivptcnL
         dCyJiA9AxM347a4cOZrwNmmBXw7vdzvoFSXPnGuhffg10nZSQdixQ4DkHPX5w5JcC13F
         r2Wki0PFgUqcpDPo3bXv915MLnbAiyAncZEp82p5CRXrO8M0L8ANIvLHlCTGlPcBF+t1
         L+XE8dsnx8E2wRLHG1TLMxFWKhZYWZV2iWRarKLKIt1kG4whUrMMzgF6QoFPrksM2dfE
         x+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=JsYA3UfWWGLEWCH4BHP5aFK8ZXlS4/Nu+HPnchz77iQ=;
        b=C016LRo6yP7/SS8dy3EtPixrdBtqL+c1+fBRLKI1O0YE3Dd5o34P+D47GD9PAuDy6H
         Uu3aQlNN061Ozr4C8OVoNVCOG5Bsh4A2rLBha5inCJtAUw+GUrf6U/u+I2qf9w/+JPVK
         eN9OEYw+oyEpso1wDlQ5t71fVn/x34CGWektl8tRQCv17IwqORNb9D1rO2q/wyNHeztX
         s48dkLUN+vH1mxJ1OnNF+/gAD7C/PBAiVCz72mI8d6NBzvqWRn9fa5H8ZLjpl8Wj/qMA
         gFGwpeeP65LJl2rJACrY+Oa3HopAO3nTX6E+DR2PGJ4MeQYenDr/2b6ob2Fze/CnOhrE
         /e/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bC2o+1eR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eb10si907822qvb.88.2020.05.12.07.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 07:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bC2o+1eR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYVsu-0005LW-4W
	for alex.bennee@linaro.org; Tue, 12 May 2020 10:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYVsk-0005Jf-Ne
 for qemu-arm@nongnu.org; Tue, 12 May 2020 10:27:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42666
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYVsk-0006ao-0R
 for qemu-arm@nongnu.org; Tue, 12 May 2020 10:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589293661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsYA3UfWWGLEWCH4BHP5aFK8ZXlS4/Nu+HPnchz77iQ=;
 b=bC2o+1eRlSynIZbn5ouU/QUR9V1hgAluzf2+sJaceG4FgLrfOM7Ry8RGJASuHutjQ1U6hx
 0awEAU7ACWwnD3KAx52qbXSwj6T2cK8gbhBVwUhP8lOjMWIkJ1kgkfl+h5+TsFixDUZrKx
 Bt+cVYRwfNJvzWEDMUVBeR/b7ympel0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-JzmwzjHXMHub1n_O_7IQ_w-1; Tue, 12 May 2020 10:27:37 -0400
X-MC-Unique: JzmwzjHXMHub1n_O_7IQ_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 415268014D5;
 Tue, 12 May 2020 14:27:36 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 621AC7D92A;
 Tue, 12 May 2020 14:27:21 +0000 (UTC)
Date: Tue, 12 May 2020 16:27:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/3] arm/acpi: TPM2 ACPI table support
Message-ID: <20200512162716.7a4204dd@redhat.com>
In-Reply-To: <20200505144419.29174-3-eric.auger@redhat.com>
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-3-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:20:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QFuuNZ1IYZos

On Tue,  5 May 2020 16:44:18 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a TPM2 ACPI table if a TPM2.0 sysbus device has been
> dynamically instantiated.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

on x86 we also do:

  fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,                       
                  tables.tcpalog->data, acpi_data_len(tables.tcpalog)); 

question is why it's not necessary in case of ARM?

> 
> ---
> 
> v1 -> v2:
> - reuse generic build_tpm2() and alloc log area externally
> - call tpm_find() once in build_tpm2()
> ---
>  include/sysemu/tpm.h     |  2 ++
>  hw/acpi/aml-build.c      |  5 +++--
>  hw/arm/virt-acpi-build.c | 11 +++++++++++
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index f37851b1aa..03fb25941c 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -50,6 +50,8 @@ typedef struct TPMIfClass {
>  
>  #define TPM_IS_TIS_ISA(chr)                         \
>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
> +#define TPM_IS_TIS_SYSBUS(chr)                      \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
>  #define TPM_IS_CRB(chr)                             \
>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>  #define TPM_IS_SPAPR(chr)                           \
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 1f7fd09112..4224675cb2 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1882,12 +1882,13 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>      unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
>      unsigned log_addr_offset =
>          (char *)&tpm2_ptr->log_area_start_address - table_data->data;
> +    TPMIf *tpmif = tpm_find();
>  
>      tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
> -    if (TPM_IS_TIS_ISA(tpm_find())) {
> +    if (TPM_IS_TIS_ISA(tpmif) || TPM_IS_TIS_SYSBUS(tpmif)) {
>          tpm2_ptr->control_area_address = cpu_to_le64(0);
>          tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
> -    } else if (TPM_IS_CRB(tpm_find())) {
> +    } else if (TPM_IS_CRB(tpmif)) {
>          tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
>          tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
>      } else {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 81d41a3990..1a2ec10c8f 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -41,11 +41,13 @@
>  #include "hw/acpi/pci.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/generic_event_device.h"
> +#include "hw/acpi/tpm.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/reset.h"
> +#include "sysemu/tpm.h"
>  #include "kvm_arm.h"
>  #include "migration/vmstate.h"
>  
> @@ -831,6 +833,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          build_iort(tables_blob, tables->linker, vms);
>      }
>  
> +    if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
> +        acpi_data_push(tables->tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
> +        bios_linker_loader_alloc(tables->linker, ACPI_BUILD_TPMLOG_FILE,
> +                                 tables->tcpalog, 1, false);
> +
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
> +    }
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);

