Received: by 10.25.27.66 with SMTP id b63csp390871lfb;
        Fri, 3 Jun 2016 11:25:31 -0700 (PDT)
X-Received: by 10.55.174.68 with SMTP id x65mr4750062qke.184.1464978330998;
        Fri, 03 Jun 2016 11:25:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si4219143qhk.124.2016.06.03.11.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 11:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8tmk-0007Yu-HQ
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 14:25:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tly-00072o-4n
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 14:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tlx-0005Gj-4C
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 14:24:42 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tlw-0005GG-FJ
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 14:24:41 -0400
Received: by mail-vk0-x230.google.com with SMTP id d64so2005919vkb.0
	for <qemu-devel@nongnu.org>; Fri, 03 Jun 2016 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J5kbxeW5ahtHGnYdY+4JduQB66D1zmaCf2W1aOqU1Yw=;
	b=WD+QbpnWJYbFX9M7qYvjgzBIEUh3c4qdQK6PYqOKQbntL1S+xmc9p6xRktHwmyzF0g
	u5Nh4BWph60DnPu0kDXSZ+vT1bKFLeoTXPphEK1CA/IarvNN9WERoTR1BFARFYusLkqf
	aSc5YJE8WWtzf9vli6NYa/9+mYsln+pvcNgF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J5kbxeW5ahtHGnYdY+4JduQB66D1zmaCf2W1aOqU1Yw=;
	b=LDGVelbKpEi4KROE943Nm0kHPq7R4bfHwbNV8AVfkDWmW/u2/sNY6vzJO6WQznHity
	sv0cHj+XMO10yuczfQy62ZNlaeevi5S0Kgqtp5tikc05y7JqlbGF2KPUK5iStx22nmRa
	d2kMQRCrmQb9AsEPAbQLMyUQ3dvc/hZ8t3OjcRo+wEa3vtWPrgFIQEKQ6CVdGS7BHKqB
	ReSEaFscKwzP/lzwaAUUtCyHOalIpqiWG+UEqMj0AnanLhdKw1zF+PK7c7AaRPWTvZqf
	BY2RfH4kqij0/jk0eJq+hblO2elJXqQ9HYNwoXs11D0cT+PRQ5RvJv6M1uUhW315Cdn+
	DRnQ==
X-Gm-Message-State: ALyK8tKet8C0+QDmvDdTYBXSB6hzQyMKPa7PWgdGMPduGYCfNI17mbNEg/bmSUCeKtaRFYLbG+AAYZOXT5GMUEnL
X-Received: by 10.31.148.1 with SMTP id w1mr2359999vkd.6.1464978280056; Fri,
	03 Jun 2016 11:24:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Fri, 3 Jun 2016 11:24:20 -0700 (PDT)
In-Reply-To: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jun 2016 19:24:20 +0100
Message-ID: <CAFEAcA-R6F+aEGadimis3j5UoH8pf-4na7eEMo_6Sv9gVMhLXg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-devel] [PATCH 0/6] Drop the qemu_char_get_next_serial
 function
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
Cc: Rob Herring <robh@kernel.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BSo+kQf/MTxG

On 25 May 2016 at 11:58, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch series's main idea is to drop the use of
> qemu_char_get_next_serial. patches 1-5 QOM'ify the related
> device model and the affected board code. Most of them
> are arm related. The patch 6 get rid of the function from
> the code base.
>
> I only test the code with ARM versatilepb machine. The other
> machine need test!
>
> xiaoqiang zhao (6):
>   hw/char: QOM'ify pl011 model
>   hw/char: QOM'ify cadence_uart model
>   hw/char: QOM'ify digic-uart model
>   hw/char: QOM'ify stm32f2xx_usart model
>   hw/char: QOM'ify xilinx_uartlite model
>   char: get rid of qemu_char_get_next_serial

Hi; I'm afraid this patch series doesn't pass "make check"
(it looks like we segfault trying to instantiate the raspi2
board).

thanks
-- PMM
