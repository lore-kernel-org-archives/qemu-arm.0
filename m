Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1588301lfq;
        Mon, 11 Apr 2022 05:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDXF1TjESA0b0G1ra39wCYtZFIWJSbh+a8+eO0K29yAhfB/k3Dl5SiX1z/bMeaCjf9Ylr3
X-Received: by 2002:a05:6214:29e8:b0:444:a9f:43a6 with SMTP id jv8-20020a05621429e800b004440a9f43a6mr17493880qvb.99.1649680479018;
        Mon, 11 Apr 2022 05:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649680479; cv=none;
        d=google.com; s=arc-20160816;
        b=zONgTm7Cse7UCx/GlH4FZi1hRD5l46N8D6vvCXyhb/ZlY+0iKIIYsw/wNUgfAJvL6B
         m5LhxeNrM/q568L3o0TWn66WcT/aaS0N1Re+EHgleZ6lnWTumbIoHqjbOUqlVfKZC3yA
         zix30AdH5V9ARLNKO4PTxCvpbqRmHPjtUe16loWcRLR/K+l1ALhLsCITj3UcQxUJEXSq
         vm5tGlmriucQdyBcAZ7v4j1t4Dgsdoyf4gDE87TiFhutGIpW0zAPV5DNpVkM3bghGcAT
         6UxTISCUeWl53BPrv+4l4KdC5EnaY+eQDibsvuRXbHVI7aOVNsKi8X28UL/BVg+37SNK
         mJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SzjeWyGNgo+UFU5clrJfgD018XUH1VS6uMg7Z0Uip8=;
        b=PzWR7wMVCtjQdigluBaZRBcisfEr0qOxJYhSvHuwBIJQG8rdsM7ozJcQaJKa+Z61u6
         YChRH7cfXzR0F0flD1BPGr9Z75VpT8JTN0DOKgmTKspXga8pv0dWYsV15/i43ATRxZph
         buw1iJoAskIlCUgzN8jMq05KPip/NXKSsRmZjxhRvU8Oeq+HK81Qgsn6iEuPbje8UvNx
         OY7TmyyecKGoIdAa56nxddE9IX0rp+IiiFv7QCEU/eOh7WVKU4x3340NMjJjQ56iBxFn
         2qBDEEmADxm161I4VYJWt4R9XkoxKX1mS6V7JLQpScUOA+5DB3mrfyi8KnjPHElj2vi6
         hBbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJcFrO0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt11-20020a05621427eb00b00443c7c7ce65si4178794qvb.410.2022.04.11.05.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJcFrO0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtFe-0004Pu-HS
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtFN-0004M5-RD
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:34:21 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtFM-0005UA-9a
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:34:21 -0400
Received: by mail-yb1-xb33.google.com with SMTP id w28so5078172ybi.6
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2SzjeWyGNgo+UFU5clrJfgD018XUH1VS6uMg7Z0Uip8=;
 b=WJcFrO0gHcayjre4xzB3eiFuYfg8TCFfbR97tqtZaEEFVtN9o5FSRlytdrdf7p6rZ4
 wRSbEdMe0iKqmHxItyoRVMfWJRPG5hmgJb6Ig0mDkh8HDwHodQM4xcgBQeviDMOBi2DV
 FV8wZQFpZ6KIY7HRaEcEtmhsYqhVHYSwbRCtrO/12niOTeKKoQBSUo12GvbDUDoUl+IB
 W6ApH28Gbct5q1tGwQCOFyXpv2ZYKrwzqNh/jlHl794UUGabf/Vz1mdBhiBnvakk/Ds7
 v9ZEGOLflgmd48r1xDV/Fp2t98RdtYfu2kT1/TuuloN4gULlWOPquu2x3brgOp8UCWEL
 cZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2SzjeWyGNgo+UFU5clrJfgD018XUH1VS6uMg7Z0Uip8=;
 b=lFx7R5R0e+EnfhCIpanuiC1oFkvrRNNyun9UWGhwRyfSzbINZSllFltVBriLOprNVA
 5Vy0+SzLQJX2x7t7vxioEpNByjJLBN4nZdW+jWvubd/nKvGc6W68vyW2GbG+Wt6FlVw4
 A7qlGtl27mf1nyjjXLV7b/dwBwayqzweDDflJ1LkqxibuNmZ43hbW+32nEA9zA1CO9Yi
 xf3MqZ55sAYZyeANmrSq/V+dsYzFP6tDACke0MYoFA+srNBh0EH2fokx+miyeUXCGOAO
 RvrBuvF+/DT4H582wa6gv09o++XydeZXOYzD+HsKs7itcO+td3oAUGRcAlt+VdCD2YXt
 dN/A==
X-Gm-Message-State: AOAM533PfMnXbGSqSQMXW2At3rhPnl2jaQ8aSWZGOXT/7u8kdnA5J14G
 gBKvGQs5WHU3vWeAYinEwUPtzLQbSxkp9JjWyMk1I+5sY/o=
X-Received: by 2002:a25:ae54:0:b0:641:1aaf:c89 with SMTP id
 g20-20020a25ae54000000b006411aaf0c89mr7993375ybe.479.1649680459443; Mon, 11
 Apr 2022 05:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-3-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:34:08 +0100
Message-ID: <CAFEAcA8-THDxrBoo3wB0OPEz_8Zu_xjs4+xTXQ2+FHzJaS60CA@mail.gmail.com>
Subject: Re: [PATCH 02/16] target/arm: Adjust definition of CONTEXTIDR_EL2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KlyChpjt8Rk0

On Sat, 9 Apr 2022 at 01:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This register is present for either VHE or Debugv8p2, and is
> RES0 from EL3 when EL2 is not present.  Move the definition
> out of vhe_reginfo and provide a fallback for missing EL2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
