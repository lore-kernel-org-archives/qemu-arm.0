Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp35920njg;
        Tue, 17 Sep 2024 01:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8nFJbMNxj5mLbod1XWJzdPC5cAdbbbsDAIj+PEI6e6p5Pyl+w9QvlmCEuTXBePqeeZ7DoFnJQyuCyeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGApTbOAczcn7TTTTtV3aZd98EEjKNfHFoUPURdszQ/FugMoVANKTf0PDw+psYRvkQU3+v2
X-Received: by 2002:a05:6214:3285:b0:6c3:6215:9520 with SMTP id 6a1803df08f44-6c57df96651mr262016996d6.14.1726561854649;
        Tue, 17 Sep 2024 01:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726561854; cv=none;
        d=google.com; s=arc-20240605;
        b=OU88rJUfMqsPwI0gymp2cBt9Tuh6s0YQZ9xHBHmp/GZFRTgbDn3fWptN/x+ZFMTHV8
         y8ckW7INuF0Ac3ET/FyyzCLCUL7lqhWo71N0Fe0xBoup0cvbxXQuIGBDttjUJdJzQWCw
         cAbWlowYTGdrrc6y80iNz0qAzrn8Flk1SermilLBm0s74Se/vDDaXCoqhC+8TR15ytq6
         /3B0lrFL7U1+p7Q9wRZuPlYai5eM8D4D8D1zeEOb96Irp/8002uRRMcFPhF7Ixf9U86E
         /PwugbYZwYUhhS3zuvc+AOoEUQU5q2upJ7Yi5Xm5AP8HFwb/krT7LyqaN+PKpgqBaHI4
         F+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SX1SvKc3qhJA9BweqWQ5wzEbAblN1yICrre03rlBHb0=;
        fh=MSwfWtdCGhhA0N1ROrsKk3LzWlsqQy8A7I0gGeLG9gM=;
        b=cZXhFTatn8ha5sOm5fbt+Qs6t5z3PC3ACORWceeL3kDGQnrBdMvJvjPuh2WFe6tBBy
         g+ws6Ukl2Kg5qGyPhN+SVrwejJiCxFDDJ6TRxqheV1+aW8OmvuqnJxIgbmD3RX7libjK
         SKzSUTWzKq2FIDngyXVC2Yo5BRrRTOMfPwzrYquoHkez1XuAhEFbG5zy/hw+e4J1K6te
         1BcYpPclOgTGFDZhM7kNAKhF2lPH579tTDBc6zGUYOaSolJ5soXZFzdi72Sne9dNCfp+
         TfAs8iLGBhkz71xeUmrFj59wUNCKrBEGZ3Bx1XulKSuhJoLdb/v+Oc+AkM/xadLvLh4c
         yxRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BmJXjRgN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c68b27csi77897336d6.225.2024.09.17.01.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 01:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BmJXjRgN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqTbZ-0007oz-MM; Tue, 17 Sep 2024 04:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1sqTbH-0007nM-JK
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 04:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1sqTbF-0005GW-UU
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 04:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726561815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SX1SvKc3qhJA9BweqWQ5wzEbAblN1yICrre03rlBHb0=;
 b=BmJXjRgNCs1BUNFg4iGlYa4aBwWvQrKfpl59J0GEeYgN5EucAyBvZixjZR5Yzx6eTRvEOY
 NGLQaboBNuR9x0v5Ow2CtQodVT6Wk41IjKWxfdA4Vb4/TTPgJ/aMpDPzkbF8gOsf+FknIy
 pgOKNCo5GbWOc278ns7I1P+d5JY1ZKg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-fTDXEoW2Px2mtojkv4o6Qg-1; Tue, 17 Sep 2024 04:29:09 -0400
