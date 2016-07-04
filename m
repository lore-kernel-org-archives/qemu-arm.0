Received: by 10.25.21.96 with SMTP id l93csp1652195lfi;
        Mon, 4 Jul 2016 11:42:58 -0700 (PDT)
X-Received: by 10.55.186.193 with SMTP id k184mr18343176qkf.184.1467657778796;
        Mon, 04 Jul 2016 11:42:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t68si2792398qka.257.2016.07.04.11.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 11:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK8pe-0004ff-53
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 14:42:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bK8pZ-0004eV-5Z
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 14:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bK8pU-00067F-6L
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 14:42:52 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bK8pT-000676-PS; Mon, 04 Jul 2016 14:42:48 -0400
Received: by mail-lf0-x244.google.com with SMTP id l188so17845932lfe.0;
	Mon, 04 Jul 2016 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=dY9ehaOAMKC8jp0pT45h0O5fBSq9Liez6Rc8ic45DyE=;
	b=K2zQg3rjw40SO6VUaeB+Dr5kG1tLxNOvG1RjhyfUrn09bW7WkMdRBP5mVTVb4+3PUB
	cuQy5tjxizGbJitIelfoESZPcfw31vdHh/CKbrnDX1N4DWrBvff4nO0EUbpWiWJcmZLl
	FDRlCBsIdlE3/BYtbrjKRf57Zl+ZWWcNhjqIrzuBaRUc/SVb3+2GmM+EYATJq+G8Z6g/
	/GOlN/I9nemyIfdnrI/d9NnzykEK4uCAMXT/82nrTuk3tLAFk3ibeNn0f5go0KpHz1Iy
	GKbpC765Fsm3nTVmqs76fOprWGDB4mDLwW/p1LRT3zs3B/rlS2ykBdapZ99xFSyW5JL3
	P7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dY9ehaOAMKC8jp0pT45h0O5fBSq9Liez6Rc8ic45DyE=;
	b=mhzglK9UL6riB/7waZYH7vb43WEbbu7ult40zH7KdDz6AUtj4puLYAzSoVvn+NnuFa
	YYeW1OPfn1ZHsW9pwOBlLyiX1BUMVK1MbQdynNOJuo/MNgjTQA23xhy/9BwoerZxwn1K
	sHs2TL/BHfhyFHbZk0UqjJYXHnKwLSZCo5n9fRMH6UM1ieB4N0IOtUJBQ+ttFza7gV1m
	KqgOiutUOFxsmxnFO/9vbqee1FK8sUM+lRFQvXGg29w6gU6v9Z4EHSuXA3fAUwzwP0uE
	dbaZ2XEId3Ec1mO1lAJ/xxixpqOHfIGX14HclOxy63misTuClLgcAdWYELXIgRs4YjTq
	Bpcg==
X-Gm-Message-State: ALyK8tLtYYV0UmRVmCKwLoPjuIqxolbG9dlzkODtc1gQNE+pfSXlBcx8880taTNfZF9fxw==
X-Received: by 10.25.77.13 with SMTP id a13mr2868113lfb.190.1467657766620;
	Mon, 04 Jul 2016 11:42:46 -0700 (PDT)
Received: from [192.168.75.104] (31-178-123-4.dynamic.chello.pl.
	[31.178.123.4]) by smtp.gmail.com with ESMTPSA id
	h41sm4768250lji.39.2016.07.04.11.42.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jul 2016 11:42:45 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<daf14775-cbd6-3f5d-a384-e50b1dc7830b@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <577AAE24.6020305@gmail.com>
Date: Mon, 4 Jul 2016 20:42:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <daf14775-cbd6-3f5d-a384-e50b1dc7830b@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tO4/QggFAJvF



W dniu 04.07.2016 o 20:12, Cédric Le Goater pisze:
> On 07/04/2016 07:57 PM, mar.krzeminski wrote:
>>
>> W dniu 04.07.2016 o 14:18, Cédric Le Goater pisze:
>>> Some SPI controllers, such as the Aspeed AST2400, have a mode in which
>>> accesses to the flash content are no different than doing MMIOs. The
>>> controller generates all the necessary commands to load (or store)
>>> data in memory.
>>>
>>> To emulate such a behavior, we need to have access to the underlying
>>> storage of the flash object. The purpose of the routine is to set the
>>> storage of a preinitialized SPI flash object, which can then be used
>>> by the object itself but also by a SPI controller to handled the
>>> MMIOs.
>> Hi,
>>
>> I am not sure if this approach is correct. I can not find any datasheet
>> to this SPI controller, but as you mentioned in first paragraph, controller
>> generates all commands (probably ones are somehow configurable).
> yes. see this patch :
>
> 	http://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg08229.html
>
> 	/* CEx Control Register */
> 	#define R_CTRL0           (0x10 / 4)
> 	#define   CTRL_CMD_SHIFT           16
> 	#define   CTRL_CMD_MASK            0xff
>
>
>> In this series you hack this behaviour and you do direct access to file.
> It is true it is not very respectful of the m25p80 interface.
>
>> IMHO you should emulate sending such commands in SPI controller
>> model.
> I will give it a try. I don't think the alternative is a complex
> change anyhow.
Register logic + few commands, then write is almost copy-paste.
Shouldn’t be complicated, but you have real HW modelling.

Thanks,
Marcin
> Thanks,
>
> C.
>
>> Thanks,
>> Marcin
>>
>>> This is sufficient to support read only accesses. For writes, we would
>>> certainly need to externalize flash_write8() routine.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>    hw/block/m25p80.c        | 14 +++++++++++++-
>>>    include/hw/block/flash.h |  2 ++
>>>    2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>> index aa964280beab..fec0fd4c2228 100644
>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -29,6 +29,7 @@
>>>    #include "qemu/bitops.h"
>>>    #include "qemu/log.h"
>>>    #include "qapi/error.h"
>>> +#include "hw/block/flash.h"
>>>      #ifndef M25P80_ERR_DEBUG
>>>    #define M25P80_ERR_DEBUG 0
>>> @@ -1152,7 +1153,11 @@ static void m25p80_realize(SSISlave *ss, Error **errp)
>>>          if (s->blk) {
>>>            DB_PRINT_L(0, "Binding to IF_MTD drive\n");
>>> -        s->storage = blk_blockalign(s->blk, s->size);
>>> +
>>> +        /* using an external storage. see m25p80_create_rom() */
>>> +        if (!s->storage) {
>>> +            s->storage = blk_blockalign(s->blk, s->size);
>>> +        }
>>>              if (blk_pread(s->blk, 0, s->storage, s->size) != s->size) {
>>>                error_setg(errp, "failed to read the initial flash content");
>>> @@ -1259,3 +1264,10 @@ static void m25p80_register_types(void)
>>>    }
>>>      type_init(m25p80_register_types)
>>> +
>>> +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom)
>>> +{
>>> +    Flash *s = M25P80(dev);
>>> +
>>> +    s->storage = memory_region_get_ram_ptr(rom);
>>> +}
>>> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
>>> index 50ccbbcf1352..9d780f4ae0c9 100644
>>> --- a/include/hw/block/flash.h
>>> +++ b/include/hw/block/flash.h
>>> @@ -61,4 +61,6 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>>>    void ecc_reset(ECCState *s);
>>>    extern VMStateDescription vmstate_ecc_state;
>>>    +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom);
>>> +
>>>    #endif
>

