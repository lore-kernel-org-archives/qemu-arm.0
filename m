Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12318641lfq;
        Wed, 30 Dec 2020 15:51:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRxmTbPvSv9WJAXLirvPajOEfYyA3zAChuOov3nN0K3rLP9qDmYYUQXK082f1ETt05QW/w
X-Received: by 2002:a25:55c5:: with SMTP id j188mr60335165ybb.455.1609372312216;
        Wed, 30 Dec 2020 15:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609372312; cv=none;
        d=google.com; s=arc-20160816;
        b=Te5Oh+G1MBWXDQdX8c2LkdSThYs0laswaByUtjOKkPzkbCDLnFrYajCjARe+RTFBi7
         DbrLjLr6jh3Y7URxm0pea3Z8g3KGp/wFjiWDffAaiFinQl2bKR44dKH6lSyeu300okVw
         TCvGkEiqcmyGpTr6Vjq3ANvRf4P6aT004N09TEYy+vcPqO3KgiIMK5bsBOX7+4d67Z33
         FuKHDKgEKRHxeCF0LyqGTIjAH/obggeD+PIDQXbIYfyrNH3gyijjHS+czIpic1KwRsmc
         w/zLVjBdUBB/qnv1nsMPcxQnY9erV7evkgpKIi8bjG/a4cF7YH6ngQzQAIUBy/TCbfab
         pbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=INrNCSPHna5Q5SFMnCRtfb0NpALehAgSQWwjH/1FFg4=;
        b=hyNvymLaFbZWHkOJEXvAjfJflxvT776H6PXazf9KYmMCzAGBJIjFcRkj0PCgdwH78N
         pzK6IzzyO92riWqFw7qREfP3XyLvUEJ3ZaAnT/g1NziKhTKdjFRuNafLd1vGvX/ErUXI
         IIRdTaLNeJjnA9/k/qO20sCzBZog7KzaUFHKa/ffDifwc2L1e6mstNBTZUF2lfgFSv8f
         MRgeMHrlJdO+RKGQ52ls4PVFHiegKQgQk5X+/gNemUGICmSZcMncUAdVYZUvRaRlQXCt
         Aba5BuUlA58U1JNOobNstSMLBJ2UqKsOZ1rMkYMGP+jKuSCoIX8/3hHVKthHeS9JWwH2
         Fsgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=suMEZOrn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si29657786ybg.242.2020.12.30.15.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 15:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=suMEZOrn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kulFv-0001NQ-LK
	for alex.bennee@linaro.org; Wed, 30 Dec 2020 18:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulFk-0001NF-Id; Wed, 30 Dec 2020 18:51:40 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulFh-0000dr-Kt; Wed, 30 Dec 2020 18:51:40 -0500
Received: by mail-yb1-xb31.google.com with SMTP id y128so16104058ybf.10;
 Wed, 30 Dec 2020 15:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=INrNCSPHna5Q5SFMnCRtfb0NpALehAgSQWwjH/1FFg4=;
 b=suMEZOrnuhYHOCIhzkbpV2rWmLo4F/V5xfsFPaCS6Z7hb41SS27kPP/BQS4btBGgK1
 I6dkUHJR1YDQCXnUShRv0MG+vPlwClx0X2cdsymceEhuFrFE26JeLpNYL3WJac3hbJG4
 Ezl8dL1m1ki8ObhMv8cWf335Uaecb67Fpb5u4yyc83a+Nmg6oGCxXBg/s8p0TrESrMyh
 n+ChWIvShT83nMEG26KBojEcL/0tbc+ICpG8TYL+v6mW5EDYcjcsOZriyEPnmZLg9SRi
 NQwfa6EBEHf9sPWuHB4wquiM751iz05mRd5rgC39BYDYAyy+T9KdAOljZuowrKAZM/VX
 D4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=INrNCSPHna5Q5SFMnCRtfb0NpALehAgSQWwjH/1FFg4=;
 b=h0j4ByJbxjivW3oJpex+sRkEhqR0qMMAsmFwJ7yAKni3y9QQuJJe8Fk/FgQO4xVbce
 2T+mzYe92EFLycr660VdjPT8GWpcsZx3PM9518eJs1mGaSfGt9Z/AJM4kOzQ5l7rih1K
 wm2cxA5ZCsdaZOGC7GUveEe7Sqibza8QEwRusewR+Gwe3DuZFyaYaolgoTICIuGPgmwl
 +FjonFFDJ2RMQXi5iRhMGFWau3v2+BeY2DMF1iVIokbQHSl7p85hIOmDxwg2PN94ML0s
 MZ8vxV5QLIDRTAlrTatH+B9q8yJmXWceaNGhr8rFTPNb/n7oqClw5WOyEw4pIcvPELL+
 RfrQ==
X-Gm-Message-State: AOAM532Pp4SL9sk1gFWZskqMsMpEoBWtYEj7Al7/uLisNCVkgRH6IUCb
 jgW4KW4Jxqsi0vdsjcnmFrKEVIusu4SmeBZ3TJs=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr23692664ybb.387.1609372296259; 
 Wed, 30 Dec 2020 15:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAEUhbmV8gfgtb=hXwimhPfMHs_nJ24PKHLynydZRVkuM8njV6g@mail.gmail.com>
In-Reply-To: <CAEUhbmV8gfgtb=hXwimhPfMHs_nJ24PKHLynydZRVkuM8njV6g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 31 Dec 2020 07:51:24 +0800
Message-ID: <CAEUhbmUfXOqPyQqFaLgekLApo7MBjMJnL97z0vY=0Rsh9rW-+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4s4VF2hkWrxL

On Tue, Dec 22, 2020 at 2:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 6:24 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair, Peter,
> >
> > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Avoid using a magic number (4) everywhere for the number of chip
> > > selects supported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/ssi/imx_spi.c         | 4 ++--
> > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > >
> >
> > Ping, not sure who is going to pick up this series?
>
> Ping?

Ping?
