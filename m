Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3511618lfa;
        Mon, 7 Jun 2021 06:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxl2692NCKyKxt75MSMqyzVKG/pjOk5W8TjLeds0hCelQbSC+hzFw8OlFxB5taPr8Rb8I9
X-Received: by 2002:a17:906:b213:: with SMTP id p19mr10278000ejz.51.1623073653190;
        Mon, 07 Jun 2021 06:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623073653; cv=none;
        d=google.com; s=arc-20160816;
        b=mdW7QtndSRj9Su+gcHOjsK4/c2EGdi//KxJtUVaQULR39g920MjvECZFZ9Q9C4RYR8
         0/BmMaO2qO7vxUnrO4qRPzd8gqXVI0B6DTY/g5Q8K4Q2ftBypYXMGcAadE/JQ0jqC+rv
         4EInlpzN452qFK3xp52XQTE9f5Jh0b10mgo5BeKHr69QVVGYYkBEva536CQYvdWCrQc3
         23ygTl6pE+DZIzbD9Y+zigBwh+xwtOqvP/e8mEBKsGJhBI6w4IP+7B/c64L4wTMd9rB3
         BqrFtg8SvGV5YP/gBjqpWcaEQP2593iHahI5dVeSuiZdzSeVt/RUp5r8SJfMgRsaJFD4
         e5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LD6nAFjs4B1GZxkldEAJrh4Se1ifzzJRoEJKMHX6Snw=;
        b=YRLVC61+fcSS0WQ5wGHcsSuFDbHVvdb5FLEeV8AERP5kModjvkpt+cc9bAcn0XdRFO
         Lu/fHViybjLdTFmK0lkt2+Jn0dXtZ+ABmdlhmxPcqcmDG74Bo8U/wa2ykhb8ryZECjLD
         BRKOmL7BdCo9mCnLzHIi5pDGuDn9sj7tbjqv5qs80cE/jQdD3/Gqk5Yjj8w1b92ZOpvV
         9O9xuTnexKSe4EK+aNc4aGSvnJMaM2K3DKiXP+LJ/uwNPVp49hAyn0xKSg77LRBzDEhd
         KLgUjYXLyvhZoi0LqsTk5wM9F9jAB4aBpFgpwNg7z8JSANkfJtdhXVF+IyYh5rS2HdfB
         MLAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHPlG5xt;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id j23si14389093eje.551.2021.06.07.06.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHPlG5xt;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623073652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD6nAFjs4B1GZxkldEAJrh4Se1ifzzJRoEJKMHX6Snw=;
	b=fHPlG5xtWgxnIAfV9wsUchD+JdZWPTyMtNBxVtJy9v1PyZmgyRqghMdzqJTja9PVl8yfLh
	xKo9vS1dn341JbkFw79tcRz806TB5vLIAzxGOheRhU9zK6Mw9W1OqDrY45FAnv9zuG3IB7
	4G8rtjZ5LRzI1NZiwlqKYhMyJ3wzapc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-VhCcilkwOIC5a3rSkoD6tQ-1; Mon, 07 Jun 2021 09:47:31 -0400
X-MC-Unique: VhCcilkwOIC5a3rSkoD6tQ-1
Received: by mail-wr1-f72.google.com with SMTP id d5-20020a0560001865b0290119bba6e1c7so3905550wri.20
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LD6nAFjs4B1GZxkldEAJrh4Se1ifzzJRoEJKMHX6Snw=;
        b=Q8iN3JfMbRI9oUEpQGNm5z5Qkqk1D8eBcnxjwWTBxxmmlogkg+XcGhCpCJC4zK0Q7J
         WUjxaxCMYfuKZTro42zVCFNLF5ksg+IklQ/Y4k3JgS2rXanAvzK36PgvVbiFZ+EBKDA0
         KE8vu1fGwVUfah+wJ60Fh2pqR1Xs4xyqToqbDfh0QVjUbIt5GtpR/bHGCZY6V+6/J7Yh
         MOR/69vmKH0pRw8uacopNT2HOnYm7PpPzxJt5BwtVzIrZar8xBODiqSG6EENrl7fQ3cs
         BZLgwH79FI15hqqEhxZmO2otEbQ3AgSAVNOtvDPfJ8BYpv+4QVPceW+/GsgaRXPlvmpf
         Q1Pw==
X-Gm-Message-State: AOAM531DOmymE4vQ9EfaCQDEZxn5One1o+WUoYrFCuT1ZRoNNVgHng0I
	w3JUXkx5StFScFh0KljR3BVGYwSVTJqMXSZFAOBMOwASANJ2bv/7ng5hEk+zCvr1MNdXjBytHFX
	yrmpF2KLTzkhWKGJB
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr17096445wmc.96.1623073649878;
        Mon, 07 Jun 2021 06:47:29 -0700 (PDT)
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr17096429wmc.96.1623073649753;
        Mon, 07 Jun 2021 06:47:29 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id 32sm17761074wrs.5.2021.06.07.06.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:47:29 -0700 (PDT)
Subject: Re: [PATCH v16 11/99] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8cd09a51-cb6b-79f1-1848-d71fe42b0044@redhat.com>
Date: Mon, 7 Jun 2021 15:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-12-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: kPFNp7YJ1Ecy

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Now that we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-12-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index ad877baeb1..762d154b34 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -97,6 +97,7 @@ typedef struct {
>       QTestState *qts;
>   } test_data;
>   
> +static bool tcg_accel_available;
>   static char disk[] = "tests/acpi-test-disk-XXXXXX";
>   static const char *data_dir = "tests/data/acpi";
>   #ifdef CONFIG_IASL
> @@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_data *data)
>       char *args;
>       bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
>   
> -#ifndef CONFIG_TCG
> -    if (data->tcg_only) {
> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> -        return;
> -    }
> -#endif /* CONFIG_TCG */
> +    assert(!data->tcg_only || tcg_accel_available);
>   
>       args = test_acpi_create_args(data, params, use_uefi);
>       data->qts = qtest_init(args);
> @@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    tcg_accel_available = qtest_has_accel("tcg");
> +
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>           ret = boot_sector_init(disk);
>           if (ret) {
> @@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
>           qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
>           qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
>           qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
> -        if (strcmp(arch, "x86_64") == 0) {
> +        if (strcmp(arch, "x86_64") == 0 && tcg_accel_available) {
>               qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>           }
> -    } else if (strcmp(arch, "aarch64") == 0) {
> +    } else if (strcmp(arch, "aarch64") == 0 && tcg_accel_available) {
>           qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>           qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>           qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
