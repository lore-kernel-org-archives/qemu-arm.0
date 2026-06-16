Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C59CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:58:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZW97-00026F-F8; Tue, 16 Jun 2026 11:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZW95-00025M-M4
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:56:11 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZW94-0003jH-7f
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:56:11 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-662b95934dcso933187d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781625369; cv=none;
 d=google.com; s=arc-20240605;
 b=E3lE/bP3j89LibgzQEpd19yFWydP2TVA20LpR9JKxw8l1ia+BgJESfAhDwkm7Z7Kgu
 fjqDGu7LG9t6RAF0ezwJrVPKlUvp/92YLT0MxpbUURBNHtHHxc+DJPO786HURPKMZbgu
 wMz+E0n426Tg5dHvefHg0HRzpvB6lkLXRhmRxjC+0yjmjXdufl8ui+iml7DNf/zriIK2
 P+bUca2z+C6pSwmhBncf4xWKJQbrQR9rrn4jUAbsyADOF6WcQpVwcjJy1t2EGZfgNOy2
 hE9c++uRcKA0oohC3k/VvnHMpOxFulmdRuyqtibUQHzXglEMClT1ex7KEDxlX1Ebrgow
 lDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aLlXLLlZpsJLIJhAoQ1vgzkz1ZtgpX1qYhgNOsL8Bkw=;
 fh=6/x0bjL4+P9wt8jw/OMhCCl0u1wS1El/eE4nqRyro/0=;
 b=HGYFKxyJGJ+UXWfNBQImb0+Ar8+XKrfASiXh1sUJ65QFd1d/d58nbuFJVf74JXoi1n
 Ggdt7CulCz/jRDacgjQWgvmzlXMsxQVtSUhY5a3gC0DK5hGLdQYFPc6/RowUqz03Vm2v
 MtZSqfJqBkWlGnq8U/H05XcyuOhXOjOQxa4165ZL86LLsXZw345tkvGxDb7Jb9PorlxK
 jNmKZ0g/+LkfmnVVu/yaPSeazmR0LsiRdlbKM4E5cV78XpnD/7NdaUnLznsW70vSquj6
 5M2NARt+gJaUZDTp/5K7hpFG+QqbWC8U55LHkhVZVd1dpno2mOg1zQpj3s6q1T6jxO3D
 mEZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781625369; x=1782230169; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aLlXLLlZpsJLIJhAoQ1vgzkz1ZtgpX1qYhgNOsL8Bkw=;
 b=N1J1UxnSPrf1NBUwYxU8x5uo6XsgCigZsaj4z1IKzkpljHSOjAhigO7DEcgqrpW4sP
 Bx8YggbhRFq+M0Fo+DkxR/ShU3GYT+9niofzpKZ5NnEmF9oFf0re+CwUI2aJlq8N/QrZ
 dAk1io38FjUq7VQkA9hPa6Bv3btG3q+7RXi+XcaQqbC8xHoxOaoRAi158d5iq1Q/s3dC
 ZwMmR9FJd1V2ehg/qZ+b3DHGrPMJBOmJ7czUYN12U4U0xsp1wONn4a1rst9LGa4TzSBo
 BDmJtfEVtEW5q72WHcyr78fRXQ1ZweOBwlyfiKadFVsV6IazK8H9kpVNXaloBP+9bY/F
 +PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781625369; x=1782230169;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLlXLLlZpsJLIJhAoQ1vgzkz1ZtgpX1qYhgNOsL8Bkw=;
 b=Y6Wdt93/Em7qCIRjZU+YrbEkHpPtWbP4lClvhLbKZqs+z96BJkmtWbPG9TgavreLqI
 7F0CVrv65/PZyWvv7m6O1ngsMAz+8fyoX5RSXmsRL366TTsLEulruTUQHwZ526o3px2B
 9N9FTslw8tHKubFPem+nwThj0UHZYPfvHOlVC+tVpy17DhDC2QokomqBw6bkRkhcKptt
 xms3OryHi+R9JFSwa+i9c5Dd5EKTtMqZfgZ4iffNxMyPttAdLn7yZZgFyWZ8oCq/Famr
 CjhTY+48SQ6DdF3UJw0Ic/KCIXdlSD19LBctaLGJfYkJQGgJueHav8wAErJm7kJDYQjH
 kqNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LK57BiuK8ThQPTVowk7rwW4tc/Q9dLOVdwLFgvM+CRBgPLYaC8gHBVeubwjE8tMRQFstaKG3LDw==@nongnu.org
