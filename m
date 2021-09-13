Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3603131lfb;
        Mon, 13 Sep 2021 05:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwtwcdeTBFtE2PaH2IhWxORQVxrbccDEmyhsqyBCuVpyUy9aa+CeTgi2ITqJTIluj30bnX
X-Received: by 2002:a1c:7201:: with SMTP id n1mr10658264wmc.19.1631534796922;
        Mon, 13 Sep 2021 05:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631534796; cv=none;
        d=google.com; s=arc-20160816;
        b=FRURWZVF5wIaYT8I84hl5KkcJanO8SZGqUCLh4XXmkiPEGmgqf3JlecfDLOFLik7S9
         GfVo2LOEaUipvho6VgHcBV3Vhk9RKWvRB82bN8UtWM14+F3bp3qFaxGPUtU5uCztWHO7
         1HGXlibeu08sZMbqgfiFnEpLpXl4YVEV5vCZSiZwM7iDtwKWXBQZeqqHUaNrDlqvvUc3
         srER9wi1vOkTfSd3G9NKshkhca+U9R2G7LVs13vBMxBpaaOeEbXKBdegMfXt+bS4QsLE
         ngmWzmOcI+IKfBok1/xZoe1zUfPkJTLfg4DWXB7Hf5x9cVzfgW/DujNPULOIHmymaMft
         LXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kv+m7wzDZI30FajW9GsAR4z0YpXe2JN7uOHdZCUJ+oA=;
        b=MXUhmeZrNCl7VlY2swj2VmbkdqQRXsIiifm6sKzJ1P5w6rr4dSu9DyVDCzh8v464Qv
         B0t1gPXkDHJzplg9nJWMeu4P7xoLC/A+jKO7KBpWMNLc3A2plfY5eBI914O9buoOn7Rl
         l5Z4LOCX1MWAw3pPMu9ERmc8ydUsHcdlUmI4Yi5ilDwEfv01+B0qaDmQEa9DheWkgWEz
         lMNRRTSh/fhRpJ3rO/Ou0KS7UtjtHgNaEWzOfP11hy6RAAxr0RmIGItGPFW8IELmvJVf
         VIMxq+v6rlowA2le3Wzg/DCliukP8zs4/VKlsFCLY2aiefPMg5GgdgQOJFOD9Tjb+La6
         Hmmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qf2TLhvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24si9018622wmh.65.2021.09.13.05.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 05:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qf2TLhvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPkjM-0006YH-1T
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 08:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkc1-0004dy-Hu
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 07:59:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkc0-0006cS-2g
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 07:59:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u16so14271769wrn.5
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kv+m7wzDZI30FajW9GsAR4z0YpXe2JN7uOHdZCUJ+oA=;
 b=Qf2TLhvP83HTLZE6mpDOCd2EHLZG68Zu2Wy+BzV1gs1DFW8VrJ/Mqgk+kTADjI+L2R
 T+XVISKhrYDHhThBfMsBeSgRontINt0iuogAcqis7/Fa/k5y/Xib7p9Eh6jYkkXJ0VNv
 046XnY7AGwP5srzH1MDeryYJnb3tXeXuu7Fv2Ko6v3SQNu2FbLndom/srWRQWy/mdWlh
 SDywaH2olN68yQH6wn+0H2Yibjqr0+7om4HsYlrtnbb6VsZxiF2r0ov/GVbiMLwI3Je7
 ti/EoFCXfKCgNTjYzZ7HYw+gxvQBWOTRMJwNnEOTNK1fQUaRYJ/cpbBtp12Fxp60wWB/
 PgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kv+m7wzDZI30FajW9GsAR4z0YpXe2JN7uOHdZCUJ+oA=;
 b=Br52mFoWjWRTN289B0ykuxFVbNZoc39Z/OjrVkf4Fm0xxXwbHELTL8x1Qi+EbN4mQ+
 dtzNix0IsZsRMlrjG+7pQS2702Eocb6WQ9b/Ei54aQt2vW1zCPGz02k2e2hgACHnTnml
 FBS5+akoFCvD1mX7VYDlR6dWNLhdgSQEbOOJ5fhQd69fxNLqDJstdjlM0NDpigNiy5ic
 61zBMpbD4u1Oyg2snwVX7OmpUbZb19iVZWXUETpkVOGDnE0Uunn7oWsr8MBvH2VzPT38
 8KsoSiQ5CTMWMKLukPlYpSFPBdCMtsQxxcJ0CJPjmvpHACX+RNKdvcalGXobv/IiCRv2
 hyZw==
X-Gm-Message-State: AOAM5307cOUWKFXSOz2x5//sK4nDLSHiS81Tl0EseWah4eYRMf2sOa70
 3+k2gq9NKqusbK+/RlGjOzQpTaWlpOj8UKQWAtcbHpu7I6Y=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr11770777wrr.376.1631534338318; 
 Mon, 13 Sep 2021 04:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210907223234.1165705-1-crauer@google.com>
In-Reply-To: <20210907223234.1165705-1-crauer@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 12:58:07 +0100
Message-ID: <CAFEAcA_Mgnf4ENaK0MonaUtw-g07MDSZQ3dcteguUSgLmL3nZg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Add support for kudo-bmc board.
To: Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPiN/S5P+rUd

On Tue, 7 Sept 2021 at 23:32, Chris Rauer <crauer@google.com> wrote:
>
> kudo-bmc is a board supported by OpenBMC.
> https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo
>
> Since v1:
> - hyphenated Cortex-A9
>
> Tested: Booted kudo firmware.
> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>  docs/system/arm/nuvoton.rst |  1 +
>  hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
