Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2510786wre;
        Mon, 28 May 2018 07:04:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKINxmzO4c0PIWP7xgwgjEFLe4O8YG2u7YFLL07DlTafMqROBLa8fnrWvHaU7LJLhpjADRmT
X-Received: by 2002:a0c:d19d:: with SMTP id e29-v6mr9499325qvh.129.1527516249742;
        Mon, 28 May 2018 07:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527516249; cv=none;
        d=google.com; s=arc-20160816;
        b=ec6tn8qb5g2BBQZBWVQ1/pg7PUpM5FVknLA5WX9mNdDq0rZs9OCO/02M2Mt+NCE7U4
         mymHqJigG83+8s5c6kBm2hXqu/nKH+GforvNO2p20wn4xJDwZ8rCjxZznI43a6PYXgKz
         94v0tyBOE2vAQTtjHCluQ4anp8VzovguqvAzmqXUFKfqLWoMRq2V0aeEfkFB/lU7OjI3
         2cVrZsmvfXLi35TMNw4wYSEfq047YErL0n592ZBmuVfqGD/uHpQSu3dXujFr3UGGK//S
         VohPo9TRqoaSmLvKMSRMaG1hn2Ls7ULx/ZVwIQZpRVwqWKTboSn5XAEX9prByCk1weWx
         Z/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=WmYAxL6GU0QpCfr2JY1n8xbcKSZVZgRBaRY6ZFBKC/I=;
        b=SoJPgyVBC4iTX4jDw1OxmLL7s14XnS8DSdpq7s/9JkRoP43eRtSR1IbA5+4nUbiymH
         cMZZlKgIEbgXoYytE++G/Fnvyoz9uMd2zqw1PUWhEKMbYSui18OEVoyDt6/qi2cvi9W6
         Nbf/Ti4rKAd2dtTVpejBLjIKIHgPbu3INgSTNPgSgRJSdsjj35nZ9gib8N44hpYNYJjc
         GPAawrQ7KdFsncMe6NHFPHgA6+xhq6+yUfKGTCiqjuYqP6Ieb/KD14G8WmJH/TTvViq8
         WhGiTfHpi8/hMP9NMiS45VNjfZ5JzOSw1OTyrY2npCz5DDojxJpfDVJxKISWF/DC5Xll
         rqKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=otgyCPVu;
       dkim=fail header.i=@jms.id.au header.s=google header.b=VY4jXxqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j20-v6si4620935qvm.114.2018.05.28.07.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:04:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=otgyCPVu;
       dkim=fail header.i=@jms.id.au header.s=google header.b=VY4jXxqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNIkr-0003wo-A9
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:04:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNIkg-0003v4-R7
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fNIkf-0004lF-Pt
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:03:58 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33320)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fNIkd-0004iy-Ce; Mon, 28 May 2018 10:03:55 -0400
Received: by mail-qk0-x244.google.com with SMTP id h7-v6so2053156qkm.0;
	Mon, 28 May 2018 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=WmYAxL6GU0QpCfr2JY1n8xbcKSZVZgRBaRY6ZFBKC/I=;
	b=otgyCPVu7OnW3Jjm7v4qtVPzMsvHN/fyEoLJiPWAOcpVyl26Ll9XWbYryDxrAHcayt
	XmZz/Hc9LvexBbLJ1nSON8M0piZr4xgaCvBdUM96REBKK16VAT07aZAmKGIyNA57Ca7G
	/f1FRrreHQeBHHrHw+dWz2aCp0KCK88q3Epdt27mIheeHjpA22TLwPh1KOXmmc6LtcOf
	napczoOMJbwYInwgLmgDx1Y1EbRzaoaKnLpGLwSVUqzvuZ4Dp2NpZV+JkYsGjUo4ro98
	hIhtAukQJJC4UmI2IMA+FG+VBJaDWi5wiqb08As9glW+fbvZZ/9lg1d2MEBHNFZJF2SJ
	Xsxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=WmYAxL6GU0QpCfr2JY1n8xbcKSZVZgRBaRY6ZFBKC/I=;
	b=VY4jXxqWUFTdGslvkaqubvMxMnDwo/v75VDgxa4UPpaBvvDrzsclE3w3pEAQT2iJOf
	ARSrZqluA4vyZQnDlluYNLD3WNX/CGnt5hR9cHNcPSvKr2vig54RDidMAwwHsfldbBQD
	5e6737kPRUbdE4WYxhJncFGfR9cdWSOU5cWTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=WmYAxL6GU0QpCfr2JY1n8xbcKSZVZgRBaRY6ZFBKC/I=;
	b=W0cGi7fTDVldyfiFRKYLhit40gdj+LQ4xkaMGncq5R6Cf86GIAF5vUL6VFUE8qIcS6
	9SSIrE/LWjy601O8U9G3CPB2H/L5w8r1jCFClXS6fPN6pRIAgER+yHx1+7Fnota4Xyfo
	O1ukoNAik0TIw6NPXGITj6SSUTSmaU8CASe1B6ZHZ56zmOHiR7CZdlUo+z1coSn/r8qk
	lCz7p/M9Wt0LhslsBqem8X3hIMgVd2iNu8cxqbztPrAUblb6a0ihbMlwfo7SB5C2WUyH
	Hiu35HqZmcd3fsH4zZFFOl/QVBZDBfdS9MnLhlCl08MuAftKW2k6e6VliBjh1fOvOf5U
	aSrw==
