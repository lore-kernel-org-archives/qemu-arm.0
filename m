Received: by 10.28.71.27 with SMTP id u27csp3737917wma;
        Tue, 6 Feb 2018 04:44:21 -0800 (PST)
X-Google-Smtp-Source: AH8x225L/gpvp7XT5ff1EHpjaCdHrq9sdCYeMWqwgVKGUPm9vYYltYSkJUKHsFcrWFePAPjpnof9
X-Received: by 10.37.7.131 with SMTP id 125mr1248245ybh.447.1517921061424;
        Tue, 06 Feb 2018 04:44:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517921061; cv=none;
        d=google.com; s=arc-20160816;
        b=X8+vyJXtANHmeUAzqjiQLuAJFa/bq9IHKhyQcF+xm7VU1ufOm9eQPfqq+3Xy8eSrGC
         AeB98vNozZp+iHOPM9mwwR1GkwH0QNfE6WwI7dPu75EyM+KuUMjdWQ+fK6pIoiq+QTXn
         pl1q93qfUYNCdrg0f+IRYjw7fBHw1X0SApnfvu6pb+enQ0amfyo6WBW9PA/5KmJmiuVv
         hx9+ZmqPJQtT8JxlTWIhhqXbD4cgKR6HwpOJROppsyVr15EeJjo1uREXiVJgQrTI/4Yz
         N2B9H/xkz/6bTB9DF6GngEPQLCiQD91Aihei6L6F4XA8Yf39FqJgbLB4e2B7dBa3x+rw
         ZLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=gMD8yLdxJTEJrCE4iVgoFdiTl3cq54ZiajP925klI9g=;
        b=FftoWxGwEm8dslLdmScOo47D14ttbw1jozkTdhnt4uXI4GyIxY12zt4qQzu4fER7ub
         mOZAxR4eT5aoI+EQHLlYTjNVo87Jxk6+Uv1yp3otM/EEUN48mtmcpxJh7gQ/hMNt+uVh
         ScDo9WwVNGkBokb+ya9KXyQQOlxDpvgVPA8FbQCc9KATS1/dqY+8dUl6f4+eMdRU1tmR
         bZs2sP+DWyLtHvSOcuIutvvXa0oCM//c+YSNa+fUCVk0L6h8IQmyGm4jtfA8O98c8gb7
         pXRTVYZs9z2ffhtXDNDDMd08sQ4kiCKsmIysnEFylXGf+eEizWaYk9Yb3jw26wRfq9wB
         0UQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eStT0D3u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t125si364115ywc.8.2018.02.06.04.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 04:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eStT0D3u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej2bk-00043S-Q9
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 07:44:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej2bD-000400-Qn
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 07:43:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej2bC-0006dK-I9
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 07:43:47 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej2b7-0006a9-Lb; Tue, 06 Feb 2018 07:43:41 -0500
Received: by mail-qk0-x242.google.com with SMTP id d125so2029974qkg.13;
	Tue, 06 Feb 2018 04:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gMD8yLdxJTEJrCE4iVgoFdiTl3cq54ZiajP925klI9g=;
	b=eStT0D3udvCbD2asKOFTLSRbuA8w/XcWhXphp9OYqyzeWmwBneFIlIQ4OlhbaIG4s4
	V7Y5h8pOAAttjDPILjTH9nyCeFAtwnOIf9sSQFgLUXvKc5J8iYaVj9iqirjTRyhMn7l/
	Fzt380NSHVQ9adKqrSFOrL8eE6+9fYOIrNFLyY+dp/REUZepdz7DVM5SB0sAkte1/hRR
	UaAPkwOdtA6dUHow6KhrriqR6rnRbP8TH0xrg4WavDRugDPpETM/vB2zTO7j6lR22fxH
	GW7bEHFZOhlHEk9YckLkiKXZQ3fu7RouL0tJmWQkzHeZ+ssG/NCFy2xMi1D8e7TpRqXI
	9c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gMD8yLdxJTEJrCE4iVgoFdiTl3cq54ZiajP925klI9g=;
	b=SRIIqL+grvVHbHoUAEDyT0n/9otSM7Cfbv6dk4L91Zi+JVH2EYfHDtLk/nkjN2S76k
	oCvS/4PeEq/D2AlrIhD3h2A+nZjwxZPUMNEj0oNwgImzH6yXHVn7/a5h54p1LjkVneSB
	TmJaIWz3Z5Sxo60SAHmmbLnWWVDeBPrUF7oHJqpSgHc0Radx8U7gcUpGU048p9cUVKOy
	vks6cXkoZlvYUWlImTmxKEJ2XywjxsmtNAy0xDEGZnl5z2Uduu6sFFRQIdBKD8BCJtIg
	xs27vH2GwDSlBuyLip8TyCcCXb0hSQ97Qb/Q6r1Uk2jm0iEsE0CZgllRNZzYOH0auUOd
	l4Fg==
X-Gm-Message-State: APf1xPBUOTxhHPCrFThbvLx7nxgGl6urhV/z5q1wfzMg0ygNlSe4Z36v
	1ckvS5DjLFx8SDNp/Er0LD6aq8T4
