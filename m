Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1761962ejo;
        Wed, 13 Dec 2023 09:01:00 -0800 (PST)
X-Received: by 2002:a17:906:86:b0:a1f:a6bf:4e5f with SMTP id 6-20020a170906008600b00a1fa6bf4e5fmr2443891ejc.151.1702486859929;
        Wed, 13 Dec 2023 09:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702486859; cv=none;
        d=google.com; s=arc-20160816;
        b=yHStc38JI4B5xC1mLrBPLEsAHyWXew3sruH1EDeDJelqm3mNAz3x2zI5A7zK7ixyrw
         nqdcMC5Z+qGDhev7BvZleL3csyHniy4hLDtYbHTn6p20h/7esXaTxiMzYBxvh9HD6rs1
         QdmRDHtpNnExDEbUwHkiQxHzp0vyH7liEbN9v8cYiCrK/s/GvInKnXWTHO5PCRwg7TV1
         9AlvFeOH7QvvlmtAvRkYB1/G61VRfyt0+41oMJU0GpxCuqNSt6spHum7RGqW9SSdmZLq
         LP0EIV/AKg2Gzpk55qrp37+iwRb+O++zTs8hRS9tSf5eYAmVhEMXW79Z1ACN0lUosUlu
         YhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nPqK7GrcYmtiH3v3w3JzWW1DxNdjq8IQMp3DUklVk6o=;
        fh=yYFNmNvL/D3H0o8D+rHRw8smM8fIHEKNAv1ttZa+Dkk=;
        b=UbJyKnZuLdgIuJHsDcmulf16qfOJxWC1CXC27H0ykwFF+zufGy/Nfg6hsN4BEXgU7T
         4uzhA9RcFkNZiwcuo6YH58eJXsvRpJHKc6SAYk8McpUWYvsEI/XMZEFVjLt/45QYlmzn
         Gl+fzWhiNa7SurXdfpFDr1UimWs3vUyW8AWa+B1FJclVvNK1VzlDhWzx42Qm7FTTmDjc
         G9WjybR87OsN4d3G+8zOFR5+aGClB+gLWPnqaUVHunqciuhaU9FkuY/tgs/FMLjD4vuj
         Q8b15hvkFDJj2se/Pff15nHUP0qZwjsum7YH1jQ8Y9t8hdkmaCXQH/Wm3nWtooClfJZQ
         yeXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWmK7+39;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ml23-20020a170906cc1700b00a1d9fbdfe68sor3474534ejb.21.2023.12.13.09.00.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Dec 2023 09:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWmK7+39;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702486859; x=1703091659; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPqK7GrcYmtiH3v3w3JzWW1DxNdjq8IQMp3DUklVk6o=;
        b=jWmK7+397+PvpUHuq3FxnhRLPjPTEU42EBmWA21+bIYDTCD4e0y+CZwTkT5aOes+Uh
         GY3WK5K99sMmoDoq33fjztF2FHbQYvaSlVZZ9XBxUXg7db9poQJjbbL0r9GttVeLH06K
         Qvil5D4WN9QgfSarvjTkmxXiBIIhcDrqZXlFhefY06m5uqV3K7tswIKCyTTuH+c6l6Nq
         xrpTgvq9htVk4k+fnGIft71Ykf83wWpuifPqAlJpcu4LW9RLCApeJKqWLTu/nj7VzONz
         w7hLFvZODno16djK6RAEAkjTh1F5z/iKHotg1x19Ezg/GKYLk9/XxPeq0wr8nEuuFLjU
         K3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486859; x=1703091659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPqK7GrcYmtiH3v3w3JzWW1DxNdjq8IQMp3DUklVk6o=;
        b=hNo3PRQdB8lZEY4B3QxsfLC62a/i+xgUSrLWxeqAZC6edNRyGPaXU5vzIhzLSUKF8V
         xWkq6s7l78Rdx5c2zCaTc68I9fqNPzOQDsOYG/PFi5uiQKpXuaow5Wqr5pNHHiONp0B8
         g8utsolKa2468tfBqq5EeEuycL96xJbFR4oNqFmFiXh6iQQAVB5sgSsrovpYUo0RPjtw
         N0upbtenPA1HCESqKDJtreJri7JyoH7PFvpcVbJriA8hszPEfTIEXOXSmPDffFSLvgwO
         bPNxTR4pOaKWjT4OThsKhDNqm+SnV2xobmrTV/pWAdG/KFlCADUWwv4je/GlXGSsCKhc
         0jlA==
X-Gm-Message-State: AOJu0Yy21EIwnd1CnWWg9uOg/ThJT+oF9x75jcE5mU+8+ZC1DViAiJIU
	o/8TfXC8EpozI9fCWx2PZ+KqCCUu
X-Google-Smtp-Source: AGHT+IGj0/KfsnmAFEqNG09uIgYWHMOTbaAWPiuoDfWlwAc+xnbcj8ZLgR9m5a7rGgg3UbFVjYS2Og==
X-Received: by 2002:a17:907:20b4:b0:a1d:f19c:ab1e with SMTP id pw20-20020a17090720b400b00a1df19cab1emr5069227ejb.100.1702486859552;
        Wed, 13 Dec 2023 09:00:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.79.175] ([93.23.251.22])
        by smtp.gmail.com with ESMTPSA id ty6-20020a170907c70600b00a1d71c57cb1sm8132013ejc.68.2023.12.13.09.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 09:00:59 -0800 (PST)
Message-ID: <0064f684-793e-4954-90cf-d39c21385a43@linaro.org>
Date: Wed, 13 Dec 2023 18:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 0/9] hw/xen: Have ARM targets use common
 xen_memory_listener
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231114163123.74888-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XByWpo5GYMbM

ping?

On 14/11/23 17:31, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> While looking at Xen target-specific code, I noticed some
> generic code used by x86 which is not implemented for ARM.
> 
> Maybe ARM machines don't need it, I don't know. But I
> wanted to see if I can get this common code target agnostic
> and build it once, possibly bringing smth useful to ARM.
> 
> The changes don't break CI testing and Avocado local tests.
> If this xen_memory_listener feature isn't required for ARM,
> I'll send follow up patch that keep this series with common
> xen_memory_listener but with a runtime flag to disable.
> 
> Patches do the usual "change target-specific API to a
> target-agnostic one", in particular using "exec/target_page.h"
> at runtime. Then non-x86 code is extracted, then merged to
> the generic xen/xen-hvm-common.c.
> 
> Thoughts?
> 
> Regards,
> 
> Phil.
> 
> Based-on: <20231114143816.71079-1-philmd@linaro.org>
