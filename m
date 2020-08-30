Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3244930lfc;
        Sun, 30 Aug 2020 16:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxINAfnUOB+j4yY3QOBdrXfxNNrPa0aIQqK7JfTEhEo/Bl9pJFXrbBBrAlzQZM9bbTqHQ7m
X-Received: by 2002:a25:7146:: with SMTP id m67mr9946578ybc.362.1598830567982;
        Sun, 30 Aug 2020 16:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598830567; cv=none;
        d=google.com; s=arc-20160816;
        b=LMUNviKzI7ImizwOH/j4gq9/Hhc2Rg0Xr2xqgVHm2NnsyMl1y1d/pJSuNcbJkjG0G4
         LeRNU2UELMhDHAyaMEe4HdgzHxXZ7J4rvDB2UqtLLjvGTop7ft6D9XtyBOuSbKQh8NJl
         qFYCllDrub9hoeMS3ziGL9IjY5ygHMJHAeqYcaWMdOYWLvv1JL3ooKWYukMQvNAx5due
         Z/styLMaG7ol9WxorBSdzrtvQDKtzIQNS4lYWtlvKg5ZqpAaVVDApwdup+X6f9NjaS59
         63mklbESr8RTL8j6KlSLb0eH/Y2ailSuNRTD+280nBm5KSYkL9Pmtr7cT4f5uwg6OweJ
         5mNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=RASHodX0lMfHYt83QbTf2ezLNOxfAhKMutmXcqjpFuQ=;
        b=Ji95jowYxUW1e9ZYOvfTA4QcUJlslpiHU1z9CPTGqRNgdEmUs/GLNSVuvoNm4eISWi
         vFIvrzdL1RxKCmUUr8L7FqT9pFjWdgtAn+qxcQYXEakbGxHwNuYRokCs4YUEWByMdDDf
         8T83xVmJAnETc6/zMpJ7VHggw2CWsgJbdYGR9hD8Y3OBVSfqCbdFSWAYXon4Qyi2wzdf
         EWreorhV0HzEZHafgLlHoPIBqeujP60bm4AMW+D6AVRJrg1JBcv6U+95iut6su7kUciX
         1KxrRAjLQN7ZSy6ED9X1wad6gh2D7DS4pipwyFNtwrnM2zT1Fn8LpCZZCXh+hMLNntu0
         y03Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=j8RBtorq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si5930973ybj.49.2020.08.30.16.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 16:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=j8RBtorq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCWrn-0001In-DW
	for alex.bennee@linaro.org; Sun, 30 Aug 2020 19:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kCWrf-0001IB-GI
 for qemu-arm@nongnu.org; Sun, 30 Aug 2020 19:35:59 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kCWrc-0005dw-Re
 for qemu-arm@nongnu.org; Sun, 30 Aug 2020 19:35:59 -0400
Received: by mail-wm1-x344.google.com with SMTP id x9so3734101wmi.2
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2020 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RASHodX0lMfHYt83QbTf2ezLNOxfAhKMutmXcqjpFuQ=;
 b=j8RBtorqaVEsLOmNgpW3EzUGHsToCN3xfe46gSDMurZJGFNEg18k0GvZKdOoScuO0k
 zlYrwS0pah7kXPLGqgfPBRxHOJGPX3hbhsI3IsaXdMIBVLnNEv98mTUVFnReYcAAxGPs
 sMg/fgdjTuC5L4ZV/psfBJMxu1gMdqqaZwLDPxgr1QUuEQZ1by7JTpF3LXNIgls9bR52
 fbo1mee/ZsECNW5HqyQcko3TlbS/htkuGhXweyfG8AEFHcNh24jV/7Uzha0LIsCp77WY
 2j0lJeqJ5X2rWl35Ys3SW/QIPjgsfGETi4kpiHBODBy2jWGW/fLNKVxR38vIVBxqD2wL
 Tfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RASHodX0lMfHYt83QbTf2ezLNOxfAhKMutmXcqjpFuQ=;
 b=C6bfbo7jAkzUJaTbpNoxbrZKCe1wgCEio6Q09cdSjPsIw+qnrRDh9pjOPb9AdRYjal
 MuTK12SmHbHRDtv6uxRM4R0iGAMjOCqzdsoDFONYX/5dyfDPU8+ZiQ4fvn3WexT6YGMx
 bS6GZImbIMdI2XcIimJV77OL93tVSKDhxXeT8EXrUq6RefN2cw9uMh1SqKFhQsli6m21
 4dJs4wuyHc/WxMM0pvTKfwN+XzqjQ0q784XmJwLWRQ3Qg5o6CU7SMdjxfrR+J51v0kA5
 CqLUeGLwb8KnAtQlITA0Ng0RZ0qz5OGKVtwFEuto3AASW7rBH1k5nYyTNuA4uCpDrU2H
 M3Sg==
