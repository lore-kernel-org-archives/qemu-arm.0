Received: by 10.25.208.211 with SMTP id h202csp1459073lfg;
        Tue, 16 Feb 2016 10:34:44 -0800 (PST)
X-Received: by 10.31.50.65 with SMTP id y62mr19289003vky.11.1455647684505;
        Tue, 16 Feb 2016 10:34:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com. [2607:f8b0:400c:c05::22b])
        by mx.google.com with ESMTPS id s131si33653642vke.181.2016.02.16.10.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 10:34:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) client-ip=2607:f8b0:400c:c05::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22b.google.com with SMTP id c3so141302344vkb.3
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 10:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=rDhEUjZqVbARvSOEq5pL3ldCQ18gg8d0kBU6n6ad7JY=;
        b=Uim6mww76ePv4xqnmJ3U1mgVdClm7HYC6ucZUz0LWNsww+f2vT+pfkQkrnVf4z9u5e
         ovHQTs+l0oUWnaI6qCJCh3ty+ZKjYrONiowtDxCphj9tsVPCB3bvslw1GJztonmNO62o
         onw1tr311JisxmsVmdmV84m3WaM3HM8toq/8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=rDhEUjZqVbARvSOEq5pL3ldCQ18gg8d0kBU6n6ad7JY=;
        b=ah85hR1RE/5D5XU3Gw2GkK3Ia+Ww+ZHY7cZbkO+RyKm8j46CYRsWaRV9qQa8Sgwv8s
         EhkNUmwAN5rbx32LnScPI7Qpx8it/n9xyJGyCzLg9xSzZMpouwhFS2PTGZCtCUsjDvj+
         kURLWTeYvIlmaKXp/+k5RuRms6GHddszHdOHYq2uhewhESQjqr1FSH0ZgUA8VON2a5Ty
         yrguMU42zl1hqQGLAdYp8VDoTDSPMTIcBeEVSGkiKctMCxe+wm5JZEkMZ8VJ6Rkt2IIR
         wEjX4Vms22DZbte8wDNhB9TWA/DIFjJ/a0pdEa0B7EVKvT2B96s5MMcOEGQhdhkPp5NC
         IywA==
X-Gm-Message-State: AG10YOQzDhzeba1ri/gNPIK9nwZ+AnK32MpvCvU0zP8ICMlxQSfaygwre52HBtzrUmQXDG5uPKxFCchfIpgiCj4473Q=
X-Received: by 10.31.52.147 with SMTP id b141mr19526945vka.82.1455647684147;
 Tue, 16 Feb 2016 10:34:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:34:24 -0800 (PST)
In-Reply-To: <1454334712-12360-8-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org> <1454334712-12360-8-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:34:24 +0000
Message-ID: <CAFEAcA8heKDX1aR5jf8aMEBuNWA8pUcpjYhC27ViHjjG3kGLHQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	Christoffer Dall <christoffer.dall@linaro.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Baptiste Reynal <b.reynal@virtualopensystems.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: xayWv2l/grgk

On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> This patch allows the instantiation of the vfio-amd-xgbe device
> from the QEMU command line (-device vfio-amd-xgbe,host="<device>").
>
> The guest is exposed with a device tree node that combines the description
> of both XGBE and PHY (representation supported from 4.2 onwards kernel):
> Documentation/devicetree/bindings/net/amd-xgbe.txt.
>
> There are 5 register regions, 6 interrupts including 4 optional
> edge-sensitive per-channel interrupts.
>
> Some property values are inherited from host device tree. Host device tree
> must feature a combined XGBE/PHY representation (>= 4.2 host kernel).
>
> 2 clock nodes (dma and ptp) also are created. It is checked those clocks
> are fixed on host side.
>
> AMD XGBE node creation function has a dependency on vfio Linux header and
> more generally node creation function for VFIO platform devices only make
> sense with CONFIG_LINUX so let's protect this code with #ifdef CONFIG_LINUX.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
