Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD15C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:05:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohUR-0004wQ-R0; Tue, 28 Jul 2026 09:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohUK-0004uK-D9
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:04:53 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohUI-0000gn-Ib
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:04:51 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-667f1390f58so4096739d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785243889; cv=none;
 d=google.com; s=arc-20260327;
 b=lGmLoKpaxpmecT5sJpWU96d/H8wTixWJzhS1xKGvX7FV/RZOypBttobohm/kpPvXKx
 cKOzlgLDcHOXiTankrxF+93LHAw4mszPFDQgDVxXj3oKXiKpi+stoLkcvMcKffUeIm+8
 Mvr8lTJMwGUfB4sqjwUjb4QZ89o7Zo3hXbcNFmoIfGAO51rYTASeViHcwqcQPFnoWw7P
 93OghCbtx9hYxBhUYAWzFXW7bw0edWF9G1EHl462XwEXUFrfLn3NaWdULlK1PjONWz2+
 qlLyWyF6v78R07pSvj3hiqBew5/37Ud9SZkjEzrdotwYpDFm+gFh9fuPhh1uKVqX5jDE
 WNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FQjgVTqecAYkIiqQU66qEDM2WlzndazYrbBiIlOiJ2w=;
 fh=Q6qnjOY2IRUImX4ysm/qDxtEgK/Ga0iSCmZY5rn61iI=;
 b=Gqk0njzJ3dP6w1GCLyn7C/wyIzHAqgq9O6Sr3ejsgrdfFektoJeVbMAyWrasfsGbSA
 ySaB+wj6HXPs1Mslo2fPExPbnofLaloqlHFFJaB9ZPRdul06fbcdKgqNw13Yv5c9KW4J
 mpiToZbXB91JGEAE+FFvj1A4BmHTOULp+TDVSVoVkjFYAUlCzQa0xG0s1LWiwActoxcE
 aeVdiQQK8NAfbI4R6OoBkpj1IBK1Z0hrBKuNeUX3pcnYMBGnVwQaNL22RENP1EF82IRw
 m985Rcy114I41srCWSIJ847/oE9uhWS4/xNBxQRWXWsKJzA02zQapVy31OBJN9zdeO8i
 V9tg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785243889; x=1785848689; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=FQjgVTqecAYkIiqQU66qEDM2WlzndazYrbBiIlOiJ2w=;
 b=YcryKPxQvL4v2N52F2qzunvHhKiP2DW3v1J+64/C1clerL55dWjtNZCZdb8GsLa8cr
 A5Q4BZp2K7yt67mNIK/lSSDIFJ8miBJbcJU9Ii6Oov0yquFqq5Tap61mlAE4M2DHRJLI
 p1E45A+CXbRQWcKBzJYqAXMyc0z/tRVvJSQBoDJpSn+0b0n4V7MA7avygjFUqzG4UEvs
 vcY2VMZet7ufsRg38TLlKqvD9aCRSx3IO3rX/WUEFCO18JGXSJxteJuuMC+C7H6v+FUf
 GpX7DM6MZFf6mcpEkknrGVCFMdgNCs0zdvKlCSCqyqwqBNIr5u9YA5VcbG9apuuAMbIw
 xu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785243889; x=1785848689;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=FQjgVTqecAYkIiqQU66qEDM2WlzndazYrbBiIlOiJ2w=;
 b=NuFJEQUQiaqilkwQZ5jQHiTIUP67UtsDfIYyD9vr91l8yFfr1FGoi9DFnasR9dCmdT
 xEPryAOrpRNunWNob10L/YuWH1WQ20xi+tNTHukmbVQZVXZpQLKvPMJ2bwLxnHWd7kCS
 z5DTdi3hQ0wj6tcJht+U4sEYhiZ5sgMN+aucI9aTkvz/YJhESwQZ2/B6PzWYqdUQQhWk
 xSTRdO3pxKamKX13Wid+/paPZLumf0xY26+W9yi9ggGZj/u6wOGElO6/R7isQt2raHVh
 WxxUEYJDJr4KK5nJsB2zWofCNxNqkhnnzSmzZrAMxUQ+KOPjjbU9vySgC+D8lrYsQ6qB
 4t8A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlG1vtzKv7spxyLqWCR5/7KR+tpmCMcrMFwQ52XkD+gKlBOn99AwpgJtw3VgZKZ13RbzZIAATkHA==@nongnu.org
X-Gm-Message-State: AOJu0YyJBwB+lRf1P7cyZKxCEB/c8bI6gmFIJaiXS5h88kd3iu/RQ+TS
 dBwtK0X51JNGweL8YbOE8QjoZ9UCo7MAbHbX/XTk5O0Xw9oejEAk4T+ihomSyhuuj1fcgyh/KVy
 XFGFu9dirqyDp/SkKBH/e0iQmShXR5Bo7jcu+7khqOw==
X-Gm-Gg: AR+sD11FMDudCKIEw52Ru5vLDoTc6t7CjvbMvaG+YD8aZbKKaN9lPIPdDRTRQNhK2d4
 bGrtC+izLZ3kIN+pjnqaPCWTFwOLrb9CukumX17imCbV+OB5dcOPM5Dfnc90GfSVkzkIopSqOcb
 XbQDf9Dut7RIt2Z/ovZbEPE+mgWLNvtO3R6sNKzAfNInw/EKPDfFn28LRe0nxvSEKtGbBa3z1Eo
 2pwFIXFxKx2eU+txRGlZL+q2Gw8lagjJ5EhMKxrcKKONsG4xKp5+IATORB1lUMwCvi4IaE1Raev
 IZSVsBFSnQCZmLIMWWQ3kqYRnrbjHOlCsNCnTVoM4jBSCA==
X-Received: by 2002:a53:d0c5:0:b0:667:8b90:2e60 with SMTP id
 956f58d0204a3-6690586c8e9mr510029d50.108.1785243889506; Tue, 28 Jul 2026
 06:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-4-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:04:38 +0100
X-Gm-Features: AUfX_mxPZRu_v4146gWIWohdaxfFrkqRcMObn2f4qDcT2NWvncY5-0KjoDX-Owg
Message-ID: <CAFEAcA-GsMFQxd70i+mcybHaqPTxPTYhPCcH=6Saypygafu4Eg@mail.gmail.com>
Subject: Re: [PATCH 03/10] target/arm: Implement BFTMOPA (non-widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

