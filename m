Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2096992lff;
        Mon, 14 Jun 2021 08:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHS5YgcG0pB/F3goIWt4ekI+6yfXhcNUbZYfaBWMMb2PztxM5mC6dyhwlUmGZnjhnUxZBq
X-Received: by 2002:a67:ffcc:: with SMTP id w12mr19127320vsq.47.1623686363815;
        Mon, 14 Jun 2021 08:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623686363; cv=none;
        d=google.com; s=arc-20160816;
        b=aAUGT7gecPYmsdWtXa8CnrgRPxW6rcZDbjw+i8eGamJrc6Ib7zhpZYYFbbZoZ2HaY9
         fScGV7XExAGvOJ2i8nu9DTtZSEEG7n5n1V6gYrkjwscecSYMai+P2LRhYWrf4O7L5Lht
         9Fsq0jsAepDD2vQZEWuAQ2AyS6tlUz+dJLI+8CZzqi+Bc0I3t5vKLbWsB8VNMU8iMoes
         Oj1ftnJoqZeP0iW0LE1b/tAZPxKsIdnB4Ukb/K+vKml7RYnLIQkqlKxzPYTNHqtK8GVl
         slxfsR2yiI7OwKAnkY5W1+9JDpGmouBQ3aiZBdayLJKzWOAm8tGY3r+RZp4A3qb0EbyZ
         uq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=32bMIUTxeonRFRYrGNFnem2Rh5dCNI78PvgM6rEoxZM=;
        b=gx8H++/53oBFhYFx219UEX99dFktG2p1IpcPdpfxwgN2Aqj8kZkVrYOPQ2hUy3dVAf
         xZEMaV0aqqhmBDK695YyEyU0VigzqtaRhbX3XEguCksDrYM+yK7CPdbsVLD3JkagOOcc
         Zzx0YrQl3226pg7QEW35vDrdTx9LXfUI+b+Y4Nyz+CAAtbAu5KGIjmW/jnlx/i5fSA+s
         EIZ/JH2+c8gKYLD6GHce936ayPNJbVOnPUVxKlD3SMNTodsb9HyJk/1+gtYPkiKLrYe4
         qtu+o6xQLt8FwPtU9BkoYi2kWLjnQBKKnjS0bYGAtJptneDAz7cDGVpoKQf5mWVmYlZA
         NGAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRW5gwLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si546725uaf.119.2021.06.14.08.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRW5gwLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsozj-0006ak-3y
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoml-0004Uz-Bt
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:45:59 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsomh-0003S8-2M
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:45:58 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ba2so45362454edb.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32bMIUTxeonRFRYrGNFnem2Rh5dCNI78PvgM6rEoxZM=;
 b=pRW5gwLtiLlut3KIlHILgsING7SK0jXinODM+UwDS65FH65HJKZebXjlUtvVukkoT8
 2dZsA1hcsVm/AtU14/V6bJmZDDJdZVd1C0ghUJdBZsxStCqLDoFHpHukFPHL5DzR3IlZ
 glVxDZ3jpLnDQL4xKxX4git/tvik6wvMkNuaCt1JPlpfBGyElDcC2Xr2ZuhkpdnwZfjO
 sv5JUIAt34hl4cDkjClH7PdNfJSob7348JckfWZD8zqcEd3lA+hq3JQWlFZ0atJ9RvLf
 BCZ2cAj08gw0XBkjQ/MHE77sKFm0dPz95eCteLm9YKuYCnAqBr5+ze7o6ioyGqaw/UTm
 EzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32bMIUTxeonRFRYrGNFnem2Rh5dCNI78PvgM6rEoxZM=;
 b=mSqAy4NrirpYzJVNPwUTdrvdg1IlxyfnMBLWRpoFYiSIkC6VrYDo6ey8UXwxTFfEDe
 cFkasQfOx1RRxiQ4qdJu2HFdooiZHUAt9OM+Oj3HBYjGp1sTRFg70ucb9WoAtuvun66u
 SrHy7hqy2tcy684Xe91zg84ltKwnpHgyjPupE0+90arx6HJp9TXOtuG1ov1igh3ylr7o
 LPSK1m3oQ6Bhnm/af+Vy8WEPCPyjfon/fo+32pIybdgz7blrwauXBcbspNktnn7O4A3y
 nakQ0nIP/yAddtm1WXZoSVZAV8AGKete141XziyUp1kEbEuaM+Cr2G8SMlSZ+LL+vLGI
 tgww==
X-Gm-Message-State: AOAM531w/wLBt1eKpiTryRRU5Bdo+DY6EfCTI/sau6OjNz1D5yd/6D/s
 fk13860l711QKnD9WKTLG7sveOSiAYetIH7HPAepPg==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr18018209eds.146.1623685553161; 
 Mon, 14 Jun 2021 08:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 16:45:18 +0100
Message-ID: <CAFEAcA_6_DR8274THptyC=pOocDa6mEtJqQGxnh8ioY_8FmiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XHg05v3t6MBl

On Tue, 8 Jun 2021 at 20:36, Patrick Venture <venture@google.com> wrote:
>
> This is a board supported by OpenBmc.
>
> v2:
> - Fixed missing hyphen in Cortex name and dropped TODO on hardware
> strap value.
>
> Patrick Venture (2):
>   hw/arm: add quanta-gbs-bmc machine
>   hw/arm: quanta-gbs-bmc add i2c comments
>
>  hw/arm/npcm7xx_boards.c | 93 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
