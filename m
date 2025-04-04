Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4523445njd;
        Thu, 3 Apr 2025 20:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzpwlHJaRxiQQe/yLXhbv3YtuTnhjIO5oDqLUFYqI1QJTOOtlnk6Tb1MLi2RAuprastz7sS0vhW97csg==@linaro.org
X-Received: by 2002:a05:6a00:1150:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-739e4b446c7mr2235207b3a.19.1743735664601;
        Thu, 03 Apr 2025 20:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743735664; cv=none;
        d=google.com; s=arc-20240605;
        b=hP92WbwrVT/dq0A3Ane9aU3ZpuDtIXwv9I2pU4xVVHk3XkxZbAXLvVX517JFNWVcKA
         RY8qslp6wLXKrmqX4m6JWkQ7P3lIaDfDI46se8TuqFTBo+Lh3d2Prr15hzitiDQX1ipj
         XjsLGXuB57eHsG0eTbttR9WNdHQVx09B/AlD7WMPshiyErz+eI4pc2XRoMxOtXFu1Yea
         7fQnM9SAp3FgQnD1aY+09fS1cIq1bVo4OkocOfUwzR6c4wTWS5CYINXKs6fOOEEmzQ1n
         1D6IPWcFbBZTpF1Szw3n6l0uYDL6PjnQaDaB7FxoPjLgAjS1B7JLVNwELcUgf7A7vBYm
         HsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=02Kv6Dc9UvpP0MB5UIsl4ucf+GEBoG4rYzTStdL35xQ=;
        fh=qQY0jBo6gHigA8Vw+qf0DjOtN2wtiHfOAp567Ds33XY=;
        b=j9BvFSDOTiz1PFD5QTDeK6egOZf9c6x2PHpsdSJaQ1o1saNa5E3krfkOeKhTj5ksEs
         flsODdklk8ePycB5miyccUqByrxP/kvOYIEXAm+rHlUCpzH5JiUDEENiTd/879eVze6T
         A7C6kNlsq2E0UPcahddAPH3ME/wvLOWvb6weIr77EYEKF9lZNMmB3m4KcKTz6r9g+8TK
         ti0juAILX1+TmVkSjuVHXMAPP3OojjgsN79ARWUwOxz7EP3l5husDDecDyFVJsTKgvDL
         F/75K2EzXawnBlmc8IaBOvOHfVqIZeDQW/QMUbi2UMr+SWNF9YjHgO9/0vhNay6nyFcR
         ti4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6L+ob0B;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739d9e7a6d3sor1637356b3a.5.2025.04.03.20.01.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 20:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6L+ob0B;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743735664; x=1744340464; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02Kv6Dc9UvpP0MB5UIsl4ucf+GEBoG4rYzTStdL35xQ=;
        b=A6L+ob0BwzUhnuac/EiSNy+TgW9tThstba8W/WlZRpw+lLRfviV/ThwaK3d1Md3zDz
         AWsxV6ppQewQf93eyP76yop11NIG9j+HN6zCJw/Y2WZeXzqBkFfqvDIg+Xn5dug2UEmD
         rOOZboVSpJvvRhXGOoYg/nhwSBnAiP4mQ2CRv1AOanHLUNWSH0cBkw1WAwtNzBexRnXi
         OFdN4r2yXrol+XIc4sWMZnp2G1JboADlC+k74jLGA0urOv1qQn1OVNQMMqA8PzaQvfpL
         8sTqXmUaU5YCZ52nxPjUfgJhXHyayGbI5kfBP9ejlXIvEKrzVweSGcBhXr25KpXeFCBl
         s4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743735664; x=1744340464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02Kv6Dc9UvpP0MB5UIsl4ucf+GEBoG4rYzTStdL35xQ=;
        b=OZG+J8hz+R9b7TBF4nwThXViEWd1jAPVxWXm+s9wNevA4UW59DsrU6dB49dAN45q7e
         KH12m73FE2+bLiOtzOFM3xz9XIvC5+CNGZ57MQOKNWuY64tdY3HcmD20BfoKsXJWeGj0
         4uvRuuAP6jToKMgRAmh2ZHlIq9yY71UiutI8ZaZ8tFmnCMmuShmwlA2oZaL8kC2FyrZo
         wtsM0JAf5fyRWLDwwT5BQwImx6abLSR6aft0OHy0yvF/buEFrV4bT6o9wT7tMcNz5tBD
         QGNP/r2oGR2SdvZw2XeRJdV/8VNSs36nDahOT/yWrNUeZAHD6oLQ/m8rpbEt1D4tRUes
         CCwA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Zxg57ELUQbB0gOw/7rW6iJX4cK+NOMXcQB/v3MlKbqXcirLdXY/RoKIdAtBFgoM06N0Ehe5OFxR/Qw==@linaro.org
