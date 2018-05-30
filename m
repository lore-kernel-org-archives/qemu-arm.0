Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4256814wre;
        Tue, 29 May 2018 20:03:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK432X0T0GvjAcgDhvlLsyFbvT8lVNH6XR/sjQLB79hmEPpAwFNsZ7V91YoBVBQ7l+3qgzj
X-Received: by 2002:ac8:1978:: with SMTP id g53-v6mr939566qtk.282.1527649419539;
        Tue, 29 May 2018 20:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527649419; cv=none;
        d=google.com; s=arc-20160816;
        b=PNDXNp66BGC/DDPsq+g4P1kKe3m8X/PNqftsFy0JJ+ycwqi+BWFmObCzojUB5ZnVEA
         j4HELhmGOXlG+0/OntoY1l5loasxGbCG5iZ9QpE+dvYNJ2n225je8iME5H2Cm3gZo5MN
         ama1uKpe0PzjSqVPM1uC5GsppEiBC0otSCFPkQG2/hOazihr3Xzfu2A6tGqlxA+2XpdT
         f8PXof9i8DQXLjwPdeQ3IIbtMuGcLuG1TIge7HZ5zvs4YyRP5HcBO/xh4Tbo4EqMZZOa
         7eupSx3rnTgtx371qxbt/0D26NUIMDRUfd5H/gQs80gsq3xl/Bv20JNOcwEXNvur8Wfz
         WKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=2oRER/S+3dBxLitNAG9gKswQDgW9h6fAJwuRbtdb+f4=;
        b=mCT9r38SvWTGDNKEMEcnqjwTHqzTAELx53KOxkx3qr0CVWUIeNV/D2XGTloxqutnOp
         yyB3Lzj/fQHEVHo+iN7iQIz4mK1pjrFtrzkiKHt9R9yDfvauzMp0aiAOEXMz5eNZJhZe
         K1WSW9U1lIrZ6jd/CzhIoF12nj1QlbnHSqR1NwsIM2Saju50seqzBbLv/raqqJbNL0R2
         8NOVw+O7PER/a2Zrnmnde84ixamceNN6cxmTbL1vq+lgWj2s1tCqnS4M/zEb5MP4OZSz
         yNGNAJZ3Ab70arMXKYTWCFgOq4uggdq47ZdPjnkwWOdALbIcb6dVt087FSz+7d+jpOA/
         p4xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oYfOW15f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o12-v6si7719626qtp.401.2018.05.29.20.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 20:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oYfOW15f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNrOl-0000dq-2q
	for alex.bennee@linaro.org; Tue, 29 May 2018 23:03:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrOX-0000bP-TX
	for qemu-arm@nongnu.org; Tue, 29 May 2018 23:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrOW-0006cC-Tf
	for qemu-arm@nongnu.org; Tue, 29 May 2018 23:03:25 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrOQ-0006Xy-9b; Tue, 29 May 2018 23:03:18 -0400
Received: by mail-qt0-x244.google.com with SMTP id h2-v6so21478961qtp.7;
	Tue, 29 May 2018 20:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2oRER/S+3dBxLitNAG9gKswQDgW9h6fAJwuRbtdb+f4=;
	b=oYfOW15fWhH5E9QTKVQiDvFp+M6KAtStXFEXnjnyOxtmMtZNk6L9Pv1QsOEnjAzuGB
	+0iPnxcL1XzsjLoYo0ymKcGse+75c7XOZhg59KsWZgV1i28vT/nU5hY8nWT5uO1YhifE
	MoKNWxkt7/c9+iQ6oyVsPh3+ugsSu1HO93xDTbGgNDy3Wdh5vFGHAEcS7sRR4mGPBNtt
	QjGR7ugDfjo8rZJRn4NA4rxiroWvCvMdBrryzdO9T0jYaCZLnu3uZwYV1deD2daj8zu1
	lRYWMJ6xjo//0ZvpQiSn6gpJVM28fvCjcfFwui0zMJJffRl8zFIsrT3KbogrmeDv3/fP
	Si7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2oRER/S+3dBxLitNAG9gKswQDgW9h6fAJwuRbtdb+f4=;
	b=d1ky0fCf3hERMoTJlvu72osnh3abpP78XFwAlPnJA5IjejEWTGXFj6OWSz729lWUwh
	NFVhbpEFc0QgAg8UmIERIlhGxHBpG2n6vCXN7XyttX/t34A3U8hDYZSo6c0rOVncqQ6q
	uIgzMqNmCdmBaN9Wfowa2kPsw7Fil9S6eBUMx1zES/ItKjscLWkM1YQXuCdMWoddowit
	PsaPLOVNMYlJYB5n6Us4zawmUAdg0rjgp5JN94KKMmFmQk/MVinZzTvxmPU34nOf/HIU
	yROPXrroUMjoWw/haTcJFqUnSwC9w9TXed9qSY0ZC3SwpYDXAP8uSJs8o32IVBbpLomU
	/Ubw==
