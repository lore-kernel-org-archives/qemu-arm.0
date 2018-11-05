Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2779379wro;
        Mon, 5 Nov 2018 08:23:44 -0800 (PST)
X-Google-Smtp-Source: AJdET5c4hYp5Q8nLlyyE2EglC7M3VgoRz3xw8dlstWHKtfHKTp09GF/9iUaxinVvyDlpq+pCYfDy
X-Received: by 2002:ac8:208a:: with SMTP id 10mr382573qtd.79.1541435024618;
        Mon, 05 Nov 2018 08:23:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541435024; cv=none;
        d=google.com; s=arc-20160816;
        b=Lw71eJ2qtcoHNpv6dVW5DbGR4pdLn8jLw56pACFXrQK9uCVWVLFlPzM+/nM7cf5jmF
         dblVZFuSST0oa5nJ8Jg5f7dc38I2kKF5sRyqwVLJSzxMw8h5+D0lIC5yvgo2wxDdI4Ff
         hnEPExSAxp3gKUX4Rl0nnQ0l02v9QtNT9S6WPMp3+kIfYNTIDQOK8GYhyGZMx9+oJ2JP
         +2Ing9NFi4S/xDWfZV1rBQrcjNGRJtXTQr/wP4o71PhsNSk2yLzuyWSRlLcZfLvueUwo
         Sdfw7VcC2bsYKSW24mi/yRX9pOPJK7wyigF9iZ/kuNvMFBsvxTBIzeyWFi55p/1KYuzF
         b0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=lIItoZhAzovNoOHBhffgyiDN9IJPdMDXV6xxnMHmlJQ=;
        b=ZHJgMYKCiOdloFIWZWrvH48t8mQmd6nwZSYoeuu9K2a+RrcKp+CHuT9NfnGY+lxPZE
         Re/lhfGpHcmIEHNg6spp/LaFS0RNduTN2ao6tCiPglMFpW7FbjzWvd/OzZTAgXlF7YkM
         bUb6fXo0OfEoEZdn99f/AWNyO3G+fLZuI+QbptiqZz00JtJnUhp/lCRKVD5T1ifKi1GG
         nGaG84FZhL+r2pTqA5b+DuS8p7WB/TThXrUmtCj5+/y8ZPhQl2tyAhU5Z41sesv7Ph2Z
         +Ely3mg3k6PhDKfFY/ET72PBgp8eaxg+BrYHbUUdR1UTtFWxXcbww3Y6/cdPD93W2xac
         tTwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h12si921745qto.184.2018.11.05.08.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 08:23:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJhfE-0000ZH-3v
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 11:23:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gJhaS-0004ho-KW
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gJhUb-0000dB-DV
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:12:49 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gJhUZ-0000O3-B1
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:12:45 -0500
Received: by mail-wr1-f67.google.com with SMTP id y3-v6so9842447wrh.10
	for <qemu-devel@nongnu.org>; Mon, 05 Nov 2018 08:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lIItoZhAzovNoOHBhffgyiDN9IJPdMDXV6xxnMHmlJQ=;
	b=Xv7jh3cs0JeP5IEmM5Me39Kcuv393KUtR1rUf9CqVoLPM23IaF/9IY5BjMmTW3e/nG
	PuZwlyrpNHbYjDNEyyW4A3FLuV0KZAjSYP1lw7+3cdPrMdZhJmxEvxN9hKdR3aCeOePM
	eiCPcbSpu9QoH3TPOPxi4r5zzvuMYei7EW8EksgXbc7Hy0hfNvW9ZLSobl//dxk+9oqA
	Up92v4Keiyu3qBEXKiCX+PIyN4PoviUoHmmKYp0UeNd2Ufxh7raRdXsturNH4INBYzJ/
	H5GDEV6RIuR7mEjMlgqvWjLbHblcGGCIyQeUT6VkIytlG0JZFGTMq0n6Kfy+2Vg7iRKs
	VJYQ==
