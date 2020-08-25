Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3490523lfy;
        Tue, 25 Aug 2020 07:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze/BAzSVQ9jJ5v1tqVeiYLkDxIaSkQ8UQYJZ4SeiUvTMZHMqpAu4T4ep1Sd3LQMGkLUaLO
X-Received: by 2002:a25:d387:: with SMTP id e129mr15044320ybf.370.1598366012274;
        Tue, 25 Aug 2020 07:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598366012; cv=none;
        d=google.com; s=arc-20160816;
        b=W6EbrHzGN+bWk1VkhOnsCKXE7WlGILyOj6YezTrk+wv9RmKPOWMAkZWCg1JSEff52d
         oMB3K3PdWLNPZP7nsJP+goP9iVg2lvi4z7+m7h+4YchSOtIQb7lgi6vaGR6QSP6oQrSN
         +eDZ2+icdEs172sQW/nvjVwQCQ3QoWUQP3i+cGN9TW+P+XpcP0wi59Q46M7kBpsQ15fB
         hsdsCRORJwkDqiR75yhYMyws7qXzR6y5f4GZTLjRQBB4wMwQMKRv8QR7lGIZP9EhE1V9
         uYsaD6CAu6zlE9jzi1ssOhqbG1b2DrVf3KksxSe59wAtZ/T9RxvpYj3V9fjgxJypjcBQ
         c2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BXoGBFSP/ozVQq2SgzK2VV9+jgrvoL5S6TxC14lIQb8=;
        b=BPuwm6ml9yddL/3cVrAssHDmkYNoaS+T88qT7LLPwUgAfbySloVqTSNChirojaCvK3
         72Lp2+h1rMv4qp+7VEdEanGeHuonuFrUS/mEk2+X+ovjb603pZYbxt43ki2LhLP7NZHs
         dq1acYTobMJ2sBal9jZUzBPPcv7H2vkm2UMhLr0b7OlZcCWEEszjxY2Imhj6wvJTGKnP
         2Z3qSAUoB44uGJvRzE94SIJnRZQKPqBmHo4wrCFPsMRICeFxgrR/mMqW/BmXKSENE5LU
         9ZNebdpAb3GxXaB2lvcTW96nlXKJ58rWWgNFWXDSq+AGbGtNnY1fQld+vK3H+iEj98It
         7/+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kWhMZLU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si13786791ybk.145.2020.08.25.07.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 07:33:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kWhMZLU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAa0x-0004a4-Mt
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 10:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAa0q-0004Zt-Q0
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 10:33:24 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAa0p-0004z1-1B
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 10:33:24 -0400
Received: by mail-ed1-x536.google.com with SMTP id f24so9139169edw.10
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BXoGBFSP/ozVQq2SgzK2VV9+jgrvoL5S6TxC14lIQb8=;
 b=kWhMZLU58Y1KtIhozTjEvBPXm0Eg9n9ln6SkD37fgYrGIiS64D3NPiDAo1deVi9eqX
 brJBAEBURlbdb/uI29FxmagMvLuwz+LmT0k/lFStHOjExdVBIVKfCDQZv4FjDAArPDyu
 nauVjG5iHK+1gO4vF4MCRbQgbOnuqspym5HL5QIbl6kwXIPcoYGqfDxX5lJ3mNp38yXG
 cBg+V9TDeKDJI3gZz8XyKd8kYLj5oxK682751its4mounewVmlO+NM5j+nHP60QxkoSS
 eS9cCDyvz+dtotT0BAZhy26VjCpHmHfNaVwkHwCXfBHL9jbGAthOhiGAeTADUwnrryay
 /wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BXoGBFSP/ozVQq2SgzK2VV9+jgrvoL5S6TxC14lIQb8=;
 b=qNOv9L0oWQwNSm2i8gnEREUN0IZKq6tGqa4MguvzaQ0ohH/FIyzkuV+1tyj3iwsWt6
 r1sOczFprQKNP9H7RIMpwZ+RlZSOgNugWIMH4FEtlo4sqGRAWfpJ4D6kEYb8OHEfGNCy
 mVmXZ+CeeNyIqZFvHpsWqmk2hpQkKIIpuuYpTtCZ28rXYDO/kWPexERJuVSL1zzNA+Zt
 2vYWJytalBfs27Y7e4lgRlj2+cphZOkgH8gjZUE0KC+qRQMwuVGEkRlo6fM0CYamDz+H
 lkfoA8cee4KxVVgknhmXfqYaNFcs+cY78WoqyrUhd8FLl0644mIE3Ea6sFvqyXX4pgvZ
 0lCg==
X-Gm-Message-State: AOAM531Vsk9JhwhoO8mGmg3UyjfPAohL383gXF/MntbhvD4AJzWmxpb4
 ev3GQYX+1ikdtcLzNlZYtTiyi/zERoql4B/wgtg9aA==
X-Received: by 2002:aa7:d596:: with SMTP id r22mr10698381edq.204.1598366001478; 
 Tue, 25 Aug 2020 07:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200819100956.2216690-1-clg@kaod.org>
 <20200819100956.2216690-6-clg@kaod.org>
In-Reply-To: <20200819100956.2216690-6-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 15:33:10 +0100
Message-ID: <CAFEAcA_GwY5qqLFYcttobLRnt_b=HoMNHMXEZrDHyRZJ4mjGug@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] hw/arm/aspeed: Add board model for Supermicro
 X11 BMC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, erik-smit <erik.lucas.smit@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WLz+sOxmuS/l

On Wed, 19 Aug 2020 at 11:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: erik-smit <erik.lucas.smit@gmail.com>
>
> The BMC Firmware can be downloaded from :
>
>   https://www.supermicro.com/en/products/motherboard/X11SSL-F
>
> Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>

Should the name in the From and Signed-off-by: here be
"Erik Smit" rather than "erik-smit" ?

thanks
-- PMM
