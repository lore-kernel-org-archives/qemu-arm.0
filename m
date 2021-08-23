Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2138286lfg;
        Mon, 23 Aug 2021 12:11:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgSjh2TrZomiK/0fO7YUZgQrWtiEFWTttvU6kpcTO7pa/kWtN+SLUEfwyDzLb0+rIyzodR
X-Received: by 2002:a17:906:691:: with SMTP id u17mr36416217ejb.149.1629745878384;
        Mon, 23 Aug 2021 12:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745878; cv=none;
        d=google.com; s=arc-20160816;
        b=jK133dxw15fjxAJxXDSSMSmQBhxAEzM6ezG8IqgZ/90jVDwiwg1xEZz6lEd04U71I8
         ZkYX/2UCEcZ7f0oW6SKL1+8ET6i+p/f2UZ+iEWq6Tqjp8Sok/DpUtz49oVxwZnXjMDVQ
         WGAac54hOKb3hZuBhbGpWXjrWmyKUTrB8nBnBXTP7RFlvU5JXwjvfRIGGeUndvD1Evk5
         u1CfrSc5ReU7G9cKSk/JQvPs3uCD6KSrisAFd2KU9ucwltmkdVMusCS2cbeJTl8AhER3
         66p0ZMDIYFQVDn0ejFWpWnE6wMFnyNC+QBBaOplylyUki85bv9UvtRx0d3m6d5HifQ4+
         +mLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:organization:from:references:to:dkim-signature;
        bh=k2esEdtQnTaK+l/Fvb9no/v+45uWIgsWevH5o9WjEHk=;
        b=0JWhEYtu89N6+SjZa77DTFAd6tDR2Ez7X4rMJPdRPRFXr46/It8YcUSyjIpdOxYG54
         pulNgP4fC89HOR+7jyvvDr/3IkPqG5ghd1VbfGXMbSt1ixD8/FpgH4nviEBGB1pLBuka
         TlAPViWtKEUEpbmPrVUz5dcfguwNdtNgWD0xVd/yN9lrqBHp3qLo88XkoFfKD/DE0ghx
         xjFC68wocoPKfNUI+xr6Z2vkhy/kccPqyPQNTOc96PUGsKOIRR4Gv4UUTythwOrwLpp+
         bkO2AqcmgXju3mweCWqo4/AidgHDB2kGn3y+EZs6DNGJIjaRP07I1PzDlhjTU4WZhO4X
         V5mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TJnEqBge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do16si6235133ejc.267.2021.08.23.12.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TJnEqBge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFLo-0004bi-UZ
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 15:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFLf-0004b7-GC
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFLc-0006Xx-AM
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2esEdtQnTaK+l/Fvb9no/v+45uWIgsWevH5o9WjEHk=;
 b=TJnEqBgeezOPkAPlEP4oVY32fi2RtXRCHT8FcErR05kdiLV6fZn7cj6/rBzUOqH5RKhmVl
 2iBbaqJsdIG0Y30hFvismY+jSZ/uG3QdMgYyHpSk7pGL5XjGDevYWvtzmeqQ/6MaUbclRL
 0sS2ER3h1CErmfZgdc0SwfN8/CfqvXQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-MdfvZTrzMeGTxbP0F2GgbQ-1; Mon, 23 Aug 2021 15:11:01 -0400
X-MC-Unique: MdfvZTrzMeGTxbP0F2GgbQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so60789wme.6
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 12:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k2esEdtQnTaK+l/Fvb9no/v+45uWIgsWevH5o9WjEHk=;
 b=Sz0QbmuCmkwvfDVKZw9IRQykvPvCKufFwv45CidSlpf9QJYKIVa69+6wndS9eEybRI
 S6Sez9BunSKR3fFprAJ/EvvWzsFAtpLQYfnKkPyBraHhzpbT4S7+VJqk8Tm8zJzU0vEM
 yZAcF9rNEdvkJoKKcDkeH7r1+LUYVCUJZCwwuqJYg/IDX3tk/qxvNxT1HykHbqfim1aJ
 ym7PafBH3Kcw8hQ47W7nKw8leZDFjVzZRzkE4+yf+Xb0v7UdOPVkyWznWOgiLzFBXuvj
 RenQr7Tcc3AIunC1YZlZM/ZQF/IbH9P3t3aw/9jdp//TE9NWcSR/7GDN7p09WXVjnHtp
 hs4g==
X-Gm-Message-State: AOAM5316fnUKPZmALmgrjYMLFLBSVds/gZnVwKDYL3lia1aixptgLTSB
 CyCoHg7daeJyVNz3ebtdU2e6WdKCbHWamS/9BF3hM3d1+9YPpe3MjXgBMjoUfsUxrc+PGmJZ2R3
 LnizheIBbInPX
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr96587wml.140.1629745860267;
 Mon, 23 Aug 2021 12:11:00 -0700 (PDT)
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr96545wml.140.1629745859873;
 Mon, 23 Aug 2021 12:10:59 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 c25sm57100wmr.15.2021.08.23.12.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:10:59 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
Message-ID: <dc7e8e9b-6891-5c33-0ecf-e4065335e4f4@redhat.com>
Date: Mon, 23 Aug 2021 21:10:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FA3228e2w2HY

On 23.08.21 18:41, Philippe Mathieu-Daudé wrote:
> Check bus permission in flatview_access_allowed() before
> running any bus transaction.
> 
> There is not change for the default case (MEMTXPERM_UNSPECIFIED).

s/not/no/

> 
> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
> using it won't be checked by flatview_access_allowed().

Well, and MEMTXPERM_UNSPECIFIED. Another indication that the split 
should better be avoided.

> 
> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
> using this flag will reject transactions and set the optional
> MemTxResult to MEMTX_BUS_ERROR.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   softmmu/physmem.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 0d31a2f4199..329542dba75 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
>                                              hwaddr addr, hwaddr len,
>                                              MemTxResult *result)
>   {
> -    return true;
> +    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
> +            return true;
> +        }

I'm a bit confused why it's called MEMTXPERM_RAM_DEVICE, yet we also 
allow access to !memory_region_is_ram_device(mr).

Can we find a more expressive name?

Also, I wonder if we'd actually want to have "flags" instead of pure 
values. Like having

#define MEMTXPERM_RAM 	        1
#define MEMTXPERM_RAM_DEVICE    2

and map them cleanly to the two similar, but different types of memory 
backends.


> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Invalid access to non-RAM device at "
> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
> +                      "region '%s'\n", addr, len, memory_region_name(mr));
> +        if (result) {
> +            *result |= MEMTX_BUS_ERROR;
> +        }
> +        return false;
> +    } else {
> +        /* MEMTXPERM_UNRESTRICTED and MEMTXPERM_UNSPECIFIED cases */
> +        return true;
> +    }
>   }
>   
>   /* Called within RCU critical section.  */
> 

Do we have any target user examples / prototypes?

-- 
Thanks,

David / dhildenb

