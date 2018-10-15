Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4926062wrt;
        Mon, 15 Oct 2018 13:44:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60QBZleoQJfc2PLyY+Mge6lM9oNoenyiuQy6ArdGxUxXQnIAWMgRdvBTJXLKcKJ4r5a1zJ7
X-Received: by 2002:a37:c683:: with SMTP id s3-v6mr17798883qkl.269.1539636281715;
        Mon, 15 Oct 2018 13:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539636281; cv=none;
        d=google.com; s=arc-20160816;
        b=bxERd0Sv2M0OQMExzqmQ/owjrusS2O4OfxuNQidsDyVmh0JTf9EfAMOUy1OM7ghkSk
         OWoQw3Y0ONld5+7+n1LdQM7hszla0b6Cb8I9JzlPzyRf+gjbn5GazpLNnHHgcSAsrH85
         NickkpSCRBNmazH+YsfjTMuuWEUsjCVnZBWcS/kGYArErfDFwBRvCLJTh/NQ/YPl1lLF
         /GWYH/6ss8UP1cvaN0FdsaPaKtO1JdH1vp0RLZ2RcJNRW/c5TXjXsq4qW6x8+gyL+4vO
         GeNS5qF3zsJHVMIf31sSqvTQs0ewffZ1AoCbKCmGu63FZlb5yzom7nBTFcjCao2BCVDL
         JyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=b8IZaJjdY99dY+Hp1pFuNPKPwDxyPxgMbPWBFzPfzBE=;
        b=YZqhysrBGYYSbPRunga6ehdeECdx0kzWa2O6TPR3f6kCDfw1KHhQyLz/+Nz7qpWCbQ
         es2uZa0vsELG2evaWDunkxyVly64WWij/WsM3PtMb3IFY1tJaWYMBimvSjTkCzvJ+KBO
         GnhSSLP+yly1HvrySUsiAv8oop3+8VFNyEA5MNzSi/IbxotLzTf8UvPglxBC/Fj8gv4C
         YZKeMU+vezXo9y9L0YvPAiRvInboM6gpSA/62zV4mHkmBvwEV7ze+1p0MelECy01ib8k
         aC6eJjEemEcUO9TYTLugjcXA2a8OO2LnMTw6nPRK9YTM87/DGJkZhadFe5Eh1VabOa02
         XgpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cKNY3zOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16-v6si9559737qtz.6.2018.10.15.13.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 13:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cKNY3zOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC9jF-000800-AB
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 16:44:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gC9j7-0007y8-6f
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:44:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gC9j6-0006zj-5E
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:44:33 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:34102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gC9j4-0006wJ-TO; Mon, 15 Oct 2018 16:44:31 -0400
Received: by mail-qk1-x741.google.com with SMTP id p6-v6so12767072qkg.1;
	Mon, 15 Oct 2018 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=b8IZaJjdY99dY+Hp1pFuNPKPwDxyPxgMbPWBFzPfzBE=;
	b=cKNY3zOGD7rFlnrd6dTS3VPA6SuBbDHB6OpEZryjyTLrDr/B05u3zn+CoSMACytB3c
	P7IdRzFY9qekLXUPjEmoM9D+srTpvyL0W7nClAjPODo0CGXozdEUMbkh2OHvnsN/QIlE
	/5X3/xLB0Tw2rzvh4sVlFiIrwBhYea6QzuqVsLz0mHFRA9E0EXJ89bJKjvuDbu/X4U3d
	zA4wSHAAJy2le822Qn4NB76T+QXSXvRgNj6XcAUyj1GVVZ0z5gC83NY1GGJmDToVP6XZ
	o1iKSPyokVKAOrWDu/OG3MeZ2NEx57qBY9ZSBIDJnUopLXFFhgiQx2xqLRpKF/dOsgR1
	m6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=b8IZaJjdY99dY+Hp1pFuNPKPwDxyPxgMbPWBFzPfzBE=;
	b=EVxnPit8u7uaaFdsMeZsvTWNlpFpNH2W1gHwzxjmehnKt10pwUG1T91zXaMkwUyvVG
	EE515pAhzgGPLcIZycdz2xvLbRStYD/aU0CPR2aOsBF929z3B5hRk5nTzxCWzfCwXxYM
	haUz2gPFfJvXLVPbDLgp8lS/AFunOMnfJU0b5o06iAT34M5GYLM+SOO4cQHcmQ0QTYKM
	nGk2qSaJZ+bh+NQgqwR1H2zfxczRyqhuq8nfq7U2YEhAo9QtBUcu4HcZbOZ4BwZ6R0PB
	PotfK2phyIBq2VLr/sOPvAqMY6nS96RTceAhZil7v1YiddjBR+0JZCtV65vWbAqLdveR
	q0LA==
X-Gm-Message-State: ABuFfojGNOZqVlGWNOEGls/9YlFeJOIMU6tk+5oDMCpeXdJ6nJ60o7NN
	tD9wOR8ZkEC979OMzpffE+0=
X-Received: by 2002:a37:1511:: with SMTP id
	f17-v6mr18392596qkh.245.1539636265594; 
	Mon, 15 Oct 2018 13:44:25 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	y7-v6sm5914731qkf.38.2018.10.15.13.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 13:44:25 -0700 (PDT)
Date: Mon, 15 Oct 2018 16:44:24 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181015204424.GK3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-5-aclindsa@gmail.com>
	<0e30ca6d-57f1-e67a-b9c3-dc5e4b703260@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e30ca6d-57f1-e67a-b9c3-dc5e4b703260@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/14] target/arm: Swap PMU
 values before/after migrations
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDw1VjP8RBG6

On Oct 15 12:45, Richard Henderson wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > +static void cpu_post_save(void *opaque)
> > +{
> > +    ARMCPU *cpu = opaque;
> > +    pmccntr_sync(&cpu->env);
> > +}
> 
> I'm confused about the need for this.
> Can you explain the sequence of events that requires it?

It sounds like you're more okay with this now based on your comments on
my later patch, but for others...

The PMU implementation is event-driven - the counters and other
associated PMU/sysreg state are only updated when needed to ensure the
architectural state observed by the system is correct (i.e. on system
register reads). Otherwise, the counters are stored as differences from
the underlying counts rather than the raw counter values themselves.
Upon migration, we want to convert the counters and other state to their
architectural versions, but then want to swap it all back to the
differential versions again when we're done saving/loading.

-Aaron
