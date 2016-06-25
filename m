Received: by 10.25.21.96 with SMTP id l93csp346038lfi;
        Sat, 25 Jun 2016 06:59:49 -0700 (PDT)
X-Received: by 10.55.23.25 with SMTP id i25mr8038651qkh.142.1466863188919;
        Sat, 25 Jun 2016 06:59:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si1405519qkd.160.2016.06.25.06.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jun 2016 06:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGo7g-0004di-BN
	for alex.bennee@linaro.org; Sat, 25 Jun 2016 09:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGo7c-0004dS-0I
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 09:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGo7Y-0004zN-P5
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 09:59:43 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bGo7Y-0004y8-G5; Sat, 25 Jun 2016 09:59:40 -0400
Received: by mail-lf0-x244.google.com with SMTP id l184so24511143lfl.1;
	Sat, 25 Jun 2016 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=SasgBAJ+CxlrdH5Nozk1WuawyEFtdPW9W5XLQiCsAuM=;
	b=MluWU5AMw18Ie84tp1HD5CFgi/YkJDJtqnNO2LBW0rLFRL5Fzb8dMv1tN0hj21qcr9
	LlHkbNxzAi3bc5ABnPCNdYSKQ9b6eknlIXpyehbov1xZa6Fsa3AvhqPKk8GVdY0btdzh
	1Vctfbbx5YnQn1WC52Hc/ZqqmvyAZIWpbSfXSFgEWOqmfd5MGrYGZ0kYkTL2+vLSss17
	CfUM3ld3RwwUwkcXVo4NxhBG7xyBEeKJEN73ukHy62f3VJqJau6J/2tXwaskVsCiVB5g
	ItkYzmTIk2ILU0gXAxL6WWwZOc1orGCpZXyTPl+wqJ3ZL0K+3Q+hheNxSy0b+QLbQQO6
	X41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=SasgBAJ+CxlrdH5Nozk1WuawyEFtdPW9W5XLQiCsAuM=;
	b=MMVKckJFH5t38ZKVFsl28T2rb6tHwcu9VMzVosB5xTtQiY3g5KQml2yV9RdX5po/Pf
	XqRgSvjTil96nc2PjbBmAJYYF9jVyA8Vw5gS7w7Mbw7rGia6X5FsUNhROOf01PtAN7HN
	6bWTHH5DNTMHM4cPXNSCalflhAnOhRAeBh7Aled/m6e2iIsPWz6dBNI2H9QFgfHkG2Mp
	CwQM1XumP1zxsfjvGI0RPtaWT+SIk5yBBZUqJxuOYa38RNFA6kCDkaU7YA+VgriUVoEe
	ugYJ1CI/x+aUXo1R4JOzJkBKkFAT7kcbNaBvWrgCT/5FUePTCwk6BXiYEyXqe2p9Av/f
	dE6A==
X-Gm-Message-State: ALyK8tKC8dfXxdeYUIqAwwsIE1Kqenr+DKjINH6yph9pG/j4JXU4cQeLrfkLNjvMvq/W0g==
X-Received: by 10.25.90.78 with SMTP id o75mr3048005lfb.67.1466863179134;
	Sat, 25 Jun 2016 06:59:39 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	d184sm1715457lfg.11.2016.06.25.06.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Jun 2016 06:59:38 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <20160625123521.16752-1-digetx@gmail.com>
	<d626bd7a-c54e-d2c9-10a8-3d8ab572d472@ilande.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <22cbcf06-a43d-efbc-d83e-c2d1301b8e57@gmail.com>
Date: Sat, 25 Jun 2016 16:59:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <d626bd7a-c54e-d2c9-10a8-3d8ab572d472@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/ptimer: Don't wrap around
 counter for expired timer that uses tick handler
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nU6fqlVBqzbH

On 25.06.2016 16:20, Mark Cave-Ayland wrote:
> On 25/06/16 13:35, Dmitry Osipenko wrote:
> 
>> Software should see timer counter wrap around only after IRQ being triggered.
>> Change returned counter value to "1" for the expired timer and avoid returning
>> wrapped around counter value in periodic mode for the timer that has bottom-half
>> handler setup, assuming it drives timer IRQ.
>>
>> This fixes regression introduced by the commit 5a50307 ("hw/ptimer: Perform
>> counter wrap around if timer already expired") on SPARC emulated machine as
>> reported by Mark Cave-Ayland.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  hw/core/ptimer.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index 05b0c27..8006442 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -93,10 +93,10 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>          bool oneshot = (s->enabled == 2);
>>
>>          /* Figure out the current counter value.  */
>> -        if (s->period == 0 || (expired && (oneshot || use_icount))) {
>> +        if (expired && (oneshot || use_icount || s->bh != NULL)) {
>>              /* Prevent timer underflowing if it should already have
>>                 triggered.  */
>> -            counter = 0;
>> +            counter = 1;
>>          } else {
>>              uint64_t rem;
>>              uint64_t div;
>> @@ -143,7 +143,9 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>
>>              if (expired && counter != 0) {
>>                  /* Wrap around periodic counter.  */
>> -                counter = s->limit - (counter - 1) % s->limit;
>> +                counter = s->delta = s->limit - (counter - 1) % s->limit;
>> +                /* Re-arm timer according to the wrapped around value.  */
>> +                ptimer_reload(s);
>>              }
>>          }
>>      } else {
>>
> 
> Hi Dmitry,
> 
> I ran through all of my OpenBIOS test images for qemu-system-sparc and AFAICT
> this fixes the issue without introducing any further regressions so:
> 
> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Many thanks,
> 
> Mark.
> 

Great! Thanks for testing it.

-- 
Dmitry
