Received: by 10.223.159.82 with SMTP id f18csp1019295wrg;
        Tue, 21 Nov 2017 10:35:36 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaFFBVLkMvPVIDbxeoRNwv84GS9F+yUuOw8ZMKm2D3G2GO7KNwaXPSJmFWoPCTVmxqkDmvB
X-Received: by 10.37.186.200 with SMTP id a8mr11294670ybk.56.1511289336737;
        Tue, 21 Nov 2017 10:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511289336; cv=none;
        d=google.com; s=arc-20160816;
        b=B4/AIeCtYXOQu8s0tgYl6GYS6d3Who7qJ+fhFdsY6+aGg+cdkaziNxJaGHx8XrUCJw
         /51vLDhWWamyo5zOStprAvtWiJc9JC0Sxwq5uSkCu8XIfKFJCA3jz8rKr4TYFVFrHXc/
         zHHFuSAq0zZcxx4pI4ETXXyAWL4ecnjh5aBjmtOWnKjj8Q2vqVUnyQu8RBemod9U/VYg
         0SiFcrlJ9xBnq+rAPrZgVRomRHXjs7rce2xwcHfzkQCXel4Z1HHDZb9CD/vBv+La5IzA
         IzkqToC92pCZFdPFIA7kea7NItId+ov5ljcZ7xFb4v6tVyoc9NTmoWkKEAq6uoMuguFY
         hGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ox04lw51Ky4VzSuErIqT/E3TsspG54QBeBiGDozIqeM=;
        b=zDNDM6yZ8Ewu66CBGotR1amV++GhdKJ5tC2KAqXHKbuiXbSzAvczQiMWhR5tiaVXGz
         Vnv6WAXBmMc+hxOtLQsUe7+jAWLUhjvRh+c7vERx3xLXDT5/VXm+x2cZhoDNAVbBpKuN
         pcGiO2TKuTkiowT5nQvV10y+TxqKSQwlhBmeJO2/+gROgTf58DumjvW7W5Ju3IL2EP1Z
         M//ZtAP8qXsl6NvUAN8XVjFpJqgVjgz2HgKzQg0V8mjmTtt2j8UsNpBtF4iiEKy3jGLf
         iObMVKGrqkVCw6If0yPqkLqnyM/JRZdp9CeXi1PFHA99uP2vwOJjCC0CfzsKLv7geGLW
         GGzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YMDQhClb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10si2984740ywm.57.2017.11.21.10.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:35:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YMDQhClb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHDOS-0005BP-7i
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:35:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHDNQ-0004oo-Ih
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 13:34:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHDNP-0000yv-CD
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 13:34:32 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:45684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHDNP-0000yV-7B
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 13:34:31 -0500
Received: by mail-oi0-x243.google.com with SMTP id v123so9193822oif.12
	for <qemu-devel@nongnu.org>; Tue, 21 Nov 2017 10:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ox04lw51Ky4VzSuErIqT/E3TsspG54QBeBiGDozIqeM=;
	b=YMDQhClb8B6gESgC1ZhtK+9pjePze6BTI+O4Ldk2nx4Htzj9Mi1Jk2qbQhTc1+jWrR
	wAtmCFIsU8keFL3azVX2AD9AW5GKrRCpR2psF0OmXAhZbEeWCmsueYKVUDHaIwpIqlAG
	V06yRtHISEFUCNCaMGx/dDet0yQ0vOXZgKySw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ox04lw51Ky4VzSuErIqT/E3TsspG54QBeBiGDozIqeM=;
	b=bRNH/3t8CjbBEGj0+PUHn+sRtxt1Q9ZsG2IrVduomyZp6t3yWSVP22IfUwEOJaOp52
	3EVrmuMWbvL3jVkhSqJyXt0ODw3/iydr7sC6z4BXdNZWdf3JsXX3CNKwWviy8fUjekbM
	TSddQJ3dZ4lHUYcqHwpinyyzGJUNcqDkiPCSYptt5cbTwfhwsYKfka7ddlikjrLDbLNs
	+R2eA/FZI3WPI67RaKXuEEOQ0maPhJ+YYBxKiKt7FiJwKFj4Jv3PIN7WWnjXw3xXHFk+
	uFtkBWAJf8gwC+efV0OzNbi1DqrnPaAF5e19pnYMWZAaCw+ch99hhiRXQcfts6MczzL+
	48eQ==
