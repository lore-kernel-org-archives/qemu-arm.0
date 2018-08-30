Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1829437wrd;
        Thu, 30 Aug 2018 06:53:02 -0700 (PDT)
X-Received: by 2002:a5d:45cb:: with SMTP id b11-v6mr7603894wrs.122.1535637182136;
        Thu, 30 Aug 2018 06:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535637182; cv=none;
        d=google.com; s=arc-20160816;
        b=JvvbUpMWPl694ZlcR4n71RmVa1VJ4kNuld0/6PPn7eDKVwYkkDuTthpGHAo2JrnW5Y
         Vop6Sdg9eueF7+XqWcaCl7nPKLz28lnK1qHdzthdNFxnwYRiiKAivArco6Z2aeKUl3fu
         EXjDevb/nb6h/PgYfOYUJSlpgYWhi7rZKav0VrZqhU+CGLn/ekRRvgMKP2+0zqDhq/cL
         WsnfsJboetUWMQ0lpSXmsl/XtuGjBNeR3N+D4iJlpHuL5VfMJfmkTWR1f3zyHhEpZ2DG
         F2rInGHWnq8NqrJErt7N8lu5BMs6YZJTrmITLUmadxlDlPfTomHYZLCPvpoANVAnPdAX
         sQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=Gwnoi0VyAXtmdDMvkntatQ4ZAGp1zsw6hAhvrEhy9bU=;
        b=d4DHZ+68MJ1OM+vLtJVzODNFnrjw5IP9fG+3DEjASKPzggvrAE8V8uBsWxqJ/4xqcj
         yxvpdZBrWaphd9UOKUzBP/OCxauez+zArEctPjcM1Jb5eUvwVAqe84Ippz2S3r+RmxUB
         lV3YnjJqMX11iTbnaBnL49wORu2o9qApJutjYPlqjakXnnmDjrJL+Y5YB09XUEiAg5ap
         0K2PW8I1ErKVoVhwghPWbgAuLN+9JHGu3cZ69LC0uRLA3Bl8T/cVZDwBU8CNJkJxax0r
         mZmF51FhoMk1LFboc7Ye00RAmIWIMQv9VZR8XBgl85KD8cRgIRHGUBwIZDztKTwcOKEA
         U2sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmZuJH0J;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <leif.lindholm@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y1-v6sor3998070wrd.40.2018.08.30.06.53.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 06:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmZuJH0J;
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gwnoi0VyAXtmdDMvkntatQ4ZAGp1zsw6hAhvrEhy9bU=;
        b=DmZuJH0J0TfEgIqk7QJUJYiPzP3b4CRselx+Yuzr4mOtoISHgA3Mi7vsF9OT6XUZwM
         TrZjz+VEySNG01/rSBVA8lm3y8qqtFDXU/bJTcnI4FeXPL8hdr+mugDSF6YXCDGnl8Rc
         UHd3HOuLNLWxJh7ZFGw7apzepXQt3K5ivmpE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gwnoi0VyAXtmdDMvkntatQ4ZAGp1zsw6hAhvrEhy9bU=;
        b=QilstuEMOzD1TNJSY7LGDQq3V1oDZM6YV+w+Bj5EhZwuDZEpDqdaXo5nw9BS7HYg61
         j56HjwXtFHpsAB7QZ4cRLlliwwFOBLDCB12yCRCNtMygqZzX5XFIQ9hicm9IH9HZLlo9
         t8nj+mE6R+QWGxEZNzT7BI2TqyIFaDNUI4nI7VKPUUnsbijkytuQ/PQeurLqW2LaJbPK
         ETL/h3FKafsJ4mY1w0KsYknlKY01qjDaUj7Q7vWWfGPlBPnYGpU9OYOQCCZbwfl2WmHY
         25G7XFxlH0evl7cdOSZ/3b6v0xTyTGMezOQtXHKhaMo7gjqww56HqEcW4u+w88QSNuzw
         +mQg==
