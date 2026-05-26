Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B9BCD5BD0
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRt1B-0005tS-9q; Tue, 26 May 2026 10:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRt10-0005qO-08
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRt0y-00087s-BU
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779806654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKfZEEQdTt++se/+kXecI2+IIX+I9AD5xJpi8dFnHgo=;
 b=SXwfiLACHbo6rBaKJASNDkMl27uqJZlD9H7TYO1yBZG6eJwOXvY+Ufrax6bbRhMYhRLxIl
 DTe0BMrKjaXG9uX2IzJXSk2v6eC93IAAgKucLh8zXuBze6ElLl57Mt3XTLFscSBtJLQuHS
 0JVaVHVDVqU+k4m2dzkLyJ9VjnTKz/s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-fEQ6wgeQOSK6nnakbh_UFA-1; Tue, 26 May 2026 10:44:12 -0400
X-MC-Unique: fEQ6wgeQOSK6nnakbh_UFA-1
X-Mimecast-MFC-AGG-ID: fEQ6wgeQOSK6nnakbh_UFA_1779806651
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43ff19e54beso6877822f8f.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806651; x=1780411451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKfZEEQdTt++se/+kXecI2+IIX+I9AD5xJpi8dFnHgo=;
 b=EJYSziYcC+dSDyuVS8X8Jjxdtrpji/Ud1+Grxdzm4SczNjE5LYLFRQgLZ034Mn1myR
 3NOmxhzYqWVo81RNDkCKg6M+3TG14kRVHiOMwDajrUoQkl9l2r5OO2I3noMpv5A3MwSz
 829oQ2aRM5I7Y3W9I4ogxHB8XMnKPpZTE2qwOpliZeq4nI1Z1Z0rNFsNgVCMEOEl021X
 0HWbVNV+6Lcd7NTZ4GVsJYzg+i/4C5iRUqjQO/gNlUaKC44FjiakGt2kJxzdHMlkAMCj
 ATbpEyvws7BOys0exnl3+6Cc1W4+9coNwsF75226toazKrPWKjY0dmZ+0inbPV2AHXM8
 0Icg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/LfOEmUvf7/z9VHjfub8t7g5A+9dQSZtGl413NQsqBOPn/yfwMvZvS/Ifa3IkZkpFgDoYabVz/IQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywc3e8khydIPuR8FCCiavukS3fYQeaIKNs5S6FsCSZxK2T5Sp2h
 g/GN4qOr2P7pKuPJJX8Zq+cl8FkyI+Unmi7XYbT+f6Q5ZaRUT68BEJXSihSP4LF+NuUfqg+PVvK
 eYTdHSPvfi6XNT8LaATl2QW2ba+HTiXwvwQTKt2neLrbkUT02CRLOFA==
X-Gm-Gg: Acq92OH7Ji9sU3sw9By1mtGJXV2gLvFs/btwy1wS6dwbn6wwkpzoE9PtzPITNkrq2QN
 /U1azUnxOXn7Px7RsgxLVmRLozs7Gv88NXnO0eMjX+4vP5vvJT2klvh65WOtnLVa5hv9rR8jtVn
 flgln7rzBZQcqozk+OY8TLImpZf26zklLD5KeBk72V7Qq54XaQGXlChF8K30gb7Tme4q3+wxOaN
 1+SnnhnOxBcV2q/xKl+1psku7Kr3VyZGRdeM4/UjN/jyEsV22CqXAwG/asuqAjvUSsjHCyfZSMC
 ihn/OiFLjI3GPBR2A3aqBIbmI2Od9sLeA9SdTYvtRJcK/3Xu47THPRHJIuJZtHbDvoxBdWKv6mH
 pNUopU2KYUpTXq3a7hwdjEzy3h9MpVaIP31xTwIGxFGtuYmJvKHKNYJ78Oanzo4Nl
X-Received: by 2002:a5d:5f4f:0:b0:45e:73b4:e731 with SMTP id
 ffacd0b85a97d-45eb38a1ff1mr32786985f8f.14.1779806650720; 
 Tue, 26 May 2026 07:44:10 -0700 (PDT)
X-Received: by 2002:a5d:5f4f:0:b0:45e:73b4:e731 with SMTP id
 ffacd0b85a97d-45eb38a1ff1mr32786939f8f.14.1779806650200; 
 Tue, 26 May 2026 07:44:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9f6ffsm36326873f8f.1.2026.05.26.07.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:44:09 -0700 (PDT)
Message-ID: <cba87a73-0458-445e-8c12-683ca639f2de@redhat.com>
Date: Tue, 26 May 2026 16:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] tests: acpi: arm/virt: add GTDT watchdog table
 test case
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-17-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-17-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IY-LX8D4oM57u37Wv_1BmtuR63bGClrgthElTuBRKik_1779806651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/3/26 10:25 AM, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 5082866184..11c6854af8 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2290,6 +2290,24 @@ static void test_acpi_aarch64_virt_tcg_wdat(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_aarch64_virt_tcg_gtdt_wd(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "aarch64",
> +        .variant = ".gwdt",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * MiB,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 " "-device sbsa_gwdt", &data);
depends on the instantiation strategy, ie. whether Peter is OK with
dynamic sysbus instantiation

Thanks

Eric
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_viot(void)
>  {
>      test_data data = {
> @@ -2910,6 +2928,8 @@ int main(int argc, char *argv[])
>              }
>              qtest_add_func("acpi/virt/acpi-watchdog",
>                             test_acpi_aarch64_virt_tcg_wdat);
> +            qtest_add_func("acpi/virt/gwdt-watchdog",
> +                           test_acpi_aarch64_virt_tcg_gtdt_wd);
>          }
>      } else if (strcmp(arch, "riscv64") == 0) {
>          if (has_tcg && qtest_has_device("virtio-blk-pci")) {


