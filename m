Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DD0CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 16:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZAFs-0005qO-8f; Mon, 15 Jun 2026 12:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZAFr-0005px-7p
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZAFp-0001Uu-HP
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781541220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6w9lFh6PZ26UiIsyxaCt4t34MU6PXSASefpv0F91Ac=;
 b=gUoL9rNoyC6MpSKr+e+qXrwgsz73fL0DUY+/ceO/v6LpmSfhO/XjaAKfoJH3sricl6G+PR
 Of1S6fN6HwRIPiT+itn2pzsYo1aR8kRu4ORda2xkMZNf3ZCl7728higT1j3UyrYwfVhohd
 +jzaA3gL7l8lDKm8X6YmH0nppUhqCUo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-OnMWtyQfONiOryZ_vPemMw-1; Mon, 15 Jun 2026 12:33:37 -0400
X-MC-Unique: OnMWtyQfONiOryZ_vPemMw-1
X-Mimecast-MFC-AGG-ID: OnMWtyQfONiOryZ_vPemMw_1781541216
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2c40358e114so41900345ad.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 09:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781541216; x=1782146016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y6w9lFh6PZ26UiIsyxaCt4t34MU6PXSASefpv0F91Ac=;
 b=ioxeylrXUHtd0yHxvLJLuJQoE/Z8T2BSrHhyRLiCmvzSJTPl6rOvhknGpeuOIuzt/x
 TfqUMx9rMWf6DDMQshoIUojTTxpDwPQcU38coZIbWDs81sx9/Opu8P9ec5Vb0pIvZw1D
 EvQy8/i6vRPX5Nf8CgVt23tW5c3pX0GODvmcRnhpCzVFUVe4kaxw2DbtrI/o3747Bo5y
 LRa/v29IoiquLrVD5tYOW7Q4uwAjt2jXb/f5YLZ03MitMUA9S5UljiCYbbi4gMInnWuL
 W17WIrFf1+ZQ1efk74RYIj+e3PNN52owTLjeKTj37U427pAX7M7m/532k91848nQnGTe
 1Qbg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8nKqgS7ZSkHEN5BqTQOQE1YPr80TcpytmD2Mo221tdb8DsEiJmU4K4K1R2Nk02n4jC9I9USGbKyw==@nongnu.org
X-Gm-Message-State: AOJu0YzInLyh7IKTVkUrFGQVaqKa1sqeAhnPPffiJb/CfsiVCXGrQKhG
 hiEWw+rpT6ST/P6tkJfBHJwPAHGTsKt8+DLrmbcmF99h31DvKxoP6OKGDhk/tv/y+2Y1PCVcKRw
 U3uRZOaJT6TB4lsEaaK8GW7+MFu6v5gRpOh5y5QYPclHoOte5n/npmQ==
X-Gm-Gg: Acq92OGoPE/SNvhTNn2qWE1hrc8hBTggdTiePsGTr0Z9Ul0JHpGZnCkB8oXHir5Uzbe
 zB1wWYKbZQrztpio9qheoweNghST3u65K2YmO39zD53EJCCV1ry+Tcz/8Bz9h9gfeeamTnyit3G
 gqQNHwpPHF6Yof/yH9BpJ4xFbYP7IAUUsmF2xA/Rp+SUhsj9EAjm1J4tCalW7mXvCo7KZ9dX71v
 gp4qRD/6IM4kRzeCcwtGUaUF1zMCLxOtrzkFxCwmHsRG4pLoWG3TC0ecjmWq0ZPanY+X5RFYEDK
 TyrAFjy4BMr6+KiwZIWFxRWqT0KAn4Bak/ipBQO/oQuOeNh+LRKuBa+qMNzLi2197lxUuwjqw5i
 WGup+Ney2PVlQnEBU7jkpA9e81i4sgrO3NODZJh8YBDNzVO+v0Mq4cnwsqZuK3oq6
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id
 d9443c01a7336-2c664242d9emr138012825ad.20.1781541216168; 
 Mon, 15 Jun 2026 09:33:36 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id
 d9443c01a7336-2c664242d9emr138012425ad.20.1781541215722; 
 Mon, 15 Jun 2026 09:33:35 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327ac794sm106755965ad.46.2026.06.15.09.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 09:33:34 -0700 (PDT)
