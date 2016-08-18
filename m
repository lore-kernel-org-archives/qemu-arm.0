Received: by 10.25.21.156 with SMTP id 28csp468075lfv;
        Thu, 18 Aug 2016 12:19:43 -0700 (PDT)
X-Received: by 10.55.170.1 with SMTP id t1mr4517587qke.42.1471547983038;
        Thu, 18 Aug 2016 12:19:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a66si2218924qkf.165.2016.08.18.12.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 12:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baSqs-0008Gi-Fj
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 15:19:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1baSqo-0008Gb-TQ
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1baSqj-0001ln-RB
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 15:19:37 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1baSqj-0001le-If; Thu, 18 Aug 2016 15:19:33 -0400
Received: by mail-lf0-x243.google.com with SMTP id l89so2174836lfi.2;
	Thu, 18 Aug 2016 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=9SWkp1qS3XmC0cOLURegkdnq/4i/wK+SpxsdqRJjHOw=;
	b=hL/xQulyLNk7Ee9wywAIaVDjBYxfEkhLAuwC+h2weXS9zMwstpFbcEp6r+snSlTCJu
	hjQMlOvnqRQNeWpKmFzogjlmbhOiLHY6kQDIb/r+q0q/Z7IFAtGuSOI0Ydz9J/TFbqJi
	l4db1r979F4mgeqatLSyNpvtSNzYx4WMNHjC9fEFxZIkkE3U8dkwf+O1jdgowq09fg0B
	aUYfGJdsS8O/+zjldriF+ixWoC1yEdpXJ8IlP/eHbmaSj12z2ruYN+k9ObjvJ+lINoIF
	aVpdIrUTPcWVEsOHzLgKmhGCftYpC5aC0hsDlhTjeesh42aRqFwsVYq6GG5cVJYqX0kz
	cBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9SWkp1qS3XmC0cOLURegkdnq/4i/wK+SpxsdqRJjHOw=;
	b=RFOCH1ZD8+R91V3jFDfEdb9wUelk+3zUAXZWVqvRqXCvF8UfzB39UYh0B8HHs1pE+C
	f9Q3BsJu1dj0bLzx14nH3UAyKlLIDdk0+8eWitcL6y8zpjmmbmD79bQadv5BgCPmjxmA
	nlb9wpppjKgJD5he2yPm8FsvNWHYR3fkk6mlZRjVJvHhC4s/2wujrU7Cnk1Xto5K+/kE
	Ad4wf8jr+oUYD8N69m+A/KxwmaAwTn4RPfcVBavp7UIZ5Yi4b1GefYAS8e/4e57s0cTP
	4pdz4OQVrpTs7R1jFdQthRK84jAhgKWo77BOUqOIsi2a84mfQ6H0YB2wxNMJZIVo0jQB
	BwYA==
X-Gm-Message-State: AEkoouu805Z2uCNej/trk1E/g6+rd7tD2uVd6+PBy/wMXXZ71sVj2M6YFBIuIsh/rzpJVw==
X-Received: by 10.25.201.69 with SMTP id z66mr898816lff.226.1471547972343;
	Thu, 18 Aug 2016 12:19:32 -0700 (PDT)
Received: from [192.168.75.104] (89-70-149-145.dynamic.chello.pl.
	[89.70.149.145]) by smtp.gmail.com with ESMTPSA id
	i125sm545148lfd.29.2016.08.18.12.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 12:19:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20160818140014.qhbctpmlg6umqkvm@kamzik.localdomain>
	<CAFEAcA9oAi5++H0eYiE-SyHMtLFmD5haw+d0DsN+MLo29f9U_A@mail.gmail.com>
	<20160818190421.GE2009@work-vm>
	<CAFEAcA-bnav367B38xcjZt0-TLXh68ZWB3DoJwvu2RT3qRu-Sg@mail.gmail.com>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <e1d7c6a7-969e-283c-0299-10bdc83d3a88@gmail.com>
Date: Thu, 18 Aug 2016 21:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bnav367B38xcjZt0-TLXh68ZWB3DoJwvu2RT3qRu-Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [Qemu-devel] hw/arm/virt: vmstate-static-checker.py
 results
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
Cc: Andrew Jones <drjones@redhat.com>, "Krzeminski,
	Marcin \(Nokia - PL/Wroclaw\)" <marcin.krzeminski@nokia.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M5V+Z/6raDXt

W dniu 18.08.2016 o 21:05, Peter Maydell pisze:

> On 18 August 2016 at 20:04, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>> Hmm, except there are two separate things with the name "xilinx_spi";
>>       vmstate_xilinx_spi in hw/ssi/xilinx_spi.c
>> which is the state for the "xlnx.xps-spi" (aka TYPE_XILINX_SPI) object.
>>
>> and for added confusion:
>>        vmstate_m25p80 in hw/block/m25p80.c
>> which is the state for the "m25p80-generic" (aka TYPE_M25P80) object.
>>       also calls itself "xilinx_spi".
>>
>> These went in a pair of Peter Crosthwaite commits at about the same time 4.5 years
>> ago; I'm guessing it was just a copy-paste.
>>
>> I think my preference would be to update the name for the m25p80 so it's
>> not got the clash; but it seems m25p80 contains definitions of about a zillion
>> flash devices all derived from the m25p80, so I think I'd have to try one of
>> them to see if the xilinx_spi name finds it's way onto the migration stream;
>> I suspect it doesn't.
> Aha. Yeah, we should fix that. (I have a feeling the m25p80 devices are
> all only for boards where we don't care about migration-compat, but I'm
> not completely certain.)
I had a patch to change vmstate name in m25p80,
but I do not know why I have not send it.
I also believe that there is no board that could use migration of m25p80
devs (yet?).

Regards,
Marcin

>
> thanks
> -- PMM
>
>

