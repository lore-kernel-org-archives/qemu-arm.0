Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2545717lfc;
        Fri, 5 Jun 2020 08:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN+IidXtSjsM4pxgKPru06KFC6+YiQ7yXylKdOBEEMHq/dK+imQT/mHWhtCLjAC4AhZthy
X-Received: by 2002:a25:2041:: with SMTP id g62mr8716471ybg.429.1591370291450;
        Fri, 05 Jun 2020 08:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591370291; cv=none;
        d=google.com; s=arc-20160816;
        b=u5lOv05iPnmbfgfUVl4DsVMXWfyzVYIj8ph6EYOeT1WfBS+QxlRJn3V0lKW9NJV1tg
         QZV4tOOQxW0+mQKpaY0BZpOyH4I5xk/wNaBOwYx7zGy8bdM4Aeunpomo0FakyNB/2U4N
         tAXJoG2Hc793VXEWbN8OFavv1NvT12g9LZd8owDveXzocu+5ogfhfA+cA8giHgsALoJC
         N/CUW2yfVmmwbQ7rv8CzaaPRpJfNY4/MmVjlRbL8obUz55+PIeddGpPoEBjeGhMtaMMh
         Oo+A9dD9YdRPTP/ROsppqhjPkl5FnUJnrfKAHPss+W4uesEb7j2YGYhRzFTZAzm/melw
         CBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=QhlF4TZGj5vuCft1tLRwvcNNKugqj6nkzpfX6viy8H0=;
        b=lNKElPaeHeMj2MK386r0gakvO99RBY0smkxwecg6NDT7f0OGc4uTzQ9a0vBNEW1OLs
         tf88W644Ty+Sk/lGlKkiLeunK4oajJLCf/FtVxZsowwy4p3rzyFWwXhNJachaEIkOw+w
         Yq5TmguU/jpcBXBdf5tQjmuLaeGjlBzGKnXIu9NRVE25OxmxrjJv8JTvXargvWf4BK34
         5igdw/Eld4Npgb3eIy4vHjUQEnUIGRJZJlAylqJx1Q3TeZVvMTLp9jx3BicLL23G8p0C
         0mEwbcZDYhMzVHqCKaM7mDODoLnkmW3wfb0an2vdHpHWRfjwofwXmMhg2HXn/66lhu7A
         T+8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=icq6qJ+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si7430388ybk.156.2020.06.05.08.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 08:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=icq6qJ+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhE6k-0004ki-Qs
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 11:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhE6d-0004jI-Ne
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 11:18:03 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43587
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhE6a-0004pv-SD
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 11:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591370278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhlF4TZGj5vuCft1tLRwvcNNKugqj6nkzpfX6viy8H0=;
 b=icq6qJ+g0Qfb+CEgFPGrd7vAIsFaVz8OSZzQM/JEY/0C0BEYvw6rGjRknV3OENWXN1ZG9Z
 udujm0ZCb5xXg9uNgjl34aqXB6vpU6fZO/bT/TBMw2fMWtGiOnRJl9lmJyK/LeaKfUOqdr
 icGXmsZM4MHI7gfUtDSVOOVPUaAmZ/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-SU2vXVYsNmCrvF-_BJ4eag-1; Fri, 05 Jun 2020 11:17:54 -0400
X-MC-Unique: SU2vXVYsNmCrvF-_BJ4eag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E30AE100A8EC;
 Fri,  5 Jun 2020 15:17:52 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 199ED7B5F3;
 Fri,  5 Jun 2020 15:17:41 +0000 (UTC)
Date: Fri, 5 Jun 2020 17:17:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RFC 5/6] bios-tables-test: Add Q35/TPM-TIS test
Message-ID: <20200605171738.31ed9143@redhat.com>
In-Reply-To: <20200601102113.1207-6-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-6-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:35:49
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 philmd@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b+9Lz5KXfWAB

