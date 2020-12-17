Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1231062lfq;
        Thu, 17 Dec 2020 04:31:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7Up7gg7fj67OOEh2Iv/DnGsCaQGXto471/lL2rKjgg1OGxDjbLRT8VBbrA2gH9/Nf8d2L
X-Received: by 2002:a25:4744:: with SMTP id u65mr61366566yba.239.1608208291163;
        Thu, 17 Dec 2020 04:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608208291; cv=none;
        d=google.com; s=arc-20160816;
        b=pKRnXsFG+AWUKbwuVRf7Hw6N8FnhdZRw5aaycfzarpQWWFK/WLucSXsm0wIMzozUDQ
         71fcIYjdkGE0znuks3kWWthZ0aFTF0tkHdhUnBea9sVBIQI8Lw/5qt2Y5CZz+49W4JkN
         OegLQCDI2Ex866XWBsdSctDm6kGkZT8z1TrWah78fklCUs+Q+kbiMyRczCV4W7UvrEdw
         fCFHQ6kLBytDJAx49IX5B4ysc09PrGQdBO8WYwsXLjrRFIY8Y1lqPMc2fHSS+WuDn121
         SaeekK8lwh2Fwi9s2OaMRahJER0N/ggXsvNZAWnSkFLCgUt/6WdbDwnI3dK1jY/xfaLj
         CaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=NICYJ84iNjSbyA70NzDal6wSVK+nv8bpRKs0LGU3at4=;
        b=PxUrtSXMzhI9VHvaNceOd8ffWfLHbELtD35+S7AiB2pOzjiSQELLwhKuoA7EUGpeX0
         bsuCCVFO5bZJlJ/8J2fO8hXsJKRPuQJRNWwt1BBZ1iUFmL2MJBUEazrWBWKVNHTZ5Kko
         2CG3Zgwc/IyjRNAxK30t+dIwO0DEXABTtrHd1z6DjUhFFppAEXrj6PJOsP1viEF1AJUH
         bPDDXQtARkxaYm6PxBt/WXREPlYxayKk5/Q4G/z41rViIN6vREpgbFhNoxJ59lSXM+fh
         V71UMWPz430NMu5yvBlHDBN917CihFLLcr7AcgqqYauNpCECl0UbOGCQCRltHV/1BIXM
         3u5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=qMTVArhp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si4489793ybb.239.2020.12.17.04.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 04:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=qMTVArhp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpsRO-0007d1-Ec
	for alex.bennee@linaro.org; Thu, 17 Dec 2020 07:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kpsL0-0003UD-Qh
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:24:54 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kpsKu-0005gL-Iw
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:24:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m5so26363460wrx.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NICYJ84iNjSbyA70NzDal6wSVK+nv8bpRKs0LGU3at4=;
 b=qMTVArhpUnsuQFYAnWD++B/GOToA3vSX8NjcBa5/4tZI2mZf8uU18DNtDkoLkDT+lU
 uPZ4IwwKGX7FRien/5cM0FDdMuE4AEJiLM95XzdeIZ14J+5EifFvC4b2T6VwGt0z+o0y
 p8+CSAMRHDD3zG/MqVx9WilogtloQ1ifnZ0YGk6q8rZEgXJQr0bcfr1gXGFm2nCdsx80
 hbifcS8Z7bvo/tq7DSUAhYvPxKdjkqVJOrUETx1AMciuc+GvzGpqhISVKgys0qQDzD4g
 +ozOVIxQTy1OnYAUDBKQuqDqLOcGeN3IekZU4wO0jLpCkyD5MoQONBYBboczo4ysULQ2
 DlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NICYJ84iNjSbyA70NzDal6wSVK+nv8bpRKs0LGU3at4=;
 b=pzSbcxbKOVNG7DYc5ktKgzKqokw9vdYlqpqkoLEttYQjoPBIOaveEf2JwZlEQNwv/M
 BK0ggLfGwEIH0CB0TllNZpR5M+vhuBPQ2fqs2Q1FrwalWckdTAGviXYYmMyfh32yFN/u
 HvqcDAc3hpnAYJ++QI3c7qDoL9YnjGVlPnFUaxinBNV6T3e/N6osz8SVUXF0rQj4zbDd
 nrk0s8doO074dqInSTVcu5E4SRN77CMKT3QPI4O7MZPQt9Dtv/amjf+rRUDOMtidu0y8
 2shXPUzEpNG1XuozCDtaseiHu4/aTCOESg+EecGsrATa2cMB6Va0hLNKkHdeSS6UHL5V
 KEzQ==
X-Gm-Message-State: AOAM5327lnm71cEwuNF0PLt+tQIAOPLeaJJwZEIPesNuLNkGAQEveVeG
 +BZvxNVVWD/j7tu2J/YiZibzPQ==
X-Received: by 2002:a5d:678d:: with SMTP id v13mr43488815wru.71.1608207886807; 
 Thu, 17 Dec 2020 04:24:46 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u9sm2547551wmb.32.2020.12.17.04.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:24:46 -0800 (PST)
Date: Thu, 17 Dec 2020 12:24:44 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
Message-ID: <20201217122444.GL1664@vanye>
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
 <20201215164904.GY1664@vanye>
 <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
 <20201217121031.GK1664@vanye>
 <CABoDooP_uW-w5JaMXmo6AzUomFp5BuSS27zn6x3hu1VKbNbEVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoDooP_uW-w5JaMXmo6AzUomFp5BuSS27zn6x3hu1VKbNbEVA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNB2f1aY57WU

On Thu, Dec 17, 2020 at 13:18:03 +0100, Laurent Desnogues wrote:
> On Thu, Dec 17, 2020 at 1:10 PM Leif Lindholm <leif@nuviainc.com> wrote:
> [...]
> > > > > > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > > > > > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
> > > > > > +FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
> > > > >
> > > > > The positions and sizes of the ASSOCIATIVITY and NUMSETS CCSIDR fields
> > > > > depend on whether the ARMv8.3-CCIDX extension is implemented or not.
> > > > > If we really want to define the fields this way, we perhaps should
> > > > > define two sets.  Or at the very least, add a comment stating this
> > > > > definition is for ARMv8.3-CCIDX.
> > > >
> > > > Urgh, sorry for this.
> > > > I added the fields only to make the CPU definition more readable, so I
> > > > think we don't need to worry about runtime handling of this?
> > > > But I don't think it makes sense to add only the one form.
> > > > Should I use CCIDX_CCSIDR_EL1 for these ones and add
> > > >
> > > > /* When FEAT_CCIDX is not implemented */
> > > > FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > > > FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
> > > > FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
> > > >
> > > > with a comment that
> > > > /* When FEAT_CCIDX is implemented */
> > > > for the former set
> > > > ?
> > >
> > > Having both would be handy, but you need to have different names for
> > > the fields.
> >
> > Different names for the same field?
> > I.e.
> > FIELD(CCIDX_CCSIDR_EL1, LINESIZE, 0, 3)
> > would need a different name for LINESIZE than
> > FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > ?
> 
> I was thinking about changing the field names, not the register name
> because the register is the same, only the layout changes.  So
> LINESIZE -> CCIDX_LINESIZE, etc.
> 
> That's personal preference, Peter might have a different one.

I see. Sure, that works too, and doesn't pollute the register name.
I'll wait for Peter before sending out v3.

Thanks!

/
    Leif

> 
> Thanks,
> 
> Laurent
