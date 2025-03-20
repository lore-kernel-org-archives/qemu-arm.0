Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp756773njc;
        Thu, 20 Mar 2025 00:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt1FhbSWwnEgu0LQVo5T5VGRElpI9d0ABEFmiJM7w6Xf7nfWtH4pjW2ZXBth+8UHBnvQGfLQdWhh/1UQ==@linaro.org
X-Received: by 2002:a5d:648b:0:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-399795a5082mr1801847f8f.2.1742455495635;
        Thu, 20 Mar 2025 00:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742455495; cv=none;
        d=google.com; s=arc-20240605;
        b=bVw4+GvavK8s1g/nHt6/7uXHkPhfMoPl9jAufBBSVa7NOGTia8qEuzN41+HLP1CULM
         8VwlC7dKGMK8op4fmCGsQyW6uPzGXF+2tMH1iJ3zb+IbdUKllT55vCH6UmXPB28nrokA
         ISLWux2Bxr+rFG+7UYNE90oOKQqwpqQjWRTcwjSZG7Xq9RrRmul5umydwCWkJAROfSJd
         4MRJP/HicA6BbmvfxJF5zenuD0tVTEv4LoSE21aOE6xckT02AhpnM4aY7dfSlegi9At6
         G8p/nqcqDBdeGcNj3r4XyCiwLnkcJ2Q4gi+D37JjLoy/BWpZsK2RlPpm55+g4d83js6d
         bSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OfAuJYtA3gt8CE28/QLl0zbRSj4IcfSgyPCV7JDaP3o=;
        fh=G1+JUPCB8PTeRvLlpYQU208XAb9clVnOg72fa6GQpdA=;
        b=F3yqEEBhXLHvutuBSxEZq5tupS7pFUnrEz2/0I2CSlSaDlXmFXT7pTLUOpc3VO9qmX
         yoM48hMMvf5QYMKTzMnP9KA3aba1sVt5bH8F/xNFS8UhS3OyfU4tcFgNiQVRGUJatMFS
         TCpRYhQhKJMHB8n+fdy5w7U2fzFTrJfLUsmXeQUJWnfdMNijjcQWSzng6Jos90eCmsJU
         XzI3yZGaAFHqZqH5KrnHtjSi8KzE5ENT0ck2aQq/QmNAKBVomhfGTyo9dzHmN/WaQX+4
         9CQq348M/kwWI61ah7GhMopJ2Tvn4qUB51P+MkwWbflAnuJV+kjB67C27e/VgQKafHFB
         BAsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rsxr8CLD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-395ca1b849asor6034194f8f.5.2025.03.20.00.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 00:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rsxr8CLD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742455495; x=1743060295; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfAuJYtA3gt8CE28/QLl0zbRSj4IcfSgyPCV7JDaP3o=;
        b=Rsxr8CLD9bmFGn+T95gIDbe3dj4EDb+04iFBxBLCeQpg8E1nS+hjv7gZOxJodBYHbS
         69nxwmmk6neBYFdxuqfjP2sD3R8Pl0ctj66Vesy+0u14kQmA0ri71dYra3Rf0hk3uVv+
         xKLkgqduPXmqYYu1IbKtAUCC1msXM7Z48O2EAcMrJU3spYRRXQJiGJC/X6IkURro5XgD
         5C/MgMCIsvgHqrf5wkCvNVL+yKZkv9YKv3Hpies/gn27qFhX7zuHfXwB6nD1a4Zgiqx9
         fCFZa42PZjQSMf82qPMkkjpRz/Ff1insF+QqlC+HL5+h8pKv9uX7TEU/UaBKMNUnFXed
         9Q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455495; x=1743060295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfAuJYtA3gt8CE28/QLl0zbRSj4IcfSgyPCV7JDaP3o=;
        b=ZVfuntrfqw0UkWlrWp5lec8pwZz/KV+/IAwbcbkrR6U9754/lkKdzKI/WMpwtljvhI
         dTWPqZSG7PXm1TzFpGcWpPZ6UPjEkfmqcmhrbAx8iMjmBv47lIinTsyFl9xmoWwqzbCK
         T1sOBGZ3El1HorjGV3kP2biOFYU0JreKyDsCZM+mfolvkgWwdGRYJBWIhOIxaVUWRXfg
         eiNTRzqUxHivuLIASZuZZKi2Y8Gf4s3w9/gUha6HBQX2gheUBHNKacgjpCrsXJTaeMwG
         U0rZJZ6+iYOTi42FkLtQx3VMrSYc+sRIkC2mt/VzZ06VjxVtIHfK7PHtcHSwnwXTdi6w
         xpdg==
X-Forwarded-Encrypted: i=1; AJvYcCW06GHf7NAzRyrMHSgAWn0YXEv/Vv/Ui6mAoz058N+BXOPt32lmpkMtr0My3hTNTb8kME6wyDCBdxGxaA==@linaro.org
X-Gm-Message-State: AOJu0YyaOO9GRGfI0gJ1STFo0qzGHhAvhlmuhvApueFLQXS3YMus8eZA
	V94sMJ4TfVPrKpoDrACxx0asKP+fMFa+2wukoa74/gK76XxWG1bCJgzzpnIlesdnZ/Dqa+7UY8B
	N9Y4=
