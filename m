Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6347704njd;
        Mon, 7 Apr 2025 05:55:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1gAAli1mqUy2iPoHdamEs8X+BsY6of591KIjfbJn+vmPOM0ZIi2n/fBQ+hTkaMsbZ9oi2a3G0sA4QLA==@linaro.org
X-Google-Smtp-Source: AGHT+IHArOS7TdzsDer5PakB9L7pjvFrnX/eFcCzrB6Lfg1HW1mDf6nxIh2hSOkUpBo8WPx95SsS
X-Received: by 2002:a05:622a:1485:b0:476:a655:c4a2 with SMTP id d75a77b69052e-4792595a3b0mr169926801cf.22.1744030513792;
        Mon, 07 Apr 2025 05:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744030513; cv=none;
        d=google.com; s=arc-20240605;
        b=bWG9y2NwxhYYmkfuGgE6n8wedj10gCYNnty/NDnCubZZiGGI9uGJN4+MAJy5YkP25S
         YcLB0JabwqInNh96oTv5E3B0exce7/i5T5wigqrnKGj6F1CEOl0DSTzTHdFQyk5ai41K
         F3Wkl4va3RuoXGSweULt80UIaTFyAX/njo/yxoEaOjwif4xBkCJIs/lG3BDwDiC+i1Nu
         cn+iBUx7VcLIAZF/wTl7aY8XdHYfnedzkIgj9Vf3rJrNPBhV35MNkRWTR4YWMwAdm7rg
         8gtO5sk4eG57Cou3Kkib86ak5sWHc/X5HpLdeTLfIJw35+7eQuCaYdd5SJqGxzW7cyDD
         t4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=uyjmVj8B9vjluIenrfJgcGG0sK9h4/CQ3HQasyGoFIg=;
        fh=aPbsLi9cBXk+GDuQjJu+dq7Wnl5IEoNNKxtWI2bLuwg=;
        b=Xr9iq80V0w2v14n5U5FGE4x0pEGaPwcq+xcNQYtuhGGKlFx2mbe/ALmN3BTYN2VXiA
         TFmYNBUbqPpGKrjRNrhJSly+aXmFBqkAnFqYu9a97TbkeV2Iz0NF3/ASNhU0TX+pVVST
         DUHEmedA7x5iUoqY21Omug4H0S1oqOs5Quv+pyNTYICALkGssQ57C7HnXfQCRmmWnkr3
         Oeqwnyr6c/d5HjyschxjhvhdXie7dEXWqYIKXBJCgPM2EWYiBEyGIUWz6kdPTazsebOI
         0AQPb2WK5jyppPIZzWBfyOI4z/1RHkIHqTYQjdAgBZVK69hOz+YvlGIlYbLGgpldX4OS
         sKuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Asv1HLaF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b1ed085si81556971cf.626.2025.04.07.05.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:55:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Asv1HLaF;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744030513;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyjmVj8B9vjluIenrfJgcGG0sK9h4/CQ3HQasyGoFIg=;
	b=Asv1HLaFf0cM8NLkdUXavBJGi4HoMSLOqZ4n3ddewT3Bmvo/sI7mvgqc5DfIjN9OSBkJsx
	Du893G7Ob+BXSXSs59LNiiyKvxwapiCfiqs2nSXOSWrzKoJ7my1ey8vKLw8Q7WZe24E7r8
	y8MTboi8SUgX3DTFQoeKhtBV/PkJd4w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-tx2YcaL0NDmJ6l8uXi3MmA-1; Mon, 07 Apr 2025 08:55:12 -0400
X-MC-Unique: tx2YcaL0NDmJ6l8uXi3MmA-1
X-Mimecast-MFC-AGG-ID: tx2YcaL0NDmJ6l8uXi3MmA_1744030511
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d22c304adso24551105e9.0
        for <alex.bennee@linaro.org>; Mon, 07 Apr 2025 05:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030511; x=1744635311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyjmVj8B9vjluIenrfJgcGG0sK9h4/CQ3HQasyGoFIg=;
        b=khgzcx6oQ+q0VFh2rxnTglLGPf8cXGnqb+ZMpaAD4i8KZzFBcf3HHxstqSYXml8JH7
         XEAa64zKeih8dj48RnCScKhGlH8fPdepDvDGY3sw0EoxMwkpeJPjUdrK3H+TYuRzBoTn
         5CODFZYAPZQs63jvIK6eNP3q6U+B+QEUFF85LcU8uWQe/7xdQnNklqcwPgj990zreA1A
         XRDniSwunvVTFafNj/n8BDBjsFYk97XIyWxv4/rhmjh6iovkvCRUM9XDzaxZ8PujeoyW
         Xf4HXXMADAPYQXwwR98yrkpMWEw5F4xKfn3PGSugGlaqssqfofyGXp+kcX6jzJD/SS74
         BA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUfX1Ci0+WxSjnVGLQ/hiCbDwuFvG56znfOodYWWyvW5HLbT3I9bwvJs6bvXiV9TvGErMSIRU/1rnyXKA==@linaro.org
X-Gm-Message-State: AOJu0YxaelbxyRDcreYDJsPuwWBORSCVidiSt6VQehAF8F0TeIsaZVe8
	6+XzPL2k+f5yTKxwNJhd9QQBlWAqEP6StsXI7jPni1E4PMlzRzrfJ42c/qLOu0QxPsD5qkAAcM9
	ltWdg+JnKRFsFLnVxZDctaoJBiYaAG52Pa/5jLwkD6hv+Q+h1CvhW6g==
