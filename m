Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp221698lfq;
        Fri, 11 Dec 2020 08:13:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHvH2zG2Pphzh9TGg9871wESxDpWfD+D2IYS9WHw1NXpFEFlsVwS/3NyEdnmJZ3GlH5NSb
X-Received: by 2002:a25:ac1f:: with SMTP id w31mr20049906ybi.87.1607703215564;
        Fri, 11 Dec 2020 08:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607703215; cv=none;
        d=google.com; s=arc-20160816;
        b=Y987DP06sq7T0PEd7t92xiibfk79+ffVSu+NQkxp9Jt95v2Eblx57jizjBrVAMJDpl
         GGq8jcwUedn9UfKkABCkwtY95rDr6SL8fuNUCjJIn5iU4O2EXZWZkpMgUhM4X1L24q/B
         aUHUq8myrl8vCDXX/3h9+54xK1NghjO+4CgsUQ+5I5IhOmWp3vrZ0MdFi+Cl+HLKz0Jx
         X1oMPjCmi07PzD73qBJ51LE3Q1+4DqRHR/6FF1LKZna2OCg2Y97HCL98T1Jwci1dxPXL
         0ANNrLXoQC7meCyRPbKL4Qih4CH6wPE4y+RfnGFc0gyGm1AIPfmlfdjVR7ZRuLiHPjgi
         izOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=yfiohLCTMgGp+FvYC1C9dXLrbSF2LxBg9B71c6GrX8I=;
        b=VNcT496jSCC69Uq5L+iGUh3MaXeb/Zd0EsjPAbZObWiYTM5xeVG6OVx8vW46nHMb+u
         Nsro3LiRm12QEAIssLFwaYe/HqjK15lwdh8d2ae4MaEYsOWJXfzr0mtvsmvgrqMGDmsm
         +eAcT1EgZ4i1l5CoOUv5qN+ZScoxMRPCb35fWgkxCx28d+WCzY7IJgjdCcaXb/YqhGBf
         fEyy5f+ryrsNGPvwG8hRFVvChztzGISoIsO8spW6YWBmZ9uX5PCpQ+gUJ3b2yJnRzXcJ
         C6e2Sb07WLAP1PjHOpG+uqINTNtyF0JHvY2LGtI2J2/LnPWEaFa7loBxHqZp3NQQxEW4
         YUjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Qf0SFjJ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g32si10538159ybe.67.2020.12.11.08.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 08:13:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Qf0SFjJ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knl30-00060g-TH
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 11:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1knl2C-0004fV-9P
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 11:12:44 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1knl28-0006fU-Ow
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 11:12:44 -0500
Received: by mail-wm1-x344.google.com with SMTP id e25so9099365wme.0
 for <qemu-arm@nongnu.org>; Fri, 11 Dec 2020 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yfiohLCTMgGp+FvYC1C9dXLrbSF2LxBg9B71c6GrX8I=;
 b=Qf0SFjJ8LqX6VUuDD3w/3IsIe8dTad889MQCVp/46BEq/BrrKpYpCOjZp/RI5XriJA
 AChh1uJcQnvyuhHZNMp3lt4aStsTA/8M+XvD5aG8CvqcAsCgT+6OaIF8dZCPNpnX1Y4Z
 Hfx0rMki9jBZtxhQ7MMvQ39v+81ekKfjbYgc/bc4Ww3c53qlThop0zR9oexUFatyZsQl
 mQyAsmpjO/dp3wgi9SbibBdW6u7hGZAFRLxhdI7Ko00/gQK6ydnu9rrnBNPHmYibZkpS
 54tW4RClfyRBnJYT5vYso44ku4GR3GudkJ/udg24PjUHrO9wvLxJ31SJZMAjycpEG+Mq
 vRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yfiohLCTMgGp+FvYC1C9dXLrbSF2LxBg9B71c6GrX8I=;
 b=YpD6cVScxChxieiBL6oOLqLNW1xsbF7Dgg2D/WChHXGVABN0PHtzZUg7mmCkJd0pdp
 jmSimqKtKWOQmHzKkCw+GZ+HN//XRGWjgvH4o4vC8MQywEdWK0VXIpEsRYh5ZNQq01gH
 Ojqj7Jc0IfCuDOyLhljJDlHlqfntmDjtNMLZ5GskOeARAFVvjd8Dj18ehMJqmhY2CiF0
 y3rjN8EnvoJGLYxP5Mgcy4fgrsgS1n8vlBBktCuynjEYbHRZV+NDBfZtu++t9UjnwFvy
 aF2hfdi3OL/f/fQdTAro4mK2I59VUMWzpxx2W25XgJMGaOz6l770IJSTVSpQ39zxcd7V
 ax2w==
X-Gm-Message-State: AOAM532yjXTTNnkZDyoh/9+VwNAULRFpauJcRZk5Vz9lnqDgZ5L7cvgp
 SicQyycGdYt/q20Etc/D+8+oQg==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr9249579wmb.15.1607703159009; 
 Fri, 11 Dec 2020 08:12:39 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id c9sm16117983wrn.65.2020.12.11.08.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:12:38 -0800 (PST)
Date: Fri, 11 Dec 2020 16:12:36 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201211161236.GT1664@vanye>
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-4-leif@nuviainc.com>
 <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /sgo3qLhaMbg

On Fri, Dec 11, 2020 at 14:45:55 +0000, Peter Maydell wrote:
> On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >  target/arm/cpu.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index b54d1dc092..5e9e8061f7 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1713,6 +1713,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
> >  /*
> >   * System register ID fields.
> >   */
> > +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> > +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> > +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> > +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> > +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> > +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> > +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> > +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> > +FIELD(CLIDR_EL1, LOC, 24, 3)
> > +FIELD(CLIDR_EL1, LOUU, 27, 3)
> > +FIELD(CLIDR_EL1, ICB, 30, 3)
> > +
> > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)
> 
> The ASSOCIATIVITY field is bits [23:3], so it's
> 21 bits long, not 20, right ?

Err, indeed.

> > +FIELD(CCSIDR_EL1, NUMSETS, 32, 23)
> 
> Similarly, NUMSETS is [55:32] so 24 bits long.

Sorry, brain must have taken holiday.

Would you like a v2 of this patch, fixing those?

> > +
> > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > +FIELD(CTR_EL0,  ERG, 20, 4)
> > +FIELD(CTR_EL0,  CWG, 24, 4)
> > +FIELD(CTR_EL0,  IDC, 28, 1)
> > +FIELD(CTR_EL0,  DIC, 29, 1)
> > +
> >  FIELD(MIDR_EL1, REVISION, 0, 4)
> >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> 
> Any reason not to define the other fields here?
> FIELD(MIDR_EL1, VARIANT, 20, 4)
> FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)

Those are just context, not added by this patch.
(Glad to see I'm not the only one making that mistake...)

Best Regards,

Leif

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
