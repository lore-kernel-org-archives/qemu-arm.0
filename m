Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp41011lfc;
        Mon, 8 Jun 2020 18:36:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh7N65hYga0JJV9new+HjUHeaBfHgjx8v2RfY32gSmy83g/z6PfyKMIrq1t2TzhzlepOlL
X-Received: by 2002:a25:4e0a:: with SMTP id c10mr2464423ybb.346.1591666612779;
        Mon, 08 Jun 2020 18:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591666612; cv=none;
        d=google.com; s=arc-20160816;
        b=RU7RehCSg0w++0rtzZAiKEbxCNjFF74WOSueoR7RG+Zz4cTewC0i4T276vIEF4esAG
         JBEwNwUtKt/kKNuORK39URZrqWVF9ol7bCRG/c5N6feXcOpgxuhTwNjp2gkZns3Oc16S
         IYILXg2LpotSafQCSGitfgew9DJWdi4I6NP7Ojvfxvi/xj0ut7zhLv+r3Tu+sqBoNpRK
         fNtPivza7MjSmo0H1V7NOnFTb81OJVjZMqt4NjnEtxsQDa1wbleVbGAgHBXeh09U1vIN
         EWvH/vJw7RvNKFjmtX2RAPYfMmSa3C6ShxAcoMlTlNj68g++xY1laZ1M1Ly40Dc6HVKR
         XBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KhvhSmf6bHsXItz7ZSJvhp4Th42f2tl5qO1RgZS7OsY=;
        b=BIWLxoVtCcQmCp6bpChFTIC4FOyNXWBQ9UCoqAzuPAS9safgr+m94kwaX/+APuAPA9
         evzthNSqXeP6Gt4J67vxfeyyS4tC8J0skrjQVFsefvs4Dp1I2aLcpXqMoo+Nm408sYhP
         HWhMwjcHBSBRu16/0FjhYNgoymkV0dpkIyoT75k7VoGCGB9fVNiZQfw63xnrD3w2pCfX
         ny2xJjo8tei/sdfAKSubUvQVwuDLXS+xbkpjjyJl4NrtS47rD23w7ganmTawIH2W6uEF
         AV2NCT3f7kLSg05A6gxu9AZaFUI6QwL+yuysJR3WygIXhYKKHFFDN5mXw+/MuF9nIoyQ
         NV2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=hWMWcBYy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f85si1325566ybg.21.2020.06.08.18.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 18:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=hWMWcBYy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiTC7-00035W-0u
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 21:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTBl-00034l-9V; Mon, 08 Jun 2020 21:36:29 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTBk-00006z-Lj; Mon, 08 Jun 2020 21:36:29 -0400
Received: by mail-ej1-x642.google.com with SMTP id l12so16704694ejn.10;
 Mon, 08 Jun 2020 18:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KhvhSmf6bHsXItz7ZSJvhp4Th42f2tl5qO1RgZS7OsY=;
 b=hWMWcBYy1DVfhC97tNo3P90gaAxEIrsttTfKaP3L/ZdUzUgxlxbPCy/9nk1Ur8bksm
 aDVZ/zYlOMqfavhO6lQMPKb6itQpeuGqWM8N1Dyuvg4YwvyTlCkM/UAkDMU2VCTVb5aQ
 jP1GA3J0yDPQMGSIFyrNDZWTvNBh/XJa+RLrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhvhSmf6bHsXItz7ZSJvhp4Th42f2tl5qO1RgZS7OsY=;
 b=gD4SitNoZSfzTTejr3gjJqId78QkUa+M+VNFPuXnikjQ5n/nhqGQbU4W5z0+bV6B3o
 M3A8vPLq+cK/+TXtJ7C8DFBtXbE74VPCG7xw9fW59cof5YUhkuMFIArFSiq++i5JwerY
 cr4sbp7X38nrGsYrcma/ATAqVUHm4tseP/YiZL93vqyTt8HKdZu0CQFYYXbMUBmnIYEB
 md0/un0fGiFYrn2vdBoTLcCM/HGVcl30mHUuX2rQi4ZOHv9XlGAtvuC7MQxjPNQfgW3r
 3dVvByt1ul+1M0fYFj3KPaK59ZPDhRB0+mggsFHk0WXhLDba7JWHD49N/5Pig9MI/K17
 x2oA==
X-Gm-Message-State: AOAM530MjlTrH7jTXxVFUr4UIa6a1e4hCH57tdcfh8AoILQfdBZcDiNL
 T82YfbZlvTzAELKIFlB/Avu19OMPgDkjfoPuQDC1LGdP
X-Received: by 2002:a17:906:fcb7:: with SMTP id
 qw23mr21981896ejb.229.1591666586645; 
 Mon, 08 Jun 2020 18:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-3-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-3-hskinnemoen@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jun 2020 01:36:14 +0000
Message-ID: <CACPK8XcYNmBYb+OXKZP1sSHqC-1pTN4=S+B7TdOapYkmEC18SA@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/misc: Add NPCM7xx System Global Control Registers
 device model
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kfting@nuvoton.com,
 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EGm+KtxpPasO

On Thu, 21 May 2020 at 20:40, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> Implement a device model for the System Global Control Registers in the
> NPCM730 and NPCM750 BMC SoCs.
>
> This is primarily used to enable SMP boot (the boot ROM spins reading
> the SCRPAD register); other registers are best effort for now.
>
> The reset values of the MDLR and PWRON registers are determined by the
> SoC variant (730 vs 750) and board straps respectively.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

This looks similar to the aspeed scu model :)

Reviewed-by: Joel Stanley <joel@jms.id.au>
