Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp733440njc;
        Wed, 19 Mar 2025 23:19:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-301d507fab7mr3092208a91.1.1742451575280;
        Wed, 19 Mar 2025 23:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742451575; cv=none;
        d=google.com; s=arc-20240605;
        b=WByYIK9aj1o4Ong687To/L4B2U7GOorP5IOpLkVn7pvB2LjYvXomrBN/1E4UwetuRC
         ud/yUsY9PbcYNmXFS/SBqOx1K9VcrW5l2t7tB1qMYnaO//puY/f9P2zEOkklEZR/btQo
         92nzvSgN1jeSTOik5yVzpzDP/kjmjX34g2S/weiV1OIQHKUoReHviC9T/FsbgDJFjQZf
         hiA8GxyYpcn5WconpaJJc4dtXPcl41sAf/lV/4/CbAYPxFKR9Pgae03PlxEAMm7kDsxk
         XrOi8PqtvWD8pnbEqW9J5+ciDitcW5G+VXcYxdEJR3+amoYnrFJah8MVYPHZmMA2wrXV
         D7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x858j5g0cieSBvQvbkhIiqqjyN9UN7MFhpuUm3aytII=;
        fh=E8t/02ZSsoJgyiOrQcDlRoFznYRvW+Fe/0vT732LnmY=;
        b=cut9/HkDDWCqnq++5PU4ot0Dbze9tmLLCiPWJM3ejp05zO7C3xw5zWyqqw4Cq20/I3
         c55ArQRmI36r0L9ROxa7ITGXOp6QqMxoZUwO9lZYp58ruEmAUkEpYY3alqeQ7t4J9uz3
         JvEBi1dtUneUD+8XS6c3bMGeCsCtyXM+dMB3dE8+ZCv6UA5Kc/F0snWD/4uFHtN4Ga+N
         VHuy/0lRtam2XhCWWxcjMsAX1Uwo3PDoSw4luzAFIvq13P2j1OadiSLrPCyMdNqAAsVN
         8sCZcL0AEUnHkMn73XRCDmVNjR9WJsOfYKEIwx9Jt76c58P2HqtpvmemmwglcaugEJBG
         SS7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=quDiaYyV;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-301533e641asor11883425a91.0.2025.03.19.23.19.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 23:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=quDiaYyV;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742451574; x=1743056374; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x858j5g0cieSBvQvbkhIiqqjyN9UN7MFhpuUm3aytII=;
        b=quDiaYyV5ZZLJ5yaiz2gLn6s9NEjvjSE4SPBgr3Xj85onxIODBfJsPdkJmToDEdBWW
         OVBppI0rpZiFfOyaceJ8SEFdXpm9llpYJsKOLUqEDRtMqnqoAqzggfY6ZKO+thh3UMRI
         fxojmp06ELXRAlrGxq8ZVTQlWUlZWu0GWinfMriyLmdzdNSFnQ0SYBIqvbkWjFz39aEv
         nzEdU6ibejMwaFZvrQJK+edFhhHylI8wLj3OawgdybmosRPzWfBWgdAJbwQQ4479qhHI
         aYUyaF/zP0uEGaPZU/+/di91mj3hRgLjflVfVmiPO3k3U0mvukZ9g1bNjb6f4+7LKcym
         2VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742451574; x=1743056374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x858j5g0cieSBvQvbkhIiqqjyN9UN7MFhpuUm3aytII=;
        b=e/x5iVSzvvL+He7Qvds4gqE1GGtX/E3t8/VHHOvhImZrdSkTOsXtJO2f3LwTcaDttw
         MHgYofWflG9CpzUYdWdsYVP6vHJ69PfEp6igpd4//nXRrK7uRe3YNC3xTwfM7PifFHaF
         HM5KwuerVzZII1cXPSDVskNqnbQzvis6Nvd/d5TxnixQk2+s4Fz6rGKzZ1uPLo3c8kzU
         316FYc7gnaQctZqRtBH4hsoV7bN3mElhOzeCqNn2R4zJAWPddavhDw2E/p0YGhXioGw/
         VFLs1wxajZ8lan7eVKJI0ZxRKUZAZ/ABMAyAWr+cX6lSTOcqR9A2r2l+Rww5wjcg+pM1
         0VZQ==
