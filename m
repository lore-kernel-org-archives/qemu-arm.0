Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2479428lfq;
        Fri, 9 Oct 2020 10:31:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyid/n0GIdOZVQmls7AgRhooE/wY8e7pmcoCaqNUK+8Yqhf9fMnXfw0R4dcCSPXqqLvBqs2
X-Received: by 2002:a25:515:: with SMTP id 21mr19229576ybf.114.1602264668509;
        Fri, 09 Oct 2020 10:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602264668; cv=none;
        d=google.com; s=arc-20160816;
        b=S5v9LHDwpqSvXauFQcyzTu3U4YPypecBMSW1KZ7dDveadqLyR6SNitGcSB/0oZpd13
         Q8kPP3ENtwVW93KTFMcCONruQkK4PiLWEuiW+c5KLaZ21UY6HSJSCSW4+eiMqbpE16au
         KZNeIphWrBB7b/JUrOaVYECHgDoUoeUXA2XBBWV8PqTqcTvx7jZXX7Ea1wDTwFCu/bAg
         JlFlWa5iFHdinm0cbGUFMulZfwn6yEmnrbe/Gt9HJngtUqBIHjDOt4vxWE+I4e/IM/x3
         8vuYXtc6GlruNcue/1H/bdoE/o9wcw+EXUPiNGpcRXj1FKgdfsmPuL4Sepgxx+lroFNJ
         SfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:subject:message-id
         :to:from:date:dkim-signature;
        bh=KZguImmcqnPK0Fiq01Pu+jFSQd8X5P/YuUJ63BD9prs=;
        b=Qcs0Hudp2IFhuwOEg2aXZPS/ij9Dq/j78T7JpvOjI8khSb4OiWoYCyEV0X+XPSP8Jg
         xOHsmh+oEBFvAp6SBbDRlgCuF7j1j9dYoxLLKYOuvGsQ6mLrGGBrUKoyrESmn2fw/6yO
         RnzsgLSwv/zS2pp9b+Codok/XzPlj2oRooygdSNlcc1lSGg2CE8envXl2rNhDb8yUrVp
         6sFppFzLKzin4/k/80KJ4TKj35x0jS5c4RGgBA3/byyZjJC9XNZwN3xg/4C4OpL+V71S
         Y7KCeOy2gA+DHEfJpj2POslH+QTyHBlbh7VlBWB4UXisgVep+ANDLLRlJhaEbP0xFLyy
         9m2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UiuVu/5f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si9510577ybm.451.2020.10.09.10.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 10:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UiuVu/5f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQwEV-0008Cm-Tn
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 13:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQwE3-0008AG-Pt
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 13:30:39 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQwE1-0004Pr-UN
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 13:30:39 -0400
Received: by mail-qt1-x836.google.com with SMTP id g3so8513546qtq.10
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:subject:mime-version;
 bh=KZguImmcqnPK0Fiq01Pu+jFSQd8X5P/YuUJ63BD9prs=;
 b=UiuVu/5fMfufNdQr9WjmQZtfdk3IyK9urYu6k3sD+QZ2U8Fv5nu+U/d4fDgv8nGYVJ
 SOSbyVmUa2iGvajocZsJGW6JG1Q0burWAbUd1Rv7+YoqSPBAjB4NZKwf8Ync+NRreGbl
 HYzn8mAgSEIW3upOVvRjrlSlcxma8bIbuwv4fXGVVJVqBGhxtyPJ/AAOULIzBXK8gUwL
 LRqZW1guxE+sdh02t0S8XyaTbGLylEtzB55KARMXhSM4I84wJhwJr1XtOgxN2Lun8uEP
 BcK+XqAqGHyYkHAGC1LBOCkEscjZtT7+IzFSSLDWkkjzSruV/DKULhK52kqz9DXcH8Cl
 +76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
 bh=KZguImmcqnPK0Fiq01Pu+jFSQd8X5P/YuUJ63BD9prs=;
 b=TFpn798R0JRgEJHKGpvZB2D3pEziFsN34aNKqM4C2IkMepXBhWW+FpKHTkXOVAfi6v
 Taw5y9LInC8OuX3Qgrtj6Ygr+3+lgGpqcI0qYIYaZLm7yOb1ESpz+0tNvElhBSlmlsgT
 IwYMh5Egth2yU1itGJ+56KrwmGVM3TzwFaYAlq5l/TsNApB2j2KBoC4nVnUxoblEM9VK
 3P/fWiX2aIl5ruoeX6DnNLkzypVSUUtLZMMwy4idEykZdrNDrnTmChORAxX4I76A5sik
 yifXKxNRn3hfD5jVscCk0HKvF2PLS/MfRIcFi5YOZSAVLtT0Y6sNf9YPgHUnf4IzVGrH
 pMwQ==
