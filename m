Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2631555njc;
        Thu, 12 Jun 2025 15:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoS3No9dh7dzpCMH0n9qifcRCkGpzdfjGwQvKgkHhm8VXdGOTM/hogqIyZ5Smw9srbvyfYpmN0eHL9Tg==@linaro.org
X-Google-Smtp-Source: AGHT+IEW7y1086Vg4hY85YW0D4nA//O7xw4a2aFY1Ht1NVqeHJ34i3roAMkbyg6ifZ7/QadkdxYz
X-Received: by 2002:a05:600c:1d06:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-45334ad086fmr6585635e9.18.1749765745438;
        Thu, 12 Jun 2025 15:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749765745; cv=none;
        d=google.com; s=arc-20240605;
        b=df4fPsckhzDt9VMJNWsPXjAK8ynUDW3TJG6hy6xG0FyZv0L/xEsGRzfbq/bhcN9DWg
         FhP7MO6fzzRE0iYJZogsZuzAWZnIULxif4OpUzahifSN0PUEz7lQNfM9UPi59x0uHILe
         4uNKAK2SGXhfL5Z2gpudsiioINsJW1JrBNsPgS9E5OWStx5hDUZrwFnpxN00z6rXXn1d
         PFV2Cj5hAPKOaNZd3zC1K5/l10xz/rd8LFI/t7CPI0X2Jxsi2LhDdnXQWW5AWwClvqxb
         GVuMGcmqVMNiIc6ppfnC/Gq5V5fGpNptT1o0o5MfpsPwLOdQhz74V5uCnn+uOTiiJbZf
         35nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date;
        bh=yQfqAp663vRwAp+Zj5rZDIUplmHlYtLgfJHOGelwtm8=;
        fh=DlJwmdym3I0/Q4B6C1e6VCySG9F6VCg86l6y5nvKLDA=;
        b=V7WViFo+BKcYoOUocgXHViuoRzWJ5G3/F2byorDvRSbaXdfQrVSsJXdz+lo0D5+TbM
         rMk2Xv8938TbDTwqcDjhTmdjK2J9GTp5ikYdEtP2K/G62ve2zKPQBmk3VoFQfe/lPFYT
         bTHeOMi0BTjVHez5iRsk0gtabGwT3k0gGBdLx6f3h+QvrRfSlQtk91eyLojF53Ddhp6a
         jIQtKXDFo146NTzt44BiqmQ3M5gCSo4ANRcSsSR+EHRS4HTj0JQ29y0MeQgQZBqjie5q
         gAAvoBv3fxiALPL2N5ByX96mHw14U2/YPiZac00oyknrEC2EWNH8oQ/mGKhyuQ+dcOAT
         UCmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=H8clXi0f;
       spf=pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.183 as permitted sender) smtp.mailfrom=itaru.kitayama@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <itaru.kitayama@linux.dev>
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com. [91.218.175.183])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4532e17d9c0si21469375e9.84.2025.06.12.15.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.183 as permitted sender) client-ip=91.218.175.183;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=H8clXi0f;
       spf=pass (google.com: domain of itaru.kitayama@linux.dev designates 91.218.175.183 as permitted sender) smtp.mailfrom=itaru.kitayama@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Fri, 13 Jun 2025 07:02:14 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749765744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQfqAp663vRwAp+Zj5rZDIUplmHlYtLgfJHOGelwtm8=;
	b=H8clXi0fQY0C5Ke8Y27lfG5t9ZdPGZ/tizYlCSgvP1+ui2L1ljE7mNgqLAo56WY5af7AUA
	s6zx+OLSkwpj0WP53oKYP7AybCNdg0KPkHuu88yLI98Heid+YAyc2UmWBPusSKrfWmnies
	ba9AdICSop5cNQAInnpUwvQe66bA9vE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
	Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
	Zhijian Li <lizhijian@fujitsu.com>, linuxarm@huawei.com,
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Alireza Sanaee <alireza.sanaee@huawei.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v15 4/4] qtest/cxl: Add aarch64 virt test for CXL
Message-ID: <aEtOZkkb7R5jvgRE@vm4>
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
 <20250612134338.1871023-5-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612134338.1871023-5-Jonathan.Cameron@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-TUID: c7lSbBuxaVXb

On Thu, Jun 12, 2025 at 02:43:38PM +0100, Jonathan Cameron wrote:
> Add a single complex case for aarch64 virt machine.
> Given existing much more comprehensive tests for x86 cover the
> common functionality, a single test should be enough to verify
> that the aarch64 part continue to work.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v15: Dropped tags due to changes in patches 2 and 3.
> ---
>  tests/qtest/cxl-test.c  | 59 ++++++++++++++++++++++++++++++++---------
>  tests/qtest/meson.build |  1 +
>  2 files changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index a600331843..c7189d6222 100644
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
> @@ -197,25 +203,52 @@ static void cxl_2pxb_4rp_4t3d(void)
>      qtest_end();
>      rmdir(tmpfs);
>  }
> +
> +static void cxl_virt_2pxb_4rp_4t3d(void)
> +{
> +    g_autoptr(GString) cmdline = g_string_new(NULL);
> +    char template[] = "/tmp/cxl-test-XXXXXX";
> +    const char *tmpfs;
> +
> +    tmpfs = mkdtemp(template);
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

V15 is applied cleanly using b4 on top of today's master.

$ meson test qtest-aarch64/cxl-test
ninja: Entering directory `/home/realm/projects/qemu/build'
[1/8] Generating qemu-version.h with a custom command (wrapped by meson to capture output)
1/1 qemu:qtest+qtest-aarch64 / qtest-aarch64/cxl-test        OK              0.21s   1 subtests passed

Ok:                 1
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru

> -- 
> 2.48.1
> 