X-Gm-Message-State: AGRZ1gKed+ojcsQmqE6IqORBFHUrZpTk4iqqEkAXpSh0dHFduVDp4QaE
	Zo+Y63sQa3xbyl8qsW5XjRd1+Q==
X-Received: by 2002:adf:92a6:: with SMTP id
	35-v6mr21046442wrn.137.1541434351292; 
	Mon, 05 Nov 2018 08:12:31 -0800 (PST)
Received: from [192.168.1.41] (lfbn-1-6433-245.w90-113.abo.wanadoo.fr.
	[90.113.127.245]) by smtp.gmail.com with ESMTPSA id
	h16-v6sm12859116wrb.73.2018.11.05.08.12.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 08:12:30 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-4-f4bug@amsat.org>
	<CAFEAcA8LOR7mCVMe6R1A+VJMXpJMreLV-0KQ0nTXZM=7VXcmSA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9beca7b9-258d-436c-8dd7-ad877745b949@redhat.com>
Date: Mon, 5 Nov 2018 17:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8LOR7mCVMe6R1A+VJMXpJMreLV-0KQ0nTXZM=7VXcmSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH for 3.2 v2 3/7] hw/arm/bcm2835: Use 0x
 prefix for hex numbers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0DcGpAQXmR+t

On 5/11/18 16:39, Peter Maydell wrote:
> On 2 November 2018 at 00:12, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/char/bcm2835_aux.c      | 2 +-
>>   hw/intc/bcm2836_control.c  | 4 ++--
>>   hw/misc/bcm2835_property.c | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> Commit message says it's just adding 0x prefixes, but the
> patch adds extra logging of new numbers that weren't there
> before. I don't think the patch needs splitting, but the
> commit message could be improved.

OK

> 
> Also, the compile test says some of these new additions
> are using the wrong kind of format string specifier.

Yes, sorry I forgot to run this test.

> 
>>
>> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
>> index 0364596c55..9632e8972c 100644
>> --- a/hw/char/bcm2835_aux.c
>> +++ b/hw/char/bcm2835_aux.c
>> @@ -159,7 +159,7 @@ static void bcm2835_aux_write(void *opaque, hwaddr offset, uint64_t value,
>>       case AUX_ENABLES:
>>           if (value != 1) {
>>               qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable SPI "
>> -                          "or disable UART\n", __func__);
>> +                          "or disable UART: 0x%lx\n", __func__, value);
> 
> uint64_t needs PRIx64, not %lx.
> 
>>           }
>>           break;
>>
>> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
>> index cfa5bc7365..96cc53f8a7 100644
>> --- a/hw/intc/bcm2836_control.c
>> +++ b/hw/intc/bcm2836_control.c
>> @@ -204,8 +204,8 @@ static void bcm2836_control_write(void *opaque, hwaddr offset,
>>       } else if (offset >= REG_MBOX0_RDCLR && offset < REG_LIMIT) {
>>           s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2] &= ~val;
>>       } else {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
>> -                      __func__, offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx" 0x%lx\n",
>> +                      __func__, offset, val);
> 
> Ditto. If you want to print the value you should also say in the
> log message string what the second hex number in it is.
> (Mostly we don't seem to worry about printing the data value
> for "write to bogus device address" messages.)

Hmm OK, I guess I added this to understand the firmware initialization, 
so some are probably UNIMP rather than GUEST_ERRORS (The firmware is 
built by people having access to the specs).

> 
>>           return;
>>       }
>>
>> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
>> index 5d332324bd..c715cbaef6 100644
>> --- a/hw/misc/bcm2835_property.c
>> +++ b/hw/misc/bcm2835_property.c
>> @@ -277,7 +277,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>>
>>           default:
>>               qemu_log_mask(LOG_GUEST_ERROR,
>> -                          "bcm2835_property: unhandled tag %08x\n", tag);
>> +                          "bcm2835_property: unhandled tag 0x%08x\n", tag);
>>               break;
>>           }
>>
>> --
>> 2.17.2
> 
> thanks
> -- PMM
> 
