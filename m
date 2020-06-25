Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1278302lfm;
        Thu, 25 Jun 2020 06:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRoBU1C7qQl+hfR4uTRyk8hFUIz9Bj6wiahwbVcdtWOS45MCTdhrIm2Gzan6V9F8YGzfJt
X-Received: by 2002:a37:5bc4:: with SMTP id p187mr11686777qkb.166.1593090654418;
        Thu, 25 Jun 2020 06:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593090654; cv=none;
        d=google.com; s=arc-20160816;
        b=LfmH/WNqsOjLCLHjihLewcCNBZFguMI6UAHlMK6TSRoJ/nURriY6EmYSlzk+6lOTFa
         u9XhaQ7kWFWe+lmxWqvCwBrTAmFejXHYN0g76fsNJIQOsPMbunS6XVL0geD3iI6ztthB
         HSf2qAtoZFOTpg9KuRXjd3A2x+KQaREK07VnGOckEago3lIBx3Rjie6dc8xL1LpusiGt
         xNdTF3QC/tXWGsIrKGyD1AV9bVhQk7r1UEFjL2iFd6sqMob9B6cH1wyFnrwSWrtkacA5
         KBkOE5P1t8+yl/tolcQSzRd39owaoDbpvY7jGHkt5hAPA4MlHa1YsWn1mUpQDReLMkin
         DbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=569093/Kxu0KVnbPnEOnweQ5Th0thrkKMk/C2CHOZm4=;
        b=HcMGN51YyRiNruHIxZWrwZ3jSfwDfWrRrW1if91xrh9pe1kDR/2+/onJWv2/FJXhdG
         F2KbiN5sBJ2ZEc3ar1vqxOGwlYZZkdamAN9knSnKm8X6/wHHRWCfOct96VpTQwJGuA6S
         Cb7ukdOKd1DxS/0pyG4wuZTl3s3fDu8pIz+8Rq5ZDd1s39IggMk6B+AhNtuUeV+9Djpi
         M6ZhrYXOTZL9IbHYuBsfVyIIwzW6D/2xStrwTZ0uWMT/XXEUlNmkBKCk6YVs+a++qYqc
         5G/IAFW3JoedthuS3jxc1l5k2Riod6xgojUdEcfgoKhDBzH5Th7il4uFwgHM9brmw9xt
         BkCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sgToXK+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si10439444qvm.88.2020.06.25.06.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sgToXK+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joReX-00013g-OS
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRY4-0007ym-IU
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:04:17 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRY2-00060z-7i
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:04:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id t25so4867994oij.7
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=569093/Kxu0KVnbPnEOnweQ5Th0thrkKMk/C2CHOZm4=;
 b=sgToXK+kwz56sR/hmepJwigKArcua0HblXUVGssmGjIrapMgzUaZfL54UmiwN5xceF
 KmJTDj9TsSrU9thk7rfyNTLXeivz14LEKLk3XrYTVQIxPw5djyHxLWEShosN1LX5ykuz
 UC5EaAN8cEv6NOSuMgqLARziHw3WtksxWRsEaXMbOdvaLPQKDYRM7OWtzyFYoenxYigm
 G5Fj1ZLKia1ZZn6+HZnU5K+yp2QSaj3+koo19EAu13fKT7ex8aIDA313tQfh/AnjmM0j
 H1p0eVGgdGAYZ1FlLI1tdest6Ryw2yqNBCzuQOM+B51P9GoAnCq0dcx/tolm8os6ujqx
 zXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=569093/Kxu0KVnbPnEOnweQ5Th0thrkKMk/C2CHOZm4=;
 b=kfReWRPxaCuwdWpc/sBKVaki4qn4DegflkpHU0WmAWDcDebVSG+Xxm/IeaGLNySTEk
 C+07Vkw4wn8L5tckhQGlAzC9tqGb5KvCYFnlvUbf3dn49kOumhgZSNSBX49KTjrwY9HN
 N/Abg8uiUh6Dmo/wVMc55L5YnPDFYpN8AeZHs4Y9VPm/QvQb3gFPfUNJaXkFPZJlu/TV
 g7L32CmmAm/y+lTOWH7JaCJjW8/UMByi19wLlpjBzVQDvMwoAyST/wfiWNWHuj1IDYWM
 GIfgtSRboJkRqDQ+2ja67jMym5rEY5+vWenTBn2DeydUmk3kQV8osD82ltryEcrb2LtH
 B5Kw==
X-Gm-Message-State: AOAM531cmcg3qBAb2W/RYK3So150yT+O9ZrUKpYyxiY9KACLC56PxiCf
 pG4P5H9jTiZu4hJXV1FhlTuIsiI6qWOxbFyUnv4Cbg==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2048029oia.163.1593090247077; 
 Thu, 25 Jun 2020 06:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-45-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 14:03:56 +0100
Message-ID: <CAFEAcA_svDHEDP5g3aaEL6_b-8hy0AB8oRBWj=y6G1K_r6E9nQ@mail.gmail.com>
Subject: Re: [PATCH v8 44/45] target/arm: Add allocation tag storage for
 system mode
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NBsMA/NRiPQ/

On Tue, 23 Jun 2020 at 20:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Look up the physical address for the given virtual address,
> convert that to a tag physical address, and finally return
> the host address that backs it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 126 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>

> +    /* If not normal memory, there is no tag storage: access unchecked. */
> +    if (unlikely(flags & TLB_MMIO)) {

Comment says we're checking a memory attribute, but the code
is checking for TLB_MMIO, which isn't the same thing.

thanks
-- PMM
