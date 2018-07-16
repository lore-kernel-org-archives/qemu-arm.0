Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1548334wru;
        Mon, 16 Jul 2018 07:07:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfStkkykmqbrg3fHCMYK9KOhZjVa8pP7PWDX5G6W8xHLEo+Ww0BEI34v0K2t02gZDYTeamd
X-Received: by 2002:a0c:a162:: with SMTP id d89-v6mr18636962qva.198.1531750076400;
        Mon, 16 Jul 2018 07:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531750076; cv=none;
        d=google.com; s=arc-20160816;
        b=QR2i8xBTSN1OKx3pBEjAs9vpea0yW2jRXKf8n1l7gdMU4Uv8U/ZhCfSOlXonoJdx1H
         r4HUOMo86Wd4YJN4NguhIDEm7MUZsXKxTNZ9/kB/DQxoSZelc5FgRa+Mv0WPrI+JbfrL
         4dQlWIFf+e16ZpptVord4rXOcdvln1Ja3RS4/19fqEZlJ+XrusAoINA7nNNu2g6fQn6F
         nWpnZKSPCrI9JIqlMUXNVvqD3S7iJQMearZpjLVc9L/TgqlZ4Tk0dQrITzhhSawinH3e
         lAe9kd/exhmD++UJtMpDypgMSdICbMliXVA+24hRZftOAfWx3AprQkMEH3jHlBvjIcpE
         HM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=L61SCjw9TnhoiA1VV7DRqAg5u7PMn7LN5jJk9hEjGSs=;
        b=mtbrwKLTw0ETbmBmd5KYwhxVM8ZKq+v6SuSJxbnEtzLvGiK9Ys4FxIQn5vuViPp/SL
         bqG9KyhOutCRQNLv09KP8cdW23aiCbySQ33Of7cV6nXU/Dq/gQKLtlhOMp5jxBnIJNUX
         myybrYViRVMJujaLiV/WZkjVklpN/FGLlfdRHafJF3CrD/08ZWK1EmxEs+81fyXBtyvS
         +4w+kmDKm4OU2Ec4t4mAwd84O1hi9CCC7Vm57DKodCQs4leKzp8i6tlyD87LwtukHxBt
         9TW5mRMJNcsSOG57T+VnNZxoHvBb27pplIa0K4z3FdT0ED3qe/YEOjfKdno0r1mhqFL0
         0qEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afheYnsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15-v6si1295403qtp.95.2018.07.16.07.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 07:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afheYnsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff4AN-0003Ww-Qd
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 10:07:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff4A3-0003Ux-GN
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff4A2-0000Bo-KN
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:07:35 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:40061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff4A2-0000Bi-E3
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:07:34 -0400
Received: by mail-oi0-x243.google.com with SMTP id w126-v6so74985799oie.7
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L61SCjw9TnhoiA1VV7DRqAg5u7PMn7LN5jJk9hEjGSs=;
	b=afheYnsqAS3ShxsKytUwlh4FPHhx8hOUwWDnC/O4PfzcHJgRKVkIa9+54rI6Lrl0jl
	CZFcuTb4Qb9Z74+WOqHokNX+ngyh6u3wFvy1VTjywIv8k+6kEwKqkYowAsQ2EPw8UslH
	1VDwQrRH4M60xLnnZhK0wWexYghw/D/3xuVRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L61SCjw9TnhoiA1VV7DRqAg5u7PMn7LN5jJk9hEjGSs=;
	b=ZWilrSjQCWYmLIhZgv9Vcbhu3aZWJeTif3PvG+MQ2dBTbgzHr6Q/b5AQtjKTmlc3n1
	9iQFLzC5ZpJ13zVvR9v5Ewj/jBG7fUemp1XoA3aCgztNDZJljbefPlB+jjyTV385Ovr+
	n2BYQtkvjT0uFKprfa7OFxyxVieLFHhBBlWlYksxT+mJH26xB9qvw6CxWf7EGf1zpEWa
	uMP9eXxSZwK3o1nYXkmAavjRDrJUaJtG1CkMK1toPlHgffP1flpcoTJc5eoD0a9qUg4A
	4kxmewbMY0L4r2E0sxSV2Lcf7SjjGv2FZublZpSTV5/qAh9kP2ApZ+dRtG1Zhp4Bl+fH
	Xj/A==
X-Gm-Message-State: AOUpUlHju0mTjtBoUkD6fOTd2pQ1UEHOZvfvgeRUSapS8yjBbl4XOjEH
	t/USpeahgMKaqbWP0Ap6HHHMPUQ3C0YbvJjIt1SdkQ==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr16792047oia.164.1531750053835; 
	Mon, 16 Jul 2018 07:07:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 07:07:13
	-0700 (PDT)
In-Reply-To: <e893ae38-9294-4b54-e950-6632b6b73532@roeck-us.net>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA9W88G8rd4iMq7qsNd2C2fRiYJ32dVooZLyzY10__5piw@mail.gmail.com>
	<e893ae38-9294-4b54-e950-6632b6b73532@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 15:07:13 +0100
Message-ID: <CAFEAcA_Vd46APz_czOP+OfB1nkGvGjuf=EPbB57TkkXKWkNxwQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman
 (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVyvxZS2jz7Z

On 16 July 2018 at 14:51, Guenter Roeck <linux@roeck-us.net> wrote:
> In this context, I can't get mmc to work with ToT Linux on raspi3.
>
> / # mount /dev/mmcblk0 /mnt
> [   47.099074] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> interrupt.
> [   57.339803] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> interrupt.
> [   57.390449] mmc0: Problem switching card into high-speed mode!
> [   67.581559] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> interrupt.
> [   67.587832] print_req_error: I/O error, dev mmcblk0, sector 2
> [   67.588908] Buffer I/O error on dev mmcblk0, logical block 1, lost sync
> page write
> [   67.610307] EXT4-fs (mmcblk0): I/O error while writing superblock
> [   67.620842] EXT4-fs (mmcblk0): mount failed
> [   77.819114] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> interrupt.
> [   88.058917] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> interrupt.
> [   98.298937] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware
> interrupt.
> [   98.303554] print_req_error: I/O error, dev mmcblk0, sector 2
> [   98.306044] Buffer I/O error on dev mmcblk0, logical block 1, lost sync
> page write
>
> Any idea what the problem might be ?

Same thing again -- no hardware documentation for that sd controller.
We took our best guess about what the behaviour is supposed to be
for raising hardware interrupts in commit f3d9fe8f959643 earlier
this year, but that was (as the commit message notes) pure guesswork
based largely on what the Linux driver was doing. Somebody would have
to look at what exactly this version of the kernel is expecting the
hardware to do and try to reverse-engineer what the model needs to do
that it isn't currently...

thanks
-- PMM
