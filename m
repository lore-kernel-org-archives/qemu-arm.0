Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3211390njc;
        Wed, 16 Apr 2025 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:600c:3b92:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4405d6276b2mr12193705e9.15.1744796072035;
        Wed, 16 Apr 2025 02:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744796072; cv=none;
        d=google.com; s=arc-20240605;
        b=KiaYoiwTpSHsJi1APQ0ORHt/6t6f4kbX/TlRd5T3ehFVdTX7S7o2ljA4Jcxym9wRWs
         q5R3kSkLudvOrNYxX/KafME+vVvDUAeZJzEiItwfiMuH8uMVqlb5m2RWpDZoeW11tkyx
         seV+4I0fXOoU6/MmWR/89hLqpMg34ZiCrt5A6aVE1NCfm5Ibst1CFPqK1Je1O7ZBJHX9
         j3KKfQur+JB6nLexWcAb7dlY722T+w5bCrZIIMvfr4jxJRRY0sa5KFUp8sLCEkXiW/7t
         WCj5xOrPwd3BnYR4tXDXIK5RrxisyANJjKjRGgTnXGHZnivlzYbitIiJlShdse78iD+C
         vLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C8RE67alAjoASMhiOcaVhVadwtMNesEy3c/I5HlCpwY=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=KG52HOaU7gslOCUEKlkbGZ1ZRSP94xGsjgbQyDZCJQnevVt8rXtkgIp/b5QXsz9Xh4
         UF2hg86XCecRWbkphjZEtbbMnFhU4RI/Ot8Ait2SYORQFwUNw6k0ukkOXzuKtVLn0CZg
         eLXM2AlNA9dVSSHvH4b1e/rqlFXNEzdePMbbabsCdkPOrVhMU+YzsZLEr/oWEP4LYeKy
         Np+W4LDmDmq58al+2qYCJSI3FQZRcgVKlW4KJ+VnBPEWFZiUBQUQjMzRnAK0fIAr3VkP
         axL2bEREgT3V/Ah5XnNSj4iR5kHFUNt5m4NEjGqWAkqTO1CFliRSTdpP2LE5/m7aD9yZ
         vGkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ja4VclKY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f2902721bsor31432805e9.4.2025.04.16.02.34.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ja4VclKY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744796071; x=1745400871; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8RE67alAjoASMhiOcaVhVadwtMNesEy3c/I5HlCpwY=;
        b=ja4VclKYY2n0ejklGz4wSYRZxFsZXwZx9fKUaGXjvuiIhEMS5wrcpkD5n9bxJToQi9
         4cyoItmLcCGJ90f8ervUBsI4mcN7eM4FcTr2jUd9Q3VFfxzuDgBdct8kfS+3Dl9/61+j
         h3u+MlMv7pSWDbjtwJ6KUTmSNj5HpB8OO6DYQlSeDI8ox1xqHOJZgsvRaUMKaTTGmgMN
         lUQRREljkyuER8PUHo0i6arCRBU3ufIjserJBqQRvFAy9MVMfJu9fyZTtFRSe7jyngYO
         owAUWsu0RI1TwWSLOsDBTR4nsWO/0w+SYvlxJxiYPJwhz7VlNnxjwbm08IJmg3qNmErm
         ZUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796071; x=1745400871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8RE67alAjoASMhiOcaVhVadwtMNesEy3c/I5HlCpwY=;
        b=rzSHWMUN51fATalbGXASVKZtcxJg3mruZqO/J1U0AQFxO4vTpoz0vfLaAdZ8VV4dhn
         LWOz3RhU2f3WMRdsiO98HGDKuMyC1RnE4iNaJhjJVdKQeTwtxHrvZ/RNFg3WiPXifsht
         vKwX6cOcxzjdcBm9LEp/1tolKMLa5Gb0D5A3ppwhSW74AquQkZ5f9sLWn2NhFqENlj9m
         /lv3jD2xdGvsKlkj88Eob8MxBXCzvPBqrJO5ZwtcRCi7he92W428et+dl7LdZjDbv0bC
         kcEeLR3ERVKTROC6GuRer74G+EHO1YnER/qV7fRI3Ytz/rFvsXv59haQrVDQLHLG0yaJ
         +gUA==
X-Gm-Message-State: AOJu0YwxZZiHgWH9UQtI27/fldlReu5iLY7e2P2UggRN+tnXLOYAplES
	h3p6e82Mi7SlSyvKakaIfdll6cFf8em0lvC4/4xH/fYxZd/b6TkKRRcYwfYfctUzwg==
X-Gm-Gg: ASbGncsmaVYMd/78wsY21TphfvXlrKokyY21GYiVqN1BM+xD1aH/xXwUjaZ66euAOh7
	6gbo/yegAgcf2Er/EEtq6WZJJDXPFlNSavSGpBcTIiOgSiuZd74gQSygo1hRs9qkkHNJfijkHta
	V7cjvumaZGd5POB9bMZQyUNJwDfowp9TINZSkTVk8zyE3DL4hX563rcv0Hwr/hE+8Sx1M6AKS7y
	c7wZ+xyrnNeM+sq/AJgpIcbue0jfuz9YptAUpiHUSuqnrg/aif4rge7m05O70HLCArq8W0+ndTS
	DMmgMZqA3K2LuqhvpcsIecIFqlUwQcXtDP8t1NVoyNY78LJROKLPCA7bvWUEvUovUxeuNybowEn
	7spxUcXejY/IVQA==
X-Google-Smtp-Source: AGHT+IFZ9m6cCDolsj2GC6HuIetgLaP77+2IWEgalQBgBKiqcyrAmQoQnlwdOI3bHxToFTefBT8Pxg==
X-Received: by 2002:a05:600c:c0e:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4405d616849mr11611425e9.8.1744796071495;
        Wed, 16 Apr 2025 02:34:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c7ef9sm15769595e9.6.2025.04.16.02.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:34:30 -0700 (PDT)
Message-ID: <4962b53d-c507-49df-91b4-cf51d724e8ea@linaro.org>
Date: Wed, 16 Apr 2025 11:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] MAINTAINERS: Update MAINTAINERS file for
 wasm-related files
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
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <185cfff812b952abb24e25dfcc8bab7c65da6214.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <185cfff812b952abb24e25dfcc8bab7c65da6214.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xdBjV2bGUojH

On 16/4/25 10:14, Kohei Tokunaga wrote:
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d54b5578f8..74a102c594 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3903,6 +3903,16 @@ F: tcg/tci/
>   F: tcg/tci.c
>   F: disas/tci.c
>   
> +WebAssembly TCG target

Just "WebAssembly target"? (I'd add the future
tcg/wasm/ files in another MAINTAINERS section).

Maybe better to squash with patch 17? Or start adding
the section when you add a new file, then update for
each new file added?

> +M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> +S: Maintained
> +F: configs/meson/emscripten.txt
> +F: tests/docker/dockerfiles/emsdk-wasm32-cross.docker
> +F: util/coroutine-wasm.c
> +F: os-wasm.c
> +F: include/system/os-wasm.h
> +F: stubs/emscripten.c
> +
>   Block drivers
>   -------------
>   VMDK
