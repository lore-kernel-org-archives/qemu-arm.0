Received: by 10.223.134.117 with SMTP id 50csp12447223wrw;
        Wed, 3 Jan 2018 14:34:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBoueL+/OToDGdu4zosEKIWhcGX/JGUUu5F6xrVUtklA+XXbnbbEv26/6LZGNojhxXZivdaAG
X-Received: by 10.129.28.206 with SMTP id c197mr2624839ywc.328.1515018893876;
        Wed, 03 Jan 2018 14:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515018893; cv=none;
        d=google.com; s=arc-20160816;
        b=pthzhTNvuAjlGvSoOP3gv7e70qX4N6d25o4f5bFH6yoov8rWRDD8xB8IGKaGRW3KMf
         7FjWHV7qhZ4LwsVCgwBCiOJGXLWuY7aPmf5+szFXenDXzp1TG8GFenrVOB/k6s+dBcFa
         R62NOdb1Cz19MmRKCT69PS+jL1etbhiy3nvrjlnM/+OnSA6nDRdD1c6ERapc35wPy9xM
         YjftHwCDBESLRX5sYtso/kMXtOvl+GLK/YX1N/aEtzBgLYmbtm0BPf6p6vFZUWSC0ffy
         xZuSCCCJXQnH1fgxGjMJiLtT1tf6/22JbTzhvos6bW9oDRuX2dOVOrB0kDgofMNllrO4
         VybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4QeULk3WHuFfpk7U7ORV+8wVdRbo5xK8eM5nTmM834s=;
        b=VJ3+kSvXw9t5mwNvMZfL7C9CyTQDEduxRJuzDN5k5fUKD2rZO4gND5flR2CtYVJ1GW
         3xTsPqbpH3BwzgwJg8ugAHqg2SPxmSPFvd4WEsLvyKhmEfBxeq0aEkV3AtgHMTb+31fd
         cpw1AFRZi+GvcTcQ3lXwyCZu4TN53QyCTRy9Pj2x9JRC7H2fLs3iROA7jCNYdmZDodd5
         donwpop11+L2jjLdrBais8y7qWB2Pidc6Zo3YsRuK4iFeNwaYfZ48YPADW48SNcz0nuE
         kdFN6wZDuma2AwVdSau0TxPMqjjNoNpcyfKiLj8CKBrmOqBstApLEWgiRTwpUj/klfHK
         EENw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sztBwi2H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n190si404315ywe.652.2018.01.03.14.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 14:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sztBwi2H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWrcb-0001Uw-BZ
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 17:34:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrcA-0001Sq-0k
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:34:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrc7-0008Kp-Bs
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:34:26 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrc7-0008KL-7S; Wed, 03 Jan 2018 17:34:23 -0500
Received: by mail-qk0-x244.google.com with SMTP id b132so3447587qkc.13;
	Wed, 03 Jan 2018 14:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4QeULk3WHuFfpk7U7ORV+8wVdRbo5xK8eM5nTmM834s=;
	b=sztBwi2HKvdKzzPt1NgUJsIR5ZMUUip4kv8jIo3eLIAsAGMU0Tsspa2Vodj39BojUD
	NoL5iMC9xSVZLsSa8gqsaUYA8HxxNFDJqbkrb4rESV39f8n2m6aZnRoVaOWJ+aO3oUGb
	eyuM6ksoRU0+oB0cKwjhoMYILj9pO/TJn+WzAQn2viD1686L+JK785xyTdziojcvcGoJ
	RLu4E0kGuZgt6Dq52drErn4S0G9lU7j1ayA9xieceYjfmBni56V+PbC1cER5FqD7CMxa
	lw89Ij/8A1Hek62Q3kDrW1HUqvzB7iRHIJqcljHoLQMBXqXCyk4luOYBacuHm3o517w/
	yt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4QeULk3WHuFfpk7U7ORV+8wVdRbo5xK8eM5nTmM834s=;
	b=jpgXgSi4Vn5eU1lfjMjU/Q4+v+VDehIVl2I3HHhVXTRMfcwCeewM7asEa2cBP/c4It
	OcaIfcp5F8UWa3YE4xw8Wqhh6a7rb+oPw9n6dum0LDTWCx6B8cFTXHhd99Mmyow9ysrg
	cKbJUDokxAXjzFzkJOJQR9gPMn1ABbzqNmhqt2zoHBBK64aMaC2Y+U7qRB5oaQVr6CKR
	j7U+O970ZHXOKl1PAJAgaX8msB3YlJ2A1DNwdxhDrpqqaim/1WcAYFXDnq0+wLJMIX8b
	cJ3NNigjyz9s3qLhddYxJx6KXVBSIUqKPRaP5QtNC3Ey/EPmSJyh++3Y+uZ1lbA3o/1x
	ezLA==
X-Gm-Message-State: AKGB3mLP0Yk+YGdMZg4m4Cnzo8MrglGSqwXAheBXE5nA9krL5NaF6pC4
	Qi6/cqsbAQGkJyoHVYv5F2DqqCpE
X-Received: by 10.55.100.201 with SMTP id y192mr3426324qkb.265.1515018862414; 
	Wed, 03 Jan 2018 14:34:22 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	s18sm1249649qtc.25.2018.01.03.14.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 14:34:21 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20180103164117.11850-1-f4bug@amsat.org>
	<20180103164117.11850-3-f4bug@amsat.org>
	<CAKmqyKOFBVv0n-+-3RgZ7_-Ve8GWoxE7H60gPGqdXwY+Wu2zog@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <bb769df0-e20d-bdc2-a11f-b5ffd94d5685@amsat.org>