X-MC-Unique: fTDXEoW2Px2mtojkv4o6Qg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb0b0514bso42101025e9.1
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 01:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726561748; x=1727166548;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SX1SvKc3qhJA9BweqWQ5wzEbAblN1yICrre03rlBHb0=;
 b=JNa6UtdAN+30mvXoglntxBC/CevhSs16snmaNvDiL6aRsyW4KCH+QI1y1LHZNtlOfB
 Cut3FN4vzIAVZS44lfLLN2zFk292cyQ4whrJ17ElOFkiY5bnrS7YGUsTSTwXMM7VC+0w
 6fxXTdjh9noRpz/EikkBK+cocLGGiVcge5K2phgwsOtonGVpJbZgm2URMM2609QkAAPw
 JzHTX58jgdYVg4fzGY9+9oHZ8k7sV/bzVxiJmbSmFO7/i0yX79pd19MKd0AxfV3N+nKV
 up5fj6yApRH+vrekHtToYJoVfRcLR+jPRTcLIcc3vKQKng+EEMpvcyqsTWKaPKFlgddZ
 QppA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpkLqEtrhurbFEaEl1Ef36srdGt7dpk06+njm2wJXY+fMoCAcf0HcnORImdBNno2Ugwe4+JXX8OA==@nongnu.org
X-Gm-Message-State: AOJu0YwljzNGcTwX6SKG1XdG1WhDRGlys387UsZLtQ/pGjmETVG6EKYE
 ufiTehWTOFKJ1ESSTTa4e/Q0aeeXZRCJfggDFuE6sIVMtfW0/BhBqfmael6BQMqDm5A3KcP83Sc
 Of6wpIfOH842dQ1BrGixolKSX849zv+3uyMHQBxoMMiPKKGdSBQ==
X-Received: by 2002:a05:600c:4ed2:b0:42c:af06:703 with SMTP id
 5b1f17b1804b1-42cdb5753a0mr124543395e9.31.1726561748498; 
 Tue, 17 Sep 2024 01:29:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed2:b0:42c:af06:703 with SMTP id
 5b1f17b1804b1-42cdb5753a0mr124543085e9.31.1726561747964; 
 Tue, 17 Sep 2024 01:29:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:8f00:64ad:8ae8:6ebc:e3e2?
 (p200300cbc7068f0064ad8ae86ebce3e2.dip0.t-ipconnect.de.
 [2003:cb:c706:8f00:64ad:8ae8:6ebc:e3e2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b054dd3sm130251435e9.5.2024.09.17.01.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2024 01:29:07 -0700 (PDT)
Message-ID: <8643546e-efb7-460d-a1f8-89251022a3d1@redhat.com>
Date: Tue, 17 Sep 2024 10:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hostmem: Apply merge property after the memory region is
 initialized
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, philmd@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20240915233117.478169-1-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240915233117.478169-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nJVP1mdQ+Qcd

On 16.09.24 01:31, Gavin Shan wrote:
> The semantic change has been introduced by commit 5becdc0ab0 ("hostmem:
> simplify the code for merge and dump properties") even it clarifies that
> no senmatic change has been introduced. After the commit, the merge
> property can be applied even the corresponding memory region isn't
> initialized yet. This leads to crash dump by the following command
> lines.
> 
>    # /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64  \
>      -accel kvm  -machine virt -cpu host                      \
>      -object memory-backend-ram,id=mem-memN0,size=4096M,merge=off
>      :
>      qemu-system-aarch64: ../system/memory.c:2419: memory_region_get_ram_ptr: \
>      Assertion `mr->ram_block' failed.
> 
> Fix it by applying the merge property only when the memory region is
> initialized.
> 
> Fixes: 5becdc0ab083 ("hostmem: simplify the code for merge and dump properties")
> Reported-by: Zhenyu Zhang <zhenyzha@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   backends/hostmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4e5576a4ad..181446626a 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -178,7 +178,7 @@ static void host_memory_backend_set_merge(Object *obj, bool value, Error **errp)
>           return;
>       }
>   
> -    if (!host_memory_backend_mr_inited(backend) &&
> +    if (host_memory_backend_mr_inited(backend) &&
>           value != backend->merge) {
>           void *ptr = memory_region_get_ram_ptr(&backend->mr);
>           uint64_t sz = memory_region_size(&backend->mr);

Thanks, queued to

https://github.com/davidhildenbrand/qemu.git mem-next

-- 
Cheers,

David / dhildenb