X-Gm-Message-State: AOJu0YyeRfnJTlYOe1qSsW9sSifZrG41hFtJznLm2PCXyw5pevpvrlj0
	Qzz3OkllxvsYRAJHH0MRcSbhhF5KfN6FJ9o2KeJ9kYQZWblHpsjv0bapzDJ1PrvW8BZ0r7LgbcU
	fxE8=
X-Gm-Gg: ASbGnctHTvvzN+SJIig0qJebDkmBb6I/d2ajUF3HJMxSgqMjZhmxOp4DxA1PnLESczH
	I1VfpNm4UAztxNPe/DmkTDrhZHkHc8b/A2M8JzJI+h+6vh//MNtowwF3YS3MnkHE9BkBV/uWY7X
	FnwFa9/M6kNs/TjekSPNYPtfCd0UryUwxTOF54Yxtv8C0XUiyx7vJstacMhGcl1WnD/swERE51i
	7VwIdeICdHakd7ThrSoZYwyXQtrsbxhiYohICLls7ZfYRYutiwIp/pbKe4SdoCianoVrk0047aO
	MXjHs2pZMO+SiMLoAbQ6Jb+CwG2VNV8qjGU6DVrkSK8mwe01uFSAVXycmw==
X-Google-Smtp-Source: AGHT+IEQk63NuG5hPsiG5+penBOpcu/CbuFqNid+xN6gz30e5dmIoSyXSA4JSASxJGx+/dnb6jOZKw==
X-Received: by 2002:a17:90b:1a89:b0:2ff:5c4e:5acd with SMTP id 98e67ed59e1d1-301d534bdcdmr2802128a91.35.1742451574445;
        Wed, 19 Mar 2025 23:19:34 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589b07sm2913296a91.11.2025.03.19.23.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 23:19:33 -0700 (PDT)
Message-ID: <d3ea5401-866c-40a0-9ccc-6c681b760535@daynix.com>
Date: Thu, 20 Mar 2025 15:19:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
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
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-3-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250319182255.3096731-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zcsdLnPnth+N

On 2025/03/20 3:22, Alex Bennée wrote:
> The current helper.h functions rely on hard coded assumptions about
> target endianess to use the tswap macros. We also end up double
> swapping a bunch of values if the target can run in multiple endianess
> modes. Avoid this by getting the target to pass the endianess and size
> via a MemOp and fixing up appropriately.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

The overall idea looks good to me. I have a few nitpicks:

> ---
>   include/gdbstub/registers.h | 30 ++++++++++++++++++++++++++++++
>   gdbstub/gdbstub.c           | 22 ++++++++++++++++++++++
>   2 files changed, 52 insertions(+)
>   create mode 100644 include/gdbstub/registers.h
> 
> diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
> new file mode 100644
> index 0000000000..4abc7a6ae7
> --- /dev/null
> +++ b/include/gdbstub/registers.h
> @@ -0,0 +1,30 @@
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
> + * Returns the number of bytes written to the array.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val);
> +
> +#endif /* GDB_REGISTERS_H */
> +
> +
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 282e13e163..3d7b1028e4 100644
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
> @@ -551,6 +553,26 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>       return 0;
>   }
>   
> +/*
> + * Target helper function to read value into GByteArray, target
> + * supplies the size and target endianess via the MemOp.
> + */
> +int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val)
> +{
> +    size_t bytes = memop_size(op);
> +
> +    if (op & MO_BSWAP) {
> +        for ( int i = bytes ; i > 0; i--) {

memop_size() returns unsigned, but bytes is size_t and i is int, and 
this function returns int. Let's keep them consistent.

There is an extra whitespace between "(" and "int".

Regards,
Akihiko Odaki

> +            g_byte_array_append(buf, &val[i - 1], 1);
> +        };
> +    } else {
> +        g_byte_array_append(buf, val, bytes);
> +    }
> +
> +    return bytes;
> +}
> +
> +
>   static void gdb_register_feature(CPUState *cpu, int base_reg,
>                                    gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                    const GDBFeature *feature)
