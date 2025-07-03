Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp831022dyc;
        Thu, 3 Jul 2025 15:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUn234/AJyrh+yqdOw6FpeFd9zICf98VL5h/FmTEjBbNlYIlNzlLFjDtW1ckc7m6Z1jG3t2+C59h++edg==@linaro.org
X-Google-Smtp-Source: AGHT+IGsaw4ksdcK7c8UsTUi9UmpJIE9Es2G1HpqvXMkLY0Jb5ZiyQF8TkciMSwKbMBWy38dScPB
X-Received: by 2002:a05:600c:8b52:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-454b30df0d5mr2376555e9.17.1751580292312;
        Thu, 03 Jul 2025 15:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751580292; cv=none;
        d=google.com; s=arc-20240605;
        b=S2CGTiQUh+9ffA0sju9yVm7oL+fHtyA/Vpmt1CPeLFYx15SdL19jzTGIWBOeEC1J/Z
         EYyEWzhNXEDXS2RHcB0AVGI12v7Hr9cU443pIcEQ5BF1zG8DgUi1uVR2nkZx5kxhFOLy
         ZArlBVl4/3a2iEriptvg6gdvkpq9tEtWBMdkrBUgXKMPrwsfKsKZ8kQ+VXgS9cHFjAHn
         2wY/UchXD4y2VRQOt9TDV3FVAZGJ7oKirTqocvASabFfiuZW8Z8jkYbsHCUTpbHIGNS1
         ODPkKtkhx+S0D4icaGM+FMZ2Lt0lTCTtKNh9+LmJb59lGOS331Jym8dURdICshF7UX+s
         X0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date;
        bh=UxtN1BIaN3WcxHEmRC1CN+JEMOjBTmNpbuuXcmYcvQA=;
        fh=s/kMT2z54YyLoaDdqcysXi5atpy4VWuzPgW2BOhEi1U=;
        b=GctH54GNMnrLj+WxmS0bY/gR3ro80P6eGrERqCfsCR+ugzyKE+VsRzyP9BVVARtQGO
         pR0k+eQYC1W8BG18qz27Bh6sPyO14UFyM+0TDbnG9RUIUFTgZtfG5J5t+KSUxCIa3c6Q
         mzv5s2H6L9/qOW/IgTRLiVRATFkS0RIbQT+5baMuRlhf7qFdGw2wDoEaW/kgrHXvtT7j
         YV6+CNJgojUVJTIuWd6nfBm0+VdyVw/VPKe5CP3mtZgId8o5smdTIp4mrNY0S1eE2jLt
         f/AOGdVeVBkBPSW1wHgnoHX6XG52mhRHjA/1AU7yJwaC6egePKGgrjSKqoRaordWk981
         8nRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Et5orT2h;
       spf=pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.188 as permitted sender) smtp.mailfrom=itaru.kitayama@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <itaru.kitayama@linux.dev>
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com. [91.218.175.188])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3b473aaafb0si491188f8f.350.2025.07.03.15.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.188 as permitted sender) client-ip=91.218.175.188;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Et5orT2h;
       spf=pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.188 as permitted sender) smtp.mailfrom=itaru.kitayama@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Fri, 4 Jul 2025 07:04:41 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751580291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UxtN1BIaN3WcxHEmRC1CN+JEMOjBTmNpbuuXcmYcvQA=;
	b=Et5orT2hRkElcOB4Z2ykzVCDyOdgqvOefDO5Dkdk8ean6TdMwJeCc6fI2k+RLDA3/Yluq2
	TVDF/r+hyjS1ovDxkPAsIjkhh3lqtNqGTv2KU1y53Or2YduTHrL6JMuR43M7VByz6uedhx
	d4r/a8NSOQGvdoUb/MhAvc/IAcB60Gk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>, mst@redhat.com,
	Zhijian Li <lizhijian@fujitsu.com>, linuxarm@huawei.com,
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH qemu v17 5/5] qtest/cxl: Add aarch64 virt test for CXL
Message-ID: <aGb+eZxaZYCofHk8@vm4>
References: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
 <20250703104110.992379-6-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703104110.992379-6-Jonathan.Cameron@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-TUID: /LwdDNMLuRfY

On Thu, Jul 03, 2025 at 11:41:10AM +0100, Jonathan Cameron wrote:
> Add a single complex case for aarch64 virt machine.
> 
> Given existing much more comprehensive tests for x86 cover the common
> functionality, a single test should be enough to verify that the aarch64
> part continues to work.
> 
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v17: Tag and small fix for patch description (Eric).
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
> -- 

I checked out jic23/cxl-2025-07-03 branch and built fine for all the
architectures, and did `meson test qtest-aarch64/cxl-test` returned OK.

Again, for the latest v17

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 2.48.1
> 
