Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF750C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:29:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojjv-0005Sx-Gz; Tue, 28 Jul 2026 11:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojjt-0005Rj-DD
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:29:05 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojjs-00010t-1M
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:29:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c1c26d7e951so570568166b.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252542; cv=none;
 d=google.com; s=arc-20260327;
 b=rF2u2s2U6K8WJgXUkaKn1WO9uChXDUvM0jfe8auzse0rxmi3v0dcfMiwSEw25CtW/4
 SMX+f3D/oqpodPnsHJnYL86b8wSJgPnCkmOTmd+ZBpy+rXUDlg3Tl9WrBhQGYZ5O87js
 9u6fvSC8QQpNi7Td5VYBIw3s4uBNyv185tUBkk9Oe3UTH7cKIBe/2rH8IoKtC/FgBBWT
 xblaf1kXVy7qG9Iuri5VI/bs0/jVf3ZX8lV+8xPXgtbsrk5j7IqKxpfofuwIRMoz3rwt
 HaxqdvMEYukRikvmjF8vmJGcaKnGnzNTNcg/aUHy+xR7/R8zYJddCiBjLKyKmFtzhMHK
 mr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=44BEQ7ipJxjHOGbfQY/OqdTpMqmmzEr1C3BK7hck/io=;
 fh=nsXkQCGuEehhgiA+Qgn6fK9CMlw/BqEilYoUp5w2+88=;
 b=IGFEqfzI35PPN5xvZfGiE8S+JPj77HP8AiNiTbnh2/E5MaT0FUz5ydUwoy4f8Eg2c8
 r1j2ROGIUMC4jbDXZwAr0+qaG2ohViZYKPwBQuQTQBWHwe30ZK/EIA/6lSvFY+imMkw0
 9M9T6YzHqVJvYYrit+3vCM0MOxhN1g5tDFgDTtwukSUgEr2Tdr8atuunldaalfERqcBy
 /bccerfSnpCyfn+U1PlOTUJyaREnEGf3ztInke4lXHhcfwo4T36EEuXmeSoi29Qq2b9h
 xayhAQlp3jOTw663bPFNUWKwqJxn2imvtTqcGsJjarvue+oTSZVCBiUSb92G/Jxa+poZ
 W6rQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252542; x=1785857342; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=44BEQ7ipJxjHOGbfQY/OqdTpMqmmzEr1C3BK7hck/io=;
 b=e/31b9Xs3OW8rclszzCCYG+cR8OxNelhpcpnLoHC771+OPaZ5erHD5ZfFMni0ZsyiD
 IXwm/RKHfjW57oxiqc5SrZr0ncZ8DJMDtiZyITlDL+y76/5jpR4cDHszqRdjJF65R7J9
 rEcWR0BPY9xcfCgXMkHzVpbC5eW5ar+CtKovqviLuXVEjZ/yv9Nw8e1QoreagnIpb1ag
 rnjKN6N3ZJP702zyxg2IlG9uSWmk/GFl5PeX+6g4N/ZQvvaQsDGecf50caysy4TG+3bz
 MK3Knw/VeQKDLba+ML4IGwRynFprqLupWgnnzEKSbSHETHGu4cDRc4LcNuCQNsoQfi+2
 +Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252542; x=1785857342;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=44BEQ7ipJxjHOGbfQY/OqdTpMqmmzEr1C3BK7hck/io=;
 b=q8Dn4nuZcl9p/zApy7zOxvrtIu9AsAG2alT+Y7tBx9hl8x5q91LqDV8jIyxzOgT3Km
 S42TRfGW3Si9HdP39zF9W3lV4D3glLlMcYJE4vS+zi2ScH/zgliZh5OxiuP3vJB+rz0V
 dDmfLM8CDKDdsvoB23BIRjEKfXNdBdSz7KsWfCAurTaUZusiE6obazIf385ub/YethuA
 R/khIM1RlXQ32xoSu8UpA1e4dk1yMTAOc0bdtaKm8f5nIDJPRx30H5ZC4qFOPG8Jj8R1
 W7p/4dD/ndjfy5D1eEgQdSBOR5RymHc8+PPzhkKRiY30OfJ7iRUmo4k72Pa+TdYfkiJU
 awWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBaRCwBgIbZaqRk4TlwU1Y41Gj0JurOQ+2MmbcWtCf2NGhQFcyvx0RqgkGIZnNpxXn+27UrX6VzA==@nongnu.org
X-Gm-Message-State: AOJu0Yxju8SJ1u4+iS2kRnQsN+qZ+MiP2S7rvh0eOwn639AIqtWN+NS6
 4xQx4Mjn219lhzwByoJh9yG5b1ERvpkyXy9/WWr4Iqe48KcNai6xFfzfgzr1/+X585O0YCTQXC/
 4fMvusgYF2BcTsqD0su4IgSz5DvSLEDJ4yU5Kwt5/cg==
X-Gm-Gg: AR+sD10H5mmihhZyzhtLnP6hw5E+59SNHJGXfdXxJIpzkkj3i9hfrlcf9efBDzbU6li
 GKMi7WRk39dbsCyLW35OHWQPrXxHvUR7mk39weGoO0bOIK35E1gSvcVPseyr2g9VSee3kS4/fW4
 928YXS6m9OAQwQ1JI9RkIxCsEoURxraomyvSgYEPqQgisR5rTrjz60XTmn0IiazLlDdzz2VkWPQ
 lz6EnLoD6Yfht4KgAFcS/Zd/qHM2W2lLtvnz9VILEO6GuN5XNDUKlt1P3v6EzDf4oArmj2Tmt34
 L3O3Vrh4zOIvb9qkscevYLtm7a2TgvGN2zl7gcd4kOMRhw==
X-Received: by 2002:a17:907:fd18:b0:c1c:2c92:fd60 with SMTP id
 a640c23a62f3a-c1f71e94502mr179646866b.13.1785252542179; Tue, 28 Jul 2026
 08:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-8-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:28:49 +0100
X-Gm-Features: AUfX_mwqegspqfC0MnZ8C_mgl9t3rCadnNzjnr-kdN0k6wzK0kD88cpAPcy_-Mg
Message-ID: <CAFEAcA9VWXPC11P3qKHstXOwKXEZf-hvPu7nyxyY78Z5AAyCag@mail.gmail.com>
Subject: Re: [PATCH 07/20] target/arm: Implement SME BFSCALE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 +++++
>  target/arm/tcg/helper-a64-defs.h |  1 +
>  target/arm/tcg/translate-sme.c   |  4 ++++
>  target/arm/tcg/vec_helper64.c    |  1 +
>  target/arm/tcg/sme.decode        | 20 ++++++++++++++++----
>  5 files changed, 27 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

