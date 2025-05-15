Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1712450njb;
        Thu, 15 May 2025 02:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVncDzIlXgtsKfA70LaAWORzqCmtd8D4zpm8He8W3N8p4VrZphu/HD9UDMlmSX0NStWUuNxpWTd5l++hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHIyZ39ex7t8jbrzXK6AJVO3Xu/DHq4AA0CXFs/Bvnl75YeSEWAM3vVkwtdTk04WOjiR1sJ
X-Received: by 2002:a05:622a:401b:b0:48e:5cda:f73c with SMTP id d75a77b69052e-49495d2cba5mr102311201cf.48.1747299930060;
        Thu, 15 May 2025 02:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747299930; cv=none;
        d=google.com; s=arc-20240605;
        b=TeQWq/6boJ2czLXWYFhLxN2lTuh9TTa8mqK4AvVpj3LK+fqXN9fsfbdulfKxMk8tgH
         UqQ3aE5wNz4DOzEABNtycRJWl+g07vzLgV+hSp2hjYmLayQ/KZjNZZdb8JhNp8oTpxIR
         aNVj1uxI69vVUTfhUFlTyM/pm9G7buZkdmvth7WZiTDV6y5vowYyAjnc7tfkYzvXDE6a
         9kMQlkxaW5+DE2JqBpRnF+d6jcMa0Sxdciyv/vA6ZqkXxbiqbKKyiMqdnI6pDDLYTgfr
         80VVXoTk/TMeM76GbySI6lenGbSf+jjnxmlevKwkG6soZ7ls6GmdONfLQdlnblPNLJXK
         snYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=Q0FpDkDu196gW3mLiVY46fZckSWYEfx7gzTD8ZMla68=;
        fh=uV24iyMM+1WTlgF92eZXmnVGWrwiIiAr8jVB+GFXxBQ=;
        b=jpLH6nJ4+A3cUHFbpHi/yF2Dj1/KtLWRcHgLW0SP3pTRqgmF8MqxvsgruPxJfRFjM/
         lya4OOxi1epqJKzveCNihwgpvN1oiYKQY6EOH4TR2MUy12PrhN7W8clP/hSgw/jtyyUr
         I/WBd9cVhivuxZJT+7e1RFKNyzWQSNmPBkLQzvLyAkjUj2Var6vUbZVDilnZ/sXVqcGQ
         wBIj3yM/dTQSPXLTyBIE7cijEMm9NGHD3DPgWW7GgcmvYvRfL2zOk1Rvh6qHdQRxfs4A
         GA7/p8iQlodLQw4zhlh8E+PHgCW7p6xC3shmYqhylh6roF6LK00GR3EkiEosm/LRbEaV
         b6jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=gSnRvNUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452555679si158308981cf.218.2025.05.15.02.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 02:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=gSnRvNUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFUWV-0004KQ-G4; Thu, 15 May 2025 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1uFUWS-0004K6-UK
 for qemu-arm@nongnu.org; Thu, 15 May 2025 05:05:00 -0400
Received: from out-173.mta0.migadu.com ([91.218.175.173])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1uFUWP-0007ZU-RX
 for qemu-arm@nongnu.org; Thu, 15 May 2025 05:05:00 -0400
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1747299878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0FpDkDu196gW3mLiVY46fZckSWYEfx7gzTD8ZMla68=;
 b=gSnRvNUyE5j8LXaMFvVWtpEWokvfP7HtORyp2xG5w/wZXO6cV6DPoL9rxkSaSdpgf5P5zy
 is5aAXRZY6BvJxWANtsmPsSGuu1Iwr1Xyciy3pGsS+hsUuFeV0KZ051z2RyPR8RoVAY0Eg
 5153FDDgd1X7lHzP+jxZD4SC/oC/gqk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v13 5/5] qtest/cxl: Add aarch64 virt test for CXL
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
In-Reply-To: <20250513111455.128266-6-Jonathan.Cameron@huawei.com>
Date: Thu, 15 May 2025 18:04:18 +0900
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9E503CC-1271-4008-9975-9BAEC7A33376@linux.dev>
References: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
 <20250513111455.128266-6-Jonathan.Cameron@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.173;
 envelope-from=itaru.kitayama@linux.dev; helo=out-173.mta0.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yaMoOo8c21P2



