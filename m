Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1610701wrd;
        Thu, 30 Aug 2018 03:02:36 -0700 (PDT)
X-Received: by 2002:a1c:580a:: with SMTP id m10-v6mr1318798wmb.131.1535623356796;
        Thu, 30 Aug 2018 03:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535623356; cv=none;
        d=google.com; s=arc-20160816;
        b=yZRSli47k8M1xYXhKnrB25n2jNWfToTA13GEkmQzojjOKS4Ttbu26OHBTKa9TO7dou
         JEdfz19yflxKWpvlsOcoWLP4AFeGBqcQATdagZqPBNAqW6QhtccV5CLnrD72Y2e1NTdb
         TuGqpSJptEftSODMEOBR0lastmOzFZX0+G8HVzPpjG3o/cSW4eVZG4ZRXZyu8ULzCayT
         M4/WVbIB6Df0Ezjpjq6y4ErYDpVDdS+lVzaLPlzWVR2lzPmYrmAC7FR322mu72vnPXMB
         fZuxGx8T15GD/FQSTDazQIWrSO6sy9ABfMRu23gyAg5wXGqLqLZnTdoyRvKHQaP0Q13i
         DIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=Wry5P4C4KJ12yElRU2Sxf7jg9ONyWOfSZaeMpBm787g=;
        b=a6cZ1L4hAViNme+aCfRMZfCq08ocq1dDA9whZG9XJVDXInl9gvd5sBEQzgO0lLn8da
         MqfTG0bpd2QyY23YU2hOpVgLZIitQcOH5aPtRZuknxkAOfAotz53yv+7KxnmFNIq1JKr
         Pd1zattmlpmu7easzlZeiTEgTaqAQqQldPcAanRwzfjdQAZxu/LwpYjdVsaQshoDzg6S
         N1odgX8XGfLcQNgnLGbshaCdAy9Orsv2B6SPTWk+qwSC9T42HCxO3/t2jr5kBzxHHGzS
         LJAzliXLuJTcUs2sAyJQWE2kw4OholbmqEp+5Wqdpz7NMDYw6Bxwu7pajYsSjwHBq0hq
         tBLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FYo/CKZ8";
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <leif.lindholm@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g40-v6sor4498102wrd.15.2018.08.30.03.02.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 03:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FYo/CKZ8";
       spf=pass (google.com: domain of leif.lindholm@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif.lindholm@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wry5P4C4KJ12yElRU2Sxf7jg9ONyWOfSZaeMpBm787g=;
        b=FYo/CKZ8RYajOdAuW2GxnztQaIItjxCQsuOG8h2kRzq+Xmy5KtzduJ8F/1mg0jDj5Z
         4k6Uw8P5xomSAQdThhUNYI5lL3gPJRVqDT2kHJ6cIJECcHmzAUjOJBGZpyaU+fqWGiTY
         8MFXFMKVbQo2NwNkT5QPSlphE2UZoRKD8jtgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wry5P4C4KJ12yElRU2Sxf7jg9ONyWOfSZaeMpBm787g=;
        b=jWxxxcrGYRcduhlGP54k1luPp8Tb9ZiDydNtTJQNzJxQmSWeoH+0Ub+DDlc6XdnWYN
         lyXt10wfjEOn9WWAS1os8V4U8KNSkZdU6BDLRXP8QET1u8+KEoxWBYvdgI/dxlWOqpTu
         FYxNUUowrRriofshI9xOt+jsPBzGGn6z3H1Z6eEi0wI/L7sI1z2XCM7t/zgQGOVPICju
         87Mcl3//DFk/xhBGWZ8ylI8SBNo7vEcpRs9//FxgwajStZxDlaewPC2fohwVuQAYXs01
         hve5MuY8/gu6lSIzYinrI7q0a1pUHaw+1pMysRkYI4NmEbbiXzSEU7ub/SZtpqZuvyXE
         shKQ==
X-Gm-Message-State: APzg51DUO32bYfbP4NSl8NN1+TqXAF2+jbPwvZMsSkPVtN0B1SWp3277
	k64y/1rRBJkAfCOFYNxM8Pg7DfUU
X-Google-Smtp-Source: ANB0VdaRdotx7eEH/UCtHyaBz5purMHa319oZmd0SvfG9IdBQrefAYG/DNsWZFCflk/msY22GYtqLg==
X-Received: by 2002:adf:f648:: with SMTP id x8-v6mr7246942wrp.144.1535623356563;
        Thu, 30 Aug 2018 03:02:36 -0700 (PDT)
Return-Path: <leif.lindholm@linaro.org>
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id t70-v6sm1542154wmt.30.2018.08.30.03.02.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Aug 2018 03:02:35 -0700 (PDT)
Date: Thu, 30 Aug 2018 11:02:33 +0100
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
 <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
 <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: 43pb3bL6vSkD

On Thu, Aug 30, 2018 at 09:39:33AM +0100, Peter Maydell wrote:
> On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> > On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
> >> @Ard, @Leif, is there any possibility to remove all the DT nodes?
> >> On real hardware, how does UEFI find the memory size and CPU number?
> >
> > Usually by asking some form of SCP/PMU.
> > So until we have rock-solid multi-cpu-instance (making terms up here,
> > there may be a proper name already?) support upstream, we need to take
> > shortcuts.
> 
> I would expect that you'd want a "faked-on-the-QEMU end" SCP
> communications endpoint to start with anyway. We have one of
> those for vexpress, for instance.

Ah, I wasn't aware we did!

In that case - sure, that is probably the more sensible solution.
Does it emulate SCMI?

/
    Leif