X-Gm-Message-State: AOJu0Yzwy4wG5FeihlrrodgrKvSWGo5sVP1mN3qQ9iam2/6IF2mWjmVF
	vPYOEhLRzznAXiR+5f8qCJyZQ949roY3BRRfw63rAFPZM5HCikmusCuubt1tG7P+Pw==
X-Gm-Gg: ASbGnctBHsaz38KrUgpLH1iBISS94cfwdKjMEsZcNROLhjSYSjktLMhnwHKDbU/vJ3w
	HPO1UI1koYdQ6NVjq5D7L6qlrulaC7o6N0AIY+m38ZzlYF0vNn5+fTXqsVrrBvux2RAdMXFJ0cz
	LYrIe/oQeB+5W8fT6i4Qyoz3HRPh5avybAPZJbvoccGxDXdymdOWflYESBeI3+osnj/dfQwDTMq
	Cjf+FVLq9D/lKfF9uW/fvyu4xVj3s61I0fMGxCNwo0ktjOPunpMr5q6JIS7kdGau/0NQHYFZuSH
	UCAjrWWKd/h4KXwcJ13v8lZnFR+EK24PmLSY5l0adJbO8NJdAi1/GZwN
X-Google-Smtp-Source: AGHT+IE7Gty54AIPLEBgHuz8LTBUMYwGhCMGP2bzHzsHAFX/QqGRI/1hDL4Wvq+D12SY/NsDKY4Xxw==
X-Received: by 2002:a05:6a00:3901:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-739e4b7af8amr2440338b3a.23.1743735664013;
        Thu, 03 Apr 2025 20:01:04 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.49.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9e9dcc6sm2340080b3a.99.2025.04.03.20.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 20:01:03 -0700 (PDT)
Message-ID: <b905164a-e613-466a-9094-bac225cc96fc@linaro.org>
Date: Fri, 4 Apr 2025 00:00:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 5/9] qtest/bios-tables-test: Add test for -M
 virt,its=off
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-6-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250403204029.47958-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rInBa5BXy0kt

Hi Phil,

On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
> Add the use case reported as issue #2886 [*]. The test
> passes while it shouldn't. We are going to fix that in
> the following commits.

I think this organization is not ideal. I like better your first
version, i.e., adding the correct blobs that make the new test pass,
as you did in:

[PATCH-for-10.0 1/5] qtest/bios-tables-test: Add test for -M virt, its=o
https://mail.gnu.org/archive/html/qemu-devel/2025-03/msg07081.html

The way it is here if you checkout this commit and run the test
(make check) the acpi test will _not pass_ because of the other changes
in the APIC, FADT, and IORT tables caused by the other VM options
(virtualization, gic-version, and iommu), as I pointed out in [0], even
tho the bug is present and its=off does not take effect.


Cheers,
Gustavo

[0] https://mail.gnu.org/archive/html/qemu-devel/2025-04/msg00438.html


> [*] https://gitlab.com/qemu-project/qemu/-/issues/2886
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec4353..baaf199e01c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2146,6 +2146,25 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>       free_test_data(&data);
>   }
>   
> +static void test_acpi_aarch64_virt_tcg_its_off(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "aarch64",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-M virtualization=on,secure=off "
> +                  "-M gic-version=max,its=off,iommu=smmuv3", &data);
> +    free_test_data(&data);
> +}
> +
>   static void test_acpi_q35_viot(void)
>   {
>       test_data data = {
> @@ -2577,6 +2596,8 @@ int main(int argc, char *argv[])
>                              test_acpi_aarch64_virt_tcg_acpi_hmat);
>               qtest_add_func("acpi/virt/topology",
>                              test_acpi_aarch64_virt_tcg_topology);
> +            qtest_add_func("acpi/virt/its_off",
> +                           test_acpi_aarch64_virt_tcg_its_off);
>               qtest_add_func("acpi/virt/numamem",
>                              test_acpi_aarch64_virt_tcg_numamem);
>               qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
