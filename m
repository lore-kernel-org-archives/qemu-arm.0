Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7628D66B81
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 18:44:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVwVK-0002kP-HT; Wed, 17 Dec 2025 13:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwVF-0002fr-F5
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:44:01 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwVD-00019w-TN
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:44:01 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2a09a3bd9c5so37815345ad.3
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 10:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765997038; x=1766601838; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CvdKfb3faPSJ4Hfq58SnU1gsWTM/NgKpvO/xkCilUSM=;
 b=mL2ZyPcysTMeLB0Jk7c4/4tY6sYrkhCn/9TZno+NcO2ednEOP7sYlSJDIcmNI/RJ/9
 IoUA7zLbaxSMAvuBU/DogbkriGjiSl11gOG9wqnd372hSurOBHbTdyRWtiUD5WsRaRLU
 5hhrGpUVOzVbmHFeY8qtrx9x8hjVNat91vGme/aDauVzybJVORfDQJarwfHH9UTWlbv2
 O1g5Oez0xD5OAfz+1+2lEQf+ccIhtnYf0XtaMj761G8wmSbYS2pVTQvMijuKj5+WiSzA
 XtF2T/7b2paXA/kyvFLgV7rAfTcZi9HS6tr2mXrYdG5s4nPZctFswIl+T6e6qsgw2Jtu
 XASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765997038; x=1766601838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvdKfb3faPSJ4Hfq58SnU1gsWTM/NgKpvO/xkCilUSM=;
 b=ItH8TanJ60BObi75zNJHtGO82yOSRZVOgytsxByLb1RiOXCt3qEK/6bCVuQHKtzado
 dw/Tn9ujHHzwWP9pdJrNciws6tc08qsjL0fRXBlEQ+3oMpjSTCq4OXZR5AWRzjbuTGqS
 5kHPW1MFihY7sVi1zG4KwBZpaq0MgyzkgSbh1h4wzI0Bg5v/Rf8/3YCD6koCSwVRMict
 9NoUrNU0jDrAtt2sS8btaLPpa73kdsgYBf9fAdaBA0kwdT7blJC/mtl5UlNlnSXeoHfd
 TLwCaqRj3EtTjLb44TExqlXz67Bm2BLjAVXM1GhyHOcG58vtGq8cpQzXkWdgRUuDIHUB
 aOfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn+USyp6uU3Fu4unpin3Il79MAdogslN+PXsP2zo3xjcHEzhHwSZOw1FAHIFcBClR8mz/xOR0ieg==@nongnu.org
X-Gm-Message-State: AOJu0Yw9hdWVmNcKgIepk6INUokCijNh4qb0c6477y7JFyl+las0MolE
 a5OMexmVYYOv5uwrUk67Z0DfpkeirljDz0mMhV4jYxkDsdTQfBJCkPlLIDYWr3/0WCE=
X-Gm-Gg: AY/fxX5iYyXKianPC3H+6YAY6QoKG2/wgfwVZr6sDwKXXHVjNa18JfA7RSzMB778BTg
 SJb10S2xTTWaM49GNzibzEvoy9RWpXZnxDXcx0UcOJFXiPs4OQq/2OIW4+KxK9knQXl8S1GoZkm
 8Sw+ccVZwpqu8Z+Ko7jZR5Eo2g4w8T5bU24+QTTxvCbmn4+u7fW+6GP0w3hVjlkZ71oQQy2Rzrd
 oHyskoiElfRVAvsAswt7nnqnP1L5Sz2jAeFzooKKvTvmj3AmcrUVZwuNCZZR55Ifzmp2ZUfr0bk
 vrq2YUpKWxfNnBni97+2OzPbpolIMRJow7KIWT0TywkJJpmmRYG4xygBSjjCkSFHV1DittEglah
 nR68GKPoceWYpF/lDdx0K6kyKx43uobG23KvNRfz+9ScLbTBLXNRK/DD6aO8ewWxeWOl/xX833a
 df6kubz9swvjPnvow8e6Ar1JnXqr+rlKwG2wNQRNGXphzNgOSXObMxxIU=
X-Google-Smtp-Source: AGHT+IGVa8Nz9/85L8JfoSIRhU1/quaT+TSuGESydnR+07IzyTFDA3PegXCSEhK6fake3957p80WkA==
X-Received: by 2002:a17:903:110e:b0:2a1:3ee3:d00b with SMTP id
 d9443c01a7336-2a13ee3d062mr64274895ad.13.1765997038263; 
 Wed, 17 Dec 2025 10:43:58 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2d16126dcsm302065ad.65.2025.12.17.10.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 10:43:57 -0800 (PST)
Message-ID: <e88eb39f-f5bc-4be6-8e8d-5e3bf154d0fd@linaro.org>
Date: Wed, 17 Dec 2025 10:43:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] system/memory: Split MemoryRegionCache API to
 'memory_cached.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
References: <20251217143150.94463-1-philmd@linaro.org>
 <20251217143150.94463-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251217143150.94463-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/17/25 6:31 AM, Philippe Mathieu-Daudé wrote:
> We have 115 direct inclusions of "system/memory.h", and 91 headers
> in include/ use it: hundreds of files have to process it.
> However only one single header really uses the MemoryRegionCache
> API: "hw/virtio/virtio-access.h". Split it out to a new header,
> avoiding processing unused inlined functions hundreds of times.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                       |   1 +
>   include/hw/virtio/virtio-access.h |   1 +
>   include/system/memory.h           | 185 --------------------------
>   include/system/memory_cached.h    | 207 ++++++++++++++++++++++++++++++
>   system/physmem.c                  |   1 +
>   5 files changed, 210 insertions(+), 185 deletions(-)
>   create mode 100644 include/system/memory_cached.h

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


