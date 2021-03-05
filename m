Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp249281lfg;
        Fri, 5 Mar 2021 03:21:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz41drwV2gl19P2IJAJhP/GBW8w9lVvZiRrHsj/DYTpzbt9PYtUa8qfrgA3qu58ryayIZCo
X-Received: by 2002:ac8:5a50:: with SMTP id o16mr956432qta.231.1614943296709;
        Fri, 05 Mar 2021 03:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614943296; cv=none;
        d=google.com; s=arc-20160816;
        b=vEtOotGbuytqSdQoGEa33jNTSs1vobbFho2vYJjrkd7d0MmCP8xTrLX8dIwQnUw9Zh
         iYrip/U5mSIxhK7k8pLXH9cXiSQoZzK4skkpe7s0YpUCJ7Kr1Pz1sbxbEdMlNyYefziA
         EmpGEVwp54zp47XeW0iEJzqAjqVaDNRGr1IQzD+WXa1wvJF/qT2yXIbCZ0oBarGodWpc
         nvGutNoP5EkwTbJ9POsKMKB5dhz3WMXn1Q2F4bgMhPcvrkOQ+0cV56NaFJH90G8/ByMm
         bf38QTe5kpyfcKsz35f0env33zPWpnVEZ7igSK6iIpuDynLijuqCpZnE7aEMxxMK3V/X
         puFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBrCHZk46J6RhanFMsFG8tijtIBGUooF2MGBbUqVnTE=;
        b=tUPR7jUMxlN+dIRyhE0Snly4TOIUbq6RWGB/w37ghLXdNmqHtVrpms2Zc9Fgi7sj4/
         JdcnpYJt8pWt+4R/JJhcgtsHNOQYImWeXilEArrGM/x1GnAPFLWmRSKipnuJVIdkxHev
         hT8Wtsb9NO5ZWJu7ZJbRIz89hGKGk59mhy0izYZLMQbQIqtia1X2K99y6qAt7tCHg0q5
         VjYMt86QI5sniGVo5pTmwo8VOMBB41ONCxrtqP+jQfret1wD0wvIffq2So77e/ZpqUgm
         R2u00zx064dTpuVm+MUDHpZAxAtk0QmaHVNY0xwaOKL5yWpt1iNIQwk6bygFwreQQixh
         IAoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWUym+xG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si1486068qvi.34.2021.03.05.03.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWUym+xG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI8WW-0003p7-14
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8WN-0003oS-PF
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:21:27 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8WM-0004El-4K
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:21:27 -0500
Received: by mail-ej1-x636.google.com with SMTP id mm21so2667785ejb.12
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 03:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBrCHZk46J6RhanFMsFG8tijtIBGUooF2MGBbUqVnTE=;
 b=sWUym+xGBKohuikeo0a5AYRvorOwiPWIGbJMxSsHENWS88Hb8hhHhrJrCyqucP3mOK
 hUNzOYNH5Y7XzhOE2FsSqWm83h1n43jw7/cTfP1/K7+cGqYa2zJfVGRvjY/kpHS6A1H5
 cIgCul9BLbMR5b64X9GXkcSEKApxz9QGI6I2Z8QYIAIjPh16J18mIgpxnpjrxXtVvL8V
 q6fDesMxXl5w8jXZqyZa4vC8Xq7C79wM+okw4dFyrmAtuU52EGjztTprL3cGC8gIZZ83
 VP97E9SSQVNS2G0r42ZuwSHxHMmU3FpTdlv3rcoy81ufbg23f9ej/43xQAUnFo5qLF8v
 paWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBrCHZk46J6RhanFMsFG8tijtIBGUooF2MGBbUqVnTE=;
 b=nv/ZjYGTaFgCO9LtYusEnkDoxvM9HL5vUjjX65dexuBmJ+Betm2p7uZMdxN0JazXZp
 SyaWV/1ysBx/i4EA6IlL+VUYe0rHx+W8GzC+dicPkJm7+eMC5L6n5w8qO4xRujmYXomW
 RqpG/UHq8TFuYoOlILDFrg23P7Us0Wu+k2nJI1zS9om83tXopnihmdhvZfx63G0wZL1A
 g/sy5WAaRZ54F7gIVKYkmmnBdB9TmZG/HxCl9Z4JbUfw/2RbREtyfPjabJx4mGOly+3J
 pRdWcW9AS8ADViJAXh24xyI1chOLOM2aeEho0UR2ZMVQ0J9D4BzJ0MbxIATNwsZ2zzNL
 8PsA==
X-Gm-Message-State: AOAM532dHRaKVBaChmi0oLfDVEiP58ZuCvZ/b/pBA+ULBVh1ySrqVSt+
 q6ymDB/Bq51C6uTFjQG8KWlsGR6+kl1A+8UjTtFfrw==
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr1852311ejb.56.1614943283854; 
 Fri, 05 Mar 2021 03:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:21:07 +0000
Message-ID: <CAFEAcA9MVZgoAZD7kDQ3MU-z=wp40eUp-yvZ7XdsNPVkk3NP0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] sbsa-ref: update list of supported cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w7nUcypkBXxZ

On Tue, 16 Feb 2021 at 15:01, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Cortex-A53 goes away due to 40-bit address space (so below sbsa-ref
> default memory map) and 'max' goes in as we want to be able to test SVE
> support.
>
> Marcin Juszkiewicz (2):
>   sbsa-ref: remove cortex-a53 from list of supported cpus
>   sbsa-ref: add 'max' to list of allowed cpus
>
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
