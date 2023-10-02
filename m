Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1120304ejb;
        Sun, 1 Oct 2023 23:11:45 -0700 (PDT)
X-Received: by 2002:a5d:6401:0:b0:320:938:300e with SMTP id z1-20020a5d6401000000b003200938300emr8506185wru.4.1696227105531;
        Sun, 01 Oct 2023 23:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696227105; cv=none;
        d=google.com; s=arc-20160816;
        b=lcrw6iyoi9OfFsg+ZQgzl+h/H+SVuSfoR87JReJq288JqcHDxk0V3BlrNDBiQBAghB
         /ekienh4ZqICUejDcxQ+bXofQSnaVgk/RljuJ64io8Y0/UL3FM0eOxP6iWqZ6rTNBjrS
         hS1VScNhuftK63pfhj+UXHNUgi0eNYW6cEflRTH8tTzKcBSSdSMvMjZsrU50MUickBWo
         xllSEfLEhKvTdxvQrVDlc3Ct5rk5QhsTz4wocZOxI89aRTqZe+pH+IK+x9ngKsZmhORH
         Ue7NSfwIE5tiUENIDygwPWKsbz6Wg0QTw2l9Z0Ty/VPk08EiDe3gTTBPHBn3ZNUppEmO
         CJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2X73YWi5k52gQOV92nqQELEwk4ksn8Z61zU2nAH7OKE=;
        fh=OoYXXZlM/EHcXlWXYznewzdYMy4uuT8d98MfUEy5xO0=;
        b=WVoPM+XgxSokgOW9G52wt21hDlcRox7Zlm2sIgvMYmH81g1Oe0l/CfpVkqe4dx5hM7
         ZjDNIfa/Xey7P6Ar4lqznNXDh15Kv1uIgCPLPJhtR2OIFYwqJLx6h96B2nIcmNLUXOaZ
         ke//Ejhg/DYiAbNGbOZ0JPC5eTS5oPF0MAwfLdupq3siuz3/SKKqsSEhy+EkbxdgL1bO
         +hqEoIsYIf7GefoBrpGtoGLMSYhT4sDOZ70VexrLEhj+bslUa/C6+eW9lh5AacbyAPtN
         Z/QYWBAr7HnZ1o4B6apSDkOwuTQZg2rfKswQCEXOc1JcyxHH0XRSyeDg0KhrIAz5IluA
         c/Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQj3tfsS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r12-20020adfca8c000000b003216c54f3a8sor1023070wrh.10.2023.10.01.23.11.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Oct 2023 23:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQj3tfsS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696227105; x=1696831905; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2X73YWi5k52gQOV92nqQELEwk4ksn8Z61zU2nAH7OKE=;
        b=GQj3tfsSCwLOYzs7S8tF6D97Uq2vU4h/rYbeHlAWzHW/YTq+ZeabQzNNLJaIdPtJNa
         xZY8n+FGbNSbXhVGJRSDfjCtvyivTToSiHAjw15m7xuy/HdmNXR5Say0IPL69028FIqN
         4gkrZ5FCG5UntlSfcNqCi9klgzXRCLzYJIgyJKZzz1JrF6k4pnWqUXRkYnTZI3hq6xsN
         m0qfMO5UESQhudtkkFpvzYgwbsTTRUts4Ag6CTBg3yJN7u/I4g0Cm42XAs+lnJ9TTkeg
         1F/yiR0fPNugYJyFwMgxG6yp43+ObHM0SQ+JnM+0n5h5FDSsv51sLGwD8G65BkOZdT1J
         /Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696227105; x=1696831905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2X73YWi5k52gQOV92nqQELEwk4ksn8Z61zU2nAH7OKE=;
        b=xIPrs6l3zV+KqQuyvViL0tqMov6tRjPWjRw+oMQbHRQ2qQIQmW6V4hV6c4aYtnKS7O
         xlvFMwY+M6AwdRL3p2lsxXettsmoCVkbyA8X1BjguTixHszMRmgH89roz9fcBv+dY1eI
         yzH7iw90lZ8lBnLozztVGFGQnSiZczl1s7nqlfyAps5RKB9Pk8i8SHc6FQUW9zRGgIXj
         mXC8oE9/CNTfrvE6IFo2aMSfT0TRVQyakvjt2L2FdgQFcPArsUTvw9Z189eW75BJ28ye
         P3FqfQ21dL7wNwglXJkEVzhB0xOPp1/Tbddn0n9qwz6VbmXXK7wo/fCtY1W9tNzmj11c
         W1ag==