X-Received: by 10.55.101.79 with SMTP id z76mr3267630qkb.46.1517921020706;
	Tue, 06 Feb 2018 04:43:40 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id l6sm4298928qki.17.2018.02.06.04.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 04:43:40 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
	<20180123035837.16578-5-f4bug@amsat.org>
	<CAKmqyKMoUcPhkr8bM1DU1QeBaRbJ9kAfOp_j-vFxf1y8p=1AbA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5a373a1f-6289-a216-cd02-254402069c12@amsat.org>
Date: Tue, 6 Feb 2018 09:43:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMoUcPhkr8bM1DU1QeBaRbJ9kAfOp_j-vFxf1y8p=1AbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [PATCH v2 4/6] hw/sd/pl181: expose a SDBus and
 connect the SDCard to it
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>, Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h2qgY5o6Sjg3

Hi Alistair,

On 01/31/2018 01:41 PM, Alistair Francis wrote:
> On Mon, Jan 22, 2018 at 7:58 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> using the sdbus_*() API.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/pl181.c | 31 ++++++++++++++++++++-----------
>>  1 file changed, 20 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
>> index 3ba1f7dd23..ce696c5d7d 100644
>> --- a/hw/sd/pl181.c
>> +++ b/hw/sd/pl181.c
>> @@ -33,6 +33,7 @@ typedef struct PL181State {
>>      SysBusDevice parent_obj;
>>
>>      MemoryRegion iomem;
>> +    SDBus sdbus;
>>      SDState *card;
> 
> Shouludn't card be removed?

Not yet :( It is still used by sd_set_cb() in pl181_reset().

In my first approach [1] I added the SDBus SLAVE/MASTER interfaces and
the cards inserted/readonly signals were only accessible by the bus, not
the HCI, leaving the SDCard objects only pluggable to SDBus (removing
the sdbus_reparent_card() need). But since it was out of scope for the
UHS cards goal, I kept it for later.

[1]
http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02318.html

> 
> Alistair
> 
>>      uint32_t clock;
>>      uint32_t power;
>> @@ -179,7 +180,7 @@ static void pl181_send_command(PL181State *s)
>>      request.cmd = s->cmd & PL181_CMD_INDEX;
>>      request.arg = s->cmdarg;
>>      DPRINTF("Command %d %08x\n", request.cmd, request.arg);
>> -    rlen = sd_do_command(s->card, &request, response);
>> +    rlen = sdbus_do_command(&s->sdbus, &request, response);
>>      if (rlen < 0)
>>          goto error;
>>      if (s->cmd & PL181_CMD_RESPONSE) {
>> @@ -223,12 +224,12 @@ static void pl181_fifo_run(PL181State *s)
>>      int is_read;
>>
>>      is_read = (s->datactrl & PL181_DATA_DIRECTION) != 0;
>> -    if (s->datacnt != 0 && (!is_read || sd_data_ready(s->card))
>> +    if (s->datacnt != 0 && (!is_read || sdbus_data_ready(&s->sdbus))
>>              && !s->linux_hack) {
>>          if (is_read) {
>>              n = 0;
>>              while (s->datacnt && s->fifo_len < PL181_FIFO_LEN) {
>> -                value |= (uint32_t)sd_read_data(s->card) << (n * 8);
>> +                value |= (uint32_t)sdbus_read_data(&s->sdbus) << (n * 8);
>>                  s->datacnt--;
>>                  n++;
>>                  if (n == 4) {
>> @@ -249,7 +250,7 @@ static void pl181_fifo_run(PL181State *s)
>>                  }
>>                  n--;
>>                  s->datacnt--;
>> -                sd_write_data(s->card, value & 0xff);
>> +                sdbus_write_data(&s->sdbus, value & 0xff);
>>                  value >>= 8;
>>              }
>>          }
>> @@ -480,10 +481,6 @@ static void pl181_reset(DeviceState *d)
>>
>>      /* We can assume our GPIO outputs have been wired up now */
>>      sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
>> -    /* Since we're still using the legacy SD API the card is not plugged
>> -     * into any bus, and we must reset it manually.
>> -     */
>> -    device_reset(DEVICE(s->card));
>>  }
>>
>>  static void pl181_init(Object *obj)
>> @@ -502,14 +499,26 @@ static void pl181_init(Object *obj)
>>  static void pl181_realize(DeviceState *dev, Error **errp)
>>  {
>>      PL181State *s = PL181(dev);
>> +    DeviceState *carddev;
>>      DriveInfo *dinfo;
>> +    Error *err = NULL;
>> +
>> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
>> +                        dev, "sd-bus");
>>
>> +    /* Create and plug in the sd card */
>>      /* FIXME use a qdev drive property instead of drive_get_next() */
>>      dinfo = drive_get_next(IF_SD);
>> -    s->card = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false);
>> -    if (s->card == NULL) {
>> -        error_setg(errp, "sd_init failed");
>> +    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
>> +    if (dinfo) {
>> +        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
>> +    }
>> +    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
>> +    if (err) {
>> +        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
>> +        return;
>>      }
>> +    s->card = SD_CARD(carddev);
>>  }
>>
>>  static void pl181_class_init(ObjectClass *klass, void *data)
>> --
>> 2.15.1
>>
>>
