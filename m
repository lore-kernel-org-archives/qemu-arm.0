Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp510248lfk;
        Thu, 21 Apr 2022 10:14:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYDcyA1ypcfySDa/bpdHZ5Ln3kNZRkB9e7pdgNmeQkBSCE+HqwskdfkIm5ZtQhS0F5klXc
X-Received: by 2002:a25:9b83:0:b0:63d:88ee:10b4 with SMTP id v3-20020a259b83000000b0063d88ee10b4mr721952ybo.480.1650561273739;
        Thu, 21 Apr 2022 10:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650561273; cv=none;
        d=google.com; s=arc-20160816;
        b=VcddNhXQh/Mj4AijLjGBj9LetrT1KLynyaMqYiyEVpgaQelseuRmEbNyHRag+hEgzv
         YC04zx8GuEmYeIJSKJzH0MoTMn8tjrtjD1fXfvtiW/bsIDFY67TfffoRk3ja1EoHyA1R
         SUsp6Fio84HkSS4jQhgarWdXXhN5qHgNFOlqgE87Ae1Ge3AhLAyhHyq5qDcSDylGKP5r
         YGdV/ahwEnX6G8jkUO1D/1qzRLrd5VS1KAuIUxKyjlg3GlvfEWJFtcV42NcPWPDa8RCV
         pZFPgCm7cbxNvqX1x34OB8Ul0TN7PtcyFqaBoOEt7H/hPOl4/e8xrnEgJh/N5gHiWDNl
         pL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVa7eSTgPWPiuq+bOY5fQ3v2nYSJItvw+PivNZ7nOY4=;
        b=DH1A5GvbXPLQhNbZuWKSiC+sUbAgyDizmS9RwKdtAg6cSQqxgipRJjI12a4VWWoqog
         aCcvBFNtID89MGjdFk5PFm3gTr3W1jb8HTJFvTy/VjCvkE/O5bAnDQ1+xM/z/WQUA7rv
         YZv/g5eoNfg2n6LFaFOLyp98PUptwCw1Q4t8+Lgy6pgCl4tYFTRrl8nMBbk6cfpxXfPi
         6LKVHBQ2DFs5o5TIBgN0fAFUcqO+ZOoiidfWvobwS3YI4NqDGJEFS4zObUpKqV++oFKA
         xm9U0rXkAzTrq7E9B/pHr6ZXApTTcgdeEX98wRfVNJuiO36tzZx/deYYZVFrVurWQAIT
         WnRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KrljFr43;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m63-20020a255842000000b006412663df10si2855489ybb.357.2022.04.21.10.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 10:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KrljFr43;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhaO1-0003Yh-50
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 13:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZVv-0005Kz-Vi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:18:40 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZVu-0007dH-Ia
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:18:39 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w20so3448789ybi.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVa7eSTgPWPiuq+bOY5fQ3v2nYSJItvw+PivNZ7nOY4=;
 b=KrljFr43Inns9N15rf96Y9QkHZ6XV0+N7BvKshC+8St/pd1L59wh9eI9FEN74X2U+h
 njqlUAknA164bmE//xAWmwF1OrJJdnp5CMhE6qG04AZM+F0qfDarILmFUw+fl4JRmOUN
 bcynyHO5VmthLVSNQdfmofx6wxphyvBCNnOUjSBQuwJOEH0HyNUYAyltTq7ZK1kdaE8j
 2z6K6vVzGoCzABlBgdiWbtKqHIS6ednOHMTnXxXizX+6cihKS64bLRzlj2T0OstRXDht
 UcSxrbcR05JlkmSxukZU867YobqnGtq7I4SRc5V6gVNMFcGBa+KuIUqdB/uRS2KxoKCy
 gldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVa7eSTgPWPiuq+bOY5fQ3v2nYSJItvw+PivNZ7nOY4=;
 b=wpkrZqH1uCXadyolw8Jyq6NCRsXRqMkT+6xpTu+poKVtY5kczvO+QmFcj1Gps1XHXY
 JO7Hjt5YvV2LkyAER6vxAMLR7X3pAkeqjmjml1d2p/x4JABu6Tustp8CaWpN0tlWyOd/
 YIdJVR7aDk9Xa/FXGb6bgTx4ziUlzQV6SH7ArqBU+Ze7hfOwAYhwXcMMPDwmDBtWAhtO
 c7xdwtDPgQygmYPtc9GzX4FanlGVyHQDsH4mr3MKSZqgYWJYHs2BiBvUg6CRxe7NSSfd
 gXsNd1ZojO+oYPsQlwbrYg1OcD62HzY/QkB5H0/ABB0kNK3gaoTFRXU8eS2vNok4RE1k
 XGCQ==
X-Gm-Message-State: AOAM533nVIS/YCUbjD0t4sh4tTMW7ZvJmsUyuKkZ20d3IuB+RhU3I7k8
 LUl11pxq3aMOUy7MhSeLskdmoqZ+cnqo4yhqS89RCg==
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr415752ybi.479.1650557917223; Thu, 21 Apr
 2022 09:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-10-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:18:26 +0100
Message-ID: <CAFEAcA9XchDeFPZvXJ0qVNb80PWhgo1PBb7NAePJFoVsaOXiXg@mail.gmail.com>
Subject: Re: [PATCH v3 09/60] target/arm: Change CPUArchState.thumb to bool
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2slq+x7FoOUV

On Sun, 17 Apr 2022 at 18:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Bool is a more appropriate type for this value.
> Adjust the assignments to use true/false.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
