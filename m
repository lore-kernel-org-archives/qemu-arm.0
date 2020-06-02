Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4135416lfc;
        Tue, 2 Jun 2020 07:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAouoQ6RzAkOsU0hLvrEhArQctJj/dCdCitF+5TPcJckbYnq2TDZeUlkCwEUr36xwlhwsR
X-Received: by 2002:a25:d9cc:: with SMTP id q195mr17738730ybg.55.1591108743870;
        Tue, 02 Jun 2020 07:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591108743; cv=none;
        d=google.com; s=arc-20160816;
        b=NjcMhNLfqFfVn5bkkZP/2d5txYfSGPMmXDQJCmwDfKHEX28rHT8DAXgS7L8BGvc0P+
         CqVY9OwO0KHDY5AIWN4XuOdOZ+XWdYPM6gAKsC8TMHPcSxA3mDqCzFBwDxPtaX6ZRQOA
         X/NKQuqdX51cFGzdjPTxqc3T0AUr+FBQJLwiWJwlPlzH1utC79xS2/WNOZvp3MTiWHkY
         9dR8SaVF4waqwwQmr12sJV2x1cgDNOsWZBGZg3VcP2odnjqiReNy2SEJwXHsW7JIW/xa
         Cex+Al594rVvyRhFrg2EAG5Hh5LfwPxsbvJWHryKyjaYOOdjRQlIQ7ToAMY77LNBcmmy
         bqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=gNCe/R6IxWzKywoy2TMwZcSS8wgapZwL7OO69tpixD8=;
        b=A0CjbbnNYrDV2rCBO/0tN7nCo0HsK7KY67pTUa3zYpEnBLj1Le/ad8VjTQb0frkw9b
         zwlo49HL2rvxehyaibvvWXGbFD+p0I8B5jGmeTZW5ujHVZKW75ripeF+FXs07avGwT0f
         1HGyrKR2Buz08OEVMQDFu0A4mveYpYiwccskdO9wWYePiks1PNB9MGsrVzpHX42LqwXk
         Grf9GlI9kQSeWXMVfLp1nq+XrvDSRu/ZiDQJiw4W1/FhXjXNr3f3Ww0dfWCPu7e8HOZy
         PMTXOEmrEHS5ug/k1JVh+FprOsyLqoM24M3vN+AAUaqr+FBoiMPck5dUJ4/3mQnIsyHO
         cr+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a143si2231756ybg.396.2020.06.02.07.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 07:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg84F-0003UB-6T
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg846-0003Rz-Uz; Tue, 02 Jun 2020 10:38:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24074
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg845-0004MK-QI; Tue, 02 Jun 2020 10:38:54 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052EXUJE093387; Tue, 2 Jun 2020 10:38:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31dfsfsebh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:38:51 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 052EXCIU091709;
 Tue, 2 Jun 2020 10:38:50 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31dfsfseb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:38:50 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052EQKrt001932;
 Tue, 2 Jun 2020 14:38:49 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 31bf49hasa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 14:38:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052EcmWO50200884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 14:38:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3942112066;
 Tue,  2 Jun 2020 14:38:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB2E4112061;
 Tue,  2 Jun 2020 14:38:48 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 14:38:48 +0000 (GMT)
Subject: Re: [RFC 5/6] bios-tables-test: Add Q35/TPM-TIS test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-6-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <b17323b2-33da-2053-97f7-45daef297c4b@linux.ibm.com>
Date: Tue, 2 Jun 2020 10:38:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200601102113.1207-6-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 cotscore=-2147483648 mlxscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=2 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020100
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 09:30:21
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTDy0R99X0dt

On 6/1/20 6:21 AM, Eric Auger wrote:
> Test tables specific to the TPM-TIS instantiation.
> The TPM2 is added in the framework. Also the DSDT
> is updated with the TPM. The new function should be
> be usable for CRB as well, later one.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 60 ++++++++++++++++++++++++++++++++++
>   tests/qtest/Makefile.include   |  1 +
>   2 files changed, 61 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c9843829b3..bbba98342c 100644
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
> +struct tpm_test_data {
> +    const char *machine;
> +    const char *tpm_if;
> +};
> +
> +static void test_acpi_tcg_tpm(const void *context)
> +{
> +    struct tpm_test_data *c = (struct tpm_test_data *)context;
> +    gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
> +                                          c->machine, c->tpm_if);
> +    char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> +    TestState test;
> +    test_data data;
> +    GThread *thread;
> +    char *args, *variant = g_strdup_printf(".%s", c->tpm_if);
> +
> +    tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
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
> +    data.machine = c->machine;
> +    data.variant = variant;
> +
> +    args = g_strdup_printf(
> +        " -chardev socket,id=chr,path=%s"
> +        " -tpmdev emulator,id=dev,chardev=chr"
> +        " -device tpm-%s,tpmdev=dev",
> +        test.addr->u.q_unix.path, c->tpm_if);
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
>   static void test_acpi_tcg_dimm_pxm(const char *machine)
>   {
>       test_data data;
> @@ -1028,6 +1085,7 @@ int main(int argc, char *argv[])
>   {
>       const char *arch = qtest_get_arch();
>       int ret;
> +    struct tpm_test_data tpm_q35_tis = {MACHINE_Q35, "tis"};
>   
>       g_test_init(&argc, &argv, NULL);
>   
> @@ -1037,6 +1095,8 @@ int main(int argc, char *argv[])
>               return ret;
>           }
>   
> +        qtest_add_data_func("acpi/q35/tpm-tis",
> +                            &tpm_q35_tis, test_acpi_tcg_tpm);
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


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