X-Gm-Message-State: AOJu0YzeIr2TrQmOJeapsM2XvPUAeQpA5HLm1nd7qbhXDpT8yeN9+xUb
 sCKBvfhOUYykS5jRNeiFIjil+aIyJRc0T5hrpyPQ7kkknrnJqdIkzz9XMZmZZj4zIrqGGkVhKNr
 GWgmXLqhzLxR1RY260meUf5W0zna0nlx9eam09rouyA==
X-Gm-Gg: AfdE7cnWez+QyTXF9mrFUBpYCSj0IJ+4AONlEjkF60zS+lZZgYZFgOeHUXHGHPyZBxS
 y71fR5OSmqk7nNCT/n+V/LR9bnKS0bRQZjwcmuJEsCRX/D5BsFNszXBjTrBKF0IE7N+U4DVVLP1
 uTgR66xHk3+8v66pp0gyIlon6GlSKkyreMptDYnxLNNKNdt59H5assoD/soylo5sEv9upHY6Ln+
 dNSAJCMna0nuWu7VN9X7L2ZeqzQNGAA9HWzfp9rx9Sk6YD4DDsVVg4317am2g+2Azj7dlz7/tz+
 yWLjFmMVd3axeqa4GkVz/GOaJdKZL+TpxqaSifR1D+E6lDrTQIXSm0pL6vhRPcSL8W8=
X-Received: by 2002:a05:690e:144d:b0:650:1cdb:5f57 with SMTP id
 956f58d0204a3-66277f2cb2amr15754178d50.5.1781625368876; Tue, 16 Jun 2026
 08:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 16:55:56 +0100
X-Gm-Features: AVVi8Ce3H6kSUtKwn2x0XdizAtwIacXLa4FYqe-2djmgrrcPXqKyqoxEV6tpLpU
Message-ID: <CAFEAcA8dg3Vyfj7UXgaP1L9Eq3mZS4K+pbwn7wVopC_RDG=E1g@mail.gmail.com>
Subject: Re: [PATCH 00/25] target/arm: Implement FEAT_SVE2p2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 5 Jun 2026 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260603032855.106930-1-richard.henderson@linaro.org
> ("[PATCH v9 00/45] target/arm: Implement FEAT_FP8")
>
> Another batch of code on the way toward FEAT_SME2p2.
>
>
> r~
>
>
> Richard Henderson (25):
>   target/arm: Add feature predicates for SVE2.2 and SME2.2
>   target/arm: Rename sve unary predicated patterns
>   target/arm: Enable zeroing in DO_ZPZ macros in sve_helper.c
>   target/arm: Expand DO_ZPZ in translate-sve.c
>   target/arm: Implement SVE integer unary operations (predicated,
>     zeroing)
>   target/arm: Implement SVE bitwise unary operations (predicated,
>     zeroing)
>   target/arm: Implement SVE reverse within elements (zeroing)
>   target/arm: Implement SVE reverse doublewords (zeroing)
>   target/arm: Implement SVE2 integer unary operations (predicated,
>     zeroing)
>   target/arm: Add data argument to do_frint_mode
>   target/arm: Implement Floating-point round to integral value
>     (predicated, zeroing)
>   target/arm: Implement Floating-point convert (predicated, zeroing)
>   target/arm: Implement Floating-point square root (predicated, zeroing)
>   target/arm: Implement SCVTF, UCVTF (predicated, zeroing)
>   target/arm: Implement FRINT{32,64}{X,Z}
>   target/arm: Enable zeroing in DO_FCVT{N,L}T macros in sve_helper.c
>   target/arm: Implement SVE floating-point convert (top, predicated,
>     zeroing)
>   target/arm: Implement floating-point log and convert to integer
>     (zeroing)

I'm going to apply these first 18 patches (all the zeroing versions
of insns) to target-arm.next as they all were straightforward,
and I have a pullreq nearly ready to go.

thanks
-- PMM

