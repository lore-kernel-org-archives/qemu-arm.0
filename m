Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B875CA5FCC
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 17:58:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viFzH-0003Fu-CV; Tue, 20 Jan 2026 12:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viFzF-0003EA-R4
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 12:57:53 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viFzE-0008KW-4j
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 12:57:53 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so3008388f8f.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768931870; x=1769536670; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zyNG9T6CxyJn1QssaX5e35tMUVXdK/wUfcLIas+BmYY=;
 b=mRhdKwA559G7AzLYCYDV7WTI6YimXm9feZDCEQH1NqRRWZRkcmO21P+cqbZRI1emnX
 HyyITys1pbVLye+iOq6e11t6bt1n7npkPlyIu2TqjxAR3pDflJifCyBYUoL+ahSpPvj0
 3hFg8by9wyiFcdHkigNcggZ9Mhru5uyCxBpkRRo5Z5JpQMKoT54AipyTQ/KPFExU+dx/
 yQ3766ZcFdvKLdVUWn4YpHtE1UzghzVQ7ZUL+wCPQNfxDR7FoUfQBHD7e+2sFM+y1Kx+
 cryS00yL+OCS+cSPKH1HPg0sZSZH2AwSjzUMijKn55U4Ow+t++2US2WP5eZS9BaybWOA
 J5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768931870; x=1769536670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyNG9T6CxyJn1QssaX5e35tMUVXdK/wUfcLIas+BmYY=;
 b=rTcoiMgntcyrulhM7a+sXMxQkDK92DhAYNzV3fHBhdyH7eauktMkRDwbAGByuqxc8D
 Bm5WKJr8gfqeZe/s1sn5HyX/X2dYcCaYdazwgHQHdf6VmjUiWY/CoW5o6oOIAlPoetsk
 9mpFVlL97syzhTclRocmlgzNt4UsQ+EvkM+Z0hmX71vCIevJBiW8kGSXrzBXx4shcXhi
 0q3NubkEhFnW+XJ7Fx0j3jyuRpA6PhJ8H17VVgG0u8HIkyVilmDv8ddTqnzCbSPpu7+J
 y76XvYfz9j587Px5XxM90ryC4rlpCaFqln4vu5obhbYPza27BXtoam9/0er3Qno6u7Uv
 jD6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaFNinsYA/sPkHkz0USUG2mq0r/zGW6o5BCG/NOp+azbCEmr+sIbSDcCZGNAls7/SV0dyJcp44Hw==@nongnu.org
X-Gm-Message-State: AOJu0Yy4EZqEcakz4mRyR5KvmT9h02ueA5pXJ9KCSYjoyINy03tTUnjl
 TSAh7/+PFVfUwfDA7xIJ2VWMQ3gs5H30dvs8jgRXBwkIsyP9vxogDRAlI+9sO5w6JxA=
X-Gm-Gg: AZuq6aI35kgu68eo+wBqL+uzsHprseXkAAaiCSRVxIqsVxSeZU2dK3/fqUzrCqrgzJG
 bkON9LXRFJJwL6N3q/pqXpvVmZLpXM/YRJlb99hCKOud23/hlPB0guLoecTOy6jLNeMAsFQ53My
 ZJ/GyV/CCs8ie/HR/v6FiFSlBjBL4rwETS6mx39HlswfrRwe5lQmxyat5I++zfFcIAUV+Ky2oYZ
 tHhPQbs8TVoFz24SJWd4qn7dNETsK74b1hkKk+M0qkAYnFPpZcsZgUSJBMp9Yf+S+s0z9G+b6ib
 KH/iMS2QI5hp5mG2ug1ZpS2/X2IK1OFkQPmhE+Uz6eyNbONenoOY8NFSv2VrEPw3SyQbMwwcdBZ
 dbFs9Bvpes0e3j+xs/kgXdUnp5nbEs/aga3ci8k6Ia9uWTE4ZK+miw4pCZ7lffC36MU5SGftvKJ
 BSPbMApoqEqRFLzGRPyOshVHDhz4eGfg+ixjhyl9V/dxkW+nTHBswoqQ==
X-Received: by 2002:a05:6000:ec2:b0:435:924e:3d73 with SMTP id
 ffacd0b85a97d-435924e3e7fmr3250528f8f.58.1768931869783; 
 Tue, 20 Jan 2026 09:57:49 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43596b62700sm1617505f8f.42.2026.01.20.09.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 09:57:49 -0800 (PST)
Message-ID: <595f75a4-7a85-4319-a8b2-8d5e10459068@linaro.org>
Date: Tue, 20 Jan 2026 18:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v9 2/8] hw/arm/smmuv3-common: Define STE/CD fields via
 registerfields
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20260119161112.3841386-1-tangtao1634@phytium.com.cn>
 <20260119161112.3841386-3-tangtao1634@phytium.com.cn>
 <fa73ef10-4a1e-486d-9d80-550c91eef11f@linaro.org>
 <0e71fdee-3569-4f83-afc8-46e0cbe565d0@phytium.com.cn>
 <ad975568-9ff4-420f-9b98-725d0c3e7c64@linaro.org>
 <0d1ab48f-e537-49de-b5ae-f8ddcabdd8a0@phytium.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0d1ab48f-e537-49de-b5ae-f8ddcabdd8a0@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
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

Hi Tao,

