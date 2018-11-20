Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp278616wrt;
        Tue, 20 Nov 2018 00:16:16 -0800 (PST)
X-Google-Smtp-Source: AJdET5dn0kPeTptBIKp5fKIANDFePOAiimyjAeT3MmuVdUTWdMPFwpD9dA8D2XM3bhaFFe7q115n
X-Received: by 2002:ac8:6a06:: with SMTP id t6mr949307qtr.330.1542701776348;
        Tue, 20 Nov 2018 00:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542701776; cv=none;
        d=google.com; s=arc-20160816;
        b=pQqsIQHL3U0+rmCRj4rSKJlRpYXo/frJdoerWmoX6fQXq8I7L4JNGAmRk4xlrjk1np
         rFQMe3B4n3ihIRXm7ShXFIXy2BAWpF9ZmPBjJ4sJldr+879JZZZ8OYgFzy8CfAUHwADY
         5k/9jFN0/DVPEuVCsIyKGMqrM5+21/cEFMPXWkz+norHV1IJ5g1cdNqaGFYyGgUtudMV
         kpTFfFie38G3R/6tkJr7TxasNjSx8qADvsD/EnlDsnBrAP5Bcbb4PbVVMeJFAnriQF56
         AUNDPvgKb9iej/avZsnBoCDi7hpgO3IHWENhPmtmOCft37KXP6lhdtvKsNRidVPhfeNy
         kF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=LeM7q8T4//mI6qIwAX5BrXJR0F6dapf1WBXZO23+jlA=;
        b=zalTobt/pJALN4dQt/AmtNhpOv4XvZsslbnpvrL4LPMe29wfZvp6f/uq9pSKE8C3vW
         yswd1KQ1rZl/QHLWteftpdhwf69gUeHaixANPdhU7ZlbSifSvg9wBpmzofYEDHIIoNg1
         tXbWwfWX3UIdc66ZkpEmPmam3OHwG5v1awZvk6A4B7deQt/UCDCLV1Zlm7USMFEGe1t2
         O2cLqxLrLYt4NtOT5a2n2/8m9Hu5A3Na65goxNh3KbaZzM2evKG4J8RbIrW0uYVlis+3
         VSgcAi/HY9dPF3Haft5ORQx/buFI6DmI0Cg6Zba0W9v8UDMrNyRruNWFkkVM+bsPRX8v
         l5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o5si6794385qkc.148.2018.11.20.00.16.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Nov 2018 00:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kraxel@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4723FC05D3FF;
	Tue, 20 Nov 2018 08:16:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C839D5D9CB;
	Tue, 20 Nov 2018 08:16:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0ACC424D568; Tue, 20 Nov 2018 09:16:14 +0100 (CET)
Date: Tue, 20 Nov 2018 09:16:13 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Leif Lindholm <leif.lindholm@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
Message-ID: <20181120081613.bezcjotqhmqflvvb@sirius.home.kraxel.org>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org>
 <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net>
 <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
 <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net>
 <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 20 Nov 2018 08:16:15 +0000 (UTC)
X-TUID: BxLVfOS0BL6U

  Hi,

> > But I assume you specifically want things that do a lot of DMA, so I
> > couldn't get away with asking for keeping it to the SBSA UART(s)? :)
> 
> Ideally, it would be something that supports platform MSIs as well,
> but that is unlikely to be a priority for anyone (and i would be very
> surprised if any of QEMU's sysbus host controllers implement that at
> the moment)
> 
> I can live with just sysbus AHCI, though, if EHCI/XHCI are too cumbersome.

Generic sysbus ehci should not be difficuilt, 10 lines patch or so.

Gives you only usb2 though.  usb1 devices are handled either via ohci
companion controller (should be doable), or via integrated usb2 hub
(more common on recent hardware, but qemu usb-hub is usb1 only).

Generic sysbus xhci would be more work.  But you'll get usb 1+2+3
support.  And wiring up platform MSIs should be possible too.

cheers,
  Gerd
