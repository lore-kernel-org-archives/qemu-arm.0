Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1061224njc;
        Fri, 15 Nov 2024 07:52:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBOzO8biCpx5mgCnLjFMVls1OcGfnW0NNTZKK3+uJpbdM+WWRWpCe9DtwvXTtz/JXyYxJbbPx7RiEOxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFOV0F9HuOBzaAdAOQMUbpUKrvGZ02h/Wex7azpPMlvCM9Nhhkg81pRv8/9WwuDihzh6P73
X-Received: by 2002:a05:620a:258c:b0:7af:ceed:1a4a with SMTP id af79cd13be357-7b3623433e1mr450083285a.43.1731685936211;
        Fri, 15 Nov 2024 07:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731685936; cv=none;
        d=google.com; s=arc-20240605;
        b=RcrmTdjQ7YdTB6WfrHiCYuvHmvkYnUhwVKVcwrE+y0b16PZZqFD27Rpd36VGxkh8kJ
         NnBRhRZtr/o3QpHBG7hsl/Zm7Cx21/a8DJ5stIvL2WNkjBKZAdaxI24Fpvivh8vETIL9
         L6KVPxQxxNfmizHjhrf14dx0FmiivwYAJInSZgqrysnVP34Xyn/ggwqrCPGY7/oYZlNu
         91vuR6ouRedwKJUAR17tcVSioHgM4AtY+mhb+lsZBHtPRJSdbyLsDXOQUqqRC26PwdRz
         GlQyNSl1DopwyXWAHeE5VIRbYsTJK95XJdY+DSnaNlGX6oscTA7FOYyQV4XpGT0M2WMr
         Q09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x+vyabEU2u8usBKFkMLepHoc+knqqaSc+8A3oiCmD4A=;
        fh=WhSOlfMBmkAKLk7qFaeC22DaOvHoY+VCjc5GinD9RKY=;
        b=KXd1zL/KvZlqmtenYaVyS7G3ajDxch6zfdPyuhAJSfupSeAtQ3J0zChKH3w4Z3tXF2
         yg1jz8EdrmQcd+Z2pKtNpwZX9uxFnIF+k22VOoob+lzHjGpFEdGUnOpmrPUOKpd4dCBL
         zHDKsHf5go+NNi2H9ia0XQDlBxAFMak2KCnZ+eqV9hZb7pOSRzkgK70vnGQDd69f6k4B
         DnvFEgPnbosZ3d0qYxALbc+6ynph3gPGjUYc3GutxQ8zcvt99AoJE27llkO+CuMZraNf
         RyfLy+EAer3Gag1EVB3bFR4+5pLzIHWR3Z6Jo8aNWA0Ql8uvmDde5Vmo/vChKi56GKZ7
         ka5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QFCHNGbq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35caad913si386081285a.467.2024.11.15.07.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 07:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=QFCHNGbq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tByc5-0007uK-Ae; Fri, 15 Nov 2024 10:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tByc3-0007tV-Ba
 for qemu-devel@nongnu.org; Fri, 15 Nov 2024 10:51:59 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roqueh@google.com>) id 1tByc1-0001pp-BO
 for qemu-devel@nongnu.org; Fri, 15 Nov 2024 10:51:58 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5ee763f9779so1020895eaf.1
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2024 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731685913; x=1732290713; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+vyabEU2u8usBKFkMLepHoc+knqqaSc+8A3oiCmD4A=;
 b=QFCHNGbqaW5svPattUA4RRSCmdXiaRtScyglRwMwEtqjBYt2JjehVrgt42TXKsTfNt
 N2uwZhZAB2nYBH7CID8D6wWh2sa5ErgbfGqnaWSIWCMRKJDvAgq+VOw+4lptIuOgrqiv
 qMmiEvmzaI8XXeSMuLkpHIR+0OL1rkOQw023E4v4MF6yBrB5eLIFEx4BsZyjpfPYmGwl
 5CDIqm0Mx80OJMtr/RwWB+DLHUl7TS41iMFrqzCsQbmp9CPIp88o9rYsjNDmHbUtt26u
 3QzXcDxOolxj81M7keRRCQYM2/FgdrI3FXG4xQtqweO5jkIsZ7JjSJOryB5FcICHdGVZ
 jLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731685913; x=1732290713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+vyabEU2u8usBKFkMLepHoc+knqqaSc+8A3oiCmD4A=;
 b=EE8OJ/UtO482osjBYtoe11HFGoCZxG0JiOISxGInNJ/CEOrkOsbNfhUFxVeBQt8WX0
 nPo4eIhxNonpopeS5HMhNdh/gbE4bLo0zO1nzQbf5v4CIbx+RfpLAKDqLuNXGC+hDPvU
 zIbzByXHa7VjM/nqgTwvfKJNMWOM8JfzBU/ONV77MLFkX9XbW46TOkcJh2QQqLumvobI
 8zz1gJy4/fbdZus2YHemplu+UbH34I1h5lgGio9WUoC223HgLBbp5s4bYR+WvohmjlEB
 dt9c0hvPyw7wC9shQyo6t+ajZRUFXI8l/QVMfb/jfbbQXejg0sFLlGF/122wZEyQADZ3
 rA4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBIpYx+AlByXpGoE1GoP20ohq99EPVFvhcJC0MKWML4Mw8x8KgUqczj8F+ujRzJ8N8iNBO4VU5TAud@nongnu.org
