Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3802564lfy;
        Tue, 18 Aug 2020 05:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdGoWThy0DzdZ0Oun6mtxPkq2XjhSpNGL+JIsDGpYzQAtGM5vOFdwl+f4vJkTRAV7o5x6G
X-Received: by 2002:a5b:c08:: with SMTP id f8mr25464684ybq.198.1597755396567;
        Tue, 18 Aug 2020 05:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597755396; cv=none;
        d=google.com; s=arc-20160816;
        b=q9HpTFE70G+h9e0Z2r3sXx8R36nt5uTYQSIIhEdf2EC4XrGFNZWmR5REbVXZM0lyHx
         ao7QJJjidYHJzlJx5csvakjyJtSltfzS1WOo1s9eBr313nSSzdO3oYsWZuRYuC+x+XWE
         i+MN7y8Zxw8t5H9JT2Q6gwjcGoK0dp7r5eYVFrbKeIyg5Zasgvm6Ku2SD9JVGpSJFpKo
         N0Rv/WnG39uaeyYDPR+u0vqG74puAQIlf3ljMpf6vkcs5d16tSQER4XDa/Saf0ixMtoI
         YdPvivvPOKs/oN0XFTptLThVj1yIivaCTsEMWwbtDzj8XiMjBf3Tm9FIQ4YLgnG6E03W
         rWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VugmIqyYnzV7gtTNsugim7hiYCBte0R3FUvATxyfkIc=;
        b=oSufw21j3lVkZPDVmuXOfY4E6Buku9+PfT0rlWMH9veHSiAQE2X0Rk3vZtYb2mLHYP
         mN/tNafmQNuvyy5VssE78foQCUzIPknkMhLXxJj5dsp3mEblwqYzg/RBkbmi/VrhiQgL
         f0CQIVQGg8puah19VSS4ndxArjaMEzrp7hhS/tMMnH58OZEgh+FM4NMGsdwNEWnR7k1/
         S0KWbIlhFuogIpZyYaFKKKZxEO0H67wlEYu2Q8mZ3FxvvnpmE4F5PtafTQUNzWAesNBy
         CbXHiy0MbodPhJ42m2JayY8lkHl/6RnRHj4yqwOUxaHrkN9yCghDcXedd+g0V/S6AVQO
         yRnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEaSzhra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si20824520ybl.274.2020.08.18.05.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 05:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEaSzhra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k81AJ-0002fZ-Vh
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 08:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k819r-0002GQ-Fx
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 08:56:07 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k819n-0006Ip-Tf
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 08:56:07 -0400
Received: by mail-ej1-x631.google.com with SMTP id a26so21949900ejc.2
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2020 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VugmIqyYnzV7gtTNsugim7hiYCBte0R3FUvATxyfkIc=;
 b=jEaSzhradDViszHwJIJ3ShHNa1dmuoGh/EkdPL2IoeTuwRU96ThFM1F2zsltTpBR3T
 fbM6I9Mh8AgAInLgnWtoIVy+qphEof3NK6VqqQnaciOesGN3cjnbxWrMM5zURqicqZPU
 FfDVP+bp2t9iRBiHFIJm9tIKdW/TTJy8b6dXErJdewirNHCqXBWcvuhQeyGG9+IapcAm
 OEXBz8tKcXRI90sg2tPrsY7Wl/OwpfqReLesqidrosJAMZbAPmkrLSCF0bDiHZqeGVUV
 CWFxpja//ri2ZqiU1x5h2bvEqkON2O+Hat9jKAWsj6mzCMGj2Mo+vXjOco0SaPpOZjUc
 sYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VugmIqyYnzV7gtTNsugim7hiYCBte0R3FUvATxyfkIc=;
 b=c3YAh+iN8Cazld+fP3fxHWs6BKD6tq13Hq6ISnz8RLEnTWKRoAlisr3OWLyx8ycEoG
 D5AtlEVsp3Az7mqsgc8pyIcz0iS+H9nTXIq36s+7AGDQ7eaDrTAi9BXBLpYIQO4fiIWo
 frA76DbhLRgbcPd71phZJPmjVurW6P5uQABgARlLQj5qdT9IfzpWO9Hl6S0R6Jrz1ypz
 24NqXx5HvpcrA+57d/dZHuqLjgsQZAaEF1M0sgofQClaLHiWU0cVdy23CKl9jxJqR6rG
 XdUld0ilwNedsJ9JDgz18jXuHvAFpY/dQw4p/+09qrJxsVNKoM2Ztar/oM64gjP6ZR7e
 DLmw==
X-Gm-Message-State: AOAM530FLJ5YVnJX+bS97GPNxJ8Vrns7x1AGkPdfvARlPtKRpBhE7RCj
 ADmKE0+ez01vIjc11YK7lFRsLZXK/w0Jz1HUDXxQWQ==
X-Received: by 2002:a17:906:7fc9:: with SMTP id
 r9mr19439130ejs.407.1597755360841; 
 Tue, 18 Aug 2020 05:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
In-Reply-To: <1995755327.3077884.1597670507808@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Aug 2020 13:55:49 +0100
Message-ID: <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u8ZBrvOGIhb+

On Mon, 17 Aug 2020 at 14:22, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
>
> Hello Guys,
>
> Currently trying to run some code that uses FPU instructions.
> Arm-CortexM4F core.
>
> Using the stelaris board with M3 core, but param M4.
>
> qemu-system-arm -M lm3s811evb -cpu cortex-m4 -m 8K -nographic -kernel notmain.bin
>
> How can I use the FPU in QEMU?

Try using a machine type that uses the Cortex-M4, like
the netduinoplus2. Usually it's a bad idea for arm boards
to try to specify a different CPU than the one they default
to.

thanks
-- PMM
