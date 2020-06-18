Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1515796lfm;
        Thu, 18 Jun 2020 03:51:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDvonsbFBoetV4Fewzt5rqHLjzt62gGauTqBEuobN7lVkORLAfVfrNa24rAlpSCD0TGayc
X-Received: by 2002:a25:3b94:: with SMTP id i142mr5186164yba.46.1592477489176;
        Thu, 18 Jun 2020 03:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592477489; cv=none;
        d=google.com; s=arc-20160816;
        b=bQf5MHUIR33Ug0gxnJDNbFcxF3R3Dsz0UxzVrB5MlzPCEbbZH4j5oTNQP4XaeaFfHi
         NsB9ZoHGOTUnnuBGj4S1pbMWFzp2iH+7ISYeV/yG9k/WGkRedYv8pEt6LR7yWr//v6gm
         IIi4HJXnEnqB1P7zpIhdoiBgmAOgUs9CdeTAgj9bp7Vn0T1oO1f9l6MPmDWMcLu65Kb5
         3yenKUtn25O5KQB9oa4WsaaMNZRRGK7D9Aoo3YQ80vCK6lQ5sKmAVJ0tzAozhjyHCSKF
         w5TPUA5UZr5WUuQeUK6Pyq7IHnOdhcrgX879vmUODlIIC7zS4tPr/rgLb3WTqWfvqjzj
         dk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mouus+/TiWLsqIZOvvBh7EWkOrRqd36lb+ghDPqTUc4=;
        b=p9P9M97G/d1/MxvxBvzHzDa4kRn+pCKB6FPij6vcr+A7O8ZcxcDNpAs6t0wR/SourL
         SYMPnYqyhJ/W0pvVvzSj0ZuZYiKDSSnz4UJs6pmL36abubJovqnobrE9jBPParx0hZVx
         HnWqObXB1nTiSAgzMcpqyZD4x/vE1XNyaFDsHNfvzBr7fO8ZZdol92lxD+wWwMiw0o1I
         suIym7JgMHk/uu56bhoO0uFnaLYKLxSvZy9Wtb/+OvqkMqyGXmpXn+6oCNxc9F0Of/7E
         +o88f+xtQVB8kG2ETFaVKcodwQQMkdsh/n/FdBr4yi28rlMDJ/a/Hi72ckwYkG9AUbb+
         gurw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w3gjiYVh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k186si2357499ybf.383.2020.06.18.03.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 03:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w3gjiYVh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jls8m-0004xn-K6
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 06:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls7s-0003PB-68
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 06:50:32 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jls7q-0001zu-Lm
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 06:50:31 -0400
Received: by mail-oi1-x241.google.com with SMTP id a21so4643916oic.8
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mouus+/TiWLsqIZOvvBh7EWkOrRqd36lb+ghDPqTUc4=;
 b=w3gjiYVhmJw1GmHBM+fPrEqwwC7WcZc8nIfgD/Gl69ZRzbKoKGDjq25HLnsjM2RzDt
 zCtdRKG+aMiPt/Zi+7xoqZNUuB46sxPcnkZcMxX5lCAHfQpmvm5+WVxYBrGRyscWZnOH
 z2LSYMctbCMhnulw+A2lJPScPKpPpZgbeLtF533WdZkDFrzYgGolMd/jrGjnQmW27Oya
 MO7005EWrFsD3NZoci1XjGRURQr1sOvzTAO5Ie2xGA0tvrWj028uJkmRuoDhCkjSV8Y9
 E92kXPC3LgohNL9K2/sI7eJaAiK+YyH/b2aB5oiHPsZ2onE11IpKtgx9CPXDVnrVnbIe
 7K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mouus+/TiWLsqIZOvvBh7EWkOrRqd36lb+ghDPqTUc4=;
 b=e3ytKMxT/9CKFXmwdZ966hUL19xgre+6wT5zF6G0Ur+yVlmIq9kgV57FVvSsvPC3hL
 FSbU0jZx4391SBvMyQGbNeqJia3YAs+6nUqfyvcAsZwxEbPt9SYBJ0dCLbsy4NZgqzG6
 SBUG8/LXJx0WqDeAoY17RcAcxLFscMzUwztIhGHOYmPE94gNdqSaSyjVLR3NI/b8hiaG
 vLgEjRJZalQuFwaJutTMQ8oLTeqd9Twepv9L3fz3JMO2/dMKK51/z/lMxAECjsG4FhGU
 ppcbCaIKXi8eowZcLMHF7LnLtUZ1B6ec4/J/eGSbYRY6TL7TDZ0yUF9hkzCoGff/bf/F
 otyQ==
X-Gm-Message-State: AOAM532lfMJX2Ag/wX/vd6AIejskq81gRSEwVuGp10jBu/pvJuykXo6u
 SK/QQ2pWm9CdKkDDCHIk7JcOH/9buoZcq8/5EPTEss+E0NA=
X-Received: by 2002:aca:568c:: with SMTP id k134mr2222879oib.48.1592477429592; 
 Thu, 18 Jun 2020 03:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-3-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 11:50:18 +0100
Message-ID: <CAFEAcA-S9B++cj2tw2o6X_B3naLVCY99ef=bZ1n=56iwnOSjVg@mail.gmail.com>
Subject: Re: [PATCH v7 02/42] target/arm: Improve masking of SCR RES0 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o1ZdPMjUavmY

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Protect reads of aa64 id registers with ARM_CP_STATE_AA64.
> Use this as a simpler test than arm_el_is_aa64, since EL3
> cannot change mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
