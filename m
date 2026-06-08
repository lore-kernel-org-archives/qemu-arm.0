Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E86CD6E79
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 17:09:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWdTF-00037n-VN; Mon, 08 Jun 2026 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWdTB-000377-SD
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWdTA-0004F5-BW
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 13:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780938538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfvPPhM7xeDBVVNCqKRfP7HyRd6IRZn7Td/OA6zUdKA=;
 b=RQUYIzyaM4jUHzsVJ3/w47XTQftxyM38O6N7AM8zYAlTfKkghVYRlgkcVNapJfEegZ00TS
 iz6dRjkAVCH87wlwE27w+ngo1IAXbd3I7udhMVubcULjAz5TwkJwlWsI8YHhbXn2trgB1Q
 fOrJTDePxk4L3nBz6pns/toA08JajdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-9OxX3TxwOJOLfugWZD79gQ-1; Mon, 08 Jun 2026 13:08:55 -0400
X-MC-Unique: 9OxX3TxwOJOLfugWZD79gQ-1
X-Mimecast-MFC-AGG-ID: 9OxX3TxwOJOLfugWZD79gQ_1780938534
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490ae3bcf4cso22682785e9.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 10:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780938534; x=1781543334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TfvPPhM7xeDBVVNCqKRfP7HyRd6IRZn7Td/OA6zUdKA=;
 b=OqQhXOnfDgHrC6bbzFAtyTLLfqFI/m7ZUPOmK7EeYxzHb3c+9inYNtC+S8yKR15Cg6
 ZA5Cr+7GTe7glSX4xz68FnujtVqIBeNK4d15RIsncjq4XCeMqj/8o1vNFp/x/rH//Yza
 oT4e/5YszjnopEFzkVrxWaz6a6NeZBRDArx5n829usf4nvP8LwszJXzsT2sQYiR+e3Ho
 VRk/CBaPj0c3qzjsodlykifBDTJuTcpJb6p7CLReKJKw3ClQKk/jEKTzT5EOBR9e7Qi6
 /5p422kzwokk5MgGjbRJHehrlHoNSwxp8sGsS7+435V5fD3JRrT61rO+xiXb6T1HYBuF
 UknQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2QGBv1ggaihqGPR8imdzIL88LUzkcVjcJ5TZPjgf0renV56LoP8994U1CmWfbDXg82zZ1kNGB4g==@nongnu.org
X-Gm-Message-State: AOJu0YwUIjWtlLvUBvWXHKTfnPCIqGx9TqpD6P41n25ZkIAdK3Anyp6N
 VGxqxu6IwB6NjsWa+yJ6G4IxIOHiZfllVnHivPRsMwRCHpxjdZnGjMpoRYByiwslIUDXVYFlS0i
 1SfThCCUdkzCOcdtxBLrLCcKMYy57+6RQfw44ln9rIi3FHd9zIaCQ7w==
X-Gm-Gg: Acq92OGTlQnYsaqfZYgtLpPnRbJaeb93qZnSVRSKKipHOGYU/wgL/L3IrctHVcPQSmx
 QS9Wc6t3eHzzQJUQ4OU6ZOsNW24OPQcdKmfw61oA+alkJXamnfbhCRPVhxANY1xYRtxLDBXhYZV
 8cfN70qtir/g7SSL9PIkoxyAly4BBfAwZk43PQ+cbsCGLRvi5pam2BA4ys80sHk9/2vx9DTZfxf
 TDRfQc2k9RGRfLbu66BUh4DEXAoYwt5mqgx12r4GAmrMbdk0axvym1Y+UEhv8yPpqOk2f00KkNT
 7ypL0smxb3dJcr8LejiiGe3chueeAVyBhjUEW5JfwyRHCJHYI0zjcMx2hxcFcGLQUmIwQyB+VIH
 UvonAq6/PuIvZOhAcGhG70jDAlKDVKEwWDbSqlUlZ/rBhH7NBFtfFptodLVW25DIJp/Vp34JL1w
 4=
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id
 5b1f17b1804b1-490c2508a5emr303965875e9.0.1780938533727; 
 Mon, 08 Jun 2026 10:08:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id
 5b1f17b1804b1-490c2508a5emr303965245e9.0.1780938533380; 
 Mon, 08 Jun 2026 10:08:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39def5sm399510095e9.5.2026.06.08.10.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 10:08:52 -0700 (PDT)
Message-ID: <6ebe750b-3451-44a1-b45f-c749f3ad1488@redhat.com>
Date: Mon, 8 Jun 2026 19:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] tests: acpi: arm/virt: add WDAT table test case
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-14-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-14-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VygfKfWCWQePUZ7mRIN8UiIWH-HAqrc1yrPPAZ2hL1E_1780938534
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 5b01a657e5..5082866184 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2271,6 +2271,25 @@ static void test_acpi_aarch64_virt_tcg_msi_gicv2m(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_aarch64_virt_tcg_wdat(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "aarch64",
> +        .variant = ".wdat",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * MiB,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-device sbsa_gwdt,wdat=on", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_viot(void)
>  {
>      test_data data = {
> @@ -2889,6 +2908,8 @@ int main(int argc, char *argv[])
>                  qtest_add_func("acpi/virt/smmuv3-dev",
>                                 test_acpi_aarch64_virt_smmuv3_dev);
>              }
> +            qtest_add_func("acpi/virt/acpi-watchdog",
> +                           test_acpi_aarch64_virt_tcg_wdat);
>          }
>      } else if (strcmp(arch, "riscv64") == 0) {
>          if (has_tcg && qtest_has_device("virtio-blk-pci")) {


