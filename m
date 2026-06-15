Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1F6CD98E1
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 18:09:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZBko-0005Yo-VV; Mon, 15 Jun 2026 14:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZBkm-0005Vf-T9
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 14:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZBkk-0003sT-MK
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 14:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781546982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1p7SdAykWPa/iK/jSi6h3hOisQznNzvN0QEdCegvn0=;
 b=ZJtaYvdi4mbOPezgvg3QKguhfMqH6uH4AOSQasZar8Zu9jR+O2Wh1dmW8uMo+hEsDHHftK
 mLNnbwRqASRuEF23z3oUxoqiPbS72P+SukEXC5PC936vXeNJQivgcuNGscKzvTL6VDi5tK
 SbMB3Od+7HW4ZEGEe0StO/Urk2wDjWY=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-NNdSDLS4OMu6WjXsjxaepA-1; Mon, 15 Jun 2026 14:09:38 -0400
X-MC-Unique: NNdSDLS4OMu6WjXsjxaepA-1
X-Mimecast-MFC-AGG-ID: NNdSDLS4OMu6WjXsjxaepA_1781546978
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304ed777a96so2389113eec.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781546978; x=1782151778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1p7SdAykWPa/iK/jSi6h3hOisQznNzvN0QEdCegvn0=;
 b=p7BRs81hT1rz/zzd0vWXPXeEnY7qMNJ4/o3PmkjTW521WHswZbfmA4K4iIPQ/SDOw8
 6GEKmjBZ3k0vnOD1zUpaqz3GmZ1R7ik4xIeTMasoRVHndxP81v3GCx45VyoKVngwTgBc
 LQPKlcG7QueiBzMp6LHEmMgybtEP/p6o3diiWI7lZwE+e+yEMqhLOM3TkicD+ukpK6aD
 Y4ZB8N9HJuhv491eu8Q4QfBmfiqi6c8YuUOR099+j/xT2zWFftY1S64fdJLzx6TjXPTR
 pBk1N+HbCT1uy4qudJpZl0M6QdqkbKNjVI3k8QWkZanWe9c6zgpH966UGNO5Sdj6tJPL
 GyUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Gd4bM5kEkjrACHLODowoPsBdEvyB10gAzAo0VhIwXbWF65y+/tHnfGg4Ppl/8N4wyLp0+PfhRqQ==@nongnu.org
X-Gm-Message-State: AOJu0YwDauXd3oMF213MmMyoTV61hmO03u6v8l/TUkLy4GJqeW+hxkG/
 hsPNpEmswsCkXCxsXoFCubMxInjqsyQp6RyVPYJsvIeKAWBUBeQn6QiOgewaJ0VFE54ul/hVHwz
 Kemg4oK1taQzupZ47oBxXdVjj8144vSRGZ7awIbOqWb1b1NrQCT5U+g==
X-Gm-Gg: Acq92OGZZTz3mj/RC1by8FRVDOEjImlCNX9pwMH4nOJXqel2yMS0/R6gsD4K+kWQoi6
 4HpJPTC3fbmqrBwSEDwj6I19j4o7aW21bgT6pFJnDE8OeYrWYjxtEPDJPxA03yCD988+ponc4Uj
 VPLRk8jHh+Qsr2FQPHmtqtqIX0a4iJ/cxqcIWW93WGRaK2hg/lmuuZDsN+tGuzIqeFSDX6j5zeT
 rNA8+Q/6OFy/kLqcsKcHMgUJrAiu84bPLfsMU7+6MM3Xi9ImCtioElTS55U1mNRDxzQdQbC3T5I
 MFyQ9tD5F4qAig+QY5bgc86NxLcgZsYwFNvebSuRCN535603RlNHihDCJ3cEbg1N/gjtvzbeyHa
 XGBiQnHUD1r2DOJPHFKSFR3SPBLxBD074ssq1nRDj7GcwL9s7dDi/k/ekhE3FOCct
X-Received: by 2002:a05:7300:6405:b0:304:13f3:ecdd with SMTP id
 5a478bee46e88-30ba2b02bd5mr364038eec.0.1781546977499; 
 Mon, 15 Jun 2026 11:09:37 -0700 (PDT)
