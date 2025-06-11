Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1892623njc;
        Wed, 11 Jun 2025 02:45:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnb8T5yG7RXlFr4hQs62OlPf0DmUz/A+cXm12FL4iqfTQhigODqLLoyvJEoNjHuJH/nvgqUrZOCM+b9w==@linaro.org
X-Google-Smtp-Source: AGHT+IGY1RMkY8q4jFm1HkrqhlDccTlzW9j4ag2a+f5MQWWBnG81VUXlm8CnwrHcQhjF+yCfPGh3
X-Received: by 2002:a05:622a:a412:b0:4a7:146b:c5e5 with SMTP id d75a77b69052e-4a7146bc91amr33798171cf.21.1749635119382;
        Wed, 11 Jun 2025 02:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749635119; cv=none;
        d=google.com; s=arc-20240605;
        b=FrohbtQ3AOdmQL4+Gta0Uur96RuQVkFu3P1m40yw3jH/SFxSAIjAFqQpB5j+p3GYKY
         uDgQwMhS9Lj/XZLeamZPxpz3I57o3O0/LQthnL3Y3AcDWNlEKDYwFpHQIPvMFM72Q/tt
         gLZl/cLQBWXMsR/1NBD8QJjw8M6N+EZ22Sqlj2tU8fjBDIeXzJ0//WJgV3JsD/2Hn+wp
         sHCwq3aS3Y8/U98u2aaIFEcsa7nt2fZiN1wydmoDVA2Pj2f5klXtfHSarK/WW7ND6qh6
         1wSNLUr5gErU+7pAy9HFQT2TxG/tL6fYTZzGhTbFJFahY9tE6Y6rKMinmRqxiHTaDBse
         avbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=JmAR55xcMt2ycvqTr5qtm/ZjRJwV2rucoaq4kve9UEs=;
        fh=5j7v62qLFRexLkkT0+lHyYlxsPyZLX6k6H3x4C2o+dY=;
        b=XqFPOmuXup1Cf8rutgEMHZ8TmZfHMvcgaf/TFl0SVl0rbLemOyELpMAurM4OF8Faba
         TZQrHepYIqAz7Fy5QvNm/AEJp6V9jzVfVrSAD+xYrgqjjsrTez9pytoVeyKtj58fECJ5
         sYOpYyE0EjRBNwf23WuvumQru2xKYREPF4kxl3gwEvvI04obNtjy9/jFLvmOafAOWX7C
         Rd3ummF56Vq8MHXruOxkMQETvfucZ9IuXObx7VjP8Hl71Ug9V6Utxw1LCV6x+ugHAc5W
         FHVcBwSHYN9HdnYaEQlbr54/gr3lacFb6onYU2wzv7vBc/SsfUBC9yV3kEOriBJKj1i0
         gfnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gcl8pu6g;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61985ee88si129396581cf.283.2025.06.11.02.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gcl8pu6g;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749635118;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmAR55xcMt2ycvqTr5qtm/ZjRJwV2rucoaq4kve9UEs=;
	b=Gcl8pu6gSzHWog1V87PRlht1TJ62Wts6Roo5oTToLvRAewIpHFRmXalhQb+QmqbAgZSIKm
	m/xM7/pbL0BGYixnjulDAvp772x6t3s4YB/6AAHX+z0wCJNnIAKUy+yRVD8IBKis7Qrn3+
	I5Bq6excZv4Pc4M/ezDInP6qy1JoJ9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-1QVFykZaNFKVuIRrknsyqA-1; Wed, 11 Jun 2025 05:45:17 -0400
X-MC-Unique: 1QVFykZaNFKVuIRrknsyqA-1
X-Mimecast-MFC-AGG-ID: 1QVFykZaNFKVuIRrknsyqA_1749635116
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cf229025so20406055e9.1
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 02:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749635116; x=1750239916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmAR55xcMt2ycvqTr5qtm/ZjRJwV2rucoaq4kve9UEs=;
        b=dlq1laBi5f2N3NiYxsxjXcqWvwI396/tKnZSt0lBbUjg8TtzmUVRGzs4+zYMMrA4pE
         twjzXIj4nt5rENfzanrX2vpvgrf5vlKXhtVPzoPb4tgLDg8nKQy6bOD7X6i2ZZSt6jVJ
         griwyn/T8nJ9dp5J83MyTYMbiwvsRjYFXifKto2phVlMSzlZDQgSlWCndccwaW84MsRK
         jt053v+RWF7566CUU2G49kjQ3scdDxVr3l/jvUNZkzqf//tFvsrv/hcWKYhUdDn2Q3y4
         NTd1pTycA5kmqX7DusW4KuKUjfK28IrkqgfWEAvX003kjgWq8bnADib7UxR4BuMCl8s3
         gcKg==
