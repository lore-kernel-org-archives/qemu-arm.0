Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF0C5CFCF
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:27:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjhE-0008Kk-P7; Tue, 11 Aug 2026 06:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjhE-0008KT-5S
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:27:00 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjhB-0005H8-9D
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:26:59 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-81f36179dd5so37943607b3.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786444016; cv=none;
 d=google.com; s=arc-20260327;
 b=Hz1ukzSPAt4dgLgSoFDY1pkZXcWBFTKnVr5JJ0ClXARKN42atrN8tfneeZ98aYS1+b
 2F38a6oZfRmHE/7PuhLkpG1UOw25EmuKqsKyM/W/0su4Wr1RhKXOSlrGPIr/SmCLciBN
 OCEnoCAJ8F9wvVyxWAkWD3XRM8KkLgifplmbcnGGrAhJLwvmFAao97BWf8ogkQca1W6t
 BceFXyL/1q3PAMGiadzURZog9B2XgJ46Ew0ftTWqFW4M8f6oOPMlmUtBMXwWDUSFF9Uj
 g2QaY4T+wI6UVjsXQREl+2KyzfGVuX8sMqgmzFw7vDlU+Kz0rpbdEghqB0OP3+GGYq99
 hb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MRFbei7m/qQ8e1JmNSTblYVdLlTHfqLhhdqnJg95cyA=;
 fh=H+s9EAYGXTOR3EigvTq4UG7lhZk57hJo6ALnEHM9iO0=;
 b=mHRqdpQCqPutvRAHVtc+/c6SMFdcEgxit3jeMYFMyqryOOLGshuvFN7fdLLDZc7BSe
 ofPlCyEQ222CS4pbCX/8zONmRhcFozYiq4f+5W1lTKjcyM38GjhLWrtFCOowP4qvJUIe
 qjWBZOiODgxeMVUO0+p0jMaVjjkAEYFqECgL6deajq/Hc7gY7oEOKuxYu7b4pkZH56Km
 shPjxneCqZ8/WvVgFncsmtBWn4LQ7LKTU4KfPmw35bHX5/VAWxpsZXenLGdTMQc3eS0K
 iVhvUL+evX6RVjkSkOp0nOiYapqk46JUKqa6Ot1lU70fIy5j+D58InpP+1uecxuEx+Sh
 1S1g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786444016; x=1787048816; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MRFbei7m/qQ8e1JmNSTblYVdLlTHfqLhhdqnJg95cyA=;
 b=PhOHyzqStaBDQHr2m0c+WpmG6vt2kta14SI3mehCF5O5gBZTKXuFNN3CBVSEh6h5F+
 yRO0JITpbSL8fWqo7ZjKp6I8zl6TiaZqfjs/wVM2gb6deVVi6QH6xhNlkFfbxdyE8JhZ
 QZt+0G1IFnj1qOs87w81s6TUnC/gvg//Cnlz1Dujnr0UPZg7SIvXK01+wJZAf9WTHKm5
 ZOEAgMnCYg5JkYiDx+IvZcMvNTpGUp6LtHil5Iji1JnOjYqFSkVKCBDkOARZv6diVhKU
 dq5skoe2xtOfcjrG4LZccPnjMz9jpkwg2aB1hmgDVD8KlPlTXh5m7dZ8GldFmeQJaquw
 3lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786444016; x=1787048816;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MRFbei7m/qQ8e1JmNSTblYVdLlTHfqLhhdqnJg95cyA=;
 b=fUHgNl/8Wo6hOdvBwKbAIBdhZgmZRIfKwxhRGaT2AyO4f4MGBG+eFLNMLL847CI5Eb
 uu5IapznwaJS7XR7Zur6CV7XrvKjgt2hQQdqOzhivjo8JsuqAGF/miQBidcB06bTswJo
 9Htd1cknO1fhlV12bSGK9s+RH0WQ6/Q50qSmTR28LUlzgd8XU8AM9smu2b8ACLRfNo0Z
 THw8J/aU0U3cnPpFURsJq0PsX9cJPzhINfEL9BY1J7iyYuE4ViVHX415A+WN98/+hVdc
 XBurV9b2rpJoldxJz9vubr46G9g3gNqRnhvrKC+FxB3XlvhwFw2nmvG17U018mqzibcv
 4EcA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8pFwmBQgzQEnXefgaNCQLXsSYH6sZrJex8XisMdkzBf04JRCiKmgiGslTK7hS7EyamhFYnsRAwQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywxt5U3SOybONLf8rmFwSewiWlwBWY4RQUrBtFlYTaxebgU5l1F
 rx0Rwq6+mM/viKJla9NnuOMgZ9Tw4yqfrG+2jZ2P+h3CtU9kk9EjXM1NLmGmbMhs/4BQrOkZplN
 mlScG3d4dlxE77zDw89XlDaazOzqksPkvov98AiLGZ7da9hypDiwN
X-Gm-Gg: AR+sD10+Jh7zhUGdPZTJTXv59IKqGamF/gzzEfC2D8dXg68klIVcl+xuHRpOuToU7jA
 PERv5HPnziatWuVlIVPozAJfUBxujib6Av2ANegXZXCax4pvvgR0D5M/YuHR6mLgWpG6n0HPWPb
 /VzPOhn2cqcjugI8RIBNLKSGRjZb2g0aV3EsS1ZOYgZe0N/Eym10KyYpJF3TF6zLRaZHCk1tJMm
 76wudsew+ezxtHJ/opXqavjEt316Eu6eTRlvVS4P7G9ZTdHikJaKFDoq/oHP031jx5Y4fOg+o+7
 +ATagCbMzCWKiyPDsEBqJ9SXQUHSWuzGYu94Ck3ns6/Yg6T2cLV1GKshPEb6Iti3+4CfF8HjIrg
 t3AxJC4VQUj88RAy09A777sf2wgiM
X-Received: by 2002:a05:690c:4b84:b0:7ff:87e1:34d1 with SMTP id
 00721157ae682-82f28509434mr15506517b3.11.1786444015917; Tue, 11 Aug 2026
 03:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260805191257.11303-1-simonxhy0404@gmail.com>
In-Reply-To: <20260805191257.11303-1-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:26:43 +0100
X-Gm-Features: AUfX_mxLaRxphh-pdFb889BaWYhIfAe0SPAcC2rtByfNXOu7sk4-ioALh8rRgDU
Message-ID: <CAFEAcA8Eff_HTpOxjkFBG4DQgss86zQbHvYQncVnuyBvkAFSyQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/arm: bugfixes for Arm SSE-300 and AN547 models
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Wed, 5 Aug 2026 at 20:12, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> This patch series fixes bugs found in another patch series and more:
>         SSE-300 SLOWCLK Secure Watchdog address was in non-secure region
>         SSE-300 PPU addresses were copied from SSE-200 and not correct
>         AN547 MPC ports were not correct
>         AN547 was missing the DMA ports on AHB PPC EXP1
>
> https://patchew.org/QEMU/20260723233605.805-1-simonxhy0404@gmail.com/
>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

Thanks for putting these fixes together -- I've applied them
to target-arm.next, ready for when the tree reopens after the
11.1 release.

-- PMM

