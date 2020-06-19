Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp616840lfm;
        Fri, 19 Jun 2020 07:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1S+Ctkihl8ILVAki/+iVJwUhGaMlRfORSNASf0NU1+GgLABGfyXZOaPGdDylwMU0PbyGl
X-Received: by 2002:a25:bb01:: with SMTP id z1mr6232451ybg.140.1592575299295;
        Fri, 19 Jun 2020 07:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592575299; cv=none;
        d=google.com; s=arc-20160816;
        b=0uxeLJNGifBdU2DL11HcO1MYUDkf3sT5oZNnivSUnPzG40a5pfEza9MS9Rx2/xZEfY
         D6HzcgoNMfIPIW50Imd/rZyY7UHqZEvVzk6sPKDZXlzUgtlqVUS/BkmsS56ieQcpCtU0
         XXgPvGk5luIlDaCmEtSkj0iKU3lB7n5EWjFVm1Sk9EF+3FLkmldK4ss2cvyJa6r1Cmn1
         AQRAY2ZLbOneZc/ZNY4aoCBcDK/lI88oG6TlhkqPOR27DVIvG4yo1BtejmBImVHcEChZ
         WOGtAU7R+W7UgrsMDzIRuKOtjFSPyJSczSDnDPlIkOsLho0PsCUHbIQ54DJ3e9VCSEJD
         k3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wE8BfHfNAO+5nkJqhyMoLYpZJCH+W6T2oan6Gy3zaF4=;
        b=jm8XP9Yv5ePWC14OpXYRCzcYBBu/hIOry0AcRfPxpsRT66gqI4yvSY3Ryp1p0B6cKe
         bD2bLutV4Zyss7Qa0lqPNsYrFwgthGsYBIKXe/Gip8fi6/ZfMC3Km3C/5W9XEYgzpRVP
         N9BImj77E0cPRL6StVdeKlxwWcWJwZDBOyrYevUvPBamvayW/+de5uu+xXSTvfIoRnH/
         obaq+HzIiWJGREKW4Q9sp8ujAr78BK/kxnahwZCg1Uh2qltQfsWfltZVWI3jKdUiCmO9
         4w0eBnvfc/q7EKhl1+e7hIZp7R4HVsXToXuQ9SF1Y10MzxoybOjc2VqB9M/4iUIpgfKJ
         W2Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wp0bvtCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j125si5534119ybc.227.2020.06.19.07.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wp0bvtCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHaM-0008Ma-N8
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHaC-0008MF-LD
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:01:28 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHaB-0002cX-3v
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:01:28 -0400
Received: by mail-ot1-x343.google.com with SMTP id t6so7320862otk.9
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wE8BfHfNAO+5nkJqhyMoLYpZJCH+W6T2oan6Gy3zaF4=;
 b=wp0bvtCX1DVjY8i53WSljTA9NgGSDtFpPRcoXCtBxJss64AJA/yrY+/Xx/7ulAAEU2
 /Y+HtOfIwSK6ldT6VVo5ku7TP2c3mFbPbwTqf3r9YMKkgMxi4BFO1It/dwOprDcAndQD
 S/Dw8BM9vw5MWI3qJABfVSZc4ApEUdiQYfSuUbYT4zAvpZWItNqjCLnXgOAUn/ZD/n39
 ryq+LHUBrMyAsR68uLHS6G1dMYGFuytcWvi82vMH5OEiyQDo+20dqpu4H6rTmMegvmhQ
 Ub7lp7qMf8trej4Q0hvde31S10OC3Sozx7+9+0Ea2eVnOAhkHnG3GyC+BCL6l4d0iRx9
 GZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wE8BfHfNAO+5nkJqhyMoLYpZJCH+W6T2oan6Gy3zaF4=;
 b=S8upp4lRujHHodS+a+kxIZmCjzAxNvlXPfONdFubKRSoWDJy4HEqLCz+liVghrv5oV
 4Mxs/qfiuw3BpykRMZUrNnHDfbHb57Pb25BnRSZCuMye/mKPUTV0kjDWhrtDenrcmSX/
 VDEuw28wY9GCVVxZxKJ+oVFuFRNOtWIRaMrchi26jn7kXzUwWU5KOtf5uvokr7wZ/6Yb
 OOtd5rn/BGqbUYH36QzwAELNsNNbVrHLFO0SQBCnrwcqk+gI6dtVrKGUN/oHP2Dxmoo1
 R2+ZlJDeHjQ/ybEOivEhTNwh8g+Ca5Z2bMMPoBrv++qlS8yUARK2MM2tXFvmJcB5WxL6
 EWhQ==
X-Gm-Message-State: AOAM532Njv0lnbXBeLbBvMfx/MuSpzSe8X3N7JEXlq3iYOVzPrgjkExM
 wV85kG0Xr0FFw31KH71swdx2FFhcFIcSBdfBJS6Ag9bbFT4=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr3195825ote.135.1592575284528; 
 Fri, 19 Jun 2020 07:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-30-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:01:13 +0100
Message-ID: <CAFEAcA_Pi_WZ9JRir2y_MZmVH3ugCJuAd6PaenK6MTy05zuc7w@mail.gmail.com>
Subject: Re: [PATCH v7 29/42] target/arm: Use mte_checkN for sve unpredicated
 stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6QB65enP8BDB

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  1 +
>  target/arm/sve_helper.c    | 63 ++++++++++++++++++++++++++-
>  target/arm/translate-sve.c | 88 ++++++++++++++------------------------
>  3 files changed, 94 insertions(+), 58 deletions(-)

Same remarks as patch 28.

thanks
-- PMM