X-Gm-Message-State: ALKqPwf6I+CGbIQXdXGDJxeAq+p6gkiwWuebKSyCMh30l+mZlEXNjepY
	xIkidq5JiMnuc+++IEGNuayJgDUCxT8Og28C3QNAJw==
X-Received: by 2002:a37:3146:: with SMTP id
	x67-v6mr11490879qkx.158.1527516234517; 
	Mon, 28 May 2018 07:03:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Mon, 28 May 2018 07:03:34
	-0700 (PDT)
In-Reply-To: <9959794d-6d3b-b797-bfc8-b548d54378ad@kaod.org>
References: <20180528124621.22977-1-joel@jms.id.au>
	<9959794d-6d3b-b797-bfc8-b548d54378ad@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 May 2018 23:33:34 +0930
X-Google-Sender-Auth: mHzlpvfG2lURjR7wb3IuUIA3cWM
Message-ID: <CACPK8Xe5+-zVfoS-g2Te7YOuT5emT-i=JsNDrF52WLVzLERQcw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH] aspeed_scu: Implement RNG register
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
X-TUID: t/gJqHRkk4KT

On 28 May 2018 at 23:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello Joel,
>
> On 05/28/2018 02:46 PM, Joel Stanley wrote:
>> The ASPEED SoCs contain a single register that returns random data when
>> read. This models that register so that guests can use it.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>> index 5e6d5744eeca..8fa0cecf0fa1 100644
>> --- a/hw/misc/aspeed_scu.c
>> +++ b/hw/misc/aspeed_scu.c
>> @@ -16,6 +16,7 @@
>>  #include "qapi/visitor.h"
>>  #include "qemu/bitops.h"
>>  #include "qemu/log.h"
>> +#include "crypto/random.h"
>>  #include "trace.h"
>>
>>  #define TO_REG(offset) ((offset) >> 2)
>> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_=
NR_REGS] =3D {
>>       [BMC_DEV_ID]      =3D 0x00002402U
>>  };
>>
>> +static uint32_t aspeed_scu_get_random(void)
>> +{
>> +    Error *err =3D NULL;
>> +    uint32_t num;
>> +
>> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
>> +        error_report_err(err);
>> +    }
>> +
>> +    return num;
>> +}
>> +
>>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned s=
ize)
>>  {
>>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
>> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr=
 offset, unsigned size)
>>      }
>>
>>      switch (reg) {
>> +    case RNG_DATA:
>> +        return aspeed_scu_get_random();
>
> may be we could test bit 1 of RNG_CTRL to check if it is enabled or not.

The RNG is enabled by default, and I didn't find any software that
disables it, but it can't hurt to have that check.

I'll send a v2 with that check.

>
>> +        break;
>>      case WAKEUP_EN:
>>          qemu_log_mask(LOG_GUEST_ERROR,
>>                        "%s: Read of write-only offset 0x%" HWADDR_PRIx "=
\n",
>> @@ -287,6 +303,9 @@ static void aspeed_scu_realize(DeviceState *dev, Err=
or **errp)
>>                            TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
>>
>>      sysbus_init_mmio(sbd, &s->iomem);
>> +
>> +    if (qcrypto_random_init(errp))
>> +        return;
>>  }
>
> Isn't this routine called from main() already ?

It is indirectly called, yes. I'll remove this.

Cheers,

Joel
