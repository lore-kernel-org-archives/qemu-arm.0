Received: by 10.80.166.35 with SMTP id d32csp3195869edc;
        Tue, 25 Oct 2016 06:39:41 -0700 (PDT)
X-Received: by 10.55.107.6 with SMTP id g6mr18601030qkc.178.1477402780960;
        Tue, 25 Oct 2016 06:39:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v35si13568264qtc.76.2016.10.25.06.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 06:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz1x6-0008Vm-8g
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 09:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz1u7-0006uG-H0
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 09:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz1u6-0001ie-HK
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 09:36:35 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:40278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz1u6-0001iV-DA
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 09:36:34 -0400
Received: by mail-ua0-x230.google.com with SMTP id u14so13175097uau.7
	for <qemu-devel@nongnu.org>; Tue, 25 Oct 2016 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m533gcydx7pToGfjSW1EJ0b29uiP/VgC8ow47mL1ujc=;
	b=YLBE+uGXn0nqh52/EYlKxMV5zcbdIOqQSF1hYphbEs56abfJRkC9zudT4b0OuMJbLk
	8+bJqTOuyGRUVIQvxVJeZ+mDJpgv0h1+YkNdL93zwz0G0InDtPYu6m8wj59Hi/Re0unt
	ccsa3k1BT7nuY/ftPG9PA3uQgwBlZOdXsesIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m533gcydx7pToGfjSW1EJ0b29uiP/VgC8ow47mL1ujc=;
	b=WZdLlHpStZryCtIRdQbDQ0///yzp1HsDQm3tgoc54itDnW9rSmYuoAsZMruGkQdUov
	0B9a1RUcikiwyAdOKYO8cV54Cfe5yF5omgD06IZ7dkfOaPa9dn1QQSvej8PKDnMfDX1p
	TUE/Ce5A/AxhJdje6UaF/7wLmW7V2V7NIfWC7gVZnEY9p1WQ2kg9eTTOazv8RHrjt0Q+
	tOXK/O6slHfoPx1/TDvEnCIVFCWHBqK1dgsebPxhgYvT2HfKk0fp47EperDjSrarL3q4
	wl6Wtlc0DWIGYEvYuhtAd1eWkntXxsCz98doaZSywbepaT0zJM+oLDrHfKfuXqx7ZS5Z
	P/TQ==
X-Gm-Message-State: ABUngvfKoAjbLuW2lbi8rJsiY88b5xpUWeoveflmxmMhJYt3eDNgt2HRzX2+ZiFyue3V96eSt0dW26ZANxl1Xw4W
X-Received: by 10.176.3.237 with SMTP id 100mr3022837uau.120.1477402593709;
	Tue, 25 Oct 2016 06:36:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 06:36:13 -0700 (PDT)
In-Reply-To: <20161025124732.GT32180@toto>
References: <1477378140-2670-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA_H7OaczsgH-Tu6X10KoerJTwtr_jf2h4Jz+Wn0b+pLSw@mail.gmail.com>
	<20161025124732.GT32180@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 14:36:13 +0100
Message-ID: <CAFEAcA8CqDGnkaoQvtYniSR6hq=FQo47N0Hoiisqu=CaiUHYnw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] char: cadence: correct reset
 value for baud rate registers
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Qemu Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lo7zX2pNg4ct

On 25 October 2016 at 13:47, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Tue, Oct 25, 2016 at 01:19:28PM +0100, Peter Maydell wrote:
>> On 25 October 2016 at 07:49, P J P <ppandit@redhat.com> wrote:
>> > From: Prasad J Pandit <pjp@fedoraproject.org>
>> >
>> > The Cadence UART device emulator stores 'baud rate generator'
>> > and 'baud rate divider' values, used in computing speed, in two
>> > registers. The device specification defines their range and
>> > their reset value. Use their correct value when resetting the
>> > device in cadence_uart_reset.
>> >
>> > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> > ---
>> >  hw/char/cadence_uart.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>> > index c176446..b8d4c28 100644
>> > --- a/hw/char/cadence_uart.c
>> > +++ b/hw/char/cadence_uart.c
>> > @@ -471,7 +471,8 @@ static void cadence_uart_reset(DeviceState *dev)
>> >      s->r[R_IMR] = 0;
>> >      s->r[R_CISR] = 0;
>> >      s->r[R_RTRIG] = 0x00000020;
>> > -    s->r[R_BRGR] = 0x0000000F;
>> > +    s->r[R_BRGR] = 0x0000028B;
>> > +    s->r[R_BDIV] = 0x0000000F;
>> >      s->r[R_TTRIG] = 0x00000020;
>> >
>> >      uart_rx_reset(s);
>> > --
>> > 2.7.4
>>
>> I'm going to wait for a review/ack from one of the Xilinx folk
>> before putting this in target-arm.next.
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Thanks; now applied to target-arm.next.

-- PMM
