Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1642485lfm;
        Mon, 15 Jun 2020 05:23:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvC6lTFj1XimAXgOnH3uj93KGZCBPmO+qxdDw7OYVdsPM4sZelhxT65IBj8z1dPTLkNK4w
X-Received: by 2002:a5b:610:: with SMTP id d16mr8724722ybq.289.1592223814766;
        Mon, 15 Jun 2020 05:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592223814; cv=none;
        d=google.com; s=arc-20160816;
        b=u8+8PpdZW7E+b+M6ye3qI8ZDbsg3yCMwzTy3cQd0YZEt+5j/DVWUkcMGWOMn3qS3m/
         XJX17QIzGkElKCJoeKNusPOy84jRM8vwRHeFN42kMlJc4Kxw7zXmtoAEUVOGLbBJ4mxT
         yOAJwhmGhRGMe+VH78BzAZNFDgrKOJ6y9M8HujVd655jh3UbQOw4rYRHSkwF4WLt6k77
         yECULiSd87gwl/UelmrS1lgQcnIOMhtLccMFoX+eE5Vh3WtauvLYtU4icgDofXvU7Hei
         IyiM8L2Te6n5kZAJoxRT0fm8l92mr42y+4QXYkyOM5Rn6x8qVMnm57BoNzn3nW0aKYxh
         kKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaDE4ZYdGzsV2wxB6szKgCsHjBiotD7bTkZ0++Hm7DY=;
        b=hZ4STMQiUhoktcLCms464JXiK6W31OZsWk+KZKKbxq3Dok18f2puWHgHNWihTR1k5x
         7fJV5W3bKFr9NcgfVaJmoabPTLrlL9uCPsYh6kCihphnAe3mvQDwmdMV4PwEN5HZZwCG
         WwsmlJiX/qJILPabBpRYpZKDCJx82jovKBJXnGddjy6rL/ex+6Ddtrw3K+Y+vYCI4F4+
         6gXUSgmRk8xjRxxTGWW6nZ/utzfYxmrTmmCyoxpGenItrQehsWprYL4jpxYSSh4HP5Nk
         IF4iE+fOtSElpIyhi/DJowN4e1LNHPu7GYLKDK4z6/7adE77vEwtPDp8WOSmH4xouF8Y
         Y5wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=thyxRV2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si13083725ybp.419.2020.06.15.05.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 05:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=thyxRV2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jko9G-00010T-6B
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 08:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jko98-000109-Tl
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 08:23:26 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jko97-0000p2-38
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 08:23:26 -0400
Received: by mail-ot1-x341.google.com with SMTP id 69so12937154otv.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eaDE4ZYdGzsV2wxB6szKgCsHjBiotD7bTkZ0++Hm7DY=;
 b=thyxRV2pZlkrvTA2y/77D4Wf2+GWcl0VaWYl+6ZtgakOEwv2EKrOHLYxpY3PzoNFQr
 JRUGqINYjI7x6GoVHpDuJ2N+WxjxWXkkh3v7OyzTNPVHwc6PpFL0XBAghioyL84Xjb3D
 zrDJYYJ+cScOHmEqQozBqscenB9G2pvMfVdfEv9mYzZyVZ1HW/plUwyr9xPVzkBe2VIG
 Ig0nsahxeKKxL44z4SuWJeDhP1vbu3HwTmMJvsn6bgObVBoIkFGJqEpPJAKKkLxOBu6S
 blxC9F2h0kWuCkpwi+woZUMbs8PbhpffRxqa2jo8uzTMKjX9FX74I031wKAcCBKxwvCl
 ptlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eaDE4ZYdGzsV2wxB6szKgCsHjBiotD7bTkZ0++Hm7DY=;
 b=bqZBkb0Jx41ZQ52AVk0fIPRNaQAB56QTkiCDkrJjIlrmHRCpRca67QRI0DEJaAnONb
 7u78oXt3XgxHzFueXbaky9igLSDOcZuZraFUpXtSVSddK3XH6YkzZR83crFLCx81mMkP
 ZGXCkXhv05YFe37hBICjKPzPk18BICxFlBdHFoFlBFvyuzcGrU3PHypV0FGC1EVb2PIf
 ZnRX4I2W0Rv2BYx/V+nHIVgXv5ujpOZb61rkP2xsDy/6LkPr29racMFAzuRiFNBciM9d
 m4z/CIctH726VJfn2ZVrQtEmSJMBlM/aiqjGsHbpRgVE7Rgh6rgl2Bb7JhPpa88Swdsk
 suwg==
X-Gm-Message-State: AOAM532hyjXjnUYGLDylRlmaQvrMMnJkTGrPrplPTwexhQQiDiMRs21r
 gY2ZVD/QJdnKJU0SjMcnz+2cVtXBOJVnq+EqEw9rxw==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr21753266ote.135.1592223803661; 
 Mon, 15 Jun 2020 05:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591272275.git.jcd@tribudubois.net>
 <a6223b7b5c1564afc5fb3c2a9ad514bdb41be5a5.1591272275.git.jcd@tribudubois.net>
In-Reply-To: <a6223b7b5c1564afc5fb3c2a9ad514bdb41be5a5.1591272275.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 13:23:12 +0100
Message-ID: <CAFEAcA_b0k4m29NqU82GC2xvjQXTVkYWQei8hrG2fxjQAcgc0g@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] hw/net/imx_fec: Allow phy not to be the first
 device on the mii bus.
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0wtD7CqVtv6B

On Thu, 4 Jun 2020 at 13:39, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> Up to now we were allowing only one PHY device and it had to be the
> first device on the bus.
>
> The i.MX6UL has 2 Ethernet devices and can therefore have several
> PHY devices on the bus (and not necessarilly as device 0).
>
> This patch allows for PHY devices on 2nd, 3rd or any position.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index eefedc252de..29e613699ee 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -280,11 +280,9 @@ static void imx_phy_reset(IMXFECState *s)
>  static uint32_t imx_phy_read(IMXFECState *s, int reg)
>  {
>      uint32_t val;
> +    uint32_t phy = reg / 32;
>
> -    if (reg > 31) {
> -        /* we only advertise one phy */
> -        return 0;
> -    }
> +    reg %= 32;

This change means we now support multiple PHYs...

>
>      switch (reg) {
>      case 0:     /* Basic Control */
> @@ -331,19 +329,18 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
>          break;
>      }
>
> -    trace_imx_phy_read(val, reg);
> +    trace_imx_phy_read(val, phy, reg);

...but the only change we actually make is to trace the phy number.
Surely if there is more than one phy then each phy needs to have
its own state (phy_control/phy_status/phy_advertise/etc), rather
than all these PHYs all sharing the same state under the hood?

It also sounds from your commit message as if there isn't a
large number of PHYs, but only perhaps two. In that case
don't we need to fail attempts to access non-existent PHYs
and only work with the ones which actually exist on any
given board?

thanks
-- PMM
