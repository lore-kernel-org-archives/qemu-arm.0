Received: by 2002:a0c:a3a3:0:0:0:0:0 with SMTP id v32csp2302636qvv;
        Mon, 3 May 2021 05:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh+VlWWTTceYs6xLw+cdKa05tlC06Wc4ws+5PVMUwPb4F1g9vDzLgjp0J8R4a1+AShE8Tz
X-Received: by 2002:a50:ed03:: with SMTP id j3mr19348105eds.334.1620045878850;
        Mon, 03 May 2021 05:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620045878; cv=none;
        d=google.com; s=arc-20160816;
        b=v2GdciffTrDBmmdU6LjxUoAO8g+zEexK/aNW1W/K+p2ymxHLZX6jcpxab9IUCRURO1
         LeEZBr1CP5y/WAl0GbrU0A/s/wEMn/AE/99aNKVbdwVTnp58cGnOjjYpHwkrDqQCpmi6
         UfJFg8aX9jJdqt9xDRCmPra7TTGN+innz6xCkBdgQQCXz7kWSZ3OurJ6PQJj6jx2VTi1
         5n/iJJTQM9q0yMCOTZ5e0eaVe6vT0kxcTVj/DWciEwitAX7MRWQlSBcQgPNWgoYxTwtv
         YapCKL0oHUzrTr31ZWi8zyxNAevgFrLJs/F0ZmHbh32HL9m7HyzrekooJmEMaxfgA1bN
         Ob2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=TDIFMIv2HDgnwSB56LAPxJuCIXyOpTcjE3AUuJERz04=;
        b=0ELwn1438XlFME0AtVMGE1Et3qBbDcveIMNhykbC656MiYdMfgj7LAminHomVia+aN
         WzDbd79MbBKGjYgosrb/HOaKri9+SSUI8drKPlk3NmT0YkBwWq+2HK1S4qJb0QuL9wNY
         2byR13xZ8sHXC1QuEwqLYfEXOtRMz7WD6kqiR/INeicvi0KVylpkrM/dNrPHEQLwZc7s
         x6imOYAtIkEQ8mi7RMtZuYH+9cRMTE+Iq/j+7oveTQ1BkbxFdF9Ze7ZpjiMwDo3n7v04
         TvGOrO6SWzeCIyr4M5/v5l3iyz7XsuzT6bTs0jUqzbFM30NQs88bg9aGW6kgHQT9qd9r
         h1Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ea1Z3SPB;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bz20si11851103ejc.706.2021.05.03.05.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 05:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ea1Z3SPB;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620045877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDIFMIv2HDgnwSB56LAPxJuCIXyOpTcjE3AUuJERz04=;
	b=Ea1Z3SPBO/sSb+cVifJMRlCsEu9V59FeCky/jjOX3t9BSUap2ZZZ3w75t0DH9r7HsuDn5y
	hsyyaaSkkhdHx+tHL6u4X9zJm5BI3d3tJzPLF9quuuqkbCIE1GzJMKPNcuuaCnhxodRdJA
	QR0LtyZ0Q1Mx47+RbAGf0eBW0oF9iOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-RwTqNTHQOl-8ZBGJnvU0Ig-1; Mon, 03 May 2021 08:44:36 -0400
X-MC-Unique: RwTqNTHQOl-8ZBGJnvU0Ig-1
Received: by mail-wr1-f69.google.com with SMTP id 63-20020adf84450000b029010dd0171a96so3288110wrf.21
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 05:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TDIFMIv2HDgnwSB56LAPxJuCIXyOpTcjE3AUuJERz04=;
        b=PSoM7FWaw9cRbOfO/fX6mJStsCzexi5m3LJK2S2KRFJsoZO6Idid4Xn23YxhSo39hm
         V2bpXgpEGfEbZUBYTa4vsXIEHo4/qLdS4zt7ApZl4MJdI26fKfZ4v8glVvoC3lU2WM47
         hQB0qKB+C/wjJYaMd/LqPv3ltAjdld69mYElxR2MHHH3l6IUn2W/hMGbwmQ7EO67zXNH
         S9STW4nlgu6niwELdV5ctS8hdTw2RWU7ynijTyrwezvtTqJPSCkzFWo01AA0iSU+ofiV
         9H7NtYWEux9tBzXSJRo4ivjGHL5nCiIWaedNldsLlDzlxmz0XS+jAULGpfS5s4nKHm5p
         /uJA==
X-Gm-Message-State: AOAM533+zbNkhvYh6z5+u4zGZjAaPoO9pUPXDl1DgzcPjzHhWuvxUyFU
	mlJ4z1rnjFkHG5jINZoZEo1118mjcn2W4x0xlnlL3KiE4DOSodrTJynyQCNIpJNSujoWVbdIWUr
	jB/Bp15DsC4/AM0Qz
X-Received: by 2002:a05:600c:d6:: with SMTP id u22mr17407631wmm.161.1620045875079;
        Mon, 03 May 2021 05:44:35 -0700 (PDT)
