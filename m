Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC2C83F1B
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 09:20:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubFLl-0003IJ-V1; Mon, 14 Jul 2025 05:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ubF4Q-0002fU-0q
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 05:02:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ubF4M-0006Nz-3w
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 05:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752483712;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFaq1jnbhSYzVZrfM5m9ezXDiNopu52/2FuXqVCFQlc=;
 b=SWFRRK4RkK00FCuO5WHWrvfpAGO6CZwzvOhioLKLWkT981tpswDqyPjvGiElkL/hfEuIoP
 L9uGHddgeR0vbe95V/FDVyZdiz3NgQi6nHo8mya6yVBKwgkHJpJrWfo/kGY0uLykTPQA/t
 IiR1QP08B9cJ5fV7I7hMo5fzEPqwfdA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-76B1ZYJdNk-g5zL5vo4JOg-1; Mon, 14 Jul 2025 05:01:49 -0400
X-MC-Unique: 76B1ZYJdNk-g5zL5vo4JOg-1
X-Mimecast-MFC-AGG-ID: 76B1ZYJdNk-g5zL5vo4JOg_1752483708
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a5780e8137so2721700f8f.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 02:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752483708; x=1753088508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFaq1jnbhSYzVZrfM5m9ezXDiNopu52/2FuXqVCFQlc=;
 b=P6uxeJ+cNMrJhF/p8HbU6HXX/JJtSMQthRiI43rgYZox2jdCEAGHh/n7chFgTWBKRA
 /LBVPB4/xEWwE11w4YWFN7wUkafVBtV67JuRxy5e6fzh88IZmeGMfv35UL3eGcuzPQAO
 vqMSvVH3h7sz8yFbpxfa+ULzwx4l+dd837v1aaT8TxYPVqfwuGQO8m/FRgsQGnpWeARE
 ofXonTNRqKFPiQUz80ky0Nw1iumd/oeiZWfG92kl3UMZ5Y4KFYkM20dBUiPBzqAO3FPj
 TuxUqwsUeXvTtzlsV9UVrBzjnVfKXVWQZkhvxvrhTnSA1ppdTTvMjVI/aMxmQgL1HkT2
 zCJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtFAZMVOp7cVe8E/xJtvKRW4JUDOo8ZmxM/KBRU3YB3duY/Qmvkm/Z/FG1q+pL/VCG2uFjY+9BXg==@nongnu.org
X-Gm-Message-State: AOJu0Yyf4f8rtK8V5HQIdcvjKlUVTRyG6l0+FloJy+PedbVC2Ncs+7lL
 PRBrSRfpOHKphvGweLs2jh+jAt9xBNnxv+lD1WtVoIL7TUDo/AUHdwlMRNmbFdEEg02QlbxTo4I
 0BRAIt+F2MJCKUOha3V2v9YdwH1x9LZrmxvSkf0C5fk+yAa2ranYmRw==
X-Gm-Gg: ASbGncvHN5xoXpKHl6Vs2v6YJ3NFDHmv9FVUkcaYsnerUY+KL7lYt6hDk4mA/16Vytp
 yhYGTvsG+7DXebv2YJ6zTHf8ESEr1YKUP1rSyTze4rfMEP26uG854dbfJLcFbt4qvEKT+lkMObN
 xCuEa7+3v+bkujuZDWksMI+jHfG1t9VIDKFivS3l/Znkw08N/DHOhTOX9LkTOK1yhzSbgwz66AR
 hGx5EVOYmKa+CRllnTBhCO1GvqdA8wl0aHQEdj7UXX9Cuyv0waBKxQy86bBG+PL27tbrSZzehev
 kQ51xWwMhcvOShXof+y90RV/vD8tucfNzrEjU29cPYXAsHkyqHGloAUXGJOkBKg3yFxd0ogTj7L
 bg3crHglNz8E=
X-Received: by 2002:a05:6000:3c3:b0:3a4:f70e:bc25 with SMTP id
 ffacd0b85a97d-3b5f1e96113mr8073634f8f.27.1752483707953; 
 Mon, 14 Jul 2025 02:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjad1HidgGeo/GOxqn+CcbErkd7GdeTpjZRrUNAOU9TzBAEBee7SOfYOon8YuAmcPnzz1Mvw==