X-Received: by 2002:a05:7300:6405:b0:304:13f3:ecdd with SMTP id
 5a478bee46e88-30ba2b02bd5mr364008eec.0.1781546976912; 
 Mon, 15 Jun 2026 11:09:36 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e48e412sm16818367eec.4.2026.06.15.11.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 11:09:36 -0700 (PDT)
Message-ID: <32c4a353-1cbc-4d3e-b05c-a4324e985426@redhat.com>
Date: Tue, 16 Jun 2026 04:09:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, peterx@redhat.com,
 alex@shazbot.org, peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <93fb3b41-1543-4e3b-922b-043b774f57bf@linaro.org>
 <d0d18a5b-1178-416d-81aa-d6d5f56ae3a7@redhat.com>
 <fc1213f4-1500-4282-8c98-8ddf10d4955a@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <fc1213f4-1500-4282-8c98-8ddf10d4955a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7GHf7hkCx_xbYLLw7Sbl5Km9XkSo9YhCjN6CKr7Ee9g_1781546978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/16/26 3:03 AM, Richard Henderson wrote:
> On 6/15/26 09:33, Gavin Shan wrote:
>>> Either assert n != 0 to start, or use while not do/while.
>>> Because the body of the loop won't handle n == 0 correctly.
>>>
>>
>> I will change this to "while (n > 0)" since we're not expecting
>> "n < 0" either.
> 
> size_t is unsigned.
> 

oh, yes.

>> Could you confirm which stores need qatomic_set()? There are two sets
>> of stores as below. I guess you're asking have qatomic_set() for (a)?
>> Could you explain a bit why qatomic_set() is needed?
>>
>>      // (a)
>>      *(uint64_t *)dest = *(uint64_t *)src;
> 
> Of course (a).
> 
> Using qatomic_set prevents the compiler from merging the stores, kinda like volatile.  Not especially likely with the way you've written this, but if you had exchanged the switch and loop,
> 
>      switch (lsb) {
>      case 1:
>          for (; n ; n--, dst++, src++) {
>              *(uint8_t *)dst = *(uint8_t *)src;
>          }
> 
> then the compiler is quite likely to "optimize" the loop back to memcpy.
> 
> It's also self-documenting what we're intending with the store.
> 

ok, thanks for your explanation.

> I guess it's also worth asking if this copy is also used for copying *from* device memory.  The commit that added memmove (4a73aee8814) suggests that dma from the device uses these paths.  In which case you'll either want a separate function for that, or both source and destination must be aligned.
> 

I think it's a valid case. Lets handle this by limiting the 'step' based on
src/dest/n, something like below. atomic_read() instead of ldxxx_he_p() is
used for loads. Please take a look if there are anything we can improve
further.

// Not compiled and tested yet
static void qemu_ram_copy_unaligned(void *dest, const void *src, size_t n)
{
     uintptr_t test, step;

     while (n != 0) {
         test = (uintptr_t)src | n;       /* alignment enforced by source */
         step = test & -test;
         test = (uintptr_t)dest | n;      /* alignment enforced by destination */
         step = MIN(step, test & -test);

         switch (step) {
         case 1:
             qatomic_set((uint8_t *)dest, qatomic_read((uint8_t *)src));
             src += 1;
             dest += 1;
             n -= 1;
             break;
         case 2:
             qatomic_set((uint16_t *)dest, qatomic_read((uint16_t *)src));
             src += 2;
             dest += 2;
             n -= 2;
             break;
         case 4:
             qatomic_set((uint32_t *)dest, qatomic_read((uint32_t *)src));
             src += 4;
             dest += 4;
             n -= 4;
             break;
         default:
             qatomic_set((uint64_t *)dest, qatomic_read((uint64_t *)src);
             src += 8;
             dest += 8;
             n -= 8;
         }
     }
}


>> Another unrelated question: why 'int' value is returned from ldub_p()
>> and ld{uw, l}_he_p() in bswap.h? They would return 'uint{8, 16, 32}_t'
>> values?
> 
> A bad choice 20 years ago, and the need to audit all uses in order to change it now.
> Newer functions use uintN_t as you suggest.
> 

Ok :-)

> r~
> 

Thanks,
Gavin


