Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp992243njd;
        Sat, 29 Mar 2025 00:59:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3bdb:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-73972614bdfmr8252023b3a.4.1743235144988;
        Sat, 29 Mar 2025 00:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743235144; cv=none;
        d=google.com; s=arc-20240605;
        b=aQ8Ya5/fWjdpXxpKb5o8FQWEjZin73nAyWBhYSRdYXNbIA9kFDENZ7z//NB5Zb8+M3
         uNGObjeZuoetE4HgobRCF25DobZHsPTVaIaTGZTSGDbmVHvZiLGjuspbEEua+wWi4i4M
         CPvXh9Z/+csdhHrpJeVVGYiE6CqZ9lz9UlgR/tPYLT/L3mFr7CRPQhAcl2Xr4OzX+obX
         10cuZ/2PxmY80/ONH/oaso6qzybxNaamCc/KtyMjY+j7JTKPjUOAiLVn38VF5covLvVy
         TLi20+aP2pOsD9B4CxQdzP5Wd51P+Ap8L/RPZ+iA3zegAx4hWDRqOhPFyoUiOtOkRfvC
         qR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=d2n7uv7yCb+ECReJ1/h/zEJGUm8CAaDvIV3TsPVl3VU=;
        fh=+c4uL7HsqMZnPT9XSjBWyqRuo1LqP6+BYq1CWbxCUhY=;
        b=SbeEiRXCShg/D7ZzN7+Gkw3p+yWNyZPi+IqCz7oYpNxtdeqhqLbjapKvk89dLJM/aN
         ZIyfllTA/An3NobEcHUGevjd6CtdKhYmdt9mEXGEj/Njl+afBkyWTTi4/RWK45Bt9A5G
         WUVAol/mIFXg3YOM5MKM7MRzu3Q1vPSyFMuewWr3NGiQWrw8JgjHvujVjuNCbRqd+sR5
         prTl4QFW9LPa+m3LXR381YG6mF1DErRPER35OhBpsgTH/g9PfTy8+zMGthkOQBmPKc8M
         vF3Ki/5Fj14b/5Mb6XA+JvKS3UbHQTg6Oh0PFWcVqopH16aRlqFU3l1E/6tzDiETyho8
         fqIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=omxrEw4P;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af95dc971b9sor92884a12.2.2025.03.29.00.59.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Mar 2025 00:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=omxrEw4P;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1743235144; x=1743839944; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2n7uv7yCb+ECReJ1/h/zEJGUm8CAaDvIV3TsPVl3VU=;
        b=omxrEw4PMntdyzSh/HDNrF4QhWYGuOTFS7jbL0OqYeNNsqFbq0mzNo1yYDtjhrT1br
         tFgtJ1ygJZPciLKryRWaoH48Mgx7zb3pzf2bZFrm1zQIY8E4snhSI5f+A8489DmB5pA5
         XFBdgn4bB3qP2sQ4bM4gI6WEw8rWFo4uyRj8yQ3Ax6oz1yX7BkDRqvgspoUdU2haMRcO
         9yLmZ/a5Sqk0XN9qNCQJyWha8QqAfHkOdQEKbBGZ9hoDg4mbi70icAEKkCocp+PRTGmE
         M1b++cycI8FMNb8gDYrAbyQHHr/25IkJvG+JbFP1Os6VVBYrv00pz9H2hNhe4DDh7B/T
         62Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743235144; x=1743839944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2n7uv7yCb+ECReJ1/h/zEJGUm8CAaDvIV3TsPVl3VU=;
        b=sXuhpq+dlz4DO9jWKhbCkFZ84xE4uA6a/FFOSKIIIv14Athrw+cWcS6n47LXZ95iDD
         FjAIQAPvMNJ/dps0suxLdGWrzsWD6qxt5JY6XV7Tmym6MUDL4eORba91CxRAm/g8f0Df
         uOx5ixc1rDGvMLBVDC3rk3onpPd8YDHMMGGhRkskU1dAhWW+08U2GXEs/tT+k/RwgtxQ
         hWlX0HpquRRHYSkgvs53ATEY4JJaFIseRPrUfWMs2xgIPJN3gKLbjeO7GMYbC9UhKf4t
         LwBezLm5RsyYPRBHna31ovamGFt0YSiqyKtT3ndFdO/cjJBmga0hgPtcdwVTCL2UbpxV
         fIiw==
X-Gm-Message-State: AOJu0YyX+Pg0eO/8mJLo5F+/9uGaxS4h/Qok02rocQrJQyU6v4mKMEhZ
	ZK5Wh8Gba+5MBHd3lmx9UV0yzA+6NdlcTGiXa73jISwRkCV+Ll53ZMnhTMgTBe01SL1yYPgPzZ7
	3Vrg=
X-Gm-Gg: ASbGnctDmJKmvBBc9V+JSo0YySYrO1rBiqUuFtVcmRFh4fzNURtfDc58LlMjuUO12yO
	SkSeTbFI1cvTOZu1ja9BbDh+IRwGpdPS61oRVpiwAVaGB2vh7/0WwqKHQkfpoW+hkAE8XAPkUwO
	x7EewYKTVCsNbb8RC0q+pDmULLqh2y+UfN5/P0MyEZmJ9d9MzSVKJbXOpraWXgwzM5ZPqq8Zqf+
	CGY2mvSsGg5lN6FI3pVBz4pHQBez9T6WlvKrnhQCa06rA1Ngn7fZp7iZ3ttCFHS3MBabZxoUmUa
	WXfdY1eqP92hZRdcyQoQgivEB2oXheD89sTLfe0gekC+TElzhCBihOXpBA==
