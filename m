Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp293202njb;
        Fri, 7 Feb 2025 08:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV5Lk0n/KKyeZChlzKFp/XwNaDJSG2wPHtAwFonHkUE4YiEv8e0JHiUHSng1EMtEQQrn+l
X-Received: by 2002:a05:620a:f12:b0:7b1:11ac:627a with SMTP id af79cd13be357-7c047c5e491mr596789985a.25.1738944143424;
        Fri, 07 Feb 2025 08:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738944143; cv=none;
        d=google.com; s=arc-20240605;
        b=IeY0OO43MdZeEomjDJeedRME8F698na2GgLBsq41VMvcfhtYV/Pc5i39K+lhKdCiUm
         gKPngsQP3URMeWsoF0B/epAYjWhDmomYsGmP0JRGzMbH29XHrLTo6R3WgZ4ZyDxUGn+2
         anQZjZkx1O1SDf209KQ2WEIK9K4WoZ/kQg+nsLaHTdPxpk9CAT0ztHp5nqZRSP77znkb
         2OsGeAw1xRN9bFZpfQ+lctxsJ5a5KnoverkFISFVYqyuYBnd0ZShqm2uHml4hcSox2+O
         CpBm5cvOjJ6PSpQ8SceORbyh5Otwz6LB4H5f/FtWU9hM8+pBMdxLs0BNqGiNxJLYRQ/J
         Dc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nYmDv7aMaGjQaZMAV2X7qgjajETu0BznXuUVEYnnqMw=;
        fh=NSbtFz3wp1NkPqVhY0i446fgy/7r0dP459Tas04ioZU=;
        b=gpDEcUx49JvnrAgaqXBkYlUaRholiyixAR/rPo7t7POz9Dxil7cDkN+uS/GaDRdJk2
         ezl5EWGNRMsILDU5V+voFCnsFGF21bYdJXNzeS0PPrn5DaXyJRcb9oKVhdhapw0667Wn
         lYsdFnpxYlyk2jzSA59f+DarrT6NYXFxQYq7jSW+AYs3muBzpi1QrIcjUdKRDPCN+qMO
         7XW122aTmhpHyVyD+nqw4r+Bzf1nRDCBBQI2pXUWpv44iTalVuCNMBaJb/NYkR80QSZR
         cj1GYxajtfAkgVGpvZLzTRUH8sSnXdoQEFq44TJfWy1ZSQz4K+eWipwoJTq6RqFLVGyg
         4VhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dnl0OqrE;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e94a15si353520185a.250.2025.02.07.08.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:02:23 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dnl0OqrE;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738944143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nYmDv7aMaGjQaZMAV2X7qgjajETu0BznXuUVEYnnqMw=;
	b=dnl0OqrEtFxOVkC0gZ6BrKHym1oiSBjbIP1rMGER1Z5KAXfQbQRP+JKVmI35MCB6cr+UlZ
	gLLlQipSuQfmOc+jBRaONNur5/wjJLtXMFX1LPVfTaZtCqDhpbLYRhllQREZN0zq1wviIZ
	1CDDO2iPh68CCYQVTPjQvmTgyxoHeQs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-sSEqYJ-LPzumXg1TFD3oOg-1; Fri, 07 Feb 2025 11:02:21 -0500
X-MC-Unique: sSEqYJ-LPzumXg1TFD3oOg-1
X-Mimecast-MFC-AGG-ID: sSEqYJ-LPzumXg1TFD3oOg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dc709f938so536061f8f.0
        for <alex.bennee@linaro.org>; Fri, 07 Feb 2025 08:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944140; x=1739548940;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYmDv7aMaGjQaZMAV2X7qgjajETu0BznXuUVEYnnqMw=;
        b=BrUlUen7HTIBN9WjDgnCpUJhig6GfDQuuWwHBjAgQHiDm9LrQUoEWQzkWiHszTq/tE
         mYL239TuFvgTU7NsVYSRYFWHAT2T0SJNDoTom4qcp8BhZI+u6bRaoPapjpGgZZMpAORa
         uBNBNvsi7cIUnNippuwo5CQnYewzgC0ETfvDtIVKgDDG7wu74t0FaXp2A8/vcoRqRBlV
         eTrkCEjQdqe5/Z4zsK7CH5o1/XV+lJR9IfL3QNsC6X1NQTwX5N19Fpf+VNNOYmPwCGui
         RoHZtxFLMC8Atv+B2Hacb977Qe8DvApXNzrUoR/zx7zgXe/grT4gMUZlve1C4niVWGoC
         ZSUA==
X-Gm-Message-State: AOJu0Yz03eXrMaecbMAgpQPSNv37HeoBCwykjtMf7T+lzOezR2t1dm4s
	Eg3w1jjqpppOaWKxa8iWVTdFlYTR3oY32hdMoyeBFGkGNr3g5gy/E3RoXdunDrmr2a2o4ErRWZW
	db/IwpFm2c1WorQ/LZGXIYPC6MMu9r+pCbkrxD2UYb3wBj/wpHNkUTjQDg9RpgqQ1pvBy7QBOvk
	KD9DQuVv74mWO2dFFN6xNdDcksWztt0EzYCg==
X-Gm-Gg: ASbGncsqOt7vTfoxQiDGrXNYwpw/XK2PaBIjqQrpXmLtIUkOMS/wAexD2+ZijGI+JfV
	RotQ6Gsq68z3p1yOjGa2RTtLwaDIkGY/etlB46O/g6a+k//F7R7RdXRz2BjB1BdS9O9QXDzqAZh
	K4g37vq+0kOtcqTO+d05u/bI05yfpXS40digxPg9tNObt1JUGOx2d7tRB6+Jr6dOq+AdEQ35379
	YLTsJdRLwqj/yYkSnC3Rj4gKaCxBsGamNpKL6QieKVofbfVA+eJa1VRH5bf1Zg9edd2qblX4OKb
	Vne7lOa2xkrEZy7UJNoMsU51was0DS+q/Mrr
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id 5b1f17b1804b1-43912d49c3amr65700475e9.15.1738944140108;
        Fri, 07 Feb 2025 08:02:20 -0800 (PST)
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id 5b1f17b1804b1-43912d49c3amr65699565e9.15.1738944139545;
        Fri, 07 Feb 2025 08:02:19 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de. [109.42.48.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9648dsm61317795e9.7.2025.02.07.08.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:02:18 -0800 (PST)
Message-ID: <75f73a61-b89b-4c17-b72f-35a027049d5e@redhat.com>
Date: Fri, 7 Feb 2025 17:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] tests/qtest: don't attempt to clock_step while
 waiting for virtio ISR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>, Alistair Francis
 <alistair.francis@wdc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Riku Voipio <riku.voipio@iki.fi>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh
 <imp@bsdimp.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250207153112.3939799-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3UwEI-Qfn51TW9zSooy-cQjiTF3-ROXZ6JgJ2vZrga0_1738944140
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xXjKgEhqWucU

On 07/02/2025 16.30, Alex Bennée wrote:
> This replicates the changes from 92cb8f8bf6 (tests/qtest: remove
> clock_steps from virtio tests) as there are no timers in the virtio
> code. We still busy wait and timeout though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - fix trailing space
> ---
>   tests/qtest/libqos/virtio-pci-modern.c | 6 ++----
>   tests/qtest/libqos/virtio-pci.c        | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)

I wonder whether a usleep(10000) in the loop might help to avoid burning too 
much CPU time in there?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>
