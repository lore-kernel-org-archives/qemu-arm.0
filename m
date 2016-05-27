Received: by 10.25.30.65 with SMTP id e62csp784111lfe;
        Thu, 26 May 2016 19:06:52 -0700 (PDT)
X-Received: by 10.55.27.98 with SMTP id b95mr12007948qkb.18.1464314812013;
        Thu, 26 May 2016 19:06:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d77si15537501qkg.3.2016.05.26.19.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 19:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b67Ap-0000AG-Gw
	for alex.bennee@linaro.org; Thu, 26 May 2016 22:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b67Aj-00007c-QD
	for qemu-arm@nongnu.org; Thu, 26 May 2016 22:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b67Ae-0001hE-MF
	for qemu-arm@nongnu.org; Thu, 26 May 2016 22:06:44 -0400
Received: from m12-14.163.com ([220.181.12.14]:60578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b67Ad-0001ga-TR; Thu, 26 May 2016 22:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BHlLG
	taEMuLBPI6JjASkW+eJKz9eruqbAcrNPal8+Fo=; b=aLa0rm3qih/MmTOtJ9R8K
	n4jWEZCEsx7u5qHyJfYm4xc5x5zQrYJchk1CW2XBNk3OBsoe6pZD/NJZ0zGHqzch
	1KStJHyxpOInHklcVOnAh1vUKb/Mc3ZQyjdzdaDlN0CdwiXsYjiCXM2Y2X4ZUiad
	E47HZ9j8UvIJMjzLyi5c88=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp10 (Coremail) with SMTP id DsCowAC3hQaNq0dX1A5fCA--.9442S2;
	Fri, 27 May 2016 10:06:06 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
	<1464173896-4088-2-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <5747AB8C.7040502@163.com>
Date: Fri, 27 May 2016 10:06:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8oEjC0wUudEpKKmtbk86eB87KOh-__QB+GrcW6LFy5uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowAC3hQaNq0dX1A5fCA--.9442S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4xJF1kGFy3tF4xtw45Awb_yoWxtFb_ZF
	WkC347Xws8tw4jywnxArWSyrykJr4UWFWxWF13X3yI934UJwnxJa9Y9rn7Xr13JwsxuryF
	qFy0vFykZF4rCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe5ku7UUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0g52xlUL-DsVQQAAsh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/char: QOM'ify pl011 model
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
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKasumiTUPkv


在 2016年05月25日 21:08, Peter Maydell 写道:
>> -
>> >      /* AUX / UART1 */
>> >-    /* TODO: don't call qemu_char_get_next_serial() here, instead set
>> >-     * chardev properties for each uart at the board level, once pl011
>> >-     * (uart0) has been updated to avoid qemu_char_get_next_serial()
>> >-     */
> This comment says this should be fixed by having board-level
> properties; you've removed it but this patch isn't adding
> the properties to this (SoC-level) device. I think the board
> level should be looking at serial_hds[], not this code.
>
Hi, Peter:

I found bcm2835-peripherals is only used by bcm2836 code, you mean 
this(bcm2836) is the 'board level' and I should set chardev properties 
here ?

Thanks.

