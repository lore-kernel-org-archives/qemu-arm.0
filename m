Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6331506lfg;
        Thu, 4 Mar 2021 07:26:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWV/gvupXjOxeK/VD3hYnuwsA5RfJptimIh8xna2nfueZR5LUQlPyXmcBmJVcVa/XAq05h
X-Received: by 2002:a6b:f714:: with SMTP id k20mr3953586iog.70.1614871578887;
        Thu, 04 Mar 2021 07:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614871578; cv=none;
        d=google.com; s=arc-20160816;
        b=GqETQEmxkGpDRsNfGVEqUAEhaLa5bZ6eQ+92vRTfpdsR8NveNqMAdCdqxnxFhaVhh0
         y4Sm+KO6UEr2oCbG4DvUSrZirxfjjLIEtvCOvKwU/dPMMB+GWd5FyJLHsVqydBdD+JhI
         r6Kdaz9lSulWLNoUwJr861uFe14ewTILNWzO36CbKVMnq4g54KEuGQOWUfuhsunA32RV
         min4wKIaDsqOIeQSlkE3iNlF+ELmGv9z8TJM05C3QK25tLKYWETNfQ0Nu10/dF12wfuk
         BuYCQpcMCux3Xdt+5kL3+M/4NSkShL6QQRv6ytq6I3wTS+wlwN6OZ17/SGHPkewAkO5R
         P3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Ut2SA0p9uR1qJAjAx9Z1dx1mv5c1+44ZOBhw6veCFwY=;
        b=OXWd8meyo3z08Bf8L/CT1Ncy5MD6zVJ09n+j4MV/UtcHn+J+YPXnAW4wRi3N4oH0vf
         SsAlItdmDUUwyFt2RK1yHkCd6xMGJLkMiyQyWGHk5wN6s92ddxgyauD9Xgo8wt2SXe2U
         wMMdmsjFH45Zb7ZFNMyxzZJjcxK0JlIUrXn4/+Sb+GS2dDhUIr/SJglkg9ARb9cGBGPB
         ZT1nPDxBwte0s8DPo4iHi/ymbBLYln2mhsvU+aAyoGRc5R4uZ729JODBW8+dlV9lmB/c
         Jvrb2V7A2V5K5BhclRSjHZQqzxohgUXBR8m+qUoPb2W7NKP0gshhD2NNEim3DZnKiKs9
         LE2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=FZKhfJkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si23827151ilv.2.2021.03.04.07.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 07:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=FZKhfJkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHprm-00046H-5V
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 10:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHpqp-0002e3-O1
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 10:25:19 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHpqm-0007H3-KK
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 10:25:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id n22so8409253wmc.2
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ut2SA0p9uR1qJAjAx9Z1dx1mv5c1+44ZOBhw6veCFwY=;
 b=FZKhfJknxVm1swdVCbrW0MmBd4/VyP7QiX8ejcoo7kuxezenhLjubfaJzbboQbrMkI
 kHOqUB/c1FIcf5OpqT8ZEZL3qAppEYPdiwD3kICWj44oJqW8T6jAUcBJpUh8JgGXn8QE
 76a+23aDW76K3vN1OInKTSonysZe0k21wMP5ErStRKgzxaLMd/VdZQPU5q9vbNQQ62QV
 KOZpovyMIi7VLCQbdNwMxHS/C1/urVr+LYQ0QJBmvdzayOoPIKLhKiRLxf1WyETNMlqK
 MKkfl3DoATaOaTkQflQKgETKFKdSReHGl2C5VaoW4EwZxOKeEFX2v1MijHlcc9beCkDF
 NiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ut2SA0p9uR1qJAjAx9Z1dx1mv5c1+44ZOBhw6veCFwY=;
 b=AUqJle61QWDvgAPdPGbCJ2dseegKWdKjL3AqoRV0Gh7LZRpz3qZtWtBlizIC0N/EGl
 I7AX4+Bo68Xh4mJ9g/KEGn/xrpxm2LnKdAhfUp2r5aXRoaB43eX0ydZDShyZqFzacewt
 8Hs0mECqUEDgmxTK4rD4hehYrXow9oonORE8Md7P0rgb7icNqvHNIC4QIt545TuT9grN
 fcaU3maJnIbMC76u+mVa5LjE8peDelU2yaZ5zDgt381hOG1BIn0rp19zkI3UEkyriY3Q
 bimMlKFmXMcqjsayflVVUaflEFi7TAAkrQkQn4sY/bCTg5M+z05pA6zQKX6zLLMajy9d
 2chQ==
X-Gm-Message-State: AOAM531fSKY+Nz4cQjNLdmHQlPPRWGtMOI6uTC1DJw5apYfcJ8RoW6+4
 48qBppf9a27zd+BqU++YyGjqow==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr4682189wme.4.1614871514387;
 Thu, 04 Mar 2021 07:25:14 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id v7sm3850384wme.47.2021.03.04.07.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 07:25:14 -0800 (PST)
Date: Thu, 4 Mar 2021 15:25:12 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Message-ID: <20210304152512.GJ1664@vanye>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
 <20210304135304.GI1664@vanye>
 <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x330.google.com
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGHr3vYwKZ6+

On Thu, Mar 04, 2021 at 15:14:36 +0000, Peter Maydell wrote:
> On Thu, 4 Mar 2021 at 13:53, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> > > On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > > > It would be good if we could get 6.0 closer to SBSA compliance.
> > >
> > > How far away are we at the moment ?
> > >
> > > > Would it be worth the effort to make this controllable per cpu model?
> > >
> > > I don't have a strong opinion on whether we should, but if we do then the
> > > right way to implement that would be to have the PMCR reset value
> > > as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> > > reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> > > it is; and then instead of using a PMCR_NUM_COUNTERS value,
> > > extract the PMCR.N field when needed. The hardest part would be
> > > going through all the CPU TRMs to find out the correct reset value.
> >
> > That makes sense.
> >
> > I guess we could also phase the transition by using the default value
> > if zero?
> 
> I tend to prefer to avoid that kind of transitional thing, because
> as a project we have a tendency to never complete transitions. The
> PMU stuff only applies to the v7 and v8 cores, and we don't implement
> that many of them, so it's better to just make the effort to find out
> the correct PMCR reset value for them and be done with it.

Understood.

I'll throw this on my never-shrinking pile of things I hope to get
around to at some point.

/
    Leif
