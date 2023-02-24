Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1821235ejc;
        Fri, 24 Feb 2023 06:25:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8NgaLTrCaPpjw2PzGV4oxq8jGK7wBmX7+mCph05rSAG+ngxY9KJskYee+c/4FPn6/Zm6Kd
X-Received: by 2002:ac8:7f4d:0:b0:3b7:fb35:9163 with SMTP id g13-20020ac87f4d000000b003b7fb359163mr27763567qtk.30.1677248736001;
        Fri, 24 Feb 2023 06:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677248735; cv=none;
        d=google.com; s=arc-20160816;
        b=j2eR7ura/WY5mSKE0zKkwjy462CDovZDzCi79VtFUjvsZP+RUZjmEJmSLW5zWWWFE8
         F54a4pOT8kO+WY26N3XTiOuXF7eYIuboXaqJvdair6sWwKbr5VjQRdF7alBeXRPpF9ba
         5AXMCon56K+wRGkF/ZyJJak5+HpzfkdzN0prpmcUvEgBo01CJYIL5Xf/lbURdWKJ60oX
         mjytocJwZKpLnDqIk4Q92HUTwfkHg18i7pPiPOUfeNY5fJg8lbIPB5DFeY0Ou1LqPYbE
         L2J7qiAqau4XNYyCuZhLqk/cEh4A/5zHw9gH3YwUVeAryWjqLxlX1b6SegJfAV8ckcZW
         3Cdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/f8wW6dAWFShgeRftMsyJqwr8xWqjzm/rOvZxNyG8Z4=;
        b=kK6hYtKfR07XgjNiqy3BxsdSkITrc0CZqDbKyTIF1ZT/jCPtiECr8HZWDko03vVon3
         yZ5PWidWb+MXgYqdy3Hb8EC9msYOxFU6N0HGwDuKqPdc2tsjuJ7X3VX0Hy/UMT0ukHdX
         AcRbn7bqBUbL59/BrOZtFGQoD0rKPpoOkLfz6BTZJ/E4J/ZNJKd+Xypc3fsYO6/vMCtz
         Zpwnr3D9LS3ate2183OOe4xtso9E2CP+yigobDj7W2lCf+Mc4uKq2r/MhrsvkjQf7atE
         mPgD7egHCd9orumiu2GrENEC76OwqtxI90WG096b2irFHeAUiVyZI6XCL6PgXnTJ5fsD
         0AFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjmLAzPy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020a05622a11c800b003a569543250si1470881qtk.670.2023.02.24.06.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 06:25:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjmLAzPy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVZ0K-0006g7-5L; Fri, 24 Feb 2023 09:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ0J-0006fk-1x
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 09:24:55 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ0G-0001n0-RS
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 09:24:54 -0500
Received: by mail-pl1-x636.google.com with SMTP id ky4so18086369plb.3
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 06:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/f8wW6dAWFShgeRftMsyJqwr8xWqjzm/rOvZxNyG8Z4=;
 b=xjmLAzPyXdMUIqY31eJ4q0hLc80II1TeThOX6IHGRdobRsB5rbX3QNnQ3sqJooFxyc
 U8p+ELWEIFDJq6h1gpK0iKEb/c1KPLL7GpTz3x6iNEgmrTC/0MOtYp6wN1oBTNBl0t/N
 Fa+3IlFhsCwh43fDU8M7FggTg3WSK6DC4Dwk+XoAEKVL8Pz/zvbevxftj1xGKqLAmfUQ
 cBViESyPvC7cUkvFO4PEHDAFoiEqXLGYzCiTeUyp+Q6EAgPsjeMKdMVuTCPsvo6AbimE
 SZZBejbhcNUCZtFLweNHFvMhgH4Bu6KMCtXPNSlQra2JJagPlkpAUXyavmeG3WtLhhCM
 LtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/f8wW6dAWFShgeRftMsyJqwr8xWqjzm/rOvZxNyG8Z4=;
 b=pCVb7t3Na61VyfBLrGR5oFc6mLYI///ceZ6Sr+3lhikiRQ+gE83gp/fvb8rDqSYCLy
 IPgZQC9tMQNxIrknpxKOgla5zSDAJMoq2v3M6FPEo3+Dvpq0eA9/rxGDL1qGVpv9OgAV
 zDhU+WBqERF2iVCbIf7zv7wNuwtRrcemIh3SidshVuDOuB4/yPnz8Di19X/LQ+Vuvfbe
 F70RGatPe5Sp/rUZEav8iDH8BsXnWQQCGYxP8KuPHr/DJlbcXTgvB0KtNr8SXxStox7f
 +z/sfePfrvLIjA2nLSrVupwLlMbMbOh94DaKKe453vosh81lwFI3FVe8vOv+bYZbF8Uc
 WwCg==
X-Gm-Message-State: AO0yUKXQBIRs7mYnslovjRHUeXWqbSt5F4d9+GTGUB/muTLHzmhSUdOm
 DCE05WJnSXeYa36Nu+KJ3nuImB1c9NnDha9dUFCfJg==
X-Received: by 2002:a17:903:2684:b0:19a:9580:7130 with SMTP id
 jf4-20020a170903268400b0019a95807130mr2987498plb.13.1677248691365; Fri, 24
 Feb 2023 06:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-8-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:24:40 +0000
Message-ID: <CAFEAcA-fFbPhUCXrWHiQLxujuRY=Nn7BnS5P-Hs042syG_OpWw@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] target/arm: SCR_EL3.NS may be RES1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5JNc779/UFeM

On Wed, 22 Feb 2023 at 02:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With RME, SEL2 must also be present to support secure state.
> The NS bit is RES1 if SEL2 is not present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
