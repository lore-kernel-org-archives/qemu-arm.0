Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1488906lfc;
        Mon, 8 Feb 2021 12:51:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQTl79nTF/4bHF9NVYkMLPqE08kN4Ze8tkDta3BXB+eBX7N3QuDQ/HWI/Pkc+KwittNgzO
X-Received: by 2002:a05:6902:6a2:: with SMTP id j2mr11094639ybt.48.1612817464105;
        Mon, 08 Feb 2021 12:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612817464; cv=none;
        d=google.com; s=arc-20160816;
        b=YjYFJii/ttkoQyjPBno0Lew+0sJ/hSLART/J4mPgMS7O66sFucAtpnFUi+UotfRAsW
         ax79GNPFUlx3trZUz/hm5HfDHfAEeq53eP8A+Z2GweBPcG16pQpRvVK/jX50SUGdlXao
         0O9WyVorlBnf9wcfJtN22k17/E1+oH3rADzUHHgaj2AoJfhrgmYr7InWXBVlHUwn3Fpd
         +uvFeIqOZJ8UkSCYxZopQ/lA3FJD3dzgLyCeP8ohMtRt2Up8D9ke41m+/tQDImS+n5eT
         pZ7SLBpTjRGiEml57A0p2WXBdGDfS+XMahWW4MQVWF+8bQUpEmFxKNrACq8tNT0unRfj
         9E8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gH+tlT7ntK/krzP31qbwxm9FnsbagvS8jMw39i5JdlQ=;
        b=RShxwBfbnpByrtEn8j1doxiEInWakPM1OgXhbk81uzqB3V0zwj0lHFMOnbemZ6sUL+
         cfxkJbPnod0WS/COwvJtddheKWXxcQr4DRx5WjsTPa+VdBYGi6k4RVOD1U82H0iDqD2q
         IW3gGku2V2MPkU07HD2KVSoK9wPu44iOqycg/XD4FyJ53n1b+sldCBmAWKnguLsEVlx2
         JmH1ZSMk6bAralDg1KZCNKtOhWcfaqGEStByz378KZk+rBqUmkuqkXtIs76X4F/CbFHB
         YP2rMtZ0UQO/+klZNRTiyr7Ail5cobHNmEDKhM5U3P68T8YmGTjnhZPiXrkQeimTG86T
         84sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzvokyOq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si18142562ybt.281.2021.02.08.12.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:51:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzvokyOq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9DUt-0000LE-8m
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 15:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99ln-00031I-C0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:52:25 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99lj-00084A-Hz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:52:15 -0500
Received: by mail-ed1-x532.google.com with SMTP id z22so19080930edb.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gH+tlT7ntK/krzP31qbwxm9FnsbagvS8jMw39i5JdlQ=;
 b=ZzvokyOqQ4YfxAhgpYAERpyvqZ1RlBDlCK/HnhxyhsqZos93TOscEN5a0zqFJWpJOp
 lrVXGh9M6CXHva42z+DHNVWMDeFRRT8XLViTDyN6IfGHNus5DRrKiPmQ0xH29qPtTVIM
 YK6bWwSN8HtX/zL5FCWwr2G3wKaZi7hamDKSDfNABmGqegOm6iTLrsPNnYDkB33P2x6e
 ouTRIpJ8xZsOV5jwQnLgsQuKGOByOQMVmSYucouDwJZZ/Xb9yFS1O4a9d5RI4ROlkvXf
 F3PvEzm/WfmUZGR3Wuc0RvaHe/tpw7bfirhl6S/mJzy3gi1si9KXYWxU8ZB0tCGAswkH
 7Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gH+tlT7ntK/krzP31qbwxm9FnsbagvS8jMw39i5JdlQ=;
 b=NRSrZRat03LxqYqPS1UJ61EFQt+JS8Q+5U4ghS/SPgjtOlrGbrNLFgf2ezJ/j5caHc
 FH/AV+wAwyVcfx/+ksBdpbD+R5plwj1sCPWCASJA/ZlG213zggyUcOOf3wzGaqEZ79nS
 A3WrFvKCV2XbaBAACi1xyLZpkF3gdQiTXF4L6n7y0No/PlG9WsHBFHSvrDj16pE0RNWv
 /alGXAEj6+grXkJt9+H1sa+bfaRMcRP/eCgQqyLbq7LHhRsfLiFxSCIaK6axQcDyIJmy
 sUwwU6WUPNPWsQA0stFd4D/cf2x88W9HsIBxFqmbHquK/igUwdFYecBXYNpDEE4N7eGv
 mzsg==
X-Gm-Message-State: AOAM530LZuxuKP5oe0tIVITc/HHDUhUJ9xCcWCW+wblx+eHvRsLLQG5x
 5tr4krnHX77bnkEs4kKu/KXTJ+J6QHF5n5dJswHCxA==
X-Received: by 2002:a50:d307:: with SMTP id g7mr17078522edh.204.1612803126885; 
 Mon, 08 Feb 2021 08:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-6-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:51:55 +0000
Message-ID: <CAFEAcA9jfSaYiF_BYNo3Eh3dZvbvZy+gWDDHSLa+woBtFST+Xg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/i2c: Add a QTest for NPCM7XX SMBus Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hcPA8yIXOT6C

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds a QTest for NPCM7XX SMBus's single byte mode. It sends a
> byte to a device in the evaluation board, and verify the retrieved value
> is equivalent to the sent value.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
