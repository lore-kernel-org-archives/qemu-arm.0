Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp81775njb;
        Thu, 3 Oct 2024 14:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUthumPN6ZMYdCiFVjtcYC3D9eueZvFQO9FltKRv7Ywhz5sZOyHTkZBArmTPhsm3iCL8ACpeNc/ZIyrjQ==@linaro.org
X-Received: by 2002:a05:600c:35cf:b0:42c:b62c:9f0d with SMTP id 5b1f17b1804b1-42f85ab87cdmr3779125e9.17.1727991645370;
        Thu, 03 Oct 2024 14:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727991645; cv=none;
        d=google.com; s=arc-20240605;
        b=RqEZ5J8PR1c35GICLL2xjL+XitZSTM7sGXodCCWMk5Z4wPKpGGqrw17wjjCHKUi2ad
         WSzgVgwlFJfX1ut0dC/0D/Gucc0g5tcmBEBqn8G07IyVVdjpoq+E5NtrVgjgLnk+k4+m
         Bj4Xs6OhU9bmu7QbGnzd1SfcclCd+ILyG5KzUWzlxDDj2fqVZFQhJp/TRw40cKrxmxLv
         cXI+KU8uPnKsC0ob8BRymFfFIG0mL+JsByWqdf6NqcLYkazeaQUR1161qf0VblaarYp7
         vLftef/eOE0DZHFDCutyQrHiRwZqE4diFq4BIet7TKrrAX6AYi6Q0WfPZbxYVzIpxpgQ
         C+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=j0JkjeW+iwNR/9umx1xyK0/ZhR/7AWfTopD/a4EHWsg=;
        fh=y+fZOlfzK5rmEmJRpZ9M+Nn11hkaEDLKPNZMmOX4R1s=;
        b=ImaSTqTIpfRdZDwE1wDP4INy7Zpu4fLy+cKDm/wZmZJuv9OQmY2qFhzT0R8TcJNmSi
         9iz9p/ikhO3/sunxtS8cyC2rlPmWWwsyW5cfk1DYDtOAXtLc4cZHDaHu2+VdxUnN6Pq+
         9wscJgQpR2wmvkyY7BWSOFLhpsBkGAWLgATz9uCCiFuKBt9ITf+bXlqIA6R95bI58qY8
         wysOcJHhJqMA4XtorZRLrCPpaVutsDCFQ4R8YSqDIo5Q3VS1+x06XtNMnbmU/Yli6Zoq
         e2X7l64hmdCvjCj2bYiVLMEW6gkIn+V9ywPtqeNzyS7cyfMYHO7bTd+B+asXqRiKKrat
         Srkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NaZfky8K;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f80259ab1sor11845455e9.3.2024.10.03.14.40.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 14:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NaZfky8K;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727991645; x=1728596445; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0JkjeW+iwNR/9umx1xyK0/ZhR/7AWfTopD/a4EHWsg=;
        b=NaZfky8KvQDYY+OQ7/Z2gHEA57JnFAysWjMKBzIvHlLtYulBhBLy75o95i+keQHwAQ
         TlmzTw5V/PIhVWJIriiHa1d0QIiu2q5xM7OA9BkPGOBCnA42RSwzEQ04kLFMvgndQjAJ
         O5iukJQTqUZbc6qBoHnRjlgrLIokfFgIqmAp11zodcNEfpJGS9SlMxMRC2c++UdqoBAv
         JmE/ceeIYKGcoRwQZcWajA8d7xEu5QysikQeQdeuS741syPR1fKKgkA8qwyFYiAFwbqG
         llrqXq4HIRlQUBZ1ryAOhcfrPZDJ08siLR0gw9GPPrUCVemDiE67xSMU2rV34U1SSg5k
         oIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991645; x=1728596445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0JkjeW+iwNR/9umx1xyK0/ZhR/7AWfTopD/a4EHWsg=;
        b=smMrZ9IXaIi0R3eSXVasKgNV8uJS5zBGhzQ+e5hng6uo8GYox2QlTVxAVgMhu+Nr94
         zyT5lAlqsN898eA87o1SfsOpIpviISpmBZKz/QJ8ynXctKD30aaVf0TUii85mO5++Lwg
         DXiODikbKH4ELmZqLlM4P84Rp9lCdNK8oj7G0erkaZ4sngAZd4HsTdhj14iQNeuWTniB
         o8/aAQKq9k0TIi987UzdcWpDmuXXabJIsLVbZ/HeItYc/rKi3pAbGEGcTRR3XDSlhKv4
         7ef8Bu3Qf4PkW+9GXSw2533SnP7svA4mmx1EmmHUxnbvMnfmT0fc9ymfO3Rg3q+BEqXI
         WbYA==
X-Forwarded-Encrypted: i=1; AJvYcCVUEdhPvzgaEgRsRtV5q5eBosI7OlbXpE+LgBErBODoNyqJBAp+hxzs3BLvu+AWsWBqif4C8WWCL3h5CQ==@linaro.org
X-Gm-Message-State: AOJu0Ywu01W/sMnaBWT4KpZre7u8FMfyz7W9NFO9scO62Fb/vkrpJBvS
	A8oJpXDw9LikX9wJy8mOhs0t+DyUblfmdSiiZZAuNLvzFJVdOkqtUevFXYZFeB7F2pQqHuSnIm1
	vWahqlg==
