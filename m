Received: by 10.25.30.65 with SMTP id e62csp699875lfe;
        Tue, 24 May 2016 05:39:12 -0700 (PDT)
X-Received: by 10.194.173.42 with SMTP id bh10mr4733326wjc.150.1464093552361;
        Tue, 24 May 2016 05:39:12 -0700 (PDT)
Return-Path: <christoffer.dall@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id m8si3923184wjj.170.2016.05.24.05.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 May 2016 05:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoffer.dall@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of christoffer.dall@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=christoffer.dall@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x236.google.com with SMTP id z87so22288150wmh.0
        for <alex.bennee@linaro.org>; Tue, 24 May 2016 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VoyKF+INDdFJFfyWENjqTKUiWcrD71T2yiKvq+oHJo0=;
        b=f4YSVvdKZ+0AhDUtpQr7mw0swXEi+eMl/gAQ2EZvomuvfHULwmvBCeD9z/SNTPzz5S
         tbaup/e2kuO0c71IioUn41CHsZIKy05VNLAt7Nj/iEPW+O4VPGlEtVjn5JSBWp0nZiXM
         Uv+vTPulTtqayL51Axe2aZI9v0HiN25EVPBfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VoyKF+INDdFJFfyWENjqTKUiWcrD71T2yiKvq+oHJo0=;
        b=D1N4SKKYaNcD3PDxscYOJj79TqjtlxnLiiGQho1qfAlUE2MXWdPsNptsarrPZ9yJ+8
         TnPNgq66jwSGrA4/HZp7VHb4pNb5m4N5Bjh7RrntBSPbjuaUdHCDg2RJ522oNzsJS2xi
         F7mA/x3ylm7iEzXanCZsQxK/jOS6W1AWhVG24UfHNCGJsxWS6bDBAtQlyBHPyQz6/X/z
         E4XqfF+Gpn3RKgoTVrWsLAmkfWqSGMwC/XkDQPTOGVqeMtQRsEj3J3Y/U2/KpZdavSvv
         x+VcJ82q2qXeAnMs0dKTB//6/6MA00sNLfSHN7P/uh95b0xLNJ5przKj5Si3UtONZkAH
         iYOg==
X-Gm-Message-State: ALyK8tK4JKTGqU6YA+hQcfTLIdiEc+aWq1pmv813lrdy3/ZS+IHTn+bO+O4nFMkngqp/+uk9zWI=
X-Received: by 10.194.116.9 with SMTP id js9mr4840368wjb.112.1464093551356;
        Tue, 24 May 2016 05:39:11 -0700 (PDT)
Return-Path: <christoffer.dall@linaro.org>
Received: from localhost ([94.18.191.146])
        by smtp.gmail.com with ESMTPSA id kq9sm3028621wjc.26.2016.05.24.05.39.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 05:39:10 -0700 (PDT)
Date: Tue, 24 May 2016 14:39:10 +0200
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
	andre.przywara@arm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, kvmarm@lists.cs.columbia.edu
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH 00/10] arm/arm64: add gic
 framework
Message-ID: <20160524123910.GD3582@cbox>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
 <20160518090714.GA3827@cbox>
 <20160523152423.2zc26na33jt2abdi@hawk.localdomain>
 <20160524115819.GC3582@cbox>
 <20160524122343.qw23iihg5c2eevi5@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160524122343.qw23iihg5c2eevi5@hawk.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: 8DT532aK7Kgu

On Tue, May 24, 2016 at 02:23:43PM +0200, Andrew Jones wrote:
> On Tue, May 24, 2016 at 01:58:19PM +0200, Christoffer Dall wrote:
> > On Mon, May 23, 2016 at 05:24:23PM +0200, Andrew Jones wrote:
> > > On Wed, May 18, 2016 at 11:07:14AM +0200, Christoffer Dall wrote:
> > > > Hi Drew,
> > > > 
> > > > Thanks for doing this.  I'm happy to see some tests for the GIC.
> > > > 
> > > > I've been pondering with how to write unit tests for all the MMIO
> > > > implementations.  If you have some thoughts on how that could be easily
> > > > fitted into this framework, that would probably be a good place to do it
> > > > ;)
> > > 
> > > Hi Christoffer,
> > > 
> > > Sorry for my slow response, I've been on vacation. For MMIO
> > > implementations, are you referring to the emulation done for
> > > gicv2 accesses and for gicv3 legacy accesses? And, if so, is
> > > your question how we might be able to use the same test
> > > framework for both? And, if that's so, then I think this series
> > > gets us pretty close already. If I'm completely off-base, then
> > > please give me a quick high-level description of what you'd like
> > > to be able to do.
> > > 
> > What I meant was testing all the MMIO accesses to the various
> > distributor MMIO regions.
> > 
> > For example, writing full words to all registers (some value) reading
> > back the value, correcting for RAZ/WI semantics, and testing that byte
> > accesses to those registers where that's allowed also works.
> 
> OK, understood. We can build a table that describes each distributor
> offset's allowed access types and expected read-back results for the
> "default enablement" of the gic. Then, we'd run through that table
> doing a refresh of the gic enabling before each offset test. This
> series provides everything needed for that, except the offset table.
> It should be pretty easy to add.
> 
> Now, configuring the gic differently will result in some offsets
> producing different values, so we'll eventually want to extend the
> table to check the same offsets using different gic enable functions
> as well, but that would be pretty easy to do too.
> 
> > 
> > If adding that on top of this series sounds like a good idea, someone
> > should add it to the bottom of their (presumably already long) todo
> > list, myself included.
> 
> They do sound like good tests to have. I've added it to the middle
> of my long TODO. If somebody beats me to it, I won't complain :-)
> 
Awesome, thanks!

-Christoffer
