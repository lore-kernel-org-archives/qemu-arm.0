Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1532545lfk;
        Tue, 9 Nov 2021 12:42:52 -0800 (PST)
X-Received: by 2002:adf:f209:: with SMTP id p9mr12831535wro.191.1636490572816;
        Tue, 09 Nov 2021 12:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636490572; cv=none;
        d=google.com; s=arc-20160816;
        b=Gk0P73+rd0sPvhuit7trBZJDConHsAMMj8/v/mm+CXnH4tAp2mjreCU06o20ezU+DC
         ucYeYif2sx2crwgFlAIfgXZCeiJfuUoiSzxugF+QU2JoBAm8o5NWtLv+Qrv/c9OjvPBS
         VD/sCi8dyDNoGEPl0GkcyGxot0xOto1gAv/m98FHp8dNSP5f2tpaTtFDqZI3NaVbxywO
         MCqM+1AIdMZ1gdcnFuFW2uizCX0kSyf42tXCCAzpiirzx2zWdGxp59htrCqeHAHwtlMD
         iOXraxd1I8sLxKakrumjVtdscvc4YobbEyjqChHQQlPjb8UbeAGZsFO8AdvIjMhSR5CP
         Tl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=k/vTwMDMR4QyIkK24vhqvKCKCIJcbcTGzA/yBTZftXQ=;
        b=CNbd78T0u1W6L04OmkYqur1+x8bLPR7k7FB7hRHbN0x2WwXCzW9PJc+YiMbwFZs5Xo
         7r07wuhMBWepwa3/ouQKwkoMcbgFpv2zdf/8DIkPRsKirb0grn3Tkr35QPYSv1TRO/p4
         3Roll6I0U4ndvqat3ACd40xWTM/QsQeEnGNnmyJrFnonrZT/x8xln98phy4KiviKflmA
         ONc3FXf5no7eh/qu9XIGlAGpqeNRQ1NpBBcFvI/hZ05RLJ0euHksYL+YtQEQvKP/tMe1
         FDYAGiPrZiFkwy/2ZqIXFSJFkWzUX9cFUxQHLQWEKDXsA/klF61MTaQJRzpEbU0k06sx
         cckw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b=SK2upagK;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
Return-Path: <leif@nuviainc.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l11sor2431285wmq.22.2021.11.09.12.42.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Nov 2021 12:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b=SK2upagK;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k/vTwMDMR4QyIkK24vhqvKCKCIJcbcTGzA/yBTZftXQ=;
        b=SK2upagKKWjYU4zCBFV6O/SrUdku/GcA2wQ9mLDuCQmDNR2nRC7FIsCw9gmanUamRu
         45bYnvTFfBhaZZmLENIUXyTNsQA9NaK40SQ8Z5fo5i3aSFS6NHktXwGB+8mWyhrgRPXE
         92cBZ7XvRh088+ZFbip5nPeP3gXv/EbiOcePCNR8c5r8+PP960xvaPxKPVM4A8XkQ77l
         NmUIvg50r0fVPGe0vx5RUfkcslY82KdQZEcwGSwlFE9cENl1oxit8Dw4DPvkf98EWVQ3
         uuVxTPN4XwpnKGkrt1HYY61IIQbnNQPowH7v9nqhmMu0bp+doR+gsa74g3whRKE35hkc
         yepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k/vTwMDMR4QyIkK24vhqvKCKCIJcbcTGzA/yBTZftXQ=;
        b=C96aH5GqQyK9ToX2P3VKMllA8smfghlxZhSQ3yO9gH+ldyybu/h8d47gnP4FkHL46V
         jEHtn+lxYJ+OhDiayYKxEEbLNbmFfVe8Q9HitQuDHVsEoUvE7YwWAyLoSZegne27K1+z
         DLStxz8TB4pJTys0hbmbxmuu11L8BySpDeBSbPP1HxJmcxV0MjKX6b3/hjF5+ppiU59a
         tqjop2Y79uxHeraUkSVWfCrEFAwIZXO51OcjwecEfSkfIZcHZxRcRcWFiH4UyXK/3+Qp
         XJ0USKGbEWpd0zoLvmebqKm3ihV3tq+Dk7umvILNu61ynyjx8tfVaUty8j5JUXsTZDtK
         AY6g==