> On May 13, 2025, at 20:14, Jonathan Cameron =
<Jonathan.Cameron@huawei.com> wrote:
>=20
> Add a single complex case for aarch64 virt machine.
> Given existing much more comprehensive tests for x86 cover the
> common functionality, a single test should be enough to verify
> that the aarch64 part continue to work.
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> tests/qtest/cxl-test.c  | 59 ++++++++++++++++++++++++++++++++---------
> tests/qtest/meson.build |  1 +
> 2 files changed, 47 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index a600331843..c7189d6222 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -19,6 +19,12 @@
>     "-device pxb-cxl,id=3Dcxl.1,bus=3Dpcie.0,bus_nr=3D53 " \
>     "-M =
cxl-fmw.0.targets.0=3Dcxl.0,cxl-fmw.0.targets.1=3Dcxl.1,cxl-fmw.0.size=3D4=
G "
>=20
> +#define QEMU_VIRT_2PXB_CMD \
> +    "-machine virt,cxl=3Don -cpu max " \
> +    "-device pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 " \
> +    "-device pxb-cxl,id=3Dcxl.1,bus=3Dpcie.0,bus_nr=3D53 " \
> +    "-M =
cxl-fmw.0.targets.0=3Dcxl.0,cxl-fmw.0.targets.1=3Dcxl.1,cxl-fmw.0.size=3D4=
G "
> +
> #define QEMU_RP \
>     "-device cxl-rp,id=3Drp0,bus=3Dcxl.0,chassis=3D0,slot=3D0 "
>=20
> @@ -197,25 +203,52 @@ static void cxl_2pxb_4rp_4t3d(void)
>     qtest_end();
>     rmdir(tmpfs);
> }
> +
> +static void cxl_virt_2pxb_4rp_4t3d(void)
> +{
> +    g_autoptr(GString) cmdline =3D g_string_new(NULL);
> +    char template[] =3D "/tmp/cxl-test-XXXXXX";
> +    const char *tmpfs;
> +
> +    tmpfs =3D mkdtemp(template);
> +
> +    g_string_printf(cmdline, QEMU_VIRT_2PXB_CMD QEMU_4RP QEMU_4T3D,
> +                    tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
> +                    tmpfs, tmpfs);
> +
> +    qtest_start(cmdline->str);
> +    qtest_end();
> +    rmdir(tmpfs);
> +}
> #endif /* CONFIG_POSIX */
>=20
> int main(int argc, char **argv)
> {
> -    g_test_init(&argc, &argv, NULL);
> +    const char *arch =3D qtest_get_arch();
>=20
> -    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
> -    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
> -    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
> -    qtest_add_func("/pci/cxl/pxb_x2_with_window", =
cxl_2pxb_with_window);
> -    qtest_add_func("/pci/cxl/rp", cxl_root_port);
> -    qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
> +    g_test_init(&argc, &argv, NULL);
> +    if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D =
0) {
> +        qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
> +        qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
> +        qtest_add_func("/pci/cxl/pxb_with_window", =
cxl_pxb_with_window);
> +        qtest_add_func("/pci/cxl/pxb_x2_with_window", =
cxl_2pxb_with_window);
> +        qtest_add_func("/pci/cxl/rp", cxl_root_port);
> +        qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
> #ifdef CONFIG_POSIX
> -    qtest_add_func("/pci/cxl/type3_device", cxl_t3d_deprecated);
> -    qtest_add_func("/pci/cxl/type3_device_pmem", cxl_t3d_persistent);
> -    qtest_add_func("/pci/cxl/type3_device_vmem", cxl_t3d_volatile);
> -    qtest_add_func("/pci/cxl/type3_device_vmem_lsa", =
cxl_t3d_volatile_lsa);
> -    qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
> -    qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", =
cxl_2pxb_4rp_4t3d);
> +        qtest_add_func("/pci/cxl/type3_device", cxl_t3d_deprecated);
> +        qtest_add_func("/pci/cxl/type3_device_pmem", =
cxl_t3d_persistent);
> +        qtest_add_func("/pci/cxl/type3_device_vmem", =
cxl_t3d_volatile);
> +        qtest_add_func("/pci/cxl/type3_device_vmem_lsa", =
cxl_t3d_volatile_lsa);
> +        qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
> +        qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4",
> +                       cxl_2pxb_4rp_4t3d);
> #endif
> +    } else if (strcmp(arch, "aarch64") =3D=3D 0) {
> +#ifdef CONFIG_POSIX
> +        qtest_add_func("/pci/cxl/virt/pxb_x2_root_port_x4_type3_x4",
> +                       cxl_virt_2pxb_4rp_4t3d);
> +#endif
> +    }
> +
>     return g_test_run();
> }
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 7daf619845..361000267a 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -258,6 +258,7 @@ qtests_aarch64 =3D \
>   (config_all_accel.has_key('CONFIG_TCG') and                          =
                  \
>    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? =
['tpm-tis-i2c-test'] : []) + \
>   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : =
[]) + \
> +  qtests_cxl +                                                        =
                          \
>   ['arm-cpu-features',
>    'numa-test',
>    'boot-serial-test',
> --=20
> 2.43.0
>=20

~/projects/qemu/build$ meson test qtest-aarch64/cxl-test
ninja: Entering directory `/home/realm/projects/qemu/build'
[1/8] Generating qemu-version.h with a custom command (wrapped by meson =
to capture output)
1/1 qemu:qtest+qtest-aarch64 / qtest-aarch64/cxl-test        OK          =
    0.17s   1 subtests passed

Ok:                 1
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com =
<mailto:itaru.kitayama@fujitsu.com>>

Jonathan, would you push your branch this series applied? I manually =
applied your series no issues though.=20


