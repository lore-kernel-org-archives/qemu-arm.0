Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2798702lfg;
        Mon, 3 May 2021 09:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/4zKjrTsfStyIvD2hC5kgpTDHFnoc65zQKkBrsny53efJFThXcYUVHPImVKb2IRFB6sN5
X-Received: by 2002:a17:906:bc8e:: with SMTP id lv14mr17448596ejb.418.1620059624803;
        Mon, 03 May 2021 09:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620059624; cv=none;
        d=google.com; s=arc-20160816;
        b=PO9gm+qjnhnF19ROGmOvHSBW43b3DqxbDhBkRg7RpVIFb0nrtUfSeovkI+WnY1nKdi
         0Im7b5m+nG9bfth8i2n5jqW/sD0+FyI+Mju254igSdimx3+26Nt+4NVycnFvMx+KcreR
         SC7zeMHRvO+sPiM7nS3Pxp30XRCA2UXWHTZqys9s+iSZ/33MliCyCJsQv141Wi66Ic/S
         MsM/gmiq3djE0VdxTKs3Fd7SSvm+WbAzuBNF6AsHtBZKxIhw3b4PldIpr94q3zt0jPB3
         a4z/Nipen1JOqgANCLhIfsXOjRFAZhCB8NQBklbAaUmZW6xBHPb97Az8UB6MPJpG2e8A
         8zQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=0/v7w83apqs4Z9feQey4AfXSRxHG2joE+1aa7RyPXXQ=;
        b=U9mN7+ox2zncP16oapXPsGZa0LPq3w6B3X8Fq3HfPokJlr2ZXxqnD+IQ/nqSTx8yt1
         xJurtLZioH9CaL4p2F2Wac+emFuynTH9/vYXdeiBmLIVxZOKSJJab1QO88cCIAw50K7U
         6SL+fNoNxognFiI+KD0vXWMXS05R0rsKiehUS8cqhkj4Nv4M8OYIiLonXRFA6RkJhcIz
         E9vd4uOUYAwF2IG8lpja1KBzS3UNVYR+QPv2X4jIrYnFXAtR/9ZVFuP6qlQDhx4TwEAB
         cSXvwX1ehWKz5nLhTHgrfYSC76TEU4QGBt+iIS68V4Lqc/VFWNT8quEVK3cFtJpZgkph
         nakA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VwNDKfTb;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n11si9129764edy.507.2021.05.03.09.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 09:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VwNDKfTb;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620059623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/v7w83apqs4Z9feQey4AfXSRxHG2joE+1aa7RyPXXQ=;
	b=VwNDKfTb+ODqPm62DOokgpjBfcL9w+8HsskD0o/K8GJ3UYDK4clEYz2tZ9KWWreT4mTMRx
	9+9VsxfpG/PjVzHgAwvDtbpkGHuD9A9y8L/Ulit8+tOcpKl483/XT+unUXLQqN4bRDSQxQ
	JBOUhxTQVfqXVb/2EoNNLvKXXPSQUlY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-merWqV5yM4GB68oNSRyVDg-1; Mon, 03 May 2021 12:33:19 -0400
X-MC-Unique: merWqV5yM4GB68oNSRyVDg-1
Received: by mail-wr1-f71.google.com with SMTP id 67-20020adf81490000b029010756d109e6so4198193wrm.13
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 09:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0/v7w83apqs4Z9feQey4AfXSRxHG2joE+1aa7RyPXXQ=;
        b=AStzobGkKiHKswMJvJuITGxInFJgDVQXfdKRZmI/VLKxX3QND/TvpY8Bk/Jt+g3dgc
         +Qc5nSxcEeVZPR0bjdFayRy30Ad8HA8TQZkNaapGyd7wVtHcpzs3kMzO/e7XZFm97YIC
         Ab2VM8W5EmbnwUD0+sr9ytUn6ih9sFdU16iEbbovZQ1qYcMfIsftQqptTh5BfHTYqWjk
         99//0QnlSvYGm2MfEpBWh+y9meMmCkGYsnvnP11R+hUcm2vDz0jMfQAsoJ8nRkkth2X9
         uBFJ1J9qBHF/8iEdOprXAGMAUrxab+Q/bFg+GKAmuon44RDgJCljiQ6euyRnCkxGZfVs
         Mt3w==
X-Gm-Message-State: AOAM5310OgobT/iQ+VXYVNqYMPF9xUuMrEqZ6Egz+c+NEdCqKGPTkH6q
	dugYtRv51dxMAPxvIpjqoyFDW1lg/TvEIkLK11fPuyrGBnNAuEHUImZTKW+FUW+r+WyrnocxCuX
	3HbdD/8kQndgBDWoz
X-Received: by 2002:a05:6000:2c5:: with SMTP id o5mr26497282wry.4.1620059598268;
        Mon, 03 May 2021 09:33:18 -0700 (PDT)
