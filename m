Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp579413ejy;
        Tue, 13 Sep 2022 11:58:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5lENEuPoycmOyROtGxQl4Xkcernq+lqJE7FSNvLjxUm0Xcgwp0Oma0rXiVQZgY+nqT1Z5c
X-Received: by 2002:a05:622a:106:b0:344:8b6f:23d8 with SMTP id u6-20020a05622a010600b003448b6f23d8mr29820161qtw.668.1663095515787;
        Tue, 13 Sep 2022 11:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663095515; cv=none;
        d=google.com; s=arc-20160816;
        b=x2YeSJvfQHPE9TlhfUK1L2ZnXWmAuq1Afq3/oTpXkEZ3YbLJP5dg3a6qrjFoSyPeu5
         KFojwMeS+EGK3Z8lPA0AP+lGLZyp+rxiO0M/66nscHcZmw519d850pVwgeIubktnsIoV
         GQ0XPIjEuBSspMXjIqZ6RR7PFQ5gedliZcTJlc1flxFs1/ipbQkfH2AcSfYt3X0Tu4Dr
         EeWjDBMoyQLBlYUgyLaKyZJd3WfXbmmEwhtYxNI1kYtwWNPp26vQOsYEUXaUhXYCX1sU
         FEz8rMW/BgY3IcFUk3n/C1ZYRistFkA7huzgqFY6gHELbRLoLe0bKX80qNM18gnS3Siu
         iEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=ldktJs3dK4asASNRzwExI/G0UuabdIWhRIxuInxS0/E=;
        b=A20LgMZ84mAMPY+wLqdHv0sD5qr2cV+WhIZivnK7KFYmrEnK/fiNf991JVj5173Nwn
         oTkJ6y6QGrDqHaSBR8ubrq4YrAhVgttZ7nGUZY2RSuPlOTb3/BjG4O6dxdoKWI8gTHWv
         koYz4MDe/yPA9ieH4+3LybAlCC0vdPVVkZZzyJgEStXzeufQh767OSrMCVZ5A3XroQ6R
         QDUsXoGFFx4GwGAvIT+7787pf2wkS7tNxVXMIIMrwidd8rw9dYgU+u/29Oj4v/QQkZMm
         p5nw/KyVOXwEVf2DLOCq+x0i65yB3zNzw9TdjjnSqDRFp4Opoy5dXA6b+IKa0NkFRi82
         QFXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b=rSfHSNnU;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=FUB7t1wF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu14-20020ad45cce000000b004a490fd6f5csi100169qvb.197.2022.09.13.11.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 11:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b=rSfHSNnU;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=FUB7t1wF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYB7D-0002sS-AR
	for alex.bennee@linaro.org; Tue, 13 Sep 2022 14:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oYAcu-00035u-B4; Tue, 13 Sep 2022 14:27:16 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:47759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oYAcr-0008Pv-Na; Tue, 13 Sep 2022 14:27:16 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C6295320083A;
 Tue, 13 Sep 2022 14:27:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 13 Sep 2022 14:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1663093628; x=1663180028; bh=ldktJs3dK4
 asASNRzwExI/G0UuabdIWhRIxuInxS0/E=; b=rSfHSNnUybAhWRtAmqW9IDxb+T
 cRc1p6ZMQOKkC096fXiKS9axQQemTTU1vlNlY3ntg8yM/0YjkF6676ObDtxhy2cI
 YHCTgI0nV3aIMinql0pgiC9F9Dba5B8QpZlL0Wsfxlr45yp/iNwmaaIsqVBMLp/A
 mtf3yZs3o2PzS4wHOl0PlhDeL7RWfD/4aLE1sFL6DCz0GPeaN7J5JA3CxCT+kk5p
 faFhmDLp0yxWURd7Ei+oVpKRj5fa+yAmnD1ByCwPWY5rRvICA+lWI4SMG8/Vjj6/
 YlO3Vf5Di6QBCS41Jxk+UzR1a/0Lb/2NrUriweWQhCWqiZIjJfWO74e6yc4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663093628; x=1663180028; bh=ldktJs3dK4asASNRzwExI/G0Uuab
 dIWhRIxuInxS0/E=; b=FUB7t1wFySujh8ScKakOwWPblplVXDvRZS5bdbgFXlxz
 ggYlYWa+nQojWoGapw+2FtMGLyfOI3kmkpqikMIGtcJ8EcJIrLgWV4J5EXEh4Ou8
 77qoC10ZdWvK7GlPZCp6nQwfy2+lGiBV/gzGX8Y4BXOtaDpd+RD7yreF0kX6D9FK
 nSM3LrDbHM1v63WV02IsTKzLALruPaI46F1XUWS2dKRSJFbRSk/cSOH9U0FjVK/g
 U2l0dsE5p/jsXm5K+VgF1FEAll/lm28D+V5E5QDcBPF5h1yztsPXIBzlOE6iMuqx
 hjnu4MCge0EFVLlMGZWtQqBtfAHzHba9jSsUs5E49A==
