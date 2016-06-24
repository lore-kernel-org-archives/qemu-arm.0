Received: by 10.25.21.96 with SMTP id l93csp978051lfi;
        Fri, 24 Jun 2016 03:56:24 -0700 (PDT)
X-Received: by 10.55.165.67 with SMTP id o64mr3943665qke.51.1466765784338;
        Fri, 24 Jun 2016 03:56:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si4497067qte.13.2016.06.24.03.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 03:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGOmd-00066h-Se
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 06:56:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGOmZ-00066C-EQ
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 06:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGOmX-0002w3-GJ
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 06:56:18 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGOmX-0002vw-CJ
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 06:56:17 -0400
Received: by mail-vk0-x236.google.com with SMTP id c2so114665003vkg.1
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=skLZwPrbbv6oo0K+pIEAnzcbieTjvES1QsAqjD/fe5g=;
	b=RhEfaJyEksLqy3+yK3ingV518i8seC7c4KKqOVma/hatJY4KW7KduDtwm75NNmoHXP
	Y0k4XODM8xBF7Pw1qTK8GV+srKvuOMm1uWBcwOaxyAqdwqLhqafm+GwhqNXV7SS9rca5
	24Hb6Tb3br/hhEBJEABoKqP99MYLUxxLUoMig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=skLZwPrbbv6oo0K+pIEAnzcbieTjvES1QsAqjD/fe5g=;
	b=dqisq9zfsyU3KvT8bR9droiVd2ccN6uJ5vkEFbFjNP8DfCdCxcKKKnLNzD4cDz4r7f
	XzsivaIA2cvTd/CUGxZDigaPx6ekrb2RQwq4vCxccM6zT3PJETBsSWlP37Q0EjSCK1g6
	ZVvzvaU/EqouMjvFHp02RSt4BWfOEFfnLM6GZi1T6sLYKgVrkUdwCP75xEP5oUScy3xI
	HiKPTN6LDUX3KkVi/Wpo8ylrb/D5g/TOilq3MIq++ve829NcATVusUCBH29/EgWCFUmp
	U+F0I4Xys+1OQYr8t4vQaVUiHPl4uoFVCygKVO+KMP42rxpZ6cXwT2OseDivEJz073bv
	faHg==
X-Gm-Message-State: ALyK8tLDU3Q67AtYgS+WCFEX7bCqr8dr9krWVWE541xlRXunYxFGnzaEgc47bf4OFv62vvPqgvsL4FKkjo32jJJt
X-Received: by 10.31.72.135 with SMTP id v129mr2188839vka.120.1466765776761;
	Fri, 24 Jun 2016 03:56:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 03:55:57 -0700 (PDT)
In-Reply-To: <1466734909.23740.125.camel@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-4-git-send-email-andrew@aj.id.au>
	<CAFEAcA94oy9Bw=1trtn1rnbobMQwpRg-8oOgf1G_1rbhaZH-7w@mail.gmail.com>
	<1466734909.23740.125.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 11:55:57 +0100
Message-ID: <CAFEAcA9gC+Youc18OMyGFBfiWktP3EVra2efAR2iBQN9LWpM+w@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v2 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h4hn77gr5o7Q

On 24 June 2016 at 03:21, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-06-23 at 18:39 +0100, Peter Maydell wrote:
>> On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
>> >
>> > The magic constant configures the following options:
>> >
>> > * 28:27: Configure DRAM size as 256MB
>> > * 26:24: DDR3 SDRAM with CL = 6, CWL = 5
>> > * 23: Configure 24/48MHz CLKIN
>> > * 22: Disable GPIOE pass-through mode
>> > * 21: Disable GPIOD pass-through mode
>> > * 20: Enable LPC decode of SuperIO 0x2E/0x4E addresses
>> > * 19: Disable ACPI
>> > * 18: Configure 48MHz CLKIN
>> > * 17: Disable BMC 2nd boot watchdog timer
>> > * 16: Decode SuperIO address 0x2E
>> > * 15: VGA Class Code
>> > * 14: Enable LPC dedicated reset pin
>> > * 13:12: Enable SPI Master and SPI Slave to AHB Bridge
>> > * 11:10: Select CPU:AHB ratio = 2:1
>> > * 9:8: Select 384MHz H-PLL
>> > * 7: Configure MAC#2 for RMII/NCSI
>> > * 6: Configure MAC#1 for RMII/NCSI
>> > * 5: No VGA BIOS ROM
>> > * 4: Boot using 32bit SPI address mode
>> > * 3:2: Select 16MB VGA memory
>> > * 1:0: Boot from SPI flash memory
>> Maybe we should say this in a comment in the code?
>
> The list describes our specific value choices in the register's
> bitfields rather than fully documenting the bitfields and values. If
> you prefer I could switch to the latter and make it a comment, but
> failing that my only thought was if we tweaked the value the comment
> maybe come out of sync. By putting our choices in the commit message
> the description is at least accurate for what was configured at the
> time.

I'd just like some idea of where the magic number comes
from. At the moment the source code doesn't even have a
reference to a data sheet that would indicate where to look.

thanks
-- PMM
