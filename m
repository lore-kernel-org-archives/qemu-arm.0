Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6658207ejq;
        Mon, 15 May 2023 10:13:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oUnC/q4q3zZHYrtUji8KTQocUXtOb5U9X/IQbjIx25h20Hf+jvrpKDg6mjjewG8nfYet9
X-Received: by 2002:ad4:5be5:0:b0:621:170:68b7 with SMTP id k5-20020ad45be5000000b00621017068b7mr53115054qvc.35.1684170797260;
        Mon, 15 May 2023 10:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684170797; cv=none;
        d=google.com; s=arc-20160816;
        b=j2TFHx2xuf/uNY8Yb9REEYeBe3kNbfPd+5NuA3D20dC43OA7vSrFqnsQab8c1aBs+6
         zfhQEZA86CcGoXiwjxGTtxdz0KxD1nCyd4UVO6i517r1G2fvMEOyV2p6P3GoHo4Vi1s8
         JZhbuGUIoWHGkWwGB7RyGF02Q/xIVPLqg+5efy+PGzncD78F7EQalEIqVlK0C40FjW40
         6PQJMYYj6Q0DxxOvNoN49xRinPgmFnTjKBKsnzFBFxqYUNBkFI2e0QsiJx6KvsVPndMf
         4Il4V66VuuJ/6k7ThaLSDeXHcfm4E1BctHdI1vEP1jkFsOwD00GPozj07FYiXBNxShUc
         t6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=n0yFH9lSaRKccPrFdBwhG6G3+Dm6iFRS5dy4vBW488g=;
        b=eQajqSyoHy3QnRFYEkEzLcQNwm+WGE/dcSWtwpVayz0kr+YKEctRPpcZzNk3YeWnJ/
         w9ZfiCsOj0C/rXQrXlseXymaK3goXdWTCU6Cc3nvf3lL1Imw9zrTXn5d8n6adGjoS1e8
         vwmPePbJXoWvg/wGmYiF68ZjQ/DBGbIISJG2umB7W5NZH+Int+nRoiLtgJsO8gnVhUoS
         Fvh7aASxwGHGksELYuy3Gfi/fcFTGX3ssUzvO/4kHpclG/OjmokedbGmBkVQr1OwJZkf
         CQr5poi5ehMWSJSL84K38jvoLOkXrkXmXUW3mUZjIg/Aqb2Ep/AdtpEoWhDaxuaSStOr
         D0tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a5pyiJrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a37de11000000b0074df317fe40si148528qkj.616.2023.05.15.10.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 10:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a5pyiJrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pybku-0007q7-GP; Mon, 15 May 2023 13:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybkm-0007nd-DU
 for qemu-arm@nongnu.org; Mon, 15 May 2023 13:13:02 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybkk-000085-Qx
 for qemu-arm@nongnu.org; Mon, 15 May 2023 13:12:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so113650191a12.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684170773; x=1686762773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n0yFH9lSaRKccPrFdBwhG6G3+Dm6iFRS5dy4vBW488g=;
 b=a5pyiJrZAAFcoFVtc2Mw2cdyeaDZbnetlhItn1gG1puXoqvwkyYM/wt/bvUshMCBMv
 saEFB76GNyTFezl4pPWCkgga14HND29Le6wGgmZa2KbnhW8bFQ5qn9L3/aGKk7jaWetV
 Zflm/O/Zl3su7X5EYeI3e4kuz4UXFt+dPwc8x1yCOayLoFWqcsJM4WS3FMlz1L6sEISb
 pAbgTJgQHgPLhtTplWpn6q9J/r6srr14x5Q5L7XCLqpDQPmfAL3lsUQM+yD7o2OLku2w
 s6kO/qsJteC6ZLaGM+4BwhfMJ+1AlcT7DIjBgBrQ8rrDy+9l7OEobOgEw9IUX8mNCf/q
 e4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684170773; x=1686762773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0yFH9lSaRKccPrFdBwhG6G3+Dm6iFRS5dy4vBW488g=;
 b=d0TuTWBzKSCLWAiQJ6nTtLttcjwLfyoCsIfLCoWL5qLaXzNtfMuY7v65UIAHhEqF/C
 h5DdiUSdMwfTY/FmP1QoYC9bLK78wxBVH8fI1RwK/SXCNPUM3hzVW0ykBeHNJOht7mce
 Ge3mmGP6gBeevWd/R70JGlAavP18TVAC35nYVk1TBVZ6CuP3o7IBFuzyILX5/RYdCbhi
 PhfRa6pa01cKUIaWuoswaGJ8TtSlh779vIQWhiup86iMsixhUqHEizNUphzFhYcCz5vB
 4os4lpWjxl2Q7fS665RJPbh7lPNpL60HPxTo5ConV+UhO1/U//LKsmZRI7jXLzM1o55j
 /Sig==
X-Gm-Message-State: AC+VfDxKepKFUY6AGpCFYglCpphSOlksSo+ZltoXJpUn/FOixwSQJudR
 mrLlbfaDUVvBLHUxi8ZBgA2EUp1kx/i8M2GXeCxN8A==
X-Received: by 2002:a05:6402:742:b0:50d:89d5:bf95 with SMTP id
 p2-20020a056402074200b0050d89d5bf95mr23916291edy.20.1684170773255; Mon, 15
 May 2023 10:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-27-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 18:12:42 +0100
Message-ID: <CAFEAcA_LARwtJuieWCkwLGG4hVGH0dKTE7g++o0Cd=Mhf1vswg@mail.gmail.com>
Subject: Re: [PATCH v5 26/54] target/sparc64: Remove tcg_out_movi_s13 case
 from tcg_out_movi_imm32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: 82+ZzBWfBIev

On Mon, 15 May 2023 at 15:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Shuffle the order in tcg_out_movi_int to check s13 first, and
> drop this check from tcg_out_movi_imm32.  This might make the
> sequence for in_prologue larger, but not with worrying about.

"worth"

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
