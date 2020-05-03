Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2895349lfm;
        Sun, 3 May 2020 07:19:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypITnjWP8PGwJgSREJDpXQ8HCfYtfShGuKDMw58MzJ8ljKB7aeLN804gwvNvoS1ub8hkQaDy
X-Received: by 2002:a37:792:: with SMTP id 140mr11580777qkh.58.1588515564687;
        Sun, 03 May 2020 07:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588515564; cv=none;
        d=google.com; s=arc-20160816;
        b=iJQ1CjSqtYDaZdpc9HeZZuTd608LWExHVlUCHAytnDXVKoDKxbZBEgami+vXsSHi2Q
         Ne/LuvTpMkmPKYLwqKPy9KZF+bA8bTjC6a6Z5aHeLJMGhImNNaIFN5UOBBnpoRfST1k8
         P0SSaJ/k4yTTGKdjisGa8q5lHuPSsEkA/sHrJ/2M9xNt6M4I8Zmzc6u6vKxNFkpsGhPR
         Et2MMoiM+TjCQW3h/dbprjavX/ITSXs8quN17hQ0BUWwW9gywlfKk17qqSnL5l6OmEpF
         +wPB/nblD1zH6ksQPRrP+QYiqBWEY6x3n8SACSUuBx3ibvl6p4g0/OvN0Xy5dvwRTmbl
         9dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=1YIQ22e9f8/uBLonH9pKUoV4vwpqcf0UitaP2u/PgoA=;
        b=fy2SHmBzNzUM77g0Yxen3Ttv35gBMYb1o37WBC6Njp8Ak/3z5mYMPtW6XTLKtHmFWy
         zjBBBT854NC1xK7EKYdq9VlkYwrxfaVD3jGFsO9XHCzXCrLM/ULtoI0fWJTUvhZoFfP+
         u5hkJ6NzifRwjAj6W/IqnJ+AuMMrJxkGDKKtg4vd/KSNhpyA4gUncUPAzjL6DybAMGBW
         UcGUT6Xgi6+yA91JydClsNfqsZAqAQk5Hjf1mni8Imwzk8NSpk2cIaCWbutzU5l82/Xy
         o/w/BZueXzmwCmqU0RoYkdG+cbsdAbC1TZnzfJdLciwXw8sFutquwz3gpCK16aE3JUTk
         OXZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id y34si5014576qvf.172.2020.05.03.07.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 May 2020 07:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVFSm-00085b-4r
	for alex.bennee@linaro.org; Sun, 03 May 2020 10:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jVFSU-0007z7-Iw; Sun, 03 May 2020 10:19:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28740
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jVFST-00015o-FQ; Sun, 03 May 2020 10:19:06 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 043E2RPj133906; Sun, 3 May 2020 10:19:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s50ep90r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 03 May 2020 10:19:02 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 043EDAGb153748;
 Sun, 3 May 2020 10:19:02 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s50ep90j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 03 May 2020 10:19:02 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 043EFmQA012093;
 Sun, 3 May 2020 14:19:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 30s0g6a22q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 03 May 2020 14:19:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 043EJ1D948300516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 3 May 2020 14:19:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27C54AC05F;
 Sun,  3 May 2020 14:19:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 152F9AC05B;
 Sun,  3 May 2020 14:19:01 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun,  3 May 2020 14:19:01 +0000 (GMT)
Subject: Re: [PATCH 2/2] arm/acpi: Add the TPM2.0 device under the DSDT
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
References: <20200502203536.15011-1-eric.auger@redhat.com>
 <20200502203536.15011-3-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <1d961c0b-7176-2d9e-04d8-5839a16ec889@linux.ibm.com>
Date: Sun, 3 May 2020 10:19:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200502203536.15011-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-03_09:2020-05-01,
 2020-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005030127
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/03 10:19:04
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
X-TUID: 4epqr5pW3SB2

On 5/2/20 4:35 PM, Eric Auger wrote:
> In case it is dynamically instantiated, add the TPM 2.0 device object
> under the DSDT table in the ACPI namespace. Its HID is MSFT0101
> while its current resource settings (CRS) property is initialized
> with the guest physical address and MMIO size of the device.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cc5863eaf2..0cb9cdb2ce 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -45,6 +45,7 @@
>   #include "hw/pci/pcie_host.h"
>   #include "hw/pci/pci.h"
>   #include "hw/arm/virt.h"
> +#include "hw/platform-bus.h"
>   #include "sysemu/numa.h"
>   #include "sysemu/reset.h"
>   #include "sysemu/tpm.h"
> @@ -362,6 +363,38 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>       aml_append(scope, dev);
>   }
>   
> +static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> +{
> +    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    MemoryRegion *sbdev_mr;
> +    SysBusDevice *sbdev;
> +    hwaddr tpm_base;
> +
> +    sbdev = (SysBusDevice *)object_dynamic_cast(OBJECT(tpm_find()),
> +                                                TYPE_SYS_BUS_DEVICE);
> +    if (!sbdev) {
> +        return;
> +    }
> +
> +    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    assert(tpm_base != -1);
> +
> +    tpm_base += pbus_base;
> +
> +    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
> +
> +    Aml *dev = aml_device("TPM0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs,
> +               aml_memory32_fixed(tpm_base, sbdev_mr->size, AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>   static void
>   build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
> @@ -785,6 +818,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       }
>   
>       acpi_dsdt_add_power_button(scope);
> +    acpi_dsdt_add_tpm(scope, vms);
>   
>       aml_append(dsdt, scope);
>   

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


