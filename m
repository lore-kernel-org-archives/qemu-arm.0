Received: by 10.25.208.211 with SMTP id h202csp1793671lfg;
        Tue, 1 Mar 2016 11:23:56 -0800 (PST)
X-Received: by 10.140.141.71 with SMTP id 68mr30129997qhn.82.1456860235900;
        Tue, 01 Mar 2016 11:23:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z204si32234924qka.99.2016.03.01.11.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 11:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaptj-0004mU-Cm
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 14:23:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaptN-0004U6-Eo
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 14:23:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaptM-0006EO-Ei
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 14:23:33 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaptM-0006Dg-9W
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 14:23:32 -0500
Received: by mail-vk0-x22c.google.com with SMTP id k196so179482495vka.0
	for <qemu-devel@nongnu.org>; Tue, 01 Mar 2016 11:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vthnhQuV2rt/Vd6h8jRemyzL83Pe9u+bPik3ur4ZB6g=;
	b=BMX9xU8KKeoqxHCRxniR1/PgJIi1wFBFREt3K+U0FUHBU4sxQd4XsjLdhUyniC4vLu
	olIW/DQxgVgWsBFyX5KC0UZdBPlKvobVx0PBOF7FdAF7oweWVRTMdX6ga6v0ghH3qzAo
	IXolEsvwgOxwOT3Z+gNlxkrWl8WFt15LGvpjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vthnhQuV2rt/Vd6h8jRemyzL83Pe9u+bPik3ur4ZB6g=;
	b=MJXPwRi2rvqtJS66Iqe7cvkYBFBi9EbSUJzKeWz50ZX8FhgLlCMr0aR26ny7vfG37E
	FoV8qiFy7ZyDqTeJdpwuoDkGpGxiRF1kRhoAbO0EiRbtjx7cecoUpym0Dl1YxGSE9d58
	GvN0uWqqj4We4lxDn5ljcM5mbPCpYixP1eZ8F+OS+z+z/5mkodyHl8bs0USqGEU7vq5y
	g7eeb0kbqDV7kZFZSpH/zE3nk4V9885xSDlzU8p+N9Jifj3Aclsi6G9vyApwYciqrvRS
	TMj3AoL391IGxx0/qOgzyNEywxV2mvu4BmaCPLq+gBNbmLxLGG/vUmcJBf8wmqIlnp4k
	yMfg==
X-Gm-Message-State: AD7BkJK2/atwLE6mnw2PevjpZcBA73loUFWg65S1W1rbFZLfUYWXTRxBIyEEjpvVCgBx7/TIze4a/Nftms/rmn2b
X-Received: by 10.31.47.207 with SMTP id v198mr17342674vkv.6.1456860210840;
	Tue, 01 Mar 2016 11:23:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 1 Mar 2016 11:23:11 -0800 (PST)
In-Reply-To: <1456532174-17432-4-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1456532174-17432-4-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2016 19:23:11 +0000
Message-ID: <CAFEAcA9qA_xDy52wVF8wzxxdVVg2MgLbHPcJh4z9de-3Dh-r2g@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 3/4] bcm2835_fb: add framebuffer device for
	Raspberry Pi
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1Zy9zZ/fPWux

On 27 February 2016 at 00:16, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> The framebuffer occupies the upper portion of memory (64MiB by
> default), but it can only be controlled/configured via a system
> mailbox or property channel (to be added by a subsequent patch).
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Mostly looks ok, but a couple of points:

> +static void draw_line_src16(void *opaque, uint8_t *dst, const uint8_t *src,
> +                            int width, int deststep)
> +{
> +    BCM2835FBState *s = opaque;
> +    uint16_t rgb565;
> +    uint32_t rgb888;
> +    uint8_t r, g, b;
> +    DisplaySurface *surface = qemu_console_surface(s->con);
> +    int bpp = surface_bits_per_pixel(surface);
> +
> +    while (width--) {
> +        switch (s->bpp) {
> +        case 8:
> +            rgb888 = ldl_phys(&s->dma_as, s->vcram_base + (*src << 2));

Don't use ldl_phys() in device model code, please. It means "do
a load with the endianness of the CPU's bus", and generally
device behaviour doesn't depend on the what the CPU happens to
be doing. If you do a grep for 'ld[a-z]*_phys' in hw/ you'll find
that (apart from a few spurious matches) the only things doing this
are some bcm2835 code that you should fix and the spapr hypercall
device (which really is legitimately cpu-behaviour-dependent).

You need to determine what endianness the device uses to do
its DMA accesses, and use either ldl_le_phys() or ldl_be_phys()
as appropriate. (Or address_space_ldl_le/be if you care about
memory attributes.)

More interestingly, why can't you just read from the source
pointer you're passed in here? The framebuffer_update_display()
code should have obtained it by looking up the location of the
host RAM where the guest video RAM is, so if you ignore it and
do a complete physical-address-to-memory-region lookup for every
pixel it's going to make redraws unnecessarily slow.

> +            r = (rgb888 >> 0) & 0xff;
> +            g = (rgb888 >> 8) & 0xff;
> +            b = (rgb888 >> 16) & 0xff;
> +            src++;
> +            break;
> +        case 16:
> +            rgb565 = lduw_p(src);
> +            r = ((rgb565 >> 11) & 0x1f) << 3;
> +            g = ((rgb565 >>  5) & 0x3f) << 2;
> +            b = ((rgb565 >>  0) & 0x1f) << 3;
> +            src += 2;
> +            break;
> +        case 24:
> +            rgb888 = ldl_p(src);
> +            r = (rgb888 >> 0) & 0xff;
> +            g = (rgb888 >> 8) & 0xff;
> +            b = (rgb888 >> 16) & 0xff;
> +            src += 3;
> +            break;
> +        case 32:
> +            rgb888 = ldl_p(src);
> +            r = (rgb888 >> 0) & 0xff;
> +            g = (rgb888 >> 8) & 0xff;
> +            b = (rgb888 >> 16) & 0xff;
> +            src += 4;
> +            break;
> +        default:
> +            r = 0;
> +            g = 0;
> +            b = 0;
> +            break;



> +static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
> +{
> +    value &= ~0xf;
> +
> +    s->lock = true;
> +
> +    s->xres = ldl_phys(&s->dma_as, value);
> +    s->yres = ldl_phys(&s->dma_as, value + 4);
> +    s->xres_virtual = ldl_phys(&s->dma_as, value + 8);
> +    s->yres_virtual = ldl_phys(&s->dma_as, value + 12);
> +    s->bpp = ldl_phys(&s->dma_as, value + 20);
> +    s->xoffset = ldl_phys(&s->dma_as, value + 24);
> +    s->yoffset = ldl_phys(&s->dma_as, value + 28);
> +
> +    s->base = s->vcram_base | (value & 0xc0000000);
> +    s->base += BCM2835_FB_OFFSET;
> +
> +    /* TODO - Manage properly virtual resolution */
> +
> +    s->pitch = s->xres * (s->bpp >> 3);
> +    s->size = s->yres * s->pitch;
> +
> +    stl_phys(&s->dma_as, value + 16, s->pitch);
> +    stl_phys(&s->dma_as, value + 32, s->base);
> +    stl_phys(&s->dma_as, value + 36, s->size);

These should all be specifying which endianness to write
explicitly too.

> +
> +    s->invalidate = true;
> +    qemu_console_resize(s->con, s->xres, s->yres);
> +    s->lock = false;
> +}

thanks
-- PMM
