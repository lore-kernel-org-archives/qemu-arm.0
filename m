Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp490073lfk;
        Fri, 3 Dec 2021 10:18:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLz1bqM5/gJNJi/yTAdiOAkPGp4j9y8l9qa1IkW8vq9mjnvUBRVWySx14WCEOO25RCcfq9
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr23915520vke.33.1638555535763;
        Fri, 03 Dec 2021 10:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638555535; cv=none;
        d=google.com; s=arc-20160816;
        b=SVSzsDf7hyeKrPdzGr1K4sAYEPbuGRlP7UTOVGSg6WPsY669LaIKnBlERFr3NyO8eP
         j1NswIN8/6elC4j6Zi4l2p341joMMSjWAVZFdyq9JZv3VOUaTJZbEArGGYrdkCOXR4uM
         XHHLWQhsCjNE4mt7Djy9SnhbBSoKDdGMuN7i4SlBVqwpm+gUkCMD6dYtvYUXmuyAk0lh
         xss/4V/PKsNGIrK931uUWE9rteJ2kzCcBFgHpDDrVyc/ZEweTuzDyjPNOa7b9fumoBMx
         Mo0HLLVpL8Rtes4u5VhAwXqw9l6NyDeJW5r1b33AmQ18CL9lNLy3dDBrwDXGWABRYI9o
         iFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6fphzoqruj/GSER9WikftOGOyqYcY3SAZ2CnJKbP2iM=;
        b=RqORnlib1ajSgs1rkbjd6UkYd1D8p/M5XkFX3N/7/WYFwCeTLll9MPShsVyAL+OyXq
         8YJoXhbxhR3QYBx92tRP+OfM7UdhnLnJ9CbjrdnAdSuyQ/pR21uOLMkLF6la6pRVeLNU
         VwdC4lx9BjzrBvlmil1K9sPWtahXvETVseou7kLYBC4ABtPMETIQ23rM8YdLnjKTvHZP
         7CjV+9hX0SbgCWe8Ope/nnIzr2UH/P3nNxJpuXA3MJ/ZNqSwgpBhNX/b5CfMJXerBmR0
         cosujgs0WS0amcDFCDYYYbf3FzQBdkv/jkwKuSwGZJQtnPjFtR6DEgavrM6lLP7chwFy
         SngA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IxdN9wcf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21si3806845vsq.401.2021.12.03.10.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 10:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IxdN9wcf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtD95-0003Yf-4o
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 13:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtD8l-0003LH-5i
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 13:18:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mtD8U-0006HB-Nw
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 13:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638555496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fphzoqruj/GSER9WikftOGOyqYcY3SAZ2CnJKbP2iM=;
 b=IxdN9wcfrP1urruDgVVhUiLmnQfJDTafTgyL+C5Uiem4aK7Y3qGoGO/35M2ZtZ6sqYAJkw
 ZwnQteeRC14nfu3un06u2i5sq3f55WaPl89dCWRwndYuJKaXW/WnSERT7GJWs9rL9yn0YD
 krQRN70ZsnnNcEfZfBqz6VnJbroFoYE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-9ZnOxKQ2OF-MYsfzFxoqrw-1; Fri, 03 Dec 2021 13:18:15 -0500
X-MC-Unique: 9ZnOxKQ2OF-MYsfzFxoqrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so1909801wma.1
 for <qemu-arm@nongnu.org>; Fri, 03 Dec 2021 10:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6fphzoqruj/GSER9WikftOGOyqYcY3SAZ2CnJKbP2iM=;
 b=Do9m4nFr6/Pn9vyzMl4PUY+eZyvS7h3VHE/tdwH/uma5vIKoJzHW4FJ9AQh7K6kH26
 YJox5TY2Q1OZp4XrkMNYMCvWwEPHf+ob73DTwPt03Nods5IORQiMkShxrjF6iekFS/YR
 hD6SN1ZPbswVCz3Fpj9h5f+NiVZCsxPZeS+ObHDIybkZl1Fj2sceIQDYLdqx2ZxxbJIm
 pN0eq1ow8gBmd7yVCqYcbhn5Ul9TeRTdJfZ3ktRE++mhAZUiJjPRV94cJFOSJ8xel5NQ
 wTuAEAa6W5D5918eVHWXCe+ht/nw4BKxCx8B3sTf1YLWKzuR8prwBUMoxqgWaRJ43Ea8
 v5Ew==
X-Gm-Message-State: AOAM532sc2wcc94bBPolivC44bwGp9fkn8SbfRRcwTDTWQfXAL4oVxTo
 l3Bm7MnyQvynpKefobm+EV1Mk47PDLwGzJb7LsCtST/xuK1p1MogogtIUnVckKVgDMWKA9WeD0n
 Y9xYiq+dp4lsg
X-Received: by 2002:a05:600c:4f02:: with SMTP id
 l2mr17176056wmq.26.1638555494433; 
 Fri, 03 Dec 2021 10:18:14 -0800 (PST)
X-Received: by 2002:a05:600c:4f02:: with SMTP id
 l2mr17176027wmq.26.1638555494197; 
 Fri, 03 Dec 2021 10:18:14 -0800 (PST)
Received: from ?IPV6:2003:d8:2f44:9200:3344:447e:353c:bf0b?
 (p200300d82f4492003344447e353cbf0b.dip0.t-ipconnect.de.
 [2003:d8:2f44:9200:3344:447e:353c:bf0b])
 by smtp.gmail.com with ESMTPSA id c4sm3371022wrr.37.2021.12.03.10.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:18:13 -0800 (PST)
Message-ID: <e9a7760e-33bf-478f-50b2-830eaf35d1de@redhat.com>
Date: Fri, 3 Dec 2021 19:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203033522.27580-2-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211203033522.27580-2-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dBaFKjgvoz/2

On 03.12.21 04:35, Gavin Shan wrote:
> This supports virtio-mem-pci device on "virt" platform, by simply
> following the implementation on x86.
> 
>    * This implements the hotplug handlers to support virtio-mem-pci
>      device hot-add, while the hot-remove isn't supported as we have
>      on x86.
> 
>    * The block size is 512MB on ARM64 instead of 128MB on x86.
> 
>    * It has been passing the tests with various combinations like 64KB
>      and 4KB page sizes on host and guest, different memory device
>      backends like normal, transparent huge page and HugeTLB, plus
>      migration.
> 

I would turn this patch into 2/2, reshuffling both patches.

> Co-developed-by: David Hildenbrand <david@redhat.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks Gavin!

-- 
Thanks,

David / dhildenb

