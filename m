Received: by 10.223.172.38 with SMTP id v35csp7337984wrc;
        Tue, 12 Sep 2017 09:43:01 -0700 (PDT)
X-Received: by 10.55.74.133 with SMTP id x127mr19556403qka.239.1505234581818;
        Tue, 12 Sep 2017 09:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505234581; cv=none;
        d=google.com; s=arc-20160816;
        b=dKD4CAtJnSRX/LL8pXIMlbRvVyJEqZtLj5yVRb/6jAHC0ao6oyJ//inNaQkyYJoaNQ
         amlmdtmeaRtwHMUQoM7XU1Ckjfp9ZETrP7R/Gqf56G2raZdcQ3RkCgo5unmF+0EU/m2n
         +YpUEpIPA3nOH0JAUewD0JtnnpEC98d36HA2YjXOxfBmg34AuwJ3POsUejefvVVvvYOJ
         wRZPd8W9RWY21RwjNmfL7WvxZ2cRTuXp1tCpIg7ByGS33h8hWy8VTNUz/+/HIDSQuH9/
         584ZO4Rep82ZZ6EHNsoUGP08Iv1Ihb1K3O8RE5hb/JkeUf1OOUpiRG0FvZyUO1uW7dzp
         7LeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fy7cY8RnAYJVo+LmDRLpeb3p/TS8W8uePh1xK13w8Eo=;
        b=WkwYKCen3ikZVSbuJ30Z1BH3UdZu6lHm1HKDaaVmCddDRkluGYZ742lM/ipJNULQDp
         s+teMQQWgDCHg+6RdXOGqWCXngS/3ThK8oeUQDlpEL7dpJN26pJGube85VJsZJx5FkJB
         n2yK47Gf68cav2k4e/yi6b57i+i3mm4CBaECQ6iwn4ItpniYTYk9RquVXxcC/Cg7newP
         /elFjW115btyjIW5W7/cStfX1bj2xY/pf+047wREs/xhTlVtWqHfQqC4K2BHTbwbvitX
         06K92I08clzB0pmHp/sWf6+rG5dw7aFZ6XBmor5KXcoj3FENLJd/joGn0YzmYKORzk8V
         Vf7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RgYi+EDW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n94si12263324qte.174.2017.09.12.09.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 09:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RgYi+EDW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1droH5-0001m6-Gd
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 12:42:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1droF0-0000Gp-Ly
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 12:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1droEz-00082W-Aj
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 12:40:50 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:45891)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1droEz-00081a-2c
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 12:40:49 -0400
Received: by mail-wm0-x22e.google.com with SMTP id f199so61777203wme.0
	for <qemu-devel@nongnu.org>; Tue, 12 Sep 2017 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fy7cY8RnAYJVo+LmDRLpeb3p/TS8W8uePh1xK13w8Eo=;
	b=RgYi+EDW8v8fClDVFEsQfsC6JJtjd9FpUvB1V4ULB8eTPiPmSk+SLMn7Gw4mU/cZUZ
	cvAvbw7+fJw1LaYzFS7/0j2gT1WXQKSBUynaSIZlrXPoRL7f4fHRl02CxslgLUdzFvnC
	iDIMSJMLofwh2XXNdjODi2eAJw+p8kDFnWoaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fy7cY8RnAYJVo+LmDRLpeb3p/TS8W8uePh1xK13w8Eo=;
	b=LXcvUwEnEmXKih1CFgHygmT6YInbOojHduHTEpx5coG9GFXjDcFxwC2Ykptv5QelNg
	siRQ+ScYEtnqKyoXnnViWe6Oe2KBtVKlsGhBezi+rx93CH4Aithx4n5w1DEtZD+iXZsx
	0ogw5j6/00vsWSmkn5n+5lnkUDQH64RbRzAzZf8/d2WLjq5naR3tQxsSd+I4g4K+O3P/
	IpGczlP2gSlc5A+gmZIIkUX4Iv0+Cl3VKR6U03i1sjzlKk2+kUdZO8UsS9OPFTALlILo
	LzN9tuiOTV/Y8qOJTiA3y6M/qjU80XT1wzo7S08Hml6lsnZMyjAjgY5orID9ywK3uhcD
	j/qA==
X-Gm-Message-State: AHPjjUiNN/oyXVk1Q2WdDxYCaxYIS3SlYzMqR/5LK0ebuMsZeMMxihGh
	YAowTHh0tTe3ZI/q/wyuszy8zyyXfqvvrIBJ58IgJA==
X-Google-Smtp-Source: AOwi7QCShmkbJnswuTwu180xI1icPd9f2qE/MC2d3bW4U/J9S3jT41JMy+NhL3qgxVwIZMwu4RLiIMtsQ288zsde+mM=
X-Received: by 10.28.102.213 with SMTP id a204mr103446wmc.151.1505234447817;
	Tue, 12 Sep 2017 09:40:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 12 Sep 2017 09:40:27 -0700 (PDT)
In-Reply-To: <ca218563-0789-f11d-fa7b-895998a1a84d@amsat.org>
References: <1505232834-20890-1-git-send-email-peter.maydell@linaro.org>
	<ca218563-0789-f11d-fa7b-895998a1a84d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Sep 2017 17:40:27 +0100
Message-ID: <CAFEAcA8BgKzRpK8gQRUZ7qOJkpS-yQkYpxt=1pq-FuT7XXB5vQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-devel] [PATCH] mps2-an511: Fix wiring of UART overflow
 interrupt lines
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ctu6bRaQd3gn

On 12 September 2017 at 17:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> (CC'ed qemu-arm)
>
> Hi Peter,
>
> On 09/12/2017 01:13 PM, Peter Maydell wrote:
>>
>> Fix an error that meant we were wiring every UART's overflow
>> interrupts into the same inputs 0 and 1 of the OR gate,
>> rather than giving each its own input.
>
>
> oops tricky to catch
>
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/arm/mps2.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
>> index abb0ab6..769cff8 100644
>> --- a/hw/arm/mps2.c
>> +++ b/hw/arm/mps2.c
>
>
>         /* The overflow IRQs for all UARTs are ORed together.
>          * Tx and Rx IRQs for each UART are ORed together.
>          */
>
> can you update this comment?

The comment is correct. "txrx_orgate_dev" is a 2-input OR gate,
which we create one of per UART. It ORs together the TX IRQ
and the RX IRQ. "orgate_dev" is a 10-input OR gate, which ORs
together the TX overflow IRQ and the RX overflow IRQ from each
UART. The bug here is just that we were using the wrong input
pins on orgate_dev.

thanks
-- PMM
