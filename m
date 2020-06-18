Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1553340lfm;
        Thu, 18 Jun 2020 04:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXEwMGYvrmUi6VZSVdOB2g4IL6oSjiqjhgKH2r1khyWZSKVo4+4jAQP4QPAPgYPcRnfhAm
X-Received: by 2002:a25:3dc7:: with SMTP id k190mr5764283yba.139.1592480290525;
        Thu, 18 Jun 2020 04:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592480290; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZEqwgVEeL0gp2s9NZE0FDr0ItKycpUt65EkcaoCHRvkHyTCDgggYE6QXfgIfjEi6z
         I+cgiAmF6owp+BfqWWYjexqFvKifxhRglMK9xWTLiS8/royyPHLfPQ+/B+jYJkuQfCLU
         AXE/irgGxQJviCUMWoMtGOXu9XEybDuaINtsSzOp1mAB7NXgPEKLoMa15zzwOPu7tSQD
         QAicqHrDA3HOI+6qrZlxKrGS4F4Gfi9hOVwnJXv9zxOb0f0B4LVs8Ux+ZCq6BLgODLzI
         vnSfHp/ixNDaxgy1P5ERGPpppgrK/AScSS+nm02jr0cHqiy0yuTQWkuEl7gGhaYNSVMB
         1cBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OEkD0MKtKYrhh1Ml0/jzE1VEHMrSYiNOWo+yf5ADuvU=;
        b=1IIIoFbdzAUBpcxHbaNXwewoFO6SFc73RG/P6tGCkr1Vnl5hYUwUKSx8ZPGBRNT6bn
         XTWJG97zduvqmuN2pFtVU8LZvx4+YvxShFpeEpL4zwOLMG/ciIOO+hkHtbU2LGciYLw8
         PYzHApr53K6Ui86VhLBReQZDfne/IZahTiIHSYti+EIWsTE3R2Uo8SlSMQDgD0GSFmNj
         sQ4Jz0QZPnG2Cql0YK7SpPz6yrRhHW6BptCl28hNXT0+zz41O2+zl1wR119LF6x52UlO
         IIXKblfGJ/GPg5vFhRx60HuI5u5GPL94VyNGvHAajNhFgxTx8uqcPSyPLe+V1EJixkzA
         vJow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FWEUEIOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si2366406ybc.337.2020.06.18.04.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 04:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FWEUEIOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlsrx-0003Vi-TT
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 07:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsrp-0003VD-3f
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:38:01 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsrn-0002sB-JT
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:38:00 -0400
Received: by mail-oi1-x244.google.com with SMTP id c194so4766485oig.5
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OEkD0MKtKYrhh1Ml0/jzE1VEHMrSYiNOWo+yf5ADuvU=;
 b=FWEUEIOR9lj13KyR5qwPjSV2JW4KEo3+WtGO8jMEKuTPsLeJy1cIj4xLAqEa0RcLfl
 HnNrX5pUS1FwkexFsWPTTeqaedlw8WQ5405DkH5NSWconc0KKd+u20XUjcwp9fiMA07M
 yPknkVetISylyYIUIiCBMKjYdazRggmMLOkttEaS+/fQxIk8BSEbaX2S+jIwWK4HDdeK
 /PoYU2F0DyY3RRZwBdUaCiLr/CPoxQfapJKXQTXBwqQPPzpQPvLHKuBmnzoKX6jEPU4u
 Z8u9SCrxEQWzuRNLA2o0gwmy4C3O9+c/uvE+Poyz29v2Z6aWDiaewn3DNSoulcXHgf6v
 IDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OEkD0MKtKYrhh1Ml0/jzE1VEHMrSYiNOWo+yf5ADuvU=;
 b=dEuQyerKihfhniz7uc+d5dh/HYwPkyfSSJvJbLnk/ydLWoeBOjtz8AalGTrvdrmxXB
 FIK3eiRpM5jsDB7j6yc48ZDWpUy3USp38Fvi6EgDSV/NrUc+46jMt8mf/NuzmY1/obq8
 rvQcKax6qeqtZ6Cs55bvQXRHzVrCWMR2cxImCayR+n7rOTEGZjqlyZA6Os9tYj9IlJbP
 t9o4mbz5QEJbr7igntnFv86KIJWFyFOlGQXoqB0UR/cyFxC0nIcAzLqlCqBMFEg4wJud
 vHTcnFRIBE4MhpzPINXKJif+QlhZcmZODf1L1Luz6gzW6HVOxWu2hWJ+IDeZ9vKm4zGs
 c2og==
X-Gm-Message-State: AOAM531DIIimsJUYjRyKgn+W7qatQamYs1NqjePwU2zex7fE9W91hNJx
 ZUcO/gK70b3ijMbPBtYk3ujAzjEK1eNqddbgIa04ZA==
X-Received: by 2002:aca:568c:: with SMTP id k134mr2359942oib.48.1592480278368; 
 Thu, 18 Jun 2020 04:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-9-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:37:47 +0100
Message-ID: <CAFEAcA8u9au_5pp2qZ=1oGaHvEzK8wpvxYRXsp185DjfV6ByRQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/42] target/arm: Add MTE bits to tb_flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
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
X-TUID: fto8yrAk4s3/

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cache the composite ATA setting.
>
> Cache when MTE is fully enabled, i.e. access to tags are enabled
> and tag checks affect the PE.  Do this for both the normal context
> and the UNPRIV context.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
