Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp999341njd;
        Sat, 29 Mar 2025 01:15:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:1309:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-7398036fb06mr3282206b3a.9.1743236158026;
        Sat, 29 Mar 2025 01:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743236158; cv=none;
        d=google.com; s=arc-20240605;
        b=Z9YgsKhfdjv9cZy0LPLsIG6u7NatrtGBkEUzoRmEGTm27xy/jY9exnAVNPBuGYzFqj
         hdNa9R+gqOtGc6rgWseHLFv48qucWe9U+tE1Uswx7yMNeubn/Of9bt6re3sHckgWcbMp
         Gn0QUDqxesaovM/CDOAtTzgh5ZqyVP4D29dATCBPlNhEvB4gTlFDHyYqqPIfa5fxELD3
         WHxe3KV5ca9ULCHlmr4EwgYJ0hXvHNtBhvy8zUE4TV0uFjcHm2fQHrVyL8rdAYRcGdGX
         Q+jlmechC1fa37M83hi60FXvtdPSQT/lASKqvQmzKtnWRjnnxUbwZazXYBRqB4n383nx
         kiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sCRkO8v+2k1YmAtHJ0D7+mQ9SXBzHZb8iVLfpQpK7Pc=;
        fh=+c4uL7HsqMZnPT9XSjBWyqRuo1LqP6+BYq1CWbxCUhY=;
        b=GyWulIAXNDBG+OX5HcXHi+PeHxQBb9Amdsp0OWZpcYJEtQ2Ga1x2IUjkv8FgyIIUSx
         0+InUDFgxf+PDFXd2OjEBYy2/6MreI3eB3NirsgspQq2h1pMu+Nwup/5itiCGtviFFuf
         iNO8fbFO3dRA3fif2meRxzM6LkIrLAjxqwYEk2LMm5U+OLBbDlzKzF6Jv8u6zDMtsCv0
         axHKQg+sxk6JTz16BNnr9pcsqegYOuAFKqxRTHYlKWrBU5JK9eafaFCZzQG5ODjhC09R
         gajNwR4s/OP/gbT9FihztLjfsYA8tq8rtFWUaKe0UoXn6F0j2Uoel0UTLVZXpN1OjlYk
         eJcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=2pITk2fx;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73970e3dac3sor3055091b3a.2.2025.03.29.01.15.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Mar 2025 01:15:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=2pITk2fx;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1743236157; x=1743840957; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCRkO8v+2k1YmAtHJ0D7+mQ9SXBzHZb8iVLfpQpK7Pc=;
        b=2pITk2fxOU/A5WiWpDp4Fg4io/75dsqgmouXMPntWJCz6bu2iQOu/HQfVw67mE75vh
         J1qvNwbkJRYCgOLNC3/Rfm9lB4keXjdoyt5rLgHu9S6QZ4rggEWhUi35Vl7BsaaTvJq5
         KaF+eJi6bNFr1R+PuMUBH3u+83z6fCFBXknoXFYiOfqfznP3u7Y+pJposRlYo27VQAyn
         aE79cjkBQNifknm4t2RH+AymfkqEEX9HyKg9Q0G0VQjdAYFY+oMhK5p90S56SsraLMHe
         WGoeM+yePLX6ux2o2twsAvBP/9Vt5HDs8IbroUPQfdOMOWJO5unYwEY3suwokDSWZBGO
         DVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743236157; x=1743840957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCRkO8v+2k1YmAtHJ0D7+mQ9SXBzHZb8iVLfpQpK7Pc=;
        b=NIO5QWactj6aPcab7P2JvkF8bXoP9GLNtBCzV1a+JDnAmO9VNqiyDqXarVen0i2Lt4
         qAur7ndhj+sgnZw2jk1PsdMpRq61/trMfNGVyXFrKObJ2vBa6tf0n0R0XBQx2D7jRKQx
         6xDeT6TbiTHaBKIZhE8W00V4Krj1MrIS7VW4e0SrFlVjYH0cx8zc9LtuhXuGoaoUIbRa
         N4UGlRwtThbNTotTGriuNTGOWYqRZ0z2fk+Q4ywvl0CKHJsxtX2QJeTvfkKqh8zUyr3l
         yapqb/drzjhBJ/9mSMhS8QTX2qKn/oGUAO3bzd0rBQmx6Po/nprGo+pfbwxWCPJTpuFQ
         4ixw==
