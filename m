Received: by 10.25.159.19 with SMTP id i19csp1776273lfe;
        Tue, 26 Jan 2016 04:06:08 -0800 (PST)
X-Received: by 10.66.141.71 with SMTP id rm7mr930393pab.32.1453809968392;
        Tue, 26 Jan 2016 04:06:08 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id p13si1638600pfi.234.2016.01.26.04.06.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jan 2016 04:06:08 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x242.google.com with SMTP id n128so8139818pfn.3;
        Tue, 26 Jan 2016 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=3Z2hXSaQMJEEyx8vk5bGOAxTDV/pexsJO7MWG8f+Als=;
        b=MRpMDGWUNHhcsc7WX2parP7uq2hR8Jb8u164VY3G5U5Z/dYuGXyrktzA4bBm0ie1UF
         afSzl4aKQP0BbQF1SuGhzOE1r5rHd4gd9dl11ONjAijFz9BcGOi7OatRX8kDiVOt/Tv5
         xVs6mtYBu+LSIzzTS7yBDbYh5Kp/uITzJp9xv4OKxo2k2Rg0eiYtLxWhpItn6wq/LfGV
         yD2A4lXRAa43mib6Pw2gnFN+tfLDEUIa3u7U50RGMhUWJdmGBKuQT/WIA639fNHmkxrN
         +w/h1H1vbltoeVtSAq9+pW43RrpG7tbiTbfcOMvN0zJZcN0hsK8zh0fcSonbDvb6MgC9
         OJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=3Z2hXSaQMJEEyx8vk5bGOAxTDV/pexsJO7MWG8f+Als=;
        b=cnJ9vZyR6S8IghHTgQKEZnObbtpIMjmVj7nHzIXtyM+Rk6oBCgpND9kyYV0YBbAw75
         wODJyyBytpyfww4KySe01VoS9L6tuQWftoKEUdZAol9QgDYZjRowg4nG+x7HRAftel2k
         rIY0XenZJOUCtJty8/Ux7w0w347Ndw8N8VR2cdRj5zNzuDVKHkOSX1WVEo26pdGipPl5
         oZI4aSCXypyebR69hcT1D775w/5K2tJamHyX98WfJiWgrv/Pz1tv6pEBRu9RWMXmOEJi
         CXZBhRfDpCitVgrs2TMjYt+54w9ToZXv8JetAOfHLiB56J8p19lRJQvvpIo4jOINTiq5
         +Qtg==
X-Gm-Message-State: AG10YOTQ7ucq2sKXdMV5vohJzHAX2EU1dqiw6KAaxyKyiubC7U4Fc/NQJNel6RiHQBiGcQ==
X-Received: by 10.98.72.200 with SMTP id q69mr32672320pfi.159.1453809968042;
        Tue, 26 Jan 2016 04:06:08 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id p87sm1538324pfi.94.2016.01.26.04.06.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jan 2016 04:06:07 -0800 (PST)
Date: Tue, 26 Jan 2016 13:05:22 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v3 3/3] target-arm: Implement the S2 MMU inputsize >
 pamax check
Message-ID: <20160126120522.GA8630@toto>
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
 <1453456243-19879-4-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA_XE9vDZ-uu6WezP7-aFr2n8DJPMf3eV2AVCjzy-pYvFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_XE9vDZ-uu6WezP7-aFr2n8DJPMf3eV2AVCjzy-pYvFg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: Xo/PHDvjsNgj

On Mon, Jan 25, 2016 at 12:57:41PM +0000, Peter Maydell wrote:
> On 22 January 2016 at 09:50, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Implement the inputsize > pamax check for Stage 2 translations.
> > We have multiple choices for how to respond to errors and
> > choose to fault.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/helper.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/target-arm/helper.c b/target-arm/helper.c
> > index 2a6fa94..8901762 100644
> > --- a/target-arm/helper.c
> > +++ b/target-arm/helper.c
> > @@ -6809,7 +6809,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >           */
> >          int startlevel = extract32(tcr->raw_tcr, 6, 2);
> >          unsigned int pamax = arm_pamax(cpu);
> > -        bool ok;
> > +        bool ok = true;
> >
> >          if (va_size == 32 || stride == 9) {
> >              /* AArch32 or 4KB pages */
> > @@ -6819,9 +6819,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >              level = 3 - startlevel;
> >          }
> >
> > -        /* Check that the starting level is valid. */
> > -        ok = check_s2_startlevel(cpu, va_size == 64, level,
> > -                                 inputsize, stride, pamax);
> > +        if (va_size == 64 &&
> > +            inputsize > pamax &&
> > +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> > +            /* We have multiple choices but choose to fault.  */
> 
> Can we say specifically "This is CONSTRAINED UNPREDICTABLE and
> we choose...", please?

I'll change this for v4.

Thanks!
Edgar
