Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304C5CD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 18:33:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZC7t-00015z-D2; Mon, 15 Jun 2026 14:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZC7i-000158-7p
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 14:33:27 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZC7c-0001B5-GA
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 14:33:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36b900f350fso3365840a91.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781548396; x=1782153196; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PA/2tGdrns4nOu24xttae4aE1Nq5sxLr6EQnlFU0fv8=;
 b=ZTHYUbLnY3USIY3m/RtzaZBBOEAtga/cnP5yeK+yD5v4O7uf3aKfqEeaaMiDCHPjQM
 O3hIIcRGCWGoZx7eSChzpmunueZJbpgjyN3A6FC3ds5HnXr0pM3DI4pM6X+zkztFkffv
 TXg26lwphgful8WTtX/ywu/60si0QWmsgjJ+UfQ/ZLJ29D0+kxruAdgRrXJOPuMphpJ7
 KF7N2Xbxd9KwEMxnzlnipmZYI1qIiTY94c0S6ToJQmbvygSm4GY+S8AaQ63smQ1rOiKO
 +1UcABpZEiOqFv7TOaIqCtsddB4MLWlZwrbz4BwVphQmo8EpqRBunoctJb0SzHGn+mnQ
 WL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781548396; x=1782153196;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PA/2tGdrns4nOu24xttae4aE1Nq5sxLr6EQnlFU0fv8=;
 b=H/lJfDfPhMDecFLRjLg8/uxyRrlac7ND+ml0xvVGiC9sxpfFzoWqPoISWpqQ3ClXNy
 Ca5g7WgJ2Bej9BcpPaDn6Pbw/juqXxIW0+nM/FSVBWRM9N2O410D1QuMyxdzshdFD7D6
 e1/CKawjCwyslQoJ7C7GeJPYarXoc4Rtam6H2ZgM8Kj/lCyej+HcKrIsEgU9HnKn9ujx
 dgTcGByVDVJVmBRkKbRGOfK4dMED9rEwoRtaA3RWLlbeJyQDTvmui+jbaF2Cw8x0k2HY
 xSVsVYqGGRLsYcjD4CdeVqrY7/MKM2j39TwDT4Xbyr4tcBNRHRI8Yv6oNtz77vvldAxr
 ti4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sAy87RKTcv9iTn3fP58gES8atmc0n+IMWFlJ/Kvv/pcqWfIJHQB1YneZlSjTe5isHczVE2zT4Kg==@nongnu.org
X-Gm-Message-State: AOJu0YwnWQMklL4J86N9XZCuOG1BbnvmprAcG5yO1e+mhBvX5wxOyc1r
 w/Ixy1QH8oG1Hj/NUXy8+U7VidwH1xXpdtmwxbEWFs463bB/EgSru3iRt9sBSbd3a+8=
X-Gm-Gg: Acq92OEJakIZwAK+FvQOaJftdOVhFw5/StH/jLawJODD22v7noeXum1Las8/rH2t14l
 UDELpQrS25/IGKEDh9yoJ7CdHfReID+Bple8tCdN3b531lgASUmdSFFvbGf6tqhfvlsi5D7VtdF
 8M7hCDxzKfBhgBmmjhZbSG0+2p8tImXsSe09jJ1+fYWgjqUAOaod5vYYwOzSMxM1JaTrmEUFUxf
 b7SAQDjmY4hCyUe8X9yNCwRgMOnZJX+lcLshr7j95n9b8Er2K22R4pI1e+5jY9xvWHHCY8SqkoO
 nKzX3Td0TRguDiZiq9dWJ13KU9hm7LM/s1Be381YvZPwNBTAYckfvzs+q7tIV5aDsIV4gvysMJb
 2YWVMuEnJQjuseJs0AKa1SUEsN1F8EL9t3dz2RS1kZCE7lZEwm98XDd645wg9oeXHsQqhIBSdA4
 f70Muyd2KG+0h9MNVetnGb3wN0Gb3XDh+3aZXnkf1TqXjThdkrjVsw+A3gCKFYgdyQYCH1zIqfx
 +MhGJ0=
X-Received: by 2002:a17:90b:4c86:b0:35c:30a8:330 with SMTP id
 98e67ed59e1d1-37c2bb41db4mr12330939a91.0.1781548395684; 
 Mon, 15 Jun 2026 11:33:15 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c522a251dsm289131a91.16.2026.06.15.11.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 11:33:15 -0700 (PDT)
Message-ID: <53ef3e8f-c421-4744-bd8f-c67390f31639@linaro.org>
Date: Mon, 15 Jun 2026 11:33:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
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
 <32c4a353-1cbc-4d3e-b05c-a4324e985426@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <32c4a353-1cbc-4d3e-b05c-a4324e985426@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/15/26 11:09, Gavin Shan wrote:
>> I guess it's also worth asking if this copy is also used for copying *from* device 
>> memory.  The commit that added memmove (4a73aee8814) suggests that dma from the device 
>> uses these paths.  In which case you'll either want a separate function for that, or 
>> both source and destination must be aligned.
>>
> 
> I think it's a valid case. Lets handle this by limiting the 'step' based on
> src/dest/n, something like below. atomic_read() instead of ldxxx_he_p() is
> used for loads. Please take a look if there are anything we can improve
> further.
> 
> // Not compiled and tested yet
> static void qemu_ram_copy_unaligned(void *dest, const void *src, size_t n)
> {
>      uintptr_t test, step;
> 
>      while (n != 0) {
>          test = (uintptr_t)src | n;       /* alignment enforced by source */
>          step = test & -test;
>          test = (uintptr_t)dest | n;      /* alignment enforced by destination */
>          step = MIN(step, test & -test);

     while (n) {
         uintptr_t test = (uintptr_t)src | (uintptr_t)dst | n;
         uintptr_t step = test & -test;

Otherwise it looks good.


r~