X-Gm-Message-State: AJaThX6WcYtcqHAKBWIvjk5QFu9o+cb4cf8oiJpNHpDAuLd4mtzQ5amO
	5/U8sXBGs00RFq0qSNxLHM2Nm8bKETjK3fYfSQssbw==
X-Received: by 10.202.83.22 with SMTP id h22mr1889779oib.8.1511289270411; Tue,
	21 Nov 2017 10:34:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:34:10 -0800 (PST)
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:34:10 +0000
Message-ID: <CAFEAcA8u2-o2u93OfgV8-4hTx0NwTZ1zC7DjFF6GmTXhxo3-Qg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH v3 00/30] Initial i.MX7 support
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u9eMEs2Gi+hD

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>     - Added proper USB emulation code, so now it should be possible to
>       emulated guest's USB bus

The patchset is huge as it is, if you add more stuff to it
it makes it even more likely to sink to the bottom of my
to-review queue...

> Peter, I didn't hear anything from you about the code of
> mcimx7d_add_psci_node(), as discussed here:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg486874.html
>
> so I kept the original code intact. As I mentioned before, my goal was
> to be able to boot into vanilla Linux kerenel and have working SMP
> without needing to use a PSCI implementing bootloader. If that is
> something that new board code shouldn't do, please let me know.

Broadly, board code should work the same way the real hardware
does, unless there's a clear reason why not. "virt" is special
because it writes its own dtb entirely.

Maybe PSCI does need to be a different special case, since we're
emulating part of a bootloader here. But if so I think that code
belongs more in hw/arm/boot.c, so that we automatically fix up the
dtb to say "we have psci" if we are (a) booting a kernel directly
and (b) the CPU has the psci-conduit property set to enable QEMU's
PSCI implementation.

(Also the code in virt.c for adding a PSCI node is considerably
fuller-featured than yours is.)

> Thanks,
> Andrey Smirnov
>
> [v2] https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg05516.html
> [v1] https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg04770.html
>
>
> Andrey Smirnov (30):
>   imx_fec: Do not link to netdev
>   imx_fec: Refactor imx_eth_enable_rx()
>   imx_fec: Change queue flushing heuristics
>   imx_fec: Use ENET_FTRL to determine truncation length
>   imx_fec: Use MIN instead of explicit ternary operator
>   imx_fec: Emulate SHIFT16 in ENETx_RACC
>   imx_fec: Add support for multiple Tx DMA rings
>   imx_fec: Use correct length for packet size
>   imx_fec: Fix a typo in imx_enet_receive()
>   imx_fec: Reserve full 4K page for the register file
>   sdhci: Add i.MX specific subtype of SDHCI
>   sdhci: Implement write method of ACMD12ERRSTS register

Everything above here is pretty nearly ready to go in;
if you send that as a patchseries then it should be easy
to review and queue ready for 2.12 (which will open up
for new commits in mid-december).

>   i.MX: Add code to emulate i.MX7 CCM, PMU and ANALOG IP blocks
>   i.MX: Add code to emulate i.MX2 watchdog IP block
>   i.MX: Add code to emulate i.MX7 SNVS IP-block
>   i.MX: Add code to emulate GPCv2 IP block
>   i.MX: Add code to emulate i.MX7 IOMUXC IP block
>   i.MX: Add i.MX7 GPT variant
>   i.MX: Add code to emulate SDMA IP block
>   i.MX: Add code to emulate FlexCAN IP block
>   i.MX: Add implementation of i.MX7 GPR IP block
>   pci: Add support for Designware IP block
>   i.MX: Add code to emulate i.MX7 USBMISC IP block
>   i.MX: Add code to emulate i.MX7 ADC IP block
>   i.MX: Add code to emulate i.MX7 SRC IP-block
>   usb: Add basic code to emulate Chipidea USB IP
>   ARM: Add basic code to emulate A7MPCore DAP block
>   i.MX: Add code to emulate i.MX LCD block
>   i.MX: Add i.MX7 SOC implementation.
>   Implement support for i.MX7 Sabre board

My review in this part of the patchset is more sketchy,
but you can probably adjust the later patches as per
remarks on the earlier ones.

thanks
-- PMM
