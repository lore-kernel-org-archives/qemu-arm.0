Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95CAC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 16:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhW9i-0002qx-MK; Thu, 31 Jul 2025 12:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uhUqX-0001y4-I7
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 11:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uhUqV-0007A6-6y
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 11:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753974324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XCVknrCzZ/8CPTuz3OsFRtCrgYRo5fUS4nf+SODsFG0=;
 b=aFMipgZcF3uC9rOUXTHn2EIWRANHekE/hEZ701haCyUcQzqCod/IGINyWaOv5VaRW/LzCr
 mMjnVsBG5MTTeEIs6lFFnmhFkyC3ISvjJ26qeDPwKhnoAivMKs9XfvvSkHWpjtUAaNBpFa
 Teg0+K1imaRhH/QHFIQ4s1F0vi5zohY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-vhjLDHrKO1eZqh0NIIGPcg-1; Thu, 31 Jul 2025 11:05:23 -0400
X-MC-Unique: vhjLDHrKO1eZqh0NIIGPcg-1
X-Mimecast-MFC-AGG-ID: vhjLDHrKO1eZqh0NIIGPcg_1753974322
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4538f375e86so8838185e9.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 08:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753974321; x=1754579121;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCVknrCzZ/8CPTuz3OsFRtCrgYRo5fUS4nf+SODsFG0=;
 b=Pv6vdD5XFRdZypMdmyrQlTbhjw0B876InOnOQ/NQ7Cg7DUyWXYMoFPv1DLXG20wKbb
 CnOirdavledf7CeZifF4hEmNKFFHmFKHguhCOXdTU95IF61ddNtm7XnNnrNmDD1ja/Kf
 BSYhtcakg2i/ALlJhdxNkOLASIMYJBETXb0fxR/oRNbNmNAL1LOSh457v/dC8sqNo0Rs
 oP1er6Ry9YWy4d+mqGeuo6I52bIEiIZ2TfwQEMb1Clky+v6hkn34uXS8AunNv5lIjv9A
 Bb1rEdlCqW0vs66qM378Rjjp3TvdH1Db6J1EUXVz5efW7YwKeJZKl+glH/XzUe0gkX8+
 OWEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpy8OqzHoF0OHIcK+ftlWjkLlpwYu4JwD+z7fpLt2Fo+ybB9k4bxcYuGFf6luDaq9JY4vI/z0UUQ==@nongnu.org
X-Gm-Message-State: AOJu0YyKOb3Evwb0naCFr1sLPE9ZLK0JvmtjU30KrcQnlos53h7KoZAb
 nB83ByfV8xWAXKTulmWu0HB6j2ju9QzYXQuQdPEoXzeVx6zy039y2VPGgGdpGZDj6NF8ZjbPYA1
 VR6n8CMFKjw8xjogu1q69YokMEXlYRDNj7nMsX1fzrQh5RvBb69sEC7zraF459g==
X-Gm-Gg: ASbGncvLJWGNel4YQBkRNtsW/1An+Svqav3ou5wRGP6VsnaaCjnuSztqjxK7jDj1HPM
 T5FAOwMmG+/kWoMIk9wvdSnvXAlGrpN6L3cD2RWmE4IgIQmYHbEbcAHmOXIJiNf8efvr5nW5q4+
 ktgcm9IsFzJq4bXeoDZq8hIN1WgocdBiJK+AW4BKROp1RI9RAhRYhwO1NC7sZGrHHtihm4YiAIt
 RpdMSOrG0udJWa25QBevWwQVz7gI/1/YA++2yGWIsTJ+4pR3/l2lBSi7gDjvY6ZLI84riLJjORY
 K7VbG7F1GNfNAbX7tvkqu+LFhNBvDFlGttdiCdRf3PxLcdoTzeUcraWy4YYvS1A6jSj7kcb+4Jd
 hQHydMjA=
X-Received: by 2002:a05:600c:1e01:b0:456:1efa:8fe9 with SMTP id
 5b1f17b1804b1-45892ce4323mr76956175e9.2.1753974321516; 
 Thu, 31 Jul 2025 08:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4zrBs2jY/6msgfaoN8eIuByhuMTiUkd23Ta+NhDWz++h6AlvhftIKBxkqVb24taklDYuGbA==
X-Received: by 2002:a05:600c:1e01:b0:456:1efa:8fe9 with SMTP id
 5b1f17b1804b1-45892ce4323mr76955795e9.2.1753974321018; 
 Thu, 31 Jul 2025 08:05:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:9004:d500:837f:93fd:c85e:5b97?
 ([2a01:cb19:9004:d500:837f:93fd:c85e:5b97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac036sm2683605f8f.15.2025.07.31.08.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:05:20 -0700 (PDT)
Message-ID: <cbca91b4-691b-4e2c-9588-99509a4278ae@redhat.com>
Date: Thu, 31 Jul 2025 17:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.2] hw/arm/virt: Include 'system/system.h'
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250731144019.1403591-1-clg@redhat.com>
 <CAFEAcA-FZq4RJrDfDiSqC5-L3720cYALamJGU5fQXQnV9J_-Rw@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CAFEAcA-FZq4RJrDfDiSqC5-L3720cYALamJGU5fQXQnV9J_-Rw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vMvO_XGAeD6MXhFpFfYbUWFnBbiAQql7KQi7cgMkORQ_1753974322
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/31/25 16:55, Peter Maydell wrote:
> On Thu, 31 Jul 2025 at 15:40, Cédric Le Goater <clg@redhat.com> wrote:
>>
>> hw/arm/virt.c should include 'system/system.h' for :
>>
>>    serial_hd()
>>    qemu_add_machine_init_done_notifier()
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/arm/virt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ef6be3660f5fb38da84235c32dc2d13a5c61889c..e1b6241f7bee4c2fddde31c512561e87229cebc2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -50,6 +50,7 @@
>>   #include "system/kvm.h"
>>   #include "system/hvf.h"
>>   #include "system/qtest.h"
>> +#include "system/system.h"
>>   #include "hw/loader.h"
>>   #include "qapi/error.h"
>>   #include "qemu/bitops.h"
> 
> Presumably we're currently pulling in this header
> indirectly via some other header (the vfio ones)?

yes.

> Might be helpful to say which.
> 
> If this is a dependency for your vfio-platform removal
> patches, feel free to include it in there.

I will do that and improve the commit log.

> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> -- PMM
> 



Thanks,

C.




