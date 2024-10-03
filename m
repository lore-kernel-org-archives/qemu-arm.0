Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp59928njb;
        Thu, 3 Oct 2024 13:48:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJwg+qVPJiYUsEeMKE4/b81Ps/p4VDWL3wFO7K+YwoZmcOZ482QhoN7h+8gvsugdWjmMp/NcC+DSCrfA==@linaro.org
X-Received: by 2002:a5d:4411:0:b0:374:c4c2:fc23 with SMTP id ffacd0b85a97d-37d0eae97femr389068f8f.56.1727988527596;
        Thu, 03 Oct 2024 13:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727988527; cv=none;
        d=google.com; s=arc-20240605;
        b=SBqy4q8C12ovS6BELbt1MzazcBLMvWvyIuFE+GPvtNfnazhRsUWOKimvW44FhVl/fy
         t9kZLet7GuRL6BCjmZsRyxiYP2rS+Ny/VR+s04YPZhHUTdhkUuiY0fX1glmDAgogPIJQ
         WHIkUWkfE1a639y1uNhC7ucm5LSsnVwIg1zOXOBEjWqe8E8GTnIi5P8OJRoNZCTStDFC
         e1LXo2+1/W+nmFEvKTitdsroHXVhZJoE60zzudwhQ9HMONj9CQy1wRPTVCBjp/sTAKNO
         xZMVwI8l1+KEknWXQw8z4T0ykUh973+j+FNkK7l3b/qiDMOIDPct2yAW3vgim8LrMdxA
         iDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O+d+gREokMQfYaRx8CJFPzimuSEyThuIXy8uhC1mxxg=;
        fh=eJR4hMFMT6DaZ/eXiwYYtyK2SPF09szAVrBYhCo13y8=;
        b=jKftjjVmRrXu/RfMk8WOryGjOfOds9ob5vXywixf/8tJweVy60jteobDE7afTwtSs0
         VMP5qfrbmBU/ipcP24IyPTIQYk8u74rgCFlsw6zdBbKeTwZIV/gq2nLeYYYW6loJlwNO
         sFaYuh6o74dAo69TDG16WVbl+HuJJFlMZ+hIRxHbGl112FBV3nHu9zVaP25uhHQHbbp1
         LER/YH18hAV2Chgy3ZK9OnRDNINwc93GW6OV5LnR5IgWyDQK+4NVIXKJCf7FZ1ycgoKS
         VmCd/dGDPxc399i5CXH/qu83Ry0Az+9xwXe9Xn/9QVZnvZBN9MB32zSHWygkUgIm2qD8
         jNvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bI5y1Hdm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-37d082623cfsor558100f8f.6.2024.10.03.13.48.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 13:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bI5y1Hdm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727988527; x=1728593327; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+d+gREokMQfYaRx8CJFPzimuSEyThuIXy8uhC1mxxg=;
        b=bI5y1HdmDaEXFAzS6+XBmzu2eHRAe/cG0oIHzd6+lm6OeE158F3Z9gU+plb7mdhXId
         qVRyrh3bx3iz7UWlOfXZZSnp+nCEacbVwwZdFhevqJfcvW6R8P1n8beQRVoqoRaxdoPN
         1wJlsPC5zi8YQN81KuJlG+gJZXWQoSAACH9ADfQnyTmeDUNknlnnfXWjmob+XrVs9v+T
         /PJUN2t/0cxrwW1b+a3m0shwyoY//tDRygUegbJPPj51Q69Cmtn8pSUlQxXfID9L2mbo
         sx2K4F5sK4hKoDE0dzN3WP1712jby4z4ARwARg3j+fqshEAmREGHlLhWSpL9bBBf+xCl
         bmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727988527; x=1728593327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+d+gREokMQfYaRx8CJFPzimuSEyThuIXy8uhC1mxxg=;
        b=lgf/hy18JwSFDout6CjPv/b9YH0VrxOFeCw42ZDEL8o13XPJNGaV/5A4kfCn2tntbi
         y96tvSNCIrVqaliPLFNpLHWLV5tZzh6uIAzfU76/SbyA6tzpgfweSf5ckO6lWw8U4CQL
         nmBhr4ppjLuxEW4DHmyMyPQecsJlI+8jUErzvCDlRrqY3Weed4+sjv9RoKscJYIrY2VI
         rH/3UlKBXYrmKFtQt7Gxc22t30QLLsgs/giWHOwZb4t4pBmp/+67OmrzrIce431JuFpU
         LHvoHVdxWYkN5QDOraV1s1yAMUXv/ln33Q6qb01SiW39LS9Ka/hEVO9PmZ5pl+6jrocU
         Y/+g==
