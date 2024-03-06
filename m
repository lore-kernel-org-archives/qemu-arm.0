Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp638581ejb;
        Wed, 6 Mar 2024 09:16:32 -0800 (PST)
X-Received: by 2002:a05:6512:214a:b0:513:5a9b:5a53 with SMTP id s10-20020a056512214a00b005135a9b5a53mr1889284lfr.4.1709745392662;
        Wed, 06 Mar 2024 09:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709745392; cv=none;
        d=google.com; s=arc-20160816;
        b=OpLM0FBcgmqXlZnAsBfWlSeWYPvwAGMGVs1iCbtQs17QRCrXovuz6fm7LKmVm1hBSU
         kM6iNEF3inX7P7MDCL3zZRDRuoZh7tehSlJi/B1vxelWxj22LAqNZorjvzv8JA9rFvyF
         zKItP5wA6ADm3LsX7FREsIFewFv5ilMpGXBq/WDggiUA90zO/7NXwvGwIw7hE3gPDx5T
         WGTITsgaqeo3ruFbiBFHo2Gj/3h6dz+an6qa00ZKwM1EHOQEjErobqc1yjKcYdrSWMw1
         BJLq/tMmUFzZwxjEH/uax799citiaZqCYQIfHYEKin//N3PsPnVmNsX2TTj8kwG+99BU
         GMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MTstlGT/a18Frjz+rGLei+v7kWgyirApdQCesjszieE=;
        fh=gYIU/PYHY20Ah+btvbsGjMnJjzd0jUeDTWxeIGhSft4=;
        b=cvFoM7I+JUZADvleqph/HfGZwSD5JdMECyIEnDhdPNEclthYvo/9pl74rae5uB+VN8
         8OTCMAvHwqeCHpU16eXju4g3t3WnNLX0x6syJKD0zwKIBfsgGEWi1VFerrf4iYLPJTxo
         bYJpTFo3mc3FLkC2Gsm77k3JM8JwS13HeW9jiJv5J4V5hQRp/UJjd6QlAZpR3+kYvYel
         5eBjzgUvFZu8XMKVUL3DG6IYlCcTkwoCRe5OI1NXH/11GBS/E2+IKLsPkDU/s9fcD0+L
         61/4/WqXBSRONMslbKCFUkMlsa8MQ+Fs7jZHGduGo3I7XMWsSHZEZDTaor2W4iQg25cd
         1xzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fCLNPchI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b37-20020a0565120ba500b005135b81e3d2sor1288232lfv.25.2024.03.06.09.16.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Mar 2024 09:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fCLNPchI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709745392; x=1710350192; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTstlGT/a18Frjz+rGLei+v7kWgyirApdQCesjszieE=;
        b=fCLNPchIUFwQAfnJ6l2DwgFrdt39EUGl+Wqz51vnNbVYo6J/0ftytmKBWAAFWO7dIg
         m+RaM8+pZ1Jw/d/YVd5iFtw432YqM+GgCoJAfAAZU+NE1lrpXFA/Q1OwVbea7crKtiPq
         hpKkfdQQkZ5WYxFfnluOjU5MgZJ5SKLDIJm4qCE9b5zNPnmZ5w5/D9qSaqOEsodRQqIB
         wKexaEW51p0ZDJ4gAUxl2p+hnMHDWSD1FEoLxSpWM9HHUM0hgT2oK0p8cRcTbARfgmty
         77GorTeNne8Li2S7znxD0xpGVkjD0FF3/xgR2cQg+SSnvKZaZpYQoaBglLqrExbtVzQD
         coTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745392; x=1710350192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTstlGT/a18Frjz+rGLei+v7kWgyirApdQCesjszieE=;
        b=hnfJNJI92Pem+dXWDymp8YmBOE+KVnSjP4U95yZKCIw5TslW+bEj1zQctS9swAma4S
         aG9UOJxtb8SiGm7XB5vIvbsfWdQ8JARld+xJ+pwl2w3AGGf91L7w3jEtZQJtPkfkJ+4D
         dfpwWd63IFZL62tBpZ3R73D7H9U9tennGuD7m9SSD4NymqAudOfM33ozjfJqX3SvCwpp
         W8+0WNVmkait0JCD3YfEVv+ypwWack2HAWQ4aCCCzAIFpJRNCucBaOx7VHozcy+83w5C
         Vx/jH6M6U6S9tWQMycFYRa9HpagnWjDkcM5EtIZWYy4Cluw7MBbAgbIG0x42SVOj8CbY
         7cTw==
