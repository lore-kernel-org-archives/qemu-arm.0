Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C3CFED3CD
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 13:54:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGGzS-0004Bu-Ai; Fri, 24 Apr 2026 09:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wGGzP-00049r-0t
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 09:54:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wGGzM-0002ru-DU
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 09:54:38 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488ba840146so70830855e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777038873; x=1777643673; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ty9h+ZYk6jAUeMMG5fjohOSnEAHIpxjQWLk+t2TduXA=;
 b=Uu23wpniZUIJe1Siwg8pBCvKg54Uq8/LRn7l3stS8wefwP8cIx6TUkAJkIAnQt4VFm
 C6ro5TVu3y2+kL04I34o3iWj2VxVzvBj4rEul6Yl0Cjh/G13jFqX/ZFoNUw/ODcDS8dl
 6QIgObFJCeRqucnV5ElAPBvCgoF7Y4W/OnXvywIOv2PSizllTesnfV5VT1+ZTyjgR8e/
 5KYU21/QnZTDf2c5nNGTuz+sSLlx/t7sCpj6Ers0JeeeZmaPnC9JzI7KJsBFirgStRLR
 UXp+5qeywfeMQIAfpiZmhhpiKbE5Uc58OfseXtsDWgJUjaboZDLOn05123G1ZK2yZaz3
 kR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777038873; x=1777643673;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ty9h+ZYk6jAUeMMG5fjohOSnEAHIpxjQWLk+t2TduXA=;
 b=Opgf7n0w42mEO6tvEO+iddu9m+9zEzdnxkGLoNVnH8sytsSkVpyfVFVmAEG9yZhl3q
 GMPeNeq+0IibXXhWM2JIqD4OgMfJsT85GB4FNsSWfOxS4arfx8wB9sSVYDlDBkAFtTCo
 VEibWa35Z+A5d2vzxLlRUp1IwGlsxCAhDTL8+RRp6yGjPDco+xSXDJIF4yzuZJQcEc47
 VqYHjyilgwK7DQ0omxw4lTFtqnD/Dal/r7UrLUoXhLc8u0SOiaxNvQkng06rwrpSLxEx
 GPcXG+JpLws8v1tYzN0BqdLhVjjMtIBKIIJlbuhAKBqO+4+aFwyqx3MPLzB27bGesJLK
 aLyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9+fNHlTYqBAqhunuXhgnOjYVjp6fTv/GMPNcXNhXaeLnJHXYswCNH4eYwk6Bi+BFCMlZeTmuFwg==@nongnu.org
X-Gm-Message-State: AOJu0YxzOBTcmZ9vze/zzHiku3LFOgziVZ/38IU2e1uIAK0vjKNQukwx
 Rsynx16R/P7EetsMq3+SkUDwrPBNP7otAuszCMM+QPgx4ySym+UY4lmgRsNvFOoOSS0=
X-Gm-Gg: AeBDieuUH/7CLrz6oAaH930S0v4+Vj1ye7YHDmitseery8QGYfwUs2xr1WvYe73wNJ0
 2zWPFD7Taq+qaqQDtkb6t67neteczRKq7WRPAYfF6arfC45Hsn8Aqo/Eq5ADYYWEpSeu0dAOg9u
 30RZion8JvmuwwxYdoFBZWSo8Uh8/zDta+ti2DgtDptcja9yOrvXMJQT/5abGkyNyPMLAkSjrxa
 7dpoIx/kVXdN5FEjckGUrULSxisB9WOPxC/v0g7K6RdGOV/ax+SdYM1xD7rDmiFf6Yx3jD9Lgyu
 GDlV5zz5XizhEdwKgbXBSS/i7rb7uhDekgaISJlBaYrAMqWMq5r5vvz6TQ6TFZSdi/bJqSd22DC
 PRBub+Yvr+eKsFzSy2b1SCHI1WCjuW2vFhusvQici9ovLVj4OKfl6MP2UM0DPt5bOXxfAZ/KyqJ
 /4feu8ANt8OEZQhGrggM2pc/0YpvPG/pAiQQOL1FHzoimbayAc1osHCYMk0BCWTBEM6DeSdTyxx
 sAg
X-Received: by 2002:a05:600c:890b:b0:488:a977:8d6 with SMTP id
 5b1f17b1804b1-488fb775a35mr336928405e9.19.1777038872614; 
 Fri, 24 Apr 2026 06:54:32 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc177dafsm719952305e9.4.2026.04.24.06.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 06:54:31 -0700 (PDT)
Message-ID: <2bf9724b-4b29-49b7-ac97-f7130056583f@linaro.org>
Date: Fri, 24 Apr 2026 15:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] tests/functional/test_aarch64_kvm: Stop dumping
 kernel ringbuf
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Mads Ynddal
 <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20260423170229.64655-1-philmd@linaro.org>
 <20260423170229.64655-5-philmd@linaro.org>
 <4072248e-a815-4868-80bb-a241496ffc78@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <4072248e-a815-4868-80bb-a241496ffc78@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 24/4/26 09:39, Thomas Huth wrote:
> On 23/04/2026 19.02, Philippe Mathieu-Daudé wrote:
>> Avoid the following kernel message to interfere our stdout parsing:
>>
>>    platform gpio-keys: deferred probe pending: gpio-keys: failed to 
>> get gpio
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/aarch64/test_kvm.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/ 
>> aarch64/test_kvm.py
>> index 7545f5ed554..a03a6134626 100755
>> --- a/tests/functional/aarch64/test_kvm.py
>> +++ b/tests/functional/aarch64/test_kvm.py
>> @@ -48,6 +48,7 @@ def _launch_guest(self, kvm_mode="nvhe"):
>>           self.wait_for_console_pattern('buildroot login:')
>>           ec_and_wait(self, 'root', '#')
>> +        ec_and_wait(self, 'dmesg -n 1', '#')
>>           ec_and_wait(self, f"export PS1='{self.PS1}'", self.OK_CMD)
> 
> In other tests, we are adding "quiet" to the kernel_command_line to 
> avoid this problem - that way the kernel messages also cannot interfere 
> with the login prompt. Could you check whether that works here, too? If 
> so, I think I'd rather prefer that solution instead.

I tried:

-- >8 --
          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               f"console=ttyAMA0 kvm-arm.mode={kvm_mode}")
+                               f" quiet console=ttyAMA0 
kvm-arm.mode={kvm_mode}")

---

but it didn't help. Anyway no worries, I'll figure that later. Dropping
this patch for now.