X-Google-Smtp-Source: AGHT+IFmxK7ExvMGjbeooa/S2st3bhrbhsOrS0Cr6n9lWkHr+3z60Xtz+EUrbhIlcwudW09hcQbgvw==
X-Received: by 2002:a05:600c:1f96:b0:42c:bbd5:727b with SMTP id 5b1f17b1804b1-42f85ae974emr3461645e9.25.1727991644750;
        Thu, 03 Oct 2024 14:40:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [172.33.27.23] (134.pool62-36-43.static.orange.es. [62.36.43.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f80255ee9sm24163045e9.8.2024.10.03.14.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 14:40:44 -0700 (PDT)
Message-ID: <a1a67f7c-553c-42d4-b852-2cc26e7181a0@linaro.org>
Date: Thu, 3 Oct 2024 23:40:42 +0200
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
 <f20cebfe-027a-4664-82f0-3769c7047e38@linaro.org>
 <aeb88605-989b-4c26-9371-15fbe44a9e3a@linaro.org>
 <46ea20fd-c6bc-411a-b8e2-ab7179c00185@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <46ea20fd-c6bc-411a-b8e2-ab7179c00185@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mfCKBTy+l1xD

On 3/10/24 23:34, Pierrick Bouvier wrote:
> On 10/3/24 14:31, Pierrick Bouvier wrote:
>> On 10/3/24 13:48, Philippe Mathieu-Daudé wrote:
>>> On 3/10/24 18:04, Pierrick Bouvier wrote:
>>>> On 10/3/24 09:02, Philippe Mathieu-Daudé wrote:
>>>>> On 30/9/24 16:32, Thomas Huth wrote:
>>>>>> On 30/09/2024 09.34, Philippe Mathieu-Daudé wrote:
>>>>>>> Replace a pair of memcpy() + tswap32() by stl_endian_p(),
>>>>>>> which also swap the value using target endianness.
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>> ---
>>>>>>>      hw/xtensa/xtfpga.c | 6 ++----
>>>>>>>      1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
>>>>>>> index 228f00b045..521fe84b01 100644
>>>>>>> --- a/hw/xtensa/xtfpga.c
>>>>>>> +++ b/hw/xtensa/xtfpga.c
>>>>>>> @@ -438,11 +438,9 @@ static void xtfpga_init(const XtfpgaBoardDesc
>>>>>>> *board, MachineState *machine)
>>>>>>>                  const size_t boot_sz = TARGET_BIG_ENDIAN ?
>>>>>>> sizeof(boot_be)
>>>>>>>                                                           :
>>>>>>> sizeof(boot_le);
>>>>>>>                  uint8_t *boot = TARGET_BIG_ENDIAN ? boot_be : 
>>>>>>> boot_le;
>>>>>>> -            uint32_t entry_pc = tswap32(entry_point);
>>>>>>> -            uint32_t entry_a2 = tswap32(tagptr);
>>>>>>> -            memcpy(boot + 4, &entry_pc, sizeof(entry_pc));
>>>>>>> -            memcpy(boot + 8, &entry_a2, sizeof(entry_a2));
>>>>>>> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 4, entry_point);
>>>>>>> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 8, tagptr);
>>>>>>
>>>>>> Why don't you simply use stl_p() here?
>>>>>
>>>>> We want to remove the tswap32() calls...
>>>>>
>>>>
>>>> I think is point is that you could directly use stl_be_p, instead of
>>>> stl_endian_p(TARGET_BIT_ENDIAN, ...).
>>>
>>> TARGET_BIG_ENDIAN is defined as 0 on little endian, and 1 on big one.
>>>
>>> The following change isn't worth it:
>>>
>>>      if (TARGET_BIG_ENDIAN) {
>>>        stl_be_p(boot + 8, tagptr);
>>>      } else {
>>>        stl_le_p(boot + 8, tagptr);
>>>      }
>>>
>>> Maybe I'm missing Thomas point, as the xtfpga machines are available
>>> for both xtensa-softmmu (LE) and xtensaeb-softmmu (BE).
>>>
>>>> I don't know if your intent is to make be/le variant "private" and
>>>> relies only on endian_p though.
>>>
>>> My intent is to enforce endian agnostic API uses when possible, and
>>> use LE/BE specific variant when it is known at build time.
>>
>> Oh ok, it's me who missed your point then.
>> For some reason, I thought we were always calling big endian variant.
>>
>> Thus, your implementation makes totally sense.
>>
>> Let's see if Thomas meant something different.
>> Else,
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Looking more closely,
> stl_p is already correctly defined when you know at compile time your 
> target endianness. So Thomas was referring to this.
> 
> https://gitlab.com/qemu-project/qemu/-/blame/master/include/exec/cpu-all.h?ref_type=heads#L49

OK I guess I'm seeing Thomas point now; this series cover was not clear
enough. The goal is to remove TARGET_BIG_ENDIAN so we can build half
objects and do a little step toward the single binary.

Maybe I need to kill the stl_p & Co functions first, or do it while
suggesting this target agnostic replacement API.
