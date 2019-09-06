Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp363899wrp;
        Fri, 6 Sep 2019 00:27:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpqalPLK3hhQlWTrrbZ9D3uCV1TctuhrTr+eOBJun5c4PaRPrWM5FQUmHNrpAWNQFlKlKC
X-Received: by 2002:a50:b30f:: with SMTP id q15mr6372776edd.145.1567754837591;
        Fri, 06 Sep 2019 00:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567754837; cv=none;
        d=google.com; s=arc-20160816;
        b=AYu0Q+uEGH9dpV5mTayOhQR3fV9li9ioZeCxhnp3wClrc37U/iKz2DgMxIpOA1lR1j
         Q3m5jo762pZWkBbD5MFd8AQiE2h7ZHfrj+azvInv3gDyaF089Ajtz4SaIpnd85WCkLpr
         iEjlIImab4xOfbIWI3XxVXMbF+nI7RQZNuLKq6DCirfNGeKy2QC460RB6RAvl7A5srNA
         03iCaohDpQvJNWxEfNhzsiWx6iyZKceVyXjjrwDrYpurGVB5JMRRoT2mCCh9thDU+Kv6
         Ef3RE1sDtRXCjQd88mjsDdjmy4pGXts1Qb88nLWNi9lUg40fe5F1TqXE3QwzAwvLtAPu
         45bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=wahuO7FJklFA2EYqUAwXGpvOkR4cwWpsme1mDdt6NCQ=;
        b=S38V1YBlTym6Hz0za8IZgLTypaRtknqev33En5YcYXa7dUOy3jSjlvNWhB6q9+nuJT
         nVkK/T1VAvw807sZDTZv+cpwTZV9CSFw3+Xm2wn8oXIhRPf9TpZvnSeTxwrMVYfaAymO
         NsobortJ35nVqltaTYFm7E45L9Ld1xzimzpZzg7Ndrd3zaRN5i+iYorZLzicS1f5ex0V
         TpNSGg7RTu12+YYukmvGR/napY3Z+0bw1iEGrxhA0cmvtjHTXwPdli5eNrSHDK6TW2ND
         A04OCFmNpO5CeJpwBZqRv24kt2tkM/zU+Ydh6yzlRf2mLoucS2FIof7PZ6VtIQO9+YHT
         XnKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a54si2602283edc.333.2019.09.06.00.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 00:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i68eK-0006XN-A2
	for alex.bennee@linaro.org; Fri, 06 Sep 2019 03:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i68e5-0006X8-KI
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 03:27:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i68e2-0001yJ-V6
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 03:27:01 -0400
Received: from 2.mo4.mail-out.ovh.net ([46.105.72.36]:39509)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i68e2-0001e4-K9
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 03:26:58 -0400
Received: from player695.ha.ovh.net (unknown [10.108.35.197])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 675F820388E
 for <qemu-arm@nongnu.org>; Fri,  6 Sep 2019 09:26:49 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 8C72B966DABC;
 Fri,  6 Sep 2019 07:26:44 +0000 (UTC)
To: Joel Stanley <joel@jms.id.au>, Amithash Prasad <amithash@fb.com>
References: <20190906011010.1135084-1-amithash@fb.com>
 <CACPK8Xds26gq=e=7D9qtPJ4FOvhHb0Q-_Chj_MFHcWO99EBcwg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <773184fa-ade7-f1f8-491f-b2c0b16b5a9a@kaod.org>
Date: Fri, 6 Sep 2019 09:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xds26gq=e=7D9qtPJ4FOvhHb0Q-_Chj_MFHcWO99EBcwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 736338542352173888
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejkedgieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.36
Subject: Re: [Qemu-arm] [PATCH] Check correct register for clock source
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHDFGx5KKE/I

On 06/09/2019 03:16, Joel Stanley wrote:
> On Fri, 6 Sep 2019 at 01:10, Amithash Prasad <amithash@fb.com> wrote:
>>
>> When WDT_RESTART is written, the data is not the contents
>> of the WDT_CTRL register. Hence ensure we are looking at
>> WDT_CTRL to check if bit WDT_CTRL_1MHZ_CLK is set or not.
>>
>> Signed-off-by: Amithash Prasad <amithash@fb.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks for the patch!

yes. I have pushed it on the aspeed-4.2 branch but it can go independently
as there are no conflicts. I changed the title slightly to reflect the
area being changed.

On the clock topic, we should consider looking at the "Clock framework API" 
from  Damien Hedde :

	http://patchwork.ozlabs.org/cover/1157671/

Thanks,

C. 

> 
>> ---
>>  hw/watchdog/wdt_aspeed.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
>> index 9b93213417..f710036535 100644
>> --- a/hw/watchdog/wdt_aspeed.c
>> +++ b/hw/watchdog/wdt_aspeed.c
>> @@ -140,7 +140,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>>      case WDT_RESTART:
>>          if ((data & 0xFFFF) == WDT_RESTART_MAGIC) {
>>              s->regs[WDT_STATUS] = s->regs[WDT_RELOAD_VALUE];
>> -            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
>> +            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK));
>>          }
>>          break;
>>      case WDT_CTRL:
>> --
>> 2.21.0
>>