X-Gm-Message-State: APt69E37kn5cJKRKTWPPL22swSBPMTHU7+99ss8Khh7MTRzHokcJtR+J
	X6rAVT7LyEy/VL1d5+f14LAAHQMf
X-Received: by 2002:a0c:a525:: with SMTP id
	y34-v6mr858188qvy.206.1527649397538; 
	Tue, 29 May 2018 20:03:17 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	y84-v6sm23275085qkb.23.2018.05.29.20.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 20:03:16 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<20180529062838.20556-3-clg@kaod.org>
	<b0cb42ea-16f7-7806-814c-f472867e1a6a@amsat.org>
	<e21c77e5-c1de-eaf9-5357-1147f5d14ca0@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <da14dbd1-1064-c721-0104-fe872643e4aa@amsat.org>
Date: Wed, 30 May 2018 00:03:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e21c77e5-c1de-eaf9-5357-1147f5d14ca0@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 2/6] ftgmac100: add IEEE 802.1Q VLAN support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aRjNkGqpdM2b

On 05/29/2018 01:56 PM, Cédric Le Goater wrote:
> On 05/29/2018 03:34 PM, Philippe Mathieu-Daudé wrote:
>> Hi Cédric,
>>
>> On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
>>> The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
>>> has a control to remove VLAN tags from received packets.
>>>
>>> The VLAN control bits and VLAN tag information are contained in the
>>> second word of the transmit and receive descriptors. The Insert VLAN
>>> bit and the VLAN Tag available bit are only valid in the first segment
>>> of the packet.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/net/ftgmac100.c | 32 +++++++++++++++++++++++++++++++-
>>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>>> index 7598d08c9cb9..50af1222464a 100644
>>> --- a/hw/net/ftgmac100.c
>>> +++ b/hw/net/ftgmac100.c
>>> @@ -443,6 +443,24 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>>>              break;
>>>          }
>>>  
>>> +        /* Check for VLAN */
>>> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
>>> +            bd.des1 & FTGMAC100_TXDES1_INS_VLANTAG &&
>>> +            be16_to_cpu(PKT_GET_ETH_HDR(ptr)->h_proto) != ETH_P_VLAN) {
>>> +            if (frame_size + len + 4 > sizeof(s->frame)) {
>>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes\n",
>>> +                              __func__, len);
>>> +                s->isr |= FTGMAC100_INT_XPKT_LOST;
>>> +                len =  sizeof(s->frame) - frame_size - 4;
>>> +            }
>>> +            memmove(ptr + 16, ptr + 12, len - 12);
>>> +            ptr[12] = 0x81;
>>> +            ptr[13] = 0x00;
>>
>>                stw_be_p(ptr + 12, ETH_P_VLAN);
>>
>>> +            ptr[14] = (uint8_t) bd.des1 >> 8;
>>> +            ptr[15] = (uint8_t) bd.des1;
>>
>>                stw_be_p(ptr + 12, bd.des1);
> 
> ptr + 14

copy/paste mistake ;)

>>> +            len += 4;
>>> +        }
>>> +
>>>          ptr += len;
>>>          frame_size += len;
>>>          if (bd.des0 & FTGMAC100_TXDES0_LTS) {
>>> @@ -858,7 +876,19 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>>>              buf_len += size - 4;
>>>          }
>>>          buf_addr = bd.des3;
>>> -        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
>>> +        if (first && proto == ETH_P_VLAN && buf_len >= 18) {
>>> +            bd.des1 = (buf[14] << 8) | buf[15] | FTGMAC100_RXDES1_VLANTAG_AVAIL;
>>
>>                bd.des1 = lduw_be_p(buf + 14) |
>> FTGMAC100_RXDES1_VLANTAG_AVAIL;
>>
>>> +            if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
>>> +                dma_memory_write(&address_space_memory, buf_addr, buf, 12);
>>> +                dma_memory_write(&address_space_memory, buf_addr + 12, buf + 16,
>>> +                                 buf_len - 16);
>>> +            } else {
>>> +                dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
>>> +            }
>>> +        } else {
>>> +            bd.des1 = 0;
>>> +            dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
>>> +        }
>>>          buf += buf_len;
>>>          if (size < 4) {
>>>              dma_memory_write(&address_space_memory, buf_addr + buf_len,
>>>
>>
>> With ldst API uses:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
> 
> Sure, I will fix these.

Thanks!