Message-ID: <d0d18a5b-1178-416d-81aa-d6d5f56ae3a7@redhat.com>
Date: Tue, 16 Jun 2026 02:33:26 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <93fb3b41-1543-4e3b-922b-043b774f57bf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VoysHlh4Rja7A6wn8x-yctifvLlAEQtlXv0iwdH7qwI_1781541216
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

On 6/16/26 1:17 AM, Richard Henderson wrote:
> On 6/15/26 03:01, Gavin Shan wrote:
>> +void qemu_ram_copy(void *dest, const void *src, size_t n)
>> +{
>> +    if (HOST_UNALIGNED_MMIO_OK) {
>> +        switch (n) {
>> +        case 1:
>> +            __builtin_memcpy(dest, src, 1);
>> +            break;
>> +        case 2:
>> +            __builtin_memcpy(dest, src, 2);
>> +            break;
>> +        case 4:
>> +            __builtin_memcpy(dest, src, 4);
>> +            break;
>> +        case 8:
>> +            __builtin_memcpy(dest, src, 8);
>> +            break;
>> +        default:
>> +            memcpy(dest, src, n);
>> +        }
>> +    } else {
>> +        uintptr_t test, lsb;
>> +
>> +        do {
>> +            test = (uintptr_t)dest | n;
>> +            lsb = test & -test;
>> +            switch (lsb) {
> 
> Either assert n != 0 to start, or use while not do/while.
> Because the body of the loop won't handle n == 0 correctly.
> 

I will change this to "while (n > 0)" since we're not expecting
"n < 0" either.

>> +            case 1:
>> +                *(uint8_t *)dest = *(uint8_t *)src;
>> +                src += 1;
>> +                dest += 1;
>> +                n -= 1;
>> +                break;
>> +            case 2:
>> +                *(uint16_t *)dest = *(uint16_t *)src;
>> +                src += 2;
>> +                dest += 2;
>> +                n -= 2;
>> +                break;
>> +            case 4:
>> +                *(uint32_t *)dest = *(uint32_t *)src;
>> +                src += 4;
>> +                dest += 4;
>> +                n -= 4;
>> +                break;
>> +            default:
>> +                *(uint64_t *)dest = *(uint64_t *)src;
>> +                src += 8;
>> +                dest += 8;
>> +                n -= 8;
> 
> Use qatomic_set for the stores.
> 

Could you confirm which stores need qatomic_set()? There are two sets
of stores as below. I guess you're asking have qatomic_set() for (a)?
Could you explain a bit why qatomic_set() is needed?

     // (a)
     *(uint64_t *)dest = *(uint64_t *)src;


     // (b)
     src += 8;
     dest += 8;
     n -= 8;

> src is not aligned, so except for case 1, you need ld{uw,l,q}_he_p.
> 

Yeah, I realized this after this patch was sent. ldub_p() will be
used for case 1 either.

Another unrelated question: why 'int' value is returned from ldub_p()
and ld{uw, l}_he_p() in bswap.h? They would return 'uint{8, 16, 32}_t'
values?

static inline int ldub_p(const void *ptr)
static inline int lduw_he_p(const void *ptr)
static inline int ldl_he_p(const void *ptr)
static inline uint64_t ldq_he_p(const void *ptr)   // return uint64_t

>> +void qemu_ram_move(void *dest, const void *src, size_t n)
>> +{
>> +    if (HOST_UNALIGNED_MMIO_OK) {
>> +        switch (n) {
>> +        case 1:
>> +            __builtin_memmove(dest, src, 1);
>> +            break;
>> +        case 2:
>> +            __builtin_memmove(dest, src, 2);
>> +            break;
>> +        case 4:
>> +            __builtin_memmove(dest, src, 4);
>> +            break;
>> +        case 8:
>> +            __builtin_memmove(dest, src, 8);
>> +            break;
>> +        default:
>> +            memmove(dest, src, n);
>> +        }
>> +    } else {
>> +        qemu_ram_copy(dest, src, n);
>> +    }
>> +}
> 
> The qemu_ram_copy implementation above does not work with overlapping blocks.
> 

Yeah, it's something I need to figure out for next revision. Thanks for your
review and comments.

> 
> r~
> 

Thanks,
Gavin


