Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp536107ejb;
        Thu, 2 Feb 2023 08:28:45 -0800 (PST)
X-Google-Smtp-Source: AK7set80qnsozXnddphv4gYRCXOBtk4dzcPwk5ru2Ng3zrXTClhsEHiu6u/SPJoEn6VQJ2C3jeSb
X-Received: by 2002:a9d:6e96:0:b0:671:e5c1:219c with SMTP id a22-20020a9d6e96000000b00671e5c1219cmr3920653otr.21.1675355324990;
        Thu, 02 Feb 2023 08:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675355324; cv=none;
        d=google.com; s=arc-20160816;
        b=xUz+XcOJ9cUgRB7uTMASSTXKDaxY9n4qGi/kagHQR6ZLhdSp+tJYDg1BlBQijg7pzS
         lSx80j3PCQR6xtIv9ZQRBBrjUOLfV3fWu1Ef9kkUsOItBrJzj+6beuSHL9icfcMcu0SR
         k5yE3d8IWQ86/0UE2c2FWPyaHVOe9Ja3ZvQgGdDtFHCkg155Yv6k2oDq8uQ+09IKn0w3
         wCvrkYxHlP41gr1oikDmlsWxHO/eBaZkdkZ/URQgKQvgG81Y+89bC/OS9R61/fYxsd0s
         rNAztjEcqCCKpYJ20QGTmJ49maLKfhJzhVCfcX6RGY9oqK8u8I+mRgBkpKMylBT+/tM4
         9++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=6hXROfQzZ3F34nPoUwdpFl2UsAd9u+ceivePra+eMic=;
        b=ovKWDgexu0wjacljlGJCOMGPVZnJb4KhMxoJOrGzmJ0VAo+xmqP6B+JRDEVO8Es+/I
         4FanDwoCa00gtHO371tT7J7VH5r+pkMgYoD9FG+vgLDwYsURh6ELuF0XAzjEMykOupud
         rBbP7nnNK9gKd2MWnr6WvSTIvEbSPiC3CdzwsVnAuvy1K/5IpyV7FPe+W+eKK38VAWCG
         ZyWE8h44DRod+FqCPcHFR4k9SHfo5uLxmL0DeckiSPUNGlyDf2t7hG8uIrV/6HlFag2X
         DhA9VrvAjzrYsyP/kB7S/RgCFd61KHVb9b7XoUbHzPE/99fs3JBbJ8LLHHUg+3hcOzUl
         cN1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rCVgvkQn;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id c6-20020a9d6846000000b0068be2581cb6si6875439oto.271.2023.02.02.08.28.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2023 08:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rCVgvkQn;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAC0461BE0;
	Thu,  2 Feb 2023 16:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B729AC433EF;
	Thu,  2 Feb 2023 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675355324;
	bh=vtD2jzguhzCVkXCD7bfBMkIilEwFWfya//AvKlmwY0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rCVgvkQnmNmcR4PhhmrhGhiSlnMKjyNb/Ap5GZI+hmnRfsZ/aPO3rLmsNpKaml9D0
	 XWr50Xfpqjt7fRJUCNQOaR+izO8Q1dfo81aLWXnVRBup6D32OYhToBte07XP+Fjylo
	 UAPYZa74c3c4G1oBxO1DelFvi8HSnr/dVquOSU+az78imh8JrCX1J4qVJalndBZjxr
	 0FKCGPZ0XMQBL0CQGeNrKrBt1MeVN20mrnegegNN9ETgLCMQYLuayM83+6xq1uZtgb
	 fP4zBj9iUfiousknNUKHA72qCs1OCOaA9Y2Lpd646ZVgxyhBUpqZCb6VMXUV/XprSK
	 1vSZLjfOOpE4A==
Date: Thu, 2 Feb 2023 08:28:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: paul@xen.org
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
In-Reply-To: <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
Message-ID: <alpine.DEB.2.22.394.2302020828260.132504@ubuntu-linux-20-04-desktop>
References: <20230131225149.14764-1-vikram.garhwal@amd.com> <20230131225149.14764-10-vikram.garhwal@amd.com> <179d773b-2634-b52b-8836-8d8f882e1495@xen.org> <3e205146-5113-861d-ef39-c463257b54a1@amd.com> <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1274086482-1675355324=:132504"
X-TUID: EkqI0BJekTNk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1274086482-1675355324=:132504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Feb 2023, Paul Durrant wrote:
> On 01/02/2023 18:22, Vikram Garhwal wrote:
> > Hi Paul,
> > 
> > Thanks for reviewing this and other patches in series.
> > 
> > Please see my reply below.
> > 
> > On 2/1/23 12:30 AM, Paul Durrant wrote:
> > > On 31/01/2023 22:51, Vikram Garhwal wrote:
> > > > Add a new machine xenpvh which creates a IOREQ server to
> > > > register/connect with
> > > > Xen Hypervisor.
> > > > 
> > > 
> > > Is this really the right way? Is it not possible to do the Xen
> > > initialization (including ioreq server registration) off the back of the
> > > accelerator init (i.e. AccelOpsClass ops_init function), which seems like
> > > the right place to do it now that it's no longer architecture specific.
> > > 
> > There are few other machines using the "accel=xen" option and few of these
> > machines aren't using IOREQ and other Xen related initialization. Example:
> > /xenpv/ machine under /hw/xenpv/xen_machine_pv.c /and few other machines
> > under /hw/i386/pc_piix.c//.
> 
> Ok. TBH the concept of 'accel=xen' is probably somewhat broken then. (QEMU
> isn't even running the VM in question, so how can it be accelerated?). Maybe
> abstract machine types really are the right way then.

Yes, it doesn't quite match QEMU as device model for Xen. However, as an
internal API in QEMU it can be useful to Xen as well occasionally. It is
just that in this specific case it doesn't look like it is the right
fit.


> > /So, that's//why we moved the IOREQ and other common initialization parts in
> > hw/xen/xen-hvm-common.c and call them as needed for the particular machine.
> > 
> > @stefano, just checking if you want to add any other suggestion here.
> > 
> > >   Paul
> > > 
> 
--8323329-1274086482-1675355324=:132504--