X-Gm-Message-State: AOJu0YxCXLfm620Hk6sG9kcQ5ezGpojW7O1f/BftRcA4iEb1/P0ebAWu
 jf5Sef7NqMM7Iw5dGtXIOoJKF/bM1BegZPjuNH1Tenh8I9iBBR6WPmMbF1CSPq0Sx/sL6+8xpUX
 vXtkavj72ozqxR6eQknE+FR5AF2K7UrYIcbB7
X-Received: by 2002:a05:6830:6014:b0:718:196c:c819 with SMTP id
 46e09a7af769-71a77946f78mr4070608a34.13.1731685912757; Fri, 15 Nov 2024
 07:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20241108191024.2931097-1-roqueh@google.com>
 <20241108191024.2931097-2-roqueh@google.com>
 <CAFEAcA8bWb=PV=R2-UZCDLzkuV-THmNb3yd+BY167B+P+u3JJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8bWb=PV=R2-UZCDLzkuV-THmNb3yd+BY167B+P+u3JJQ@mail.gmail.com>
From: Roque Arcudia Hernandez <roqueh@google.com>
Date: Fri, 15 Nov 2024 07:51:41 -0800
Message-ID: <CAKbPEtbKpVpJ8MT7gnz-xP44_UCLAO48Mq3OCMTFsWkeAUAQxw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
To: Peter Maydell <peter.maydell@linaro.org>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=roqueh@google.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5J3MBQcFXGsC

I'll be removing the extra line in the comment and adding a new patch
modifying the link in version 2.

On Thu, Nov 14, 2024 at 4:53=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 8 Nov 2024 at 19:10, Roque Arcudia Hernandez <roqueh@google.com> =
wrote:
> >
> > Current watchdog is free running out of reset, this combined with the
> > fact that current implementation also ensures the counter is running
> > when programing WDOGLOAD creates issues when the firmware defer the
> > programing of WDOGCONTROL.INTEN much later after WDOGLOAD. Arm
> > Programmer's Model documentation states that INTEN is also the
> > counter enable:
> >
> > > INTEN
> > >
> > > Enable the interrupt event, WDOGINT. Set HIGH to enable the counter
> > > and the interrupt, or LOW to disable the counter and interrupt.
> > > Reloads the counter from the value in WDOGLOAD when the interrupt
> > > is enabled, after previously being disabled.
> >
> > Source of the time of writing:
> >
> > https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-wa=
tchdog/programmers-model
>
> I see that the URL in the current sources
> https://developer.arm.com/products/system-design/system-design-kits/corte=
x-m-system-design-kit
> is no longer working -- would you mind including a patch that updates
> the URL in the comment at the top of the file to the new one
> https://developer.arm.com/documentation/ddi0479/
>
> please?
>
> > Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> > Reviewed-by: Stephen Longfield <slongfield@google.com>
> > Reviewed-by: Joe Komlodi <komlodi@google.com>
> > ---
> >  hw/watchdog/cmsdk-apb-watchdog.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-w=
atchdog.c
> > index 7ad46f9410..e6ddc0a53b 100644
> > --- a/hw/watchdog/cmsdk-apb-watchdog.c
> > +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> > @@ -202,10 +202,10 @@ static void cmsdk_apb_watchdog_write(void *opaque=
, hwaddr offset,
> >           */
> >          ptimer_transaction_begin(s->timer);
> >          ptimer_set_limit(s->timer, value, 1);
> > -        ptimer_run(s->timer, 0);
> >          ptimer_transaction_commit(s->timer);
> >          break;
>
> This looks like a correct change, but the comment just
> above here needs to be updated to match it (it currently
> says "and make sure we're counting").
>
> Otherwise this change looks good.
>
> -- PMM