X-Received: by 2002:a05:6000:3c3:b0:3a4:f70e:bc25 with SMTP id
 ffacd0b85a97d-3b5f1e96113mr8073602f8f.27.1752483707394; 
 Mon, 14 Jul 2025 02:01:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc3a54sm12013884f8f.39.2025.07.14.02.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 02:01:46 -0700 (PDT)
Message-ID: <f2cfbc5c-9e7b-4ed9-8b17-80d4ec139914@redhat.com>
Date: Mon, 14 Jul 2025 11:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/36] tests/qtest/bios-tables-test: Add aarch64 ACPI
 PCI hotplug test
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, Jonathan.Cameron@huawei.com,
 gustavo.romero@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20250708142437.1344644-1-eric.auger@redhat.com>
 <20250708142437.1344644-35-eric.auger@redhat.com>
 <20250711154701.0f394671@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250711154701.0f394671@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _va1CL7cDFbXxRk7U7jgbKh4UBS6JB0SeDwL0vB1uZE_1752483708
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Igor,

On 7/11/25 3:47 PM, Igor Mammedov wrote:
> On Tue,  8 Jul 2025 16:23:16 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>
>> Add 2 new tests:
>> - test_acpi_aarch64_virt_acpi_pci_hotplug tests the acpi pci hotplug
>>   using -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
>> - test_acpi_aarch64_virt_pcie_root_port_hpoff tests static-acpi index
>>   on a root port with disabled hotplug
> tests a bit simple, I wonder if we could reuse related x86 variants
> for that (as those test a bit more corner cases with a more complicated
> topology).
> It's not a blocker and doing this of cause can be done on top.

Sure I will work on that on top of this series.

Thanks

Eric
>  
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>
>> ---
>> v3 -> v4:
>> - add -device pci-testdev for the first test case
>> - fix the chassis
>> - add a test for static acpi-index
>> ---
>>  tests/qtest/bios-tables-test.c | 52 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 357bcefd37..1074b8d67a 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1643,6 +1643,54 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
>>  
>>  }
>>  
>> +static void test_acpi_aarch64_virt_acpi_pci_hotplug(void)
>> +{
>> +    test_data data = {
>> +        .machine = "virt",
>> +        .arch = "aarch64",
>> +        .tcg_only = true,
>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>> +        .ram_start = 0x40000000ULL,
>> +        .scan_len = 256ULL * MiB,
>> +        .variant = ".acpipcihp",
>> +    };
>> +
>> +   /* Use ACPI PCI Hotplug */
>> +   test_acpi_one(" -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on"
>> +                 " -cpu cortex-a57"
>> +                 " -device pcie-root-port,id=pcie.1,bus=pcie.0,chassis=0,slot=1,addr=7.0"
>> +                 " -device pci-testdev,bus=pcie.1",
>> +                 &data);
>> +
>> +    free_test_data(&data);
>> +}
>> +
>> +static void test_acpi_aarch64_virt_pcie_root_port_hpoff(void)
>> +{
>> +    test_data data = {
>> +        .machine = "virt",
>> +        .arch = "aarch64",
>> +        .tcg_only = true,
>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>> +        .ram_start = 0x40000000ULL,
>> +        .scan_len = 256ULL * MiB,
>> +        .variant = ".hpoffacpiindex",
>> +    };
>> +
>> +   /* turn hotplug off on the pcie-root-port and use static acpi-index*/
>> +   test_acpi_one(" -device pcie-root-port,id=pcie.1,chassis=0,"
>> +                                          "slot=1,hotplug=off,addr=7.0"
>> +                 " -device pci-testdev,bus=pcie.1,acpi-index=12"
>> +                 " -cpu cortex-a57",
>> +                 &data);
>> +
>> +    free_test_data(&data);
>> +}
>> +
>>  static void test_acpi_microvm_prepare(test_data *data)
>>  {
>>      data->machine = "microvm";
>> @@ -2602,6 +2650,10 @@ int main(int argc, char *argv[])
>>              qtest_add_func("acpi/virt/numamem",
>>                             test_acpi_aarch64_virt_tcg_numamem);
>>              qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
>> +            qtest_add_func("acpi/virt/acpipcihp",
>> +                           test_acpi_aarch64_virt_acpi_pci_hotplug);
>> +            qtest_add_func("acpi/virt/hpoffacpiindex",
>> +                          test_acpi_aarch64_virt_pcie_root_port_hpoff);
>>              qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
>>              qtest_add_func("acpi/virt/oem-fields",
>>                             test_acpi_aarch64_virt_oem_fields);