X-Gm-Message-State: AOJu0YzTcTiloMfjdtZ/tvVn1O4tgp0/5upMhI2ZcbDJsvcxOy5qKKTZ
	dLV/8mCHEmD+Rb+LQ95vy5D5DFB+isWTwPKzLXSQ2Cg/iqbXmb6lqe49iyFtev/u+tk+9dgEvnA
	/lps=
X-Gm-Gg: ASbGncvKA78DoEVKy3MOl8R9f/zre9YKV/zWqRZt0W+nRRca8pKplq9ZHW3gDqG4JEN
	bbTP+h4sf4vqWOaGUeo5bXw1A5J6w/kBZlWSOw9gioq7O0Y54BR/EmLjz5TmlGE+YgGVPl6or0G
	sQwiO9Y8RXdbF57RX+WoV1KN9sNUdiXDCVpyTBtXunU6Jpo5gho+t9SHrR6pVh4bLZIaU6TEhI8
	5lRRpAHMPLDX/7RGqUwC+1fERW9UeWY3pbG4GKmK33P/MKyzk3YNjyQYnLVl//rmVXF5Sa0DbdT
	vjBtMf4VDmv/7lYAhF8gXFTsziv1ULaIahdUDSIy5h08vZDto4OZi82zxt8l3W1mDpjh
X-Google-Smtp-Source: AGHT+IFLzMno6jfCZHUYLawzpd4uXQgCbKGeJWvEi1sgCAWJP5dULhsaegUqnSB/R3YedHhlTEB2yA==
X-Received: by 2002:a05:6a00:991:b0:736:a77d:5412 with SMTP id d2e1a72fcca58-73980395977mr3360511b3a.12.1743236157069;
        Sat, 29 Mar 2025 01:15:57 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710ccf1fsm3058896b3a.163.2025.03.29.01.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 01:15:56 -0700 (PDT)
Message-ID: <0ac28f60-49c9-4864-a5e0-412b2220d108@daynix.com>
Date: Sat, 29 Mar 2025 17:15:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] gdbstub: introduce target independent gdb
 register helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-5-alex.bennee@linaro.org>
 <87ikny4t2t.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87ikny4t2t.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iZCLTgSxg1Nr

