Received: by 10.25.0.23 with SMTP id 23csp366259lfa;
        Sat, 10 Jun 2017 22:07:31 -0700 (PDT)
X-Received: by 10.200.33.235 with SMTP id 40mr5266177qtz.189.1497157651467;
        Sat, 10 Jun 2017 22:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497157651; cv=none;
        d=google.com; s=arc-20160816;
        b=eWMvNCsbTGqspnCbcax5rtpmE3fkj3zxipca965Zg2HuJ1bCadykvmYgnuypQlCbpK
         008lLtzu9hBtguCN9AR7o2PboLUHuM1lW3tIh5JUxAZzl75ofz5UfuvAR1Mes96x8q39
         tnxIx5fzbI9hwC+pyj5nKBFnyB+o2HUE8VZm3mCylAfbQ1QHd3Gl0j233aYdtZ7onW4b
         gX/WwrULQ3qwZKcJ1cxJ2xpuJ9HBPTPq4WA0PDoxDC6nbzhGUKQTAECbGQxFnH01ivVM
         +sbtm6er7+FtNIrygK6oavrrvlNkfxPeg5tc77ge83ebw7V4lS8A4TEmtbFBa7vvkyYd
         1n/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=emKsi7Vk7PJEGBYxDFh67vbBQ+DRgEmQHtQrBabuaE4=;
        b=Us/sfrtqViRGk9NEUeuGTklBpa9Mxm+528xwuwqYpcuD3nTqAQoZGGUCBcoO/xXOXi
         ubehrAJxSTUEm+7x+VGCkplJUfPgf1o4vcdfUumVuU25F7yMDP1Fux61X04acREt1Ml6
         rEU8KixljgJClMXzO04NM9HRZswD/wV1HB3/p4INf/8fH540nLLZNGzf875pBlYjWLaP
         fIOejLACbIfKZWg/c+oYIWC2eOpp5RZNzUsWH4hT6o7z51e3tvubXAiKgiti5N6lV6kB
         wibm2MNfc2WdQli1OKizc5T1DVii7O+NsXzi0oMVjxQAZLqMRtdQDenVfAkc5eFXAZBT
         7qwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id y31si5455743qtb.221.2017.06.10.22.07.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Jun 2017 22:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E08A920B31;
	Sun, 11 Jun 2017 01:07:30 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Sun, 11 Jun 2017 01:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=emKsi7Vk7PJEGBY
	xDFh67vbBQ+DRgEmQHtQrBabuaE4=; b=nIst8cZssB0dmLh/DJ3wv3qpLyGohFZ
	IMe0We8Y8jplU72xt89JIBKaZ1B6t8OPxIADNxtGpZwyeChbj1M2a84D7g2MkgRX
	ZmWKIH4qWfBKtFn1kgB3iPVKkStDQmxffq+yrj5hXIT9WJSttlbHwZ+YzUeSCzM/
	1ddwLWGWXAr4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=emKsi7Vk7PJEGBYxDFh67vbBQ+DRgEmQHtQrBabuaE4=; b=EI+F5G1Y
	ajqiuXsF7cc+At75mIia8m64mlUFy68QrLWOP8UoSjiEhvIqL/r9j0Q83oamJaNj
	xiXUk+1qNZ2wnq0HutoNBkKtPgfZ3NfzVL9bkAOAZvy6qXZFc62Vy3gcJ9SRXbha
	oYhwyDiwRa6mmwVNqppGD91o2wWWmzODExm+eSNzafWdNTywezTMR0G66Q01iYts
	1GNbwQ44/tGv70GWm9DIH8I9J9Gqu91eM/5Dkp/3ux2gqCl3vuuJbXrvJ0Vu6YP1
	VDlDoSZNhIJOU++5crMzQIkiyMdeuSijMI8ykgoU1QVzt2Rqmx9fgpJun6UckLkC
	AgzUXtNPQ8WTxw==
X-ME-Sender: <xms:EtA8WdoF6K2-EUdR867SXnmjlQuvRz_7nzzsiTmJXAbhiGziAxi2Gw>
X-Sasl-enc: QQDEI6y6ZK4PNOA0bhEHOuJLGrwGLm/jVL+3fnBCvWH5 1497157650
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9F86D7E766;
	Sun, 11 Jun 2017 01:07:30 -0400 (EDT)
Date: Sun, 11 Jun 2017 01:07:30 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	peter.maydell@linaro.org, pbonzini@redhat.com,
	edgar.iglesias@xilinx.com, qemu-devel@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [RFC DEBUG PATCH 3/3] translate-a64: fix lookup_tb_ptr hang
 (DEBUG!)
Message-ID: <20170611050730.GA12317@flamenco>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
 <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
 <87vao4b4z5.fsf@linaro.org>
 <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: Oete9DX05rYe

On Sat, Jun 10, 2017 at 09:59:19 -0700, Richard Henderson wrote:
> On 06/10/2017 01:51 AM, Alex Bennée wrote:
> >I would agree with Emilio that we revert but I can't quite shake the
> >feeling we are missing an underlying problem. Would just skipping the
> >htable lookup (but keeping the tb_jmp_cache) be an OK fix for now?
> 
> I agree.  It seems like there's some real problem that this is uncovering.
> 
> Dropping the htable lookup is certainly ok by me.  If that's enough to
> un-stick your regression testing for aarch64 guest.

Unfortunately not checking the htable isn't enough to fix it for me.

I spent a few hours on Friday trying (and failing) to understand
what's going on. Regarding interrupts, I see *more* TB_EXIT_INTERRUPT
exits than without the patch, so my current best guess is that this is
a livelock kind of thing.

I'll keep digging, but regardless I think we should revert
e75449a346 ("target/aarch64: optimize indirect branches") ASAP, and
then reenable the feature ("revert the revert") once we get to the
bottom of this.

		E.
