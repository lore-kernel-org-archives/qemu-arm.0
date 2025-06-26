Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp1258986dyb;
        Wed, 25 Jun 2025 19:34:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIQOobWJ1rR1FKm6Mfbl24i4Ptsey8ixMiopca5gm0aE2cpOuN6WGs/qGV7n+khDy/jzYYZFa4b3oNYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHPGg3CKvLCLYIWM64LsLjdRfBjmAs2uPrtkUB2maF3QER3kN67OXSwWTTkCTdNuTW8ir16
X-Received: by 2002:a05:6000:4a0d:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3a6ed6644e6mr4638326f8f.33.1750905248581;
        Wed, 25 Jun 2025 19:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750905248; cv=none;
        d=google.com; s=arc-20240605;
        b=B1zTiKg4xJNVGbRACt/WRGoQcseYhZLDwVZ0oVMlJNsq/LeuFDKMO1zUFajDmqhaS0
         m16X4DdTFix7Jlv6XWI7TWuxPb8r6Y3+Fz2YFc4XkknjXB88aqfyY+Z1jWQReYY4S1ro
         8KTzg7UxZDzHNC2XpSVAGdUWQu5Vzj7g0dQ/eyacaNpuY/Fvy0cgSBHZGw+27kAyy/yo
         CtgNzR53V0jF6/6YyOstOhZTAxvFnZizIpt0IjDy9nVRBMLwwHRdiPgKOK2N9jUkDbfV
         11RBdlWb//qx4OciSukuiGhS84V3y7CnzPC/s+6eSeE4nc+i8VBcOo+aTJTpbtKtnl5k
         IBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date;
        bh=RjL5hT4l8Yh+/iydgPaThwMUOJfmrbIQqeQkawidg3Q=;
        fh=JeWKgUI13WBJNK+7ejyRYlgVuqyDRBo47jknzpXfg3E=;
        b=Yqo855qfDXoTOCyqZrJRn+FgX0nPiT8LvjCnJMQYzwyR9Yow8u55wPdt5t0x0+X3WV
         EfDTplNU/h9v5iaAtVtK3sIpZi9W/28jg9hRCHaJB2l9nTo0HRXTdu2JUOHjE2NRAwq8
         aPL/0e3r36TheRSVljMdocZlphDe2EKc564XGPCPW8MM6ywIwTdYf58NZhR1dfhUV7mG
         h8ECEudmScP7i/yj7qlln7fQ/+H8Gfk/WLfRCOwjKx9AtcDQKvndNmDyZf6fqSIV2ISp
         GWpJzBdyy8yDKBNpS/dZM59/BFG+5rO7f4YvZWDHh/xC9sosQV8dKYUW1LNhze7C6xy3
         v35w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=NZblTC2C;
       spf=pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.188 as permitted sender) smtp.mailfrom=itaru.kitayama@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <itaru.kitayama@linux.dev>
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com. [91.218.175.188])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80e2761si4223244f8f.353.2025.06.25.19.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 19:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.188 as permitted sender) client-ip=91.218.175.188;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=NZblTC2C;
       spf=pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.188 as permitted sender) smtp.mailfrom=itaru.kitayama@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Thu, 26 Jun 2025 11:33:58 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750905247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RjL5hT4l8Yh+/iydgPaThwMUOJfmrbIQqeQkawidg3Q=;
	b=NZblTC2CwDxjpBOUo/smyeyW4p/s/xQM0cZNU3bhk8nEJPj51xI3RDAjLsUW56weR0+pJb
	as5CH3O8uEJl8Q+7uwXsGwr6u1qCNbgP2hVitGd+UU/1cqojW4r2rzci35r02Fq99PIeJh
	MoP2Pl6z6qUbsWB5nmHEVTrSexTN3OM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
	Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
	Zhijian Li <lizhijian@fujitsu.com>, linuxarm@huawei.com,
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH qemu v16 5/5] qtest/cxl: Add aarch64 virt test for CXL
Message-ID: <aFyxljLgpYXxiSn3@vm4>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
 <20250625161926.549812-6-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625161926.549812-6-Jonathan.Cameron@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-TUID: I4ZbdXzXpb6n

