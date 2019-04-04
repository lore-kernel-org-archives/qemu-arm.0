Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1232592wrx;
        Thu, 4 Apr 2019 01:58:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw09cVYrShT/psO1COfO0UuoF4mH4zU2yFi8TiaELoMBDzb5col4/vgI/fevH9kBDr3C5Oo
X-Received: by 2002:a25:220b:: with SMTP id i11mr4195206ybi.159.1554368312287;
        Thu, 04 Apr 2019 01:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554368312; cv=none;
        d=google.com; s=arc-20160816;
        b=VyHCX8qht5Fe3Vksf1HDFQqtNXlv5Ef6DaxvJyVmIBrNOyD+PHaOGVDg+gobW4U7F7
         iOY0avQxvEV1RX1/kQ0UMUsbH71EstjLlNfL+zac8UYBRSVjqflQTVha1kYsr6TbvDpQ
         TJalD2f3z4cBi9KsPw947dGQ33B1JLo1seenLxMa0V2x9/3ETBMs25M2MCwMs67hOA0u
         by16EjoCn3uVvnbsqMXJwiiXlBp0rMzJkxq/Z5oChhewRW+8XD8NE7rEUWgq1VtMiIow
         XSMnSAiN3IE4SlH9yOQ9DBy9AI0fl0Opg1aGyX3eT5Ip56NgJm1zxO5oONlnlEXd77xh
         EeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBPDLLSQxHcR9Pd3fEBBAxF8Q0AUXmITt0aeSRc2cSU=;
        b=M1yLCEf56j1mNAGNeMBdYIBb4s0r+3owdjlPUHs9K767uR0K74SG4F8OJIRSNLh36g
         6GEMP6zLdyC0RCaYtgQ99ETzyvKedWIn9Voa7reykPwgD6yhqD94mWURt3aNd4Grg2cm
         AcoRDdHq9HlcJmNz3WwegzMZwnC6WmNubxmIzM4Rbaioj8z3fFRqzcPeFZ1XO+Uq+K1t
         x5m1C3qqoLbcopxV+XmBzSpjGvKJ+M5FBoAJ/zRXNLg7bJPEq8SiQ+AxNX2v9I/hXIie
         /1yOgwIsAm2gK1Dvs/EofVNibW4pz+s/gM4BLiKWb2sHDXwTp5GEQMZ4YKzRhIlVr4HH
         hWWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UYpou2nX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si11465629ybr.410.2019.04.04.01.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Apr 2019 01:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UYpou2nX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hByCd-0008LU-Pe
	for alex.bennee@linaro.org; Thu, 04 Apr 2019 04:58:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hByBM-0007ZS-H9
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hByBL-0005Ly-DG
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:57:12 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hByBK-0005KU-SX
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:57:11 -0400
Received: by mail-lf1-x144.google.com with SMTP id u21so1227172lfu.2
	for <qemu-arm@nongnu.org>; Thu, 04 Apr 2019 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tBPDLLSQxHcR9Pd3fEBBAxF8Q0AUXmITt0aeSRc2cSU=;
	b=UYpou2nXMv1NPEVrIpqPRyPbiBH2tju3wQI2ulwEXYTNh7Ku5mnvcH6B5Wf/K6Fuio
	BIZv5FsfyQf776LFzcorTGVtUt6twIodjhs5v37+HV/wbKalFCr+GS7T0mMEg4U4e7Pl
	p1MbG2XEvVheLyAWOX/pPeAXm7QIl1j4Mdg9kzaYtCFYMazNdq1N3Uho8rUYAoG7+V+A
	GixiW6lBC89ttgN+TY9vKYuR5lZwqqjJ+/S2DzLeOM7motRpWObgLEqL7QG62oXCQVuc
	snTZIeNJ/zS8Ovlgwvmi4blngtlB7J43jJeA9461YIuX0S+uNZ7ESxEPc/a4wbr/TXia
	qt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tBPDLLSQxHcR9Pd3fEBBAxF8Q0AUXmITt0aeSRc2cSU=;
	b=rAOUIE69t8CepJDYvmNxM4qdrpIP7rLOfkJv5S71TM6ZzuJuCFFcECn3nVoUPLrKPf
	dXAh+VSi+I5pqlDgTJlBEo8q6Qsgn/H+m6MtqHATOp65AcBXle7h1ZQO/uBhxTYUCuW5
	BhJrl31Ljnb/Xms5ZTSGYvlhye70LWFGfbxUBlPr8DsZIaxLwmsRwTRYQi1uye4Vf58X
	btUGGhgh72CHkuskWu79luwkf4XBOVEAxavqAvATo4YSWxvylLqiYSSHZrxExk+oMTtr
	29AgtXPB6NuBcSt+lDGoh19sM32uCUHqMj74yb9cP5d2oKgUsYv0+rsEE9jryg//u2gr
	Bifg==
X-Gm-Message-State: APjAAAXe1tg9/UKqlpzt5eFsBdoQb4eyHhzT7iC/KOpxgpxqU+Faqj7u
	AEWKdLd9wUlxZF6v9aSX3pd8Cmri4hetkqIowF3CbVKY
