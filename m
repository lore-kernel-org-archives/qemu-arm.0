Received: by 2002:a05:6214:32a:0:0:0:0 with SMTP id j10csp5772115qvu;
        Mon, 13 Sep 2021 07:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/iewM3UpPzQZPPIPV8N6J6WCJYtzLq3nY83E18Exq/zeFUcDskAscTDvApXV1B2aOu3T7
X-Received: by 2002:a05:6102:e85:: with SMTP id l5mr5202726vst.37.1631544719851;
        Mon, 13 Sep 2021 07:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631544719; cv=none;
        d=google.com; s=arc-20160816;
        b=G0nBvaRAcAM1sAQ9Rexi4CYEB8/SFTGY9sIJhdjSKz4GoLcM/pnYxSoLyRlWdXMPDy
         5GXwGO5FFn4Z6hVUB8n+O77lVv/KjS+78/0LMXS/AUK2D/gZwB6UbC7LSreX75RoA/wR
         hm24B6lXzzIZ3ggEjHhyotjxr23OEioKoSmCzzNrV8SegiEqCrDqCrQyk//cr+/UdiB6
         pSuJkj2p9eJYdSyAQ6VRsMqKFaPV2nEScs9cGU0Ljh/FSbL42vhI99r7J6pnxr/F6+rN
         pikW+NupmgXpHdGcc63pjgI4Tf3guzS1FRd1J1Z9nYlETyb5qFky/b69OP1vOUB4eMoz
         n0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SrYMRtJk7ttMu9E+AIlzAI9mOvrqICfOXeueLCjO1UE=;
        b=pnmku1aIRBXFHZNJZA6mYSeG/aKL+pIzhx+cL2CfvjU1ai4gb8C6m2KWHyDJVvXwzz
         FbaSNNvs4pI70ATuA3awp1kOek6hJ3OaPcPkgPyTDpenmt/eWeOoLdJ37w556+FBtLsS
         C6q8b+wGRJMszErDKAofjwo6mI6E+UR7gMbsr+4kayWyAovONKWfOuWYnVnjdzYoGtu5
         rTznnN65fdLNiYrcILRyuA9Hs+P/ZpAXJ2VkXLehe6cSeLWwkUdg1Usecuwi4KFNe0xc
         57uKfc6B5eRYwwv6vr+nWRhiqKcSQXaztwZcNTb1B2zZmAECZmcGVr0CiYimvcDL9Rx/
         S+CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z6TMxdmO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27si1785020vsj.369.2021.09.13.07.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z6TMxdmO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPnJO-0003Tu-6M
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPnH3-0000AW-NZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:49:33 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPnH2-0007sU-9B
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:49:33 -0400
Received: by mail-wr1-x429.google.com with SMTP id m9so15159766wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SrYMRtJk7ttMu9E+AIlzAI9mOvrqICfOXeueLCjO1UE=;
 b=Z6TMxdmO4cjMURQDJzpyPmwtyvcm4Sfur7HlHgi3Qb0KorX8N2b8c9hQLle0Ov5/qn
 CRkeZ98nhikNJ0VxNtE6IFt/cuhyTGRC5Vh8l0UBZvcvg0M4/H3fsytycTPXVDLgRb+X
 V9yNLXj0ACSQqm6Pi5N5t7EXMQ89rvbJQr/X247QHNzcgVz6LaMEuIcXDKtw+Pg6Atvr
 3BvpV0igYt/pGFAYf96F86Z3P13zwmU90QG3bPnPfJWpMQSdBiEI4r+od1bRqpxzbhHD
 BCaNqNVALHCbh3pJyq+9HvgpVQdf9idH/7AMMbltFtfvuzOvKO5QocCcvVa6EQO/vP44
 PLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SrYMRtJk7ttMu9E+AIlzAI9mOvrqICfOXeueLCjO1UE=;
 b=4sNyzR/bqGrH0GeKsPcakSYcTipSQJwUlj9HbcCQDbxihBR91YDTDvFQC1DEO0tjJX
 9echppC8QGVGahDycKk5wnaZPQXmEQKRLDTrM8SlCYOD8FuULvlFGgPgZCQdPC+BPtfo
 LSkzx9KVNRJRuh9OK/ZahQ3Rb3W9hVdN1dED72rEZ+E8D5bcq34P8AswtZUS21Bwlk7A
 YH0cQXetUFaffC/jY4ynuBGUruw9TvfRLe0Lpf/eRGaYuc+0JQqbKtl0qUIjLnIawkWJ
 OidE5Q6cS234Jd88bML7DilLjoYAJpwxSx0JIajpMrqpl4xYBf/w8jAUYyw642TQdKMT
 OpjQ==
X-Gm-Message-State: AOAM530jv2gf0S0CDk8fVsS21AOsmUi0WN4Oik6rzt5j+NHRR7iV/Nzs
 6FJKey79CUj16vAizK4NN8upbUK6u7zHsZZ+qRIlfA==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr12785001wrq.263.1631544569736; 
 Mon, 13 Sep 2021 07:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
 <20210907232555.3268967-2-wuhaotsh@google.com>
In-Reply-To: <20210907232555.3268967-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:48:39 +0100
Message-ID: <CAFEAcA8x+djYN7-+fW6CLTRDP+WhjdvsQF4pdMRiSmnjofezLQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] tests/qtest/libqos: add SDHCI commands
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Patrick Venture <venture@google.com>,
 Bin Meng <bin.meng@windriver.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Chris Rauer <crauer@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bjRF53yRvFz6

On Wed, 8 Sept 2021 at 00:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>

I think this patch would make more sense placed later in the
series, just before the current patch 4 which is the user
of the functions added here.

-- PMM