X-Gm-Message-State: AOAM533O7d0Q8rtB1AGizXDei11P6ZJYNAA7g0ZT8yegjuLZ//I1mmAp
	lv0giu37BsynK8LYbC4gM1tD8w==
X-Google-Smtp-Source: ABdhPJxtx/MuWT8vk0YkUZAQBaNKy6mNE/e3h/6qtcEsT6es9AdFFdTHBhVBBO5mzUKTthWymUMnVw==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id g7mr10471850wmq.138.1636490572469;
        Tue, 09 Nov 2021 12:42:52 -0800 (PST)
Return-Path: <leif@nuviainc.com>
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net. [82.11.186.48])
        by smtp.gmail.com with ESMTPSA id a22sm3452736wme.19.2021.11.09.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 12:42:51 -0800 (PST)
Date: Tue, 9 Nov 2021 20:42:49 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20211109204249.usvfatm3frar3u7a@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
X-TUID: W14OgcNb3SdN

On Tue, Nov 09, 2021 at 13:43:50 +0000, Peter Maydell wrote:
> On Fri, 15 Oct 2021 at 13:23, Leif Lindholm <leif@nuviainc.com> wrote:
> > (Apologies for delay. Alex also tells me you are currently away, but
> > there is no strong urgency here.)
> 
> (Thanks for the ping via Alex -- I missed this email when I was
> scanning through my qemu-devel mail backlog after my holiday...)
> 
> > On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > > Leif, what's your plan/preferences here ?
> >
> > I discussed this with Alex/Shashi.
> >
> > One further complicating aspect is that the EDK2 GIC driver currently
> > relies on GIC addresses being known at compile-time.
> >
> > > Presumably somebody also needs to do the system-software side
> > > of things to handle the ITS being present and the redistributor
> > > frames moving...
> >
> > Since it *would* be useful to get this support in, I think the most
> > pragmatic plan would be:
> > - Add ITS in the location originally proposed by Shashi.
> > - Add information to DT:
> >   - Platform version (1).
> >   - GICD, GICR, and ITS base addresses.
> > - edk2: Convert GIC driver to support dynamic block addresses.
> > - TF-A: Parse the DT and add SIP SVC calls:
> >   - to retrieve it (or return not supported if not found).
> >   - to retrieve base addresses for GICD, GICR, and ITS.
> > - edk2-platforms: Query TF-A for platform version.
> >   If platform version >= 1, request base addresses for GICD, GICR, and
> >   ITS.
> >   - Generate IORT if ITS present.
> > - Update GIC frame layout to match an ARM GIC-?00. (Platform version 2)
> >
> > Unrelated to the ITS question, and not requiring any intervention on
> > the QEMU side, we can then also transition the CPU and DRAM discovery
> > to SIP SVC calls, and stop sharing the DT with edk2 completely.
> >
> > And some way further down the line we could do the SCP thing, which
> > would let us support different GIC-layouts/configurations based on
> > platform command line options. (Platform version 3.)
> > (TF-A makes SCP calls if version >= 3)
> > This would then require no changes to edk2-platforms.
> 
> This sounds good to me.
> 
> > (Numeric values described as incrementing integer rather than trying
> > to guess at specific qemu release numbers.)
> 
> This is kind of mixing up two separate things. The above describes
> three "versions" of this machine type, which you might consider
> as like revision A/B/C of hardware (and where firmware might for
> instance read a 'board revision' register or something to tell
> them apart). QEMU release numbers and versioned board types like virt-6.0
> are a very specific thing that is taking on a guarantee about
> maintaining version compatibility of the same board type between
> different QEMU versions. We can make sbsa-ref a versioned machine
> type in that sense if you really want to do it, but it makes future
> changes to the machine rather more painful (everything new
> immediately needs flags and properties and so on so that it can be
> added only for newer versions of the machine type and not for the
> old one -- at a rough count at least  10% of hw/arm/virt.c is purely
> boilerplate and machinery for versioned machine types).
> So it's not something we should do for sbsa-ref unless we have a good
> reason I think.

Hmm, right. So you're thinking containing the versioning fully in the
interfaces presented by the model:
- Is the version node present?
  - If so, is it greater than X?
    - If so, is it great enough to support the SCP interface?
And let the firmware deal with that?

I was kind of thinking it was expected for incompatible machine
versions to be qemu versioned. But I'm good with skipping that bit if
it's not.

/
    Leif
