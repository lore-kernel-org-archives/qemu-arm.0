Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp777586ejb;
        Tue, 18 Jun 2024 05:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUwMk9BGS3zi24nY8kIy2AOjWhoEovqQGpaFbrkBVvx/KGQKnE4CnHdQ+TkZ7xHLjeD1ZaPRvbMv+Ysk0CyOUC8R1qHxQW
X-Google-Smtp-Source: AGHT+IFwZR+LVIogx6iIWrQ0T65qHwaWEEp4/hZECzfNan4NSc0XqBe4dq8p1KYpiqVo/YJNkEKg
X-Received: by 2002:a05:622a:3cf:b0:441:5a6c:6b7d with SMTP id d75a77b69052e-44216b35d6fmr163720611cf.55.1718714093537;
        Tue, 18 Jun 2024 05:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718714093; cv=none;
        d=google.com; s=arc-20160816;
        b=zpuEDSDDuDBDcTsjCxF9O0CljUHnFQWxSuAxYNZHcEd2m8NIdWnMJ/QPTx5BW8Z6Pl
         qb6IyPSEbWGLgnwlskGnYDfw5zf3OI36ktV5YEBXcEvhKYerxx+eJ0qnRQJeAdpU3Jnx
         59avVt8B7oS9s2SFBJTQkoGBN7VHM4OtaJ6i2kdeQwvOx6p6xKLMLM8Uc4+3yhVygbUS
         v9vzvrtfg3SPGq/P8Oepctg3wotEmGIyrd9TaagIm01NV6xZ4JdPSkH+rL+bMMwmP8bi
         VASOMO19qNNlU6H2COEgJATOr0u2QQr36KThIpuWfjXsqkN338E0hP2wMlUAWU+/Xzz8
         /vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=soFDg/JDY7uG8Ly+ZcdmlCyJ+aAaVEHDj25czzys79w=;
        fh=sTpEOxoQah9b6DwicPwddMh5DWzwC2VG74WI3dLZvMw=;
        b=QpcdkXs5BcMyN9pUWMFleXtrdQGCUdlPoFbSo3OMztq19EOEEVGBJy6fqhvLrbpUe9
         KTXCJN5Lkem8Y0obvjZ7Vfv4/desx+67u89MnnGdZO/90fb+XSEw+frJLT97R/ovAHxy
         NLT923gYX8OM7rpVowUGwMvx31MKbSfZyBiig2is9UIFimnBuKT9Vvr/jJ8UVfNUW0k1
         pNy0KYdJxaLh48UyhT4/+2tYVoq19SvTX2p5C/b696qie5FmsQvtzE4j9NOzXcvXJrqC
         t9DaLdFpqQ2VpFC0gWoq77NZESVOXZCyi0PrLVyG/XM18tX+m58dRhdRX1Fg2yuuCHIb
         5SoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iT2UR8af;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f30f86basi127763211cf.677.2024.06.18.05.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 05:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iT2UR8af;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJY2w-0004jn-Jt; Tue, 18 Jun 2024 08:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJY2t-0004jO-9m
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 08:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJY2r-0003LC-G5
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 08:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718714080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soFDg/JDY7uG8Ly+ZcdmlCyJ+aAaVEHDj25czzys79w=;
 b=iT2UR8af/HsfLemyvUDIlWrrQgpEXtIxecvpfGs7LVM/znp1f5omX3UK/K6BMNZmbfeYvU
 fGFPRQVODrQtvMgfL4soP/OA2Ms4OjQxeO+e1hCwFUvekkdpko0eEHPwgb0o2cxeks2192
 Spad5/rr+jzPIP7c1Vkt3ZJdpkjLpHY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-IPJUuw0jOC-HYoLRBIU4xA-1; Tue, 18 Jun 2024 08:34:39 -0400
X-MC-Unique: IPJUuw0jOC-HYoLRBIU4xA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-422322e4abaso29297865e9.1
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 05:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718714078; x=1719318878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=soFDg/JDY7uG8Ly+ZcdmlCyJ+aAaVEHDj25czzys79w=;
 b=I6RkiHiI+FDDVds9cTDsLaWp7OVMfHBxbDqs7L/d4iWGr5+qWOcJTy4hhG7OndMuQ2
 vuy4uUvrm2m+X4wu6ea2nNOVCRokIu6DPJGhLlrhMu/2eoS1Vd7QdxSyVlww8R1ow6+9
 HBDBJ8gj3yW+5jJKM70HXTUwbmkNzwl6MpgZ3rdlhtB95AaURXCIsQ7j6J7XGXcg7TJH
 XaKzXjuPODkzqkkf6qN9KsAW4TJraO1f4wB5m03eZ8BYf6+ENiNDP3s41p7Ou5gVhiq0
 sxmoSvhTbBA/sHJ7S6O7ejqXQwAGK3PnD3qBdKDi0tLDo05X7cGumblMxf5+3MORXn3Y
 h2tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxw7Z0UovHScQGHC0J3IT2uKEUqoVnMw7gbyhzgU+/vYTMhwOLZ49mvVSSwSaam0dRJU3RIsR/jVXjfl+POAOScLyT
