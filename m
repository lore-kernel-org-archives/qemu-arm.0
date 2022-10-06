Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp523800ocb;
        Thu, 6 Oct 2022 07:34:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nLaAIUOZMBVkRgb2Hyv6koa/pY35YGRdtFHvenJ4822pZcETa56YtgP0cP55huB4IazCJ
X-Received: by 2002:a05:620a:1913:b0:6ce:4159:7b78 with SMTP id bj19-20020a05620a191300b006ce41597b78mr211483qkb.751.1665066878383;
        Thu, 06 Oct 2022 07:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665066878; cv=none;
        d=google.com; s=arc-20160816;
        b=qlL4FDWZtauCN8p2zx6pCrF1MdsXEV+6BArN1fhcP+Y9Y0VI0KxVtSjZyRU3rG9LtG
         T2Iw+YArBpznhUfl3QoK9MI4lNYWKOCarNVMacZz1iHVzJi3dqLNUNiEZz9FuhM9wo24
         nLsEU6XlNJxmWfS2nA3B8RtUtoZDS4HIZ34CCoDp+XYcYxChglj0X2cfb+RPaaFIoWaW
         e2oS5kEBTob+jZGtdeMDMAkESEboStN81/teC5+4QATxdpFkyg+plsGfP8FcLU0qTLeW
         fHFtXFgwgT3TNkTuESLVmTp5ZmXXgxihRxlJghw6brnuFss6HDEumUYSAt3n4EXkUnAH
         reug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Lff+mqFsvwdItVLA5cp1wud2MEDAw1eufDdyjUtzXQ8=;
        b=tjWdHnPbAe+zYbYjtHRIdcwtymK3S0W1BegFKKVvqRwsXeqopQuvIodfaiqdhfJ5tx
         19DPNwI8w4Lv3U99vcYT+5iWlsY7uLYwn889Gdwa6s5g1HSMtl7ZVL0N21n8Qjw0yojZ
         4TJ+BqlTAX9KfRE4pbCACsaWrvB+Bo6UlkShSCOmOo7VXBrY7Apg7GDKL8B9IIkpGBnk
         bup892hjb+rGE9GfxFpQjbJwbxHvdAMTIJeTd2FUXE/vNo4SEs/6B51/ouls7OwF8BBl
         zYg3NtV1fTRI7By61ThzEm5RG15OwrOrWIPN2jAX50JqmghosQExQw2Sjv6Ryq/BV6Ax
         uU2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCQop3wv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020ac85694000000b0035d420aea56si6846788qta.516.2022.10.06.07.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCQop3wv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogRxN-0001wK-VI
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRwV-0001vk-T5
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:33:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRwU-00077t-1G
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:33:43 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 78so1998011pgb.13
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lff+mqFsvwdItVLA5cp1wud2MEDAw1eufDdyjUtzXQ8=;
 b=oCQop3wvl3CSgJJGZtrM7Tq01s+tCWd/ohhzntY7joop1EGhg1zbBJmiUHZbis7Jrk
 Cb4jpQYbQObXOMYNuIHDB7ZW1/PpGVxwzMDX69w4uSGTGKavYix10iTTX58qjmMOG4CZ
 8bPh1tjuZjaygRWGw4PShUnm8ixYcTTMvtj4NJZa7AXcYCbFoXrS2QzVQ8/jSijIJgg9
 Yel3JRQIIsg+Q66NuYC1KCLFkorj1Jb+DXEWA1jJMZmqtCH40kZ6MHNCp2YwWSCn1Yol
 udZqWO1Pen+56mfP5yhvoTd4+tD6fxJ8wr/fAnAUVO69DVrcukxBLYBqq6ibW1F/SY3V
 zrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lff+mqFsvwdItVLA5cp1wud2MEDAw1eufDdyjUtzXQ8=;
 b=CCaR8mTjUFFI+qRjKo/F3vQdUQraEkvsm6ZtLgUe8ayFY8jXOzTG2DNSEZE0D08NJk
 snzKpbz7iWwzz3vDMXqkG+rn9VblnExDHticfKTcm1E8iOQpebBF3LhClmEQSX/GxdgT
 W/dP20WzWyRUhmsr1Da/BZStxAFEp/2azqamGnWSmvEUuXpn4VdaA7qSgSrKlqcQjQjb
 ppmUEVQIIgavEiy0LerLFPZY9GqIYkqoief6kbprgnGOwMx4YEFyjkfilH9zOtwvB+wN
 rkJa+moTtFfNVxLZQylxni/aDvjFgj7jCgtOnAIHN1gilUcwWJHvyQimQ6W4Ijz6X4TH
 zraQ==
X-Gm-Message-State: ACrzQf22kOYwqb1KOsceHBpmGI6C1MNqxwaaIdNXIfmX23JdeV4hlcW1
 4BSl39H8vanzyRI3e0CjLynUEm4mOELBSQVaoYeCNA==
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr171193pgd.105.1665066819234; Thu, 06
 Oct 2022 07:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-20-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:33:27 +0100
Message-ID: <CAFEAcA_F-bKsZ93d-bGa0npXZ_wQtZDOFQr8SBWNwgxvv8s9Hg@mail.gmail.com>
Subject: Re: [PATCH v3 19/42] target/arm: Fix cacheattr in
 get_phys_addr_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S00Eh+wRZ6xq

On Sat, 1 Oct 2022 at 17:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not apply memattr or shareability for Stage2 translations.
> Make sure to apply HCR_{DC,DCT} only to Regime_EL10, per the
> pseudocode in AArch64.S1DisabledOutput.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Do not use a switch or a goto.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
