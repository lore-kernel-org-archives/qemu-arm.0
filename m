Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1300601ejb;
        Wed, 19 Jun 2024 03:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWe1CJPWOn8mBzYviz6/RR3DlS1mvCXZtrphOEQUAF+RCIVjEfb8zjPUmUd80a4PREic+V40VTN+wJ0ZBt9sMbxrAW0RCon
X-Google-Smtp-Source: AGHT+IFqf9oEIeqV0bk7y1nvFgyxrefKcftgM/t2N27NwRXqMqsZJ+BXLtv9m1wGAG4XiN6xPxwG
X-Received: by 2002:ad4:57c7:0:b0:6b0:668e:9d2c with SMTP id 6a1803df08f44-6b501e4f2a0mr20138646d6.34.1718791992976;
        Wed, 19 Jun 2024 03:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718791992; cv=none;
        d=google.com; s=arc-20160816;
        b=dV7Dbwz7YQe+4IAuA+ECDQ9yuxgMImRp/8Nrg+hCKhRpo1OqwzIWqQoQ870HUnywS2
         oDr1TRZwdP7WEvgUy7H2A6mdx8xSY6YlJhVcmzFlELn43q/blhZGODZZHp6ewVm01j9n
         SFC1/U/dPUbXUzvGad1Fm4CrR0BKxUgqKfNdD5vsJi7d7+Pn2lLpM1fmv4dDrKahwo0/
         vsilBd8RJEn/CUfgEJDeFU/amWKhfDgw444lUPRLNkUFESGcWWmUPgoX2v4FNNhM6jEZ
         aPDQooX/KFKe4UVL/Q2w17lYYM9ymKFgVZFl+gtUXrVMzz6dLxgK6SGv+B6lt9qJSxgS
         OZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=yxcEACsROowAyIbQBJWZ0dhTLTQHNsHOEPITA/EhrVs=;
        fh=ZxRFDSOil1FhUMUdb80VkjF27tzC1/EMOnoo8ziq0pw=;
        b=UWmVyHSUZiz6eCPZ8+FzQdsvm7JpGHN/hwR0zPpqRa6sYRt1ozlsZkG1EZbChawuWR
         jQjvBzxwQCpCGQVlTS0IGJEmSkqRwWxQZztnuZiWi4iBLGsORp5dnMXmbHSuoKTsDV8L
         2bcRLmPoOJKUnN/MtdCopbKYZXR8gxakXKi47v99YLF6dKhj4cXYtD5x0n5PFDPYi25c
         nmVscwGbBVhlBy4jv+CP0GK5cEWDPO2QLiQJ5XKO4i/b1Y+IpL3/TWeiX4389R5ZW7P6
         zPGcqbe93Uc11cAjzvu/L7eeF2qd0HO0/jKz70hl/wpNggYveChEVocwyU/bIPDxmpLP
         Znww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XObLlucy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afdcf2si142441366d6.195.2024.06.19.03.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 03:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XObLlucy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJsJI-0002oF-ED; Wed, 19 Jun 2024 06:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJsJG-0002ng-Gz
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 06:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJsJE-0004mZ-QK
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 06:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718791975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxcEACsROowAyIbQBJWZ0dhTLTQHNsHOEPITA/EhrVs=;
 b=XObLlucyUq8y90nFvOihTkERIluYtavobnsigWwbwMzqs+04e+UjKC+mA0yThPABt4VxDO
 Iw9n8UzLL3BGJq9ePts5fj7Np+GFBcPI36Or2i9moGkpIGLpSugu6x2gGr92rM2A+XIs26
 dQBSNbCpA6r4OkmeK5OBc2sKSR6ryrc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-_Ah7UJvKPMuRfY4ONTxBmw-1; Wed, 19 Jun 2024 06:12:54 -0400
X-MC-Unique: _Ah7UJvKPMuRfY4ONTxBmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4215b0b1c11so49783845e9.3
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 03:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718791972; x=1719396772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxcEACsROowAyIbQBJWZ0dhTLTQHNsHOEPITA/EhrVs=;
 b=kW2r0hMWvF6LZhh7tTchL+7CgSfWo+4ZeLCGaQGS/RXAHgv+GjHh6vyX1KLBqxtFZ2
 GJBvoZklalXJsGXzWxKgw1th7l6r1sCtrnWRFTuoUnfg/Bv/bDmriPJNYV7S/xjfAx7g
 V4uzmxtAQw0B9yCTOk1ss3FPHexbU52PEVYm6JtT685ldxG5HKKBJTe1H8SRDM3U94SA
 LWtSBF78EdixcKr6IiYyZwd49EKEZiRetJXBHQhDL+cdO36VKbNKEO9R5xzJ3jbSPYT7
 8QH056fy3GzQAIa6Oxr1E9lg272OqiUpHthHfqYJ/QERdBPH+YzqhnJMoceQCJveGkQ/
 Kayg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZd4efHyIncogCS+d/WZSvQ9C1yJBr2d0LyQSTpwmSmSjJE5fg3T3WLkGp70jqJMrD/pQtf2KHzfaBuHIY2C1lQffM
X-Gm-Message-State: AOJu0Yy896e2uMWCE9nKldC/dIzjWJSfdamrE6jVIWizDROTU020kcue
 uFcnCjCM25Mz+jks6CogEV9PdUR2bqa1+aXYoRpumr2bY49sITImuILyUsWwyTbz7Ca5Ztv2n51
 ZQUEuvXDHm8PbmSQ7kmvxSCtpJSGAc3l3ENV3x//UPzVRLdDZgA==
X-Received: by 2002:a05:600c:3587:b0:422:6e65:a4cb with SMTP id
 5b1f17b1804b1-4247507865fmr15130945e9.3.1718791972552; 
 Wed, 19 Jun 2024 03:12:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3587:b0:422:6e65:a4cb with SMTP id
 5b1f17b1804b1-4247507865fmr15130675e9.3.1718791972222; 
 Wed, 19 Jun 2024 03:12:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42307d5b78fsm174578745e9.6.2024.06.19.03.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:12:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 12:12:50 +0200
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
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 11/12] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <20240619121250.38040a20@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-12-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-12-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
X-TUID: mG130psmxcOM

On Fri, 24 May 2024 11:44:10 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Add basic ACPI table test case for RISC-V.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  tests/qtest/bios-tables-test.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c73174ad00..880435a5fa 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1935,6 +1935,29 @@ static void test_acpi_microvm_acpi_erst(void)
>  }
>  #endif /* CONFIG_POSIX */
>  
> +static void test_acpi_riscv64_virt_tcg(void)
> +{
> +    ->cd data = {
> +        .machine = "virt",
> +        .arch = "riscv64",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-riscv-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-riscv-vars.fd",
> +        .ram_start = 0x80000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    /*
> +     * RHCT will have ISA string encoded. To reduce the effort
> +     * of updating expected AML file for any new default ISA extension,
> +     * use the profile rva22s64.
> +     */
> +    test_acpi_one("-cpu rva22s64 -device virtio-blk-device,drive=hd0 "
> +                  "-drive file=tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2,id=hd0",

Can you reuse test_data->cd, instead of specifying disk here? 

> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_aarch64_virt_tcg(void)
>  {
>      test_data data = {
> @@ -2404,6 +2427,10 @@ int main(int argc, char *argv[])
>                  qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
>              }
>          }
> +    } else if (strcmp(arch, "riscv64") == 0) {
> +        if (has_tcg && qtest_has_device("virtio-blk-pci")) {
> +            qtest_add_func("acpi/virt", test_acpi_riscv64_virt_tcg);
> +        }
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);