On 2025/03/24 19:32, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> The current helper.h functions rely on hard coded assumptions about
>> target endianess to use the tswap macros. We also end up double
>> swapping a bunch of values if the target can run in multiple endianess
>> modes. Avoid this by getting the target to pass the endianess and size
>> via a MemOp and fixing up appropriately.
>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>    - use unsigned consistently
>>    - fix some rouge whitespace
>>    - add typed reg32/64 wrappers
>>    - pass void * to underlying helper to avoid casting
>> ---
>>   include/gdbstub/registers.h | 55 +++++++++++++++++++++++++++++++++++++
>>   gdbstub/gdbstub.c           | 23 ++++++++++++++++
>>   2 files changed, 78 insertions(+)
>>   create mode 100644 include/gdbstub/registers.h
>>
>> diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
>> new file mode 100644
>> index 0000000000..2220f58efe
>> --- /dev/null
>> +++ b/include/gdbstub/registers.h
>> @@ -0,0 +1,55 @@
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
>> + * There are wrapper functions for the common sizes you can use to
>> + * keep type checking.
>> + *
>> + * Returns the number of bytes written to the array.
>> + */
>> +int gdb_get_register_value(MemOp op, GByteArray *buf, void *val);
>> +
>> +/**
>> + * gdb_get_reg32_value() - type checked wrapper for gdb_get_register_value()
>> + * mo: size and endian MemOp
>> + * buf: GByteArray to store in target order
>> + * val: pointer to uint32_t value in host order
>> + */
>> +static inline int gdb_get_reg32_value(MemOp op, GByteArray *buf, uint32_t *val) {
>> +    g_assert((op & MO_SIZE) == MO_32);
>> +    return gdb_get_register_value(op, buf, val);
>> +}
>> +
>> +/**
>> + * gdb_get_reg64_value() - type checked wrapper for gdb_get_register_value()
>> + * mo: size and endian MemOp
>> + * buf: GByteArray to store in target order
>> + * val: pointer to uint32_t value in host order
>> + */
>> +static inline int gdb_get_reg64_value(MemOp op, GByteArray *buf, uint64_t *val) {
>> +    g_assert((op & MO_SIZE) == MO_64);
>> +    return gdb_get_register_value(op, buf, val);
>> +}
>> +
>> +#endif /* GDB_REGISTERS_H */
>> +
>> +
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index b6d5e11e03..e799fdc019 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -32,6 +32,7 @@
>>   #include "exec/gdbstub.h"
>>   #include "gdbstub/commands.h"
>>   #include "gdbstub/syscalls.h"
>> +#include "gdbstub/registers.h"
>>   #ifdef CONFIG_USER_ONLY
>>   #include "accel/tcg/vcpu-state.h"
>>   #include "gdbstub/user.h"
>> @@ -45,6 +46,7 @@
>>   #include "system/runstate.h"
>>   #include "exec/replay-core.h"
>>   #include "exec/hwaddr.h"
>> +#include "exec/memop.h"
>>   
>>   #include "internals.h"
>>   
>> @@ -551,6 +553,27 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>>       return 0;
>>   }
>>   
>> +/*
>> + * Target helper function to read value into GByteArray, target
>> + * supplies the size and target endianess via the MemOp.
>> + */
>> +int gdb_get_register_value(MemOp op, GByteArray *buf, void *val)
>> +{
>> +    unsigned bytes = memop_size(op);
>> +
>> +    if (op & MO_BSWAP) {
>> +        uint8_t *ptr = &((uint8_t *) val)[bytes - 1];
>> +        for (unsigned i = bytes; i > 0; i--) {
>> +            g_byte_array_append(buf, ptr--, 1);
>> +        };
> 
> I forgot to fix this up. Hopefully the following seems a little less
> like pointer abuse:
> 
> /*
>   * Target helper function to read value into GByteArray, target
>   * supplies the size and target endianess via the MemOp.
>   */
> int gdb_get_register_value(MemOp op, GByteArray *buf, void *val)
> {
>      unsigned bytes = memop_size(op);

Nitpick: I would name it "size" instead of "bytes" for consistency.

>      uint8_t *data = val;

It's unclear what "data" means. This can be named "bytes", "val8", 
"octets", etc to differentiate from "val".

> 
>      if (op & MO_BSWAP) {
>          uint8_t *ptr = &data[bytes - 1];
>          do {
>              g_byte_array_append(buf, ptr--, 1);
>          } while (ptr >= data);

It may be better to initialize ptr to point the position after the last 
element:

uint8_t *ptr = &data[bytes];

while (ptr > data) {
   g_byte_array_append(buf, --ptr, 1);
}

Strictly speaking, this is well-defined when bytes == 0, which is not in 
the original version, and you don't need to write decrements at two 
places (initialization and update).

>      } else {
>          g_byte_array_append(buf, val, bytes);
>      }
> 
>      return bytes;
> }
> 
> 
>> +    } else {
>> +        g_byte_array_append(buf, val, bytes);
>> +    }
>> +
>> +    return bytes;
>> +}
>> +
>> +
>>   static void gdb_register_feature(CPUState *cpu, int base_reg,
>>                                    gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>>                                    const GDBFeature *feature)
> 
