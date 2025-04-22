Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2161236njd;
        Mon, 21 Apr 2025 23:43:58 -0700 (PDT)
X-Received: by 2002:a05:600c:1e88:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-4406ac0a847mr103885245e9.24.1745304237818;
        Mon, 21 Apr 2025 23:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304237; cv=none;
        d=google.com; s=arc-20240605;
        b=TXtFK5xyYyB8OyWZ6TB9zJX++z+4oLdmG1aBTPeAGBXekaNPaHGNCEOJupAihqEPHE
         duoRqK2/zT/7DP7IOkJY4lBXEf8OvcRtDQZ/+Og0GDfiYWZYcYJSKbPROWkaGv8ERjXy
         sDRGnnLjLniLJiNzDNci/52vlY4MeOeebdOz0bVyyu7IaF6YrchWBl5ajhme3ohbDlrT
         rwyVX1GAvG6CQo/WfnOA+Py+Vc5kVeuI3XfNshb09yQQ7rLbatZ6YjGr6NUlP7k/13OK
         V777W/r3ZVIiCL5UC3fh4wWxDXqBFUrTmkMweA3PDxfTrrVQADIbKR+eNlX8dzBhePLH
         hoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+9UB07EjzDEhXxVE2VMd7KxrceRog099DGJ5fspr6Kg=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=caM9NMmSaQIxxhXw7655MsnROCmjcehbc11KoTGRl5g274Q2AjMK9Z/Uimr/KybCcc
         ghop1ZDoFpfjxLRCAGMK+qbFn81Ku8o5u3KL1hU+GKA5HnG3oY2AxERx7iXgLDqKrDy4
         dxUI5IUalkCjLYOsNaW3L/cwDgJ0RuuQjkADyv8Yafr1iR4t+hHBHpwNLUDhfLcHNNRR
         a7yfR5Znm00BfGIhfjRPXZj7KkBokwtauq4pKYYwGvSAZv+8NxLUBiVUhPjVDpmAPH1t
         4ptmuf7zcDWZ1vEqNdfJYyG2alW+nwbVxqSmZNphj/KYAcop6l1RmxAUfu6yU+WKha4g
         nwng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBuwILU6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-440699feca5sor26997375e9.10.2025.04.21.23.43.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBuwILU6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304237; x=1745909037; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9UB07EjzDEhXxVE2VMd7KxrceRog099DGJ5fspr6Kg=;
        b=FBuwILU6CiaBQKQ8AxhJoSwAhybBzFVr6OS+fgZmo28lhAHikghv18AeU2zTiJSqwn
         wuK88yIr1M3VF5OTYgFWzbsufh1GykfbyFYkBgbt45OFh6wT6tmmnzrLDNjj4FNOnv0Z
         N6Jel7GDxDIQRTi50H7L3CZOHrq/rPUgcUgtaCbVeQ14/owwEUdJ8sVHSx5GuHXAAI5g
         bIL4UpoSNO+VeRziQrOC3qwEjdDUwKjtC0+p6csZlUrQskmCQCB/TpPy9EwBDPmaRvot
         Pt8bUk6SU2HEiCbDGG2/H9fqKrV0T7J2YdW4+sXxniPpZvbq/TAd7Acvdmma+69Y/bCC
         kIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304237; x=1745909037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9UB07EjzDEhXxVE2VMd7KxrceRog099DGJ5fspr6Kg=;
        b=OwcNXzYnM2qiRdOEKbn6dDfKQky+NvEnCY74AGOhPB5l2un2yGR8mIR2WwHc3fbgna
         Y2WVZfjnvykdIN/fmbM2OJHIhPbKFdlgwxJSL/2CaNcE5V8FVEfVzLq4DjjmqpHjFK7E
         454KhmCIRnSHEN1KxFHq5Nf+UftUG2wG9vnYV7hUnNaKjooD/Hm+82JSXWs3h5j6LRVi
         XVENHfFxrxQjOPGqPHLDBMk0iI3mZMmALe+Cv2x7gSuVHD/Sqesw5M8M3lD9jVFj7NtQ
         KpDcjEXY6no1+5HOYOD3EDVfBK2DaDARj+O12yVSh8XjI31YwsLlDX6K4dDKhWtzl+KT
         05Tg==
X-Gm-Message-State: AOJu0Yy6uSh8ZchP2EaXQqM/D/qheuZGXyuGNUrBFeZF37DZ++vcM8o1
	ghmDrIGRmKlTvIUKF3/RSjZZ0G8SaxpT6RUPgL1dlkXo5cExO7dKQAsz4ieeD7PaRw==
X-Gm-Gg: ASbGncsitnsvuQlG4Te7TYSZZLlJAmWyq7RqVMNBpNcGsljaeSYNFQEH7bKB6dcj24W
	rxW53x4h3TtCLIRDppF0tAuJMr6PYcz+a+i9AllJW1fhZWPrfUK2qTuxiR2Adwv9HB0I2VGmJ8Q
	eAPfr1kjWFq/JgB70IT70FPJcv9lkgf1T6Q4QYDjMJttg559Eu2ldoWQBnyoKRPb3Oytr33xyWS
	PD+JplMutGUBcbJFzvuTuscdqKJkcHYNeFeba7lNACYQ1KBrTw3hNHkDm/ZkZv0XmDhMcscnBXv
	WtOrcycxHJXbmN13/Iiu/hPRl35KVCBS3yBwRs2Xagmg0DRcrHxeDdxXFlm9juKut3RjagZ4xzW
	zbQnymFYrRQN75zOWpOA=
X-Google-Smtp-Source: AGHT+IGicNEOGGWG9Ql2/GtKu2hXalYv3ESAo9JoC/qmXK6F5zqhCTj6Dxi2AfDm2j2sZt9xm6esSQ==
X-Received: by 2002:a5d:47cb:0:b0:39e:f89b:85dc with SMTP id ffacd0b85a97d-39efba52f5cmr10905880f8f.17.1745304237341;
        Mon, 21 Apr 2025 23:43:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43be53sm13882739f8f.41.2025.04.21.23.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:43:56 -0700 (PDT)
Message-ID: <214e3bef-09cd-426b-aa7a-65ee540f7cab@linaro.org>
Date: Tue, 22 Apr 2025 08:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/20] block: Fix type confict of the copy_file_range
 stub
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
 <ce34a721a5283fce854f417baf7b1c8f5c48c028.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ce34a721a5283fce854f417baf7b1c8f5c48c028.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: V7nhCX6yrIxR

On 22/4/25 07:27, Kohei Tokunaga wrote:
> Emscripten doesn't provide copy_file_range implementation but it declares
> this function in its headers. Meson correctly detects the missing
> implementation and unsets HAVE_COPY_FILE_RANGE. However, the stub defined in
> file-posix.c causes a type conflict with the declaration from Emscripten
> during compilation.
> 
> To fix this error, this commit updates the stub implementation in
> file-posix.c to exactly match the declaration in Emscripten's headers. The
> manpage also aligns with this signature.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   block/file-posix.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