On Wed, Jun 25, 2025 at 05:19:26PM +0100, Jonathan Cameron wrote:
> Add a single complex case for aarch64 virt machine.
> Given existing much more comprehensive tests for x86 cover the
> common functionality, a single test should be enough to verify
> that the aarch64 part continue to work.
> 
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v16: Update to bring improvements made to other tests (Peter Maydell).
>      I'd failed to notice when rebasing this over time that the
>      other tests had undergone various improvment and I should have
>      updated this one as well.
> ---
>  tests/qtest/cxl-test.c  | 58 ++++++++++++++++++++++++++++++++---------
>  tests/qtest/meson.build |  1 +
>  2 files changed, 46 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index a600331843..8fb7e58d4f 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -19,6 +19,12 @@
>      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
>      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
>  
> +#define QEMU_VIRT_2PXB_CMD \
> +    "-machine virt,cxl=on -cpu max " \
> +    "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
> +    "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> +    "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> +
>  #define QEMU_RP \
>      "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
>  
> @@ -197,25 +203,51 @@ static void cxl_2pxb_4rp_4t3d(void)
>      qtest_end();
>      rmdir(tmpfs);
>  }
> +
> +static void cxl_virt_2pxb_4rp_4t3d(void)
> +{
> +    g_autoptr(GString) cmdline = g_string_new(NULL);
> +    g_autofree const char *tmpfs = NULL;
> +
> +    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
> +
> +    g_string_printf(cmdline, QEMU_VIRT_2PXB_CMD QEMU_4RP QEMU_4T3D,
> +                    tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
> +                    tmpfs, tmpfs);
> +
> +    qtest_start(cmdline->str);
> +    qtest_end();
> +    rmdir(tmpfs);
> +}
>  #endif /* CONFIG_POSIX */
>  
>  int main(int argc, char **argv)
>  {
> -    g_test_init(&argc, &argv, NULL);
> +    const char *arch = qtest_get_arch();
>  
> -    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
> -    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
> -    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
> -    qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
> -    qtest_add_func("/pci/cxl/rp", cxl_root_port);
> -    qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
> +    g_test_init(&argc, &argv, NULL);
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
> +        qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
> +        qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
> +        qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
> +        qtest_add_func("/pci/cxl/rp", cxl_root_port);
> +        qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
>  #ifdef CONFIG_POSIX
> -    qtest_add_func("/pci/cxl/type3_device", cxl_t3d_deprecated);
> -    qtest_add_func("/pci/cxl/type3_device_pmem", cxl_t3d_persistent);
> -    qtest_add_func("/pci/cxl/type3_device_vmem", cxl_t3d_volatile);
> -    qtest_add_func("/pci/cxl/type3_device_vmem_lsa", cxl_t3d_volatile_lsa);
> -    qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
> -    qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", cxl_2pxb_4rp_4t3d);
> +        qtest_add_func("/pci/cxl/type3_device", cxl_t3d_deprecated);
> +        qtest_add_func("/pci/cxl/type3_device_pmem", cxl_t3d_persistent);
> +        qtest_add_func("/pci/cxl/type3_device_vmem", cxl_t3d_volatile);
> +        qtest_add_func("/pci/cxl/type3_device_vmem_lsa", cxl_t3d_volatile_lsa);
> +        qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
> +        qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4",
> +                       cxl_2pxb_4rp_4t3d);
>  #endif
> +    } else if (strcmp(arch, "aarch64") == 0) {
> +#ifdef CONFIG_POSIX
> +        qtest_add_func("/pci/cxl/virt/pxb_x2_root_port_x4_type3_x4",
> +                       cxl_virt_2pxb_4rp_4t3d);
> +#endif
> +    }
> +
>      return g_test_run();
>  }
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 8ad849054f..42e927b32a 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -261,6 +261,7 @@ qtests_aarch64 = \
>     config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
>    (config_all_devices.has_key('CONFIG_NPCM8XX') ? qtests_npcm8xx : []) + \
> +  qtests_cxl +                                                                                  \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',

The v16 series was applied cleanly against the master today and did 
meson test qtest-aarch64/cxl-test it went ok.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.


> -- 
> 2.48.1
> 
