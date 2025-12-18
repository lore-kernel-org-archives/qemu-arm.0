Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF46D6ACFB
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 13:31:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWE6Q-0002Zb-Hk; Thu, 18 Dec 2025 08:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vWE6P-0002Yz-Lr
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:31:33 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vWE6N-00060C-TT
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 08:31:33 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2a110548cdeso8186825ad.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 05:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766064690; x=1766669490; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+wZ3OFIFwDhWAvFVRe/6gGrrEOCyGvi30WTWWhtxl/E=;
 b=On6TqE/sX5ohJ9TvzF1l8q402QrnaxYVclkp8Fvv8asINCg6R4oYOTQWRUDnNOSIIn
 gIx3mvTf2BF5wBWfz6KKgXVUOl3l0W4sSEs4qetyiIxfq5jKb2bAwOmvV298G7nUhMOi
 5zPqiqU67peVgI51i5CQ9EokronUxCAOjaGrAzecreEd13Lbld616h89zfVRIsc7Z4v7
 ybDGnV9EqjUTxJRIHLRrmaPX+7TdooAkb59Nuutq/AWXW84wl5z94ybdkuPzlhiMvHEC
 8TS3cz38VSbM68rj+XOlpT7DsdBV9K64zQOFOX96hcRGVvpIfBN3RpLSGR9xmHFa5a7H
 j1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766064690; x=1766669490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+wZ3OFIFwDhWAvFVRe/6gGrrEOCyGvi30WTWWhtxl/E=;
 b=gaiD1mIdUWOyRCdOzPhVMQifZiU7pRn6YKGdWc3xzu2DOQw/ZV59v3t8C9izhnMt7N
 voghgKQgBgQjVD6gr+71smWknthveKPL9qv/w1kSh796JBHEhnTfb9VmCF/r14QwN0v2
 6d2Rk9eIC82417vfKmDHm+eLCoABV7puA80JMZrepouikm756zNWOY1ixvVltWfFwWvD
 nFA+Apr0wc2B6u7UPy8A9hjj52XDGeSu8bKvlGNL4XHbXpGxfUBREDgLrg81LZ8YPYIK
 XYiZl8PNCntFxdW9tRss5XakPtHEEHss8F69MQK1WWe2rhNRSAwclngyWP4PRQ61w/Kr
 Q1qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSiSYj0g7Ou2Jh2XQ48jCaIsgBubMENdeCvs4sZgk0/lJSQDsMPYukgJsz3fGWpkyv+liXPS0qWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/ellvCA6e99V+6fRMBYm0b4k8OgmEZwiorcjqRw0gm7eOA63D
 APG4Y+mjqJb2r9efTVD/zLUjTYT3uhF0Dz9DiDab7y0K6U8S1JzdL14tll87U7+2kp8YfO6XJ0a
 2KpBN
X-Gm-Gg: AY/fxX6W7C/Mi+hiaMU5mAu5Cwu6Q0WL0aj5JsKcIcmZ1DJlWCpmNt/f7KHwrdYKbYn
 YN+CAAQqfSE6PpSMmNULnwpbn+ber1VE35E1s5gAB7eRIlXY75CGG2cxMD/fYZefy+c0dHAJnwJ
 t5lRMD2F6GkLFh1kBSx1Um1olmqP3QCsv6L0jn3a2KJS/U/LG4a9tcA5lQAFYn9yoWfdz2gEPRe
 ukj3PuZYyhPAD2m8PWwaTF2RYoRC1ylsVxD02KAtQOj/uuZakfBC/rXVc2upY8TfJkktATwpby/
 0FZlnIGnl9Uh/5BM6QSsHonfc68rZ55vU6gSlay9viB5uz4EGNVPskqh11IbEpCFjMxzMV/eJML
 1MKLI2f9+fWJXYTj1W5SbGjM5L9XDe81HeeD+ldBiIZVXEZnr1gEkP2n9fT1OCSbTnc48d0Jjci
 vEc6B5idLhInkvgiAAk2xQ6w==
X-Google-Smtp-Source: AGHT+IHh/0S1XrknQmgrMdoy9uj7NBQ82STDKLS0jCzvTVDK8bRNSSF//8txDxX5K3a2evLwsxwH9w==
X-Received: by 2002:a17:903:3884:b0:29f:e787:2b9b with SMTP id
 d9443c01a7336-29fe7872d28mr201437395ad.41.1766064690043; 
 Thu, 18 Dec 2025 05:31:30 -0800 (PST)