X-Gm-Gg: ASbGncuE4/gQNGowZgqwFIcwMbun2KRUouxzfaFJiUflt1bB3lPASka3HQjzDtd/5Rw
	g1hRf+lJvCCzzFjmoFMO2vPqOiVCYDugHE+DTPWk+iqTBvkI/YrPeiF/H4hIAVkqVAWoDwrBiyA
	FICfTIHds/TItMMwRNcRCDGoOHrjBCeAhGSqi4026Bpq6IDOBgr3mOCA7uGWa5ukWoEzNcUZOri
	E5R8gEOYs/j1/BgkRLYqkTn5b7W6ta7iZBMZa92CRaD6rS66AqWRRvfAYq7+sqgLu4GIKc5soU7
	z/HJhQrivoCwgFFMnZxuPjBS4cbIfZ40q61ukQxcX7qByYSeZl2/6kaG6OsstZEiLmIEL89Skl5
	CN26ZPZ8i7WWX
X-Google-Smtp-Source: AGHT+IGllMEfpF+aiZg+sVrY/WHZ+kuxHj2Mg5kkRDq2lm97gIt7Jbowg3G27DoK9OUMMT0oIuc1xA==
X-Received: by 2002:a5d:47c9:0:b0:391:3f4f:a17f with SMTP id ffacd0b85a97d-399795d8a4cmr1817785f8f.42.1742455494923;
        Thu, 20 Mar 2025 00:24:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm23136118f8f.62.2025.03.20.00.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:24:54 -0700 (PDT)
Message-ID: <e54c91c2-6035-4259-9557-16d99c844ff7@linaro.org>
Date: Thu, 20 Mar 2025 08:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-3-alex.bennee@linaro.org>
 <d3ea5401-866c-40a0-9ccc-6c681b760535@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d3ea5401-866c-40a0-9ccc-6c681b760535@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bT71NWuL+LfU

On 20/3/25 07:19, Akihiko Odaki wrote:
> On 2025/03/20 3:22, Alex Bennée wrote:
>> The current helper.h functions rely on hard coded assumptions about
>> target endianess to use the tswap macros. We also end up double
>> swapping a bunch of values if the target can run in multiple endianess
>> modes. Avoid this by getting the target to pass the endianess and size
>> via a MemOp and fixing up appropriately.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> The overall idea looks good to me. I have a few nitpicks:
> 
>> ---
>>   include/gdbstub/registers.h | 30 ++++++++++++++++++++++++++++++
>>   gdbstub/gdbstub.c           | 22 ++++++++++++++++++++++
>>   2 files changed, 52 insertions(+)
>>   create mode 100644 include/gdbstub/registers.h
>>
>> diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
>> new file mode 100644
>> index 0000000000..4abc7a6ae7
>> --- /dev/null
>> +++ b/include/gdbstub/registers.h
>> @@ -0,0 +1,30 @@
>> +/*
>> + * GDB Common Register Helpers
>> + *
>> + * Copyright (c) 2025 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef GDB_REGISTERS_H
>> +#define GDB_REGISTERS_H
>> +
>> +#include "exec/memop.h"
>> +
>> +/**
>> + * gdb_get_register_value() - get register value for gdb
>> + * mo: size and endian MemOp
>> + * buf: GByteArray to store in target order
>> + * val: pointer to value in host order
>> + *
>> + * This replaces the previous legacy read functions with a single
>> + * function to handle all sizes. Passing @mo allows the target mode to
>> + * be taken into account and avoids using hard coded tswap() macros.
>> + *
>> + * Returns the number of bytes written to the array.
>> + */
>> +int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val);
>> +
>> +#endif /* GDB_REGISTERS_H */
>> +
>> +
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index 282e13e163..3d7b1028e4 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -32,6 +32,7 @@
>>   #include "exec/gdbstub.h"
>>   #include "gdbstub/commands.h"
>>   #include "gdbstub/syscalls.h"
>> +#include "gdbstub/registers.h"
>>   #ifdef CONFIG_USER_ONLY
>>   #include "accel/tcg/vcpu-state.h"
>>   #include "gdbstub/user.h"
>> @@ -45,6 +46,7 @@
>>   #include "system/runstate.h"
>>   #include "exec/replay-core.h"
>>   #include "exec/hwaddr.h"
>> +#include "exec/memop.h"
>>   #include "internals.h"
>> @@ -551,6 +553,26 @@ static int gdb_write_register(CPUState *cpu, 
>> uint8_t *mem_buf, int reg)
>>       return 0;
>>   }
>> +/*
>> + * Target helper function to read value into GByteArray, target
>> + * supplies the size and target endianess via the MemOp.
>> + */
>> +int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val)
>> +{
>> +    size_t bytes = memop_size(op);
>> +
>> +    if (op & MO_BSWAP) {
>> +        for ( int i = bytes ; i > 0; i--) {
> 
> memop_size() returns unsigned, but bytes is size_t and i is int, and 
> this function returns int. Let's keep them consistent.

I wasn't sure why this method returns any information at all, but
apparently the next patch shows some uses. Indeed as Akihiko pointed,
if we return something, let it be unsigned (possibly size_t).
