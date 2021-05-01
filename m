Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp752047lfg;
        Fri, 30 Apr 2021 21:28:41 -0700 (PDT)
X-Received: by 2002:a25:a021:: with SMTP id x30mr11956992ybh.128.1619843321730;
        Fri, 30 Apr 2021 21:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619843321; cv=none;
        d=google.com; s=arc-20160816;
        b=cxykrD7eR5iVWAE8BFKbRoRO0JOQigp8gTYuQodBtxgxREgkTSp6hJS7BiPdJ4y/KY
         up2unnLylblp0xqMJ6nRRkzDZYDbgyWpQEyxe3ZcXQaiQOYCNao6zvv8x1HMTVyE5kol
         B9TTl0bzCPU8YBiNRTmFP+sIoS9O26h7gctduqo1hg+lRWrR8KTgjPvq1fUiMHvf0dZW
         vybJnyM/Q2Z1OcGUju295FV+2AmoytD7fLQ8zUpcFunwozPLzoK6phPhHV5LO6CfZMdm
         +RmMKN5Ul323O/EstMJFemmeqyT306ynqwFlMvwL/SwEKuLTfWuFFs8C/CMWKaBobxfq
         D4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KBOrlFh7m+qPBZ0bW2VfLECFPg8kJKYqGnFplvrHa34=;
        b=HvlTtjzhgBVGtNTAzsxyDARRygxnnDwXQqapHdHJFPL7jVw1mBXn2vnKH1Cj9SNk3M
         C4NfsHNlAPlGPuP+QYJ1n8LYLYHW98avZWgbO5YK4tIAFRXHuwezcqz4xJLi7jPhAO2x
         UdMi12eYdPS0pxVQcSVqJ5KGz78GKMNrFF4xzRI/Owzoxz7h6TlL2XE5Oi1cIGk4EddO
         MQjCLEm+XFxBqF0TekHGk7lA3pypKOB09W704wB7XdJKasHN1dUsdc82hKoHjqPE4I3L
         BGNT+igOr6+bdfugzGlPyn3jnNcSVB1zElQaMSWKCucZ4icnXBHXQFLFv0dFAhle0wuC
         vncQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uWAaW1Cy;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9sor2968601ybm.55.2021.04.30.21.28.41
        (Google Transport Security);
        Fri, 30 Apr 2021 21:28:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uWAaW1Cy;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBOrlFh7m+qPBZ0bW2VfLECFPg8kJKYqGnFplvrHa34=;
        b=uWAaW1CyhSQINLIktbuxRY2oZup04jmk19ET6sNxRRd9xgsPzrS6DZmtGbF/c1+yCQ
         1bmdtMeb/XldC8v1ilYfdwvoLnpvFMcXGLdNOQLxn/8fTt7MvC+IuphjnEK+OrsPRjNl
         Wgb8rE6p3jsvXLm0eHyj1C3gWdgWD20bLtTCQL5Blq+6MXh3lj2oApvCMtng0DL3ViL/
         OKekcRABOZ012DiruUrVVTGcE0iKddKEGbOUM2BwqixGeOUdtxO4C6KA89f4GWOv0iad
         ZqTWXDCBJViTlGgoT7D7GXfZ1Zwv6kSak2Py8PGbsR0pZcuGWQEZlTqHdeqaHVrZgXYg
         CHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBOrlFh7m+qPBZ0bW2VfLECFPg8kJKYqGnFplvrHa34=;
        b=PBzhPA86J8G+UWVGvv1b2JY+uSY6ORdDGmF3mqjT03dpXX45iyODu32x+w0DbexrFG
         b1NkBmOMGwbj487zHceoDxzX58gf5B5yyyg7/BCx0u/QuzYP1Xeb5X25KLbvL7G0Oimq
         RNG6LTauY+rM7h/WYePPjRthO70Z4ZsQJ42aFCT1sm7x2vFbH46A5MrnziwJY/fQintf
         kpAFzXaJhN//Rctr0IK7CcdGEfj+GT9Gs9PmI8dmt6MGoMZJ3aT+Zvd0IxThghuAgyCS
         Fc8w29Ix8RkQVWlGbYz0awfbbDrnFyDIbBOX3VK4Bm3t7Lx8S/dfb53Qb35Wj2gHYR+M
         ++lA==
X-Gm-Message-State: AOAM5308wmPPGEpFfHGbYHZm0f6PvwsmMaNzVe9Kjf7BPn7r7BQm8Hm6
	8+KTaKHksuqiww32UvMhXH7ym0yY51eIIpdnLV4=
X-Google-Smtp-Source: ABdhPJxy7urPtcoIFbbUfYpDKJYZOdjeEcRc+MB44zbEzCmwVKP7LcG5rcYuyhIWusPObDuSNNCC+FlMH8h+woifh7w=
X-Received: by 2002:a25:db84:: with SMTP id g126mr11812176ybf.122.1619843320843;
 Fri, 30 Apr 2021 21:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com> <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
In-Reply-To: <20210430144136.GA2880420@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 May 2021 12:28:30 +0800
Message-ID: <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 7DmIAKEgsiOu

On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present, when booting U-Boot on QEMU sabrelite, we see:
> >
> >   Net:   Board Net Initialization Failed
> >   No ethernet found.
> >
> > U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> > U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> > board, the Ethernet PHY is at address 6. Adjust this by updating the
> > "fec-phy-num" property of the fsl_imx6 SoC object.
> >
> > With this change, U-Boot sees the PHY but complains MAC address:
> >
> >   Net:   using phy at 6
> >   FEC [PRIME]
> >   Error: FEC address not set.
> >
> > This is due to U-Boot tries to read the MAC address from the fuse,
> > which QEMU does not have any valid content filled in. However this
> > does not prevent the Ethernet from working in QEMU. We just need to
> > set up the MAC address later in the U-Boot command shell, by:
> >
> >   => setenv ethaddr 00:11:22:33:44:55
> >
>
> With this patch in place, the standard Ethernet interface no longer works when
> booting sabrelite Linux images directly (without u-boot) using the following
> qemu command.
>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>         ...
>
> The Ethernet interface still instantiates, but packet transfer to the host
> no longer works. Reverting this patch fixes the problem for me.
>
> Is there a qemu command line parameter that is now necessary to instantiate
> the Ethernet interface when booting Linux ?

Enabling "guest_errors" shows that Linux kernel fec driver is trying
to read PHY at address 0, which is not what we want.

[imx.fec.phy]imx_phy_read: Bad phy num 0

The device tree blob of the sabrelite does not contain a node for the
ethernet phy specifying phy address, so I suspect Linux kernel driver
is using default phy address 0 instead.

Could you please test on a real hardware to see what happens?

Regards,
Bin
