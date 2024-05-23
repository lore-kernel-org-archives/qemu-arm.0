Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1000771ejb;
        Thu, 23 May 2024 04:46:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU8v/efYOzrRq5nP7esChvnXvHPioCDiwQzbnQ7hLpoTf8yB+9YcPHvJkoMxnip23lmSNUkUBzxGLq25DHiRjXBNXL8TCr
X-Google-Smtp-Source: AGHT+IH14/+bR28oQ55/eqnTfUHvrXxw7kTheqeSaqal0bl4xU4cpSecFhOaTXQeq8TGqvrJhhZW
X-Received: by 2002:a05:620a:404e:b0:78e:fd59:3c3b with SMTP id af79cd13be357-794a09bd22amr407788285a.35.1716464812189;
        Thu, 23 May 2024 04:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716464812; cv=none;
        d=google.com; s=arc-20160816;
        b=BTlSfHAezCxiFDImHiKrY373D/1p2Y5sqLowchvW2hYwzAnTtJlmwZa3PXimolSJ1D
         w3pZbLVWAGSvniY0MNrF6r4+WdQzg2P+ZFPd2yKqt9toskLoksxLMUxtHTUFGn27f4+C
         RXfxkqC8N2mamSy8iiP3bkQze7nt/1PEPEU3VghUzls+NPEqouw1dZu7SCY+fxUnIDrQ
         9vZ5C3icFTCyUQ4N+3jZHVwk20hYeHtO2JDXkpnwri2EW15xR8i4hncXYpqeqX6Gua1F
         XMYHHA+HDD6PABmHR6iXWVaDuu80yxLrm0isTQaEisX7jTUvfN775BK2y6ZsQoRl+1AX
         rc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5ni4aatgYwEB5rYv4FjYzqV5DKN2ZiC2r3ylQQbvWCs=;
        fh=vdP01v5I8z6OcAmNnJrPQFjHiBLtzIOYLCXPBLFFrAw=;
        b=fRSPhr1x9KaOaXiJ5h3NSlgsA1TXx6hRppp40LUinn7UQW6LDqHad8qfi1Bh4fzPZS
         3RW/ppFNbKNo4aDLinLRyx6926E/7JC7O4rbJ/Gzal/9fuv6ryi3gxkYET+OuG5indPK
         dWsQEHMtZcknXsPcV7yu092zdLkfB2ldUKRzMdEt4fquUCsVpMCRmXZVTJE/FUsqAywJ
         WVRV8KRypUT7MsDbfN52QbIqYjk0pi69VfMXQ46E3niRmqOCQhJarGwT4ofMRNq6b3nj
         9ymgX8JaElkhxvDAVnZHeyF12Hv7R27tThfOcx5yCJ6JteOxJgPeHPcYxgijRZB3lSr6
         2H8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fsIW4OaQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf2789easi73696185a.104.2024.05.23.04.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 04:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fsIW4OaQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA6u1-0007Hi-PI; Thu, 23 May 2024 07:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6u0-0007HP-M8
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:46:32 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6tx-0007bt-GY
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:46:32 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5751237a79bso9191441a12.2
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716464786; x=1717069586; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ni4aatgYwEB5rYv4FjYzqV5DKN2ZiC2r3ylQQbvWCs=;
 b=fsIW4OaQ7oPneiSaI9obotlr5gMvQ9Ouc60naShDTJ8JsEpLqBU8PsOQd/TpS7tFPm
 fIEP84T7MAXYpuPGoGD81Q++cR/fob96Y6GrN8Qfjp5GhZOQv6SzyWDjY2d15grtZ7wu
 G4UDryavbLRWg4KccOX6FDYxI8xNoNNCnQbWa+/N6OJ5/sPYS4XRX1010t3H6H8WFQ/x
 g4lROUc1JkQCBQWAsniK8LVc0bB8DB5EVU6Ipe8/X91uNr+uUKL0sKUo8rb/8e5FZbeZ
 IKIoKz4+AZUAKl2kqYWpxmhaztlLjJynHf3Fga7VTvufNdqHoLHRAX99xsF/xg3U/nss
 xunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716464786; x=1717069586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ni4aatgYwEB5rYv4FjYzqV5DKN2ZiC2r3ylQQbvWCs=;
 b=upQ//pdFWtAP2iIq5zX8rfe55fUTQVv7GiFpIXqO/4ce6Uh3cxPZHZ1r0px6ptfKCR
 I5u3wqoyIqrNa8M7Zda1fLzM1ld0AWeHg4slXK69Dbq7Fp9Z4oFZvLUFSMEvCKL1wfaz
 BLGlZA4OFeOCpRRvImKGVbxuF3Hxv6YZo7NhHaEK457Eeg5q93v4ZrlCtZdPFuLDwv1y
 8Swbb6suYts/7S5sFPc7cnWZ7dV7onjSzS2JZSZBN+So6jEU/hPFHa6xLLgIb2Es4JSB
 bWucFzJYnDgw9/YefTs2j4cVLHDWvOnYvvTE6TOUNqlLQXOMC7qXUOy4zs/E8kULX5fl
 DMmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAD9Y4zxJQaiK1lD9od/XQsQWtqnpmEnyp1ey+m+cmLLlqyMFteq1y5bnWpTvPGp9aMH1I0fK9fiDjpQ+8PEzcTKQ/
X-Gm-Message-State: AOJu0YyCQSIF1btEyzdRSOspiK3+jFy7ZwJe1KamJRp+k+Uzl+rwE8xw
 gff4PCdr+YvFljebQTCOwQ65A1Ql8V0c5eA2AJz/uC84lfOgllQgIAXzYwVu5yTAbBmao87tmJs
 S9Rd1+kMu1NeJEEC8/L2qW0AMvptVqkPR+mjXSQ==
X-Received: by 2002:a50:9547:0:b0:572:a198:49c5 with SMTP id
 4fb4d7f45d1cf-57832a67985mr2897593a12.16.1716464786133; Thu, 23 May 2024
 04:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-17-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 12:46:15 +0100
Message-ID: <CAFEAcA_vhP2Mp=QYXgFxBM8z06LOG9O5qxY_bcMHdynPA8M=wQ@mail.gmail.com>
Subject: Re: [PATCH 16/57] target/arm: Convert FNMUL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: rxoUKcffW1sp

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the last instruction within disas_fp_2src,
> so remove that and its subroutines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |   1 +
>  target/arm/tcg/translate-a64.c | 177 +++++----------------------------
>  2 files changed, 27 insertions(+), 151 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
