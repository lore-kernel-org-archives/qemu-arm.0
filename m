Received: by 10.223.159.82 with SMTP id f18csp612660wrg;
        Wed, 22 Nov 2017 12:20:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZxXtNFMk7Fxx4CI3TGfDbyg+7CbGeJucePjxEGyqwvS6TmFhVguU9Z79R7lyWubVl+pxkf
X-Received: by 10.129.34.85 with SMTP id i82mr13799482ywi.271.1511382001892;
        Wed, 22 Nov 2017 12:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511382001; cv=none;
        d=google.com; s=arc-20160816;
        b=qt6+3IWOAsZ8tgykz5mNx/hPsQXpB3JELx5hNyQAVdTG6KfaWdT908iiH029tYLXfE
         iNl7jfqGXiATP9OhsUP8r/wmLmVrOg6vR4h8Ucg/0nXIg1AH1Yb/grK1LUp0qW8OiA+c
         5SsLOVD0XCaNwBdX0g5BlreM5lrKitCc0Y9yKTK3q0I5CazJZL0KXoHjuOJLNSX2blnZ
         nZWlNJMuZLqlhiyQT2ewF/v/OV2pVzon9cI0CapiM4n2sZgLvTxMffw4+6rf9tWCsjIg
         cFh/T43oV6uJOdApeNLJ+w9cw6dlVV+ezvgQqgK9G8vKoRzkB2kduVHaz1jRgXjYHJn1
         9/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qJeJUxSx0+539X3ccfMRnJTpFFwSvItvniVX4rUZk0A=;
        b=L59mTuXPHcOe/Nry0jS5ZqMkBeVei5rZvJTt4oHi58RtPcsQmIGZ+M9hda0IrOu3bn
         zve2ie0pgK4kvm2es9qMSultZS/B/7Uk7FPtUNnpaIhfGYxsfla21Jiw/riXlWEYl8Af
         vwQfhS8vPT4+P3YOZLo2UGB0mZ58VCs3onJHfFOK1ehEg3ipVoWWgec4HomXDko5yk2C
         VkgKKHcFFpXp0HyObkMT+Ph7gha8WsIKXZ61BB6SFAnMmEAd8OHkqQilY6s00XoAayjR
         gWv88P5TuXEOKLQu9DieDbSMKcbP1Q4ryGCELHmNV7TQp8Os0krNsA9G/e8OCNktl51/
         gJAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r80WJYxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b9si3617653ybj.758.2017.11.22.12.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 12:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r80WJYxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHbV3-0008Ne-9Z
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 15:20:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbUn-0008La-FW
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:19:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbUl-0004qV-Rs
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:19:45 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHbUl-0004qB-LU; Wed, 22 Nov 2017 15:19:43 -0500
Received: by mail-qk0-x241.google.com with SMTP id j202so18422424qke.10;
	Wed, 22 Nov 2017 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qJeJUxSx0+539X3ccfMRnJTpFFwSvItvniVX4rUZk0A=;
	b=r80WJYxSCxeUsWVXB3DHLu2ou0hCQmFiZng8MRkc+I1qJ6xLIIPKlYgrkp9/YF2t1i
	7Q82jSN6RnE3Rtq8H+iWrB/Yr9qIQEGnsoVQdtS2KTz5HYWcns71T1rBAZJhlTsWUA9G
	RDfaXvE2pDv+nNSCorwgHmgAL7eF5ebyq9Oek6GEVQGoUd11uZGzwg+rnXkxII2L0zIe
	WpyCFeBmq8FiLoJ/SoYWbqV7jtUSGCU6V1ihMzobQO8FKlJ50eiqEUja4ZTnE96tl/a9
	0UiuJUsQMNTYSKVnaiSKdORYokrO4trLoEv+d497Ntm9g5WamJXS2SinO5YLFEGOt1BJ
	3DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qJeJUxSx0+539X3ccfMRnJTpFFwSvItvniVX4rUZk0A=;
	b=Eb4FbF9rzUrIcYGAtzsPi+gS1yjAaF4Zh0vYFFvUHHtI/unZ+f8OY4+hqB7mE8OLxT
	0Dv4/Q8Ywo/3Q4aEDxD6R27OzZAbblKqZp+ScKKlgZR/dlbtC1gocJmEfy9C9UwwMnIB
	LYEzSmwYQwrzcBOfghMgkXktzlMPkWzaaCj/aedApp6E1ffGVg9EO/pkKHNM3at4IQjv
	CxeBPKQIFYidfvrYs6PXOom5JAAt7T5wH000XmnPI8QXvV25JeYljt4x5h6S5YI/+KAX
	bVp2LyKYq2J5FFazFhO98YhySXukejd+qexKYKP5dIfAiMgFqPvymlnZRcUzYPu6MKIk
	PBIA==
X-Gm-Message-State: AJaThX4soj5rRHcdiEYlQ1h8cXb2RsqPLARYS8JXGkJcwfVzIXVdjRAr
	yvqSvOK7NP5x7loaP5/IN0oVxgJm2o45XdFsQ24=
X-Received: by 10.55.5.13 with SMTP id 13mr32233258qkf.11.1511381981650; Wed,
	22 Nov 2017 12:19:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 12:19:41 -0800 (PST)
In-Reply-To: <CAFEAcA8u2-o2u93OfgV8-4hTx0NwTZ1zC7DjFF6GmTXhxo3-Qg@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<CAFEAcA8u2-o2u93OfgV8-4hTx0NwTZ1zC7DjFF6GmTXhxo3-Qg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 12:19:41 -0800
Message-ID: <CAHQ1cqErRbmw2HGc-jY+-3P_MyOijtPry5RZaJ3GOTX+X6zD-Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH v3 00/30] Initial i.MX7 support
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2w4d+/O/nGPA