X-Received: by 2002:a05:600c:d6:: with SMTP id u22mr17407602wmm.161.1620045874835;
        Mon, 03 May 2021 05:44:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id f18sm19294822wmg.26.2021.05.03.05.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 05:44:34 -0700 (PDT)
Subject: Re: [PATCH v5 08/10] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-9-philmd@redhat.com>
 <20210503143639.57e7c52c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd561115-0586-3920-6236-32a3abd043f2@redhat.com>
Date: Mon, 3 May 2021 14:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503143639.57e7c52c@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oBDhwPKcWNAL

Hi Igor,

On 5/3/21 2:36 PM, Igor Mammedov wrote:
> On Sun,  2 May 2021 00:36:36 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Now than we can probe if the TCG accelerator is available
>> at runtime with a QMP command, do it once at the beginning
>> and only register the tests we can run.
>> We can then replace the #ifdef'ry by an assertion.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>>  1 file changed, 52 insertions(+), 47 deletions(-)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index 156d4174aa3..a4c7bddf6f3 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -97,6 +97,7 @@ typedef struct {
>>      QTestState *qts;
>>  } test_data;
>>  
>> +static bool tcg_accel_available;
>>  static char disk[] = "tests/acpi-test-disk-XXXXXX";
>>  static const char *data_dir = "tests/data/acpi";
>>  #ifdef CONFIG_IASL
>> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
>>      char *args;
>>      bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
>>  
>> -#ifndef CONFIG_TCG
>> -    if (data->tcg_only) {
>> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
>> -        return;
>> -    }
>> -#endif /* CONFIG_TCG */
>> +    assert(!data->tcg_only || tcg_accel_available);
>>  
>>      args = test_acpi_create_args(data, params, use_uefi);
>>      data->qts = qtest_init(args);
>> +
> stray new line?

Oops.

> 
>>      test_acpi_load_tables(data, use_uefi);
>>  
>>      if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
>> @@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
>>      const char *arch = qtest_get_arch();
>>      int ret;
>>  
>> +    tcg_accel_available = qtest_has_accel("tcg");
>> +
>>      g_test_init(&argc, &argv, NULL);
>>  
>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>> @@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
>>              return ret;
>>          }
>>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
>> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>>                         test_acpi_piix4_no_root_hotplug);
>>          qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
>>                         test_acpi_piix4_no_bridge_hotplug);
>>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>>                         test_acpi_piix4_no_acpi_pci_hotplug);
>> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
>> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>> -        qtest_add_func("acpi/piix4/smm-compat",
>> -                       test_acpi_piix4_tcg_smm_compat);
>> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
>> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
>> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
>> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>> -        qtest_add_func("acpi/q35/smm-compat",
>> -                       test_acpi_q35_tcg_smm_compat);
>> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
>> -                       test_acpi_q35_tcg_smm_compat_nosmm);
>> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
>> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
>> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>> -        if (strcmp(arch, "x86_64") == 0) {
>> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>> +        if (tcg_accel_available) {
> 
> most of this can run without TCG if KVM is available, so why are you limiting it to TCG only
> or am I missing something?

This patch is a simple API change, these tests are already restricted by
the 'g_test_skip("TCG disabled, skipping ACPI tcg_only test");' call.

If someone is willing to send a patch to have them run without TCG, I'm
fine to rebase my series on top. Else it can also be done on top of my
series. Whichever you prefer, but I'd rather not delay Claudio's work
too long...

> 
>> +            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>> +            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>> +            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>> +            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>> +            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>> +            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>> +            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>> +            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>> +            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
>> +            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>> +            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>> +            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>> +            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>> +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>> +            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>> +            qtest_add_func("acpi/piix4/smm-compat",
>> +                           test_acpi_piix4_tcg_smm_compat);
>> +            qtest_add_func("acpi/piix4/smm-compat-nosmm",
>> +                           test_acpi_piix4_tcg_smm_compat_nosmm);
>> +            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
>> +            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>> +            qtest_add_func("acpi/q35/smm-compat",
>> +                           test_acpi_q35_tcg_smm_compat);
>> +            qtest_add_func("acpi/q35/smm-compat-nosmm",
>> +                           test_acpi_q35_tcg_smm_compat_nosmm);
>> +            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
>> +            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>> +            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>> +            qtest_add_func("acpi/piix4/acpihmat",
>> +                           test_acpi_piix4_tcg_acpi_hmat);
>> +            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>> +            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>> +            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>> +            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>> +            qtest_add_func("acpi/microvm/ioapic2",
>> +                           test_acpi_microvm_ioapic2_tcg);
>> +            if (strcmp(arch, "x86_64") == 0) {
>> +                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>> +            }
>>          }
>>      } else if (strcmp(arch, "aarch64") == 0) {
>> -        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>> -        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>> -        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>> -        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>> +        if (tcg_accel_available) {
>> +            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>> +            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>> +            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>> +            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>> +        }
>>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
>>      }
>>      ret = g_test_run();
> 
