Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp370640lfy;
        Tue, 4 Aug 2020 02:35:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU76rhuPRjDKOQGXhP/5UmKkwoC0BZbY80Dv1KORcLI3wXxpkLa9uwvdIovOAgGddyS8kV
X-Received: by 2002:a25:d253:: with SMTP id j80mr11473139ybg.101.1596533739171;
        Tue, 04 Aug 2020 02:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596533739; cv=none;
        d=google.com; s=arc-20160816;
        b=y/Zc4m6LfIjLDOOTasklm28eFfL/EN/SkKwPjuZVRMzx8vf8241491sltAhJ+FJiZI
         S1UZabaj65rm7IO9VFawYbq7952TywQ2DOUdm26/k/3LEu/kgzdlBt0U27z1JxLEjdgt
         gE1wPJvxiIT4jMg3ZJaxabqb4y1e51UBVHOhbS3P/WVheH//LCdUbLEACBjOp5DN3tsI
         5fW12EVEH4ID4IiO4XOCoBplCSVjcDink6oYrd8MoaVyvxuMKF8JptUmSEZevBsWrSWr
         q9cvsw58n6YuFFY6WzrsSoSInLv0gwH6ypYXWqZLgLBlprxfXOb9NgAMstP7QNm7wbZO
         tCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DUf40pCQbFYHkc1Tbjm8GFzA5xVuUuNQGJWNbYvNNQ=;
        b=d/toaYyICplbl8/RJCf5tRsW/S5GeO+LMjf2OcWqQAVZpcAJ5V6DXQfQkvjpumMFuE
         AWhcDlK7M2hRKxUuNh3n6AsxuYtCHNFdT38lorMVvrpoEScW0G5N49qcyGDZW/VSYD9u
         hUxIxiY4/Xc0zcix4e7PZbw7Py6MczlrmzpVDWBihlt8FsiMK33BSVdDA2NIJW42Rt9a
         DpwkH5u4WfDiwZutRBKdzTTI1SBxZsCqj0h9O7fn1RSP/7q4CtFGQkJv/L5DHrq+7TQ+
         RvnnlB9oj1vByuYz4nWVhN35L0E3avySm4xrsx6TmWFdwJI/uQIffuq44aCjToY3bNPr
         KO+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=byNs4VdQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si21685159ybt.100.2020.08.04.02.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 02:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=byNs4VdQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2tMA-0003T7-GX
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 05:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2tLC-0002US-Sv
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 05:34:38 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:34468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2tLA-0001no-Cm
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 05:34:38 -0400
Received: by mail-oo1-xc42.google.com with SMTP id k63so5023241oob.1
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5DUf40pCQbFYHkc1Tbjm8GFzA5xVuUuNQGJWNbYvNNQ=;
 b=byNs4VdQTamo4mjc8HwudHHCP2ZNIYvdCUzYaPRJPXVuCobLoRbt/go0jiFzfY8VXG
 hZw5U5qPKt+D20+2pcT8SM5GbJ8YuOKKBB6YGSmd3GoytiPb+5/dmxGn8dgVhCfondWp
 hvje1humQM4iFm1YAdWLNpRCd+/BYvku/jmNU0f7SxzwdpXCzyHBvN+v8GUjz+WAjf4c
 Hfm2uU28538y+Xly+nMg+IXEIw2k1cel4ytxDCqhsagHLsDSjbIqHkIH2OSosHJDy+3s
 Z8VWg85JYDNiTHJN29HFzi6s9Aljgxb8hv0d2mr1rK4qy1P32lyyWZ/LZP6qyN1JTP+c
 L8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5DUf40pCQbFYHkc1Tbjm8GFzA5xVuUuNQGJWNbYvNNQ=;
 b=UYvXQO8z+Z08+z7wnPi7mao5PYeCAyf+9gs0lUY3lSUrD9mcelHwFz84NjkEGi+mU3
 EHq+yxNvajNVn8/x88hQ12+3Chu0RwJmxueeNyHnm7h6H8wgG9P32LNwMJynECj4sLOc
 h+37tAuCwPmAvnzKzf/i0r8/zKj6eqBCVMSqpNo7NhHOSiv81+y3lBCfSOSV4vBQzL1G
 9v1rslOAioTdlzTqGmA0uNI45CumnYBIg8g8AQXkpA5wECNCeuJ/sRgZsfu+UXKkJEWK
 5mbveN599nQzLpafL3zH7T4I1rI8BvhApt7YT6cBA8VZz3kTAfoHIY/uKcNxR28mj/z8
 DrxA==
X-Gm-Message-State: AOAM530cEpLy5B7YLZC5luNzkwBpxNfRAa0vWf/mP9g4qwLgCOCoe9CP
 mDYPY08ahlaG00hxpiP7pnc1ryW78QdtfYNiULiyTQ==
X-Received: by 2002:a4a:8dc1:: with SMTP id a1mr17802438ool.69.1596533674960; 
 Tue, 04 Aug 2020 02:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200804002712.27733-1-pcc@google.com>
In-Reply-To: <20200804002712.27733-1-pcc@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2020 10:34:23 +0100
Message-ID: <CAFEAcA_TGmk+YMkc=5OF9rarQT_4cwrRBFLZsmkeDSgnmu0P5w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Rename function disas_ldst_pac to disas_ld_pac
To: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EQRrT63Rqepx

On Tue, 4 Aug 2020 at 01:27, Peter Collingbourne <pcc@google.com> wrote:
>
> The name disas_ldst_pac is misleading as it implies the existence
> of authenticating store instructions, so rename it to avoid that
> implication.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>

The use of ldst here matches the name of this group of instructions
in the Arm ARM (DDI0487F.c page C4-308, "Load/store register (pac)"),
I think.

thanks
-- PMM
