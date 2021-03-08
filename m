Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2074011lfg;
        Mon, 8 Mar 2021 10:23:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrObhH7hU7Telt8siCaplAoE6/GtviQ3m4QwFSi98H3oywn8L0kR6mk+FaTiLuJHu/7UTM
X-Received: by 2002:a92:dd82:: with SMTP id g2mr21449952iln.194.1615227790242;
        Mon, 08 Mar 2021 10:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615227790; cv=none;
        d=google.com; s=arc-20160816;
        b=BCX17Zgy3iKXsogfyTvCyl26xFczf2Ef8G1N5v6c7E3K8Bbl/zA/0pFpuRxSJgY1HY
         xV7YDYlUNty7Mb3n7zqlANRSNEZ8/qQqMgqaVkdNIb8hXBXA6paA9suM5Akr+27+cgLs
         cneJyuyIiiwy0UQiRM3KgHqFLZLRRKiJK1CqLTx+Tsdv8irjqCp4PbszWtNwpkg47OPP
         5bLO+U9NTf6K640KgSAs8mXS69sIrI8m4VMpdiMxlcaxnUveaXUKp5Ixy9pDoNX3LzAH
         m94oWsVRivQv7q7L0smdzdru5F4vaSsH4yJ7rOIwoYkJwXo/DhcGcJLoopOLaAZJHUQA
         MDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WcywYy0MwbLvp1uGuKwbkEhzLSElonvrYpbBsOj7Qzc=;
        b=mqeiBH/sjCFJH+Mz/h6W+AScJm3+Tv152LBwzmhlkvV//tiKu3qYUgPEhEK7kORr88
         aDniEo2Cc332HMQbiAzjMjKhZ9OZjnk0p036GleVfxuzKWHQxKSSyP/WGlxYzsAO2f/u
         9Y6OAYzI/pAE5QQ19Ktpc/M5rDJo7YDNkyS5pa5h4g9ymh56hwueotFZxEzhtNmidqiN
         g0UKIfXS/J8ufo3RiQKExsHgt8WCOcQJuK0/ZtvlFEr1Hh+A1uHXqdM1pRoyljVWCOhg
         +E7+npE1OMij0sDtMT199Enjlq68Gfpx606Sl4WMx3ZR59HtyCtXc350PzEFAaSbj/8n
         QExA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOoYbDgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i30si10649684ila.151.2021.03.08.10.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 10:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOoYbDgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJKX7-0005iY-Hk
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 13:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJnP-0002Fo-Qm
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 12:35:55 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJnM-0008E7-Lc
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 12:35:55 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ci14so21948512ejc.7
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WcywYy0MwbLvp1uGuKwbkEhzLSElonvrYpbBsOj7Qzc=;
 b=GOoYbDgTObfs+5s0dyi1jb7LeWwx3yYBmeO1IqargXh/MdvSLVw+tzNsXg0ym/3V3e
 h2OG+F0azIgSXJeP7eh9tdWG3bLIYkceDUTQwFCx74Nv89cFO9lKCRqgMPtGvgHr2oCu
 smRbYj79+Th5XHCzVDQRnQ3UCAgOG+45mgatUxxoNRcbdmhLQW9WB8HB3Nb+Idt8JGrA
 pS7FWDHbexbb4xr7H1+d+4hIDQ4RaM2jJ9K2fE/FJejkq6ipKZa4gvuNY12zi+psxum4
 5rHqYUAGjEH1/8e4C88XjE4tDEindRSjzAouzn7rATR+xvyPBTjWB4HsjF5DGUiHgSFp
 Rfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WcywYy0MwbLvp1uGuKwbkEhzLSElonvrYpbBsOj7Qzc=;
 b=QhhXpBvXiv/ioIYm34X/pQrYEIMDKY/hpu66ZMdgqn3kVj83daNeIBusxidEAXA9fB
 4lJvpy6d5CQgtjy3+yO5pPXHH7+dJLjMhJt61DfvBrvhSA/2/KlwPKRPcNhsIMF7yZ0c
 SdasPptHKD3kjC0ciZASf8z+D7FZW9dSE8npxsQyb5mPIMcernTYL5b8sFRm1rjvz00O
 10hlMZV9eCz69mz+La35qhUKAlW9rr26Z+PVY2WSI1evEy8vXLYKmOqyT156Hn0cHRCp
 jtCgHEBQ/tHdOge7qlVeMA8GQNHSnq9NjJkgCSfanTPf8eBCJFsC6ZPgyHUEFQ0VgG95
 y2Ag==
X-Gm-Message-State: AOAM533xz14h8sxCHCwum0UKYhrKhhOdCxrFeMzhy8ia9NiBQcGfKs+u
 F81wgUTGEP9lmuxtxskD2tjveJHJlaH4syet9wt2Kg==
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr16269429ejd.85.1615224951052; 
 Mon, 08 Mar 2021 09:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
 <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
 <CAFEAcA8kLV_gxbD+Gt+c4ShTxcPKEUHYvF26gmtDA_-iAuWdTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8kLV_gxbD+Gt+c4ShTxcPKEUHYvF26gmtDA_-iAuWdTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 17:35:34 +0000
Message-ID: <CAFEAcA-JKTOoUpN=KOkYNsoT6_-wvJFhmkfG0qH84cSOX9CsVg@mail.gmail.com>
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WyZE0xYP4a2s

On Fri, 5 Mar 2021 at 10:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 5 Mar 2021 at 01:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 2/19/21 6:46 AM, Peter Maydell wrote:
> > > @@ -1,5 +1,5 @@
> > > -Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
> > > -=========================================================================================================================================
> > > +Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)'
> > I think you should drop the list here, as it has gotten *way* too long.
> >
> > > @@ -27,6 +27,8 @@ QEMU models the following FPGA images:
> > >     Dual Cortex-M33 as documented in Arm Application Note AN521
> > >   ``mps3-an524``
> > >     Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
> > > +``mps3-an547``
> > > +  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
> >
> > The list is down here, anyway.
>
> The title is what generates the text for the table of contents in the
> next page up:
>
> https://qemu-project.gitlab.io/qemu/system/target-arm.html#board-specific-documentation
>
> I like having every board model listed explicitly in that ToC. (Though we
> have broken this rule for the Aspeed boards with "*-bmc"...)

I put this patch into the pullreq as-is, because the series is otherwise
ready to go and this was a minor thing; happy to send a followup patch
tweaking the title text if we conclude that we want to do that.

thanks
-- PMM
