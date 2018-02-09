Received: by 10.28.71.27 with SMTP id u27csp656268wma;
        Fri, 9 Feb 2018 00:56:28 -0800 (PST)
X-Google-Smtp-Source: AH8x225jPVJ8ZEVplhTeOGxuH4lJfZFz3VFneHle3NI2vbJJagf4C1n93z2argHVLe5rW/m8dPpA
X-Received: by 10.129.103.87 with SMTP id b84mr1373547ywc.470.1518166588436;
        Fri, 09 Feb 2018 00:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518166588; cv=none;
        d=google.com; s=arc-20160816;
        b=UOwrSkuPOMtN3HCpL+/nCeazmieyjlbXUPrQ8UtxB1Jzg+zU7G5nEi6mA8Fc7t1RQ9
         Niu3J4iukFXO2cM9/CRY2Inj0LSlXeIoyqS7W4asV1C4bqQavtV5OBm9KLhM+QmWr0Fu
         rLIewwutg2W1jrOJWuS0NQwnuhH+nHkuwddROv9FYSorCpt0/7BPvJIH5jNf1i9P7qBK
         TgxYVdJlWULahdNe5UERJeh9GODOQG0eEPt6aj7QDfxTYxxLEXUdxpqW0rhsdoJ/OUYj
         8fV2yvC84H61OxHfPXBfLqaUkHEoZKEG/IDNTln8fqBonFTa3kXaBeV4mJwTPbd1isTb
         jBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7CYHqgeJEXnPwF94W6/TGWtXl9bZs2dNu/O10a3xOWc=;
        b=zG2t1mPTbo93MkLKI9CeweVBntJZwvi3xVkV8bullMmC1UrPAg7sWoIroGrvH5UIdi
         a73m2jeVp9f5aHKjRzaf2Z6uuI5U3UZVuwdWHxAoPiYx0hvmwJGVo81KmLq1jj9hv4rv
         X0O+Bn6J9RAdRL3QEBYguHIWRzD9hzrARqXZrSJ6BiQMb57gKk9rIrwVdtTa+2JqEMoo
         Ls/9p4LgDVj+dbdZJvPDDUrwjfNB6kWqo38BW3q1oH9Ncg68kH5yD1r4tVQLmvMrjwKp
         96ERJocgozWVmzJZBpGzBA+wKN0nq23lKMpMO9jwCCjQ1TQvDv31jldFzWBfc4mOHddV
         2JlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oCA6Pv9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si343588ywi.112.2018.02.09.00.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 00:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oCA6Pv9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ek4Tr-0000EV-NE
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 03:56:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4Tf-0000Ck-Uj
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 03:56:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4Te-0004aW-Vq
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 03:56:16 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:44036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4TZ-0004Xm-PY; Fri, 09 Feb 2018 03:56:09 -0500
Received: by mail-qk0-x241.google.com with SMTP id n188so9096924qkn.11;
	Fri, 09 Feb 2018 00:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7CYHqgeJEXnPwF94W6/TGWtXl9bZs2dNu/O10a3xOWc=;
	b=oCA6Pv9FVhHRIr1jU8DB+D9bYcp4fAlQTc1t/DfHr2knu6J06W+sL1HyqIyqKloRAO
	WVLowibJ4b2yuZJWg1Asd+CqnL95lSm2YdbmhZKIj1idt05ErdjGLH6NDI8xIoP41jVa
	OpDjDbfk6OHo3HDdA/sJU9nkmalKc+e2X6CMdB1oldpq40+K0I76rbJYokztj1xe0l9w
	RCOnUdyL64bqOBH44zmkTVfsDWgJCds+fyOKTGMLkm1KEuaWMnolWQ9PgGzr3zidAM2K
	vgOTf/+aX6/UZ6AkKLIXADiDQsEehqm0yYl1pRV+550/HmkbTAqJUY82z3HqLarMB6V6
	oMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7CYHqgeJEXnPwF94W6/TGWtXl9bZs2dNu/O10a3xOWc=;
	b=RYpbTWTAKG5o/ppJgrBaaz5VkHX1rsf8PQyZsyuJdtc99z8UkafS3CExfHrKIy/oL+
	PieFaykWTMmOLzp2Ev664j1DhoLtjEDWMsxnTmpcXrcphmcA1LpDuH2pXEu5UmerlyNt
	1LTzzNVXIfaUwyLJaWEl3Kk4npaHQCAcg7pa/9OD2OnkAfc0aYB7tAoO/hcA3bPPhHUv
	4u1LW4M7k4YiivEgS/suM+niUMHB9NycZP763VIDsFS5JmDftxRePiaHQZK8nI0nxb4m
	pTwky+ei1m+87R4QQ7eGzlSQQW7Lm9hi1QRQWzyOyw8TIe2z95H7pTBmmHsqKaMKWZnr
	LbTQ==
