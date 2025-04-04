Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4756979njd;
        Fri, 4 Apr 2025 05:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnuGYcvURDRYSTMwMLJqj0fDWwP/UGW0Mc/o+3Nv4JR1OUqvben63qMndF6FVB/+WpJmSfQ2XpZke0eQ==@linaro.org
X-Received: by 2002:a05:6000:250c:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-39cadc737c5mr2781096f8f.0.1743770988192;
        Fri, 04 Apr 2025 05:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743770988; cv=none;
        d=google.com; s=arc-20240605;
        b=WN7jjf3y2Cgo+GTEVTaPuxLgtH873t7IJK4IzrC1NQqaOsL0c/QGs6YndmcgAjAIeG
         UQj+e5EHOVQeDOQb//FpKBKyjBTt/mRVGvTZqfh58e4rSD0PML00XrYxEQLL5X/hQrCb
         nlF6yuCurapSNgQTcNzRB/synlh9DDBkjL8oB+scUSdUEd2qyAmRuD4lYe0iUTpbWvMS
         fLo7spSXbHDiJdu7gy4MO/JFoHGVxfv/h7xv+JgSFQ3/BuPkX7W4sqz9G+StrGdhoLeh
         He6sYq1BJLSFQ4sLRZ2NYYsq1w57mGEzip/d+OWzz0dd5YAHdrnXKBOHz0zPKCe5F6lR
         oCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PHz6QRFKgtp/Y368ONgTwaOUzYTDmLXSDiIxMvjKI0M=;
        fh=m2gF86f/N8KkQ3DFZTo9DS4XK8jVPdUGwCFclF7P+XA=;
        b=BfMEtjRIqJOP4NHju7vqm+YqoD47naQkHyx7c7QPpzsWyAdrmF6jwyVA8N6hD4R3sJ
         lgLYzEIR+/Md+Hg04hZIC0pirFxcy+UY7RZV86src+HYCX/DoLuiO19DNfjave71i7n0
         sqiLMILYR56treTecb6/EfdnRlqjHK+vSV96nUn64LU1j3oP1ijMqMIPCq2fnB050B8z
         uWF+Ygv27iWpT/zA/HbTe55WjJ6PPMbFQf2uVg54p9jsb7A3KaVCDB5iQtUbXs3Mjrya
         r/xNRxmZ4gTIMnsoXglUoHoJMv98k4ZZDIpcxJ7apxxFDe6WGOSGaPtP4ARvGk/ccL0D
         hcRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JT3+y/0Z";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c3020651bsor1352269f8f.4.2025.04.04.05.49.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 05:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JT3+y/0Z";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743770988; x=1744375788; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHz6QRFKgtp/Y368ONgTwaOUzYTDmLXSDiIxMvjKI0M=;
        b=JT3+y/0Z4MXQbzhWrzWxGGETza2f5VuHQ2psQr8NhBvHXRnls7QkGzJHynG/dK/v0v
         Yd58JKjI52Md31/fUPtggJ/4Hwiy49mWNIixJ7JvoJG0IxfVoe29dpxVE5NWcgtbPUVV
         2Tbvlq9ISmXUalSE8dKVr11I7PSXa39IkucsA+ejolyb5F0ult9zlLQ3B1nfDPsSOjVO
         cVR2MhA/xmx28irvNB+yxnijGzW6YYsjBS8A0zBQn4F/GzPhtHhl1JZvzSML4OPoKi11
         NNeI8Q7+WaYMNYvfwQ2Ex+vF0e+PqhERcOKYHCCRPMjAKR6vRb9vbbUSiPHKeWCXc3yx
         ZTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770988; x=1744375788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHz6QRFKgtp/Y368ONgTwaOUzYTDmLXSDiIxMvjKI0M=;
        b=ETt1U0VyzFehB4pgG9/zsLv9XO6gBR2reOMJI5iYRUA2r3lVQCRmfiy6BRl5Vt0KPz
         gkp/n8CvJ+oxfXkBJt85uqU8U7SqEOLo0ZvRuoG/uVtQsflVVIOHbTcPGUX4PsgOwAK2
         LI3aeRC3JFClu3djJn3QNrS28dVACKD631pFBuEu6hnbTrjKigAXTaJqKGBLs16brg7c
         34JJKSqjaX58ig5STh586CnkIuNwTPvhKiOgD8bCe/FMyRznsiJ1cgClRUaeRgr9RlVO
         8P40774JsbniPK6JdPI1lEf6c70NO6SmNDL/hW2FhRqLk7kyozjU2UHOnGkyjX/Ddahs
         M5pw==
