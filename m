Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3434960wru;
        Fri, 5 Jul 2019 11:19:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+/sdIylOKrUx8CTbaqQjYRSkPa9OW3M4jCxEf3ZbnhGRO4+cPJy487wWoMYS4bjGHbUVR
X-Received: by 2002:a17:906:24c1:: with SMTP id f1mr4780821ejb.285.1562350795360;
        Fri, 05 Jul 2019 11:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562350795; cv=none;
        d=google.com; s=arc-20160816;
        b=VsasoZ2xO+AX9pOUHdVGcRDJ4Mu+zmrzk2Zfpwjq+2cvhBeZXyrvcf9/KP3MuaA4Qp
         Tw/yw4NvuXdWMDdqAvSGpZUfedB69CsDa4Ip/pD0saVYetit6VJxLR6skSZ4vE6KMfws
         DnbyFtX8tdz4NAQylh/eZALJybhpJFIxJ/ItcfXPnisJ5rkNw6uRxQ2RvYX4YsFuCO+W
         xBKpKOMkNPQZdkPzO14ADdbtGoW8fXocqM3LGHxa25rL5E7U6V9+BzrB41RnNH0OGtHD
         hVyPfuWRdm7SOcCTthF92DZY5Il3UHPMLzJKIyBR0PZu0Ys1Av2KU0E0WmIQcEKXdkCO
         9aww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=a7G+gKhk9iRxn/Cm9WJdiFGuOhS35Knk5uYs/0UJviQ=;
        b=oB+0ezMx3i4RA0O75+wK0Am9BHDfUMgPSUrQ/Iaw1yk0nHyLT8gepfKMVPkuEamc6t
         urR0eURlT6pmMLEpmkSANWIngQZMy7qzCA8jhaWGoJPhyOl4EpwQHXU4yzDwn7SS5oia
         JFWlcWFtM5CKIL6ZxnG/+lrWJ+j5V3EsLZO8LcWQnPfHiktOOm8Oi0+JWASQI2+YtN0E
         dI1SfIyB7yZWUurfPgNzdCoK6MENSHT++t1lqnp5vzrJJK9D66buNsmfR+L9+F2ITgqy
         UqYDUi28HJvzQ64jSbi8SeZLhBNMlm/yl2reLIK0cLQSrSVoaTqWD6ihc3cDgCjG8dSt
         Zhlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si6104968ejv.125.2019.07.05.11.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 11:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjSoM-0003Tz-17
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 14:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjSny-0003OE-1d
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 14:19:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjSnu-0004yT-QS
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 14:19:29 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hjSnr-0004uT-09
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 14:19:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so10538346wmj.5
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2019 11:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a7G+gKhk9iRxn/Cm9WJdiFGuOhS35Knk5uYs/0UJviQ=;
 b=P2HRLf7nDgz/DuA3hPw2uGLPnBfglKMKphM7jRoHsqpQ5Jnp/Ca3/RujYKYDsumQHt
 y8VFk3SNjZzx0XAA0NaYQPXpJID1eEB1DnDLs2LrrmtUHYaLUNAn1gfZrBT+jGu7Tmo/
 102xe4RKinjczHJjVuxdzKQQSUm844I59S4+FRXp5sX4Yet8aT3ii/g96euXwOOUT6Kb
 QglMmdqS7mHeWTdRE030POyLIqL8f84gRLyftF+ZYb6rdg501g1yEo0IruMwc0bZ9Tpi
 anp4sdZh1zJyjPsjWcMfFrFXiMW9fe5IjX3+P1mFpk2kOFwvjkzKAXbdL1L4X/B+lWQW
 1hJw==
X-Gm-Message-State: APjAAAWF/9zL8zB+Tp5ANc3SntVLOv1wcucbYeaBCz6RPPjZcLRzbHLy
 Mv5jvItKL7FcR9/gvrLiIcQh7A==
X-Received: by 2002:a1c:e710:: with SMTP id e16mr3843762wmh.38.1562350760164; 
 Fri, 05 Jul 2019 11:19:20 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id o126sm8787870wmo.1.2019.07.05.11.19.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 11:19:19 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Francisco Iglesias <frasse.iglesias@gmail.com>
