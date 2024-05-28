Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp45541ejk;
        Tue, 28 May 2024 08:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaYmXmoTbSNOWM/mMP5IRTsjQjcVr0Lp+Jfdl0uFAm8NSW/pIySZdacq4YKaYzbLF1KqSeiPqo2i2945jDXj084Lv9x1f5
X-Google-Smtp-Source: AGHT+IGZLn0RTaHkIBFbujZengdxgndh2x7kvc4ttMQLtUksMoq9IAKH4TR1VkFQVLPChCE2Ferb
X-Received: by 2002:a05:6808:14cd:b0:3c7:85e:ea36 with SMTP id 5614622812f47-3d1a5c31835mr16227792b6e.15.1716911960352;
        Tue, 28 May 2024 08:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911960; cv=none;
        d=google.com; s=arc-20160816;
        b=k0w14z6Sj2gKocf7D3gK02Vi2DjL9ANgcUJIOOcQp9PeLyxgvACMRwExHXKTxCeatg
         SPAS7KXssOqSu/5kh7t1bERQl4dxiW2vmz6NlvpUaHIX+ObUu85pipQflaLt/Gy9DiXJ
         F5LxD+fHBxW7A7O8B+/edQPzg/EqYK5Qk/wtLHl6GMySdfGzhfhsyc+epa2Y5IVMEgAk
         OyD3itWOUUE6PUUN+Z0vaQLH+tMcTQVv/V6gDMR4mB1XUX+oEyVXvobNpGslKt6KFSjY
         tYHfTn7Uicj2/0GcwC9GcNyxkYQhISZo0z01fvEBwE40zLsx0G2WVkpjtmEGbgd7VyWY
         8r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+aNaF50Jev88tg3uWX+xblCjhz25t6A43YeKwNEzfGk=;
        fh=IxQkgjD11EIL6cIUafCYMeajgMPDGcwSyt5H1u/FZ90=;
        b=BHMNZvwRsgRSCpP6PnAtpe2jCXDhAQuBgGhAoJ2sMqpi3R3i0MA98gr5GKbWef0Ma8
         R0kUhjsG8Da6TnrLt9BF1V3xD6coFZNKLrfYxUD8YvJvv/ilj/m1qKiCNY/4+0+V8q1Q
         V2ToItNJgMDw7/d1synd3K+PgTxeWR3WH6ScrLVy54xJCb2kGSuYNboK+RSldlUncUxv
         ohOYpxe+zyCIyzcPHiu+MfbYgfQXwzQiVQQkg3nNt+QQNNP/BVnCBaNgfyKShZC2Vu0q
         lPkkGqzojHIHdJRhK82BInXEyAeJUJftMQuntLLx6kP7T3kmFfxC3xbuIyjFZeiWK74C
         eGOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYZY1gqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ad737bcb5esi74311226d6.543.2024.05.28.08.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYZY1gqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzEJ-00033e-GP; Tue, 28 May 2024 11:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzEI-00030X-Le
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:59:14 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzEH-0007JX-4Y
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:59:14 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-578676a1b57so510431a12.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911952; x=1717516752; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+aNaF50Jev88tg3uWX+xblCjhz25t6A43YeKwNEzfGk=;
 b=NYZY1gqqOM4wsi0qZotbSusLCih628cCg8rGmJDJO5Aa6RS8zcaSr5dN8Ms5zJIwGQ
 YueL8Tlm4KJVzZrN+mDOYCW+h+BiBZZpOzeYBloz/s853H+duuE+A+aFYiIERPCU38Yw
 Qt4fPhwIhrNRWzBq+LAmDKEWhb/NWkeMFc8CRKhi+RHya0koM+7xG+OzurwpSbivuAr7
 8Cd6wgMJbYgduh7Vcxv5CTci4veMKS68wVmAqxXHLkWU6dTrDgZx6ZmDqw2Vr06iIJpn
 XFXktGyfODfrKxbPOeXZIM+DtiSXA06Y5q09qGjYctIa2rKktSXGQpdwKA+fcF0AAyOA
 dE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911952; x=1717516752;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+aNaF50Jev88tg3uWX+xblCjhz25t6A43YeKwNEzfGk=;
 b=rc5hPm3tnxVg9Hs4sTTpTwqnl56Qd7/W5BpFKbX/4C1GDQyysS2C2+7GdmYrE2NAIU
 itmoAHDhUE488brgg4A1SptOFeO2zenApQPiGXVpYx0+O70m5UUbVLBLZf6APzJIZJbU
 6861FLli3M/jCV/XdqMkEAjHixIO5eglYpTHD5kh+4QDKy5drfay9roBsRYep5xjVJuC
 hTgt41THg7/DHS9wdpHp8hcXvNx2Yqn+YDzUD4t1+/cGJBfsFQDC39VIDF+tzsimwTDs
 HeSA29mDyc2PVHb6cj69ISiydsYSMXOMl1J5ZQxZ26ZFRtI/4OuHNlBR+rG4HeDeraLT
 nqcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXeCYhfexAznkIBAETzvB5q7cFMrc7ZbYjcN9uNuMOPzUw3WSuWCsZQeH0GqWpjsdoWKvfWxTCQiwuzR6F/1topvzj
X-Gm-Message-State: AOJu0YzEi+sFh2f1Aj5NdihXz06XwNuVBmAx8UehYHkQ4n4Bon5XffE5
 eGu7t8Y1i+TECGY15YDDuruFDtnzzcajMNhYNzGSu2cAUeThQTBeYSnWqIOpCkkhCf/ZUHR9adA
 1joukgpyLU/H9WSfA0GPl5tLNszGOICkB4uMReA==
X-Received: by 2002:a50:9318:0:b0:578:62a8:a5ef with SMTP id
 4fb4d7f45d1cf-57862a8a6damr8244698a12.8.1716911951604; Tue, 28 May 2024
 08:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-54-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:59:00 +0100
Message-ID: <CAFEAcA8gWk0H7kR20JHB86XYps9TMNtY6TUKEcZdXAnqSq4++w@mail.gmail.com>
Subject: Re: [PATCH v2 53/67] target/arm: Use TCG_COND_TSTNE in gen_cmtst_vec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: 8EU1roJLDzPT

On Sat, 25 May 2024 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/gengvec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
