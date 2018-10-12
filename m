Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp951860wrt;
        Fri, 12 Oct 2018 08:26:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63EufmAUQ01k3ymlLze1i5IEjFKILzRB4rg0cfF+xYnq43TAYaWpbJb80ZP+d9FsSqqo3jD
X-Received: by 2002:a0c:b416:: with SMTP id u22mr2102471qve.97.1539358007989;
        Fri, 12 Oct 2018 08:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539358007; cv=none;
        d=google.com; s=arc-20160816;
        b=qEFjii1Fp1kfPM7ZsNE6OP34LnwEjXfd6r+4EV7eGRHmfYVvqz87C68LUdpOCCP8Pc
         +8skhv23DmXSPtzC0A6OyTV55BYMHcJQYFlVuOOu51JlpnpeCXGWcTeRUAglKXchFARz
         xJH489AflEnnVa9nh6GC8STGjIXPbft38R7MAlC3ge2g+LRhn28cWx7C54met4WWyrKm
         lPjxLs/o0t+XwW6AmhHPMmkjA/hEIGpf4F+0zFT7zyPLaIeQX0DEf47kqS6Knv1q7AHV
         lWe5Mu3EUEjyC+2o+FJBkIqedOQSTiEjZKEDEmY7rOn8wrig8Ccpaqiyfm5x5l3OgHOZ
         MFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=crxxKVHZAnqjRcL44/XpUynp1/oqAWTmjgDOLY3wN40=;
        b=Y0p0/98T8KJR/SOUB6ABiHAHypRLdWwOIvAbbuwoHXLsqTHV/CSGoZ94vamyUnNvTl
         JkAPBliPsh+3VdecLdzDtjbDbuSupsKAxTJFvl1QdXzNZia8+Sg2AhVVZ00wSWc4SsZW
         cxf8ADlGFF37c8FmNH3pNc0Ta7KHGCSlz4wbpOjayLcDg4CaJy4L92xFFREqAsgmBGRa
         5yI58OwoTlp5UyajFfrPzts8nlE7lZPc7B4IN3GH3YWxMXjzk7Wx3GFucfDuslHlAWwA
         3sLbS6YeOtYMtEkz06f6Xtt5zfCrakFEQ9iNKHLIeSndFE4BbDQkjU3oz33asqZvIZRY
         VTKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bur12R10;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bur12R10;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lfsQazs1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76-v6si474672qka.83.2018.10.12.08.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 08:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bur12R10;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bur12R10;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lfsQazs1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAzKx-0006yE-Hl
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 11:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAzKn-0006y8-HF
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 11:26:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAzKk-0003sq-NB
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 11:26:37 -0400
Received: from greensocs.com ([193.104.36.180]:56617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1gAzKg-0003em-P6; Fri, 12 Oct 2018 11:26:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E91086FD8A;
	Fri, 12 Oct 2018 17:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539357979;
	bh=rbIi9/VoW2hDf8BCyfYmUeCzsIlz2c7smSgR9EVI0vs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=bur12R10bwPCWy2GAIRTxReNIjJlqyFb3rL6YzPuL4T46wTNi4ACT+x7mmdXu3Bpe
	OXFEGfB9ox26TGzkzUKPOy3CD81M9RxMt7Yy9569YrH4N5lv//BlzzCPenDGTe7scZ
	FF4+UP46grxxcHn1CDeS45JjCLW3V22UOx+KJBCo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bur12R10;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=lfsQazs1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VK0EAgAwp-f; Fri, 12 Oct 2018 17:26:19 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 1873D6FD8D; Fri, 12 Oct 2018 17:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539357979;
	bh=rbIi9/VoW2hDf8BCyfYmUeCzsIlz2c7smSgR9EVI0vs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=bur12R10bwPCWy2GAIRTxReNIjJlqyFb3rL6YzPuL4T46wTNi4ACT+x7mmdXu3Bpe
	OXFEGfB9ox26TGzkzUKPOy3CD81M9RxMt7Yy9569YrH4N5lv//BlzzCPenDGTe7scZ
	FF4+UP46grxxcHn1CDeS45JjCLW3V22UOx+KJBCo=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9527F6FD8A;
	Fri, 12 Oct 2018 17:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539357978;
	bh=rbIi9/VoW2hDf8BCyfYmUeCzsIlz2c7smSgR9EVI0vs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=lfsQazs14ikpzy+jjQDII3/XWm7qiPkT13Ux0dRfEJqUoiXBYGvcvNnF0xokZlUdA
	thF/p+lgBTeK6AAdph0LV59PESUceyCLzrHtDVeJftjrthcsnpeinT0SEwShQ0RM4G
	nliIDIgmd4M4uLlzA3nCU7QbelazFIwS4tT0/x/I=
To: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <09e1483c-298e-d41a-f9c9-4f186f530dcb@greensocs.com>
Date: Fri, 12 Oct 2018 17:26:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v5 0/9] Clock framework API.
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
Cc: edgar.iglesias@xilinx.com, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iHj195/tBUNP

Hi Peter,

Sorry to bother you with this, but you said some time ago you would
write something about reset.

On 10/2/18 4:24 PM, Damien Hedde wrote:
> There is also the problem of initialization which is very much like the
> migration. Currently, in the zynq example, clocks outputs are initialized in
> the clock controller device_reset. According to Peter, outputs should not be
> set in device_reset, so we need a better way.

To illustrate the problem, lets take an example with the zynq case in
the patchset. We have a 2-stage clock tree:

+--------+            +----------------+              +------+
| Machine|>>base_clk>>|Clock controller|>>uart_clock>>| UART |
+--------+            +----------------+              +------+

At the end of the tree, the uart uses the clock to setup the backend
baudrate. The problem is that we need the whole clock path initialized
before having the right final frequency.

I've had some thought about it and I see several solutions

1. Set clock outputs in device_reset. But It can trigger side effects in
yet-non-reseted devices.

2. Have some kind of global 2nd stage reset to do all the output
propagation.

3. Try to propagate init values at platform building when doing the
clock connection.

4. (1) and (2) mixed. Have a per device 2nd stage reset "clock_reset"
(or any better name) method called when device_reset has been called and
all clock inputs have been initialized (by other device "clock_reset").
At the end of reset phase everything should have been propagated.

(1) being not-an-option and also (2) I think.

(3) seems complicated at best due to the unknown clock connection order.
And I'm not sure clock connection is the right moment to do this. In the
general case, a clock init value can depend on on some user-set/config
properties which will be applied later on I suppose (But I don't have a
clue at which point this operation -- the "realize" thing -- cab be done
in the platform startup sequence)

Do you think (4) is sensible ? It means any device requiring clock input
value will need to implement this new method. Basically this
"clock_reset" is just a part of the actual device_reset being delayed.
Obviously if there is a clock loop, the method will never be called.

--
Damien


