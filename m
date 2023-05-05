Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp366151ejq;
        Fri, 5 May 2023 05:07:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64Av0ruz6QjxuIkSeDGdlysfD/e9Rxz1ogkR87OpKyjnspDwwDs4IYyBJq2UvH86dZrov8
X-Received: by 2002:a05:622a:1209:b0:3e6:3851:b945 with SMTP id y9-20020a05622a120900b003e63851b945mr1645644qtx.67.1683288478353;
        Fri, 05 May 2023 05:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288478; cv=none;
        d=google.com; s=arc-20160816;
        b=oIbRJxiENK2zNd39TnBWtAX5OzrZimXkItpBJq0PxHmi42GSEre7JHbs2JeftPn69d
         0xN5CAVE56Aj+5m/j25dBbpex9SqqxVhl5MbU6beDE0HJHJ0yzZ5A6KCz/u0ZJpztI+Y
         gI1lVIzX3fO6y8x5zmdiSnBkQZGyKib7JAjsQtIJfp2Fttz3AHsTq7qKHMNAyfBr0X9J
         /Nc/qDt5xVbhwDdtjY2UHnykjaLt+V+rKoXzT9p4FBg1NTAVljUDctjsijkgNIQWgEiO
         8RaTNVFvlOOzaR6oxTCBEiR/HFCXcNcwE7XGZAHRVMGxTJT5wK5l74ONmexBD7Zi/d2N
         qAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IeE0tVUnAAHqiHSGH+f5XWMkv7TsILguSa4HC+yC1iM=;
        b=duW0fXgB+KaIBqQXTil5W9kW/id/H/tq/LgKC+bkUATqj+/ZaAxG5PYF5JdMGFEWZy
         DH4f8L93jqNlN8y+BkidMRENT+7B9U+4weav1m21Z0dLYJptvVPsLhpfBERg+roeflmn
         5LQnFshXTmkr/TkvDFMI6+DuxbL9DMEIE55Q+rZAohqM6gzsrNWrvJQ8dquUpTHnDW/7
         QfnTcMpjilS7MQRETHoman1VF8WtkdH2NujkNJJ03fPVU2KLvha5C7DPCt2A+kXg9UFt
         xU6MfgkLGOnBr8DQYbcpLXNpGI1RtJm/ybACSc5XwMUF+LmciPorsb/Dmpd8cs9VYrjk
         mctg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMdr4GCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020ac85b0e000000b003ef415f0190si511725qtw.667.2023.05.05.05.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:07:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMdr4GCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuDp-0001UO-R2; Fri, 05 May 2023 08:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDo-0001T1-Jp
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDl-0003rv-VW
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:07:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so297422966b.3
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288452; x=1685880452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IeE0tVUnAAHqiHSGH+f5XWMkv7TsILguSa4HC+yC1iM=;
 b=hMdr4GCUaI68TRF86RjfqmIuq2ROqfHmBZktJVb8X3XuzXJbKQ2wocFuYb5ywS1oip
 0vayBnie0xTmxntcGFV9WbcRY7YAvxoVC8eQHJ3C2kN2i9kIxQX4YTfka48BFIUQxlX9
 o4h19h8Oc7eefmcmLP3O7LqGSKkN90bc7uyncHpJNfDmOb2MbPkkxQ5ApZvqxdORbRCv
 EakmCJdih/sp9R6AFYYJBP48Vv1pnSaf08JnumaQdS8vR4/vtoGLZkw7b3jCjbPi9L9G
 uvNqHFnBIesgQ6KIzeH2DCR7EpwCI7H2FC+d8NKw5fN21Sk0d18K4IdT5IyyyJxksLHa
 Vr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288452; x=1685880452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IeE0tVUnAAHqiHSGH+f5XWMkv7TsILguSa4HC+yC1iM=;
 b=Zaz3BWu7cCqBYOIwEty8CT6k9vpzL+4wI3k9S+o7L2IoN3HpM2JrH5RsvGz+gs5upw
 sM86rlqo8tgCUOsZ1qi/c9HWQU2E0nJL/yLyC9ZxNyFTSewME2yzn50UhB6aDGTCbO5E
 OZ3efHNRjCQLkIH3JEz3nrHhpThhqGjYMumMFgiov/8rvWl/z/r8GYhvhyIJjnNGPt82
 128sr4CXBgKN/+eSoGJou6ZeCg0shOtYwpz912Tls7hpjQFaZlxrr01XEfdO/f5pSwlk
 p2fghIFVDxmmjoIbfvgJnis0Hasx4tPvz+MQFI9mDeGZ0579CKojgkp2Hz4ZK4j+PkDW
 x5rA==
X-Gm-Message-State: AC+VfDyWiXNe/rVBCjYUVMMXAehGng9fV4VjSRQJYA908t2GXWAIXu+G
 6TF4zS0Ysu6NtJVsl0Py4eyICcvS52Uo6aet99/5txDmk3hmTz4S
X-Received: by 2002:a17:907:940c:b0:960:ddba:e5bb with SMTP id
 dk12-20020a170907940c00b00960ddbae5bbmr848052ejc.43.1683288452225; Fri, 05
 May 2023 05:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-25-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:21 +0100
Message-ID: <CAFEAcA9WXOKQ5Nw2gDvcsJhBOSvCd0L_HN__1yoNCWN8Hr-YoA@mail.gmail.com>
Subject: Re: [PATCH v4 24/57] tcg/loongarch64: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QsapcXP1B2gu

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
