Received: by 10.25.205.13 with SMTP id d13csp9880152lfg;
        Thu, 5 Jan 2017 10:33:34 -0800 (PST)
X-Received: by 10.55.157.138 with SMTP id g132mr5625684qke.313.1483641214051;
        Thu, 05 Jan 2017 10:33:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b136si38483152qkg.219.2017.01.05.10.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jan 2017 10:33:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPCqx-0000jH-E5
	for alex.bennee@linaro.org; Thu, 05 Jan 2017 13:33:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPCqA-0000iL-GJ
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 13:32:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPCq9-00055q-8j
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 13:32:42 -0500
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:36709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPCq9-00055H-3y
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 13:32:41 -0500
Received: by mail-ua0-x230.google.com with SMTP id 88so380490663uaq.3
	for <qemu-devel@nongnu.org>; Thu, 05 Jan 2017 10:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2zO65fHDCg53v/XMR9SIIXRsZ8oJ/C9hiuIm+sT8PAw=;
	b=VE5o5nRuB1CWNE3ODKhQPd1MVQzUQ+gCGDs57qaqlLnkRX6jv2JdRNBCdvFdynxqyq
	jDfPHqiLcdh+TId4yDGqnq4OrRUZ7oVwLxpvq5EQx6oVeSRL8joEl1SUqWqOtw9spQMb
	+46E703Pi97YJnlV+rwB4mqO+hHSRpYwsEFCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2zO65fHDCg53v/XMR9SIIXRsZ8oJ/C9hiuIm+sT8PAw=;
	b=MkvbSOGzuw4ZeaIaBGP9HS1iNEIMqFWJy/EyrSdf8qg/Eoph1JHAq9/6nJhOCYt2uT
	UVxheCens6HlwJsyrzqoo5DZq6CVZe3QaGwDZmYiooAUdfD6JuUWeNTvShlYjuTx0gAo
	uQUCApErxwR+CiKHS10qCLwUzwpMX8NEF22mZazUA/DlSSFLgdbfsKDH8fRTaIBj+gt5
	MQSXpGBQCSqyg5peTsBrtsCtvtCPfnuF6y0oZ4DMQQ+2NMWDtDJwlwpBTYNyLmJSxd0q
	rimS/zPrNipkqfXIuYx98lcs91nkdC21KidVHZ8S3a3K3/KQVT/AYgF1PeFXIANvSaUu
	AAeg==
X-Gm-Message-State: AIkVDXKWbG8EftZyYxd0Gka+4k1V/CyYAUKBFLgSLrqFz/blCgL4+ZwQl8CUigrVJDsj1fS4aEX/9BqdfYSWf7V0
X-Received: by 10.176.2.14 with SMTP id 14mr49667573uas.8.1483641160448; Thu,
	05 Jan 2017 10:32:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 5 Jan 2017 10:32:20 -0800 (PST)
In-Reply-To: <d15e8de4-f7d8-1c28-7e5e-31d0aa10819d@sysgo.com>
References: <d15e8de4-f7d8-1c28-7e5e-31d0aa10819d@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2017 18:32:20 +0000
Message-ID: <CAFEAcA8pXJ3g5e7rw6_FAhnbZfLOOoX-gaavyzKug0y=gDCuQQ@mail.gmail.com>
To: David Engraf <david.engraf@sysgo.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-devel] [PATCH] vexpress fix flash device-width
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZnR3TGKHuZw5

On 22 December 2016 at 14:02, David Engraf <david.engraf@sysgo.com> wrote:
> The current implementation uses width = 4 and device-width = 2 for the flash
> configuration. When using u-boot or Linux, the flash is detected as 32 x 16
> bit, thus the sector size is doubled to 512 KB. When u-boot sends a sector
> erase, only the first 256 KB are erased because the QEMU flash
> implementation uses the configured sector size of 256 KB and ignores the
> width and device-width ratio.
>
> This patch will change device-width to 4, thus the width and device-width
> are equal and u-boot detects the flash as 32 x 32 bit with the correct
> sector size of 256 KB.

Thanks for this patch. However I'm not sure it is correct, because
I think the real hardware does have 2x16 devices here. On real vexpress
TC2 if you boot Linux it detects the flash as:
"8000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank.
Manufacturer ID 0x000089 Chip ID 0x008919"

So while we presumably have a QEMU bug if this isn't behaving
like the hardware, I don't think that changing the device-width to
4 is the right fix for it. Maybe:
 * our erase implementation is broken?
 * one of the other parameters we use to create the flash
   is wrong?
 * the calculation of the erase block information that we put in
   the flash cfi_table[] is wrong?

(Does u-boot hard-code the erase block sizes, or does
it read them from the CFI data? QEMU's flash doesn't have the
hardware's two-eraseblock-regions setup where part of the disk is
256K erase-blocks and part is 64K blocks, but if u-boot doesn't
hardcode that it should be able to read the data from QEMU's
flash implementation.)

Also, for patches to QEMU we need you to provide a
Signed-off-by: line to say that you're happy to contribute the
patch to QEMU. More detail about what this means here:
http://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
(the other details of patch formatting are mostly nice-to-haves,
but the s-o-by line is a hard requirement.)

thanks
-- PMM
