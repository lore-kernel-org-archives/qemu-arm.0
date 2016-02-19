Received: by 10.25.208.211 with SMTP id h202csp1147735lfg;
        Fri, 19 Feb 2016 05:12:31 -0800 (PST)
X-Received: by 10.66.252.100 with SMTP id zr4mr17581932pac.111.1455887551228;
        Fri, 19 Feb 2016 05:12:31 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com. [2607:f8b0:400e:c00::230])
        by mx.google.com with ESMTPS id b19si16534679pfd.242.2016.02.19.05.12.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 05:12:31 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::230 as permitted sender) client-ip=2607:f8b0:400e:c00::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::230 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x230.google.com with SMTP id e127so51118054pfe.3;
        Fri, 19 Feb 2016 05:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=YGzgjjmNphdZjGAx8AJ9nqbXUaxjPejfrje9UM46B1g=;
        b=Nmr0TET+liItBe7dmt1amaAIa/w5yHW/efxAvcTLQPCgZkPxJaNgTuFQ0plN58z/nN
         Ebvxiw/tO+3egqyqmuThHNgvYFQ2Fu1J2AIUqTEAYWI5z1Vx9JJk/HtR8epaj5ccRE40
         MowOTxq7ukmdo/YZdt2famguS3XGEdhC/7Ver9sHZre8n4XIHqblWEck1C6v0tDt3thq
         xTrvURcmz60MNhRTJ0riMqatItjgz6zrDKvfSXIZNPY1/vbse72gGjqoWLHC0SkgiG6s
         btV3v1y/A9Z8kCOPx4InPyehjZPrZQNz78biPHUHmLrgIDA3konEQkDLIKRf30sxkJzp
         zQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=YGzgjjmNphdZjGAx8AJ9nqbXUaxjPejfrje9UM46B1g=;
        b=YYoWxGDUtuQds86SQKyZhQ63EcAYk8JPFaHttDXK6xUZdfabIsuOl28iXTsno/e2/s
         uttVwAE0VnyyOR9726PcLbcGjU5NjJ0zYAGsN16Z5l4RlhIQr5hdH7LmHcLVrpuJ62Q+
         mhBVXzqV1q7NwIniuZ6e52Or1Z0dg+esJF9LzoDfkTZ2Bs2RcBqqhsulWfquTtuu8O8V
         rhbCj+HQnSlS/PnFdTXAP4HiasyozkRyGSPkIaPpMIEItFSvvTMRin272puVbwkl+Vht
         zGc0a4znlXwdRwSk8qSXGMkrd2t7+kTuHhBijDFwBEqtYjHi7tly3rEUQjGUJswJoWZn
         LS+A==
X-Gm-Message-State: AG10YOR7Zj12KPegTgEHrfGiWvJKLCok3eBN0CfTmbmlGpxTlCjKefeOfCz4sQY9fcgB5A==
X-Received: by 10.98.1.85 with SMTP id 82mr18236802pfb.10.1455887550902;
        Fri, 19 Feb 2016 05:12:30 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id k65sm17891359pfb.30.2016.02.19.05.12.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:12:30 -0800 (PST)
Date: Fri, 19 Feb 2016 14:12:27 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 8/9] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
Message-ID: <20160219131227.GB25623@toto>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-9-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA8VfyWn8t4jBAH3_ph1W7=FhPMr0Z+TEk9SXtv5Adv23g@mail.gmail.com>
 <20160218095654.GD4403@toto>
 <CAFEAcA99-ypB=cMvL8aQwwStbFquv5zUE0xfgKnkwGVaUvdkog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA99-ypB=cMvL8aQwwStbFquv5zUE0xfgKnkwGVaUvdkog@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: f2nd8Q0YJIMk

On Thu, Feb 18, 2016 at 11:42:17AM +0000, Peter Maydell wrote:
> On 18 February 2016 at 09:56, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > On Tue, Feb 16, 2016 at 07:13:32PM +0000, Peter Maydell wrote:
> >> I think this patch also would be simpler if the encoded info
> >> put in with the TBs was just the syndrome register, rather
> >> than some other encoding.
> >
> > My first try was to only pass the bits needed for the iss
> > (i.e not the full data abort syndrome). We don't have all
> > the info needed at translation time to create the full
> > syndrome (e.g stage2 trap? stage2 trap while stage1 PTW, etc).
> >
> > But we could maybe create as much of the data abort syndrome
> > as possible at translation time and then have the exception
> > handling code add the missing bits. We can then pass the
> > preliminary syndrome from translation time to exception time
> > in the std syndrome format. I can have a look and see what I
> > can do if that makes more sense.
> 
> Yep, that was basically what I had in mind.
> 
> Am I right in thinking that at translate time we capture:
>  IL ISV SAS SSE SRT SF AR
> and then at exception time we determine:
>  EC FnV EA CM S1PTW WnR DFSC
> ?

Yes. It gets a little messy due to the need to the clearing
of ISV (and related fields) and thus setting IL, if the abort
does not target EL2 but it's not too bad.

> 
> In that case I think you could reasonably have the info stored
> with the TBs be "template syndrome >> 14" (since bits [13:0] are
> all info determined at exception-time). The only reason for doing
> this is that the encoded data is stored as sleb128 deltas between
> lines so keeping the values numerically smaller should make them
> take up a bit less space. (I have no idea how significant the
> space saving would be.)
> 
> You should then be able to just have restore_state_to_opc()
> write straight to env->exception.syndrome rather than needing
> a new field in the cpu state.

Sounds good!

Thanks!
Edgar
