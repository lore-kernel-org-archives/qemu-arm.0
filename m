Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1333783lfb;
        Mon, 6 Jun 2022 05:35:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+nJhOwQ2N+NgJqDqm1k4DjfPTEgeJpkfAJp4tGdFpsnfHQOhuSS4f396EDKkaL9XR65Le
X-Received: by 2002:ac8:7fc2:0:b0:304:f234:4597 with SMTP id b2-20020ac87fc2000000b00304f2344597mr812921qtk.673.1654518907010;
        Mon, 06 Jun 2022 05:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654518907; cv=none;
        d=google.com; s=arc-20160816;
        b=E/3nk6XTmV8UYV2+XTcsqoZF9PvdOPTDOtcQvS4+x/SLyu3cuGBQfmSP/aLd4hvECV
         vJ6YhS5KpeyLwkgkvuKB4RTfps6ZwvDWMv+X5BvnYEePbB1uFww+GLEdpRFvc1FNpVXR
         aK6pthMhT+1397JoLBYBUJ4OajCvnWUbrGSxuU7k74pZoQN99OFAE+fqJFs1Zg52QYZm
         LHeINMTuBjJAOX54UdTsU56vVj2zUnAJjLco7IugBcQakiGgXwc06zaflRujjFkSYHHy
         dJ9VDgafmfyGk4lSHcLMbfgfaVnvBunSqun10TqcCL2Fxfec8ZvikMfOw7m8L2bMZSmC
         MoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NO4iBUT4R56gTwZUn3mm6mUPBHqFo41z6tVR3s+4GZQ=;
        b=rvtmLmgga7EIWNvGOAPTX6ChOti1slP0QyMh8SR7IIpprzWFGToJz82tHlcJDZoJIv
         l1bHI1Kxgd+r6vEo/Q6SV/1YjQrqcR9EggED2OA7Jchx+1HWDu5OaGCzsuK3NlyjeFXs
         wSv4JWsiV1y+WmcV/fNAVeu+VNz663hn5umV23pO9HwN+v0W0FlRfF6dD5MRsRxF5ZrI
         4GsVEoKwojEAfgZjW1cW766SX8BhWKmB6KE62XQDmlMKY/LPPJJKD+yUzkYSorM6JLef
         ity/QFtG3AMF3KZ2gPaixTT7b7iZLqCFQCN6brdxhLOHpC58YGuBH+9KNiciGE7bNyR6
         P1/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8Bx2w+9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8570e000000b00304ee6ffdc5si874784qtw.533.2022.06.06.05.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 05:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8Bx2w+9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyBwo-0004OY-CH
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 08:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBtG-0001HK-8u
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:31:26 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBtE-00025j-PP
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:31:26 -0400
Received: by mail-yb1-xb34.google.com with SMTP id f34so25402999ybj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NO4iBUT4R56gTwZUn3mm6mUPBHqFo41z6tVR3s+4GZQ=;
 b=Q8Bx2w+9FAn+Uwgsd8AZU7WbfoBcQily8AkpfZJdhl2pTI8ogbRVOZh9cPb5/0zg2D
 /2I52tnYiQuQrSzFhhs29FmFI+rBI4Ow+474x+cJp1cTQscrMqeWHIZHNRFAh/Fr8GOL
 YNi1LQfH7hBPutVlLp3CTPXS3At9DrkgHVSr+eKARvvL2fY7tvlE4LU202snLleZnN2q
 gUSD6xBXflf2ZtvmzAyGd6R1EM1mtAmQlURHoMddpXp0obrStAwHgwQlUBM1CiRWNNDH
 QI7Go0AlOwDiiE5FEj3JgVV9+LjsPs9BYtXojIXPQouJbnXOBc8BjJT2zwWr4/vUX9X6
 QLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NO4iBUT4R56gTwZUn3mm6mUPBHqFo41z6tVR3s+4GZQ=;
 b=upc2N44ej1Sey+PvGXkD393rzKcIF1t0qaMe3AaxEYcaQePevCI8U1fhGB55P71d/O
 yOWlC4IORvBlEMdWdbF4VdN9yFG0kLChpJmlZwFQorAfVIaXiReH3zhm7tRdV/ks9F8T
 uyU7RJR7z8lB4qldrlr8kYcd+eZEchZh2FOQUr/Y0R8aPkrkqKugDWmJTWaKE/FCV91o
 QioeJROeo+82adfoToJeYYjVcrO8UYFc05Klp831XYOPAx4WxMgUZ0uQ4KJ4N1GO2jZD
 6nHE/tm0VkvX6mx688ihxf+8jtDGXbwITuiNxqHUhJgTICoMH2XC7K6HwYIqWH6eSlzf
 6mkw==
X-Gm-Message-State: AOAM532tvbEs5zzVDmRit08N7Z2HqQy96CAbxjie3LID+mYwkvIyWR3u
 NG1JshkpHkYPbmCCyoFTysBfcEqXdswDMjFiLWhsig==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr24569834yba.39.1654518683196; Mon, 06
 Jun 2022 05:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-20-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:31:12 +0100
Message-ID: <CAFEAcA8-O3-nC4y9ckmK_WX8B9CT9cjb_je1Yr2PXherRsvJEA@mail.gmail.com>
Subject: Re: [PATCH 19/71] target/arm: Add isar_feature_aa64_sme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RwvDCtaCf9x7

On Thu, 2 Jun 2022 at 23:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will be used for implementing FEAT_SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
