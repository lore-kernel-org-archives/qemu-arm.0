Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp36350ejk;
        Tue, 28 May 2024 08:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbknMt4cOmNpzmq6RVvaAzpgrpWllxLCt1ZcmfxQ808J7+ZfS1fNf6jw/VFFmVzX5riibrVUVHijWuACjIGsHCWQEcJIAf
X-Google-Smtp-Source: AGHT+IEfv6bLhEt8exfM8v6N+jY+OL7Knu9OMe3n8/8ssvG9CtaK0Zv0EtavWhArFmflS75WZbQe
X-Received: by 2002:a05:622a:199c:b0:43a:62d3:2cf5 with SMTP id d75a77b69052e-43fb0dc001dmr119661881cf.2.1716910859559;
        Tue, 28 May 2024 08:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716910859; cv=none;
        d=google.com; s=arc-20160816;
        b=YD86E8LdxnLGZP7sPiWgi2afAPwVwiAlN7/+Quk9wB9AlWaBB47Vmzw9e/R5xxkSD1
         4sTsXZZ3qvHqhz+oSxO+fOxtUpvqnmx3WdMB/qvohxk4HdzeCo22FoP1Tjs3/hMWajBb
         cWac6nA0Nin1R1hA1gGxPZgM1cnSDyHhHxfBq0Uuj5tsabHg4yCYU+8S+mLB22TAZF8m
         IMwGozM1QqakPQtmjy2Oh2qGosUTV997hJ4kwOfVylTMtl8M4cifeuhf7patcd0Ag09L
         LXMQq6Ja1O5h94ebgdcAD6EGtv+sJPtinfqqCLjHxvY2AMmczBBJxOTEwr03myhMIZpI
         ejXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZzTPYtNfMgt9HPWeQJTgfsmYru0kbJvbA6DJB+4g/ok=;
        fh=otOG7Cp/q17vwUqnvyBwSRg813plhnntpjvniR2X1Cc=;
        b=FUHn1w/Q0lVEfCO66IVKO45zym5DyArSXzUTdWEj7GmM9lzYnRafLKAqnFC1tZkXUT
         TePhkbpuwFLXVCfKMHWn81vzYxAIplNq5JE8BdhFf3/TtuWgcJKOzTSSYkB8lhrOtO/S
         g/TXvwfapRQC3Egqni7b6lfbON8gfj90PUc9suZ2Gchrbqgxmy+OvkF5uMdSNrNsOSyF
         qt8T34mGWLVhiJF9Z5JDYRt4y+x8wIzDE5AQ5RbGlXTOjuhgHk1rx019Zcb6xDCYZox4
         HH1/A1Sq6/ZgzQbDIOX7nEqCSoUdPNeb5Odtn1CZQT5Jut91l/PeLYDv3sYE5ZXl9yw+
         v46Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAH8tFCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a6c3asi100112391cf.379.2024.05.28.08.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAH8tFCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBywY-00014y-Sa; Tue, 28 May 2024 11:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBywX-00014j-Pj
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:40:53 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBywW-0004xG-9L
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:40:53 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5788eaf5366so1185666a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716910850; x=1717515650; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzTPYtNfMgt9HPWeQJTgfsmYru0kbJvbA6DJB+4g/ok=;
 b=dAH8tFCW7khyCYwL5iRgrOTY6e2kYGbrSdZmCl0DbRBhaO9p3xXHz8u9OjXGU2EPmX
 Q+XNq06khf7MuYSEqupsQNKYjIBnYVNtxql1oRQZDNGPdZkW6XGRn+xMaIn7PGs26YrB
 LvZD77z1i/DeSitp9OjWUVk17eQTkL0wy44LAnHed21NmQhJskExA/UnrctBM4z279QZ
 77iPqQJHdEvhM53lJsBUBd3YVNmlnQB3mdJyAv0HyAcFVb+aupv516GNgomkIWLN/nwD
 RcXNS7vTf1xa9P++vlEAs5dfgb+kdDQLpIdhAjCdCI6d6xmYoEBisHAnuXTIe2oGWcvc
 NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716910850; x=1717515650;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZzTPYtNfMgt9HPWeQJTgfsmYru0kbJvbA6DJB+4g/ok=;
 b=pwTjps2T1X9y/dk2mNH2+edAqRP4gGWIOeWj4fLhi2iajPHU6Nho+WJaKRHkoG64aI
 6/jkSKeqXeVb1gUgeRDVF/rBnczY4AQJGs2sWFSzoE7Fv2WhZlUVW9f9mfjQO3sd+Lbi
 DrN8FW+3NpCc/8Hn/qqQ9Pfcd3hMkesVQ7ftPuP4qg0bFnFQ/aNrnCDQo4Qm7TWFPefw
 8Hxxqkfq+SCcfv/PgsXuQTG1qdXHKHULgRZoINzjx4WIODUAQh2L/Yn697nyUSkrRVaG
 cLg93P90dcChim1G9vPQMcfr+YXMR3pTMm/Qzv6/KXmjZweDXclQlCQot+ifMw01alBa
 bmPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQsrIdB/yLt53vDX0iS0cQ/3ZtbjED0T2U8q4YeZNXEt/cMYvGau2gJ8JHzasISI9a2u5xTIlLyfOkjnbgDh4QlPbp
X-Gm-Message-State: AOJu0YyewsPzj3XCjL6WmqHdoDmNWK1dtrphxPcntRhSFtXpL4g/7uh1
 /orf8p4XrySX3woxjrqoALfhzNJJWCqXOm1gfRcKxE85P4MEPs7FEhjUnYG6t7sukX1eAQ0SDwL
 yyz4EiqfUdcfqn3Wxi0/rMwQWGvQaxpy2g3BpOg==
X-Received: by 2002:a50:cdce:0:b0:579:f196:45ac with SMTP id
 4fb4d7f45d1cf-579f196473cmr1516180a12.7.1716910849666; Tue, 28 May 2024
 08:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-40-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:40:38 +0100
Message-ID: <CAFEAcA-rxn-Kkq9JKs6h4r6mHp3anAsohYcrfJw95ET6EFk5tw@mail.gmail.com>
Subject: Re: [PATCH v2 39/67] target/arm: Inline scalar SUQADD and USQADD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: IO+SbX7RDZD9

On Sat, 25 May 2024 at 00:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This eliminates the last uses of these neon helpers.
> Incorporate the MO_64 expanders as an option to the vector expander.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |   8 --
>  target/arm/tcg/translate-a64.h |   8 ++
>  target/arm/tcg/gengvec64.c     |  71 ++++++++++++++
>  target/arm/tcg/neon_helper.c   | 165 ---------------------------------
>  target/arm/tcg/translate-a64.c |  73 +++++----------
>  5 files changed, 103 insertions(+), 222 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
