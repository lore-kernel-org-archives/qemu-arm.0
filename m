Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AECECD8CA8
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 01:43:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYwLs-0002Jr-1Y; Sun, 14 Jun 2026 21:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wYwL4-0002HO-7Q
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 21:42:13 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wYwL1-0006hc-Tv
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 21:42:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2bf125989f2so20162255ad.3
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781487721; x=1782092521; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=czpiKXW9ovs5eVWLzMM2TcpMs/8fVIjNzdWriykVfIo=;
 b=yOx1+NRzZdNxd/pS9dGBp7WGhfZgbyzNKlOdxedJePFm7n8Qacm3cBjbz3V7ohDjdW
 6S1/f39qH7Viflimun12VQCLozdN1lcmpJOEmo2cIFO4RbOm6RS2MYU3bJYWNjyo2aS/
 gcNsXaGDAGlZPTmOF0sYKWqPrJ5mE6kEqDcbSpO7mRUPkMKz2z8cBUOcQ8uhh9DYJpQL
 McUQHAP+hu/ynvMOBPujx3Zld5nuTyBWIoYm8l1kkfVe6QdKe0eHhLLASe1HKurYS/Tn
 /teWSvGz8xSDeEU7nq5ltA8TWG9YJNDU8htCWY6WrUUzzr7vfhq+PwWpx56rK2TPUPUi
 zArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781487721; x=1782092521;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=czpiKXW9ovs5eVWLzMM2TcpMs/8fVIjNzdWriykVfIo=;
 b=POK8zWxCDogFboPAYyG1nbhyjs7hSJUAFeSNpYiaMhvKs8E0L8i+zYiQeQ51fUkIVb
 5oixlPG48GJr0ThGmdcpW4tJ5lKtvTnMUwMqIrwS8KZIIOZduZwvXNGU9H9lo6Y4lMSO
 pY0lqpYzlCdE08Hg7ZC74Nit93yiXXWrezr+euwD9wNTgOhccBVpReBn72FDmmpmfFwk
 38qYZoXWPJJHLuqDBCZDSSrD+ZCi5b75oo8l4nvxYXWwCemyPm5+EckKUkqh3QPmhjr/
 ZLSBZRPITb2LHtcZyprIXWgHc7Pz40EquPuana6U4jK8R8RtvWxCjO3uq6gMZBV/5VlR
 XIYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9WPJ4UZOqfRR8QZDfwoHbZo3ecF8qF8FLJwBhmLawIz4JPZBVkAGD3QzzF3bp76BRFml5ZYVdB8Q==@nongnu.org
X-Gm-Message-State: AOJu0YzGE5PBzg1+ZYTqr3cmexhkt2VDzhQRpWEjvhpMZaEVg3THs3CF
 i6eraCEbfbkuajz1GvgNhINM/qXBAxxx2rSdSUedqhXhhq1IZkG2CEYEQX59o9ri8mk=
X-Gm-Gg: Acq92OEfnwD0Tc0UHnJlzvEup+GoKrM1wNpqDeU/66RBehyk9QG3qKOt/7eL4oJhgAP
 zrKc0Rz06U4E2rDA3ECjuKqh8+5wn7jjayV/KQRlsaGVX0yPDEIkA3zMB4oGoUKryVudKeynnaS
 cR3wBGpRFr+kXjUda28qG+NpUuIsR8reV26WaYYr9FQQkSVtOmCmqozkflG6htK7yJFgYlQbqDB
 6N1YzIClNo4COfmE7Ya2P0IYS1DrqPSiynjiilBgFAMpeuTKiV/e/DQSHZYqKG2wuOXth9b4mC/
 U5vonRfdbb4pNzsPTgeWp7MbC6oXWjNjVvMosjFzzVyUbaCN4KYCLYeD2EXa/Xh4e+XSMNnfrWD
 +aBcu+U9VNDpq5YW1XdVB1xz3YSERjgLpMuCBgdC5RdB+G454eFzmQqx54tlGpl0uVlCJLB7vV0
 LhJwhR+rFf1ddRxORMqN/7NmL/u/tHx8PE7Cuk
X-Received: by 2002:a17:903:1b0e:b0:2c2:50c7:58a4 with SMTP id
 d9443c01a7336-2c4134ec641mr135782055ad.22.1781487720814; 
 Sun, 14 Jun 2026 18:42:00 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4328a44e4sm85394575ad.48.2026.06.14.18.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 18:42:00 -0700 (PDT)
Message-ID: <52c2af6c-f494-4e30-bac6-bde2aaf48931@linaro.org>
Date: Sun, 14 Jun 2026 18:41:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 berrange@redhat.com, david@kernel.org, alex@shazbot.org, clg@redhat.com,
 pbonzini@redhat.com, philmd@mailo.com, phrdina@redhat.com,
 jugraham@redhat.com, shan.gavin@gmail.com
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
 <20260614084004-mutt-send-email-mst@kernel.org>
 <02d809b0-6396-40dd-a2c5-866028b7cc4d@linaro.org>
 <20260614131704-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260614131704-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 6/14/26 10:22, Michael S. Tsirkin wrote:
> On Sun, Jun 14, 2026 at 09:45:51AM -0700, Richard Henderson wrote:
>> On 6/14/26 08:13, Michael S. Tsirkin wrote:
>>> Yes, I think it does work because we use -fno-strict-aliasing.
>>> For bigger sizes we'll need packed because the addresses
>>> could be unaligned.
>> ...
>>> For most host/guest pairs things simply work even for unaligned.
>>>
>>> And yes, guest drivers do do this.
>>>
>>> On classical pci, there are no transactions as such and
>>> an unaligned access will be split anyway.
>>
>> I'm saying, if you're talking about pass-through to real devices, that won't
>> work. For instance, AArch64 will trap unaligned accesses to Device memory.
> 
> Presumably, AArch64 drivers don't do unaligned at all then?

Yes.

>> You need to actually handle unaligned.  Perhaps something like
>>
>>      /* Find unit to fit size and alignment of dst */
>>      uintptr_t test = (uintptr_t)dst | size;
>>      uintptr_t lsb = test & -test;
>>
>>      switch (lsb) {
>>      case 1:   // loop over uint8_t
>>      case 2:   // loop over uint16_t
>>      case 4:   // loop over uint32_t
>>      default:  // loop over uint64_t
>>      }
>>
>> with the expectation that normally we'll have aligned addresses and size
>> such that the loop will iterate once.
>>
>>
>> r~
> 
> And ifdef for arches without unaligned support?

No ifdef.  All accesses produced by the above are aligned.


r~

