Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp681743lfp;
        Thu, 23 Sep 2021 16:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpNFLMB14dZvhC1Siggmz8u7mmcZMWwqTMWw8OvxmLiPumvLEQKJ+rce7lOQCmucgo0eDg
X-Received: by 2002:a92:c5a4:: with SMTP id r4mr5793297ilt.130.1632440990839;
        Thu, 23 Sep 2021 16:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632440990; cv=none;
        d=google.com; s=arc-20160816;
        b=COCWDoQ3cKiFqHGtZETZlv50/KlipOSUpcdceq50FdXr0YMzR6Z5JeTmApFgIiPV58
         EgB5WfYD5vZniX5hvsNJ7xuoKGN65tAh+iTNWXziZE9lfbKULZYu1ZZttaLyHd9nk+mD
         tLZTZljGOvw766+EmbHWVcMh1FyeytKzQ36SCcTbH6uOOb/EbScWd8pzySdNLQ8uvtD7
         CcjsQzAW8pJmBfX+BRp/hhFUdxSpZ/f/3NMj8l2/b2mQXVBRl9ep4ENb2B5TcWgHMBTm
         mzZG54d7hs991gIU6LS7ymg9AI4cU3Q7NCoGfDPk3SFKZ9LZ7Ij0DU7HZBiVgDILhSGz
         4+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=SiaPm7VFghtWYEpTBCmszHKT8zGjlYK3NfQjXWsN1yo=;
        b=jnDUmIgG1aTGJz/110AGtDglyIpFg5pufShZjqdtTVxgk+zCNVARSsTnZsixiLljLW
         GOCEIUJ2OsxEHraxjRhJkjWVae85fWszay/cUMgR7dlCFF2JZa2kZoS6dAnA31G7yFE7
         mvIS5Z0C7yblAGfZaPCrUWqmvSPS6mCNxrjDnRFQFTGIX27EW79jOfarTOJEpz8KJoe4
         1fd0hj3DKfQm2ve05QspeWIJrFjm/su52tm4iQaDfsqLV8CnNXAPk/sxIfAWBCOGkjYs
         q/p86TVOmdXnXn6ASYxnbZZggn2w6UWKa4Fnbq+TE+JPLcyrOaPbmpLynWtIye9/53dG
         lJ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Kxcd9cJH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si11198983ilu.143.2021.09.23.16.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 16:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Kxcd9cJH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTYTO-0006Hg-7M
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 19:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTYTD-0006HE-Ui
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 19:49:39 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTYSy-0004YX-S8
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 19:49:39 -0400
Received: by mail-ed1-x531.google.com with SMTP id v10so24567381edj.10
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SiaPm7VFghtWYEpTBCmszHKT8zGjlYK3NfQjXWsN1yo=;
 b=Kxcd9cJH9fMsA8AuFzjFsd1gdums9pIaKDY/Gx7zPnQabOBct18DEvgY2rYm4smvlj
 kyphQriSWwSyNDp93HaSRcw7WAwVniclImvPJrHP8DxxNlbn6u8/bZPMNnTnQzSViIuj
 dzoJgjUQpGnKjtjZdZ4r2AuH2X/UYxCGqomAHAimo4gLLCyvaJdRSrM7LuaLNxTZWLTd
 z1nU4mpT0EUEt+hGWYNJRa88lSCymkcoxQhOAZ7Ly0jc0UiZtv1C5CB3XxBaPrqIIHRG
 AoyrikoEuRMrTaA1g8/qP4I3zOCpdGkZeZppkdfmAuqqZHV4j6yxftEWcuOAVlcwzKJZ
 /SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SiaPm7VFghtWYEpTBCmszHKT8zGjlYK3NfQjXWsN1yo=;
 b=cRIpgkzmVjRDEn+ZzIMWMsdmd5s10mhTyGizEPC2NYCqCNmhoPJrSFx2FF8Aua+N8w
 dBCXs/U1nGE/8BPBnQpq6sERKPG0ic5+tOKUkSl/x6u4nPZ0+EwoFBhRRyOCNE+JVpx7
 DWo6w3CJHjNb4wsL6sG8gQUGXCwA5S/Vo7RE4RzP61raL/ET/bPYiNPOT/v7uqfjgQTn
 fW+6XHMRENHTimQSNaxbmgVepPs1QunrpMbC/3nPI1Wu2wJBFTpcLRxP7hldx8BAkpxK
 ctvTsONvCWCwLMCgyYma5dUloWKXhw8GSSN+4YQsKtYOjRKylSRmI2l1ifGaW9DO46Qc
 mS0A==
X-Gm-Message-State: AOAM530sBDusRwgp/d1rH46MhmzHe6uNLksMVNq5jXrua0WGAcAu7lVa
 xuzOPsVDRmGJuquf/e9zg0e2W4xRaU0UdmrIaub9vA==
X-Received: by 2002:a50:d98d:: with SMTP id w13mr1849483edj.51.1632440961715; 
 Thu, 23 Sep 2021 16:49:21 -0700 (PDT)
MIME-Version: 1.0
From: Titus Rwantare <titusr@google.com>
Date: Thu, 23 Sep 2021 16:48:45 -0700
Message-ID: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: clg@kaod.org, "andrew@aj.id.au" <andrew@aj.id.au>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=titusr@google.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 69FiE82iULLc

Hello all,

I'd like some clarification on how the following code transfers irqs
back and forth:

> b/hw/arm/aspeed_soc.c
>+    /* iBT */
>+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>+        return;
>+    }
>+    memory_region_add_subregion(&s->lpc.iomem,
>+                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>+                   &s->ibt.iomem);
>+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
>+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
> }

and

>hw/misc/aspeed_ibt.c
>+static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
>+{
>+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>+    AspeedIBTState *ibt = ASPEED_IBT(dev);
...
>+
>+    sysbus_init_irq(sbd, &ibt->irq);

I ask because the code in aspeed_soc.c seems to connect to the
lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
hw/misc/aspeed_lpc.c:408.
I noticed that bmc firmware running in qemu was checking the BT_CTRL
register less frequently than I'd like while editing this patch to use
the IPMIInterface.

Thanks,
Titus
