Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2764594wrg;
        Mon, 13 May 2019 05:50:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyQFwUUllBBxxj1VDntGk0Q5vlWs7tj0kIW4WJJbjqxdTebfA148AjK8GY5+m1xvpJhuqb
X-Received: by 2002:a17:906:1984:: with SMTP id g4mr21636063ejd.260.1557751859563;
        Mon, 13 May 2019 05:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751859; cv=none;
        d=google.com; s=arc-20160816;
        b=zGE0bs3IZ27iEzsaNued1Ssn9lOEtKXa7sBOkKP660mgE8G4qN67HB36BnJIOX8UEd
         SFYwHOAhRMD9foKdQMrakyyiNlffAAO8Js1Mg59L1vYMm30ik3tgrWjrtV8i8GNaPUiW
         iAjTlXicHScs5ZpIEzK3ARBzC0REjazqI68I9nPnLkAsrnEaHGKIAV758xkvCChOY6fg
         ccHxFGnRDMXzvpZr9O5QsnRSF3jc7LlN0dxHsosVUa0K/q7FO8QOYFUsBcyz97JgTUak
         TxM0JBwVDvbeRR9rihRMRWz0ANhdC7I/giXAsuqlMXnX40zFoCuUBLvQAg7ygvkagvrl
         qtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=SUb1xS0nYV2GoIpL/1h+WrFQv/R0mcL3EkinaatDP+s=;
        b=K1IIHItkr+8BtQ3M/IB542jQh6ZpGUc62YPlah1y4mTozlD5T7FW7eb3MlsJ4T8ExE
         906qTOr/+KWEvPDMWs6WTUeXttYM4qBTdm5VkMiHZMICW+BY+AfSalljYhXDUofc54nv
         /jGdDcDoHO4TZMwPMIdDzPqSu/QeTe3aLkZ+0qZn5mrcDW7bq7HJJK3gzG8Q6V2O9x92
         hJYHiGxN+lIGRFpP53gqpAwDAMr6mYW10TjOzPYZbtEArvsyQiKUqhEDDkJeY5oFP2Bf
         XJx22p5M14mDg25IjSUq8uMBRpAf7Ke/9TaSXr6yOOec/TH58GBiL8PeR5ie9DRPG3TX
         Ba/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id p3si7906833ejf.18.2019.05.13.05.50.59;
        Mon, 13 May 2019 05:50:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AC4780D;
	Mon, 13 May 2019 05:50:58 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFAF83F6C4;
	Mon, 13 May 2019 05:50:56 -0700 (PDT)
Date: Mon, 13 May 2019 13:50:54 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190513125053.GH28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
 <20190513111555.GC28398@e103592.cambridge.arm.com>
 <20190513123857.xjgwnkdlizdunlpz@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513123857.xjgwnkdlizdunlpz@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: sgLfVJ9CUMLt

On Mon, May 13, 2019 at 01:38:57PM +0100, Andrew Jones wrote:
> On Mon, May 13, 2019 at 12:15:56PM +0100, Dave Martin wrote:
> > On Mon, May 13, 2019 at 10:32:46AM +0100, Andrea Bolognani wrote:
> > > On Sun, 2019-05-12 at 10:36 +0200, Andrew Jones wrote:

[...]

> > > > The QMP query returns a list of valid vq lists. For example, if
> > > > a guest can use vqs 1, 2, 3, and 4, then the following list will
> > > > be returned
> > > > 
> > > >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> > > > 
> > > > Another example might be 1, 2, 4, as the architecture states 3
> > > > is optional. In that case the list would be
> > > > 
> > > >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> > > 
> > > I think the proposed QMP command is problematic, because it reports
> > > the valid vector lengths for either KVM or TCG based on which
> > > accelerator is currently enabled: it should report all information
> > > at all times instead, similarly to how query-gic-capabilities does
> > > it.
> > 
> > I wonder if this is premature flexibility?
> > 
> > The size of these lists is going to get cumbersome if the architecture
> > is ever extended.  Even today, we might need over 100 items in this
> > (nested) list.  If this is to be presented to the user this will be
> > far from friendly, it could get much worse if the architecutre changes
> > in future to allow larger vectors or more flexible virtualisation.
> > 
> > Could we just have a list of supported vector lengths and a possibly
> > empty list of additional capabilities that describe what kinds of
> > flexibility are allowed?
> > 
> > So, for example, we might support vector lengths of 1, 2, 4 and 8
> > quadwords, with the the ability to clamp the max vector length the
> > guest sees: the kernel ABI guarantees that you can do this, even
> > if you can't disable/enable each individual vector length independently.
> > 
> > So, [ 1, 2, 4, 8 ] seems sufficient to describe this in a forwards
> > compatible way.
> > 
> > Some day, we might report { "independent", [ 1, 2, 4, 8, 16, 32, ... ] }
> > 
> > I'm guessing about the data representation here.
> > 
> 
> I think that could work, and something along those lines even crossed my
> mind. Let's see what libvirt folk say. I'm not overly concerned about
> user friendless here though, as users aren't running QMP commands and
> parsing json by hand too much.

One concern I have is that if the architecture ever supports masking out
vector lengths individually, the size of this description becomes
something like O(2^n) in the maximum vector length, instead of O(n^2).

That could be very painful to deal with...

Cheers
---Dave