X-Gm-Gg: ASbGnctCCQxS8aiKqzZCoBGmaEnfriLy+pqX0Hk/7uoWDkTYiGG7LYUgB4SH1DsyD6Y
	5kCc1kQLtf9nNE09YGqp2SK95y8wTPTUQxdfaNdtKmiW0/muZLMqk/sAwYhxSWwwMjsddA2YYzO
	mEhHdGhURpW7dhud5yt0ZxvfivVGiOLQIhxk2r1yluMjU+W9cpEEShp3wh4+p8v2y3BDm89JRqO
	66bIm7i0mbbGMPA/p72+pGsRnbdLSItgDcqKoCEuRNr9pGBAUam86D1UQa7Teh4cmqK0h7LUztx
	pUxeoruKYlt2IGNF1sRNmaZsU3AS8ix48pruQd8fC9Dn1lNUdib/DDvZHmXtTnw=
X-Received: by 2002:a05:600c:1e1b:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43eceee3375mr123883735e9.15.1744030511153;
        Mon, 07 Apr 2025 05:55:11 -0700 (PDT)
X-Received: by 2002:a05:600c:1e1b:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43eceee3375mr123883515e9.15.1744030510822;
        Mon, 07 Apr 2025 05:55:10 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795205sm133398395e9.30.2025.04.07.05.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 05:55:10 -0700 (PDT)
Message-ID: <313047ee-a63d-4396-9209-947138213630@redhat.com>
Date: Mon, 7 Apr 2025 14:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v3 5/9] qtest/bios-tables-test: Add test for -M
 virt,its=off
To: Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-6-philmd@linaro.org>
 <b905164a-e613-466a-9094-bac225cc96fc@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <b905164a-e613-466a-9094-bac225cc96fc@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XuhF6FE-_ObXyJWnyaYDl5vadzKfMmmcLQkswr4myk8_1744030511
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: amLx/Y36Y/Zs



On 4/4/25 5:00 AM, Gustavo Romero wrote:
> Hi Phil,
>
> On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
>> Add the use case reported as issue #2886 [*]. The test
>> passes while it shouldn't. We are going to fix that in
>> the following commits.
>
> I think this organization is not ideal. I like better your first
> version, i.e., adding the correct blobs that make the new test pass,
> as you did in:
>
> [PATCH-for-10.0 1/5] qtest/bios-tables-test: Add test for -M virt, its=o
> https://mail.gnu.org/archive/html/qemu-devel/2025-03/msg07081.html
>
> The way it is here if you checkout this commit and run the test
> (make check) the acpi test will _not pass_ because of the other changes
> in the APIC, FADT, and IORT tables caused by the other VM options
> (virtualization, gic-version, and iommu), as I pointed out in [0], even
> tho the bug is present and its=off does not take effect.

I do agree with Gustavo. This looks introduced in a non std way.

Found
https://lore.kernel.org/all/20241107123446.902801-6-Jonathan.Cameron@huawei.com/
as an example:
step1) create dummy entries for the variant table data + mark those as
ignored in tests/qtest/bios-tables-test-allowed-diff.h
<https://lore.kernel.org/all/20241107123446.902801-4-Jonathan.Cameron@huawei.com/#Z31tests:qtest:bios-tables-test-allowed-diff.h>
step2) create the new test
step3) Generate & store the new tables and remove lines in
bios-tables-test-allowed-diff.h
<https://lore.kernel.org/all/20241107123446.902801-6-Jonathan.Cameron@huawei.com/#Z31tests:qtest:bios-tables-test-allowed-diff.h>

Thanks

Eric
>
>
> Cheers,
> Gustavo
>
> [0] https://mail.gnu.org/archive/html/qemu-devel/2025-04/msg00438.html
>
>
>> [*] https://gitlab.com/qemu-project/qemu/-/issues/2886
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test.c
>> b/tests/qtest/bios-tables-test.c
>> index 0a333ec4353..baaf199e01c 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -2146,6 +2146,25 @@ static void
>> test_acpi_aarch64_virt_tcg_topology(void)
>>       free_test_data(&data);
>>   }
>>   +static void test_acpi_aarch64_virt_tcg_its_off(void)
>> +{
>> +    test_data data = {
>> +        .machine = "virt",
>> +        .arch = "aarch64",
>> +        .tcg_only = true,
>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>> +        .cd =
>> "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>> +        .ram_start = 0x40000000ULL,
>> +        .scan_len = 128ULL * 1024 * 1024,
>> +    };
>> +
>> +    test_acpi_one("-cpu cortex-a57 "
>> +                  "-M virtualization=on,secure=off "
>> +                  "-M gic-version=max,its=off,iommu=smmuv3", &data);
>> +    free_test_data(&data);
>> +}
>> +
>>   static void test_acpi_q35_viot(void)
>>   {
>>       test_data data = {
>> @@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
>>                              test_acpi_aarch64_virt_tcg_acpi_hmat);
>>               qtest_add_func("acpi/virt/topology",
>>                              test_acpi_aarch64_virt_tcg_topology);
>> +            qtest_add_func("acpi/virt/its_off",
>> +                           test_acpi_aarch64_virt_tcg_its_off);
>>               qtest_add_func("acpi/virt/numamem",
>>                              test_acpi_aarch64_virt_tcg_numamem);
>>               qtest_add_func("acpi/virt/memhp",
>> test_acpi_aarch64_virt_tcg_memhp);
>
>
