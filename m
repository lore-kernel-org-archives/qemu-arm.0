Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6D3CD4851
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 08:47:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNRiS-0003eX-6O; Thu, 14 May 2026 04:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNRiR-0003eH-By
 for qemu-arm@nongnu.org; Thu, 14 May 2026 04:46:47 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNRiP-0003No-7a
 for qemu-arm@nongnu.org; Thu, 14 May 2026 04:46:46 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-65c7492a2ceso7891589d50.3
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 01:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778748403; cv=none;
 d=google.com; s=arc-20240605;
 b=GrrQ6DwvZ2wqB/uPx8YuP2rhuBgSIUfhcIHpQzW8WbBNi8LkqdSKREuMW9S9gkD8cO
 fQV+9TAEojagjthN5FAYc8RjLt3h8pikqBnDv1e9yr1P54hqp4XUsNYB2sz+nnvT4Kkl
 J82ynYfG+RJX5KuLpVkUokBY+GWASd28sXXv1DV3I2kQHWDeG+6LN0I13z1zHa7ifRyI
 bZMDpIOCfA01Mn+qXV5K/4AQ3HWwzpQDu6FmuJ3XocQfD8aeI296iimZC5drygbLlfRJ
 0MDzMoZofYu+30lhDCLIQXp7PmmdL8bBIgMzQCb+NkHisnBmSmOTNhbOpEQS6hn4b0nU
 Na4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dftl21yUAP7hPMheGT+EubcO9CmIRUfK/VK3XSaFBZM=;
 fh=6IhFuCkqn7j3rbfH8MejwibDD/85L1nHQF9HDCpZWDc=;
 b=Utc2pN1WlxP2AAVStgA3apNArYQdKd26mVpWzMFJNl7arbp6WexFNIt1otnNta/8mv
 hYMt0RMk4N0z+PB5qOdLEmFMbK6zhuc9U9Ce7+8wnPApZv/BFCj3Pm5/lCllKsCMcs3q
 /S/nFmrIol2AHxkI+tmT8O/MU9b3fWtiskMKNuh1Ph0a0RpyCLHu7nE6iF7464cvnxKz
 Zf6StzakbCnzzSWcibrU4qklpD2g1BU7opZbS2OJ26bbNgA5mYmk040slh8l1c5DH0uR
 ZG1bEZJLqaegLeUcpA7GtkHfVzB3HzLMrpUJuHKMiw/1Mrjg7r3TURfjJM7x1RNbaCtQ
 07xg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778748403; x=1779353203; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dftl21yUAP7hPMheGT+EubcO9CmIRUfK/VK3XSaFBZM=;
 b=PkLKK5/Mvt3SBHFa8oJb1KMyWRTF8VfWkXX7W9dbMbB/kHFFMSL8SarrrzqwDcsfxD
 2+yF6JtopRUnT0/9G0pWlRqtLDbYhox078AgBZ29DdoV3z8pf2Pm0jTFvYL6UV7lbOoS
 30f7zAtwz4vbKBYz0JkndVjJP7fC8T9+dRbmIY/UTInBiZxTrsCGyScRBXX2St0gvrUa
 1c9hKSVRgtj88+rKpRZBjWN+uTbtFiUNeXM4x1fp81eO28eKZUXt/sTZJ2AMJEE5JYbL
 5CthTLi5bT5LfknYFD1P5RDOuTXz0M8Bhq5uzm8P+5F1XWHKUrTCAo+UUsf4clM0dW2B
 y8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778748403; x=1779353203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dftl21yUAP7hPMheGT+EubcO9CmIRUfK/VK3XSaFBZM=;
 b=tRAU740zbhYqPU9pHPVZoaq8OTrM88JlK11e9TdxYGki39Gp6lpzXnjPW/W6eQfhG8
 Rmpcht+ZK9q+HIi5Wz3MKTUJsBd9yvMyF1ty9jN0OPpyGTRslTtRxsFg82nRjhR9W541
 3OVLNw5ZmqtSnAEyY1vQrgDG+5Gv2TYT8uW31A9UheBrysNW1DySFjqGfyT9++G6UJAh
 Op5/shh4rHLBpy9DCqQSIquiCqq245HAm9aD7nMBgl1sSJQCvbA1JgwTnY3qSmOSHjKe
 ThAqEUPaEJY2evmzdTd+Z1WQn59n4Zdv6CtTejgdwfOX/alLhVnCRtm1XwA1Bkf0j5IR
 eyVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YAmOY2KY74U7oY71SYHnyk9slLA1iVkOUZdO4ewgqVCDcqrFAJjgfKcJPLbZogqkUwUgyujiImQ==@nongnu.org
X-Gm-Message-State: AOJu0YywgDJJl3/X/5ZiqzMEE98+43CMvn6Qc35cJMnVhK4FbFHahaL2
 nQ6SawXKfc6gQu4lisH5oy9tEyfo8aD465TmV9V86dWGhlGUem12UXdx5j1UkdqRDg6ZZGM5/+y
 4xiiEnmlHCyRumtTZKVl2/bed3+JThsje13LtDJjvpj1AOhb5NajTKNQ=
X-Gm-Gg: Acq92OEGKpmTcVcunQRGAHeuBs3fjDSVh/T841EK/J7hojWaE9JBPjqhMntieM6qlz1
 1aUsmKKEEw2+B36of+niqP959zSqOMsi5VRhPxUM6AHbsKjjOFs057n+0XYw6YzZjxWxXphELOw
 L38qxOgFprZ/jSCYfY950JqTcCyoVnmoX2GBaeSd9aPhlMrPVSqL7EsMmpMza+rJGMmQHd92zhr
 x1fKp0ANs/7WsZULhtKZi91bH7vz39+Q/SvXdcLYI2jJeNbTlm70WXUHRCOrfPlNYkD1ex4pm9o
 0+IAMq/vcC3/u+JeUj+hLuzeyo4pbYD9gGf5GYRLvsOGCP6W59jg8CawbUJ2JThAg+Y=
X-Received: by 2002:a53:c049:0:10b0:65c:2ac8:ec3a with SMTP id
 956f58d0204a3-65df81a4d96mr4701522d50.21.1778748403305; Thu, 14 May 2026
 01:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260507234413.643512-1-richard.henderson@linaro.org>
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2026 09:46:32 +0100
X-Gm-Features: AVHnY4Js3Q0yxjg0LoLohc5y5RBsird6dQndANKG3al6XsvfIuXDVLxblLa-3II
Message-ID: <CAFEAcA8oCde3+2gvLL4vvgu_MiUjvic_nbLweO1WF+nkNuzgtQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/60] target/arm: Implement FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Fri, 8 May 2026 at 00:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260507160959.449170-1-richard.henderson@linaro.org
> ("[PATCH v3 00/11] fpu: Export some internals for targets")
>
> Changes for v4:
>   - TF-A firmware update for FEAT_FPMR
>   - Rewrite decode/encode of FP8 data types
>   - Rewrite FEAT_FP8FMA helpers
>   - Enable FEAT_FP8DOT{4,2}
>   - Enable FEAT_FP8F{32,16}MM
>
> This completes the set of 8-bit floating point features.

Do you have a git branch with a rebased version of these patches? I
had a look at them, but as well as some mostly trivial rebase issues
on current head-of-git I found that it doesn't compile, because
this series wants fpu/ to export a parts64_scalbn() that returns
a value, but the version of that function in fpu/ is static and
returns void. Did some patch for fpu/ get lost ?

thanks
-- PMM

