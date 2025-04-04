Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4523640njd;
        Thu, 3 Apr 2025 20:01:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvqYZFW4zJ/9wwIayxfKeY7qsRv8aZ2Uk0UvTMeJlNxP2koShDz05+5NnpUR4idMZ3xh9MSB59qTAMJA==@linaro.org
X-Received: by 2002:a17:902:ce07:b0:21f:bd66:cafa with SMTP id d9443c01a7336-22a8a867283mr17183405ad.17.1743735686891;
        Thu, 03 Apr 2025 20:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743735686; cv=none;
        d=google.com; s=arc-20240605;
        b=XaXzqGtCXWOc9+gGiuX1/7ggcJ+9I5RTBeBkl/pHcaKotUbbbcOv3q+Ha1E9WG8v11
         pzJ44f0OJwgv+8lXs216hCg+oi6hH73fscyck+0tPkT2XNnpAV59VdT8PT6M0olC/gS5
         YkaWo6O0S5jQAalyjI15Cy4U7IvX6Wv802zJozK7hfBSbi4WyFLZtzFgBF4iN9emz+Vb
         D9dJ6TxXAKJt9Zh6iM+A5+zkJMpxWK/yIguooRu2e63fZNln83XEylcSroj7jcQoPGmV
         WyYyhbG1RqbJXcMOFOearGjZf1DwK9jVELl7UdJoZ1tiwDgp6UzoPtJzSR2iMCQ1a+sn
         /BxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YvQrHIufzmNwSQPx6JtlnlJB+LGYI8bx5qEpU+hMbZs=;
        fh=x1dk+KokDSNOJUwUkH2MfaxnwhQg9NdIvPnDhYQtucw=;
        b=S+l4Ebhvhr03Gf0zt36rznvlMirr6QljNpQdbHL6mqWccxcpitwRSBGOqsBZKK8U/T
         IheycihY74NhN6ujEyXQie8RSIW+CiinHn5ZdTH5MuF5yIyaYEYB9wM0Zt+O/Einht7a
         j3JjnY9epYfADv5ujRbfktZNNI/vFc8dO+IYuDl3XmwMHzNbb/lUJNRr+cYOU0jRdvP1
         nIxR0fy5uJGxOzfFIplWo/DLzIybn0lIVAdXJ4/Pj3uDgZi4KoVnMr2VbPizOZDcLdyE
         VjmR/x9E9wnJbFo6JgiR5GW1Z2qXM7aYq/eAOsZB4zW49/OIKtthTybqs1ljTouV3RPb
         7n9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKiR8w7o;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-229b78bfe2dsor18343005ad.11.2025.04.03.20.01.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 20:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKiR8w7o;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743735686; x=1744340486; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YvQrHIufzmNwSQPx6JtlnlJB+LGYI8bx5qEpU+hMbZs=;
        b=QKiR8w7oB105qJS1BfrPlVoj87T7wnc0C7Z+GJQg6qJZ85Mtz1b9mIHWnniT9YpN5j
         VlVImVmZR9+PJAw6/te0qjYLNHcrPBRq61ZIVqGpVfQ4sWrkxJdgvq7eZdY0U4/GnXV8
         Dk4XYMkgOFM73Cyo8NSHWwPJuaVQc2g72SjjIVSywieB7h4Egxeb8WcBysBxF3pKEjzR
         zOisr8UarDeHDnVLdDD/cGEtFxSY8NbS8BmO3+t5TwSkNjM40A5wbb0NNUYgH+ECIS1j
         LajRP6n000bfPrHG7epamaF6Z5wcjDl2y5BUn52N3J1WAzULZ0am03SOW/5PWKLpm03o
         l+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743735686; x=1744340486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvQrHIufzmNwSQPx6JtlnlJB+LGYI8bx5qEpU+hMbZs=;
        b=mne5KKH+BE24zZvhBC8Ck9zs9u0AXJ3Eldf243GJ4cNTiiPM0QtA2153H7EQbR0kj7
         B9Jqv2lqF99yolIGjx0g5CdKCZzODq/aLXDjWWHqJvJKlX3hL6RqNjB/M3rUPBZ4ybhK
         NwKlSVf03SYaGK6cEXtFHaae+BxBF0MQRA+RohiQcVO8e6trnmqE7epHadgdFfCzT3wV
         GM/gQIAnCvnm7OIEzsnZpOw5JFwlZfBlcaG+BglsKcxVf/nRQRs9HIKERNgL3rFiaSD6
         68Px0hA6mplCyLeR4Zwc9yxmC0WQUWGh3vbfDWlr7nRan9Hda48MKVP8xoH1Zcn7X8E1
         sCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9iUX+jeg00fjZeTKel2CXSIURnRv3KIORGRRgRKTPj687maIEb1rFsvW4sdicLu18n5r567YoCT02Rg==@linaro.org
