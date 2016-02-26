Received: by 10.25.208.211 with SMTP id h202csp3231605lfg;
        Fri, 26 Feb 2016 00:22:14 -0800 (PST)
X-Received: by 10.28.137.139 with SMTP id l133mr1876104wmd.1.1456474934448;
        Fri, 26 Feb 2016 00:22:14 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id m79si2766825wma.108.2016.02.26.00.22.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2016 00:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x241.google.com with SMTP id b205so7785202wmb.1;
        Fri, 26 Feb 2016 00:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tyNbzd1EFoOuub+Ga3DeOKfBgE2Ah3/QOhb/pfbRdCU=;
        b=wKLrUD6DeibKZNK2zeK0uv/UdmAFDSGABJUZonE5JxNQi4Vp4/s3VWpbRbSt+VIR3e
         /X1S82Bu2M5UDZtPuRfXUJV2HGIaqqM5C9K0WmnDtj3hDeDrqAXUUMEnfI8z3ZZGQNtv
         ggRNNvqUHkgmuE8UFujgkbsCJ9stZ+GskubhtXvsUTyvsYRORWZSwldngWjoJVSnl301
         kM7isENPbeU74rcAWKlkPpNUWn7y4II18bpt0Y/AL6dmbEAM/kGPKKURzaluFNZZELvJ
         JI0Pnx226cm1MwkB/j52qiBw+h5wl8J0CKQNQ2zK2ThB3meSqlZn9Oxf+OloW0uXDVAD
         TOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tyNbzd1EFoOuub+Ga3DeOKfBgE2Ah3/QOhb/pfbRdCU=;
        b=HuVT1suV9r42+bR6wrspTMgc2ATF7cm87Ryu1dEIQ7RClKlMcX6qDNkBfniwAaY1qY
         hN/BGhk4r8Wvus3bjNfPMjxjiVtqNN7MikghNWJUNSCRVQBuW9LNtzS5SSglf/7eLKt4
         ihUtpalwJ0WWCkj1+KwZ6zGtVTOK3gAdwfTkeYUcAHU87DA+xOAdcExG4r4LAvmyguXD
         aJSavkTsWsDso5DEnBISG2C4G4mpd83rLSbBkqNDxY6SXn/+DOSeVZ3HTmoUA9/V9YNl
         JtV9nb/QCxEFBRqJT+sKyRs2XYklFEM+Q0ynV/esXAHpYyN6y6A9TFbL36JOTTwEvgpd
         ffMg==
X-Gm-Message-State: AD7BkJI/ImTvvqw2DtG3GQQkjsPtKmeY0ObeB8JLb3baAnoRR5/EfnlGeAKTx9N+nyuxkg==
X-Received: by 10.28.188.138 with SMTP id m132mr1761581wmf.29.1456474934175;
        Fri, 26 Feb 2016 00:22:14 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id c136sm1802754wmd.3.2016.02.26.00.22.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2016 00:22:13 -0800 (PST)
Date: Fri, 26 Feb 2016 09:22:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v2 8/8] target-arm: Use isyn.swstep.ex to hold the
 is_ldex state
Message-ID: <20160226082212.GB16305@toto>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
 <1455912292-23807-9-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA94S0eWzdUHBQ69PbRXgEJcvkSczU6qBE5FMboSfmxWZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA94S0eWzdUHBQ69PbRXgEJcvkSczU6qBE5FMboSfmxWZg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: 2wS6gQDaaTAO

On Thu, Feb 25, 2016 at 06:28:54PM +0000, Peter Maydell wrote:
> On 19 February 2016 at 20:04, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Switch to using isyn.swstep.ex to hold the is_ldex state for
> > SWStep syndrome generation.
> >
> > No functional change.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> What's the rationale for renaming the field? If this is groundwork
> for something else it might make more sense in a patchset with
> whatever is going to use this. Or is it just trying to make the
> swstep handling parallel the dabt syndrome info approach a bit more?

Yes, the latter. I can drop this one...

Cheers,
Edgar
