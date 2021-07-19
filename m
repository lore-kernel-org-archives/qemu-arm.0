Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3819815lfc;
        Mon, 19 Jul 2021 05:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycHToIw5rUzPQ9AjTKoOnEmj+3LEr948yE8n0GSkys1GJVo3+QwvuvxNwb4ppQKjCARoBm
X-Received: by 2002:a25:b9c3:: with SMTP id y3mr31098688ybj.10.1626699472000;
        Mon, 19 Jul 2021 05:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626699471; cv=none;
        d=google.com; s=arc-20160816;
        b=C1cY1b5IgFlI6xWgE3cAtmfLY4LlZUIfsHoIBGOhBgXqQqistEcF5EezFK4vj0UnNX
         ftd4z1xzD6zXvlbSOCttZDKc54WA7pzkIemC+nFQG7d02a6KEApqYBsvI40eQ54heG9W
         GhMZJCYsd3UU3scym7pIG0D6aZCLfx0auCLKa4gXr4YgWKk1viJ9MA8bLmGbM61GZsD0
         Fx5aDF+QhDiNEayiAnC3pd3t9FqpqstRxJ2mjDQPHScXUCTUUfZ3wiXmFVQn5hn2IC+l
         TE1KjSKEWMM8khlPHsXRL2YpRF1TvZPnK8fm5lA0LZUO2XhI1ihtLZDc0dJp8MkaDhMk
         YEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5HQknEjTIN1tSqJiCVeSfVqHdr7Ga/K4X1FOAufQKm0=;
        b=tb1BK6FtJ2joX+5l3hIv5p29WuXbK2AoVIlqY468roJ3q3Lr1sgA5lXUQYDjtFvo4B
         3xaBCJ8ux1rtQJBKj+MTsJIQim/JotZuiYhZsg7SI9MCGPoDX8qbE6y/GeKXr6jbpuGp
         EUXt2uUw2epGm+ZzlG4WgbAcb3PLxGCEW/HD18n03X/Sz7174CVz5bAmsvvzTgNYb7nU
         zBna4rG5lEQUU7e8WDXPgrELp29ahG0xVsMJnsOdiedh0zUqLyOIN/n5Ylq0m5Z/ieT9
         rjHQCfNO2dSjfHWRqF9yOC86ubwdw0xvIgzNVdQX4iE10LqA6WbsfKET7ctv1s2L9gHw
         QQOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PD/My/wS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si22193957ybt.50.2021.07.19.05.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 05:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PD/My/wS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5SqF-00048J-EJ
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 08:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Spy-000468-PM
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:57:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sps-00071e-PU
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:57:34 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ga14so28530807ejc.6
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HQknEjTIN1tSqJiCVeSfVqHdr7Ga/K4X1FOAufQKm0=;
 b=PD/My/wSYjUiBtw2f4y+ovfpqNiHHymU0Esi51lJy/BcFCpnOdOn1q/sq6gcS0jGaq
 M16+nlWxjiDscRud6rSzJSRG3GsDsmjuwpvheXafTNP0G1sRM+5+W/DZcnpNURWaGQlS
 cePVTmMzJn1gG3FUcweqZrhhmHU5+WeOwQHfhRSc6xdYcgGF7Pvxcu4j54UBnjZC9PId
 gYDYsoPWel1xgQdlFbaGY55TTZXctcVwYyszV4DGpA4cP0LdANYkPAmGbijBwumEYdOU
 nAiBfbalYjwoJZ1Z4udxAYO1AfYL28uFROKE1tn2wVIsA8Ys8tnbLWhoPJ3MFZ3t6w/u
 kFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HQknEjTIN1tSqJiCVeSfVqHdr7Ga/K4X1FOAufQKm0=;
 b=KzVDc8zGQqiWdhYubTWoAlXeYXh4h+yShsBO/zj5z9ZnGoJ4wUeK7Ty8+ITUSPxv/d
 MEWS05DiQwMu+VjTqKjUZRNxV+7DWLYSgZBZwHYg9EEsk7SsbI7PfcvvoylZQJOlCxWh
 xYsgqcuVONXqGvArzbf5HHUoAQfIOK9JigTJBc9ZDT+OmIXwzgmXC+ty/Ml0gek9h7jC
 +o3vA9Xk1nM7QpedQX1XulVOCoWw4Wk6GtmgB0Quni2sqgd36WySeMpkaID0hxNIrTRi
 ZE3JkYh9Opq923bmEMmuF8ZOjUwVvoOxrdv2kAkwud7Ekx39Lh+EgkFix5rnmFUIVPM6
 7zAA==
X-Gm-Message-State: AOAM533jXFTkl1fK2bjkBKEofSSciOd9W5uoaX9e/HX/DbIEFM6Kh5yQ
 sXi9Ru9GdPtZckuGvo4L2bCICmWdf11K5UmdnYpuBg==
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr20488836eja.85.1626699447508; 
 Mon, 19 Jul 2021 05:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-4-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-4-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:56:46 +0100
Message-ID: <CAFEAcA_GX7u4TxS8ha8s0utO=b4c5FcUvucJkChH8oZnhJ3Bxg@mail.gmail.com>
Subject: Re: [PATCH 3/4] tests/arm-cpu-features: Add A64FX processor related
 tests
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jH+4sTJuRfLs

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  tests/qtest/arm-cpu-features.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85..979c6f8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -472,6 +472,9 @@ static void test_query_cpu_model_expansion(const void *data)
>          assert_has_feature_enabled(qts, "max", "sve128");
>          assert_has_feature_enabled(qts, "cortex-a57", "pmu");
>          assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
> +        assert_has_feature_enabled(qts, "a64fx", "pmu");
> +        assert_has_feature_enabled(qts, "a64fx", "aarch64");
> +        assert_has_feature_enabled(qts, "a64fx", "sve");
>
>          sve_tests_default(qts, "max");
>          pauth_tests_default(qts, "max");
> --
> 1.8.3.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