On Mon,  1 Jun 2020 12:21:12 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Test tables specific to the TPM-TIS instantiation.
> The TPM2 is added in the framework. Also the DSDT
> is updated with the TPM. The new function should be
> be usable for CRB as well, later one.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 60 ++++++++++++++++++++++++++++++++++
>  tests/qtest/Makefile.include   |  1 +
>  2 files changed, 61 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c9843829b3..bbba98342c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -57,6 +57,9 @@
>  #include "qemu/bitmap.h"
>  #include "acpi-utils.h"
>  #include "boot-sector.h"
> +#include "tpm-emu.h"
> +#include "hw/acpi/tpm.h"
> +
>  
>  #define MACHINE_PC "pc"
>  #define MACHINE_Q35 "q35"
> @@ -874,6 +877,60 @@ static void test_acpi_piix4_tcg_numamem(void)
>      free_test_data(&data);
>  }
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

s/test_acpi_tcg_tpm/test_acpi_q35_tcg_tpm/

I'd try to keep test specific parameter within test function isnstead of pushing it up to main(),
drawback would be some code duplication for intializing test data and calling runner
but it's trivial and worked well so far. See for example test_acpi_piix4_tcg_bridge/test_acpi_q35_tcg_bridge. I might seem a waste but it's consictent with what we were doing
with bios tests.


> +    struct tpm_test_data *c = (struct tpm_test_data *)context;
> +    gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
> +                                          c->machine, c->tpm_if);
> +    char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> +    TestState test;
> +    test_data data;
> +    GThread *thread;
> +    char *args, *variant = g_strdup_printf(".%s", c->tpm_if);
maybe derive tpm_if from '.variant' if it's necessary at all?

> +
> +    tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
hardcode it here, so in case QEMU regresses, test could notice?

> +
> +    module_call_init(MODULE_INIT_QOM);
why it's here?

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
perhaps make a separate helper function from this chunk
so it could be reused from other TMP test functions.

> +
> +    memset(&data, 0, sizeof(data));
I'd init fields with initializer, see test_acpi_virt_tcg_numamem()

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
>  static void test_acpi_tcg_dimm_pxm(const char *machine)
>  {
>      test_data data;
> @@ -1028,6 +1085,7 @@ int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
>      int ret;
> +    struct tpm_test_data tpm_q35_tis = {MACHINE_Q35, "tis"};

I'd hide this within test_acpi_tcg_tpm() as it's done in other test functions

>  
>      g_test_init(&argc, &argv, NULL);
>  
> @@ -1037,6 +1095,8 @@ int main(int argc, char *argv[])
>              return ret;
>          }
>  
> +        qtest_add_data_func("acpi/q35/tpm-tis",
> +                            &tpm_q35_tis, test_acpi_tcg_tpm);
>          qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
> index 9e5a51d033..5023fa413d 100644
> --- a/tests/qtest/Makefile.include
> +++ b/tests/qtest/Makefile.include
> @@ -262,6 +262,7 @@ tests/qtest/hd-geo-test$(EXESUF): tests/qtest/hd-geo-test.o $(libqos-obj-y)
>  tests/qtest/boot-order-test$(EXESUF): tests/qtest/boot-order-test.o $(libqos-obj-y)
>  tests/qtest/boot-serial-test$(EXESUF): tests/qtest/boot-serial-test.o $(libqos-obj-y)
>  tests/qtest/bios-tables-test$(EXESUF): tests/qtest/bios-tables-test.o \
> +        tests/qtest/tpm-emu.o $(test-io-obj-y) \
>  	tests/qtest/boot-sector.o tests/qtest/acpi-utils.o $(libqos-obj-y)
>  tests/qtest/pxe-test$(EXESUF): tests/qtest/pxe-test.o tests/qtest/boot-sector.o $(libqos-obj-y)
>  tests/qtest/microbit-test$(EXESUF): tests/qtest/microbit-test.o

