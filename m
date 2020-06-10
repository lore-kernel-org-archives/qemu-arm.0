Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp653670lfc;
        Wed, 10 Jun 2020 09:39:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkkfFX93JGzTTrobmIddXi59ho1+puqHs4yr34brr/nUrgyIBD7FJX0Ebl69Xvcdj0lva0
X-Received: by 2002:a25:908d:: with SMTP id t13mr6374114ybl.450.1591807178896;
        Wed, 10 Jun 2020 09:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591807178; cv=none;
        d=google.com; s=arc-20160816;
        b=s7c1RWRz6ENDbgoexOLmXASKX/OLvNg2XrAHx+W8wzq24CS0zYLCsr+mkUHmX5PU3X
         NnJzPxHIDTNIiorO+yW1K+biXhnFztePMlBRxwMopDDw46WTOGjFn43nuSIVN/1S0der
         5S/6QzsbAD3L6Xu+D4h5FwGo1QyVPXkky6pALv5mmP++kLZnd5OPBeiJ1XNDH3LnalkC
         t/33iq9TiFxx/Vv/DlWsTe+X/AOqG4+deA/V1jgNMfLzl9IVk6KIM0s7DGBYAd1R5OWg
         oATHGxvzkhvgLMawEOuU9/AqyYyS1Ed52GegnorpTzv0JtsyvFP7YJGuK+x/9Dz/LfnL
         OUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=i1QaAqa4azFC47unVAIbyENwwYrqkh1IeS3dJCU57EM=;
        b=TxHeMhKL90S8weY+SXZFShuTxAQSSTFFx5zdPzG/SZmflHn+PPjSW3LuxDbs/dj97f
         qGZk1D8wnHzulqjVn8AFNkQ2/4HKZ2KbBMz58scDoR+DuNW+dTPZ1rHZuHjmyURhq6tc
         qdlHwZdO0gl0G0bR2NLYdCYg3q9dzlOH3RXCnpYIshlq2BgBZcjTK71aW+w746aUUnt2
         F6UQXFkdE3JDbo0P6cR42jF4cui2y1/FJFAQVrTHz0jc0RjaI+GlpJA5IGeiE6Mn4u/A
         A4Z1knUwsTnJLGn2yHeCXDuHfgBMOfGjBHGI9539d0xu88O6G7Vdhy3S8dmNht6/9wKG
         bUaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k74si75868ybk.384.2020.06.10.09.39.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 09:39:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jj3lK-0001Na-0c
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 12:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jj3l2-0001Du-27; Wed, 10 Jun 2020 12:39:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58332
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jj3l0-0007ph-Fc; Wed, 10 Jun 2020 12:39:19 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05AGX3Sf074688; Wed, 10 Jun 2020 12:39:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31k1c8m26e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 12:39:15 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05AGX48f074865;
 Wed, 10 Jun 2020 12:39:15 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31k1c8m267-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 12:39:15 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05AGZ4TH016637;
 Wed, 10 Jun 2020 16:39:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 31hygyh31n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 16:39:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05AGdDqD49742320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 16:39:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5567112062;
 Wed, 10 Jun 2020 16:39:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9329F112061;
 Wed, 10 Jun 2020 16:39:13 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 16:39:13 +0000 (GMT)
Subject: Re: [PATCH v2 4/5] bios-tables-test: Add Q35/TPM-TIS test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
References: <20200609125409.24179-1-eric.auger@redhat.com>
 <20200609125409.24179-5-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <657c5530-728f-fd1d-fd4e-e0ca62cdd029@linux.ibm.com>
Date: Wed, 10 Jun 2020 12:39:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200609125409.24179-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_10:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=2 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 cotscore=-2147483648 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100126
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 12:38:09
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TdZeRFzBrRvv

On 6/9/20 8:54 AM, Eric Auger wrote:
> Test tables specific to the TPM-TIS instantiation.
> The TPM2 is added in the framework. Also the DSDT
> is updated with the TPM. The new function should be
> be usable for CRB as well, later one.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


