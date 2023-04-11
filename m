Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp485075ejc;
        Tue, 11 Apr 2023 06:02:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bkUAEwMkISlPyB2QZ8x+Xsy4hF4dMX9sw9T1PX+LivDIJ2qVpv5c6bHbrJUx/QBU/d73Jx
X-Received: by 2002:ac8:5cd0:0:b0:3bf:db29:b79e with SMTP id s16-20020ac85cd0000000b003bfdb29b79emr23014934qta.5.1681218176268;
        Tue, 11 Apr 2023 06:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681218176; cv=none;
        d=google.com; s=arc-20160816;
        b=tYHYqqEtrNFMNkFyzAHyCRYeDeShF08a3PjlAr/Zr7unUfKLyCs5rPoFpIYiDMnDnw
         jXEnCm1HFU44Te7y6xZmla3rqZaclQvKTR3TDmE6VQ/vp6Rnu9yrDuGeC8cs9VM09eqH
         QGWtx8PfTLASlQAzTDs6p7I2GuMTUSApfyAMn6k6imbGIco7PvC7K93ZeVPDfPpVVTZs
         JykOk5A43T7wNw6ohU2CVVnZzsmxN8uFrDkXUe6egTLZgVJYZWaYHev5XNwCXEnM/BnN
         70eJ4nIDE6nwdik7YJdbRC+iibFiQyrsiPPZ6bAPCXVRPXVC4RBQbyvwZeHOIIaDxEhD
         b3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hXykwCqjiLdlCUU9P9qkJ+OGA5U2MZoBCG6BgzNYwm4=;
        b=EFUt1wAb8q6sq6fRmFfzp+pvCSDYVQR9q2JBV9UcDwwvPROE2XHCt55YrIXCfY2Zy+
         WMsb27cKaPepRRbTCgAjZrQ9zhQQFicdtA7N9Yl6XWmTjnXRj6gJXYKbEQCnN/MAn7gC
         6mtVf63bWwpmnr3FaQWwSPLWjywHWZClLlCLUA7rFhFSaGF5hC0B3TqNWAUyn8vDbUBh
         SCtWMYP5JFgu244h/f9H/3ayqwY35QYpXNxIVQxV6RNYChZAG7kHduLG8eXOXRlRzflw
         VNvMD6fzVJkEA9imb/iWMmuaNuoGBwsk+VkLO0tQGHjzGG13sZFwdOPVNNNHi2iwBbpn
         MQSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jo4j+DUj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac859c8000000b003d416b846fdsi9344742qtf.498.2023.04.11.06.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 06:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jo4j+DUj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmDe9-00027d-SN; Tue, 11 Apr 2023 09:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDdy-0001zR-4A
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 09:02:44 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDdv-0007gI-JR
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 09:02:41 -0400
Received: by mail-ej1-x634.google.com with SMTP id f26so14029384ejb.1
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681218158; x=1683810158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hXykwCqjiLdlCUU9P9qkJ+OGA5U2MZoBCG6BgzNYwm4=;
 b=Jo4j+DUjc3vO7MvVjYFJqERFsUVq3QausR5Y1slqgpU1yvxiOGtSYyBS3qlV/DPeZt
 ZycS7Cih/SgVrM6FsI4KBegKmdfXUlFl3xTRu7RFyfitujEpBLEjR7gLNnFfa38k97vl
 tt+t0uqwLcmNO+QzmvgyxgTV//tV6CIFMNCZcOSDWo2KB2lQqtg+iUd10xkLig18iU4j
 dIEOytb2di0rqQClhiWEPpjVIjQ6Hmk+b4FrY3Y3DDpbOwVB36LcK6t59Mn4WIOnRtz2
 sGMBljLEWn9D1izm1iMu6sfVFuNqM9LrCccyN7SJqtP/zyRI2r2L6O3UzHPywsTqkFes
 ucTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681218158; x=1683810158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXykwCqjiLdlCUU9P9qkJ+OGA5U2MZoBCG6BgzNYwm4=;
 b=l5/NgY22m+yKbFsk1HGwj+Eh4JfV4GFKrmg3do0qPGzRcLlbiZqHglU3qftOkSFapP
 rwg4XGd4vFb6gwGsGGQgvpZySLA26QWctsqH9gGzBn+Fb/r6dmMHvm22X14N5Kybv37P
 eMLEi47d/RRM5JU7uA3LL9LMbPsySoQWgC7cPCH2x7jeZnzh1Ed/Kr8kDzJiDKHEKEIW
 fOLSCPFECmOjGs/kuqRkS4VyYQusbCgDRBBJJ8l5uW3BZ+VREGDr4CFZuEIW/QYfWN/5
 3TrG8yZJeehakQ9re2SK+UlIOM8vcMm+Ba5wT4Qnzy/B1RiPZ4JQgKBpXD0iLO4QQjP3
 MYQA==
X-Gm-Message-State: AAQBX9c/2WDYXNl/D5ZtKd5N0cbHoeKEEplHIrq4GMMQ8+58v+KpEzU5
 tWTlg9QZauZqf63awy91wDIH56pjOBfh/piyolnSqA==
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5465613eje.6.1681218157913; Tue, 11 Apr
 2023 06:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230404074506.112615-1-jiangfeng@kylinos.cn>
In-Reply-To: <20230404074506.112615-1-jiangfeng@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:02:26 +0100
Message-ID: <CAFEAcA_VP-Y2x9efKW8atddUL64D03eSE8A7h3hk8N7s9spMhg@mail.gmail.com>
Subject: Re: [PATCH] exynos: Fix out-of-bounds access in exynos4210_gcomp_find
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: i.mitsyanko@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l3U4tm4vArR+

On Tue, 4 Apr 2023 at 08:45, Feng Jiang <jiangfeng@kylinos.cn> wrote:
>
> When 'res' equals -1, the array 's->g_timer.reg.comp[]' is accessed
> out of bounds.
>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>  hw/timer/exynos4210_mct.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Only happens if you change the source code to enable the debug
printfs though, which isn't the default. I'll tweak the
commit message to make that clearer.

Applied to target-arm.next for 8.1, thanks.

-- PMM
