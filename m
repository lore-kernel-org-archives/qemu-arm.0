Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp649957wrt;
        Fri, 4 Jan 2019 06:15:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6kjLgP/pG0M7/ttKGBQpP7iphMKchlcCFDZzDde6fm7koswOS1a/Ebd95+pWqLLfEFxzG6
X-Received: by 2002:a37:5ac4:: with SMTP id o187mr46759629qkb.282.1546611348267;
        Fri, 04 Jan 2019 06:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546611348; cv=none;
        d=google.com; s=arc-20160816;
        b=tvnMyK36l5VPczkcvq+ZfQWp8XUx9mXKOG0rkHYMIvaC6uItAt3DhvxK8EK8Zb7wMr
         oDfOkZKKHLcpg2uHjtuQWA+EZNjSoBwMWt4FRmJSgFxgYeAn8JaIt11HY8aSm8ea3IE8
         dGitrN6QTnzDGYxXWawnPnJ3Kk9KMkjANDaRwXB876dpZcLU64f0RgElsfRqbweG5xEp
         WV/CsSTiKjgEHgjTtNTCSVWu6QraQdjeJWmUhglK+mMVK7Yw6UfdCXzTKuvhQqZOEtlv
         IL76GFLPDHd7PoQ/cs5/dqm3BmDcBfXeWvg83Cx5UJ0ZIRfnYGs8TyHz/j1L+DWBJJws
         stmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=08Tk3CcDFO34W8hU5RU/02cOUKw1DnCtCsUc/mcAR2I=;
        b=lpTfyHL/DnMPg6G8oEepmXdBKXJKyb/hEobRqYuCjeQypS1sjf7jb4U+Coow2io5r9
         uFtcSklaA8MWvyDmdb/3Ge6OEGD62iZiIa3wZkfV+05/nSSx5823Q/gvl+16cxCBvWQi
         DgvQgB8ZcPKyfbcqrRhI3WlCD5GWC3eBxKKQKNSHovFaV3eZQIXYBVD/xOoXupVkbIga
         v4qlKZrdZwxlZkhEDO3GN6og9bWiOtsdIihNqVjEhf9d74d/1LvrI6jNC8L4AkzQ3Rst
         +Eu4Nk2dth/VesoxN051nzTyP+bunruB3+ddAxZ7vh3UEUlp701ljDQMODSlXEzg9Bu5
         VOag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m28si1102206qtf.328.2019.01.04.06.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQGJ-00048a-RH
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:15:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gfQFu-00048S-L6
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:15:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gfQFr-0000xr-HD
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:15:22 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:44792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gfQFr-0000xh-DD; Fri, 04 Jan 2019 09:15:19 -0500
Received: by mail-yw1-f68.google.com with SMTP id b63so13252471ywc.11;
	Fri, 04 Jan 2019 06:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=08Tk3CcDFO34W8hU5RU/02cOUKw1DnCtCsUc/mcAR2I=;
	b=DQ28E/fanBZlLlVDuaxYLXPPQuId8j0onYB0Wrn/h3e6059JVgVynC7YlHZDfxEzSP
	/H+oO0zRwWBNSMZL31StpNJ29EFPDg9cBg0mI4CN1+FklSRTEQ9Z186HZFjMFIFtohih
	0m++1ZjtcNrJjle4gpe+xH0qNaiiglBCMVMqS6m/irRh4+DqOH1EijcVOfGeGtokIBOJ
	GdbLyUSjHT3mkAjEGq3KWyXBCW8up06CttqrMo79WKHRT+42wqjVtTYY4M0vOINwIiGU
	8AJQbGZpNkR4saI1ofxZkz612GgNylT2pqV36ZmHnTkk6o/5y4bot85ND5hyjH0uIVyS
	WygQ==
X-Gm-Message-State: AA+aEWY4RM12vLCpAtbbil3J0A25uqhRWEI0d/+A7LDR8N411BA9PuWB
	poz1rdhEJeI9fsnc5tOaweNb7vlWy29uCjtYSG4=
X-Received: by 2002:a81:c93:: with SMTP id 141mr52434136ywm.356.1546611318758; 
	Fri, 04 Jan 2019 06:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20181209193742.7582-1-f4bug@amsat.org>
	<CAFEAcA_nOm4gcuF0NgYtqgAfB1UaW1MFmcRCtWwrUr9-X+Xe8g@mail.gmail.com>
In-Reply-To: <CAFEAcA_nOm4gcuF0NgYtqgAfB1UaW1MFmcRCtWwrUr9-X+Xe8g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 4 Jan 2019 15:15:06 +0100
Message-ID: <CAAdtpL6jsY7de7Si+m5kyD__7E_UO2pwUg_0K+VqCn4_9OQFsA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.68
Subject: Re: [Qemu-devel] [PATCH] hw/arm/allwinner-a10: Add the 'A' SRAM and
 the SRAM controller
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Charlie Smurthwaite <charlie@atech.media>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J7WNKZR8yuhQ

On Fri, Jan 4, 2019 at 3:10 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
> On Sun, 9 Dec 2018 at 19:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> > From the "A10 User Manual V1.20" p.29: "3.2. Memory Mapping" and:
> >
> >  7. System Control
> >   7.1. Overview
> >
> >   A10 embeds a high-speed SRAM which has been split into five segments.
> >   See detailed memory mapping in following table:
> >
> >   Area          Address        Size (Bytes)
> >    A1    0x00000000-0x00003FFF 16K
> >    A2    0x00004000-0x00007FFF 16K
> >    A3    0x00008000-0x0000B3FF 13K
> >    A4    0x0000B400-0x0000BFFF  3K
> >
> > Since for emulation purpose we don't need the segmentations, we simply =
define
> > the 'A' area as a single 48KB SRAM.
>
> >  static void aw_a10_init(Object *obj)
> >  {
> > @@ -85,6 +86,10 @@ static void aw_a10_realize(DeviceState *dev, Error *=
*errp)
> >      sysbus_connect_irq(sysbusdev, 4, s->irq[67]);
> >      sysbus_connect_irq(sysbusdev, 5, s->irq[68]);
> >
> > +    memory_region_init_ram(&s->sram_a, NULL, "sram A", 48 * KiB, &erro=
r_fatal);
>
> This creates the memory region with a NULL owner, which is
> OK for board model code, but since we're a device object
> here we should use OBJECT(dev) as the owner.
>
> This is more important if the region creation happens
> in the instance_init function, in which case it will
> result in a leak of the memory region after the device
> is destroyed (see for instance commit 09d98b69804cfd9e),
> but it's worth getting right here anyway.

Thanks, good to know.
I'll fix.
Regards,

Phil.

> > +    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->s=
ram_a);
> > +    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
> > +
> >      /* FIXME use qdev NIC properties instead of nd_table[] */
> >      if (nd_table[0].used) {
> >          qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
>
> thanks
> -- PMM