On 20/1/26 02:02, Tao Tang wrote:
> On 2026/1/20 01:22, Philippe Mathieu-Daudé wrote:
>> On 19/1/26 17:51, Tao Tang wrote:
>>> Hi Philippe,
>>>
>>> On 2026/1/20 00:38, Philippe Mathieu-Daudé wrote:
>>>> On 19/1/26 17:11, Tao Tang wrote:
>>>>> Switch STE/CD bitfield definitions and accessors to the
>>>>> 'registerfields.h' REG/FIELD API.
>>>>>
>>>>> FOLLOW-UP: Fix CTXPTR_HI/S2TTB_HI/TTB0_HI/TTB1_HI high bits width
>>>>> (should be 24 bits, not 16).
>>>>
>>>> Right, but ...
>>>>
>>>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>>> ---
>>>>>   include/hw/arm/smmuv3-common.h | 169 ++++++++++++++++++++++ 
>>>>> +----------
>>>>>   1 file changed, 120 insertions(+), 49 deletions(-)
>>>>
>>>>
>>>>> -#define STE_VALID(x) extract32((x)->word[0], 0, 1)
>>>>> +REG32(STE_0, 0)
>>>>> +    FIELD(STE_0, VALID, 0, 1)
>>>>> +    FIELD(STE_0, CONFIG, 1, 3)
>>>>> +    FIELD(STE_0, S1FMT, 4, 2)
>>>>> +    FIELD(STE_0, CTXPTR_LO, 6, 26)
>>>>> +REG32(STE_1, 4)
>>>>> +    FIELD(STE_1, CTXPTR_HI, 0, 16)
>>>>
>>>> ... not followed up?
>>>
>>>
>>> Sorry, there's a typo here. What I was thinking at the time was that 
>>> I would submit a separate patch follow this series.
>>
>> I squashed:
>>
>> --  >8 --
>> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3- 
>> common.h
>> index 6b48b5414dd..db30331441a 100644
>> --- a/include/hw/arm/smmuv3-common.h
>> +++ b/include/hw/arm/smmuv3-common.h
>> @@ -43,7 +43,7 @@ REG32(STE_0, 0)
>>      FIELD(STE_0, S1FMT, 4, 2)
>>      FIELD(STE_0, CTXPTR_LO, 6, 26)
>>  REG32(STE_1, 4)
>> -    FIELD(STE_1, CTXPTR_HI, 0, 16)
>> +    FIELD(STE_1, CTXPTR_HI, 0, 24)
>>      FIELD(STE_1, S1CDMAX, 27, 5)
>>  REG32(STE_2, 8)
>>      FIELD(STE_2, S1STALLD, 27, 1)
>> (1/2) Stage this hunk [y,n,q,a,d,k,K,j,J,g,/,e,p,P,?]? y
>> @@ -66,7 +66,7 @@ REG32(STE_5, 20)
>>  REG32(STE_6, 24)
>>      FIELD(STE_6, S2TTB_LO, 4, 28)
>>  REG32(STE_7, 28)
>> -    FIELD(STE_7, S2TTB_HI, 0, 16)
>> +    FIELD(STE_7, S2TTB_HI, 0, 24)
>>
>> ---
>>
>> Is that OK with you? Do TTB0_HI/TTB1_HI need update too?
> 
> Yes we should update TTB0_HI/TTB1_HI too. A total of four modifications 
> are needed here:
> 
> CTXPTR_HI
> 
> S2TTB_HI
> 
> TTB0_HI
> 
> TTB1_HI

I am just trying to help you getting your series merged. I know this is
v9 and you might be frustrated, but simply providing the correct 4
values would have helped both of us and save further exchanges.

In v8 Eric said to change 16 -> 24 for 4 fields and you confirmed:
https://lore.kernel.org/qemu-devel/2255d30c-cc58-4a45-974c-f7fd89694c26@phytium.com.cn/

Looking at ARM IHI 0070G.b this is only valid for CTXPTR_HI, for the
rest only 20 bits remains, 4 are RES0 (SMMUv3.1).

It would have saved me some hours checking the spec if you had
provided the correct values beforehand. I'm going to squash the
following instead:

-- >8 --
diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
index 6b48b5414dd..f0e1dd85715 100644
--- a/include/hw/arm/smmuv3-common.h
+++ b/include/hw/arm/smmuv3-common.h
@@ -45,3 +45,3 @@ REG32(STE_0, 0)
  REG32(STE_1, 4)
-    FIELD(STE_1, CTXPTR_HI, 0, 16)
+    FIELD(STE_1, CTXPTR_HI, 0, 24)
      FIELD(STE_1, S1CDMAX, 27, 5)
@@ -68,3 +68,3 @@ REG32(STE_6, 24)
  REG32(STE_7, 28)
-    FIELD(STE_7, S2TTB_HI, 0, 16)
+    FIELD(STE_7, S2TTB_HI, 0, 20)

@@ -128,3 +128,3 @@ REG32(CD_2, 8)
  REG32(CD_3, 12)
-    FIELD(CD_3, TTB0_HI, 0, 19)
+    FIELD(CD_3, TTB0_HI, 0, 20)
  REG32(CD_4, 16)
@@ -133,3 +133,3 @@ REG32(CD_4, 16)
  REG32(CD_5, 20)
-    FIELD(CD_5, TTB1_HI, 0, 19)
+    FIELD(CD_5, TTB1_HI, 0, 20)

---

If you disagree, please post a patch on top to correct.

Regards,

Phil.

