Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6319575wrq;
        Wed, 27 Jun 2018 07:56:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd2xIXTbOYR/3rQdKEmw8iONtuSVgZAC3sB6C2AqC2Cidb2p3GMQkFAKv4ODMXroEAaR42/
X-Received: by 2002:a0c:d7c6:: with SMTP id g6-v6mr5681011qvj.85.1530111398783;
        Wed, 27 Jun 2018 07:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530111398; cv=none;
        d=google.com; s=arc-20160816;
        b=udwYa67xyTpaL+9CJq35BxudLl5ft0A8PnYRQfSSvtBddvT2xMzHeTz0MFcyPDWl9T
         iByK6MpzlQa/RoHLp9BnBIlzos2g1EJYWtSwRTxYUj3IS/CLz6Dky1xx/X+iTwsrjQd+
         tfEHD1Wa73AYq9VYYADsZoRkdKGnnG0XFgShbV2fjnXQW2rt5KE+TOzlluF/3WE23GRC
         4kJIsRO5UF4X0YcOcKmz7lKqbr9+OIcYY5nw/2tr4IEZeHdnejpQxoFuUlgrnmqYTtx6
         2BZRAQsBRDLk/Urwg0Hf5g/ulWTx2f1+eItJW+YTVJFiY6kDyQ//iX1FgASzDf2ncL2u
         6CwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=Sj7GulGrbJ+C/BxoAcp5twcHJeSzFMFne1oXC7EiSXE=;
        b=brWF5MlzGSauWdSNJfdSgj0aQ6jS5lyGFOJQJA3Zm69W6xb2wf+9RAufgKk1on83Ph
         ycSo8bwJ5FAU97m+KUd+AVRquQRGGeoxdbNIRpUTr+17Mongwnh3tynl8BaXUy7GnTuu
         imWP15g893RbH4zz1PF7CTKorJsi7n3mPF4gtEWYzOvif6oAcKcFYaUSmzn6SMfJBtwK
         RN+QDIGOUKDapDKC+cNxUT3sLXOaP3D0Ik75xB5bOJAfjlF11AktSsoP33vs4WDb2UGF
         PwY3LO5cxfldHmBySMeMK+OjDAPl3DkQp4WmyVCrfzXmieSdrCo4C40tFdo/3ljTFzYo
         Bgdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e27-v6si3715624qtg.133.2018.06.27.07.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 07:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYBs6-0001nA-6p
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 10:56:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fYBrq-0001kX-Tc
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fYBrn-0005ZH-N9
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:56:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40788 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fYBrn-0005Z3-Gd; Wed, 27 Jun 2018 10:56:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1A6F40200B4;
	Wed, 27 Jun 2018 14:56:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 128952026D5B;
	Wed, 27 Jun 2018 14:56:17 +0000 (UTC)
Date: Wed, 27 Jun 2018 16:56:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Message-ID: <20180627165616.34d36aaf@redhat.com>
In-Reply-To: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 27 Jun 2018 14:56:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 27 Jun 2018 14:56:18 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Add SBSA machine type
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9iRQH9X7vVEr

On Wed, 27 Jun 2018 18:13:08 +0800
Hongbo Zhang <hongbo.zhang@linaro.org> wrote:

> This patch introduces a new Arm machine type 'SBSA' with features:
>  - Based on legacy 'virt' machine type.
>  - Newly designed memory map.
>  - EL2 and EL3 are enabled by default.
>  - AHCI controller attached to system bus, and then CDROM and hard disc
>    can be added to it.
>  - EHCI controller attached to system bus, with USB mouse and key board
>    installed by default.
>  - E1000 ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>  - No virtio functions enabled, since this is to emulate real hardware.
I'd drop all default (convenience) devices unless they are specified in SBSA,
and make management explicitly provide needed devices on CLI.

> 
> This is the prototype, more features can be added in futrue.
> 
> Purpose of this is to have a standard QEMU platform for Arm firmware
> developement etc. where the legacy machines cannot meets requirements.
> 
> Arm Trusted Firmware and UEFI porting to this are done seperately.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
[...]

> @@ -94,6 +98,8 @@
>  
>  #define PLATFORM_BUS_NUM_IRQS 64
>  
> +#define SATA_NUM_PORTS 6
> +
>  /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>   * RAM can go up to the 256GB mark, leaving 256GB of the physical
>   * address space unallocated and free for future use between 256G and 512G.
> @@ -168,6 +174,47 @@ static const int a15irqmap[] = {
>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
>  };
>  
> +static const MemMapEntry sbsa_memmap[] = {
> +    /* Space up to 0x8000000 is reserved for a boot ROM */
> +    [VIRT_FLASH] =              {          0, 0x08000000 },
> +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> +    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
> +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
> +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
> +    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
> +    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
> +    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
> +    /* This redistributor space allows up to 2*64kB*123 CPUs */
> +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
> +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
> +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
> +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
> +    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
> +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
> +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
> +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
> +    /* Second PCIe window, 508GB wide at the 4GB boundary */
> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
> +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
does spec require support for 32-bit guest or is it only 64bit,
if the later I'd put it somewhere high where we can increase region
to terrabytes.

another idea that was floating around (considering we don't care about legacy)
is to use flexible base address and tell firmware[*] via register where it's.
Then it would be able to support 32 guest with small amount of RAM
and 64 bit guests with huge amount of RAM using a single memory range.
(to keep memory management simple). It's also future friendly, as in case
if we need to move it we could do easily by changing base address for new machine
type only and firmware would automatically pick it up from register
(without all compat nightmare we have with 2 regions in pc/q35 machines).

[*] When I've talked with Laszlo about it he said it was not easy to do in uefi
but still possible.

same applies to GIG regions/mmio/ecam where we are twisting our hands when trying to
increase number of things.

[...]

