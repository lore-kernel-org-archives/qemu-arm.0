Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2246848ejb;
        Fri, 8 Dec 2023 03:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh802HrwsfsPDQ9zD6uQg/F0htDacnWcdOLXBN53+Yk+sWDDLW+wLckJ6oAj3DmS+57E6T
X-Received: by 2002:a05:620a:2146:b0:77f:2cae:c6aa with SMTP id m6-20020a05620a214600b0077f2caec6aamr2876276qkm.119.1702034265772;
        Fri, 08 Dec 2023 03:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702034265; cv=none;
        d=google.com; s=arc-20160816;
        b=GG8/PcgXpvE+CbV8zdz6uUIuQTC+YstityZeRLkfzl8cNBO0OV5BKKHvheLKqNmwEF
         R9V65NUci0VNM4yBYjf4OHK6VyopzZwZOcJhgM0VIz4yiBNW0HhV+dqX+icDoN0OEXs4
         rawzHVqVuoXtTpBSMkHkRBGYXeT5thUjDj+EMFCXdrTOcNFj8QhBDDeuYhIHl38DKw5p
         ExDykZM/NjrATsEdvwJh3qqpQEkEYpCFqy+4xGdmtCHAmTDh82iGxFXL0TUKRaur0DHo
         +vfRt33qSkJDseh+gqc3fdK7OYbTq+wAwmrFKxxcqyGfquXMNtxF1+VAh3X4LjCUZXy4
         sWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=liPitGupZmn0k45YRnLxeP/+73+0AA8+GG9ZhJMaDYs=;
        fh=vlyiCuRd7nih/ZAoOYbOrx9frFSGjbuW4CV6w9CgBNw=;
        b=U4HSZZiAd+/QtZ9SHgkJDc9fVg+N+ucmsivS5flCSWBtrYhbu7/6m7JQKfculqLj/9
         vrL0lmqrnmcG/TVieYS+z5JFKfp1PXdkeVgs19PkVpxIqJRI+4yQAi9HAO/fDvnX9n4J
         tIxkVt0NXRTF7ZrXkfYPN/MI/K3p2BGHR/PvwHbqKeejIzhu0LOjarBDkm7ATXkj+w+g
         HlhBdMuB0a5NrOQiYCsxZQSsq4PU+cOyGuZvsVdogP5yH3utprFHw+eOFf7oXGR30V1q
         tGqR60wR0wyOk4zx4iFykbIaevKgqaN44cPjNFcXKqfftmiwTDFvzRxJTlY++rZG5B+t
         76eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wzr3six7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05620a404300b0077dcddbb964si1867943qko.313.2023.12.08.03.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:17:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wzr3six7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBYrO-0007Ut-9n; Fri, 08 Dec 2023 06:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBYrM-0007Uk-Ub
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:17:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBYrG-00036N-OP
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:17:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c25973988so20998175e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702034245; x=1702639045; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=liPitGupZmn0k45YRnLxeP/+73+0AA8+GG9ZhJMaDYs=;
 b=wzr3six7/6RSh+snLzwCj9nPs5wuFkPrT8+kgG6ph5xc7BZlUAMw6q+6CUcZFKCAcZ
 ihH2rK+OfJLFdSBBhpMerMs4rbir0sZlIY+XTHdr8H93j+mMDuS4U179HXRa+zaRm1g3
 f80w0mIQTtl+6xR3AiKlTmA1/iyH7yNxT2zRFP02IRcJdr936MYAkT+YI4VyK6fHL+0z
 zUCFTVEeYbmfGrRV6TBvDSKnYCYwxdzwtit9J4bjSTdFWmrHlQORcMS6JTcnCW1uJG37
 LiBWWDAEXVjvyip2xB4PoHrqna3ioYKJDCHWVoSwr8kaHzCIcg8DVUWBhdtyqlie7H1/
 es5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034245; x=1702639045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=liPitGupZmn0k45YRnLxeP/+73+0AA8+GG9ZhJMaDYs=;
 b=AjxDqVpWF3Fl3UWSqsz+OBUAMwaJzq+lq1+H/jhA3i/BMZv7KeJ1OOuBl9MAat1OSI
 xuUPdS++T5H4j09ek+aAwggGioGZy5gA51Tntg2/GgF/8hp6la9AgIj8uG5U/ULOiCFp
 bQtSMF2st1UAAaF6CfHNYR1WOvZGLV/kkmFZcXHog8ubctZw9wUT51k7AYzNHuafAvwh
 wWmWB7a1wQAVn5wzU+sHTAtwRrBH0XCnqCuihds5Vcfe2baq+s8PH4Vx7pQGjf2n232R
 EsOTxcWDJRymXXVjYhsMFUim3uqe1spxqb4TBh+T2i4deA5kZp9BKlUMtiAO4ygLLO0I
 fVoQ==
