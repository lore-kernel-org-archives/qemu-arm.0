Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp328883lfy;
        Fri, 24 Jul 2020 06:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp8dcFGvXk2fVqlaWueRltNnobR4nd1gQ7shAr+Wu1wAe7fenO3QZsuLymyDOXaDGd9EN9
X-Received: by 2002:a25:bc0f:: with SMTP id i15mr14803277ybh.190.1595596812813;
        Fri, 24 Jul 2020 06:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595596812; cv=none;
        d=google.com; s=arc-20160816;
        b=nlNyYdQZ1b6hNNWS0S7Gxq0jwV5hpzT0BnKAElBKWHF9SDqU7WL0g2DK7XGgxitXeE
         CzbNGsKACTYp+sZ/pfPA2A5GlRxuWAnIW2dyVWsGyqzZ2ymqs38HEXNHX8FMq2wWDPQL
         FT/XUYD+aDQF3v+2bHXCltGON8SLo4g03N60w90EMEpu8iIaoXZM0xh/A3z7rVkN67/u
         dCjvKGoMUeSYPhOFKYTDJBlpfm+uRy9t+P5alyI7N5pFwU1X7AxbTPpLV0lgEC2bmdAA
         DIGVGLsfdiqRAcUV0ZTQa7X7TYtxRVOakHN7K8s28rt6Wbt/sqw6WgAlcZAubeWlhxnN
         egDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
        b=xhYsSTUVMMosZJSC/skUspalif4SkDCeiCqPMysIJfXudO9l1fgSmFtx7e7kpgeRg5
         cgaTYXoc05qsiPQ0NStmklsnccSsR2KuR78WatR3eyWy2ZtPWYyxT6wtE6ieP9x811Ao
         TU3Lz8S/pn6V5nwUCWgCBzGSS/3TNJP9sc4tqNxmdPdtHf1tH9IA70bg6XbdenWDL4Bg
         uxNWtShIocg2XYMcsQgfIblG9VCRuyLnjoXRbtR0yHQ17Z8uHKPCopXs1TeTYjyNCcAH
         NHYe02jmPDJPiFy91d0fwRD6uTJprtJRIC+FDTiNkdCovjEw75knssOV3/Qi3h6PGaBj
         PBjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YFZnEp7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si882142ybr.485.2020.07.24.06.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 06:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YFZnEp7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyxcS-0003Xo-8D
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 09:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxcG-0003Qj-3Y
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 09:20:00 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxcD-0008JM-G8
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 09:19:59 -0400
Received: by mail-ot1-x332.google.com with SMTP id 95so6935352otw.10
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2020 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
 b=YFZnEp7/W2ybtHY5mYiOP77ckpKkeOvV24exIgBLSWYQ1qi+05rPNOUOEWQvaIq/h6
 0HcGDkdEIxEVRS/IJgdnO1v2vsOE1VXMmBXrl+TrWiAX1Vc1eZO7Ec/I6k1EG+VmJldf
 vXaBz0gKSqob+H5eLh3r9TDm+o3p+rEGIOBVtKiX3RWZJuHwW+9KCisK5dZ003nocBnX
 UWhmSG9WtNrzbkgE+xe1cXTBnsxseS1pPpC3xXPr59XxKHe8vCnhVQuysIOsBJqG6oht
 s4aPZ7hknS/XpDFuKnkYBKhLLix58PGosMYbK+SftlEEYPWM35dzyNAH10bq7oQezgB5
 xZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
 b=gvQ6+TXAyXbF2OfnTas7aUxJ52bXdsWrwc80araWBuBzPLkwaUu4FqlfojS5FaQPAh
 zEvkGr+EZ/yQfDqD8OKy49jiGqWyHLETY3aoTOL4gpUcc/TTp91qWsB/odRGCLSehWDM
 HZYr8QZVtC7SBpI+eJ8Jz0yKTZucOQdjnfp/b+CoJH7HBp/mpzB2CS+Z1DjUoIT/IwYN
 b6aj6+eErM1xMDZz+WF9c8Tac0FMRlmt+MwM8UO4q15m3fAKr9fb29n57KvbMErt0Pvl
 7aUqwDWAPPnB+TxRhipXotlvNGcvWNna+Hx0oBxoP5AXuRhvpOwRifMJ1wSr0NZ/j+B/
 NjEA==
X-Gm-Message-State: AOAM530LjXxYD/YIyRBRzliU74eDfLOM7nl8eJBbViz7UxZdQKgeL/6h
 Ekp+dovaTuAcKJzv+gAjL1zf17b0nBHDtDbhETbM7g==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr8710838ota.91.1595596796072; 
 Fri, 24 Jul 2020 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200721124250.8601-1-f4bug@amsat.org>
In-Reply-To: <20200721124250.8601-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2020 14:19:45 +0100
Message-ID: <CAFEAcA-VSRCR4fFwLkWhOcPtivQJOCM_LEbUafvsW-62Cb15bw@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3] hw/misc/aspeed_sdmc: Fix incorrect memory size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cc/sUvk/yoDr

On Tue, 21 Jul 2020 at 13:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The SDRAM Memory Controller has a 32-bit address bus, thus
> supports up to 4 GiB of DRAM. There is a signed to unsigned
> conversion error with the AST2600 maximum memory size:
>
>   (uint64_t)(2048 << 20) =3D (uint64_t)(-2147483648)
>                          =3D 0xffffffff40000000
>                          =3D 16 EiB - 2 GiB
>
> Fix by using the IEC suffixes which are usually safer, and add
> an assertion check to verify the memory is valid. This would have
> caught this bug:
>
>   $ qemu-system-arm -M ast2600-evb
>   qemu-system-arm: hw/misc/aspeed_sdmc.c:258: aspeed_sdmc_realize: Assert=
ion `asc->max_ram_size < 4 * GiB' failed.
>   Aborted (core dumped)
>
> Fixes: 1550d72679 ("aspeed/sdmc: Add AST2600 support")
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> --



Applied to target-arm.next, thanks.

-- PMM