X-Gm-Message-State: APzg51DqlL8fIqrtT4PXds809F53pF5upuMbuQWptoLQK0KDyPiFFEWl
	jrIol3BQxNzJlA3Sq6UeVHgFaPtF
X-Google-Smtp-Source: ANB0Vdag7Y3AN2q7+OPkAO6e5CBemsg9oH4NKupUZwaZTmPuZkeBczVfpT1vnNuecNFqht4Z/K0boA==
X-Received: by 2002:adf:edd2:: with SMTP id v18-v6mr8025568wro.39.1535637181876;
        Thu, 30 Aug 2018 06:53:01 -0700 (PDT)
Return-Path: <leif.lindholm@linaro.org>
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id t132-v6sm1557754wmf.16.2018.08.30.06.53.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Aug 2018 06:53:00 -0700 (PDT)
Date: Thu, 30 Aug 2018 14:52:58 +0100
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180830135258.olr7yt6univbjqx7@bivouac.eciton.net>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
 <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
 <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net>
 <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: OMcNs1fNiJvZ

On Thu, Aug 30, 2018 at 03:29:02PM +0200, Ard Biesheuvel wrote:
> On 30 August 2018 at 12:02, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> > On Thu, Aug 30, 2018 at 09:39:33AM +0100, Peter Maydell wrote:
> >> On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> >> > On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
> >> >> @Ard, @Leif, is there any possibility to remove all the DT nodes?
> >> >> On real hardware, how does UEFI find the memory size and CPU number?
> >> >
> >> > Usually by asking some form of SCP/PMU.
> >> > So until we have rock-solid multi-cpu-instance (making terms up here,
> >> > there may be a proper name already?) support upstream, we need to take
> >> > shortcuts.
> >>
> >> I would expect that you'd want a "faked-on-the-QEMU end" SCP
> >> communications endpoint to start with anyway. We have one of
> >> those for vexpress, for instance.
> >
> > Ah, I wasn't aware we did!
> >
> > In that case - sure, that is probably the more sensible solution.
> > Does it emulate SCMI?
> 
> The purpose of the SBSA/SBBR qemu machine is prototyping the
> interactions between rich firmware and the OS for things like RAS,
> secure variable storage for UEFI or capsule update.

I think it would be useful to at some point have also an open-source
SCP implementation and tie it into this platform (if feasible). I do
not however think it is important, and certainly nothing we need to
worry about for now.

> How exactly the firmware figures out how many CPUs and how much memory
> we are running with is out of scope for this, and so I don't think
> there is a need to build something from scratch here: DT will do just
> fine, given that both EDK2 and ARM-TF have working DT code for these
> things.

Agreed.

> fw_cfg, on the other hand, is unsuitable for us. Generating ACPI
> tables in a different way from actual bare metal is not a good idea,
> given that things like RAS interact with ACPI as well, and fw_cfg is
> also exposed to the OS in the default mach-virt configuration. So we
> could tweak fw_cfg to be more suitable, but I think that does not
> improve the usefulness of our prototype at all.

Indeed.

> At some point, it would be nice if we could get UEFI to receive its
> platform description from ARM-TF in a generic manner, and it would be
> good for EDK2 and ARM-TF to align on this. So even if we decide that
> SCMI is more suitable way to convey this information from QEMU to the
> guest firmware, I would object to implementing the client side of that
> in UEFI, given that it should be ARM-TF that provides this
> information.

Yes, but the modeled SCP is relevant for the ARM-TF port for this
platform. A "faked-on-the-QEMU end" SCP that communicates via SCMI (or
if that's been superseded, I may have lost track) allows for sharing
generic arm-tf code for retrieving this information with most hardware
platforms.

And that _would_ be nicer than having the lowest layers of the EDK2
port looking more like hardware than mach-virt.

This is of course also something that could be addressed at a later
date - I'm not sure how generic arm-tf is in this regard today.

/
    Leif