X-Gm-Message-State: AOJu0Yxl+W1aM87kPvi9+zFMre4eISFUotTGNKIocQqLwJDNi+ibKLQ7
 wHAdE6X8nmZEvWWs7olTF5YOlw==
X-Received: by 2002:a05:600c:1906:b0:402:e68f:8896 with SMTP id
 j6-20020a05600c190600b00402e68f8896mr2353407wmq.0.1702034244906; 
 Fri, 08 Dec 2023 03:17:24 -0800 (PST)
Received: from [192.168.69.100] ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 ay35-20020a05600c1e2300b0040b2b38a1fasm2601162wmb.4.2023.12.08.03.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 03:17:24 -0800 (PST)
Message-ID: <0c5b33a6-3f0d-4bc2-9627-da04d202b5aa@linaro.org>
Date: Fri, 8 Dec 2023 12:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] system/vl: Restrict icount to TCG emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-5-philmd@linaro.org>
 <83f260a3-68e5-4041-9e92-d8250c327cf8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <83f260a3-68e5-4041-9e92-d8250c327cf8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZNhDj/a3k+F7

On 7/12/23 23:38, Richard Henderson wrote:
> On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   stubs/icount.c | 6 ------
>>   system/vl.c    | 6 +++++-
>>   2 files changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/stubs/icount.c b/stubs/icount.c
>> index a5202e2dd9..b060b03a73 100644
>> --- a/stubs/icount.c
>> +++ b/stubs/icount.c
>> @@ -1,5 +1,4 @@
>>   #include "qemu/osdep.h"
>> -#include "qapi/error.h"
>>   #include "sysemu/cpu-timers.h"
>>   /* icount - Instruction Counter API */
>> @@ -10,11 +9,6 @@ void icount_update(CPUState *cpu)
>>   {
>>       abort();
>>   }
>> -void icount_configure(QemuOpts *opts, Error **errp)
>> -{
>> -    /* signal error */
>> -    error_setg(errp, "cannot configure icount, TCG support not 
>> available");
>> -}
>>   int64_t icount_get_raw(void)
>>   {
>>       abort();
>> diff --git a/system/vl.c b/system/vl.c
>> index 2bcd9efb9a..8c99c5f681 100644
>> --- a/system/vl.c
>> +++ b/system/vl.c
>> @@ -2270,7 +2270,11 @@ static void user_register_global_props(void)
>>   static int do_configure_icount(void *opaque, QemuOpts *opts, Error 
>> **errp)
>>   {
>> -    icount_configure(opts, errp);
>> +    if (tcg_enabled()) {
>> +        icount_configure(opts, errp);
>> +    } else {
>> +        error_setg(errp, "cannot configure icount, TCG support not 
>> available");
>> +    }
>>       return 0;
>>   }
> 
> This is called before the accelerator is chosen -- even before the set 
> of available accelerators is even found.  Indeed, that's the very next 
> thing that configure_accelerators does.
> 
> OTOH, I don't see why icount_configure is being called so early.

See commit 7f8b6126e7:

     vl: move icount configuration earlier

     Once qemu_tcg_configure is turned into a QOM property setter,
     it will not be able to set a default value for mttcg_enabled.
     Setting the default will move to the TCG instance_init function,
     which currently runs before "-icount" is processed.

     However, it is harmless to do configure_icount for all accelerators;
     we will just fail later if a non-TCG accelerator is selected.  So do
     that.

But few commits after we have 28a0961757 ("vl: merge -accel processing
into configure_accelerators"), so it shouldn't be an issue now. I'll
consolidate.