X-Gm-Message-State: AOAM532tqwfhZzjsgwqHmlPI12PRDtZxjwqWRbtNpPMY7R/OVH9759su
 hwwYXwZgvllMlbgNYVylrgzfTw==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr342678wmh.177.1598830555254; 
 Sun, 30 Aug 2020 16:35:55 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id z6sm9218591wml.41.2020.08.30.16.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 16:35:54 -0700 (PDT)
Date: Mon, 31 Aug 2020 00:35:52 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 00/16] hw/riscv: Add Microchip PolarFire SoC Icicle
 Kit board support
Message-ID: <20200830233552.GG20124@vanye>
References: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
 <20200830125659.GD20124@vanye>
 <CAEUhbmVYpSVE+C+KyEa2Ono5p-SLtC1vE=YwE_3FJK6POEJCCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmVYpSVE+C+KyEa2Ono5p-SLtC1vE=YwE_3FJK6POEJCCg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jx98PywuZI1d

On Mon, Aug 31, 2020 at 06:15:52 +0800, Bin Meng wrote:
> Hi Leif,
> 
> > > The following perepherals are emulated:
> > > - SiFive CLINT
> > > - SiFive PLIC
> > > - PolarFire SoC Multi-Mode UART
> > > - SiFive PDMA
> > > - Cadence eMMC/SDHCI controller
> > > - Cadence Gigabit Ethernet MAC
> > >
> > > The BIOS image used by this machine is hss.bin, aka Hart Software
> > > Services, which can be built from:
> > > https://github.com/polarfire-soc/hart-software-services
> >
> > Are there any version requirements, or additional qemu patches, that
> > need to be taken into account. Should I expect to see output on stdio?
> 
> Thanks for trying!
> 
> Did you apply the patch to skip the DDR memory initialization
> mentioned in this page?
> https://wiki.qemu.org/Documentation/Platforms/RISCV#Microchip_PolarFire_SoC_Icicle_Kit

I did, but in honesty only after I sent the previous email :)
(Since it made no difference, I didn't bother following up.)

> > I tried to build hss 3faaaaf8ce0d, using
> > https://github.com/riscv/riscv-gnu-toolchain (7f1f4ab5b0e0), which
> > ends up being a gcc 10.1. That caused me to raise
> > https://github.com/polarfire-soc/hart-software-services/issues/2.
> 
> Yes, GCC 10 does not build is a known issue. Currently I am using GCC
> 9 to build HSS.

Right, I can confirm that with commit 93f82dc18e1d riscv-gnu-toolchain
(the last before changing to gcc 10.1), I generate a 9.2.0 gcc that
builds a hss.bin that boots successfully with the minimal command line

qemu-system-riscv64 -M microchip-icicle-kit -smp 5 -bios hss.bin \
  -display none -serial stdio

Thanks!

(I haven't looked any further than the hss.bin yet, but I'm now
unblocked to do so.)

Best Regards,

Leif
