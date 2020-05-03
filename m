Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2890185lfm;
        Sun, 3 May 2020 07:13:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzViRAPpPul9KRCk0k7gRXCdKeIFwrla/GWOngVmw+RlaTSuexMJk9S3W8sg92pY1j0eQB
X-Received: by 2002:a05:620a:41a:: with SMTP id 26mr5548834qkp.421.1588515197841;
        Sun, 03 May 2020 07:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588515197; cv=none;
        d=google.com; s=arc-20160816;
        b=cNEixb0mOGGudTjcxoaNXgUopI1rkJFwQmxTBNJLkglHQbCKkAN0vaWQvC1bv64JEa
         1+SKDuDq5pXMuU8YScqWS8Txwb73wFX9Fe01MQ81vQrjyq5BoIInuGsEdyt16SG8Mp6A
         WcKFfWWA01Z0WefqzX0eNvhZoRLCzQXg+SptDvhKDqLTOc3aR4k5UwRJlyrnZ869lusC
         T0oC3DgdoM+CJrDbIKpM+jBQWx2yrkHECgHgeAFoBcHrw1fVF10AlhAdzp7P3e0a5kuK
         V6OBtaOuPavnSFh/l/b4862JUoqoprk+n9ptYDj4pn3v72W+sYQnXGNEAZLYqGfQFDta
         Wzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=drMVBr2+k+ADMFBVJBEm8Ge1mJbA4EWs/HPIKB4V4Pg=;
        b=Pp3Y1QZwtR6mJny7UXBTCbC89iYwlT4WPGgtDYdXbA4WLLQ10zys929QMw1BH/RRKK
         po5d8rMD4xuvbeUg5FbqXDP2p0oowVEVP2pMXt/wzW55WQhJIh322cH53zpurldUk4ve
         bi8C1p2GNUmOEIuivG7DISc1RA2Y0oIwRYsmqnP+wKBhsCv98uesYfmhfpmFyDZTIKN9
         cRc9sADG8zGjRiSbcQ3ffJLRPWJiSJdp+mFCm4d/YHhs66yOCeI4to51CR0W5S1FzPOD
         RfqpFiCImyG6GV8GMrUMtIjOP3r+YSI7p9IRfvCUQ5axcKjMbBK5K5HjIqVuvtMNTJam
         Ggng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w14si5128939qvl.38.2020.05.03.07.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 May 2020 07:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:44348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVFMr-0000zu-6u
	for alex.bennee@linaro.org; Sun, 03 May 2020 10:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jVFMk-0000xz-3H; Sun, 03 May 2020 10:13:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jVFMi-0004ny-SW; Sun, 03 May 2020 10:13:09 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 043E1XD0051339; Sun, 3 May 2020 10:13:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s36a0g2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 03 May 2020 10:13:04 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 043E82TB062443;
 Sun, 3 May 2020 10:13:03 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s36a0g1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 03 May 2020 10:13:03 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 043E5lhc014974;
 Sun, 3 May 2020 14:13:01 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g5t0s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 03 May 2020 14:13:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 043ED05i10945128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 3 May 2020 14:13:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0940AC05E;
 Sun,  3 May 2020 14:13:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAC3AAC059;
 Sun,  3 May 2020 14:13:00 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun,  3 May 2020 14:13:00 +0000 (GMT)
Subject: Re: [PATCH 1/2] arm/acpi: TPM2 ACPI table support
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
References: <20200502203536.15011-1-eric.auger@redhat.com>
 <20200502203536.15011-2-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <d043412a-c028-c4f7-3415-b9467bd2657c@linux.ibm.com>
Date: Sun, 3 May 2020 10:13:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200502203536.15011-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-03_09:2020-05-01,
 2020-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005030122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/03 10:13:06
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4wlYf+DY+LFo

On 5/2/20 4:35 PM, Eric Auger wrote:
> Add a TPM2 ACPI table if a TPM2.0 sysbus device has been
> dynamically instantiated.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/sysemu/tpm.h     |  2 ++
>   hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)
>
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index f37851b1aa..03fb25941c 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -50,6 +50,8 @@ typedef struct TPMIfClass {
>   
>   #define TPM_IS_TIS_ISA(chr)                         \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
> +#define TPM_IS_TIS_SYSBUS(chr)                      \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
>   #define TPM_IS_CRB(chr)                             \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>   #define TPM_IS_SPAPR(chr)                           \
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 81d41a3990..cc5863eaf2 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -41,11 +41,13 @@
>   #include "hw/acpi/pci.h"
>   #include "hw/acpi/memory_hotplug.h"
>   #include "hw/acpi/generic_event_device.h"
> +#include "hw/acpi/tpm.h"
>   #include "hw/pci/pcie_host.h"
>   #include "hw/pci/pci.h"
>   #include "hw/arm/virt.h"
>   #include "sysemu/numa.h"
>   #include "sysemu/reset.h"
> +#include "sysemu/tpm.h"
>   #include "kvm_arm.h"
>   #include "migration/vmstate.h"
>   
> @@ -704,6 +706,35 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>       build_fadt(table_data, linker, &fadt, NULL, NULL);
>   }
>   
> +static void
> +build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
> +{
> +    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
> +    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
> +    unsigned log_addr_offset =
> +        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
> +
> +    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
> +    if (TPM_IS_TIS_SYSBUS(tpm_find())) {
> +        tpm2_ptr->control_area_address = cpu_to_le64(0);
> +        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
> +    } else {
> +        g_warn_if_reached();
> +    }
> +
> +    tpm2_ptr->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> +    acpi_data_push(tcpalog, le32_to_cpu(tpm2_ptr->log_area_minimum_length));
> +
> +    /* log area start address to be filled by Guest linker */
> +    bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE,
> +                             tcpalog, 1, false);
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> +                                   log_addr_offset, log_addr_size,
> +                                   ACPI_BUILD_TPMLOG_FILE, 0);
> +    build_header(linker, table_data,
> +                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
> +}
> +
>   /* DSDT */
>   static void
>   build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -831,6 +862,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>           build_iort(tables_blob, tables->linker, vms);
>       }
>   
> +    if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
> +    }
> +
>       /* XSDT is pointed to by RSDP */
>       xsdt = tables_blob->len;
>       build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

