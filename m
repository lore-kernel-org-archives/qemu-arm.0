Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3252021dye;
        Tue, 1 Jul 2025 08:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVORoUZ13FKcoQmZ/OLl8DxEUU9ycCExZgmS54J0jt199U6JVauXj7DnltDLQDwF0s2jJBR5LYI9jsTg==@linaro.org
X-Google-Smtp-Source: AGHT+IEsXXOzFXaTXJjuvfV9QAHUQFO97RDxXitp4g9jQjYdk2fBSUw9Mv2vxdERvHqJq82XMvcl
X-Received: by 2002:a05:6871:358b:b0:2e9:fd62:9061 with SMTP id 586e51a60fabf-2efed7376bamr14641998fac.32.1751384849707;
        Tue, 01 Jul 2025 08:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751384849; cv=none;
        d=google.com; s=arc-20240605;
        b=YuclyHH5oLg1Jpvld7px77YU9aSub1vbTLqdRi4W9yAcy5E/n7Og6sZo056LVMtVyM
         89IIPR+b/5Qq4MC9zTj0qWdmjeyvHJvzgGdWvpvInIyFe/Ao16Dn3SOphW8BDL0fAZbz
         HGBUscRm7RIS8sCrbEazAhB5bq7EAjW6bfbvCXxNCPIBfdn3TGHq4s6gjFHzXX1AfVwh
         SByt+YHQ908Yr5nZl8Pd17UpC+gUbN3QfhZbXnHW7LZBrImv8XzuhqCNyMlblFz9CAZR
         dA/mebp5FpivBe6ExgBa7Bq5sAHf7WFn7fL5IUwaxO4ywMd4abB2c8h8ss6khUDF7i7d
         1F/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=k3wxbJ6u0LbCPii/UzJiKDKg2FWqqu/s9vaGG/5Susc=;
        fh=h1kYG6K1iRt7RviPTuuov+vDQBi9j0CyzpoyCuhGh+8=;
        b=g/2OML7yznEPcIqsq8cUzfpw5X6v15h4Ku8YvVzQTbK9nXIzNE41qhhOeQhsN3zMEW
         wlG618PHQN2iMpgb0g3yDkKAd/oYqBN4A1Uv/vw4QU/fUuXy4Ub4fRr2hMkgggVDhs/Z
         zYELJcTdNEMeiaiSzzNHWqtLrbKrfnySA2jcIqMzysZcELXirim2WMQI/4ubinhYeBBh
         rCD3jDF7rJjgqr19BdakQVzOkT9so4WZv/6W/Dk5iOmCGro9f5fwmw+CbqE9CUpwEchf
         iWiKh/orstufmcPuiF+SKy7nuhkiRHG+RmU69oQKv4SZBlhLZr6ZrXJsI3dKt+kyM7O+
         bSvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwatLYmt;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 586e51a60fabf-2efd4dadc23si9320415fac.68.2025.07.01.08.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwatLYmt;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751384848;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3wxbJ6u0LbCPii/UzJiKDKg2FWqqu/s9vaGG/5Susc=;
	b=QwatLYmtLcS7PpqMBFAF7aMjZRSpQ/w+a46JcdXYq9WXBPXQHQduhinfCJ5P5r9Uzmd3zk
	DJMXLCUcZ+MGQmO90QRLSLsQmjDq1sYp56QNpyla5BXE190VdB9Qv8sFNjAuZyH5ge3uHc
	Yi//7lBf99wX8Su6ZoeHCh+9PMvw+MQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-EqMb52TfOUOpsrPdL0RTDA-1; Tue, 01 Jul 2025 11:47:25 -0400
X-MC-Unique: EqMb52TfOUOpsrPdL0RTDA-1
X-Mimecast-MFC-AGG-ID: EqMb52TfOUOpsrPdL0RTDA_1751384844
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d1fso21345535e9.1
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 08:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384844; x=1751989644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3wxbJ6u0LbCPii/UzJiKDKg2FWqqu/s9vaGG/5Susc=;
        b=iwm552eCwl3qTcP16kQXvq31y8QS7AZw/LJjR8QbCH9Re5z+5SlWwAH0KsCW6GqT6s
         /moAhjR/3TzaTgHjVcoy27xBcMsyuUe/wXRTtfniGZV5vREyTnf2IVchBqIo8pwRb/hB
         PqZG2spmEtXazt9o5eEqT51lDT138rp040IZcK1w0dcr/dm1iI1e+1w2U4NLgjcpl1SW
         yThaJ/aq3YjbLp4RyBnas+GMfcJ1RizvD6zPha0LX48FpJ+drOGbcwTe4WD4chD2Gu2h
         SvduVCck2H1EWXUYuBLpGpkogPIo+JPT4HSYMYaIkSIP7U9WhPARs/IqXiqeHLpv/1ut
         OKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ6iASraTGf2mlIJir0YSyj2gN9ImtlibUQeZ4R9EklhhmxvTHbVT8kTFszN8gFsB3GJaKmuGxzW68g==@linaro.org
X-Gm-Message-State: AOJu0Ywx0GWfT1srQXehrHR2qHs3B5kn6A42QlXSDh3eeq0nfxLaS5aF
	e7eYrMgKZibYpS0h1PBtJnqgrqsski//za8DmYnCaYwrM9hTCNynpyv+7Ewn255qUOCzGRHE8wL
	+vh7OlEHK8WmIMvijpFIGGlzdlSsohnU+r5C2CsIBysuz4oXPIc/lAaguxQ==
X-Gm-Gg: ASbGncsD3hMoMK0vmGj5WxXRdWDoSh5aKB9yojNlviM3RAjlcYKnzbbWsxoUi+fqOdH
	lNgTRARaHRmK3qHqQSjyK9bI4uk2sg/K5mbdjsJoKA37dpdExjeRAYSE54o0jqJ+EDdbURjh9YD
	ngrq+Y7xFN8O9stnnhR7XN7bvud7pNztURZg4qqpulKQBH+rXlitgNk6Mjn3mHToP6DurMw30hM
	hjS4yGIpMUE+iXd+3R9kyI6Gjbkd7yUe7lQiL9xXtGJsMmu/2HNVUM7slSH/FoOSJ/9MCox2Ait
	uhrvx6YyFM5TMV7ZEVuKVvovzzylZyPSvhsHEt48RQdJzplC5hNzW7xOOfh2mN/4O7Ry0w==
X-Received: by 2002:a05:600c:c4a7:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-45391b6b961mr155578275e9.1.1751384843634;
        Tue, 01 Jul 2025 08:47:23 -0700 (PDT)
X-Received: by 2002:a05:600c:c4a7:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-45391b6b961mr155577905e9.1.1751384843132;
        Tue, 01 Jul 2025 08:47:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm198152655e9.3.2025.07.01.08.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:47:22 -0700 (PDT)
Message-ID: <30f089df-c521-49c7-ad1f-f4663de4958f@redhat.com>
Date: Tue, 1 Jul 2025 17:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH qemu v16 5/5] qtest/cxl: Add aarch64 virt test for CXL
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 mst@redhat.com, Zhijian Li <lizhijian@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: linuxarm@huawei.com, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
 <20250625161926.549812-6-Jonathan.Cameron@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250625161926.549812-6-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XOOgl4AyvMtKcC97EiJQlnqaPg6-cygADbn198ITzPc_1751384844
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: xgjOTNiTrvTw



On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
> Add a single complex case for aarch64 virt machine.
> Given existing much more comprehensive tests for x86 cover the
> common functionality, a single test should be enough to verify
> that the aarch64 part continue to work.
nit: continues
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
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