X-Received: by 2002:a05:6000:2c5:: with SMTP id o5mr26497258wry.4.1620059598048;
        Mon, 03 May 2021 09:33:18 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id s15sm7538509wrt.19.2021.05.03.09.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 09:33:17 -0700 (PDT)
Subject: Re: [PATCH v5 08/10] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: Igor Mammedov <imammedo@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-9-philmd@redhat.com>
 <20210503143639.57e7c52c@redhat.com>
 <dd561115-0586-3920-6236-32a3abd043f2@redhat.com>
 <20210503180415.3c798f64@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ced07efc-996f-929a-44dc-993ab86ad4ab@redhat.com>
Date: Mon, 3 May 2021 18:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503180415.3c798f64@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Yo0WqF87t0le

On 5/3/21 6:04 PM, Igor Mammedov wrote:
> On Mon, 3 May 2021 14:44:32 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 5/3/21 2:36 PM, Igor Mammedov wrote:
>>> On Sun,  2 May 2021 00:36:36 +0200
>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>   
>>>> Now than we can probe if the TCG accelerator is available
>>>> at runtime with a QMP command, do it once at the beginning
>>>> and only register the tests we can run.
>>>> We can then replace the #ifdef'ry by an assertion.
>>>>
>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>>>>  1 file changed, 52 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>>> index 156d4174aa3..a4c7bddf6f3 100644
>>>> --- a/tests/qtest/bios-tables-test.c
>>>> +++ b/tests/qtest/bios-tables-test.c
>>>> @@ -97,6 +97,7 @@ typedef struct {
>>>>      QTestState *qts;
>>>>  } test_data;
>>>>  
>>>> +static bool tcg_accel_available;
>>>>  static char disk[] = "tests/acpi-test-disk-XXXXXX";
>>>>  static const char *data_dir = "tests/data/acpi";
>>>>  #ifdef CONFIG_IASL
>>>> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
>>>>      char *args;
>>>>      bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
>>>>  
>>>> -#ifndef CONFIG_TCG
>>>> -    if (data->tcg_only) {
>>>> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
>>>> -        return;
>>>> -    }
>>>> -#endif /* CONFIG_TCG */
>>>> +    assert(!data->tcg_only || tcg_accel_available);
>>>>  
>>>>      args = test_acpi_create_args(data, params, use_uefi);
>>>>      data->qts = qtest_init(args);
>>>> +  
>>> stray new line?  
>>
>> Oops.
>>
>>>   
>>>>      test_acpi_load_tables(data, use_uefi);
>>>>  
>>>>      if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
>>>> @@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
>>>>      const char *arch = qtest_get_arch();
>>>>      int ret;
>>>>  
>>>> +    tcg_accel_available = qtest_has_accel("tcg");
>>>> +
>>>>      g_test_init(&argc, &argv, NULL);
>>>>  
>>>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>>> @@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
>>>>              return ret;
>>>>          }
>>>>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
>>>> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>>>> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>>>>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>>>> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>>>> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>>>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>>>>                         test_acpi_piix4_no_root_hotplug);
>>>>          qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
>>>>                         test_acpi_piix4_no_bridge_hotplug);
>>>>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>>>>                         test_acpi_piix4_no_acpi_pci_hotplug);
>>>> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>>>> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>>>> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>>>> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>>>> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>>>> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
>>>> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>>>> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>>>> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>>>> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>>>> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>>>> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>>>> -        qtest_add_func("acpi/piix4/smm-compat",
>>>> -                       test_acpi_piix4_tcg_smm_compat);
>>>> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
>>>> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
>>>> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
>>>> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>>>> -        qtest_add_func("acpi/q35/smm-compat",
>>>> -                       test_acpi_q35_tcg_smm_compat);
>>>> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
>>>> -                       test_acpi_q35_tcg_smm_compat_nosmm);
>>>> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
>>>> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>>>> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>>>> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>>>> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>>>> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>>>> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>>>> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>>>> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
>>>> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>>> -        if (strcmp(arch, "x86_64") == 0) {
>>>> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>>>> +        if (tcg_accel_available) {  
>>>
>>> most of this can run without TCG if KVM is available, so why are you limiting it to TCG only
>>> or am I missing something?  
>>
>> This patch is a simple API change, these tests are already restricted by
>> the 'g_test_skip("TCG disabled, skipping ACPI tcg_only test");' call.
>>
> 
> 
> with current code, assume we have TCG compiled out:
>  - test_acpi_one() will execute any test that is not marked as tcg_only
> 
> with this patch if tcg_accel_available == False,
> it will not even register any test under "if (tcg_accel_available) {" branch
> and in this patch that includes a bunch of _non_ tcg_only tests.
> So tests won't be executed on KVM only build, where previously they were executed just fine.

I guess you refer to the 'data->tcg_only' field, OK, now I understood.
