Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp557782lfb;
        Mon, 4 May 2020 08:31:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJWJsGpZYRmnO1UpBcmkFb4uLdzWrC0G/86DHq/wgoLI1QzEpFO+fejt20I2Wb7mh+P2lDV
X-Received: by 2002:a05:620a:1282:: with SMTP id w2mr7491084qki.40.1588606289919;
        Mon, 04 May 2020 08:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588606289; cv=none;
        d=google.com; s=arc-20160816;
        b=CB/Oh0KInn9l8pxlSwZBK63+l+H6Xj8rzPhELgo6VAHr+aUQ84vssQUvP3gpUSamEB
         p5kZ8TE7xIlNFqEfVADCfppoEhQO8RprgH93SKxK74ZP5rbBs5pfH7Vflbf/SZwWWZ6S
         EUbhv5gB9suHbv++paIaYLPnkxjh+sgjc6ec7H2dnClKv0ahnWEZYgttIM7elGPe4aBa
         /aOB5FgFUu2tKODRhYPVFOzas6IJx7YqUKU0AividTpUCwr3rrr6syrQT9XltbSHizhs
         vvVA/R0/qDnThAtqrzSKi3G69iJ2OLrGYf0zA0ogwYuR0zVDnb38mE6p0TcT/0kzMvWw
         Y+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=OCxln7r9CtY3KwMZIPpbOtordTxgRoQdjtUPMOchYF8=;
        b=rBL7Y5B34IW0KvQH+C2eTUpeGo8d/337MRvxwzXWgCZF4gDqGpeSEek1D2del0q7O8
         S5KUyZYjoQK602z7gLsP1oL+68o9VXk7pbQkupZQ1V/lx3I4jhh5bz4swHuPPulf0cNT
         fioCklVLcgxRAguxi6Sm98jUsqnNUQkBCtb7bcZQgrDNSXl3Ufj6t+hDSpAqVgayLoKI
         ynquapyF7ug9E9gMYh4lnfbkPtdM5bPq/DCx1OYWOKGeVYm3/AukQv6JuGYH99SmtQ0J
         2NjOiMG+fYkcd7zoJaBuNJRkY4gqirHQiF8n4AA26cMrV5zEdkovqNH4HZhXV+mFKvaM
         CsLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bdXWyvbl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w5si7146194qvl.220.2020.05.04.08.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 08:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bdXWyvbl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVd44-0006If-N6
	for alex.bennee@linaro.org; Mon, 04 May 2020 11:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jVd2F-0003vd-TF; Mon, 04 May 2020 11:29:35 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:45098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jVd2F-0003sU-2j; Mon, 04 May 2020 11:29:35 -0400
Received: by mail-lj1-x243.google.com with SMTP id h4so10077707ljg.12;
 Mon, 04 May 2020 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OCxln7r9CtY3KwMZIPpbOtordTxgRoQdjtUPMOchYF8=;
 b=bdXWyvblRI2zWFXu09VP0vIXcF9pUtprKN9kxGW+KuPPuMNRUOVFdfHgqhAPT+9jYu
 iiJ504v6ajs8uYMdiqlDShu+3oiYfWnTiVj4ie+5O/+F48BDgPFjUA65WcG5PVWy+WNo
 HCGaohD4POSt3ofE+H/MVA9GTw7AXNn9ZSOEtCMhPfOtQUifD9tyYhbAaITW2gw6r/Mw
 AGnrmpLEv4jFFy1m1l73h4230aaD5gFNLUtYYoakHmt5h9mY8+9L/7MPS2g3MoUFxsVa
 wmWj2E/P4Gt0Aaxj98WpvZqz2jP1qegPmA/WA+QMFlQTwhCxLk4J3JMrac/xjHV532SD
 JZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OCxln7r9CtY3KwMZIPpbOtordTxgRoQdjtUPMOchYF8=;
 b=Tls1+Kp0q9izJ6+T7VJkUUGjBSpsbZ1+UfogFoYxREWVd1aY/I4LdfhXePbybg58S4
 +3JatKg3oBbcQnFtqWQ4kvfp2LZhM03zLQiemZmlLw9QZh3qxnH8Kn1kJMWYtzzGodqV
 PSHz4KO+6gFfz+Et0mGSLtHu2c5+lGVhSvU0yAFKzcmc3f8cspGVOB6XsbictkiTh7WU
 HUkuj3+r2V2y8QmLrbGxCFXTPdc186uRRF6ckiUjrmwwnYo6nAjhdG1zOpUCjUYLH3El
 l4yVQjvdPlzia98YWVAdb1tVy+Cg3bJLPphDCFvQV/xo80nI4gACEqqkRqW8GQL7+vZR
 okUg==
X-Gm-Message-State: AGi0PuY1aMkqEBySCFx8O5btkZpypkAW00374aY3FYwVeVl2hZFADxpR
 1RHUcK1FprWBx+gpc5lD3mM=
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr10847069ljp.164.1588606172617; 
 Mon, 04 May 2020 08:29:32 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j22sm8482690ljh.107.2020.05.04.08.29.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 May 2020 08:29:32 -0700 (PDT)
Date: Mon, 4 May 2020 17:29:30 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 1/9] hw/net/xilinx_axienet: Auto-clear PHY Autoneg
Message-ID: <20200504152929.la2w7qapvf2b752t@fralle-msi>
References: <20200430162439.2659-1-edgar.iglesias@gmail.com>
 <20200430162439.2659-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430162439.2659-2-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_WHITELIST=-100 autolearn=_AUTOLEARN
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 jasowang@redhat.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2iju/QcdG66y

On [2020 Apr 30] Thu 18:24:31, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Auto-clear PHY CR Autoneg bits. This makes this model
> work with recent Linux kernels.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/net/xilinx_axienet.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 704788811a..0f97510d8a 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -149,8 +149,8 @@ tdk_write(struct PHY *phy, unsigned int req, unsigned int data)
>              break;
>      }
>  
> -    /* Unconditionally clear regs[BMCR][BMCR_RESET] */
> -    phy->regs[0] &= ~0x8000;
> +    /* Unconditionally clear regs[BMCR][BMCR_RESET] and auto-neg */
> +    phy->regs[0] &= ~0x8200;
>  }
>  
>  static void
> -- 
> 2.20.1
> 
