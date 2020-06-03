Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp289871lfc;
        Wed, 3 Jun 2020 01:30:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5w6bYwkk9eVg6Jwzqv9208wXrJ2/L/d1uoI56cI0+14pTxdNhagJmcGABfU5lyCzTFhzi
X-Received: by 2002:a25:1645:: with SMTP id 66mr49652849ybw.332.1591173011017;
        Wed, 03 Jun 2020 01:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591173011; cv=none;
        d=google.com; s=arc-20160816;
        b=G5yxCN0zV1tS/GefFeobhYbCtAKJ15zQ2T1v3WDB/Bc2Co22O7/gIxlUjKAH/sFOdR
         2sgmdCdxtU7JgRCatmfdNGdum93o9nZGVBggTYfPyu/c1KbK824bx6P0vsCdsykJQwxr
         1xy5r6lTPP3eApu+4dGIa1+AqNuYsOMGw6L8jwEszxK2f6aco8+nS2gbqX2oV1myzHsX
         n9aCcNy7LZmSXKNihWxoWIb91l2FOCK3375MYqOLBodVT+g09rVaFDf94O3bPVYOD8ff
         65G8y3EKhbgMoccBgAq0CkpPYq3iUitXNMZvUlZcdV/+Q/HwEsmwTbLOXHf9KRJGb6jf
         IR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=eYpjP4HI5n0xKDQnYToJ5hhU0cWQjOySbR9SpeJBOTc=;
        b=oyTxzvVHGSrOUFejZ5rJdZN2SF/EeGxtuzDPIuOdBw2JO68qRUCWKNTIFx4yvdlN8i
         sssjQmZsl2ueyvGAEgzHJvpuYfLVKtB/flEsW87omV6Y+qBJZMVw4kKEDta0YNfDrHq4
         GCYjietztTsioPhsuNA3y6Te8vqZHAU7QzuX8Bz682NDs1EOxhEqoqy5IhEn9sNisfAH
         rSwKN8/TnnQyaR7Wo7eJCQA7umA9iCkfjR7pJAZ+kEJ47ZIkpmZ0naoymffd5pDB0HoM
         1bdYStKVJPwk3CtjgD7wC7vTeoB3eqz6g3uA6X9abqWKEaQdGwMfJ7c9QjGwjOEOz3Lq
         /ahQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a202si1129042ybg.327.2020.06.03.01.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 01:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgOmo-0002jG-9Q
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 04:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jgOmf-0002iM-Il
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 04:30:01 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:49150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jgOme-0004KM-B0
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 04:30:01 -0400
Received: from player796.ha.ovh.net (unknown [10.110.208.89])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id C83A91DD09A
 for <qemu-arm@nongnu.org>; Wed,  3 Jun 2020 10:29:56 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 14E2912EB2CBB;
 Wed,  3 Jun 2020 08:29:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b42397c5-7f34-4704-a98e-0fa489fd73a2,C5A150AF1F13250A6CA48450E7A9998CD11FBF1B)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] ftgmac100: Implement variable descriptor size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Erik Smit <erik.lucas.smit@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <CA+MHfov0TVbwjy8g_cHVa6Y-bMowCbsGLdt8uUhmcns0v_eVLw@mail.gmail.com>
 <902ebbb5-3e9d-6720-745f-8535a5cd25e8@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <aae38f77-ebaa-9375-e59b-b78ea075325d@kaod.org>
Date: Wed, 3 Jun 2020 10:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <902ebbb5-3e9d-6720-745f-8535a5cd25e8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6882626132299189056
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudefledgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekhfetudefffevvdeljeeggeehvdegueeiueefjeeuledtudegudehvdevlefgheenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.172.75; envelope-from=clg@kaod.org;
 helo=4.mo2.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 04:29:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-TUID: g/PpprYrH4Ez