X-Forwarded-Encrypted: i=1; AJvYcCUCZSMz/pWvnmUcQTp3sQudEkbBIzpFIBEiKT2O+xevVEu9kB/Aln0GvcbmIgxUAOypQ6QBeACvRcoxYQ==@linaro.org
X-Gm-Message-State: AOJu0YyyoYrIc7xjJSaIzHlopU6fYCx9lqrJVHfSAlPlmjfGa9wMU/DI
	+NJQGY1I5XZxtYlzbLGv8SjSNPNBYACour/ENRtD24vnp3/w6e1MlpxVn4kQzB9R72Qv8ethjzz
	HBA1lYF3TVVYkBUSk4ZRitZa7WJOPyrX2zDmUZ9QqnXM42BoDjE7GHwowtQ==
X-Gm-Gg: ASbGncu8J4rtvJDHFHFlp3nlAgnp1k+rpjwOGAsjZuZBczlK59J+N+E+sPjZwlFIqYk
	x79m5Pd7Lss2VkMvvRnBwjp5iIUPk5ApyY3mOmKKlFgNY9/0GOZQDqs5UPAfKmqe+ygZo/+dmYH
	7ALlSG2ZDGlcIC5LaUYCLWjIIUtc46xP9Op7RCrTFYKy1Ezw1GNgZANtdiw+Aifh88vEo1Kaedo
	dkFlh3Wmhq2W0s2AxpF3loteeqH/zaEKdzW8epp8+7b9mcr21BnyN6u1cUFH0BASYfYq1Rg+PfS
	LB/1UaeJYBlGL9FfPobt1SQhtdYhIWPfGqfekqzaNLB8xjp3q9cwzRG1CA4j7JzqVLrvNw==
X-Received: by 2002:a05:600c:3848:b0:453:1e14:6387 with SMTP id 5b1f17b1804b1-453248f971fmr19823865e9.32.1749635116326;
        Wed, 11 Jun 2025 02:45:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3848:b0:453:1e14:6387 with SMTP id 5b1f17b1804b1-453248f971fmr19823545e9.32.1749635115873;
        Wed, 11 Jun 2025 02:45:15 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ab1a2sm14573895f8f.28.2025.06.11.02.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:45:15 -0700 (PDT)
Message-ID: <dd1e452b-9b64-4c9f-aa3f-6deedab5d912@redhat.com>
Date: Wed, 11 Jun 2025 11:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 08/25] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
To: Gustavo Romero <gustavo.romero@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-9-eric.auger@redhat.com>
 <20250527143816.39c0dfab@imammedo.users.ipa.redhat.com>
 <20250527150357.03bfab2c@imammedo.users.ipa.redhat.com>
 <0dc27145-d748-44c2-b6a8-19df16254882@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0dc27145-d748-44c2-b6a8-19df16254882@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1xf4ZvqT_tX-fmAngt7m2oWesCPsnpp4T6IJFBz-nhc_1749635116
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6+U8hZRtVl9J

Hi Gustavo,

On 6/2/25 7:45 AM, Gustavo Romero wrote:
> Hi Igor and Eric,
>
> On 5/27/25 10:03, Igor Mammedov wrote:
>> On Tue, 27 May 2025 14:38:16 +0200
>> Igor Mammedov <imammedo@redhat.com> wrote:
>>
>>> On Tue, 27 May 2025 09:40:10 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>>
>>>> This commit adds DSDT blobs to the whilelist in the prospect to
>>>> allow changes in the GPEX _OSC method.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> I take it back,
>>
>> test with x86 enabled breaks on microvm,
>> so it's missing some DSTDs here
>
> It's fixed in the series I've just posted in 24/25 as we discuss it.
> Thanks.

thanks! picked up your modification

Eric
>
>
> Cheers,
> Gustavo
>
>>
>>>
>>>> ---
>>>>   tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
>>>> b/tests/qtest/bios-tables-test-allowed-diff.h
>>>> index dfb8523c8b..abe00ad4ee 100644
>>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>>> @@ -1 +1,6 @@
>>>>   /* List of comma-separated changed AML files to ignore */
>>>> +"tests/data/acpi/aarch64/virt/DSDT",
>>>> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>>>> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
>>>> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
>>>> +"tests/data/acpi/aarch64/virt/DSDT.topology",
>>>
>>
>
