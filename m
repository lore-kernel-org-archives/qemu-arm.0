Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D6C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:19:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uecBW-00065i-Gq; Wed, 23 Jul 2025 12:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uecBT-0005vJ-GH
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:19:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uecBQ-0005yJ-W9
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:19:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so77804535e9.1
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753287547; x=1753892347; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cWi1xg6TqVJV9Q3V1vDbJp1BsIWYYwrENbU8rPFEc48=;
 b=gYhrZlbG7BDF57GdVCsIr8CC0Lq2v0nb+KtFCozAHakE6N5774B7OIr5BxYjrlmYdc
 PXw0S/SKgkwO04zLNBI+3IiDspZwbdwk2yekX/xkSfspHLDmB/ErREbL2jbPTQgPEnxX
 eRtiYMSpeyG//m3IoLTxs2CK6/ge2eqBTPvOTbddJbmwca+A+kAdMaytt+v9B2Bu/57M
 MqQamLOeMfS3riFwa7AaZBBf9etgEPG2Aq09egQr2nvItRGNvYiT5Vd4UC1rm765V4s3
 qzjyX2l2NW7AsYHrppcivgVKhmBukS+PI8kOCX87xLNPQDUAVwAbW+wf41O/W2d/V0+s
 NsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753287547; x=1753892347;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cWi1xg6TqVJV9Q3V1vDbJp1BsIWYYwrENbU8rPFEc48=;
 b=TbV1bM6TkpqeqbHUTsNvCjokhr76/r2IjwAACtoP1G9NhyOA2GXp5UsO3wq4C7bZ2Q
 lEnRYSczWK57/4rMk7cRBpoiFMhgsMKJz5Yth7pFvps9QBI8dZ8q2xlfKoRbpywXAQU5
 p5sQcb1ytAeTvMX3e05I+M8wWsXfWDtCgYHzH4kSMTi4KmgRE2F7Y7H2bTsJtdbda+Ap
 frl4tJclfPfFSSKdjUPSC/CJN5G51NFQbjzySbFo6KgNTSnvirY/mxRd82c6w7ds4UBK
 879I8ttUCHuqXQlVI2MCZW3MQZDK7loVTZB+8sIMaYklsRszdlwOO6xpD2JC5A1T9yLx
 HQ3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt9DgvhUH19sdUSqGKzzlaQ4w58cwTs5Oazi97WZS/R8huifVAn6Ivp50KygOYHjxePm1PiLS+Ag==@nongnu.org
X-Gm-Message-State: AOJu0YyCm31cHdkZKdmCOowOznmVbfEhsDTOXnxH7xm3Mm8mbQ1LcsLV
 NjBmNE+8gOGWypTHP0f9v2z4iGWb4q7mqUZXz2PldUbGNvz0DvNpbWSVURmNKvsrpww=
X-Gm-Gg: ASbGncvAAakvonAZVy20/87bObblQkWxyTBAKuinJfkynlY6u2BXTAqKSTAIGhB765I
 CHdi3AMdC0HiyPYyxxvkTGdVRGJMI8uPD16nDGd/Bg7FexrpXIxjIaYG1LWOL2ezN78FPu35WpC
 5fVMVqAkblkRdRLjFzeHfIasyhed7eCdPeAP4sZdTCddAD7AuU2hPvRnuby0O6Pf5tfuvGlpDNt
 8LoUajrXo2zMypQZfPuOjlqgieBFD74Cl/HFK0nxDpq9WRARPIrGLDCgYsUDfSR1K0G8+4bhBFp
 hPomsxHG/pKjlUDvZVP9BTzBvnVOws5bUG16fKX0ImiVrkfdWqOWkolsTqsUNG2lgUpunYlePKo
 WYt5/flddtDXBDNKlYLnMX+4zaJy4Bkb9FH6FZphIVtDlH23CBrXi46gOxDo9ZPK3EQ==
X-Google-Smtp-Source: AGHT+IEXEMGg5xs/yyxPHcDZhF9g5nIvzjn+zvmuny0Ia6ajv+Oj9VxRvR/CrN5BMb1Hzc/z9xASbw==
X-Received: by 2002:a05:600c:198d:b0:453:483b:626c with SMTP id
 5b1f17b1804b1-45868d256a7mr27246935e9.23.1753287546599; 
 Wed, 23 Jul 2025 09:19:06 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45869180a00sm28100955e9.3.2025.07.23.09.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 09:19:06 -0700 (PDT)
Message-ID: <bb780015-f5fa-4036-972c-a233b2b2af52@linaro.org>
Date: Wed, 23 Jul 2025 18:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v4 3/4] target/arm: Create GTimers *after*
 features finalized / accel realized
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250723135156.85426-1-philmd@linaro.org>
 <20250723135156.85426-4-philmd@linaro.org>
 <CAFEAcA9HMvDjKa06iWMUTYsmM6zPQJZ3fAcZHcyF_pwa5pczvQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9HMvDjKa06iWMUTYsmM6zPQJZ3fAcZHcyF_pwa5pczvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 23/7/25 18:00, Peter Maydell wrote:
> On Wed, 23 Jul 2025 at 14:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Call generic (including accelerator) cpu_realize() handlers
>> *before* setting @gt_cntfrq_hz default
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
>>   1 file changed, 33 insertions(+), 32 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> (I think my previous misgivings about this patch were due to
> not looking closely enough at it -- it looks at first glance
> as if it might be moving the cpu_exec_realizefn calls above
> more code than just the timer stuff, but it does not.)

I agree the default git diff output is misleading.