Received: from [192.168.0.102] ([191.8.216.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2d087c839sm26155815ad.9.2025.12.18.05.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 05:31:28 -0800 (PST)
Message-ID: <be2e8028-6d30-4b7e-8a51-af00af15e2ff@linaro.org>
Date: Thu, 18 Dec 2025 10:31:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] target/arm: Add a _MAX sentinel to ARMASIdx enum
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org, peter.maydell@linaro.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20251217212018.93320-1-gustavo.romero@linaro.org>
 <20251217212018.93320-3-gustavo.romero@linaro.org>
 <cb5eca6e-23c1-4134-9145-7030bc10b649@linaro.org>
 <CAAjaMXbsH_EimcS7SDMYaicrWKt2OYCUUapy4Uab1kfVO-x7jg@mail.gmail.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <CAAjaMXbsH_EimcS7SDMYaicrWKt2OYCUUapy4Uab1kfVO-x7jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x633.google.com
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

Hi Phil and Manos,

On 12/18/25 10:00, Manos Pitsidianakis wrote:
> On Thu, Dec 18, 2025 at 9:21 AM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Hi Gustavo,
>>
>> On 17/12/25 22:20, Gustavo Romero wrote:
>>> Add a sentinel to the ARMASIdx enum so it can be used when the total
>>> number of address spaces is required.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> ---
>>>    target/arm/cpu.h | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index 39f2b2e54d..00f5af0fcd 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -2336,6 +2336,7 @@ typedef enum ARMASIdx {
>>>        ARMASIdx_S = 1,
>>>        ARMASIdx_TagNS = 2,
>>>        ARMASIdx_TagS = 3,
>>> +    ARMASIdx_MAX
>>
> 
> My two cents:
> 
> Here, "ARMASIdx_MAX" should be equal to the last variant, 3. So to get
> the total count, it would be ARMASIdx_MAX + 1.
> And it should be called "ARMASIdx_COUNT". Max is the last variant.

That makes total sense to me. Thanks, I'll update it in v3.


>> The problem with including this in the enum is this confuses static
>> analyzers:
>>
>> warning: enumeration value 'ARMASIdx_MAX' not handled in switch [-Wswitch]
>>

hmm I guess I missed it because my test pipeline didn't check for it?

I've used QEMU_CI=2 to test the series. But I guess one needs access
to a pipeline with Coverity enabled? How can we test for warnings like
it in the CI?


> If we add a "MAX" instead of "COUNT" variant, then the value of the
> MAX variant would be handled in switch cases.  The following
> definition does not emit a warning with -Wswitch:
> 
> typedef enum ARMASIdx {
>    ARMASIdx_NS = 0,
>    ARMASIdx_S = 1,
>    ARMASIdx_TagNS = 2,
>    ARMASIdx_TagS = 3,
>    ARMASIdx_MAX = ARMASIdx_TagS,
> #define ARMASIdx_COUNT (ARMASIdx_MAX + 1)
> } ARMASIdx;
> 
> int main() {
>    ARMASIdx t = ARMASIdx_S;
>    switch (t) {
>    case ARMASIdx_NS:
>      break;
>    case ARMASIdx_S:
>      break;
>    case ARMASIdx_TagNS:
>      break;
>    case ARMASIdx_TagS:
>      break;
>    }
>    printf("Last = %d Count = %d\n", ARMASIdx_MAX, ARMASIdx_COUNT);
> }
> 
> Outputs:
> 
> "Last = 3 Count = 4"

Nice :)


Cheers,
Gustavo

> 
> 
> 
> 
> 
> 
> 
> 
>> To avoid that we /define/ it manually instead:
>>
>> #define ARMASIdx_MAX 4
>>
>>>    } ARMASIdx;
>>
>> Usually the definition is within the enum declaration, and we name
>> it ${enum}_COUNT:
>>
>>       typedef enum ARMASIdx {
>>           ARMASIdx_NS = 0,
>>           ARMASIdx_S = 1,
>>           ARMASIdx_TagNS = 2,
>>           ARMASIdx_TagS = 3,
>>       #define ARMASIdx_COUNT 4
>>       } ARMASIdx;
>>
>> Unfortunately this didn't work well with QAPI, so we could never enable
>> -Wswitch globally:
>> https://lore.kernel.org/qemu-devel/20230315112811.22355-1-philmd@linaro.org/
>>
>> Today I'm not sure what is the best style anymore, so just take
>> my comments are historical 2 cents.
>>
>> Regards,
>>
>> Phil.
>>


