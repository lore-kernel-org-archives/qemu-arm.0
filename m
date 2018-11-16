Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp319207wrw;
        Fri, 16 Nov 2018 04:27:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5dTS3YeZl/PTr3+6vsTxmXHPb73DQmq4TZErDRTcjIST48v4dfeWZ29jMJSsoG4BInTMKwb
X-Received: by 2002:a0c:9c89:: with SMTP id i9mr9913659qvf.153.1542371228267;
        Fri, 16 Nov 2018 04:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542371228; cv=none;
        d=google.com; s=arc-20160816;
        b=NOKB48nojBXgrC56LjbuknS2FohyOzhdgGJlso7LWcsVhbrIu9Uwlr0VQkByPVH48p
         X0fSW2oTwTj1YJNyfB5yoVL1uUkX+7szg6c1F+YeK4c4sv4QcW/UPzMMjUlUF3pMke/T
         XadIPN+Y5wctgLWb81iXVUqLj4eYK6DZUumRzygHXAQ9790XatFz5Hih/XudivvYfGi0
         F7sxSPbosUvWUszdrOSI2V8tLoU/CYAYjHRR7Q5jBqD6qIP8x54Fmh027h6FZyoNoK9T
         a+4s5P4NHlYJ8XFy+t2LX7WIaORKblwrNKrfj8msIfQiBd9PqCEM+JM5lsSrLAXLevt9
         t64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=Z85pBaAmWjrj3v9h6EGpQL0lfi9qaJMB54Y4sHpnQTM=;
        b=xpxxXGoagtb8tXcx84AN1rFBsYcS042eBM0Z0ZmRANHkOJnXOoUi4qC6t5ee9irXUt
         WLwgku0+XiORKREmJ8BgxSCGwJSaoipFNJhiKQHiQNgG7AlQ3bp3dHoCw8FCAHcOX9L1
         9Y86B1N6mCGMMkUMySiaRwNl0MKF84EoPtJKp43thUvpxlmw+1eQHSLwwcE/bmhQYulE
         W/8Zq8lUHy8fi+xrEptLjCDSdEPJU2+UFS//lL1RYruL+IT5iNSUnLxD9rZRABsgrE+K
         G2GjDojzISEekI+qGy3a7DN9c6fpsMuCv1j1nIe40srYcRLg3a3rb8u2jpcVylV/h2eK
         1i0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y17si125887qtf.345.2018.11.16.04.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Nov 2018 04:27:08 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 995AFC028341;
	Fri, 16 Nov 2018 12:27:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.36.118.1])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B08527189;
	Fri, 16 Nov 2018 12:27:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5066FA04B8; Fri, 16 Nov 2018 13:27:05 +0100 (CET)
Date: Fri, 16 Nov 2018 13:27:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
Message-ID: <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 16 Nov 2018 12:27:06 +0000 (UTC)
X-TUID: qRlTj3S4XBPM

  Hi,

> > What is this using the exynos4210 USB device for? That
> > is definitely not correct for a generic board.
> >
> Checked the code:
> #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> 
> The first one seems only a parent type, not a general instance, cannot
> be used directly.
> The other four are specific instances using the first as parent type,
> one of them can be chosen to use.
> That is my understanding, any comments, or do we need to implement one
> which seems generic?

I think what we *really* want is sysbus-xhci-generic.

That'll be a bit more work though as xhci core and xhci pci needs to be
splitted, simliar to how it was done for ehci in commit
5010d4dc618b6b8e7c21129c487c06f6493f71fc (and related patches).

Or just plug qemu-xhci into a pcie slot.  Not sure which would be closer
to physical hardware.

cheers,
  Gerd