X-Google-Smtp-Source: AGHT+IEo7PUyuPRrW5112fsY5w5F4IjUJXxPRcD8NmFeSyQ2DEuoLS7aBQoXtmRHhREROhukBx5l8A==
X-Received: by 2002:a17:90b:4ecf:b0:2fe:b907:5e5a with SMTP id 98e67ed59e1d1-3051c8c0fd6mr8877504a91.10.1743235144185;
        Sat, 29 Mar 2025 00:59:04 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d55fe7sm3115922a91.16.2025.03.29.00.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 00:59:03 -0700 (PDT)
Message-ID: <87a2f892-4075-4249-8691-612a5472ba51@daynix.com>
Date: Sat, 29 Mar 2025 16:58:58 +0900
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250324102142.67022-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zcnKZqmv65ev

On 2025/03/24 19:21, Alex Bennée wrote:
> The current helper.h functions rely on hard coded assumptions about
> target endianess to use the tswap macros. We also end up double
> swapping a bunch of values if the target can run in multiple endianess
> modes. Avoid this by getting the target to pass the endianess and size
> via a MemOp and fixing up appropriately.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use unsigned consistently
>    - fix some rouge whitespace
>    - add typed reg32/64 wrappers
>    - pass void * to underlying helper to avoid casting
> ---
>   include/gdbstub/registers.h | 55 +++++++++++++++++++++++++++++++++++++
>   gdbstub/gdbstub.c           | 23 ++++++++++++++++
>   2 files changed, 78 insertions(+)
>   create mode 100644 include/gdbstub/registers.h
> 
> diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
> new file mode 100644
> index 0000000000..2220f58efe
> --- /dev/null
> +++ b/include/gdbstub/registers.h
> @@ -0,0 +1,55 @@
> +/*
> + * GDB Common Register Helpers
> + *
> + * Copyright (c) 2025 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef GDB_REGISTERS_H
> +#define GDB_REGISTERS_H
> +
> +#include "exec/memop.h"
> +
> +/**
> + * gdb_get_register_value() - get register value for gdb
> + * mo: size and endian MemOp
> + * buf: GByteArray to store in target order
> + * val: pointer to value in host order
> + *
> + * This replaces the previous legacy read functions with a single
> + * function to handle all sizes. Passing @mo allows the target mode to
> + * be taken into account and avoids using hard coded tswap() macros.
> + *
> + * There are wrapper functions for the common sizes you can use to
> + * keep type checking.
> + *
> + * Returns the number of bytes written to the array.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, void *val);
> +
> +/**
> + * gdb_get_reg32_value() - type checked wrapper for gdb_get_register_value()
> + * mo: size and endian MemOp
> + * buf: GByteArray to store in target order
> + * val: pointer to uint32_t value in host order
> + */
> +static inline int gdb_get_reg32_value(MemOp op, GByteArray *buf, uint32_t *val) {
> +    g_assert((op & MO_SIZE) == MO_32);
> +    return gdb_get_register_value(op, buf, val);
> +}
> +
> +/**
> + * gdb_get_reg64_value() - type checked wrapper for gdb_get_register_value()
> + * mo: size and endian MemOp
> + * buf: GByteArray to store in target order
> + * val: pointer to uint32_t value in host order
> + */
> +static inline int gdb_get_reg64_value(MemOp op, GByteArray *buf, uint64_t *val) {
> +    g_assert((op & MO_SIZE) == MO_64);
> +    return gdb_get_register_value(op, buf, val);
> +}
> +
> +#endif /* GDB_REGISTERS_H */
> +
> +

Nitpick: extra newlines here.

> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index b6d5e11e03..e799fdc019 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -32,6 +32,7 @@
>   #include "exec/gdbstub.h"
>   #include "gdbstub/commands.h"
>   #include "gdbstub/syscalls.h"
> +#include "gdbstub/registers.h"
>   #ifdef CONFIG_USER_ONLY
>   #include "accel/tcg/vcpu-state.h"
>   #include "gdbstub/user.h"
> @@ -45,6 +46,7 @@
>   #include "system/runstate.h"
>   #include "exec/replay-core.h"
>   #include "exec/hwaddr.h"
> +#include "exec/memop.h"
>   
>   #include "internals.h"
>   
> @@ -551,6 +553,27 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>       return 0;
>   }
>   
> +/*
> + * Target helper function to read value into GByteArray, target
> + * supplies the size and target endianess via the MemOp.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, void *val)
> +{
> +    unsigned bytes = memop_size(op);
> +
> +    if (op & MO_BSWAP) {
> +        uint8_t *ptr = &((uint8_t *) val)[bytes - 1];
> +        for (unsigned i = bytes; i > 0; i--) {
> +            g_byte_array_append(buf, ptr--, 1);
> +        };
> +    } else {
> +        g_byte_array_append(buf, val, bytes);
> +    }
> +
> +    return bytes;
> +}
> +
> +

An extra blank line here too; each of the other functions in this file 
has only one blank line following.

>   static void gdb_register_feature(CPUState *cpu, int base_reg,
>                                    gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                    const GDBFeature *feature)