On Tue, Nov 21, 2017 at 10:34 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Hi everyone,
>>     - Added proper USB emulation code, so now it should be possible to
>>       emulated guest's USB bus
>
> The patchset is huge as it is, if you add more stuff to it
> it makes it even more likely to sink to the bottom of my
> to-review queue...
>

USB peripheral emulation had to be a part of a patch-set, either in
dummy or a full featured form, in order to be able to boot vanilla
Linux kernel because you insisted that I don't use
"ignore_memory_transaction_failures". The reason why the dummy
emulation version of it it was not a part of v2 was because I did my
test with a bad kernel config where USB was disabled, didn't realize
USB was essential and did not write code to support it. Now, once I
realized it, I wrote a dummy version, and then later, while waiting
for v2 to be reviewed, worked on proper USB emulation the code. Said
code turned out to be comparatively trivial to the first dummy
implementation, so instead of going through the exercise of submitting
dummy first and then proper version later I squashed both and the
result in v3.


>> Peter, I didn't hear anything from you about the code of
>> mcimx7d_add_psci_node(), as discussed here:
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg486874.html
>>
>> so I kept the original code intact. As I mentioned before, my goal was
>> to be able to boot into vanilla Linux kerenel and have working SMP
>> without needing to use a PSCI implementing bootloader. If that is
>> something that new board code shouldn't do, please let me know.
>
> Broadly, board code should work the same way the real hardware
> does, unless there's a clear reason why not.

Yes, this all makes sense. As far as I understand convenience being
able to boot Linux directly in QEMU has long been the "clear reason
why not". Now that certain SoC specific versions of Linux are not as
self-sufficient and can't support SMP without external help, emulating
PSCI and doing appropriate DTB fixups for that is just an adaptaion of
the old convenience mechanism to new times and circumstances, IMHO.

> "virt" is special because it writes its own dtb entirely.
>
> Maybe PSCI does need to be a different special case, since we're
> emulating part of a bootloader here.

OK, I'll ignore the "maybe" part and proceed as if we are in agreement
on PSCI for v4.

> But if so I think that code belongs more in hw/arm/boot.c, so that we automatically fix up the
> dtb to say "we have psci" if we are (a) booting a kernel directly
> and (b) the CPU has the psci-conduit property set to enable QEMU's
> PSCI implementation.
>

OK, sure, makes sense. I'll change the patch to use shared
infrastructure for that.

> (Also the code in virt.c for adding a PSCI node is considerably
> fuller-featured than yours is.)
>

Okay... My code is targeting both fixed PSCI conduit (smc) and PSCI
implementation (0.2/1.0), implementing support for anything but that
in my board specific code would've been, IMHO, silly. OK, I'll
interpret that comment not as a slight, but as a request to use
virt.c's implementation for shared infrastructure.

>> Thanks,
>> Andrey Smirnov
>>
>> [v2] https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg05516.html
>> [v1] https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg04770.html
>>
>>
>> Andrey Smirnov (30):
>>   imx_fec: Do not link to netdev
>>   imx_fec: Refactor imx_eth_enable_rx()
>>   imx_fec: Change queue flushing heuristics
>>   imx_fec: Use ENET_FTRL to determine truncation length
>>   imx_fec: Use MIN instead of explicit ternary operator
>>   imx_fec: Emulate SHIFT16 in ENETx_RACC
>>   imx_fec: Add support for multiple Tx DMA rings
>>   imx_fec: Use correct length for packet size
>>   imx_fec: Fix a typo in imx_enet_receive()
>>   imx_fec: Reserve full 4K page for the register file
>>   sdhci: Add i.MX specific subtype of SDHCI
>>   sdhci: Implement write method of ACMD12ERRSTS register
>
> Everything above here is pretty nearly ready to go in;
> if you send that as a patchseries then it should be easy
> to review and queue ready for 2.12 (which will open up
> for new commits in mid-december).
>

I'm not quite sure where you stand on "imx_fec: Use ENET_FTRL to
determine truncation length", but sure, sounds good, I'll prepare the
rest of them as a separate patch set and submit it, as soon as I get a
chance.

>>   i.MX: Add code to emulate i.MX7 CCM, PMU and ANALOG IP blocks
>>   i.MX: Add code to emulate i.MX2 watchdog IP block
>>   i.MX: Add code to emulate i.MX7 SNVS IP-block
>>   i.MX: Add code to emulate GPCv2 IP block
>>   i.MX: Add code to emulate i.MX7 IOMUXC IP block
>>   i.MX: Add i.MX7 GPT variant
>>   i.MX: Add code to emulate SDMA IP block
>>   i.MX: Add code to emulate FlexCAN IP block
>>   i.MX: Add implementation of i.MX7 GPR IP block
>>   pci: Add support for Designware IP block
>>   i.MX: Add code to emulate i.MX7 USBMISC IP block
>>   i.MX: Add code to emulate i.MX7 ADC IP block
>>   i.MX: Add code to emulate i.MX7 SRC IP-block
>>   usb: Add basic code to emulate Chipidea USB IP
>>   ARM: Add basic code to emulate A7MPCore DAP block
>>   i.MX: Add code to emulate i.MX LCD block
>>   i.MX: Add i.MX7 SOC implementation.
>>   Implement support for i.MX7 Sabre board
>
> My review in this part of the patchset is more sketchy,
> but you can probably adjust the later patches as per
> remarks on the earlier ones.
>

OK, no problem. I am fine on iterating on the rest of the series until
it's in good shape.

Thanks,
Andrey Smirnov