Date: Wed, 3 Jan 2018 19:34:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOFBVv0n-+-3RgZ7_-Ve8GWoxE7H60gPGqdXwY+Wu2zog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [PATCH 2/2] hw/sd/pxa2xx_mmci: add read/write()
 trace events
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
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zsFZHIEzgA0M

On 01/03/2018 06:54 PM, Alistair Francis wrote:
> On Wed, Jan 3, 2018 at 8:41 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/pxa2xx_mmci.c | 63 ++++++++++++++++++++++++++++++++++-------------------
>>  hw/sd/trace-events  |  4 ++++
>>  2 files changed, 44 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
>> index 3deccf02c9..0759a0d2eb 100644
>> --- a/hw/sd/pxa2xx_mmci.c
>> +++ b/hw/sd/pxa2xx_mmci.c
>> @@ -19,6 +19,7 @@
>>  #include "hw/qdev.h"
>>  #include "hw/qdev-properties.h"
>>  #include "qemu/error-report.h"
>> +#include "trace.h"
>>
>>  #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
>>  #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
>> @@ -278,43 +279,55 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
>>  static uint64_t pxa2xx_mmci_read(void *opaque, hwaddr offset, unsigned size)
>>  {
>>      PXA2xxMMCIState *s = (PXA2xxMMCIState *) opaque;
>> -    uint32_t ret;
>> +    uint32_t ret = 0;
>>
>>      switch (offset) {
>>      case MMC_STRPCL:
>> -        return 0;
>> +        break;
>>      case MMC_STAT:
>> -        return s->status;
>> +        ret = s->status;
>> +        break;
>>      case MMC_CLKRT:
>> -        return s->clkrt;
>> +        ret = s->clkrt;
>> +        break;
>>      case MMC_SPI:
>> -        return s->spi;
>> +        ret = s->spi;
>> +        break;
>>      case MMC_CMDAT:
>> -        return s->cmdat;
>> +        ret = s->cmdat;
>> +        break;
>>      case MMC_RESTO:
>> -        return s->resp_tout;
>> +        ret = s->resp_tout;
>> +        break;
>>      case MMC_RDTO:
>> -        return s->read_tout;
>> +        ret = s->read_tout;
>> +        break;
>>      case MMC_BLKLEN:
>> -        return s->blklen;
>> +        ret = s->blklen;
>> +        break;
>>      case MMC_NUMBLK:
>> -        return s->numblk;
>> +        ret = s->numblk;
>> +        break;
>>      case MMC_PRTBUF:
>> -        return 0;
>> +        break;
>>      case MMC_I_MASK:
>> -        return s->intmask;
>> +        ret = s->intmask;
>> +        break;
>>      case MMC_I_REG:
>> -        return s->intreq;
>> +        ret = s->intreq;
>> +        break;
>>      case MMC_CMD:
>> -        return s->cmd | 0x40;
>> +        ret = s->cmd | 0x40;
>> +        break;
>>      case MMC_ARGH:
>> -        return s->arg >> 16;
>> +        ret = s->arg >> 16;
>> +        break;
>>      case MMC_ARGL:
>> -        return s->arg & 0xffff;
>> +        ret = s->arg & 0xffff;
>> +        break;
>>      case MMC_RES:
>> -        if (s->resp_len < 9)
>> -            return s->resp_fifo[s->resp_len ++];
>> -        return 0;
>> +        ret = (s->resp_len < 9) ? s->resp_fifo[s->resp_len++] : 0;
>> +        break;
>>      case MMC_RXFIFO:
>>          ret = 0;
>>          while (size-- && s->rx_len) {
>> @@ -324,16 +337,19 @@ static uint64_t pxa2xx_mmci_read(void *opaque, hwaddr offset, unsigned size)
>>          }
>>          s->intreq &= ~INT_RXFIFO_REQ;
>>          pxa2xx_mmci_fifo_update(s);
>> -        return ret;
>> +        break;
>> +        ret = ret;

Oops...

>>      case MMC_RDWAIT:
>> -        return 0;
>> +        break;
>>      case MMC_BLKS_REM:
>> -        return s->numblk;
>> +        ret = s->numblk;
>> +        break;
>>      default:
>>          hw_error("%s: Bad offset " REG_FMT "\n", __FUNCTION__, offset);
> 
> Maybe worth removing this as well?

Indeed!

> 
> Either way:
> 
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks :)

> 
> Alistair
> 
>>      }
>> +    trace_pxa2xx_mmci_read(size, offset, ret);
>>
>> -    return 0;
>> +    return ret;
>>  }
>>
>>  static void pxa2xx_mmci_write(void *opaque,
>> @@ -341,6 +357,7 @@ static void pxa2xx_mmci_write(void *opaque,
>>  {
>>      PXA2xxMMCIState *s = (PXA2xxMMCIState *) opaque;
>>
>> +    trace_pxa2xx_mmci_write(size, offset, value);
>>      switch (offset) {
>>      case MMC_STRPCL:
>>          if (value & STRPCL_STRT_CLK) {
>> diff --git a/hw/sd/trace-events b/hw/sd/trace-events
>> index 1fc0bcf44b..6eca3470e2 100644
>> --- a/hw/sd/trace-events
>> +++ b/hw/sd/trace-events
>> @@ -3,3 +3,7 @@
>>  # hw/sd/milkymist-memcard.c
>>  milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
>>  milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
>> +
>> +# hw/sd/pxa2xx_mmci.c
>> +pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
>> +pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
>> --
>> 2.15.1
>>
>>