X-ME-Sender: <xms:e8sgY1IC-JmwnjnI3KhorWN8KLsqBhFKWHdyPHtbJj5fIOtI1MPh6A>
 <xme:e8sgYxLFPOiUqg9OAGL5uO_K7OxQj8c_YlO1BKFEWwrbYH_RvmpvNaz8X1k7Vl3Mi
 3BBkpmXG15yOayQmOc>
X-ME-Received: <xmr:e8sgY9ts5rp0DWAPJp6TW-VWzp3FMsvCCvqI2xuTMC6ijd3JHGPUXbo9ssee6WxoRamAExd6VULk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:e8sgY2aHsCKI5RAB1oiDsX-Vt7R8zv_Vb41cP9w3GpH6ym-0lAWMHA>
 <xmx:e8sgY8YOG-GDcMWFpSVbNGHmb1PEjRaDAY9fhZotOPpjgW3isSxlZg>
 <xmx:e8sgY6DKOfvc-PSzHi7Cv_EjCalxuOV1AJ1biQWsiSjiPg0t3zxoPQ>
 <xmx:fMsgY7w7tPkzm2FkqsjxsBSwxyj1XJ-NMQJc_ejDiqS51TOIp6EzNQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 14:27:06 -0400 (EDT)
Date: Tue, 13 Sep 2022 11:27:05 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com
Subject: Re: [RFC PATCH 0/3] Initial PECI bus support
Message-ID: <YyDLeX7vzwg5ZgZA@pdel-fedora-MJ0HJWH9>
References: <20220906220552.1243998-1-titusr@google.com>
 <YxuZ95ppk9lZ/23g@pdel-fedora-MJ0HJWH9>
 <CAMvPwGqjfRrvx7uv0PNQK14VMbjf1wEK_w2LaELL02f91srWBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMvPwGqjfRrvx7uv0PNQK14VMbjf1wEK_w2LaELL02f91srWBA@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AdkE1knKueVU

On Tue, Sep 13, 2022 at 11:20:57AM -0700, Titus Rwantare wrote:
> On Fri, 9 Sept 2022 at 12:54, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > On Tue, Sep 06, 2022 at 10:05:49PM +0000, Titus Rwantare wrote:
> ...
> > >
> > > This is something that can also be extended as other parameters arise that need
> > > to differ between platforms. So far you can have have different CPUs, DIMM counts,
> > > DIMM temperatures here. These fields can also be adjusted at runtime through qmp.
> >
> > That looks good to me, seems like the standard way to do it in QEMU.
> >
> > >
> > > A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
> > > gauge interest in what potential users would like to be adjustable at runtime.
> > > I've not written QEMU models that read config files at runtime, something I'd
> > > appreciate guidance on.
> >
> > This part I don't totally understand. I also barely know anything about
> > PECI.
> >
> > Is the register location for things different between CPU generations?
> 
> Some things seem to move between generations and others don't move, someone at
> Intel would know better than I do.
> 
> 
> 
> > If so (and I expect it probably is), why is there only a configuration
> > for Sapphire Rapids, and not for the other ones?
> >
> > Is that because of PECI protocol changes between generations?
> 
> I haven't dug into the other machines because of internal demand, but
> I've found that
> with newer generations, more features get used in addition to existing
> ones. It's
> possible these features existed on older machines.
> 
> 
> 
> > In which case, maybe there needs to be a notion of PECI version
> > somewhere?
> >
> > Also, I don't understand why it would be adjustable at runtime, do we
> > change register locations during execution?
> >
> > I would expect it to be part of the board definition.
> >
> > You could provide a bunch of sample configs for the CPU's that you're
> > testing for, and the board configuration could just select the sample
> > config it is using (corresponding to the CPU model).
> >
> > That's the model I would imagine, but I might be missing some important
> > context here.
> 
> I think it would be nice to have additional registers at runtime, at
> the time of writing,
> I don't know how much of the internal workings of Sapphire Rapids
> Intel is willing to
> share publicly. If users are free to separately define registers, I
> don't then get to
> worry about this. e.g. I'd like to simulate errors from the memory controllers.

Oh ok, yeah I guess making it more dynamic shouldn't really hurt
anything. That sounds ok then.  Also yeah, perhaps keeping the register
definitions separate for privacy concerns is necessary.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> 
> 
> Titus
