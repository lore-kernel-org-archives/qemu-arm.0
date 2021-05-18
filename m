Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp382247lfm;
        Tue, 18 May 2021 05:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqktNsnlWCO23r4rm+nMESzvas/EGClAF7Jd9Nps0ZzgjMtn3nJQE1qRkRTqaTxWQ/ppBN
X-Received: by 2002:a02:b78c:: with SMTP id f12mr5331444jam.7.1621342265691;
        Tue, 18 May 2021 05:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621342265; cv=none;
        d=google.com; s=arc-20160816;
        b=DaJfj33JSQxM67JhH2lFnAO11P//J1rRKSJs3QnT4JQTOMEUAyf/yfEr+V5UL+2+lg
         VPyQ5ohZxsavjG3g/UnibijLVGE9YeFQrxCrl6RJg6staECmGv5dknxExAjUtGd2M9/y
         kA96c013Bku2b0PsXRu3YEsK45zXSimfx5e5ma4HVwDaCiSdSnQDQlQfd24xSmXL+hH8
         /Hfen6WEc+ByPwA5byl5XpZ1oqQxlaKsYkdL6upOdqYw/LB0I0QWIYU7IabB27vvtWEE
         21p5SO9C2OsAG6w8xVolo5Ibrbm3B8aOTjaSht0hqwXVz68WPVbfjEn2khCo4rTr1/xx
         FCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/wZC5mZ7Y5Pdn9iqj3Gzlkf8WZzuqx8i97sO3dKKbI=;
        b=aRNATrMvAbrCIZprpHZr9X+lmSowdot1xdtPeQgKYXKV96XzorRKYnjpc5W7rGzRpB
         7Mz2nyxz8eCiwWxk2wLZ2z/YYrTihuxGduwcQnph0eYZbZTkGO1biwSN+YGNJu0BNSR8
         Xz/bwRbbQwFl7hKMeq/hXGUzBEt+Vuh7QkQ1yg4MerynQL0rEAp5Vh6XpKsm/NkRuJOK
         L3GFZijjsW0d9w8ZdIR2hVlT02hHG43ZnmRqCTKpiPIxEzuUKiwm5rcRxseo9y6k7OOg
         WMxe4Q1FnHzl65tgnot7g6OehplRa4MVvLdxv5BEo8gPwrtbsUoG/ychFNEYWGRzAInn
         UWSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzY8xoy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si22573383ill.70.2021.05.18.05.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 05:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzY8xoy7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lizBh-0008Oj-1N
	for alex.bennee@linaro.org; Tue, 18 May 2021 08:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz7I-0008UE-AX
 for qemu-arm@nongnu.org; Tue, 18 May 2021 08:46:32 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz7G-0006p0-KD
 for qemu-arm@nongnu.org; Tue, 18 May 2021 08:46:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id l4so14305638ejc.10
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/wZC5mZ7Y5Pdn9iqj3Gzlkf8WZzuqx8i97sO3dKKbI=;
 b=gzY8xoy72y7goimfdzZFfrxWbPYUaAdcij10QlbQoGeLbajgXHAlYwXEz45yN4rLh6
 nnW++bSJaOylRJsOHA0ZvxDrtzYT1b2eguGqY1L/XpIPSf+UDAMyIgMt8Sjg5HsLC17f
 XK7EF7hgFQSph48v3CUvfm0IydQqJii2Z/c2/UJQGq3Lx0/inpmA/gLB6YgshIxgzzB+
 f2xhOwz7Uqkk4C2FVuewRqfJcEC2nFlCiEr6DhXad0IqUbARdpZggQ+J8g6lJI4FTW9o
 /fhv0JqGuaupzVhWuBQZXmn2iBerp1cL+2u2wLjwDKE1g5KnINaMe023R6QHeYBo9BnZ
 7fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/wZC5mZ7Y5Pdn9iqj3Gzlkf8WZzuqx8i97sO3dKKbI=;
 b=lzYDN5WgZ72QbIAoczt9gChZUGuC2FJYioSumhbwEOFLpHwoFIvXzMNUn9/svSV1+S
 A+4ocfKq/aneuz4MpSOBBwr/WS+pAwl12z3sRr3kLau3rrpvbCdFDRX0kbcLTy58KCjR
 7+tlO5c3mtycIilLNwu+4zzXzQylCRr6il1gVrA0A5YpGFY5y1ybIPubEQjYNAm9sVYh
 eplMQ5rY0jhkjrLxmRQY1Qibd8D3I5BKlSqFW18+ot7R7UmonACpFNUBCJSygKUzs7WM
 k2txEjj2rDnJud/04KisTagyWcX992eTV1x61p4RW/N0Mb7dif2UiaaDF+U7dFLos8v8
 MXAw==
X-Gm-Message-State: AOAM530NBlsN6lFfPJH8fv0RNz5ynxeHXvMEuTLVQ98gNSmYqybRkArp
 rCTIOiTAvxHsOVBLo4fJQE7Hx9fpE9bdvssI4PFs4Q==
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr5790668ejd.4.1621341989096; 
 Tue, 18 May 2021 05:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-11-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:46:12 +0100
Message-ID: <CAFEAcA8fF8NiW7dD2cc9kmtiBa8koxMa1o=RBMjMTJEjSMhYpQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] target/arm: Implement bfloat widening fma
 (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HnLbBW3zBUgC

On Sat, 17 Apr 2021 at 01:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
> and VFMA{B,T}.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
