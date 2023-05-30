Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2198451ejb;
        Tue, 30 May 2023 07:03:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51wX8jKktgKlgG32GRI23c0ZreCorOI52aqv+8A+Kq3AaZnzmYKV9wsykqGUKChxNl4jgN
X-Received: by 2002:a05:620a:8fc3:b0:75b:23a1:40e with SMTP id rj3-20020a05620a8fc300b0075b23a1040emr1809483qkn.36.1685455416862;
        Tue, 30 May 2023 07:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455416; cv=none;
        d=google.com; s=arc-20160816;
        b=KwJAiIweFn9E4GVV9GTy110CNpNhWwvlHmsXsC/vrsaHcjY7xxdQkIOTHoqXxWhf4o
         Je/NYdD6J+usCqlr3DPG3vtV7PPRR/J/ww3EjGdMCijPumIHmWLRNoismbelfSkMa0Sp
         rmTnhzJ8rdwZG14xRE6FZ//UELdl6p0Tq8kp0V9QnQ+WiuiOWCYDsu2ZIcTqtGqjwhT4
         luSkWibUfBp9lljQcRwqjLNRNLBxs7ahNsRMHhC7GmDkEI9qR+BoDThDG65S3rpNwKMk
         LfIpEXC8NWB84qXW4Xz67Vy2OOG0HQKBVAbSEzmW3TisTTRpm9/AYb/XnRO4+3MZHzif
         F9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NUwwM161VYm/K56grPaWw1PvLdJAKiL8DAxI4jLH4GU=;
        b=T4e+GfW4W5g5O41dD7/ZnnUCfHMuvGjEwlEMO6iSf+2UKKqK6rIQjy9OHkYjg6EuUL
         793GO/7De2uJ546YGOntjizjLkJupUueK9yAk98BfozlEdDMzp8RVlp66Tg0SfEjaWUz
         vVwmXfWClWxYpQMtefVMV6zOcM9lsupULOQurqRO6tTMbNZ10YBMjooPHNJ2wXYgD3oa
         MjmJIwMr1lBNliwOlaIyO3KYgTNc2JcrwQVYgVYbVB/1jiGFbSxj8qWCn4TC+AoOK3r5
         762wjw/sAREE5dGsRpOFg39aJc4TWofqqkarYoCdAzJGf3Ylc4JiSstbiCjHH0xgagob
         esmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtaPZFuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05620a140800b0074d0438f7dcsi6522396qkj.450.2023.05.30.07.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 07:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtaPZFuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zwb-0007TV-BW; Tue, 30 May 2023 10:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zwQ-0007PK-1v
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:03:14 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zwN-0004Of-O8
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:03:13 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5149390b20aso5576787a12.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455390; x=1688047390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NUwwM161VYm/K56grPaWw1PvLdJAKiL8DAxI4jLH4GU=;
 b=rtaPZFuBTq6MMMvn/RWs/kU2y0CMxvYWv07RhDdLV16bb9r0fABDcd3sxYq0WbLDmQ
 P2/XBFiI1yxpqHx+KJ1e3ZUbG37GZicjdsp8vEVoqtbfij1fO2tZ2Yavx4K7RusTt6S3
 qWjpBOH+bC8pofrf2flssSXymc+Vnzt1aZ6DJj9aoYUC/t5ETvvWjZKObai0EkpA2pri
 9fMZeOMwDnZi7wTyvfwO/ICEoMlV0+vCHp5Ns7T/8kTDc/hikE+kgQSbmF4gq6XgyHpr
 mjopLOQRFxMru/1xWLFMSCVt6B5mSz69H/tpmNEoveXCF94RiKB3z0jZqbDbcWUfDzGn
 6bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455390; x=1688047390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUwwM161VYm/K56grPaWw1PvLdJAKiL8DAxI4jLH4GU=;
 b=IcombfkOYLJ2p+idiJPqG/ZtuA5lTjbC4ptXu7Xrhv9+AF1yh5+HHQLs1H980nEWEY
 rlY9JMCqBPKt7VKvExGBTu2CVcRGAYruxsA9yqDSzMP/lDvpfZDjGdnv8g7jlfq3v0R9
 F8c+bJRUYe6LD/OOL8FbBL/iAUKmFc1yB20ePK2QT0Qx+Ca8N4FmLlucW2ZnoC1ni4Rn
 QB4mbRk5JSOHhqXQifDtPmqwy2GzQpG7/iELxw5bmkEw2GWQkCapTf7n+NnhgVA+YY+s
 rlc+CHEpWESQiNCLNqUDjsii+x+fG+Nrwa1sV2oJDpC9P/bBNCUB4xGT3wCZgErRFI2H
 RRtQ==
X-Gm-Message-State: AC+VfDy6fDnVLleg3rQLxwIcZC7wIIunW2JSzNwFQetSUedMnH21ooU2
 eSkZ2DSUBgusRhATaDqZCkdIad52i113a3qVeU0i92nmS9DDEI1G
X-Received: by 2002:aa7:d657:0:b0:514:987c:b028 with SMTP id
 v23-20020aa7d657000000b00514987cb028mr1503490edr.18.1685455390135; Tue, 30
 May 2023 07:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-16-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 15:02:59 +0100
Message-ID: <CAFEAcA8H9N9RHh2SmwpZ4JE_c0U9oriJngn8AZBYJ6wMw0BZsg@mail.gmail.com>
Subject: Re: [PATCH v4 15/16] accel/tcg: Add aarch64 lse2
 load_atom_extract_al16_or_al8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: fmkGtcnc4Nyo

On Fri, 26 May 2023 at 01:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .../aarch64/host/load-extract-al16-al8.h      | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 host/include/aarch64/host/load-extract-al16-al8.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