X-Gm-Message-State: AOJu0YwYextuTPYnm4trl3TWBv4ocH4f9uQEDmwSE3YA4Hzo3DOf5ilV
	7UYlVg/vrvu20/Eq9fPWT1kSsfkoUjEeAfZTKrw8rFj5Rao1hUEn67Rr1ZpWkUQCTw==
X-Google-Smtp-Source: AGHT+IEEEm27HQQ1yt59I8k1pXk5Kp9RWbi0wEjybB+XpiWEN9134OAxfJLk1YHC0bnesbA0/Cv8CA==
X-Received: by 2002:a05:6512:1152:b0:513:5203:e255 with SMTP id m18-20020a056512115200b005135203e255mr4652979lfg.7.1709745392070;
        Wed, 06 Mar 2024 09:16:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr. [176.184.43.100])
        by smtp.gmail.com with ESMTPSA id m26-20020a17090607da00b00a441ff174a3sm7372337ejc.90.2024.03.06.09.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:16:31 -0800 (PST)
Message-ID: <6de50dbc-9525-4e25-ba70-55aea0d3f044@linaro.org>
Date: Wed, 6 Mar 2024 18:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 v2 13/19] hw/xen: Remove use of 'target_ulong'
 in handle_ioreq()
Content-Language: en-US
To: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-14-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114143816.71079-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hr03OMR3kTwi

Cc'ing Anton.

On 14/11/23 15:38, Philippe Mathieu-Daudé wrote:
> Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
> function to xen-hvm-common"), handle_ioreq() is expected to be
> target-agnostic. However it uses 'target_ulong', which is a target
> specific definition.
> 
> Per xen/include/public/hvm/ioreq.h header:
> 
>    struct ioreq {
>      uint64_t addr;          /* physical address */
>      uint64_t data;          /* data (or paddr of data) */
>      uint32_t count;         /* for rep prefixes */
>      uint32_t size;          /* size in bytes */
>      uint32_t vp_eport;      /* evtchn for notifications to/from device model */
>      uint16_t _pad0;
>      uint8_t state:4;
>      uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
>                               * of the real data to use. */
>      uint8_t dir:1;          /* 1=read, 0=write */
>      uint8_t df:1;
>      uint8_t _pad1:1;
>      uint8_t type;           /* I/O type */
>    };
>    typedef struct ioreq ioreq_t;
> 
> If 'data' is not a pointer, it is a u64.
> 
> - In PIO / VMWARE_PORT modes, only 32-bit are used.
> 
> - In MMIO COPY mode, memory is accessed by chunks of 64-bit
> 
> - In PCI_CONFIG mode, access is u8 or u16 or u32.
> 
> - None of TIMEOFFSET / INVALIDATE use 'req'.
> 
> - Fallback is only used in x86 for VMWARE_PORT.
> 
> Masking the upper bits of 'data' to keep 'req->size' low bits
> is irrelevant of the target word size. Remove the word size
> check and always extract the relevant bits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index bb3cfb200c..fb81bd8fbc 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -1,5 +1,6 @@
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
> +#include "qemu/bitops.h"
>   #include "qapi/error.h"
>   #include "trace.h"
>   
> @@ -426,9 +427,8 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
>       trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
>                          req->addr, req->data, req->count, req->size);
>   
> -    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
> -            (req->size < sizeof (target_ulong))) {
> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
> +    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)) {
> +        req->data = extract64(req->data, 0, BITS_PER_BYTE * req->size);
>       }
>   
>       if (req->dir == IOREQ_WRITE)