References: <20190705150850.4967-1-philmd@redhat.com>
 <20190705150850.4967-2-philmd@redhat.com>
 <20190705155338.duhw5hw4tnaixyp4@fralle-msi>
 <a6a359ac-6cbf-b7bf-ab18-096976110483@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c6ce0479-8daa-8593-4c6f-eef477aac3e2@redhat.com>
Date: Fri, 5 Jul 2019 20:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a6a359ac-6cbf-b7bf-ab18-096976110483@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH v3 1/2] hw/ssi/xilinx_spips: Convert
 lqspi_read() to read_with_attrs
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1QLo7hb/VQkD

On 7/5/19 7:06 PM, Philippe Mathieu-Daudé wrote:
> On 7/5/19 5:53 PM, Francisco Iglesias wrote:
>> Hi Philippe,
>>
>> On [2019 Jul 05] Fri 17:08:49, Philippe Mathieu-Daudé wrote:
>>> In the next commit we will implement the write_with_attrs()
>>> handler. To avoid using different APIs, convert the read()
>>> handler first.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  hw/ssi/xilinx_spips.c | 20 ++++++++++----------
>>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
>>> index 8115bb6d46..e80619aece 100644
>>> --- a/hw/ssi/xilinx_spips.c
>>> +++ b/hw/ssi/xilinx_spips.c
>>> @@ -1202,27 +1202,27 @@ static void lqspi_load_cache(void *opaque, hwaddr addr)
>>>      }
>>>  }
>>>  
>>> -static uint64_t
>>> -lqspi_read(void *opaque, hwaddr addr, unsigned int size)
>>> +static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value,
>>> +                              unsigned size, MemTxAttrs attrs)
>>>  {
>>> -    XilinxQSPIPS *q = opaque;
>>> -    uint32_t ret;
>>> +    XilinxQSPIPS *q = XILINX_QSPIPS(opaque);
>>>  
>>>      if (addr >= q->lqspi_cached_addr &&
>>>              addr <= q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4) {

Looking at Frederic's commit 252b99baeb9, it seems this "4" has to be
replaced by "size", or cleaner, use .impl.min_access_size = 4.

Currently we have:

static const MemoryRegionOps lqspi_ops = {
    .valid = {
        .min_access_size = 1,
        .max_access_size = 4
    }
};

If we use:

- size = 1
- addr = LQSPI_CACHE_SIZE - 1

We have

'addr >= q->lqspi_cached_addr': true
'addr <= q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4': true

>>>          uint8_t *retp = &q->lqspi_buf[addr - q->lqspi_cached_addr];
>>> -        ret = cpu_to_le32(*(uint32_t *)retp);

Are we reading 3 extra bytes?

>>> -        DB_PRINT_L(1, "addr: %08x, data: %08x\n", (unsigned)addr,
>>> -                   (unsigned)ret);
>>> -        return ret;
>>> +        *value = cpu_to_le32(*(uint32_t *)retp);
>>> +        DB_PRINT_L(1, "addr: %08" HWADDR_PRIx ", data: %08" PRIx64 "\n",
>>> +                   addr, *value);
>>>      } else {
>>>          lqspi_load_cache(opaque, addr);
>>> -        return lqspi_read(opaque, addr, size);
>>> +        lqspi_read(opaque, addr, value, size, attrs);
>>
>> If you don't want to leave the return value floating you can always keep the
>> 'return' (I'm unsure if coverity will complain about that).
> 
> Ah, I missed that, I'll fix.
> 
>>
>> Either way:
>>
>> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> 
> Thanks!
> 
> I'll wait some more time of other want to review, then I'll respin with
> the typo you corrected in the 2nd patch fixed.
> 
>>
>>>      }
>>> +
>>> +    return MEMTX_OK;
>>>  }
>>>  
>>>  static const MemoryRegionOps lqspi_ops = {
>>> -    .read = lqspi_read,
>>> +    .read_with_attrs = lqspi_read,
>>>      .endianness = DEVICE_NATIVE_ENDIAN,
>>>      .valid = {
>>>          .min_access_size = 1,
>>> -- 
>>> 2.20.1
>>>
