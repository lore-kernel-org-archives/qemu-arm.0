Received: by 10.25.77.4 with SMTP id a4csp363924lfb;
        Wed, 15 Mar 2017 08:22:59 -0700 (PDT)
X-Received: by 10.55.18.158 with SMTP id 30mr3569591qks.123.1489591379011;
        Wed, 15 Mar 2017 08:22:59 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m67si1634048qkl.180.2017.03.15.08.22.58;
        Wed, 15 Mar 2017 08:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 49BA740284;
	Wed, 15 Mar 2017 11:21:22 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GK9M5ZzRg-PL; Wed, 15 Mar 2017 11:21:18 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 39ACA40296;
	Wed, 15 Mar 2017 11:21:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3838640190
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 11:21:17 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X+4jGUvmUSBw for <kvmarm@lists.cs.columbia.edu>;
 Wed, 15 Mar 2017 11:21:15 -0400 (EDT)
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
 [209.85.128.170])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id B211640187
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 11:21:15 -0400 (EDT)
Received: by mail-wr0-f170.google.com with SMTP id g10so13332053wrg.2
 for <kvmarm@lists.cs.columbia.edu>; Wed, 15 Mar 2017 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e9sluZCcDF5uVrbf5L/5YPB0513qg4RHas/xsEjMfHk=;
 b=TqjdDdniknNqXg3cUgr1b+RGW8IGPK+b/c9xIzvJ3/PZ1KiB7x9yapTwFqD/WXjVwa
 D0vgDHJ5K1GAZavykaf39Ik1D3Nc9WrouuXvTqplBaVBw07VYclDp95DeqOVszHkIeIp
 K29uJEWGb/GrwZhtLvch4GmjoJkaw3W6G2TAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e9sluZCcDF5uVrbf5L/5YPB0513qg4RHas/xsEjMfHk=;
 b=GPwC2klulx+DzYpYO59bw0n2SjmyRrBnzMC5QBcdId1OeazBhX/9YgTyVl6yr9mjOk
 fApbXQ/JJtVPLXN+cbzCgpC33MwINbWTvWRgBcSTRqzuO+xinvRtNv/vS8IVqqagFxAz
 UXg2cD6kyh3gGkcFB7I8s/nAXB6NAPEYFAR8jHNcUHudBo8qaYs/lGujDu3l8faYkHGJ
 5tLGu+f2Rqd3gLzTz/fG/jmN2urZH/1tySENWdZgRK/FKQ2bfO4MGVFVcMzxurtiX/za
 siNcTqUGAR4OpPZAm4hkPE/a9OFQQ4Iv0j8diEeQabDtKTcEqMJf5XK70QrqtjBaWzBf
 +/wg==
X-Gm-Message-State: AFeK/H0ud38lWleGhObKMFtpFyL2TfYB39BSVcBPyK9v9/X6FyPdR1Do0TaRYVTaEZOo7E6B
X-Received: by 10.223.177.148 with SMTP id q20mr3654142wra.154.1489591369470; 
 Wed, 15 Mar 2017 08:22:49 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
 by smtp.gmail.com with ESMTPSA id 136sm842584wms.32.2017.03.15.08.22.48
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 15 Mar 2017 08:22:48 -0700 (PDT)
Date: Wed, 15 Mar 2017 16:22:37 +0100
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous system
Message-ID: <20170315152237.GR1277@cbox>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
 <20170128145551.sknp447ieue56xgo@hawk.localdomain>
 <20170315115044.GO1277@cbox>
 <20170315125113.erfl2gk6fwmbccsn@kamzik.brq.redhat.com>
 <20170315133645.GQ1277@cbox>
 <20170315140633.jtultotyihql7qlr@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170315140633.jtultotyihql7qlr@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 3JYKQFsBAxyV

On Wed, Mar 15, 2017 at 03:06:33PM +0100, Andrew Jones wrote:
> On Wed, Mar 15, 2017 at 02:36:45PM +0100, Christoffer Dall wrote:
> > > If QEMU wants to know
> > > whether or not the host it's running on is heterogeneous, then
> > > it can just query sysfs, rather than ask KVM.
> > > 
> > 
> > Can it?  Is this information available in a reliable way from userspace?
> 
> I don't know much (anything) about it, but, afaict, yes. See
> https://lkml.org/lkml/2017/1/19/380
> 
> > > > I'm sure I missed some aspect of this discussion though.
> > > 
> > > Me too. As we discussed, it's probably time to try and hash out a fresh
> > > design doc. It'd be good to get a clear design agreed upon before
> > > returning to the patches.
> > > 
> > 
> > Yes, it's on my list.
> 
> I'm happy to help with this, even to take a stab at the first draft. Just
> let me know if you or Shannon prefer to do the draft yourselves. If you
> don't have a preference, then I can start working on it pretty soon.
> 
I'd be really happy for you to draft a new design doc, and I can review
in private or publicly first as you prefer.

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
