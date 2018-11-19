Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1069974wrt;
        Mon, 19 Nov 2018 08:44:24 -0800 (PST)
X-Received: by 2002:adf:9d1f:: with SMTP id k31-v6mr19057822wre.18.1542645864838;
        Mon, 19 Nov 2018 08:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542645864; cv=none;
        d=google.com; s=arc-20160816;
        b=AxZtZttBFb6uS6TmPW2A0wZsFdseja86lK+t/8VTdhBe4/uV78mNQAnBfgwCnnvY3z
         TFlhVD6MXEoRYPgN92LGYq8CIIBN0SlPNqOTJMiz1y/40d3/pLUA/HvKIzkQVzhzO4pT
         7vk4D6QhTh31lbyvpuE04Gsw/mvyWKRYn1NJJUpcOoKycu6W43zVCI3Tq79AcDTOFWzd
         ss4GQ9hQCP/LzXj0CNX81HavgCJgOlJn6UNxIS8p3sTe25gE7+WtAF3iW6W4lzsMj8up
         Z02MosnWTRnBWrKOLH6ev0icOI8q1dGwoReJn4abIxN7QFYouh3Eo9scAWa5f2gWowiR
         H74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=kjSc0iwQcKENwdaEpl88OZ7ksfC2BBMea/ASxipWlvQ=;
        b=YB4G5Q4IgbdrgCvaRTWAMRYj75DmKq6+xl28gDM09uYIO9tDQzIf+dGEgR/crchLb6
         XOn9//Qau39aPyUt/wFutiFWhnUyqui3O7faeXVrQ3hL4P/uLdw86+GK8gYZPUgPNsEl
         rZYzoG8dFUAThNFKhpwfnFX6S2E9RFGnXTEUn2fZeAjc5W0gweSTE1XucVO4hnRs32zv
         1xeXCDbbF0rhsC4JerhAaxyMDcp9ncJ63P3uIv9wPxRDCsIfC7iRg++yJGloWWmrFBM4
         JDE8rodo4lvtzgKyLgBpnmHk/kMvbcZ5KnfsOfRS6gjV/EoFEhpk6M/GBvT+0It804mR
         v5Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Njg5uato;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <leif.lindholm@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w8sor12427496wrl.37.2018.11.19.08.44.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Nov 2018 08:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Njg5uato;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kjSc0iwQcKENwdaEpl88OZ7ksfC2BBMea/ASxipWlvQ=;
        b=Njg5uatozUhq60ip7L0Jw0fn7cc9g1cx/JHOwjfZ974q0o9a9ro5PHIcQ7jf6VWw9R
         Ud3j5roWBSt9i8MzIMcPRUeMgzG4kt/8xA/3/CzcvPJxSez697Lg9nxvt5UIXRlHQuGX
         TSn7tBHgJSVFfj9eqKa1j92wpBvUHKwNKnQQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kjSc0iwQcKENwdaEpl88OZ7ksfC2BBMea/ASxipWlvQ=;
        b=NG9FpiVBxQP6Cnok30k3cIsyquP9eJB3yMIY+GIoegticLZC4IEpheY27ahWiPYJ4x
         3vze1ZK+vEc8GW4gltK7JNeFh3hljurMhRimzK9+eRc89ZsClCCxwAeGn+A65pd6o2w+
         +aEgqGPdlcsK5rT20XF+veQ95WdNLnuo+DF4A/P3w3PArwSZDCfDeOh7Ru79KLn1G6tU
         eFbOu3FblVDMdm97zuXCZqLEEOS28AeiKYAdkTQZHPWdbz1OZGgVvk6i5KkZ8yyCIkrS
         FRBUiS2mwbUjE0wUIA4y7uU1KIxKIesjxwEzpGxswk41d8DzN5ySozf+XbSilOuy2GFj
         ZGlg==
X-Gm-Message-State: AGRZ1gIB3pLghEsz0/haLN6kaoVN7thW8PcwngY4zoHoPVfrBBIAART9
	eZL+zEijWkZ7Ib4i1Kp9oxjVC9ua
X-Google-Smtp-Source: AJdET5cscTp0mk2Lx13TVLbrXzPXe6f8wIuKPtdh4bgAZInGR/Qu51nufVXkKEUEfy/i9Bm7K4Mm0g==
X-Received: by 2002:adf:ead0:: with SMTP id o16-v6mr18596469wrn.287.1542645864419;
        Mon, 19 Nov 2018 08:44:24 -0800 (PST)
Return-Path: <leif.lindholm@linaro.org>
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id 82-v6sm27006899wms.17.2018.11.19.08.44.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Nov 2018 08:44:23 -0800 (PST)
Date: Mon, 19 Nov 2018 16:44:21 +0000
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
Message-ID: <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org>
 <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net>
 <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: LieKC5cR7l9T

On Mon, Nov 19, 2018 at 07:51:29AM -0800, Ard Biesheuvel wrote:
> > > > I think what we *really* want is sysbus-xhci-generic.
> > > >
> > > > That'll be a bit more work though as xhci core and xhci pci needs to be
> > > > splitted, simliar to how it was done for ehci in commit
> > > > 5010d4dc618b6b8e7c21129c487c06f6493f71fc (and related patches).
> > > >
> > > > Or just plug qemu-xhci into a pcie slot.  Not sure which would be closer
> > > > to physical hardware.
> > >
> > > We don't need XHCI especially, EHCI is perfectly fine as well.
> > >
> > > This is mostly about ensuring that the emulated hardware spans the
> > > space of what we encounter on real hardware, and non-PCIE SATA and USB
> > > controllers is something we see often.
> > >
> > > So I could live with MMIO SATA and PCI USB as well, but I'd prefer it
> > > if we could have both MMIO.
> >
> > I would actually strongly prefer non-MMIO.
> >
> > What "we see" is generally a result of embedded companies "value
> > adding" in the usual way when moving from embedded to servers.
> >
> > I want the SBSA target to be an idealised machine, not an educational
> > vehicle for showing how companies have got it wrong.
> >
> > Where in doubt, anything software discoverable should win over
> > non-discoverable.
> 
> I don't think it makes sense at all to idealize the SBSA machine in
> this way. For example, there are elaborate provisions in the IORT spec
> how to describe an I/O topology involving named components (as opposed
> to PCIe devices), and I have not seen an arm64 SoC yet that uses PCIe
> internally for on-chip network controllers, nor do I expect to in the
> near future. So having non-PCIe USB or SATA will permit us to exercise
> code paths in the OS that we do rely on in production, and will for
> the foreseeable future.

Fair point.

I have no objections at all to adding _some_ MMIO components for the
purpose of being able to validate this. But I am reluctant to mandate
discrepancies in bits that 99% of users would expect to work
identically as it has done on x86.

If USB isn't auto-instantiated in qemu-system-x86_64, then indeed we
don't need to do it here either.

But I assume you specifically want things that do a lot of DMA, so I
couldn't get away with asking for keeping it to the SBSA UART(s)? :)

/
    Leif
