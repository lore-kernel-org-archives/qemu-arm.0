Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2441058wrt;
        Mon, 17 Dec 2018 04:45:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UOZeaNHeC0SmwJ5sV2D/ogsnfF4Ksz9e8rkcxc8xjhHScolqrMux8bTAq2L/VGRRgLghXS
X-Received: by 2002:ac8:6b50:: with SMTP id x16mr13431485qts.368.1545050700638;
        Mon, 17 Dec 2018 04:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545050700; cv=none;
        d=google.com; s=arc-20160816;
        b=q+tsZv9wW+ONME+h5uao6AsvjPiLyfC8OWXOvE787Oe5oTMMsdamcpPkO7EeP+dBVM
         A9queQpCKmerYNRvwwleRTW72kMZ+C4TEQLy2hqz8YhHQlLMntjpshKO+XSdjXWOJDbE
         LTB9HFm62Uc15etXtF+Lzhhl2+uU82Vrf5p46bJtAxuTRHfuWTZ/X7fIudQfMw/qmBsy
         2rMP7zEBAo1A5Jm8FxPTHUGFGr2JJq2l0lMUpqG2Jl2GWIf1Zymi5DUlPlsN4xztLov+
         t+4LN6WXSq0SrMou1PM+CJctbzSrffWn3b4JXq5yNzw7+Zj2eVaFR4Zbe0uT0XuiFMPR
         K9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7qnNvyra26AHYgjrlVjpVa35pbfrc1iT+UCy43Fcd4w=;
        b=zHhGP2iucch6/OA70iRYO+JSJPDiPXTw0EZV1k57Xthh1P1sg3jvkzQ91jhRBZ+8cy
         YP+Y2AcLqEmaKMUJvS6PAWPomb4swJjiBdBcL3JOpph4vijHqgrUPVEnMwQrAb6fanTQ
         QkJIGg5C22FCLER0KSQ5OqAYSLy5KPddFdJhIUptZk6q7270qZ70dmUwrh9GMIIferUW
         jbZb2SiK2+nLHwHnZysmyDmsFHc7VLaSZKbPx83GkpobmrDY8vKIyTp2S13+EUEzcFTo
         Untfh9gbM5QiHo3gnBQfvlGnJQaP2TsgbH7wzx5kiE/5tuYzsAwenDI11+YXypxik40j
         R2Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SFxRKvm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p8si2999735qki.221.2018.12.17.04.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 04:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SFxRKvm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYsGa-0006QT-78
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 07:45:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gYsFX-0005vS-19
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 07:43:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gYsFV-0003Nu-1s
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 07:43:54 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gYsFU-0003NY-OO
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 07:43:52 -0500
Received: by mail-oi1-x244.google.com with SMTP id i6so10014185oia.6
	for <qemu-arm@nongnu.org>; Mon, 17 Dec 2018 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7qnNvyra26AHYgjrlVjpVa35pbfrc1iT+UCy43Fcd4w=;
	b=SFxRKvm32o0l3T0GAOmo+Rxfm24QyCyvmNh4kJxDqHXgNwjfWjxpT43zDZ4jff+Z9L
	DhwuEqGVQlG1qc6ILQdAnjw/d85LwMjKcuqMD3fOMfNDWsj6uhPRfJ725KcP7lel4Ubs
	RSDcRuTsKT55co4sqIMQVp4Ph402QRNnsc7s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7qnNvyra26AHYgjrlVjpVa35pbfrc1iT+UCy43Fcd4w=;
	b=XdcOEar0khwDF87LB8H4aMWbejUz1l0VJbeHcMmd2TVeqhcIP/9SlW1q3cUYs1tmRU
	UCG9zOppQjiQgYEReeFsHl5QqCYKKrt6/uLynK8QnDkGpi2ZrWDCRyt+TzyhKjicKNIN
	0IqC0kbHu1eSafAOf9ASUSQUkFPW1qibX7uDU6tZgXZkodByA9wJjGgGlDfErmDrbUGP
	C9Eva80tcxr+2O/TwvJ1cc48/tPDmhzoeROAuGjIhDMPiRWGViYUE5KI3t4VWFuqdc1p
	YwW/8FLwR9RsAbLx4nmkCBOzC9Vcz1RS6O4GydIVE2xEhpzQyDAe9GFIsALD0iW3g+Zl
	y06A==
X-Gm-Message-State: AA+aEWbAV+JQ9rqI3ds8GR6va4Vg4w+uLD6hG37CPkJg0SBR2rvyMzng
	rqYiDuJfUO7A02wL1/kG2/yOr+cD47ExsKIah6vyRg==
X-Received: by 2002:aca:c501:: with SMTP id v1mr4995176oif.48.1545050632077;
	Mon, 17 Dec 2018 04:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<07b4fcad-0b6f-a69a-bbfe-41d4fa895480@greensocs.com>
In-Reply-To: <07b4fcad-0b6f-a69a-bbfe-41d4fa895480@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Dec 2018 12:43:40 +0000
Message-ID: <CAFEAcA_x4+60U0Q-5q3fArWxQ58jfd4K4vhPSGZepd+-9E7UVA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v8 00/16] gdbstub: support for the
 multiprocess extension
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aODuVc1dpxs9

On Mon, 17 Dec 2018 at 08:23, Luc Michel <luc.michel@greensocs.com> wrote:
>
> Hi all,
>
> What do you think of this re-roll? Is it in good shape for upstreaming?

It's on my list to look at still, but I'm off work til
January now, I'm afraid.

thanks
-- PMM
