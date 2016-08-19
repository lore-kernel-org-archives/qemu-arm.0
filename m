Received: by 10.25.21.156 with SMTP id 28csp564981lfv;
        Fri, 19 Aug 2016 15:21:00 -0700 (PDT)
X-Received: by 10.233.239.149 with SMTP id d143mr12040953qkg.176.1471645259958;
        Fri, 19 Aug 2016 15:20:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q23si6090080qke.249.2016.08.19.15.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 15:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bas9o-0002Xd-Vx
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 18:20:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bas9l-0002W3-ET
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 18:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bas9j-0004gM-0V
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 18:20:52 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bas9f-0004fd-2u; Fri, 19 Aug 2016 18:20:47 -0400
Received: by mail-oi0-x244.google.com with SMTP id s207so7201377oie.0;
	Fri, 19 Aug 2016 15:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JTUB6y7vraN8h+yWS9G4Vgx+pJRYjBED86WU6K/8h0I=;
	b=sR1QPq4zazJemjG+GNnNrc6FlpL9mvU+pJdJLsdqqD3g4DznhukXWW6xZ+s/S0e+kT
	I+VYq2CesI2rbTj1Rpa6cD7SOLKL4SCOQp6seESGW1apRxdAmpcMdLDL/u0lcsA5lULY
	a/grd1nE58deW5ieO17awzT90XUM0F78Lg7GrhuANUWxZTLuYwu9aQzZzhCWIJFlbQY9
	5Ydsnyhn8fqg8Is8KI1RpRBIHYo1RP3foQY9VjPf8w/s6m4EjGMReJaqmCQkWHXDHwyV
	H87uqsM3l2he3sKfxZ1paBFIMHe3vK6S/4fWr/9COSzM4m/Ug/fQTQSq3gdKqA0Q4yOP
	c4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=JTUB6y7vraN8h+yWS9G4Vgx+pJRYjBED86WU6K/8h0I=;
	b=ZPA7VAmsSXxO4Q9nj6wxZLwTtQXyJ7nZBeVT45JGEHwYeiGNf45rGC4nDP10x7+d32
	J5wbtie8gkMd3xPTsSfSs8EyjsbX23NcEI1hXAE+x5LlAp14+V05La2efYSyYLsjzfwo
	ZmWLi7O8e8sophJhwiwESeifM38/8rF2bts+y/6zO1jOx6yXLRp8V8z45ni+guEJ4/7v
	p1SJdOWj8DNg4YzVKbaxbl+97rpGYPeRLmvFTt55JM9sinScIauroslq/JIZG/w3HBC5
	2HaEGvfwiGBC20yKxAF4+EX/Jr1nNZFciSd+TG7fBZ1jhK9Or08QUuVM5f8965SVYe6Y
	Skxg==
X-Gm-Message-State: AEkoouuwy/BZyImoXKnKNA3AxH0rYQtXkewr0BxjfRKwVF9qRYKyLNAXA6E0VG+PSVJo3gWtQcvUduudFkUiMQ==
X-Received: by 10.202.253.208 with SMTP id b199mr6249775oii.171.1471645245350; 
	Fri, 19 Aug 2016 15:20:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.229 with HTTP; Fri, 19 Aug 2016 15:20:14 -0700 (PDT)
In-Reply-To: <20160819141930.GE2004@work-vm>
References: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
	<CAFEAcA-m6B_S7zYRE0iqbL+sR8ieJweeVDHqxgx1JB+mGywo3w@mail.gmail.com>
	<20160819141930.GE2004@work-vm>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 19 Aug 2016 15:20:14 -0700
X-Google-Sender-Auth: jpvGIek2rihk9G9enEGMnLa3UyA
Message-ID: <CAKmqyKPPg7rfuhHNrRzZAjpx1JKFME-LUrEv2WMZyVpzQRVJ6g@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] block: m25p80c Fix vmstate
 structure name
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>, "Krzeminski,
	Marcin \(Nokia - PL/Wroclaw\)" <marcin.krzeminski@nokia.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	rfsw-patches@mlist.nokia.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JF9Jd9SOp7ah

On Fri, Aug 19, 2016 at 7:19 AM, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On 19 August 2016 at 13:30,  <marcin.krzeminski@nokia.com> wrote:
>> > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>> >
>> > Change wrong name of the vmstate structure. Since this breaks
>> > compatibility update version and fields to 0.

s/and/set/g

>> >
>> > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Looks fine to me.

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair


>> > ---
>> >
>> > This patch assumes that none migrates m25p80 flash devices.
>> >
>> >  hw/block/m25p80.c | 29 ++++++++++++++---------------
>> >  1 file changed, 14 insertions(+), 15 deletions(-)
>> >
>> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> > index 9828ee6..d29ff4c 100644
>> > --- a/hw/block/m25p80.c
>> > +++ b/hw/block/m25p80.c
>> > @@ -1189,9 +1189,9 @@ static Property m25p80_properties[] = {
>> >  };
>> >
>> >  static const VMStateDescription vmstate_m25p80 = {
>> > -    .name = "xilinx_spi",
>> > -    .version_id = 3,
>> > -    .minimum_version_id = 1,
>> > +    .name = "m25p80",
>> > +    .version_id = 0,
>> > +    .minimum_version_id = 0,
>> >      .pre_save = m25p80_pre_save,
>>
>> Are you sure that the name is part of the on-the-wire state?
>> I thought it wasn't, in which case this doesn't even need a
>> version bump, much less a version-reset-to-zero. But I could
>> be wrong. David, Juan, Amit?
>>
>
> Yep, it does:
>
> 000a9000: 00 1c 04 00 00 00 1d 0a 78 69 6c 69 6e 78 5f 73  ........xilinx_s
> 000a9010: 70 69 00 00 00 00 00 00 00 03 00 00 00 00 00 00  pi..............
>
> that's from:
> ./arm-softmmu/qemu-system-arm -M tosa -device at26f004 -S -nographic
> QEMU 2.6.90 monitor - type 'help' for more information
> (qemu) migrate "exec:xxd -g 1 > tosa.mig"
>
> it's not essential to redo the version_id's, but it's as good a time as any
> to get rid of the old version code if you've just broken the compatibility
> anyway.
>
> Dave
>
>> thanks
>> -- PMM
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
