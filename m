Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3283183wrg;
        Mon, 17 Jun 2019 22:06:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQ3gtdp8wTMm0OcUWqcaaBVjNt8UF2Zuyi6QJ/OizwxS+1JRZNDye/hWH1bUbSySfTWAZq
X-Received: by 2002:aa7:c619:: with SMTP id h25mr60899006edq.295.1560834361478;
        Mon, 17 Jun 2019 22:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560834361; cv=none;
        d=google.com; s=arc-20160816;
        b=j4SUbvx+N1LN+SCSlol7qG/4ZhmYi2j7V74+iG5JQHBb44M9vgAag8YpjZyEEhAXtU
         S/YAG/Mlg+MoYLgffa3J1pHzAuuDFD/wT7tEoZPU58+D2htBKelxuEQUpO+8bcteL+zM
         6n8IC1Fo7pIKSfmGbh2NgqLz1nXLF45S+f1QDjXxe+XvJ9khHKooHZKODOi6GjjR+S0v
         UDWJNzDAVM2n2RXSQKKku7rUMory4Hu80abKtvfv8QiH5iVA2BCFp9fFl94cKPnmBUrc
         oCquSiUYZZuzhkhs+c8VFEaZKlAVz7g8CK3KZ363hHgkIUaJwTCfs8IUF76mIfhNiccK
         aEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=6BmWZoE16z60CzezKmyRj/0UfXSoVV+paoDgBfIlLC0=;
        b=PmU+x2XBR5FwaRl82K62zqYEgzG6ZzIJcS4hTv65aGrN84P1EOmanJ3rt6b5+MuX55
         UN+kV7SmYNO5K6PSF+GDWkSwhCTke641b8cX/RC2u1vhhuwdxFEPyigz2s7k1ZYgLbaZ
         P5ix/M1KH2EDxcVAMWveQMA3PgiMarn/ouazKmj5EF19b8EJaMY52+t9uvXM/57zVCgJ
         yH/gJvkp46iwAP7EZ7HS5InA8O2LzanP3ft3OoMe9zyH1wChyVbXMPpprW9z5BYZXYJ2
         LDK8j7cDjV2GQH0nVzonZAHHXWjfMhV5rdM1y2dBc8TFvAAcWmVd/DNcOFwaovyYmQ2C
         XoYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p48si10213831eda.101.2019.06.17.22.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 22:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd6Jk-0000BA-KM
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 01:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49045)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hd6JM-0000Au-5e
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 01:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hd6JK-0001qP-DV
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 01:05:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hd6JJ-0001k7-E1
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 01:05:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so1393116wme.0
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 22:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6BmWZoE16z60CzezKmyRj/0UfXSoVV+paoDgBfIlLC0=;
 b=NSIz7LMB1dc619/W7Ic5x3bD6udF0+hS+yZ6ZjE9syBnlyAcQpu/JZo1sgGQum9cn5
 NFt5ZLX/rwYgHiK5ZqKueX9Ey1G4ET236QFQQ4/IR9IQ9d31dupNdtnuqGkUPLwZc0Tw
 S1Mr7yikdwYGpeiIUTvkzpxiHMBS3NiFoR3DXDe6gpvyVjNFv8JKu8sKILKtCsAIm59F
 zcu0A+Fk6GgB2ZAyD0ohiEdAnKKV08cpPGduRUo6iYgrI8yO5xXFGej9Yj2bZ1sd5Xt6
 EOs8K2vHNckalT/lIhUBnKwZ2mfCvjWajUHq0oWSTsN54XtyqNrWyJBgEGOeBwg1T9Sl
 P2jQ==
X-Gm-Message-State: APjAAAV5z7NHe2AdntTTmIjehfHUblRK7lM0m+KdFDS1Av9PIGQGXOwx
 xC+6OxkeDwtFNDPHzoj4Nul5xw==
X-Received: by 2002:a1c:f116:: with SMTP id p22mr1459486wmh.70.1560834328962; 
 Mon, 17 Jun 2019 22:05:28 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id v65sm865642wme.31.2019.06.17.22.05.28
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:05:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7803c62a-c574-cefd-02b4-41df08dca085@redhat.com>
Date: Tue, 18 Jun 2019 07:05:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] hw/timer/armv7m_systick:
 Forbid non-privileged accesses
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nSufJqGLWH4s

On 6/17/19 7:53 PM, Peter Maydell wrote:
> Like most of the v7M memory mapped system registers, the systick
> registers are accessible to privileged code only and user accesses
> must generate a BusFault. We implement that for registers in
> the NVIC proper already, but missed it for systick since we
> implement it as a separate device. Correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/armv7m_systick.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index a17317ce2fe..94640743b5d 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -75,11 +75,17 @@ static void systick_timer_tick(void *opaque)
>      }
>  }
>  
> -static uint64_t systick_read(void *opaque, hwaddr addr, unsigned size)
> +static MemTxResult systick_read(void *opaque, hwaddr addr, uint64_t *data,
> +                                unsigned size, MemTxAttrs attrs)
>  {
>      SysTickState *s = opaque;
>      uint32_t val;
>  
> +    if (attrs.user) {
> +        /* Generate BusFault for unprivileged accesses */
> +        return MEMTX_ERROR;
> +    }
> +
>      switch (addr) {
>      case 0x0: /* SysTick Control and Status.  */
>          val = s->control;
> @@ -121,14 +127,21 @@ static uint64_t systick_read(void *opaque, hwaddr addr, unsigned size)
>      }
>  
>      trace_systick_read(addr, val, size);
> -    return val;
> +    *data = val;
> +    return MEMTX_OK;
>  }
>  
> -static void systick_write(void *opaque, hwaddr addr,
> -                          uint64_t value, unsigned size)
> +static MemTxResult systick_write(void *opaque, hwaddr addr,
> +                                 uint64_t value, unsigned size,
> +                                 MemTxAttrs attrs)
>  {
>      SysTickState *s = opaque;
>  
> +    if (attrs.user) {
> +        /* Generate BusFault for unprivileged accesses */
> +        return MEMTX_ERROR;
> +    }
> +
>      trace_systick_write(addr, value, size);
>  
>      switch (addr) {
> @@ -172,11 +185,12 @@ static void systick_write(void *opaque, hwaddr addr,
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "SysTick: Bad write offset 0x%" HWADDR_PRIx "\n", addr);
>      }
> +    return MEMTX_OK;
>  }
>  
>  static const MemoryRegionOps systick_ops = {
> -    .read = systick_read,
> -    .write = systick_write,
> +    .read_with_attrs = systick_read,
> +    .write_with_attrs = systick_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid.min_access_size = 4,
>      .valid.max_access_size = 4,
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