X-Gm-Message-State: AOJu0YyMzGJ3V69i9ztlULo/kj/PMFw8smMqgoXiyy/XUgjrTL/sfyQq
 s2ea7T9gg8qBUIWOby/ZwQWkvp5XL5twUfj/zP6tb26ELsDfmzCyIoCodZbNW5vVUrlElHAIVu/
 1wQKeMBuU5B0rhU3U9gqjjsBnN3GNhnuGrb999w241votjMh8aA==
X-Received: by 2002:a05:600c:54e4:b0:41b:d6ca:eefa with SMTP id
 5b1f17b1804b1-4246f5ae5famr21873735e9.16.1718714078006; 
 Tue, 18 Jun 2024 05:34:38 -0700 (PDT)
X-Received: by 2002:a05:600c:54e4:b0:41b:d6ca:eefa with SMTP id
 5b1f17b1804b1-4246f5ae5famr21873415e9.16.1718714077589; 
 Tue, 18 Jun 2024 05:34:37 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4246bddc59bsm50478065e9.5.2024.06.18.05.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 05:34:37 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:34:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 04/12] qtest: bios-tables-test: Rename aarch64 tests
 with aarch64 in them
Message-ID: <20240618143436.0981cb2c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-5-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-5-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 942Kwa8EbyE9

On Fri, 24 May 2024 11:44:03 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Existing AARCH64 virt test functions do not have AARCH64 in their name.
> To add RISC-V virt related test cases, better to rename existing
> functions to indicate they are ARM only.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 35 ++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index d1ff4db7a2..c4a4d1c7bf 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1570,7 +1570,7 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
>      test_acpi_tcg_dimm_pxm(MACHINE_PC);
>  }
>  
> -static void test_acpi_virt_tcg_memhp(void)
> +static void test_acpi_aarch64_virt_tcg_memhp(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -1663,7 +1663,7 @@ static void test_acpi_microvm_ioapic2_tcg(void)
>      free_test_data(&data);
>  }
>  
> -static void test_acpi_virt_tcg_numamem(void)
> +static void test_acpi_aarch64_virt_tcg_numamem(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -1685,7 +1685,7 @@ static void test_acpi_virt_tcg_numamem(void)
>  
>  }
>  
> -static void test_acpi_virt_tcg_pxb(void)
> +static void test_acpi_aarch64_virt_tcg_pxb(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -1758,7 +1758,7 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>      test_acpi_tcg_acpi_hmat(MACHINE_PC);
>  }
>  
> -static void test_acpi_virt_tcg_acpi_hmat(void)
> +static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -1914,7 +1914,7 @@ static void test_acpi_microvm_acpi_erst(void)
>  }
>  #endif /* CONFIG_POSIX */
>  
> -static void test_acpi_virt_tcg(void)
> +static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -1933,7 +1933,7 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>  
> -static void test_acpi_virt_tcg_topology(void)
> +static void test_acpi_aarch64_virt_tcg_topology(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -2016,7 +2016,7 @@ static void test_acpi_q35_cxl(void)
>  }
>  #endif /* CONFIG_POSIX */
>  
> -static void test_acpi_virt_viot(void)
> +static void test_acpi_aarch64_virt_viot(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -2192,7 +2192,7 @@ static void test_acpi_microvm_oem_fields(void)
>      g_free(args);
>  }
>  
> -static void test_acpi_virt_oem_fields(void)
> +static void test_acpi_aarch64_virt_oem_fields(void)
>  {
>      test_data data = {
>          .machine = "virt",
> @@ -2364,16 +2364,19 @@ int main(int argc, char *argv[])
>          }
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg && qtest_has_device("virtio-blk-pci")) {
> -            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt", test_acpi_aarch64_virt_tcg);
>              qtest_add_func("acpi/virt/acpihmatvirt",
> -                            test_acpi_virt_tcg_acpi_hmat);
> -            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
> -            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> -            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> -            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> -            qtest_add_func("acpi/virt/oem-fields", test_acpi_virt_oem_fields);
> +                           test_acpi_aarch64_virt_tcg_acpi_hmat);
> +            qtest_add_func("acpi/virt/topology",
> +                           test_acpi_aarch64_virt_tcg_topology);
> +            qtest_add_func("acpi/virt/numamem",
> +                           test_acpi_aarch64_virt_tcg_numamem);
> +            qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
> +            qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
> +            qtest_add_func("acpi/virt/oem-fields",
> +                           test_acpi_aarch64_virt_oem_fields);
>              if (qtest_has_device("virtio-iommu-pci")) {
> -                qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
> +                qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
>              }
>          }
>      }