X-Gm-Message-State: AOJu0YzMM16tjlPjN32Caa9vhAab48tyTTbonTKqdXCGmkfU2rl6n9Op
	muDoE6brYc7V+CIxFCbZ4OeEiGTq
X-Google-Smtp-Source: AGHT+IHYJI99Z9n+uRPXyyIg5Wlg1N46dODTpnWFyaSFemwGy9LD5/pkzuouaFYH1qF5iW6g69n0vA==
X-Received: by 2002:a5d:6782:0:b0:320:82d:59a8 with SMTP id v2-20020a5d6782000000b00320082d59a8mr8800904wru.62.1696227105139;
        Sun, 01 Oct 2023 23:11:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (sto93-h06-176-172-7-203.dsl.sta.abo.bbox.fr. [176.172.7.203])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d6906000000b00321773bb933sm8644815wru.77.2023.10.01.23.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 23:11:44 -0700 (PDT)
Message-ID: <d94e2f52-0bf4-1d97-e9d0-8f14efb3426a@linaro.org>
Date: Mon, 2 Oct 2023 08:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Content-Language: en-US
To: Salil Mehta <salil.mehta@huawei.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "maz@kernel.org"
 <maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 Linuxarm <linuxarm@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
 <20230929124304.13672-4-salil.mehta@huawei.com> <87y1gpnjf9.fsf@linaro.org>
 <00cb5ebaa2a246529a9095b5f7d185b4@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <00cb5ebaa2a246529a9095b5f7d185b4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /HAuDUXhCmAC

Hi Salil,

On 29/9/23 17:47, Salil Mehta wrote:
>> From: Alex Bennée <alex.bennee@linaro.org>
>> Sent: Friday, September 29, 2023 3:27 PM
>> To: Salil Mehta <salil.mehta@huawei.com>
>> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
>> philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
>> lpieralisi@kernel.org; peter.maydell@linaro.org;
>> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev;
>> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
>> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
>> will@kernel.org; gshan@redhat.com; rafael@kernel.org;
>> linux@armlinux.org.uk; darren@os.amperecomputing.com;
>> ilkka@os.amperecomputing.com; vishnu@os.amperecomputing.com;
>> karl.heubaum@oracle.com; miguel.luis@oracle.com; salil.mehta@opnsrc.net;
>> zhukeqian <zhukeqian1@huawei.com>; wangxiongfeng (C)
>> <wangxiongfeng2@huawei.com>; wangyanan (Y) <wangyanan55@huawei.com>;
>> jiakernel2@gmail.com; maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm
>> <linuxarm@huawei.com>
>> Subject: Re: [PATCH 3/9] hw/acpi: Add ACPI CPU hotplug init stub
>>
>>
>> Salil Mehta <salil.mehta@huawei.com> writes:
>>
>>> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
>>> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
>>> stub to avoid compilation break.
>>
>> When does the compilation break? It's usually ok to include stubs with
>> that commit.
> 
> 
> To be specific. it is not a compilation break but linking error.
> 
> Support of ACPI_CPU_HOTPLUG is optional. This flag is defined in architecture
> specific Kconfig. Function cpu_hotplug_hw_init() is part of the hw/acpi/cpu.c
> which gets compiled only when a particular architecture defines ACPI_CPU_HOTPLUG
> flag.
> 
> ACPI GED framework support for CPU Hotplug is not specific to any architecture.
> acpi_ged_initfn() calls cpu_hotplug_hw_init() when GED device gets created.
> This functions gets called irrespective of the fact CPU Hotplug is supported or
> not. If ACPI_CPU_HOTPLUG is not enabled then presence of cpu_hotplug_hw_init()
> will cause linking error without the presence of stub.

We can extract the common pattern in both
- ich9_pm_set_cpu_hotplug_legacy()
- piix4_set_cpu_hotplug_legacy()
to take (AcpiCpuHotplug, CPUHotplugState) params,
then guard the cpu_hotplug_hw_init() call within
CONFIG_ACPI_CPU_HOTPLUG ifdef'ry. Doing so we can
also remove the acpi_switch_to_modern_cphp() stub.

Regards,

Phil.

>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>> ---
>>>   hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
