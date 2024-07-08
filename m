Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2490398njb;
        Sun, 7 Jul 2024 22:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFtiwvGILvjhdldlBpMGFtoHROtWFpat7Cqo2a9zD6i1QSo7FA8sUFT6yDDHT1afYzHf99U90MAai2EOhyom2dsq/gyvQM
X-Received: by 2002:a19:6a10:0:b0:52c:dc25:d706 with SMTP id 2adb3069b0e04-52ea06bad79mr7262928e87.52.1720416751661;
        Sun, 07 Jul 2024 22:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720416751; cv=none;
        d=google.com; s=arc-20160816;
        b=JaD6ZqTXFh9YlU8ZI+xN/VY2BqqlKTxxwEajkLfmFvUWrMv3jVxG/LkEaVsPZ4dWcY
         T4qtW58hra+SiHLWI8UP3xPhaTNySEvS39iQP2tzUOdf1HueHx7h4d/TPCJNB/g5EfyC
         1bzb22jWp0EGFSL1CG5oI2v9wd/2AKAfWrEq6ElORdtZtHk1AfnkrVT8XCn7F6AnqpVr
         Y78FGguRYRijpv7+rZV4kJuJJ5ptnTmfzMHDvPyKnPzrZoa9AklLPJCvtuB+vCWNC4TC
         9QQQkqNLegLyn1onTUU4HnqaaWX7124ATotM4IUUQvMLmVXenLvlSB9bq/Aq9Ue96JI3
         qy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dm929TgKAN98lOusto7ZMWWlCh02WcjqKU7UMCwZV0A=;
        fh=Rx0uzYOt65FkvC/j/SJCeTf85zBgePnAIXfvFzvs3Q0=;
        b=UJRvcGp/am/qkJ55r8HtKpDIu3qI04orapbg8UNHOfm6FNcDUfqkDrUsvQnwACiLgt
         tD1L7v7cxcjYvuSKJ/lCjC+OahanAHrqrXY3FKOGUxxJ+Dw1J8cncrFgpzJb2xDvngVP
         Ea7pG2E7gXoEoVIqnyU69tgB6G5UOrVz+IBxeDGl2LIn6mNX9ZIu/4t2aM7e9gU4OzJV
         vgKeLEEAwHD/Zn7Z5QOPuAOHsQ752PHnDym3uk5m72dQqCkgOaCab5D39iG5W6ebZx36
         HwW7412cM/rMNSId9egq3OlXJ5QHXv2EnLfCqFMwsWTWx2UIWdkTay79AzhYfv/yCsxV
         HyGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=P13m4qoT;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4265c04d0f1sor11430225e9.4.2024.07.07.22.32.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 07 Jul 2024 22:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=P13m4qoT;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1720416751; x=1721021551; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm929TgKAN98lOusto7ZMWWlCh02WcjqKU7UMCwZV0A=;
        b=P13m4qoTCvAeeXbOwMTJ3zmSdtRJPoYkG6TZjITNphQm2Z2ssOeNRBHykJTDe/xQzZ
         jb+ERQyx6N1oDl8RKzzunyHPfxjshvOzoWhI5WIA9JpzUkuxpexBZccxLrYCHps5DAFb
         yugEo4GUNT0YvUDqyytRQQtf+ifwbnE7XaNGbWnrr/l4oQY+5XmtXMw8yUqXvMB+onji
         u35lKNIBZD0gJET8IYQLMMbmxlzCWQCNUX7rWbE1zpO1VWDZYJ3q33DgCqEHk03K7rKN
         SkgZpXb2RWb/KP8sqEHfUpvSCIVFAWNkwCuuuRlhpSJCFEWOHBola9loS2w9MIbipuhs
         LE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720416751; x=1721021551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dm929TgKAN98lOusto7ZMWWlCh02WcjqKU7UMCwZV0A=;
        b=WBYmDvSlM36ulU1r9KzkWZaPVoVADvq06vCymB3SpF9BwA6a/BjTGb7mZAyiuHfk2u
         zTLjoG7R0g4Q8hBOHZyvwYJad8cI2pyvCrlr17ZYilF5SIrQM/HL6ADBKCgZZ1FYeeap
         bA3ZbVc6NBxikW61lV5ipSbDMWZFZG2uXF9XSUfoPa9ITd5gwNwPh+K7NvoOC/QBzwdI
         T5Gt7VFE58MqMyInsVrPI/INSQsGEBoG0cSyIb7LtPWfuQMy41CnHbQ47youVm4Hxklz
         Ami2j6RsvvoRTs3jiTRIKjsI8fLf1E+xrEma0BfFK731suurk+U3iAIwVAp+mo2SWvuA
         wbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPL034KPXoLSR+fYs6/yBmvaFKIihVODwIZumIQVfdIt1X3F6FJ29U2KqbGptW7d4pEdas/HeSw2p22NeZsewwoxI5nMZa
X-Gm-Message-State: AOJu0YzJR5/CWshoskdYhQdbXGkfeSuShOF6F9lcn46cP9uRArMQptei
	CSv6FXBClVw8BZ3c9IzNTLwCNvuH60x5TmVRI1+ppWoh2akNaG0T07qUz8ND5mA=
X-Google-Smtp-Source: AGHT+IHVJ5VTeuWPCIJDC1Yp7HLKmAtjpWs2Xqm00Rj6FPGTR4xCYYJsOMz/8s58VQKn8Lg+aPBgTw==
X-Received: by 2002:a05:600c:8a7:b0:426:605b:8c53 with SMTP id 5b1f17b1804b1-426605b8e0fmr27511665e9.19.1720416751108;
        Sun, 07 Jul 2024 22:32:31 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.11.12.72] ([90.220.10.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fc8bcsm149719465e9.44.2024.07.07.22.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:32:30 -0700 (PDT)
Message-ID: <db8c2a7c-cc40-4fed-98fc-171f70e239ea@opnsrc.net>
Date: Mon, 8 Jul 2024 05:32:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
To: Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, oliver.upton@linux.dev,
 pbonzini@redhat.com, mst@redhat.com, will@kernel.org, gshan@redhat.com,
 rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Zhao Liu <zhao1.liu@intel.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-9-salil.mehta@huawei.com>
 <20240706164519.06c53d77@imammedo.users.ipa.redhat.com>
Content-Language: en-GB
From: Salil Mehta <salil.mehta@opnsrc.net>
In-Reply-To: <20240706164519.06c53d77@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vG8+bSwWqSmE

On 06/07/2024 14:45, Igor Mammedov wrote:
> On Fri, 7 Jun 2024 12:56:49 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>
>> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
>> and non-hotplug events like system power down event. Each of these can be
>> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
>> the CPU hotplug event.
>>
>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> suggest to squash this into the patch that introduces this bit [3/8]

I thought, we are introducing a change common to all architectures?

Best, Salil.

>> ---
>>   docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
>> index 0bd3f9399f..3acd6fcd8b 100644
>> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
>> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
>> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>>          0: Memory hotplug event
>>          1: System power down event
>>          2: NVDIMM hotplug event
>> -    3-31: Reserved
>> +       3: CPU hotplug event
>> +    4-31: Reserved
>>   
>>   **write_access:**
>>   
> :
>