X-Gm-Message-State: APf1xPB1iYukmVdulGfn29vvUxAjQ2wRCyDfVfUa/w2mm3DT8PlbWQul
	F3+dMxcXWF/Il4C6kCa3FnaA0MVl
X-Received: by 10.55.186.134 with SMTP id k128mr2977818qkf.23.1518166568937;
	Fri, 09 Feb 2018 00:56:08 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	g64sm1347522qtd.17.2018.02.09.00.56.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 00:56:08 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
References: <20180208172202.9984-1-f4bug@amsat.org>
	<20180208172202.9984-3-f4bug@amsat.org>
	<21f7b55b-72d3-5726-ef71-032bac16e6c8@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a6280f03-22f5-7847-d616-14a384665261@amsat.org>
Date: Fri, 9 Feb 2018 05:56:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <21f7b55b-72d3-5726-ef71-032bac16e6c8@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/aspeed: simplify using the
 'unimplemented device' for aspeed_soc.io
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1p2OFenb8YfZ

On 02/08/2018 03:14 PM, Cédric Le Goater wrote:
> On 02/08/2018 06:22 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This looks like a good idea. (Have you actually tried it ? 
> just asking)

v1 obviously not :S v2 yes!

> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks :)

> 
> Thanks,
> 
> C. 
> 
>> ---
>>  include/hw/arm/aspeed_soc.h |  1 -
>>  hw/arm/aspeed_soc.c         | 32 +++-----------------------------
>>  2 files changed, 3 insertions(+), 30 deletions(-)
>>
>> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
>> index f26914a2b9..11ec0179db 100644
>> --- a/include/hw/arm/aspeed_soc.h
>> +++ b/include/hw/arm/aspeed_soc.h
>> @@ -31,7 +31,6 @@ typedef struct AspeedSoCState {
>>  
>>      /*< public >*/
>>      ARMCPU cpu;
>> -    MemoryRegion iomem;
>>      MemoryRegion sram;
>>      AspeedVICState vic;
>>      AspeedTimerCtrlState timerctrl;
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index a786750e14..3d21128d47 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -15,6 +15,7 @@
>>  #include "qemu-common.h"
>>  #include "cpu.h"
>>  #include "exec/address-spaces.h"
>> +#include "hw/misc/unimp.h"
>>  #include "hw/arm/aspeed_soc.h"
>>  #include "hw/char/serial.h"
>>  #include "qemu/log.h"
>> @@ -99,31 +100,6 @@ static const AspeedSoCInfo aspeed_socs[] = {
>>      },
>>  };
>>  
>> -/*
>> - * IO handlers: simply catch any reads/writes to IO addresses that aren't
>> - * handled by a device mapping.
>> - */
>> -
>> -static uint64_t aspeed_soc_io_read(void *p, hwaddr offset, unsigned size)
>> -{
>> -    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
>> -                  __func__, offset, size);
>> -    return 0;
>> -}
>> -
>> -static void aspeed_soc_io_write(void *opaque, hwaddr offset, uint64_t value,
>> -                unsigned size)
>> -{
>> -    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
>> -                  __func__, offset, value, size);
>> -}
>> -
>> -static const MemoryRegionOps aspeed_soc_io_ops = {
>> -    .read = aspeed_soc_io_read,
>> -    .write = aspeed_soc_io_write,
>> -    .endianness = DEVICE_LITTLE_ENDIAN,
>> -};
>> -
>>  static void aspeed_soc_init(Object *obj)
>>  {
>>      AspeedSoCState *s = ASPEED_SOC(obj);
>> @@ -199,10 +175,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>      Error *err = NULL, *local_err = NULL;
>>  
>>      /* IO space */
>> -    memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
>> -            "aspeed_soc.io", ASPEED_SOC_IOMEM_SIZE);
>> -    memory_region_add_subregion_overlap(get_system_memory(),
>> -                                        ASPEED_SOC_IOMEM_BASE, &s->iomem, -1);
>> +    create_unimplemented_device("aspeed_soc.io",
>> +                                ASPEED_SOC_IOMEM_BASE, ASPEED_SOC_IOMEM_SIZE);
>>  
>>      /* CPU */
>>      object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
>>
> 
> 
