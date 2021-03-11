Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp465729lfg;
        Thu, 11 Mar 2021 09:07:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqAnKN2slkRUEVCy5KmUASejqW69KbpNvhXkwBSdJkZDu8pi3BflGfTq1gZYvVNQq4bkBA
X-Received: by 2002:a7b:c316:: with SMTP id k22mr9091577wmj.176.1615482439631;
        Thu, 11 Mar 2021 09:07:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615482439; cv=none;
        d=google.com; s=arc-20160816;
        b=w1LrfgvCOHnXzMWSrfZo5db+PHaQm7ElUTUsz91ii5J89radhuWRnTcDRW39IM0998
         OxKtAGM1NhroZw+xHBjA9NPAqeGtmlK6epmtTg4+KW1fHvKvxFNVlLe378qSKmVN3Jgr
         Tgjm+H4gIZrOy+pa5eRFEY3tZhiiXRMsHlQm8EPdZMpOrB6njiJ6jjq3XSyBHV3cMJOX
         NaG6kAE8T0rxpNTykPuDEQ7YfnBSu879ZymEGxVcAOUQe2sjQ6CsXcQDI1z4gTFPi2Hu
         PpKzCj6vlYxx4Ln30Rgot+3yxpV2AP+wycgz9S/e8fgcDC00c+EYVCaZq50k48Rcpur0
         q5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=boV5bAFWRlNeOWTRrUVrjfQz/GzZqixgUhKAHedJyL0=;
        b=GK+kwrXXX6beF/M0GGzUlIMySB+I7JOGzPJNHfXgmpZ3g+TqcLG84CD9bU3sTZfbll
         5rBMRbszM1aSoUhc8haQvTcrdKTmqv2+CffZAxoCU48ZQDRSh3WZrR86k6sshVJx8dd+
         hNEp2DYdoC/PzJSoWxE+C8ja7XioshO/mkNda0PCOuM2MLJGZ/AdVfUTMpD2BNbBvnk9
         0rqe8uJi1mjBuWDxvGvEgAc/cTTDKbhfuTkh7qX1f84dZihHqllcAPIHcjRdMY6ON43p
         8BioEUhaj+utAKqlOSVd99yOyvBDmvwSUbcYBHctUFseOUXBVofEoh20eLk5QJ4BPEEZ
         l6/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kF8ab1ml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si2858379wrl.254.2021.03.11.09.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 09:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kF8ab1ml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKOmM-0001g4-Lu
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 12:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOhl-0005Kg-2W
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 12:02:33 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKOhi-0002Hh-KS
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 12:02:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id ox4so32062470ejb.11
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boV5bAFWRlNeOWTRrUVrjfQz/GzZqixgUhKAHedJyL0=;
 b=kF8ab1mlBrK+ylVpMCqH7wAfwZzH6txqSv7kbZb+P6MpNk6LG4Qm5hCxBwxJLsjDUG
 7kSgbUepYDilYSokj8S9F3dEGfDHP9wvzFcTjUHNKFJ8E8R433gDTZF5w2ZuKXYYF8Ho
 tFMd20gnL8ZEKAniZp6kBer27HiVBxtkwUeGeT0I3B3uyU5Usdgwb3ysDRtiTm/loUT2
 v9Xo23DjOier7818RFh2FZMtLmTkFPTyBD9ieSPjTi/t6DrenrIkDzMsF0i5/2xLbLar
 hRrS3GzTwGvy3pCe/VYW6HedGmpBI1SyeVmuRyXmJnU00omvBGxWtX00HD+l0qozZyZ2
 61fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boV5bAFWRlNeOWTRrUVrjfQz/GzZqixgUhKAHedJyL0=;
 b=O9L/JzgIfrcRc0zynMAcPATZVtxVA/ZEt0ZlWIJtlsszbojbUIbKBA5BsJnbl4PTMG
 C37h7qUO/p5yYI2bM+N75JVp7zbjo4tQgxXIXIA91eKVZPWKRum3ciptlEOm+PDZs7RB
 lopJJNhk0mgQYFiW8slz1aHVaNEnSinp9ePyPHkMelGiNxtZ/QKTZp/HZcfIhm65Yvip
 DSApngS8zS9OBPakvIUoqkgAR4/NYy058hN2Km0UTHz1Y0+dX3GEz/TXzOoabqR4TLNV
 8LV7t5XXMx49XsGh9OD0JmGqqbFOYz+KPFbuLzngjTcKawzd38eFNPKIaHefCtzjMgEw
 44ew==
X-Gm-Message-State: AOAM530voBessP4JRYdCxxSNvDZt3uPdr/mR6Gfv5lBUTQL0F7X56qZS
 ulqBsKIqdFSoEWDPc5hF4SProhGBVFPLt562pG1UgA==
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr3974573ejb.407.1615482148073; 
 Thu, 11 Mar 2021 09:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
 <20210304135304.GI1664@vanye>
 <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
 <20210304152512.GJ1664@vanye>
In-Reply-To: <20210304152512.GJ1664@vanye>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 17:02:09 +0000
Message-ID: <CAFEAcA_Wu3nQ1vLa6YhCfLmPfaGHYkyuw90RU5sa8mBs6me=sw@mail.gmail.com>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 80macEzZ+Gs3

On Thu, 4 Mar 2021 at 15:25, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Thu, Mar 04, 2021 at 15:14:36 +0000, Peter Maydell wrote:
> > On Thu, 4 Mar 2021 at 13:53, Leif Lindholm <leif@nuviainc.com> wrote:
> > >
> > > On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> > > > On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > > > > It would be good if we could get 6.0 closer to SBSA compliance.
> > > >
> > > > How far away are we at the moment ?
> > > >
> > > > > Would it be worth the effort to make this controllable per cpu model?
> > > >
> > > > I don't have a strong opinion on whether we should, but if we do then the
> > > > right way to implement that would be to have the PMCR reset value
> > > > as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> > > > reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> > > > it is; and then instead of using a PMCR_NUM_COUNTERS value,
> > > > extract the PMCR.N field when needed. The hardest part would be
> > > > going through all the CPU TRMs to find out the correct reset value.
> > >
> > > That makes sense.

> I'll throw this on my never-shrinking pile of things I hope to get
> around to at some point.

I just sent a patch that does it that way, though it is desperately
in need of more testing. I'm currently on the fence about whether to
put this patch or that one in for 6.0.

thanks
-- PMM