On 6/3/20 9:08 AM, Philippe Mathieu-Daudé wrote:
> On 6/2/20 6:47 PM, Erik Smit wrote:
>> The hardware supports variable descriptor sizes, configured with the DBLAC
>> register.
>>
>> Most drivers use the default 2*8, which is currently hardcoded in qemu, but
>> the implementation of the driver in Supermicro BMC SMT_X11_158 uses 4*8.
>>
>> --
>> The implementation of the driver in Supermicro BMC SMT_X11_158 adds 4 extra
>> 4-bytes entries:
>> https://github.com/ya-mouse/openwrt-linux-aspeed/blob/master/drivers/net/ftgmac100_26.h#L387-L391
>>
>> And sets DBLAC to 0x44f97:
>> https://github.com/ya-mouse/openwrt-linux-aspeed/blob/master/drivers/net/ftgmac100_26.c#L449
>>
>> There's not a lot of public documentation on this hardware, but the
>> current linux driver shows the meaning of these registers:
>>
>> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/faraday/ftgmac100.c#L280-L281
>>
>>         iowrite32(FTGMAC100_DBLAC_RXDES_SIZE(2) |   /* 2*8 bytes RX descs */
>>                   FTGMAC100_DBLAC_TXDES_SIZE(2) |   /* 2*8 bytes TX descs */
>>
>> Without this patch, networking in SMT_X11_158 does not pass data.
> 
> Does it really 'pass' *all* the data?
> 
> This patch seems incomplete...
> 
> IMO you should 1/ declare FTGMAC100Desc as:
> 
> typedef struct {
>     uint32_t        des0;
>     uint32_t        des1;
> } FTGMAC100Desc;

The TX and RX descriptors have 4 words in the architecture which are
used by HW but software can use bigger size for its own purpose. This 
is what is doing the Aspeed SDK.

> 2/ Replace the code using static '2' by dynamic use of
> FTGMAC100_DBLAC_xXDES_SIZE(dblac):
> 
>   static int ftgmac100_read_bd(FTGMAC100Desc **bd, dma_addr_t addr)
>   {
>       unsigned bd_idx;
> 
>       if (dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd))) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read descriptor
> @ 0x%"
>                         HWADDR_PRIx "\n", __func__, addr);
>           return -1;
>       }
>       for (bd_idx = 0; bd_idx< FTGMAC100_DBLAC_RXDES_SIZE(s->dblac);
> bd_idx++) {
>           bd[bd_idx]->des0 = le32_to_cpu(bd[bd_idx]->des0);
>           bd[bd_idx]->des1 = le32_to_cpu(bd[bd_idx]->des1);
>       }
> 
>       return 0;
>   }
> 
> Etc...
> 

The current ftgmac100_read_bd() and ftgmac100_write_bd() routines model 
the HW perspective and they are fine as they are I think.

C.

> Maybe worth introduce the bd_to_cpu()/cpu_to_bd() helpers too
> (respectively calling le32_to_cpu & cpu_to_le32).
>>
>> Signed-off-by: Erik Smit <erik.lucas.smit@gmail.com
>> <mailto:erik.lucas.smit@gmail.com>>
>> ---
>>  hw/net/ftgmac100.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>> index 25ebee7ec2..1640b24b23 100644
>> --- a/hw/net/ftgmac100.c
>> +++ b/hw/net/ftgmac100.c
>> @@ -79,6 +79,19 @@
>>  #define FTGMAC100_APTC_TXPOLL_CNT(x)        (((x) >> 8) & 0xf)
>>  #define FTGMAC100_APTC_TXPOLL_TIME_SEL      (1 << 12)
>>
>> +/*
>> + * DMA burst length and arbitration control register
>> + */
>> +#define FTGMAC100_DBLAC_RXFIFO_LTHR(x)      (((x) >> 0) & 0x7)
>> +#define FTGMAC100_DBLAC_RXFIFO_HTHR(x)      (((x) >> 3) & 0x7)
>> +#define FTGMAC100_DBLAC_RX_THR_EN           (1 << 6)
>> +#define FTGMAC100_DBLAC_RXBURST_SIZE(x)     (((x) >> 8) & 0x3)
>> +#define FTGMAC100_DBLAC_TXBURST_SIZE(x)     (((x) >> 10) & 0x3)
>> +#define FTGMAC100_DBLAC_RXDES_SIZE(x)       (((x) >> 12) & 0xf)
>> +#define FTGMAC100_DBLAC_TXDES_SIZE(x)       (((x) >> 16) & 0xf)
>> +#define FTGMAC100_DBLAC_IFG_CNT(x)          (((x) >> 20) & 0x7)
>> +#define FTGMAC100_DBLAC_IFG_INC             (1 << 23)
>> +
>>  /*
>>   * PHY control register
>>   */
>> @@ -553,7 +566,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s,
>> uint32_t tx_ring,
>>          if (bd.des0 & s->txdes0_edotr) {
>>              addr = tx_ring;
>>          } else {
>> -            addr += sizeof(FTGMAC100Desc);
>> +            addr += (FTGMAC100_DBLAC_TXDES_SIZE(s->dblac)) * 8;
> 
> Extra parenthesis not needed.
> 
> After doing 1/ you can now replace '8' by sizeof(FTGMAC100Desc).
> 
>>          }
>>      }
>>
>> @@ -982,7 +995,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc,
>> const uint8_t *buf,
>>          if (bd.des0 & s->rxdes0_edorr) {
>>              addr = s->rx_ring;
>>          } else {
>> -            addr += sizeof(FTGMAC100Desc);
>> +            addr += (FTGMAC100_DBLAC_RXDES_SIZE(s->dblac)) * 8;
>>          }
>>      }
>>      s->rx_descriptor = addr;
>> --
>> 2.25.1
> 