X-Gm-Message-State: AOJu0YzvVIia4WeajTqiexrCqHAu1IAF906aqtnLbIFfCcPH34+B1CnT
	Pj/4mF4QQHMtzTF2C2xmvs26B25feBlPO1QnA1twRPqsWjRpUPXqxEVHrkD+F0PkGQ==
X-Gm-Gg: ASbGncu4SH29s3kgMrecvXMEb9umIpDGjnz+TDGAhNXc3KjER3z4orwZCJLrCbtnXyE
	7IlkHRcNORTUpVIF+/tYCHTNGrs8fhj9VbfM6bOo0XnoT+NHD+sefGd3N9FAAzzcxugr1l8y9Lk
	Q2h6n2G65VOLqJU16Xl2hh3Dr//24wOlDRabc35+nqoSe6DdvJl6dJ+pRP4wQ7AP530DdZTUw1m
	Zo+CDcWHQ2WnybxmHaCTwMX9v1eGIdfepj0aE/1+pQvERik5H7VVU7EncfrU9EC7AfxvBXAIxYS
	lad+pm5mJrSVsH0mRl+qsDeVV8vTDc+xK5MSlkdUav++7kY8Vt4Nxh+Do+HeVnqPlak=
X-Google-Smtp-Source: AGHT+IFL7wt2VQAFqa4uKFPL6MTosainLG/mSIya3joSgB352tIwLrMA5yvNDXXkfL1sd/jJN3yKNQ==
X-Received: by 2002:a17:903:3baf:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-22a8a85a244mr20671915ad.5.1743735686400;
        Thu, 03 Apr 2025 20:01:26 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.49.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad9dcsm22154415ad.29.2025.04.03.20.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 20:01:25 -0700 (PDT)
Message-ID: <671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
Date: Fri, 4 Apr 2025 00:01:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 6/9] qtest/bios-tables-test: Whitelist
 aarch64/virt 'its_off' variant blobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-7-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250403204029.47958-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ABdj0wtqXpbt

Hi Phil,

On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
> test. In preparation, copy the ACPI tables which will be
> altered as 'its_off' variants, and whitelist them.
> 
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
>   tests/qtest/bios-tables-test.c              |   1 +
>   tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
>   tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
>   tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
>   5 files changed, 4 insertions(+)
>   create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>   create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>   create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf..3421dd5adf3 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> +"tests/data/acpi/aarch64/virt/FACP.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.its_off",

I think your first approach is the correct one: you add the blobs
when adding the new test, so they would go into patch 5/9 in this series,
making the test pass without adding anything to bios-tables-test-allowed-diff.h.
Then in this patch only add the APIC.its_off table to the bios-tables-test-allowed-diff.h
since that's the table that changes when the fix is in place, as you did in:

https://mail.gnu.org/archive/html/qemu-devel/2025-03/msg07082.html

Plus, adding the blobs, which are actually related to the test in the other
patch, and ignoring them at the same time looks confusing to me. I understand
that only the blob that changes (APIC.its_off) with the fix should be temporarily
ignored and, later, updated, as in your first series.


Cheers,
Gustavo

> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index baaf199e01c..55366bf4956 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2151,6 +2151,7 @@ static void test_acpi_aarch64_virt_tcg_its_off(void)
>       test_data data = {
>           .machine = "virt",
>           .arch = "aarch64",
> +        .variant = ".its_off",
>           .tcg_only = true,
>           .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>           .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..c37d05d6e05805304f10afe73eb7cb9100fcccfa
> GIT binary patch
> literal 184
> zcmZ<^@O0k6z`($=+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
> bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/acpi/aarch64/virt/FACP.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b25d3a4127eeef227434
> GIT binary patch
> literal 276
> zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ
> CVg~^L
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf568a8e93e426738
> GIT binary patch
> literal 236
> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
> 
> literal 0
> HcmV?d00001
> 
