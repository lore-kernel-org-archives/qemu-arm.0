Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3429EC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 12:57:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd67R-0000Gq-5t; Fri, 26 Jun 2026 08:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd67O-0000GH-VO
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:57:14 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd67N-0000JW-H7
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:57:14 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-662bcc30fafso996142d50.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478632; cv=none;
 d=google.com; s=arc-20260327;
 b=tAs6f75uXuOYeUZMxuicWVtLPH2wPa0q0LrovL4FfE0P+X9yrfaUDTn1+dcbdbhagH
 SKJKqQA6F/RhJlltS1eeq0acRxjqZUBznMJZnVHQGje4xakrwYyAVfBYZOWyyKGsg7yi
 WEhDjfZ9vuDFiN2ouUYmfZ6BpNhjRy087cRjKF7KLZwwokHMsHauzpbCQXf22tttQ97n
 toIIagnG/fZcjsiw6phE657gmLkYeZRIilgwT9hq7jBNldslGx99DZitu+i4c0YNicmx
 lTVZMmMc9ulGUBbk+kbcltDjznFy4Le2KmnO1lklvW8RyMAPcIU+ZgoaQX/qCIwNNRBt
 8xlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tgBnfMwlUMNw7p4i4lOtsIMyHlEjCIC3XfIHvDD4MbM=;
 fh=wVTwaDi5C3jUYV2S1a3QWtE6kTeQDo6dJLfsSt6IJhI=;
 b=jYXJ5mzN6tsF92iXurTbEDkm8b6rDyNFE8c3jfr+qoYR7Wy/wLku08y22ZGuH6D1qC
 PJdC3Jz2+OYalmItFoLnX2J9c626jHBpDExJ1iFIRBEFp9tdz0buI9BdFPXvRUixiL/F
 MWHVi3yfZ/z0I5I4uM7aEezGX9H7aj8cje8WZyPBJ9SCJKCQTBAgkpm0hEvwmFXfumg5
 4LEUjrZe/whH9G2NeSZncXZs5OfXv/iV3lY+BUIL3UE++LNp72odqqsk+JxxGdSsPaOX
 xwwARiZPz2RU8PW0tlWcLeKkgoYOXLs+mErawHS2VMriMQHmn/fy2Hu+kEvgfe8hHyb9
 K6Vg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478632; x=1783083432; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tgBnfMwlUMNw7p4i4lOtsIMyHlEjCIC3XfIHvDD4MbM=;
 b=jKBfvVsQJCa9eYOipwlKgqYMHdz1IGD2mlkmllXOoCFxojp03WMgtpRkQNwn1Arge9
 IKN8Blkq7VudYTVBHATqS8xVkTMoc3WlcwnodAi9D7RuvcgDC7BztUAZXOgBW9UK6az5
 ishwxT9PhrQAxHX9EYl2ITMCPCFHIkhMMBng/TrD9JjqeUi2log+e0W0HXQbOeMc5Wxv
 QoRK9kNjgbp451enDPpMzVnQPB/ja9hJ4g9EVhL1a6PJyLWRAVgHXClRt1oBAGIfK2pg
 jl6DABc/sc/OP/85OdhXH6FKJeZ+Ef8AeRzt3qlEflTMdqUlajDLXfCNMw1Zzk3zYbjO
 6zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478632; x=1783083432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgBnfMwlUMNw7p4i4lOtsIMyHlEjCIC3XfIHvDD4MbM=;
 b=fPgsQFEB3YMQdN/0ASKz0+UojtIxgsqNK4H784Uh2yI+A2/yeLcFvzr1pEoPes2lyh
 emGe0io31SUWJYRxya4+QS2ShLp2uiKl7XEYez58yMDVzkZF1byqg5e2P7ckUeW23/Dj
 n+JRzdzh8v7GCyv+u79uIi8oLC5WEpfqwvDDY6sFrOCrTkskGT192rMWIT1U9jlomKzp
 o9B5Sfoz34+vc6BgR99TCDk0Z1AYubMx/7dy3fOU0scK9wTfled3NbjUvWjkpjXKiC2g
 ziem/W/05cUgyo/FRORU+IjXKfCeSuObVutLn3CSpbhJh5ZREK2xvjFi1Y89fMeXnsT5
 CllQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6ib4EWNs+cHVE71b3zC8NkH9SZsbrT9Ix6plmUu4plESyMaZXZjGg17ap248T094BSjy+XbCX4g==@nongnu.org
X-Gm-Message-State: AOJu0Yz8JqW7cqDpempsWvCrSTgR/0MuoQnOKbLqOS8AVjBHJY/wT2Rk
 qx99SeKnXJnK3w2P0W6fI4Aar+bRmVjU7rjwIVSjilMlBhL0Q4dqWRLgMj70dEqh/sjrPPyFYQF
 0FG3iPhGqEiN6guk9haxL21gyDTQ8klbeQxcwi3RTJA==
X-Gm-Gg: AfdE7cl1rTvi6Gi56va2ToXPZ7KyDwNee3cGKABc5X0Jp1HqtgaeRw8izNC+kojac/W
 3V5CVTtWMVZlexRhQ0cwK8boGc+2higtJEVkEcuqMU+7S4Hf+mt/vIhh7kzDL5hBolt6/FSbHKf
 p9yOmkKuypDk+KEsuqzsPFKae5rp1wbLgCtEy6k7JDx8FQ5/LKFVTSUKqHJoxJwOiYVy90HF0x1
 AJjedmwuNHKHWS4Zvpyz3Hfbjj9in2HLHj5Tnq6fBtVLFZAbdTzzk3mtbfghNJqFlceYH/EhHi0
 MSs9+rZb06JAKcQs4JZ+faPzp6JpeHQfRLGnnlS+Fgi5PU2mT0jNAcz2
X-Received: by 2002:a05:690e:1289:b0:664:94d6:78d with SMTP id
 956f58d0204a3-66494d60a4fmr3877605d50.41.1782478631584; Fri, 26 Jun 2026
 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-5-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:56:59 +0100
X-Gm-Features: AVVi8CeZiHpBtMR5uUEaHWPAPQAjCmN0LsKdoqIxGkp9huh0EyenFBsyDXJ_XAU
Message-ID: <CAFEAcA8yue2nvC_ycgWDnNp90xQFD4esEyccFGNzfXxToHBHxw@mail.gmail.com>
Subject: Re: [PATCH 04/15] target/arm: Implement BFMOP4 (non-widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