X-Forwarded-Encrypted: i=1; AJvYcCWObXbGcsKdClTS4dQ5qcDDtlHSg6HfKN93xgoeGBqX9elcrTuVjjWBGrPLpGe9BNL2AmYYg2Pk+0OV2Q==@linaro.org
X-Gm-Message-State: AOJu0YwvndCphN9f6g5HwO01Bjiuf686BNmpP0bQXj8tuA+Ckcj9Q7pp
	OqtaEOCfFcM5bYVYv13XqvGKXWfvxWZ6o77zhlDPNdu64S6bhUoqLXk1l/z11zu9HQ==
X-Gm-Gg: ASbGnctc6J5ZDoek6Ha+xqdNj3GF2nzpRnuYc5eSLMSaId4NaYRNIYmCgbRQRT8h8OB
	T7phLpdGbbAJtiDFFF7BDzecRHZJXRsjN4TajqnIGzWVLQ+jJy5Jig3DwtYFhuOMkof8E3MLlX6
	Zi/ICgNM6JQabIwkKlT9NCaVhY0YZYngkqsCH7f3W+wzqWbGGl5gAQ6SgpnJlbD5Tz2lpXfejgQ
	aniEyLeq/+ppJN4hMKxg9NVbAtixDxiipH/8Hh17fmfuci/HNWNz4YcmvTKoBPkpCszUCiD1hBI
	Edr9U2S60riDRDSOfFUR+TEKzTZcq9bScPASz2gHD1zcB4MtmO/MhiEVmbh0h9nU+8zskk1m0fy
	X4I7Iu2TC/mv4
X-Google-Smtp-Source: AGHT+IHQMvCvIZAswZgDXYftO25U5IsTcaLWf9G/LfTu2jUpD0e6YsK5TRdiTaas6lhcoPhV5VlhoA==
X-Received: by 2002:a05:6000:186e:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39cb35a0d4fmr2577194f8f.3.1743770987582;
        Fri, 04 Apr 2025 05:49:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9da1sm4208847f8f.22.2025.04.04.05.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:49:46 -0700 (PDT)
Message-ID: <6b64af93-f542-4a0e-8e55-5bb235f42c83@linaro.org>
Date: Fri, 4 Apr 2025 14:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0? v2 13/14] hw/arm/virt-acpi: Do not advertise
 disabled GIC ITS
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Udo Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>
References: <20250403151829.44858-1-philmd@linaro.org>
 <20250403151829.44858-14-philmd@linaro.org>
 <20250404124110.59c59dc3@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250404124110.59c59dc3@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tgNVjuGLYqN2

On 4/4/25 12:41, Igor Mammedov wrote:
> On Thu,  3 Apr 2025 17:18:28 +0200
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> GIC ITS can be disabled at runtime using '-M its=off',
>> which sets VirtMachineState::its = false. Check this
>> field to avoid advertising the ITS in the MADT table.
>>
>> Reported-by: Udo Steinberg <udo@hypervisor.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   hw/arm/virt-acpi-build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index e7e27951cb9..38a9e6fe0c5 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -212,7 +212,7 @@ static bool its_enabled(VirtMachineState *vms)
>>   {
>>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>   
>> -    return !vmc->no_its;
>> +    return !vmc->no_its && vms->its;
> 
> It's confusing have both no_its and its,
> it would be better to lean this mess up (i.e dedup or rename if something is poorly named)

What about:

class: s/no_its/!its_createable/ or !its_usable
state: s/its/its_created/ or its_used or its_in_use