>
> ---
>
> v2 -> v3:
> - use test_acpi_tcg_tpm() helper and stick to the current
>    qtest_add_func model
> - hardcode TPM_TIS_ADDR_BASE
> ---
>   tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++++++++++
>   tests/qtest/Makefile.include   |  1 +
>   2 files changed, 59 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c9843829b3..53f104a9c5 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -57,6 +57,9 @@
>   #include "qemu/bitmap.h"
>   #include "acpi-utils.h"
>   #include "boot-sector.h"
> +#include "tpm-emu.h"
> +#include "hw/acpi/tpm.h"
> +
>   
>   #define MACHINE_PC "pc"
>   #define MACHINE_Q35 "q35"
> @@ -874,6 +877,60 @@ static void test_acpi_piix4_tcg_numamem(void)
>       free_test_data(&data);
>   }
>   
> +uint64_t tpm_tis_base_addr;
> +
> +static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
> +                              uint64_t base)
> +{
> +    gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
> +                                          machine, tpm_if);
> +    char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> +    TestState test;
> +    test_data data;
> +    GThread *thread;
> +    char *args, *variant = g_strdup_printf(".%s", tpm_if);
> +
> +    tpm_tis_base_addr = base;
> +
> +    module_call_init(MODULE_INIT_QOM);
> +
> +    test.addr = g_new0(SocketAddress, 1);
> +    test.addr->type = SOCKET_ADDRESS_TYPE_UNIX;
> +    test.addr->u.q_unix.path = g_build_filename(tmp_path, "sock", NULL);
> +    g_mutex_init(&test.data_mutex);
> +    g_cond_init(&test.data_cond);
> +    test.data_cond_signal = false;
> +
> +    thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
> +    tpm_emu_test_wait_cond(&test);
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = machine;
> +    data.variant = variant;
> +
> +    args = g_strdup_printf(
> +        " -chardev socket,id=chr,path=%s"
> +        " -tpmdev emulator,id=dev,chardev=chr"
> +        " -device tpm-%s,tpmdev=dev",
> +        test.addr->u.q_unix.path, tpm_if);
> +
> +    test_acpi_one(args, &data);
> +
> +    g_thread_join(thread);
> +    g_unlink(test.addr->u.q_unix.path);
> +    qapi_free_SocketAddress(test.addr);
> +    g_rmdir(tmp_path);
> +    g_free(variant);
> +    g_free(tmp_path);
> +    g_free(tmp_dir_name);
> +    free_test_data(&data);
> +}
> +
> +static void test_acpi_q35_tcg_tpm_tis(void)
> +{
> +    test_acpi_tcg_tpm("q35", "tis", 0xFED40000);
> +}
> +
>   static void test_acpi_tcg_dimm_pxm(const char *machine)
>   {
>       test_data data;
> @@ -1037,6 +1094,7 @@ int main(int argc, char *argv[])
>               return ret;
>           }
>   
> +        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>           qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>           qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>           qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
> index 9e5a51d033..5023fa413d 100644
> --- a/tests/qtest/Makefile.include
> +++ b/tests/qtest/Makefile.include
> @@ -262,6 +262,7 @@ tests/qtest/hd-geo-test$(EXESUF): tests/qtest/hd-geo-test.o $(libqos-obj-y)
>   tests/qtest/boot-order-test$(EXESUF): tests/qtest/boot-order-test.o $(libqos-obj-y)
>   tests/qtest/boot-serial-test$(EXESUF): tests/qtest/boot-serial-test.o $(libqos-obj-y)
>   tests/qtest/bios-tables-test$(EXESUF): tests/qtest/bios-tables-test.o \
> +        tests/qtest/tpm-emu.o $(test-io-obj-y) \
>   	tests/qtest/boot-sector.o tests/qtest/acpi-utils.o $(libqos-obj-y)
>   tests/qtest/pxe-test$(EXESUF): tests/qtest/pxe-test.o tests/qtest/boot-sector.o $(libqos-obj-y)
>   tests/qtest/microbit-test$(EXESUF): tests/qtest/microbit-test.o


