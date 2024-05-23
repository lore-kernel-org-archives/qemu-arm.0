Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp953259ejb;
        Thu, 23 May 2024 03:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAlUAmi6TQJMiDu4TEy1quDn2DJt4Rueoy3Pw1398cbwHQmjXuwFYXqJizNf3QuQ5vJnvTLuTeEJpXndpiLJy9KDrQ+0PZ
X-Google-Smtp-Source: AGHT+IHZtiMbEIRfbZ4G5/XcMHZ+IGgIWGHZwKCDkIjElBpjT5KE4+0JkYZDMjtdfKwXhHZS/q/A
X-Received: by 2002:a05:620a:14a9:b0:792:9b5b:ee64 with SMTP id af79cd13be357-794994c4e83mr450355985a.73.1716458780015;
        Thu, 23 May 2024 03:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716458779; cv=none;
        d=google.com; s=arc-20160816;
        b=DXbVQVWUW3E+NmKMi0q8+beS4VWERmNo/tYHN0w080E+2/hBdkJncJm4cZOuyIR71H
         JGGPUNjS13jcrVl27wGLVPgYdTze3j6ru1RuNuQ102POveZDgs6ceME1uf1+9FWq76fb
         Kzh4WoYVTcMCBsaysKT/rXYhK6KwsCD14MIJ/oq/6W8DYWRwpCsr8N18YGpGTrRiAjAZ
         T8580nD5dwczsh4yMYMaA9K6npwAh9gWgVIDBnmSRwc4RbcqNTqzr0xcmp4yghystr14
         a9LCbi2nQfvstOL1myE6/vjL018bNCUEXuDR571YBucqBYjS05bKCyenYNQcHMQz7FZy
         mslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w2e4UvwgiH9S4kLkyXGGu+7yChD2bqVWINfiO3Y1j4c=;
        fh=9+izAUyPxhKZzZ6/WJvjb+KSmxANRUcVKB7z3lXpTh8=;
        b=yr4hqvj4vH/PGLDadFEWM/Bxv4+UlA9W3D/n4j+CCRxUDAdl5SD9pIY/4+PRHn/P+K
         /i0LCjejzw6ZDunXEeZw0gpbofMGaTigHk+72niUCWEaA7XVhZbh4npJ/hEQI4872NhY
         ZddfzaSHqmpxlG6m1zJa7DtLoktHG8C6vllenpE+86YoFCGoFDXeMMX/SVz8MHMZN2XW
         Atg9OmY2ZG8mCuMwActqJv+oZN3VwYraO/tc7A+ZSES31kJxmFvzQetrmgWLDc1YMV4+
         o1YzYTesr1hGPllLLLMxKf/ZGzszZOcuaxiFZNT/KcmSoHH3V5WWdRHujfXkb6QVWDgl
         fKvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=amX6xIUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf33f16fsi12845785a.488.2024.05.23.03.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 03:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=amX6xIUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA5Kb-0000ko-OC; Thu, 23 May 2024 06:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5KW-0000hK-PG
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:05:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5KV-0005Gw-7n
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:05:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so8727237a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716458745; x=1717063545; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w2e4UvwgiH9S4kLkyXGGu+7yChD2bqVWINfiO3Y1j4c=;
 b=amX6xIUVFvwizYIzGKVsziwCpJ5/nKAga3hIYHi/A2lCW4cu1J0NTrgmf6ftn575Kh
 Xjm5Nnnhf99eiZ/fA5opjO6poNAccVYtr1sHrxW54J8j8uNf9Ywf5qKglNhVSx/ryHdz
 fo0ceQw2e5opZ5q5AzEMSV/UBvOW/TX8Ep1jgrt+STxyIKJWHdwZP1JjJlky+pLN8wfM
 bX+9W04Iyn76x3D3YHMNdnW5AFUZl+/OUT2nGYcIR7j4cYVTg8SQ4hSz3FkBZnDs80cv
 TnXAdKhqTRgiVKwOIgucvC03heu2phFuBCX78X5hxNZwl1NJ8tlk/fxw87TtLmi5H+9B
 kHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716458745; x=1717063545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w2e4UvwgiH9S4kLkyXGGu+7yChD2bqVWINfiO3Y1j4c=;
 b=da21o9ZrNd9CBIvtBbAjGhTpBfj/W1DxzbMEvLnot6KGmiW/Qy/2HJKKO7fjbaw7Ke
 kK8l40xx/N65FS2Oq+BvCC3fYOAUrcXTYNE16M6pOr3/wdqyUxS2q7Olh1/rt/kG8Tgc
 FVgKjuiz8ZDve4AJkf8yBCcJLB55qlHzc0oWLvd/nsWMHYqlqnZBXOyf5NUjSWCMaFWT
 TXyjxkvJmCELiRCZuxbq7SDrKNVatHxgjlMWhbrLcAiyZDR5XahAsisurBRXaI9GIhfK
 MBXFjUS7mnf8KO94F8fRjV8TVM6yPQJ1SUX5NG1KPr0Xakx2Hsx0nbETPTtgW75uDAex
 gxJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ymtjL0RYYg+awMei0MHeoX2Osx4liwdEMjVlj7L+UoHBJFKLzsI0nwwB6gZ0KwNx9UfPN10wCZwSOSydYw23TGzc
X-Gm-Message-State: AOJu0Yy3BB6aQ6Q5S96Iyong7iKND1BClvGNYLzGyq+ul2z+iI9hSIBg
 J2TseSzrtG1g+YNbdRRaRroTLGQYGbrmNpO9PZf8EZO2ye/Y6JBh6pcZqhtOBJKHgiX9EKXR+EV
 g5jKA8oMlhNJ2XTgQbIO5Mlf6hky5rd1WiHFR1w==
X-Received: by 2002:a50:9b12:0:b0:572:a723:f1f4 with SMTP id
 4fb4d7f45d1cf-57832a01b31mr3159154a12.3.1716458744630; Thu, 23 May 2024
 03:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-6-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 11:05:33 +0100
Message-ID: <CAFEAcA8Gqt_h_Jf=hCcNB3vcDsZXvBc9dzkN1YsniBr8ZT+wgg@mail.gmail.com>
Subject: Re: [PATCH 05/57] target/arm: Convert Cryptographic 2-register SHA to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: tcMIKvXRVZ9x

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  6 ++++
>  target/arm/tcg/translate-a64.c | 54 +++-------------------------------
>  2 files changed, 10 insertions(+), 50 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
