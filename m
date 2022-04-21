Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp244410lfk;
        Thu, 21 Apr 2022 03:38:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfKpUbA3wx3yhemD8zGwdpVdUlYGT3DdnFSCXVxwHFGlmR0Hwgypnk6UALZtF7KiYFX7s9
X-Received: by 2002:ac8:5614:0:b0:2f1:ea68:b5a0 with SMTP id 20-20020ac85614000000b002f1ea68b5a0mr16753802qtr.280.1650537503321;
        Thu, 21 Apr 2022 03:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650537503; cv=none;
        d=google.com; s=arc-20160816;
        b=NUlo5XIq37SBFFDkp1orZV3UVrOdriEDHEYulsaPAhLKqmIvytkGUOUZt2B4O10Aou
         FEwVyZHthGM3d1aSbyxV4A1kVk+GiJBIG/PzdszqobBHSHL/0D9ZicfCBTh9vy/XVCzF
         tGRsCImMlEUFy8+PIDF+lC6NmIheTCneMgPZolkiXVzEmRZYmMYb5/5t2yAdr7NsVumo
         iKZAJUKN4QHb2qJzAP1pILUyoi5+/YZAqVlCWIkqahQKuByKEiglzKInbt3+GG6gAT3s
         VbCDwydD5eeVbu1W6pDJ68KA6+aqOR1/IHovrEEoHM/KH2f/mVB6yMAT7ja8I0G6pqOo
         Ig3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gz9Lii9GKOKWdgiXgfZKu/yHcP1nd30WO3pM81LGP5A=;
        b=R74SfO8gjWxObF7GaRxm5CMprPj80A3r3xFYVFcQg2wsUxTxTnQro7u0D+p4bv1dLG
         51JLqJyXbLnVdzMEQUBkU5qzC8ZU+H/2n4YDM2cg+MeDAENfAeIII172dYRF5kt50VGh
         WIO5lbl0Z4zM+I2aR04wkhrSWmSTXm5Ximcoz8SMeXPJInNmL4jZlBkhUdm3mC93cuhm
         r9BTiVO7mO7sR+2v61Z/bULU4R6H+ot4oW+3khdYL7RkwRP5GvhfCvZ292L30TvdJRKT
         ngUeOb5PdS3bd64zqxntpvVBt8cmt3y+//sZqna0chpxgrwjbIM6pvRwg2IVUznkotPd
         Fmlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXk3jpGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18-20020a05622a041200b002f1f95719b4si1224773qtx.727.2022.04.21.03.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 03:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXk3jpGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUCc-0008U6-P6
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 06:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU51-0002oo-5t
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:30:32 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU4x-0002IL-VL
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:30:29 -0400
Received: by mail-yb1-xb30.google.com with SMTP id b26so2308594ybj.13
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 03:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gz9Lii9GKOKWdgiXgfZKu/yHcP1nd30WO3pM81LGP5A=;
 b=hXk3jpGkeAZsCZAURYdm7F6Z9Az7N9DQZ8SjBGksA3S/ZCaatTo2Av364QwY8/vIbF
 zS9vgxZmfZevxTy2t6jH+ghl+ton7nlsJkFtVAEcEFe3gQFTfHAPbJYhA8AnJZ7mgz/F
 p0j8XstENtIV/b3Y7l5CAlThETX9l7KhdhROHACri5cMxnZPOJFGG/S8q7rsm872hDJz
 fYsgtqSsCq/JQSRewtvPOZ8Ye5Zv/QqXEjU6NpqqxAeMMs6Vxs4msaYxZvYJFAFmjiVQ
 cE4wRQ0Pj/7de76QzClbL4v5hfyxsac3em05TxpjQmmMaqyLAxe+bvBi4egDF47pdIZF
 1qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gz9Lii9GKOKWdgiXgfZKu/yHcP1nd30WO3pM81LGP5A=;
 b=Q+Jua/5lOCI8belfQFCdqptWzUDk2cEyZN2M3RDV5SfmYoAii5mm7x8TVHaSmj/ltL
 7TVFAjZnVhJ/YvpFApYqas/sL3wsE3SXbzgNW7MLlHqiSFsUvbbYElaN+xbTwLxYRj3+
 mmNEJeVladAPZcKcfBPVHh+eICdOVCCysVeAHetxm0YbXiuyxwmbQGXJSmcTmlSX77vi
 dqe0pvd0iQKuWN9Uql8wC+6FP1aexDolvK4FseWypV1RgZgG2x5Y2IFaWGyN25mvWGSy
 VG6SQ+Aax5ZaQly20mv5+WNw+4PPH1kUwuVIAyFPrq9Qu31NYnCNAuX3g89MLU0fmIrf
 24nQ==
X-Gm-Message-State: AOAM530GDOoIkZaYdZWUWceQtekAMWGdOstahsXN8AOCc8v/PMbrIpN9
 b51fTe3YAFznnlrZuLn1Ca8wZXo6u+J+AJ9F2n1sPA==
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr1964651ybg.140.1650537026141; Thu, 21
 Apr 2022 03:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220411165842.3912945-1-wuhaotsh@google.com>
In-Reply-To: <20220411165842.3912945-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:30:15 +0100
Message-ID: <CAFEAcA9JKUh6BEgfEnrA1Wu_fdMUgTyfHWnDwh=s0Te4N6HBqQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Define NPCM7XX PWRON bit fields
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWbTumSxtRHx

On Mon, 11 Apr 2022 at 17:58, Hao Wu <wuhaotsh@google.com> wrote:
>
> Currently, the PWRON STRAP values in NPCM7XX boards are magic
> numbers. Similar to the aspeed ones in hw/arm/aspeed.c, we
> define bit fields constants for them and use these fields instead
> of the magic numbers in the current implementation. The code
> should behave exactly the same as the existing one.
>
> -- Changes since v1
> * Fix errors and apply suggestions Peter made on v1.



Applied to target-arm.next, thanks.

-- PMM
