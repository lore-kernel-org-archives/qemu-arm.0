Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20768C61DC6
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 13:05:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzZme-0007Am-Tm; Thu, 27 Aug 2026 09:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzZmc-00079c-IO
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:04:42 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzZma-0003DA-SK
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:04:42 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-81f64e8dfbcso15836897b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 06:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787835879; cv=none;
 d=google.com; s=arc-20260327;
 b=mXJVmmg7FLQSlgFiFkvCVUqcnnG3wprPsRltrnWenY0jsoyS7zqeKtXvkPav2M22Tb
 lCC7Q7biDr/Ro3E8/eZhLKiO8bfJt61cTSUcvtSs+g429DXgJaLpz0vBEOMAYb6brvPp
 SYmA0qGDs1fdKyzhxVzk8ptEwfFz1OoWfyRItWhJFJ3xhJTD9egRIo2JjTVs8vhZXv4Q
 d1KaNx4u6OXhoQfpaK4Aack34ouXl7vpuQLHxZNvZUauxpXjnYbCXU0issde7J2t1pZV
 vWn7+sa95u6+qbHvWflcg+VLn5rYcTyMNpwZ3WqBWFQnUvhhJuXfCCYGBht4le+fHLU5
 kBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=62k/CJQ0lXxi9UZloI9PLMrWhr2gyA6vlJXi0b46kZw=;
 fh=bY+LV4pxmzKH0slHOTYs2/aAV7h7ukZ06W5zh9Jjm5k=;
 b=DWkB3PP9HobYBHXKgBBtzErdcriExP/GNHbV/zbuY0l6HWeDujs6+FeFt8fE7Wk9e8
 aaaA+JWAR+btAKgJIYT+wYbULSiWwNkwaGh3SQh7uHlxbglSfSZNOjjWZC5NVsXl93ex
 qLsI7idpyy2IZMMfKVnKMc8y1FnjYFDGfetS5MU8hVi+mdcbVR0yidHeSJwznDqmAIKZ
 r241H495y+289QrB16JOagmDhRXd+Pf1eBgGyuftdIyP577XKN1POWTD22Mq3iE/eft5
 6eLT2sH6aknp3a/H1OwBP9Ssrt+tgFLHLv46/MtywdSTHbL5g7MjnJWWAIcsseDNhK9i
 UvWw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787835879; x=1788440679; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=62k/CJQ0lXxi9UZloI9PLMrWhr2gyA6vlJXi0b46kZw=;
 b=QQxni7tJJQ9EXOa/RYnizOH5NizPop/yKZvaOL7nZrqPfeMOKI5c+N2FXe4+EFa46k
 sqFQI5sAe5/u6KWUkoqwigMohKS+XNByN6vHuUSAkk4GcdJFnb8Hlrg7iZ3SvlXtMgC3
 ZDBZISlGFw2wC/+Owh0i7WJ0i6e6/1PLAHFQLTTNOltA/m79qzKQM8hDF8o6SAhM2Oeb
 YZpjYL+U1tRWEqujxszL0WcywCNR26l/jgyRkDQ/RcMnEhW9zNKUA6vnc5ZGx5AFMYHM
 sba2g7hzMWYQZnVG8iQDdkPtYvns0CQ3AlmEcNK6TyqIIPdeYsbZ3/bEVhZdJ0IC0ySZ
 Pxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787835879; x=1788440679;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=62k/CJQ0lXxi9UZloI9PLMrWhr2gyA6vlJXi0b46kZw=;
 b=XcCB7XT8HzVkpZRMP6SLZqzNNFK0UAk5Bd5vbPrqraoQJPOFLY2V+sWw/HAvIyL+1c
 X8Tg4DjCllFtgGxyrrDn5rNRVqwjx0QXEOXunkNRI9FZaDBA/F9HbsHju17xYdBlQeEi
 mFrvfzRve40rYjLdBUDpuhWlfohpBw7MWSA+v6wIjhv2hmoZPthqylWUMEjbrWi2pS5l
 yLWvFczQiGSGQ3VExsOAyjULHZH9dLowpwRV3ZxradtK8AlQ5HWolmGypu3IBXEzyBhH
 Ki0XkgfP0ozM3Fe940k7ReJwupClseUxoNNqcMRlJ+RRumOUuhFfUsQZytSUFT4mToAS
 1NtQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEAP3n3cn25BvZIsjdn7BSGiAKcjkRV2jaCQp0Gxx17cv+Mx33999+oDUrDcyfuvB0beDx/TzXeA==@nongnu.org
X-Gm-Message-State: AFuF++kAORxI/DTsHi1ke5a7etjQePV8iAQBioGF2MbxcsNh7lprSMzC
 /pQw/BFELNo1wpC0DWUoC3xRAWdRxvaV4Bw2gfFpUDCga23X0DuDWzZZaImPk2N8WXaYao3hDCR
 KzSxtPvfuLvGfar/rtXgD3oWP0J0jsaD4p/CdD6FNxQ==
X-Gm-Gg: AR+sD11QqDPnAar1wLSTlAkNQz0fuWkgCzpp/AJkB/yH9b2IKO6MyQRmG2TDJ8OliBu
 xABXsyb5p+Y3LFp9hddaFZqpi1TygcQM1zGqi3Sk3BH5KTDHz29UJ2HZvOsSZKl0rclJ0LvVwiB
 LJJZiFzTReYILo1Q2DiE3ppkADXUaFO0rDDosTT4ktcBH/XyUdjMRmd5O1fNmhOl9GtMzd98nBt
 CCJt+G+QGWn2EroW2JI+NM3EB+xKURATXBi0MqQjf0arSCUSRpu8sjKsKQ+yuH90VJ8WR7P3FU0
 3dVX1eIhxaJmCOwgJoc/FqY7L6y4AVHq2y2RKoWndCgXxLMfp6Z1ZsQ0ru/i2AtHWOReLE0a4Ji
 K4uaCKpXl5Ytn1F0cMnjcxRiQpLau
X-Received: by 2002:a05:690c:6e86:b0:844:c27b:35dc with SMTP id
 00721157ae682-8573fdc504fmr65654557b3.18.1787835878777; Thu, 27 Aug 2026
 06:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260826174213.614571-1-richard.henderson@linaro.org>
 <20260826174213.614571-4-richard.henderson@linaro.org>
In-Reply-To: <20260826174213.614571-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 14:04:27 +0100
X-Gm-Features: AcwNN1VJMqMelFR4tDdlXLYqB4WnnfO1N6VtQm1Lh-L67GaGKysUICvbidjcmPM
Message-ID: <CAFEAcA-xh=2BR1-C+50nV_rR=R3pk9ET9qH_oE9-=2awKhi9MA@mail.gmail.com>
Subject: Re: [PATCH v2 03/25] target/arm: Split decode of BFloat SME FMAX/FMIN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 26 Aug 2026 at 18:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split decode so that feature detection can be handled
> external to do_zzz_{n1,nn}_fpst.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