X-Received: by 2002:a19:c303:: with SMTP id t3mr2519453lff.134.1554368229344; 
	Thu, 04 Apr 2019 01:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
	<1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
	<CAKv+Gu-aZeYwegzFQ7pPqvm28ySR5xC6rZh8FBvQaWiNykgPEg@mail.gmail.com>
	<CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
	<CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
	<CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
	<CAEK-wKnY=VutLC6Ke=UeuswfxGkGohahhxwFiq=kqRdT-W0rPQ@mail.gmail.com>
In-Reply-To: <CAEK-wKnY=VutLC6Ke=UeuswfxGkGohahhxwFiq=kqRdT-W0rPQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 4 Apr 2019 16:56:54 +0800
Message-ID: <CAHmQWvBDffcuGBUs7KCMEKwH-4a_ihd6Hmgab3ZoqQU3jETVPw@mail.gmail.com>
To: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [PATCH v6 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6cwVnglMfhtF

On Thu, 4 Apr 2019 at 16:51, Radoslaw Biernacki
<radoslaw.biernacki@linaro.org> wrote:
>
> There is one additional need which we just discovered with Fu Wei.
> We need second secure UART for RAS and MM from EL0.
> I'm adding a patch here (not sure if addresses and IRQ's are in your style so please check those).
> I will adapt FW to your changes in next patch.
>
OK, I will take this into my next version of patch.
Thanks.

> From fbc84e29b966f94a27fe84195987e6ba0c55c1bc Mon Sep 17 00:00:00 2001
> From: Radoslaw Biernacki <radoslaw.biernacki@gmail.com>
> Date: Thu, 4 Apr 2019 14:41:21 +0700
> Subject: [PATCH] Add 2nd secure uart Rebase of Fu Wei patch
>
> ---
>  hw/arm/sbsa-ref.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 6b26111840..dcfb34ff5b 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -67,6 +67,7 @@ enum {
>      SBSA_PCIE_ECAM,
>      SBSA_GPIO,
>      SBSA_SECURE_UART,
> +    SBSA_SECURE_UART_MM,
>      SBSA_SECURE_MEM,
>      SBSA_AHCI,
>      SBSA_EHCI,
> @@ -105,7 +106,9 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>      [SBSA_RTC] =                { 0x60010000, 0x00001000 },
>      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
>      [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
> -    [SBSA_SMMU] =               { 0x60040000, 0x00020000 },
> +    /* The UART is a secure UART for S-EL0 OS testing */
> +    [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
> +    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
>      /* Space here reserved for more SMMUs */
>      [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
>      [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
> @@ -126,8 +129,9 @@ static const int sbsa_ref_irqmap[] = {
>      [SBSA_PCIE] = 3, /* ... to 6 */
>      [SBSA_GPIO] = 7,
>      [SBSA_SECURE_UART] = 8,
> -    [SBSA_AHCI] = 9,
> -    [SBSA_EHCI] = 10,
> +    [SBSA_SECURE_UART_MM] = 9,
> +    [SBSA_AHCI] = 10,
> +    [SBSA_EHCI] = 11,
>  };
>
>  /*
> @@ -645,6 +649,7 @@ static void sbsa_ref_init(MachineState *machine)
>      create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));
>
>      create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
> +    create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2));
>
>      create_rtc(vms, pic);
>
> --
> 2.17.1
>
>
> On Thu, 4 Apr 2019 at 15:27, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>
>> I would like to wait for more days to see if there are any further
>> comments, and if no I will send another iteration with memory map
>> slightly changed.
>>
>> On Wed, 20 Mar 2019 at 18:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> >
>> > On Mon, 18 Mar 2019 at 03:39, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> > >
>> > > On Fri, 15 Mar 2019 at 18:41, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> > > >
>> > > > On Fri, 15 Mar 2019 at 11:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> > > > >
>> > > > > For the Aarch64, there is one machine 'virt', it is primarily meant to
>> > > > > run on KVM and execute virtualization workloads, but we need an
>> > > > > environment as faithful as possible to physical hardware, for supporting
>> > > > > firmware and OS development for pysical Aarch64 machines.
>> > > > >
>> > > > > This patch introduces new machine type 'sbsa-ref' with main features:
>> > > > >  - Based on 'virt' machine type.
>> > > > >  - A new memory map.
>> > > > >  - CPU type cortex-a57.
>> > > > >  - EL2 and EL3 are enabled.
>> > > > >  - GIC version 3.
>> > > > >  - System bus AHCI controller.
>> > > > >  - System bus EHCI controller.
>> > > >
>> > > > Hello Hongbo,
>> > > >
>> > > > Apologies for bringing this up now, but I seem to remember that the
>> > > > EHCI does not support 64-bit DMA. Did you run into any issues with
>> > > > this? Or was this fixed in QEMU in the mean time?
>> > > >
>> > > Hi Ard,
>> > > Which EHCI do you mean?
>> > > This time I use a newly introduced system bus EHCI, commit 114529f7
>> > > and I only tested USB mouse and key board, didn't test DMA function.
>> > >
>> >
>> > The host controller doesn't work without DMA, so if mouse and keyboard
>> > worked for you, and no DRAM exists below the 4 GB mark, this has
>> > apparently been fixed in QEMU.
