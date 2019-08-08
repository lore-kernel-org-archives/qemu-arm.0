Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7485116wrv;
        Thu, 8 Aug 2019 00:01:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygCcI9P7esztUxRTsyKay3/WMVR1yVJsTZBBu6bYJZUJF6fcJA5gxQcAoHTzdi7FXrnbPQ
X-Received: by 2002:aa7:c753:: with SMTP id c19mr14166199eds.81.1565247694307;
        Thu, 08 Aug 2019 00:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565247694; cv=none;
        d=google.com; s=arc-20160816;
        b=drnDHE9Qxzz0tfzLhPjtcvOY8gKY+JD3U6ZFJm3OUHkCIw9ZpM0QeraAUw7xndRReT
         IkAkOFY7HVJ/Q9IsyGosUjZGU4vaae+kWwLGrdthsIrg4X49ONGp2r4J06H4FE0RX8Y2
         ISFobkDi0B3QzCCDWL8iJKufUWK0tUdqwJ1sovHy3WTvaKbj9E1ex2eAVpPVYRLK1rNO
         uYdzuwcViiHv5gFNggGwyy3ThXypucF8pMwbCGAXes3T0v3KiMU2FKZVSx3OVxuQRh6Y
         HRx2Dyztb+zQsgFKywhwwOOcoNbm5t7kqF6HK7S2Ok+5yKBopnr5z2tJK4tyJFd/Wov5
         USLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=G/ZL4e4iz98TCLCwtf4XenPuZv9ljfcx/ZJabDdJRrE=;
        b=NM4Z8ZC6FOESWGx4V/cWViGEElI8QFS0T6yTsQJwPGeXcrqAhin3ktLPPoVE3/Icv9
         7hLn3mg4lry7UK7KTNoRwwXZvhzt2Ca4qC+9+BAO02Mn5yQFCBi2DOCu6iXBupB3EpyU
         C7BZNGepU4VrlmV8uhp28HtGVj5z26nOL+Ogdu95VzhAyPPGXaCBzACpP0+lInAlYd2i
         WGWHqTSkVPwLOa7bd01/Q3ugUIviXS2fcCudTBBp+VS+sl87H9YMRmRuxquEQ2i/8m2N
         7+rLKRUZDO7QT2z6aUu/TexijVIVguofwm3/hJscwqzbPchWi9THtff94UGI0gtTtlyW
         ENYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x56si33713183edb.348.2019.08.08.00.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 00:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvcQX-0002h7-8b
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 03:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvcQH-0002fP-BB
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 03:01:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvcQG-0003MQ-2X
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 03:01:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvcQF-0003M2-TO
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 03:01:16 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so93794674wrm.1
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2019 00:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G/ZL4e4iz98TCLCwtf4XenPuZv9ljfcx/ZJabDdJRrE=;
 b=NUfCgznSd0jo6H9lU/JkSrlBjT1AkgkUnSDhG0EJ59nNpDu2DQ0O1Z+4pcEYTwc5yE
 VnyODVWcOEa+FXrCvF0Lrd+ea5hGnA4PGjw5qf9eDqtfrx5Aex7uDYznbllFD+5tRBd3
 0/wkgaVwj66kMxRwarUR8KVl3ufKQ8dJK7ihQZtdiBtl1S+VQfZxq0zj99QPZvKxD6my
 KBNgXzCYWp06w/G8cWy0c75psewWFHsiYQ7wEe/25zjSK48a2PW5zAqlS2QleVykSI5P
 DFy9OPsidM1YjozGcX5aKlJHzwsh17Xes5BFhVRQVv0e87gEqpu0md8s/G9H40KitYTe
 wNrg==
X-Gm-Message-State: APjAAAXj4S8H7DCmxqqmiTbNROowP9fI0DV/8pRwxiko8ngaUJvMqVj7
 7TJczAOqpKLZbpg+0lPo7Bf0BOMuTHw=
X-Received: by 2002:adf:f68b:: with SMTP id v11mr14343924wrp.116.1565247674613; 
 Thu, 08 Aug 2019 00:01:14 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id e4sm8429179wrh.39.2019.08.08.00.01.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 00:01:14 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>
References: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
 <1565239479-2130-1-git-send-email-bmeng.cn@gmail.com>
 <d0ca78ec-c5d4-bc80-6f2e-3e933013b5f4@redhat.com>
 <CAEUhbmVKnUkJ66A-mULpkqZppb=2c8NVAFJhZhOMpOdyRRxSQQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1070f952-68d2-8849-bac8-4b58ab10ed9b@redhat.com>
Date: Thu, 8 Aug 2019 09:01:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVKnUkJ66A-mULpkqZppb=2c8NVAFJhZhOMpOdyRRxSQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw: net: cadence_gem: Fix
 build errors in DB_PRINT()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D/3aPhQO9KRi

On 8/8/19 8:36 AM, Bin Meng wrote:
> On Thu, Aug 8, 2019 at 1:21 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> On 8/8/19 6:44 AM, Bin Meng wrote:
>>> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
>>> compilation errors in DB_PRINT(). Fix them.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>
>> Please don't reply to previous version, post as a new thread (it is
>> harder to notice your new versions in a emails threaded view).
>>
> 
> OK.
> 
>>> - use HWADDR_PRIx instead of TARGET_FMT_plx for consistency
>>> - use 'z' modifier to print sizeof(..)
>>>
>>>  hw/net/cadence_gem.c | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>> index d412085..b6ff2c1 100644
>>> --- a/hw/net/cadence_gem.c
>>> +++ b/hw/net/cadence_gem.c
>>> @@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>>              return -1;
>>>          }
>>>
>>> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
>>> -                rx_desc_get_buffer(s->rx_desc[q]));
>>> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
>>
>> rx_desc_get_buffer() returns a uint64_t, shouldn't you use a PRIx64
>> format here?
> 
> HWADDR_PRIx expands to PRIx64. I got your point that since it does not
> return hwaddr, so we should use PRIx64 directly. Correct?
> 
>>
>>> +                 MIN(bytes_to_copy, rxbufsize),
>>
>> Nitpick #1: since you are cleaning this file up, bytes_to_copy and
>> rxbufsize are both unsigned, so the first format should be %u instead of %d.
> 
> Sure, will do in v3.
> 
>>
>>> +                 rx_desc_get_buffer(s, s->rx_desc[q]));
>>>
>>>          /* Copy packet data to emulated DMA buffer */
>>>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
>>> @@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
>>>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>>>                                                 (p - tx_packet)) {
>>>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
>>> -                         "0x%x\n", (unsigned)packet_desc_addr,
>>> +                         "0x%zx\n", (unsigned)packet_desc_addr,
>>
>> Nitpick #2: packet_desc_addr is of type hwaddr, so removing the cast the
>> 1st format is HWADDR_PRIx, also removing the 2nd cast the 2nd format is
>> PRIx64.
> 
> packet_desc_addr() return unsigned, so %x should be OK.

'packet_desc_addr' is of type hwaddr,
'(unsigned)packet_desc_addr' is casted to type unsigned.

Anyhow I now remember I already reviewed this patch:
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03263.html

>>
>> Then the 3rd format is now correct.
>>
>>>                           (unsigned)tx_desc_get_length(desc),
>>>                           sizeof(tx_packet) - (p - tx_packet));
>>>                  break;
>>>
