Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95763CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 17:04:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZAj0-0004W3-Dc; Mon, 15 Jun 2026 13:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZAiz-0004Vp-ID
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 13:03:49 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZAix-0002Bh-Uh
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 13:03:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c0c3543590so25125235ad.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781543026; x=1782147826; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//v8bH+g3mx0nJ+94q2FAgkpeXuag9yDnFxltuwrYzE=;
 b=eK9zqoiY7d+mLhnFeJIxHXItu0loHJE0aOUhFezFv5mor/u+zL9nfFkwOJ3uOlBAL4
 CoQUFHesY0Lkj2qeJWSe6CjmXCTrlBqSUkY9Aj0XxJG0LRsDVifjQOu53x2U4naP9y7U
 Ij8WiCWKOis+c+fb70jfierQS8CyNAS2sDE8vHpYIEAwQrbHUkL0DbZX531bcQoHHtbS
 tD9TfVMjSDIBCdJywsB1RqG0s9zhRu7Aw5DB5kgA3hdJgQ+83BfPXQF5i9YoXpMD0Sqs
 ZIlH2ojcI8wTpqun9OLRti+2+L4Jm25tfPVsDr6g1WM3gaYVEq/hf+wsK9Z5Mwv6Uqj4
 IV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781543026; x=1782147826;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//v8bH+g3mx0nJ+94q2FAgkpeXuag9yDnFxltuwrYzE=;
 b=AYNHITHEgpU6QFaq5BNEbW6MYDb4P0oKKs0ZnrtQRh57jUCKWJskIdOZ/AyMwG/dHd
 R0B+H1W7BD3wh+Gm0RHjMbfsMC9xzlKoRG1+gECFHiUHuOLX93QrqOkLD3VCcBgwdKM/
 gkrbHX0G7B9pySbzn8Wg8ehJyY1BHaRBeAWn2sQX4o02TXon5kbjeTKKjDEML2M/fVN3
 KCrVmalzcMJbbGQ8V1vpl8dWsWWaW8xSBhRQp1J1xzr+eX2dONynKCaH3FGivFbgPCE2
 611SuDNvbHUAcYvj4GOSJANlYLOf2rYwJOV6EWByYMKD+DYFrqkkxiPvbyqYwK4B3T3k
 OpWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+6YhfR/qUfN7hMNa3LfxrgelIbymq5C3Izo/bYs4wavPFnuqbkGZS6EZF2r+S7Uvyocj7w+sp/bw==@nongnu.org
X-Gm-Message-State: AOJu0Yyl9PKQ8YCPrjdvLvJaDsAVwXRXX5nv4TmwqFGENS/9AcXklDpG
 3v3XbYlacIMVpKSElFtnEugMHCpy0rD6dzHdpC+xb4VwHT6XdttaUiAATyDKpAI1jZ8=
X-Gm-Gg: Acq92OEt5MkGH7mNr77qbcIXlv/pnE3uP879PfunIsu/Fu3peZ2lmLjTMXxxunpjNlg
 5jeVqZMteyFJiY27eQVtsxHEpsow5DSXvd4Ujbs/dl3eAhsKmw5WoWhtiRhBpOJJjC4ZyET63DR
 WAfS2dkcjwFNIo5zv7ik+gjodK0ODWQuaXpAB0fr0z97hqsM//xnlzdWpzXRjrLaztWR9+cvqfB
 ZtLWCiYJQxbE7VxlPbFzUAmP6vOVnLz1lXnJkBtxnu8aM0JDmLguVDcA170QaEHi+afTpmrwNPP
 AUHJXQh/8UqcONcwyK0b0wMJUzAIevQTG128Oo684BSWPvhakT0VYzQ2/+W/EVVUH7XbzDkaa3K
 +qpgsHmelRDXvfgzC2cWkYGvV4UFEVbLUa6CfuzjK9gjP+R0fSSSjJmBO9FIZ9LHL/2t5X0vjRN
 jp8NPW0uv5VuKh7C5w4mgqlyFGMEqQKNMFtwrP
X-Received: by 2002:a17:903:3890:b0:2bc:b80f:677e with SMTP id
 d9443c01a7336-2c69a1965ddmr797245ad.25.1781543025940; 
 Mon, 15 Jun 2026 10:03:45 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f7c6c52sm108267315ad.22.2026.06.15.10.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 10:03:45 -0700 (PDT)
Message-ID: <fc1213f4-1500-4282-8c98-8ddf10d4955a@linaro.org>
Date: Mon, 15 Jun 2026 10:03:43 -0700
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
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <d0d18a5b-1178-416d-81aa-d6d5f56ae3a7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 6/15/26 09:33, Gavin Shan wrote:
>> Either assert n != 0 to start, or use while not do/while.
>> Because the body of the loop won't handle n == 0 correctly.
>>
> 
> I will change this to "while (n > 0)" since we're not expecting
> "n < 0" either.

size_t is unsigned.

> Could you confirm which stores need qatomic_set()? There are two sets
> of stores as below. I guess you're asking have qatomic_set() for (a)?
> Could you explain a bit why qatomic_set() is needed?
> 
>      // (a)
>      *(uint64_t *)dest = *(uint64_t *)src;

Of course (a).

Using qatomic_set prevents the compiler from merging the stores, kinda like volatile.  Not 
especially likely with the way you've written this, but if you had exchanged the switch 
and loop,

     switch (lsb) {
     case 1:
         for (; n ; n--, dst++, src++) {
             *(uint8_t *)dst = *(uint8_t *)src;
         }

then the compiler is quite likely to "optimize" the loop back to memcpy.

It's also self-documenting what we're intending with the store.

I guess it's also worth asking if this copy is also used for copying *from* device memory. 
  The commit that added memmove (4a73aee8814) suggests that dma from the device uses these 
paths.  In which case you'll either want a separate function for that, or both source and 
destination must be aligned.

> Another unrelated question: why 'int' value is returned from ldub_p()
> and ld{uw, l}_he_p() in bswap.h? They would return 'uint{8, 16, 32}_t'
> values?

A bad choice 20 years ago, and the need to audit all uses in order to change it now.
Newer functions use uintN_t as you suggest.

r~