X-Gm-Message-State: AOAM531d5lVTkCaPhlJ3kiR4djC5ajNBsfx1J7p1rtYKxzgYfinvZmPJ
 DS5y8sC9fCJT+Hj0Cb2wRgtXzkI5sE85Cg==
X-Received: by 2002:aed:3089:: with SMTP id 9mr9719974qtf.168.1602264635980;
 Fri, 09 Oct 2020 10:30:35 -0700 (PDT)
Received: from master ([2607:fea8:e2a0:e950::d884])
 by smtp.gmail.com with ESMTPSA id p187sm6257346qkd.129.2020.10.09.10.30.35
 for <qemu-arm@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Oct 2020 10:30:35 -0700 (PDT)
Date: Fri, 9 Oct 2020 13:30:30 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Message-ID: <74151CBD-4750-4E68-9127-21076C019036@getmailspring.com>
Subject: Re%3A [PATCH v4 1%2F2] hw%2Fwatchdog%3A Implement SBSA watchdog
 =?utf-8?Q?device&In-Reply-To=3D<CAD8XO3YmTC7fzxttg%3DQLMpJbg7uLogatxN7q7vf-iGZjyQLjjQ%40mail.gmail.com>?=
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5f809e36_50dbf110_10e8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x836.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_IMAGE_ONLY_08=1.651, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=no autolearn_force=no
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
Cc: "=?utf-8?Q?peter.maydell=40linaro.org?=" <peter.maydell@linaro.org>,
 "=?utf-8?Q?qemu-arm=40nongnu.org?=" <qemu-arm@nongnu.org>,
 "=?utf-8?Q?qemu-devel=40nongnu.org?=" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qn0R3XZB+XwM

--5f809e36_50dbf110_10e8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The value being returned here is 0 (initialized to 0 at the beginning of read function).
I have seen similar practices being followed in other qemu implementations like for example bcm2835_dma_read() in qemu/hw/dma/bcm2835_dma.c,a9_scu_read() in qemu/hw/misc/a9scu.c.

Please confirm if you would still like to add specific value like 0xdeadbeef for bad read offset.
Thanks
Shashi

--5f809e36_50dbf110_10e8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>The value being returned here is 0 (initialized to 0 at the beginnin=
g of read function).</div><div>I have seen similar practices being follow=
ed in other qemu implementations like for example bcm2835=5Fdma=5Fread() =
in qemu/hw/dma/bcm2835=5Fdma.c,a9=5Fscu=5Fread() in qemu/hw/misc/a9scu.c.=
</div><br><div>Please confirm if you would still like to add specific val=
ue like 0xdeadbeef for bad read offset.</div><br><div>Thanks</div><div>Sh=
ashi</div><img class=3D=22mailspring-open=22 alt=3D=22Sent from Mailsprin=
g=22 width=3D=220=22 height=3D=220=22 style=3D=22border:0; width:0; heigh=
t:0;=22 src=3D=22https://link.getmailspring.com/open/74151CBD-4750-4E68-9=
127-21076C019036=40getmailspring.com=3Fme=3D2a4b90d6&amp;recipient=3DcWVt=
dS1hcm1Abm9uZ251Lm9yZw%3D%3D=22>
--5f809e36_50dbf110_10e8--

