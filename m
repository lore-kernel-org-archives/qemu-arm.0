Received: by 10.25.208.211 with SMTP id h202csp511682lfg;
        Thu, 18 Feb 2016 01:57:02 -0800 (PST)
X-Received: by 10.98.12.8 with SMTP id u8mr8715057pfi.36.1455789422304;
        Thu, 18 Feb 2016 01:57:02 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com. [2607:f8b0:400e:c00::233])
        by mx.google.com with ESMTPS id qp8si8401515pac.229.2016.02.18.01.57.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 01:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::233 as permitted sender) client-ip=2607:f8b0:400e:c00::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::233 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x233.google.com with SMTP id q63so28618449pfb.0;
        Thu, 18 Feb 2016 01:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=smWBdVo/TNw9K6wR4PPWKjapTjE++UEsUMoT63Nedbo=;
        b=njnn4TzCN93KyDT8f/LAJl/Yq062SP0q0lHkkwzIACiBSF2oWNR/+m3bqUiwq2eySp
         KGhhwOurpuMQUCzPAHbt5CK7CubGjzlSwMmmjHZMRSrsFWpmcItgK/1NEErREgP57ZT1
         4U3oC73FuEUgCRvUNcPW6gFcqXC9YIbUD3ckQwc/SdFj91migsLoCGXGb51qtkhM+7JM
         QHOiOm/VC9CvwUK39rr3cRtblGvchlOUVNgALcANz8rNWuSkcUBzh9tEm2cXplzBxxkg
         /Nxv5q3c2IXaeNbilBX4BTAbe0tB6oifGpjbJ1tmQXs54K1a2sbfsXt3aHkxcvzLn6lV
         ao5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=smWBdVo/TNw9K6wR4PPWKjapTjE++UEsUMoT63Nedbo=;
        b=b8jtL81kBH+bRvucXjPz9hFIc+RwkxT21rkCpud6rWMT36IAdfLMncdFTcxL6Y4pcR
         71i9JovpfUfH6aJi7BIsQDooM4tb9xRptOHu8SBmHb40YOxyi4Y4q9vtXcG4upZNyCfi
         96NXutdS/ScqpJbJjjZrPGkv5e7dxqFAcqGsE6zpxz3FrrU/VG4thTcJkEOkQFQCwLxH
         GYjlmknoVe+vC2R3cisoxbJrsLpxEyyKdPCs9lKPUfiX3qao73ZH5uftSENNsMlOvPzw
         Z40SDkAHKSWzZnV2SGrqGXdgy6HCzQTVYXsExsOgxoiaPynLYfnbvLtHjJh6dVzoEGz8
         Nnfw==
X-Gm-Message-State: AG10YOQcDT2fJWxhCPI01/ZEHIJDxwxOGqATU1nqoii4w7gqXzKtqwNFj8FPPqLZ+ksing==
X-Received: by 10.98.72.77 with SMTP id v74mr8746994pfa.33.1455789421937;
        Thu, 18 Feb 2016 01:57:01 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id xv2sm8862284pab.10.2016.02.18.01.56.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 01:56:59 -0800 (PST)
Date: Thu, 18 Feb 2016 10:56:54 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 8/9] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
Message-ID: <20160218095654.GD4403@toto>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-9-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA8VfyWn8t4jBAH3_ph1W7=FhPMr0Z+TEk9SXtv5Adv23g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8VfyWn8t4jBAH3_ph1W7=FhPMr0Z+TEk9SXtv5Adv23g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: qIxZw+JmYfH9

On Tue, Feb 16, 2016 at 07:13:32PM +0000, Peter Maydell wrote:
> On 12 February 2016 at 14:34, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add support for generating the instruction syndrome for Data Aborts.
> > These syndromes are used by hypervisors for example to trap and emulate
> > memory accesses.
> >
> > We save the decoded data out-of-band with the TBs at translation time.
> > When exceptions hit, the extra data attached to the TB is used to
> > recreate the state needed to encode instruction syndromes.
> > This avoids the need to emit moves with every load/store.
> 
> I think this patch also would be simpler if the encoded info
> put in with the TBs was just the syndrome register, rather
> than some other encoding.

My first try was to only pass the bits needed for the iss
(i.e not the full data abort syndrome). We don't have all
the info needed at translation time to create the full
syndrome (e.g stage2 trap? stage2 trap while stage1 PTW, etc).

But we could maybe create as much of the data abort syndrome
as possible at translation time and then have the exception
handling code add the missing bits. We can then pass the
preliminary syndrome from translation time to exception time
in the std syndrome format. I can have a look and see what I
can do if that makes more sense.

Thanks,
Edgar
