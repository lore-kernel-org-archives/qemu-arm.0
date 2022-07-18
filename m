Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1253298lfp;
        Mon, 18 Jul 2022 04:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ucPxT94fen//+0L0/CJyIAgigCGfioYhqxMHVftmiwQ8vG3+yrbzWGCA82wve+q7yeQzoS
X-Received: by 2002:a05:6214:da5:b0:472:f95e:3efa with SMTP id h5-20020a0562140da500b00472f95e3efamr20364857qvh.91.1658144746790;
        Mon, 18 Jul 2022 04:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658144746; cv=none;
        d=google.com; s=arc-20160816;
        b=pAW+8rrZSKcW3OnnjvX9wBM8UJVlSxmi87C4ZszgAek8vVovfwceRrGM7BIR3fybiD
         Nidv5+iG6ZICQiLdWqYG8VbXJb29AOI7S/auhTI8toxaZxfgDbo77tl7OOfK2b2l//kc
         Nw8mprdM7eqwXxG3VhpeBc159N38fG5veeB3wY3/JgJZmK+w2NKbMFnJlq6dhB/kmSyW
         vGNd/lgBY1OVO7MBEVs+Lt6Z2nQXHcmFWqXQYSNBon0WIZ3APHd65RRTop0Uiy0Q7yj4
         lS7hJuWyvCLZyAT2tk7HUTnLPIrHKYZopCvgT42OQ6GS1Di8UHbzs1Z1wNgEXfASsQtl
         3WSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/HedIyWCAWaVet9/kjbLGjwZonFcp7lcVAE0T3lgkC4=;
        b=k/1r8Hk3+O1uw2lmFLEzmSJQWc7jMXTQatRMOHw2YUj7a25A+dYlAWi73EDQiJbqxp
         R5Nh/7NgHOFpB6BqR3uJqMXkdeOV98KfpL6qoeD5HKqdK2UW7VZy+vtAiJyvId1phav+
         54OROT+eliBuVzZFS+hGySXKpGFzJ/t+9tIecK5H78JEGor8JqQ5+XKKVMMooLn/vEqD
         0cFUumCp4p+nH1KlPlpwZqKtCwQnbS1qtLhk2u0xg9HdWa5zTh+0qCtL3VECp0d8nKrh
         ShQ2gcTh8nvQ+sQQOBuD6XOUMcszZKbK4fD0d5IBl5W+hjDn/Ebw3wVsel6KzocXAnat
         XzQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5rU9RBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a05621420ac00b0047339643063si5474685qvd.174.2022.07.18.04.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 04:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5rU9RBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPC6-0004sI-AG
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 07:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPBV-0004pT-3i
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:45:09 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:45941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPBS-0004N4-Qa
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:45:07 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31bf3656517so103452127b3.12
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/HedIyWCAWaVet9/kjbLGjwZonFcp7lcVAE0T3lgkC4=;
 b=H5rU9RBgH2mY6eCgu0WKWXwztGTRNceMO5FommH7jnkIONSwPp/v+Kp3TCeFhC8BQ4
 AvGTjwRwnHX3WXimipPlBS0q0UB/8+2wS5QQO1TiPtU5Qfd6ZJgkz0Xxpe6Z417dyMTj
 60dAo7/gOOnicYSALMd6s3T6uQoM/yxBuBWXENkhpMIj2lGcriK1fMSmZf4nmqSRbqBA
 bF0A4BuzubyKU+JEKpqAUCrfZRUVmpLgGHf6VjbQny/pYXWrV1l4y6VCj8yUxUsmdTyp
 ienx6Zb0Y+bGi4NV5fCtJLo75Zv2e5smPBRAtOkppq/XoDLjVb7DgA4Aop+5KnRE5CYi
 wgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/HedIyWCAWaVet9/kjbLGjwZonFcp7lcVAE0T3lgkC4=;
 b=NFDZVmdsnV8SxGIjyHVHG0slYBX1/RK9To++wbAwh87q754/YT/1+w2sbg7/wE6yBf
 NVuVO8pg6I4N3p9+lte3v83VMZDv12hQ/KPDI4ONbOmnBs2Ve7Z3uodMrZQY1coE7uIs
 k/pT+ji+YNIyJtG2ugvPMp4ZMHczxTIxyGdMvi8L4VkWZ6g42Ui8Z3Ftqb1ySyQUy0A+
 NFgXxSMji1v/leTyhDFo84ruxOj8zvanF5nPgTOjSRbN/eTI/hzHvMKADTIcVW/21EVq
 SKzjiB2zRHbIJgre8xbHzGXyq6SAYzDf5m0fcfb7dn6seVLmcV5AzUWlxJsKOYmIU1f7
 rx2A==
X-Gm-Message-State: AJIora98WHkHlxhvXuj20ig9x8wOU6e3vB+EdQ0gmrhalAPFjfHic14D
 oInpEFKX7ijlM3s5Aj1dfrQ1EbiOl7d9AubR5AtnPQ==
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr29659900ywc.64.1658144704958; Mon, 18
 Jul 2022 04:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-22-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:44:51 +0100
Message-ID: <CAFEAcA9AsAJvmD-E4gAFWsoSufN4r3o53hfj_7fLdop-dRGyvw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 21/29] aarch64: Use arch_init to configure sve
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pvgi2tZ5eFGB

On Fri, 8 Jul 2022 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust some of the aarch64 code to look at the reginfo struct
> instead of looking at test_sve, so that we do not need to pass
> the --test-sve option in order to dump sve trace files.
>
> Diagnose EINVAL as either cpu or kernel does not support SVE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
