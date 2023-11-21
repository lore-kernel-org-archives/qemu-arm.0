Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp333666ejy;
        Tue, 21 Nov 2023 01:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIb1Xk+UUitIzez5WJmaMVILUH0emfh+CGt+VLL7o+eZDILUGKqH1lLckVkKSwBDMMxcfP
X-Received: by 2002:a81:b60c:0:b0:5c9:af70:8e99 with SMTP id u12-20020a81b60c000000b005c9af708e99mr7796535ywh.41.1700557565801;
        Tue, 21 Nov 2023 01:06:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700557565; cv=none;
        d=google.com; s=arc-20160816;
        b=HgvekgvWwLgoQKq07AQs7eLEJyiJwLuPr45jRxwbRa98zsUXUVynWXB6i1LrXtXAoJ
         V5ZgN97Aua9WyCJRkeve1QU99i1alEesgtc5alPnBcHABTZSEugqDwEoq5SunFBTIN0m
         VEkUhrjFi+OY2O6e6u3Pm1E3+bOHn22RaqhpTZYvuWdHHWKHCTC7BXBytYucBUdznCtJ
         UrpGWnRXny4RmSqQc2pnHPpiMHuSWNeltgdHV0q7BPKvENCX3W2rcG6WhZGy/RTILgEs
         8DUvCAIKdoZe716vBVW6hwLu0DOmNgVi0HsnOIhhAqfRrjXzDcnujlmSk6zM2RRR8Am8
         4piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y4Du3Ez0Zda862ORNrhEGOC6WRkRrWqRP1m9LddZkdg=;
        fh=HQu76LFN0DbKXHr60vGnzTmi359RrU+EPC8eBDHkPTc=;
        b=bxtU2MYmGcYToqIAIRGTtTamJ6UdiLmFS4Gh389tp3hYMGcgcwEb3nPXJ0Lz0y171Z
         HF2cQjoqoWwd0D6Bqy3q2gbvxh3qOkXGUeMgieOaw9cIKduts9CBTrfMyFjbBtqmYz9O
         bInuC8kafqdZbtCh/e4TwXV+adSkZVT/cwO7DUeToRAWhKTukqZqw7vJhp6POeTiSnqr
         c+UYBZGx8lksRLKObFlzhGPDVAxe8yB+BguxcbDCId2eTWbmMZRd3l/IOhKOLt9tzDV2
         aGqPDIq+GqEc98ZL/ImUGyj930rGksgv7sfLijinCX3lCCwyU4VP90HT9zHpL5AkCqxL
         Lzfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KCC0UnWb;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <shahuang@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u10-20020a0cc48a000000b0065afd8ab934si8834957qvi.376.2023.11.21.01.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:06:05 -0800 (PST)
Received-SPF: pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KCC0UnWb;
       spf=pass (google.com: domain of shahuang@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=shahuang@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700557565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4Du3Ez0Zda862ORNrhEGOC6WRkRrWqRP1m9LddZkdg=;
	b=KCC0UnWb9j5R6Yj06UvkSz8KstpostJo1/vU9vfqZPRnjBat/8Ze0O6j+EyewBXhPi1YUF
	jdhfDvpEX7ldFvf4Mu3RjG8L9/Ox+cJhmt6vQrAtNgMHuEWIbqUStuI91zoYaXB2A+k6XY
	nxjPXRTjwhcBniDh96he08E3QeYiDQs=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-tqJtkNebNiiAb4jYirU1_A-1; Tue, 21 Nov 2023 04:06:04 -0500
X-MC-Unique: tqJtkNebNiiAb4jYirU1_A-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ce29f5dc6cso1264584a34.1
        for <alex.bennee@linaro.org>; Tue, 21 Nov 2023 01:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557563; x=1701162363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4Du3Ez0Zda862ORNrhEGOC6WRkRrWqRP1m9LddZkdg=;
        b=uyEBueE1qVie/ezV2N12RRJMr5PGDQhN6zTaCUYEsrCWrqiV99HiBW7zx+Dj5rKdwY
         8wBuFy4DKMUc5oIB4ZMLfRK0rYYre/7JYniSk38Y9Uyx29WQ5roTgSpQQlxIJDbxB8z0
         26iUXT/+ZsPkMDd2oCVOdktLV0I9SE9G1RWnCzcefuKqXNGtUwc2csaWsi0Vr3bK6gmC
         xkWiHfqErnxLQYNXngB44s9dC3fwbD6jRl4bgxBS9AWMou/2b+Q/CHpXplyPJa0mxtHo
         UTYXGjrGURfbZob2ztu1qGnFVfGEhsQvFqjSxkIm96lQzlWSpFTjHjx6lqjysWtxGp5O
         d16g==
X-Gm-Message-State: AOJu0Yyp+qh8CH2zH+68wPcb1HciWWN7ztRZL/O/MXZPNl1covr0KJxN
	eKFu/7KFNYDtg0iEiupmVnVEvRC3W+c1x0hsYd3IsU1iLRRWo9Ft9PJpP89plEoNxbYk7fTGShP
	b9B2vRx3MTFleyegc
X-Received: by 2002:a05:6830:6811:b0:6d6:b24e:72a8 with SMTP id cu17-20020a056830681100b006d6b24e72a8mr10227276otb.3.1700557563402;
        Tue, 21 Nov 2023 01:06:03 -0800 (PST)
X-Received: by 2002:a05:6830:6811:b0:6d6:b24e:72a8 with SMTP id cu17-20020a056830681100b006d6b24e72a8mr10227255otb.3.1700557563183;
        Tue, 21 Nov 2023 01:06:03 -0800 (PST)
Return-Path: <shahuang@redhat.com>
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id u16-20020a656710000000b005b83bc255fbsm6338717pgf.71.2023.11.21.01.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 01:06:02 -0800 (PST)
Message-ID: <139cc093-8469-0a8f-69dd-e1d8471030a3@redhat.com>
Date: Tue, 21 Nov 2023 17:05:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V7 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231113201236.30668-1-salil.mehta@huawei.com>
 <20231113201236.30668-9-salil.mehta@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20231113201236.30668-9-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mHVEzePw3h6f



On 11/14/23 04:12, Salil Mehta via wrote:
> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
> and non-hotplug events like system power down event. Each of these can be
> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
> the CPU hotplug event.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 0bd3f9399f..3acd6fcd8b 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>          0: Memory hotplug event
>          1: System power down event
>          2: NVDIMM hotplug event
> -    3-31: Reserved
> +       3: CPU hotplug event
> +    4-31: Reserved
>   
>   **write_access:**
>   

-- 
Shaoqin
