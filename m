Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3374236wru;
        Fri, 5 Jul 2019 10:06:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxi0DVBzKvN3ruWbTwQ7hXOWwEheyGcPmECOhbGKi7RopRZpB0XNpfuCSJDxsYMSdgB9X7p
X-Received: by 2002:aa7:cd17:: with SMTP id b23mr4974244edw.278.1562346393746;
        Fri, 05 Jul 2019 10:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562346393; cv=none;
        d=google.com; s=arc-20160816;
        b=UxDzPY87ekzwcUisqkiv4fYhS6CU+pIT9jfAfFFNARm/99oz08TzAcMbno5D4h2OQ0
         hBjLIbDkR4BEIQOEFIrEDqx6qD/xuYtNA6d7h5jx/WlCkl/6pSIv9Gk78PeZO1tUF6GP
         vsClm40FcHJdozC/T/l+8gmjYdbvQ8fLPcN3GyGtU5T0IVNu2ZIcsMHse+ps8o5jwFxJ
         CWitDUieIzzufjh04yYy7pOusXiP8OMwrEyel4S8d5Q+5qQqxvlhOAvjChKBxPrjMU7m
         Qgf1r6ar1IrqjdDPjFhMNROIN/nVFYjITrPy0qWunzqikFK6RsG5t4z5bijMFMVuIsAy
         LYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=g7Zjgn9ccbxMWD7R6vbyKhMxyc8I0phsWXHyjwKi3Bg=;
        b=NN9XBw4fASJ0PE34ybM9JCTxpikYB34GuvJj3Yt2tCsSYvcGc9yozRW5TPiQAX6yaI
         IDWN32PJXxVytBSxm9K+C75nqMXf+beMBehauR7kiYfrvR5d3jje4ZmRi6Xw1aqmVOry
         x9VgSTniHPhgMkkcJuc+kfaotLtnPz6oDwO7zQhIRCGa7ltkNx7/9yEzghEODLan6+pO
         ie7ma5W4+Y+jLCuY1zq8S6Gnwvz89Ql/nW/sP+0Qfy2bc+g7NEFkHqBsc7jUvPa3AqvD
         upiHam4WW1WiS/oYuNfCDB2SUhHtvDj7MBQ3eNRhxlmMUuWBvhvQ8C0WQekVjZRBqVyx
         b8AA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f44si1855529edb.68.2019.07.05.10.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 10:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjRfM-0001U0-Ru
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 13:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjRfD-0001QW-1U
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 13:06:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjRfB-00047S-6n
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 13:06:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hjRfA-000457-Vi
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 13:06:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id a10so9517784wrp.9
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2019 10:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g7Zjgn9ccbxMWD7R6vbyKhMxyc8I0phsWXHyjwKi3Bg=;
 b=NIm5qqaL8yK7ONksos7ouEK2ej7YYvCHG94lCq2HHs+r8pNhe2rU/zVaaPGjGyW2LJ
 hiEUg8kqs6MJ3VyYjeEE6dToGK0yEtsE0EkRblvtR4WgJ6dlGuYsM19qNzYCRB3kktr9
 hMaBav649OBMkk/HujMBNuVybGnfAOmbyQ/b9M6y4og3G8vCvm/FxO80YBCdaaJHYh7Z
 qvdJJH6PXxmGpzPEwBOabKIZNPJM3NY8pS02PPDMuxXhYJrGGK6JzWnnpRMNmkEndi2x
 MfpjtvsyRgf2RfQXq0ngAgOXLf5HeA65O7w75/rLUTejdw7AG7U4feV/A2cvj0BbUOR8
 WX6g==
X-Gm-Message-State: APjAAAX8K7cJ8N/EoXeGzWc5AskqSkaritXP45Tf6iKuiu5sf2En6Rsh
 9IoHnaZayWDz7ZLc1GyE1gKi0A==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr4810283wrs.105.1562346379327; 
 Fri, 05 Jul 2019 10:06:19 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id f7sm8247894wrv.38.2019.07.05.10.06.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 10:06:18 -0700 (PDT)
To: Francisco Iglesias <frasse.iglesias@gmail.com>
References: <20190705150850.4967-1-philmd@redhat.com>
 <20190705150850.4967-2-philmd@redhat.com>
 <20190705155338.duhw5hw4tnaixyp4@fralle-msi>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a6a359ac-6cbf-b7bf-ab18-096976110483@redhat.com>
Date: Fri, 5 Jul 2019 19:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705155338.duhw5hw4tnaixyp4@fralle-msi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
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
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WJtbmIRegecI

On 7/5/19 5:53 PM, Francisco Iglesias wrote:
> Hi Philippe,
> 
> On [2019 Jul 05] Fri 17:08:49, Philippe Mathieu-Daudé wrote:
>> In the next commit we will implement the write_with_attrs()
>> handler. To avoid using different APIs, convert the read()
>> handler first.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/ssi/xilinx_spips.c | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
>> index 8115bb6d46..e80619aece 100644
>> --- a/hw/ssi/xilinx_spips.c
>> +++ b/hw/ssi/xilinx_spips.c
>> @@ -1202,27 +1202,27 @@ static void lqspi_load_cache(void *opaque, hwaddr addr)
>>      }
>>  }
>>  
>> -static uint64_t
>> -lqspi_read(void *opaque, hwaddr addr, unsigned int size)
>> +static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value,
>> +                              unsigned size, MemTxAttrs attrs)
>>  {
>> -    XilinxQSPIPS *q = opaque;
>> -    uint32_t ret;
>> +    XilinxQSPIPS *q = XILINX_QSPIPS(opaque);
>>  
>>      if (addr >= q->lqspi_cached_addr &&
>>              addr <= q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4) {
>>          uint8_t *retp = &q->lqspi_buf[addr - q->lqspi_cached_addr];
>> -        ret = cpu_to_le32(*(uint32_t *)retp);
>> -        DB_PRINT_L(1, "addr: %08x, data: %08x\n", (unsigned)addr,
>> -                   (unsigned)ret);
>> -        return ret;
>> +        *value = cpu_to_le32(*(uint32_t *)retp);
>> +        DB_PRINT_L(1, "addr: %08" HWADDR_PRIx ", data: %08" PRIx64 "\n",
>> +                   addr, *value);
>>      } else {
>>          lqspi_load_cache(opaque, addr);
>> -        return lqspi_read(opaque, addr, size);
>> +        lqspi_read(opaque, addr, value, size, attrs);
> 
> If you don't want to leave the return value floating you can always keep the
> 'return' (I'm unsure if coverity will complain about that).

Ah, I missed that, I'll fix.

> 
> Either way:
> 
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

Thanks!

I'll wait some more time of other want to review, then I'll respin with
the typo you corrected in the 2nd patch fixed.

> 
>>      }
>> +
>> +    return MEMTX_OK;
>>  }
>>  
>>  static const MemoryRegionOps lqspi_ops = {
>> -    .read = lqspi_read,
>> +    .read_with_attrs = lqspi_read,
>>      .endianness = DEVICE_NATIVE_ENDIAN,
>>      .valid = {
>>          .min_access_size = 1,
>> -- 
>> 2.20.1
>>
