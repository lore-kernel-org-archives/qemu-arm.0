Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2160535njd;
        Mon, 21 Apr 2025 23:41:33 -0700 (PDT)
X-Received: by 2002:adf:ee0b:0:b0:39f:b62:8cb2 with SMTP id ffacd0b85a97d-39f0b628d40mr3494369f8f.38.1745304093332;
        Mon, 21 Apr 2025 23:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304093; cv=none;
        d=google.com; s=arc-20240605;
        b=ll3RxoG1AbGGiglw0R2S+rdSduabVnEe2RIv8auDXYQZ0jn3Cw396QFtBxyA6cQZQ0
         VSXpzJzQ8naX0K8ri8eDlpnqqtOOkOTxt+3fSS+Tl/tNne7uGdqEPK1J9bb5dNa1rjeW
         jcprp/oEIDIi7xCpjtuGnMF+YwOtE2/n71bjtmJkJ02wbf23/5+7qkJRQCGozNVn0DUm
         ve4TJ995yN3E5vXjCQ+e2nVE65sKLyHRMgrVFg4iQMJv9Eil0dOS6DGnLbLdwVYGHVJF
         f1dSyKD7sss7JUozYkV3NqAERLTYXniq5gOBzl/bmfhZAA0xM1oOCj6yDrRi917ZB0A6
         LIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YweAujch6X+IzetnIcpOjGXiSDNATL6ECW1Z8embAd8=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=di14o6XWw+p5Wbi8mKcNYH5hm0HOLdDD329HiiYbkCiBe6H1g4XAIvpJSJs1v10gPL
         VS9Lq4gOfVpIceSkAZU3SNjCVcCmwA5WOvFaz7buF3r88BiKnUEDWlkE6IQtYe6ktQqe
         ATt25Zgbc+ht0PFRFixwjqu4v1h9C7K0Bv3ct7k4Asrl4CXq8uaj1m3cI9pGUlB5gPKN
         N2IHZxIbY6yaZUm/vzKGenTTV8xpN7DixEknu+udWLScP97bfvrE47WDCl/3/o/biAZn
         PStR0DjgxKaHw8/7cm2a9W/hFf7cAVJ9WoFtD3wG8/R4xaUEzTKvkzZwz/qcjAzOCHas
         OX/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uIgv+QEX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39efa434310sor1869632f8f.3.2025.04.21.23.41.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uIgv+QEX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304093; x=1745908893; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YweAujch6X+IzetnIcpOjGXiSDNATL6ECW1Z8embAd8=;
        b=uIgv+QEXRo6z14YIRmkpuVczOiisDtuVG8ITzIouhlD2P8BZkpW7uM8uJZ3mRlpn+f
         8kwnPZY67HgdEoqqxgXCfz694pAMgXvFyBDD9CEBaLrx5SRa16VTXRToBchmnsz05bGT
         noLbuNuIufXJPcZ5luyFjMymqJEMPpcx1rPUsdB18LjqqmxMMZQh6Wg8mZOKOGfsprSY
         de+6u7Pl2mMc4qfP7bS0wKzdWbLCWMbKl3zQD16xwAPXh/kZwIqeMC6YqFfBLSOXSo80
         WYnRGVB8pUSABSzAomAvJJ1E42ruCjDiq/3avAcoaQiDvgh/LveDFkLQl/TeoSsqxoi9
         bSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304093; x=1745908893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YweAujch6X+IzetnIcpOjGXiSDNATL6ECW1Z8embAd8=;
        b=mNualWcozFTPlEz0dM52tCzal8nSzm4IaRpF0nJl2UYEyoU3cx/E0Ca6CdnOLBbhvw
         GSI8iIXc9s/MSMukp3NRAsoPjLzFdkZLikoQrWlDNf9ot0os7Y+wwkebLVS7uZV+3lQw
         DoUSKi/NFEdR/6IBrFa88cq0fn4YRbbRvk6csRw9xbfzfhbhhBB9S3YnK48moZ8tbJoc
         fUEKYqcjLax3rQk7yNgwrGCmGxx0LCezE6vhLRVhFAAEBEJTItjpEqe0lMs9tGVJP36s
         zjkSzW/UtrcyWiYzx98CUME7gYZ1ZjtMS1P3ns4VGyZV1HWcll4jFtSqlnxytJv8ETdC
         bS7Q==
X-Gm-Message-State: AOJu0YzBt2xA4Purnc6iSQ5VMMS7YoittkvJXTx6Pv/szj2nzqVxhV4I
	yLxkemYyEGnY5+/7YiP3dg+3sPZN0jzRIhwh4A17ni24DSHiZEJRZBPnPqS+mKhlCg==
X-Gm-Gg: ASbGncsmgM/CYgmsjnCTeabLc0cYxb9wmg9swEyoOdPslXBA4eNyZ+SnJVgTI11ZKRb
	KWsyjc0XinrkJAQA2ct8xF43PWZ+VAabxtv/nTTmPbMRDxSHP4pcKC5utyMz2i3GctFTq9IQDE4
	Nz++gxRIx68nXJmROIC4c8onMFmmRH1sYCTD51aAo9FpRXKTyEFtf3KFhWbYtcRcmv1jQByD1WW
	dZ3hPDttF+nFce65nZIBZiD3UbeSbq+T5W1gE8ni3CnxLHwcG6wdvnKcG1Ljz4/6b9GHVF+FSmC
	lJ6v9YpJNqSUUbnc4b+t6tcHRNcOnoYJvATVfK3RSP2lG/vAMNt6XTrhElNGe5orHEj9Th9S9ZK
	9iBoQZ3kx
X-Google-Smtp-Source: AGHT+IHzjEl+8lPmhKSabXC0zUI9tf5BnCeJoTQo1HR1FIk+Do0DmX0vATxLBq/9dEodEtSs6ecG7w==
X-Received: by 2002:a5d:6da5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39efbb09d5bmr11235926f8f.52.1745304092791;
        Mon, 21 Apr 2025 23:41:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acca9sm161223325e9.12.2025.04.21.23.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:41:32 -0700 (PDT)
Message-ID: <7907635a-7486-4bd1-b040-5c5208495452@linaro.org>
Date: Tue, 22 Apr 2025 08:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] hw/core/loader.c: Fix type conflict of GLib
 function pointers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <26dfe9191154ca65dca6ef51ce768ad2a0c30d5f.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <26dfe9191154ca65dca6ef51ce768ad2a0c30d5f.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zbNxQbfI3YVs

On 22/4/25 07:27, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   hw/core/loader.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
