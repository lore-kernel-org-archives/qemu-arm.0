Received: by 10.25.208.137 with SMTP id h131csp811245lfg;
        Fri, 29 Apr 2016 04:54:12 -0700 (PDT)
X-Received: by 10.28.178.129 with SMTP id b123mr3595325wmf.76.1461930852742;
        Fri, 29 Apr 2016 04:54:12 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id h201si3748970wme.86.2016.04.29.04.54.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 04:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x235.google.com with SMTP id e201so24495316wme.0;
        Fri, 29 Apr 2016 04:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m+pnkp3fm20qvaQvmTFLJ3gBrr0QaNFntGq/B8tumds=;
        b=CZMN1PBA8wLscJnG9yWpauNoiTGKZUhVch4UHz6IOhZABJQmxyS9qxNaVEUg2YpqeE
         lwnRlSZjA6SV0W/fyi/JdY+lSrUPU+9fCGwsGY8Gx8boV3UG65ccGFf5szCsPaxYly6F
         dG6Eo36DG5wO0e5Dqo7COizsvlUVZrVwYTw0QK5fjOS40dWtnsjberhGA6D5ONoSxTcY
         JKO6SYGZCSVYTfB1FG/wXLmnJG7y6QbW93TH18Ulopivq+PnNe9oKZxSGGhIOlbUwYQi
         ysa2JcXSH5RnWPx7tFEaUu/5uxoP7Zyd/TmLDCXFwsyTw4Zql5hPuN7e3ZRXKhzWt1jm
         Fy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m+pnkp3fm20qvaQvmTFLJ3gBrr0QaNFntGq/B8tumds=;
        b=X5WzafaTtau5jL0AifAyx/ZF1jUMhRi//I5TAtFbo2nY1OVNfh5hy49gP2HzFhMKxS
         DfukkcueB8XI93PPGyVH8x/Rwuu4wUUAryeS2GQG9/O2oDWZ4+qPW8deEA5VhgN6MWo/
         OhSdVyCRceW+oNxLTwsHYD7oEyaRF7BDIP9Fzm1RAUbBySOl4+ZfH1nf6JSEgmgrIcUi
         E+n6gbjZzFJC5lrNUk5pYTccRzaRzbvZ3srXQ++Fu4VDhDnXUwo2DaV11TyDZJ5kr78b
         A6Rr84i/2zc2YqDthO28ftHkhCXrk9ZYpJuPrahpTXPTpQClgtfEGRU+qGx0w9t2dK6e
         nRFg==
X-Gm-Message-State: AOPr4FVeQ7iD8zCt99YSUPQJgXCi9A7/0/QskWSGogDG/R2XWyc7JpHHWozncY7/MTYi6A==
X-Received: by 10.195.13.135 with SMTP id ey7mr21189271wjd.161.1461930852460;
        Fri, 29 Apr 2016 04:54:12 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id y3sm14429613wji.40.2016.04.29.04.54.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 04:54:11 -0700 (PDT)
Date: Fri, 29 Apr 2016 13:54:10 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v2 4/8] target-arm: Add more fields to the data abort
 syndrome generator
Message-ID: <20160429115410.GW16305@toto>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
 <1455912292-23807-5-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA9c7OAF1Lqw1=xd3n+ipuYvo_9AW42wW0JwXM+L4e8iww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9c7OAF1Lqw1=xd3n+ipuYvo_9AW42wW0JwXM+L4e8iww@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: RzCEAUss8mdC

On Thu, Feb 25, 2016 at 05:41:00PM +0000, Peter Maydell wrote:
> On 19 February 2016 at 20:04, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add the following flags to the data abort syndrome generator:
> > * isv - Instruction syndrome valid
> > * sas - Syndrome access size
> > * sse - Syndrome sign extend
> > * srt - Syndrome register transfer
> > * sf  - Sixty-Four bit register width
> > * ar  - Acquire/Release
> >
> > These flags are not yet used, so this patch has no functional change.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/internals.h | 20 ++++++++++++++++++--
> >  target-arm/op_helper.c |  8 ++++++--
> >  2 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/target-arm/internals.h b/target-arm/internals.h
> > index 34e2688..4e9d9f5 100644
> > --- a/target-arm/internals.h
> > +++ b/target-arm/internals.h
> > @@ -383,13 +383,29 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
> >          | (ea << 9) | (s1ptw << 7) | fsc;
> >  }
> >
> > -static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
> > +static inline uint32_t syn_data_abort(int same_el, int isv,
> > +                                      int sas, int sse, int srt,
> > +                                      int sf, int ar,
> > +                                      int ea, int cm, int s1ptw,
> >                                        int wnr, int fsc,
> >                                        bool is_16bit)
> 
> Everywhere we call this (both now and once the full patchset has
> been applied) isv is a constant (either 0 or 1). I think it might
> be cleaner to define both a syn_data_abort_with_isv() and a
> syn_data_abort_no_isv(). Then the no_isv version doesn't need all
> the arguments that are zeroes.

Hi Peter,

Finally getting back to this :-)

In v3, I've added two separate functions as suggested.

Cheers,
Edgar