X-Forwarded-Encrypted: i=1; AJvYcCVRrMGkV5zXqmBi2TZB2Njwsdxe66bTRzAoXHBcgw5bdSa0mHuSziCdL+eDzryECyAwVDdAerxvHmxDwA==@linaro.org
X-Gm-Message-State: AOJu0YzPiJu5FUWutAx9VeEYxG9nQWtcmbS4NAMycxEKgIQnAOV235pa
	5vDNTbed2q61WgJyDgOmjtiIwq1VAYsUHMYdRfjgrz6ksB1GuF/w20XhR+3ByoWb3w==
X-Google-Smtp-Source: AGHT+IG8c01Gg0wr7F17qs/3Tk4DZlW6td1xpQdKOusZYSz0WYEDwq4Zy/CQ+LztT2I22+GmJjzTcw==
X-Received: by 2002:a05:6000:e08:b0:37c:d537:9dc0 with SMTP id ffacd0b85a97d-37d0e6d82e3mr415708f8f.12.1727988526979;
        Thu, 03 Oct 2024 13:48:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [172.33.27.23] (134.pool62-36-43.static.orange.es. [62.36.43.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f80255f01sm23489535e9.9.2024.10.03.13.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 13:48:46 -0700 (PDT)
Message-ID: <f20cebfe-027a-4664-82f0-3769c7047e38@linaro.org>
Date: Thu, 3 Oct 2024 22:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by
 stl_endian_p()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-9-philmd@linaro.org>
 <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
 <0c28a435-0af6-450f-8558-14dddc6cb6a6@linaro.org>
 <a14cd43c-087b-4a5d-b036-39aa6a80e691@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a14cd43c-087b-4a5d-b036-39aa6a80e691@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FgDWEE72AFlY

On 3/10/24 18:04, Pierrick Bouvier wrote:
> On 10/3/24 09:02, Philippe Mathieu-Daudé wrote:
>> On 30/9/24 16:32, Thomas Huth wrote:
>>> On 30/09/2024 09.34, Philippe Mathieu-Daudé wrote:
>>>> Replace a pair of memcpy() + tswap32() by stl_endian_p(),
>>>> which also swap the value using target endianness.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/xtensa/xtfpga.c | 6 ++----
>>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
>>>> index 228f00b045..521fe84b01 100644
>>>> --- a/hw/xtensa/xtfpga.c
>>>> +++ b/hw/xtensa/xtfpga.c
>>>> @@ -438,11 +438,9 @@ static void xtfpga_init(const XtfpgaBoardDesc
>>>> *board, MachineState *machine)
>>>>                const size_t boot_sz = TARGET_BIG_ENDIAN ? 
>>>> sizeof(boot_be)
>>>>                                                         : 
>>>> sizeof(boot_le);
>>>>                uint8_t *boot = TARGET_BIG_ENDIAN ? boot_be : boot_le;
>>>> -            uint32_t entry_pc = tswap32(entry_point);
>>>> -            uint32_t entry_a2 = tswap32(tagptr);
>>>> -            memcpy(boot + 4, &entry_pc, sizeof(entry_pc));
>>>> -            memcpy(boot + 8, &entry_a2, sizeof(entry_a2));
>>>> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 4, entry_point);
>>>> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 8, tagptr);
>>>
>>> Why don't you simply use stl_p() here?
>>
>> We want to remove the tswap32() calls...
>>
> 
> I think is point is that you could directly use stl_be_p, instead of 
> stl_endian_p(TARGET_BIT_ENDIAN, ...).

TARGET_BIG_ENDIAN is defined as 0 on little endian, and 1 on big one.

The following change isn't worth it:

   if (TARGET_BIG_ENDIAN) {
     stl_be_p(boot + 8, tagptr);
   } else {
     stl_le_p(boot + 8, tagptr);
   }

Maybe I'm missing Thomas point, as the xtfpga machines are available
for both xtensa-softmmu (LE) and xtensaeb-softmmu (BE).

> I don't know if your intent is to make be/le variant "private" and 
> relies only on endian_p though.

My intent is to enforce endian agnostic API uses when possible, and
use LE/BE specific variant when it is known at build time.
