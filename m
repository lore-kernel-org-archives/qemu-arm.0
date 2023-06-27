Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1436562ejx;
        Tue, 27 Jun 2023 06:37:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4uRt+LD2X330m/NQF+wtDHwLuS1ysnqO9+Ia3y0m1YwrSt0Q7zKn7sUafDD/pn4UfJP9Hc
X-Received: by 2002:a5d:456c:0:b0:313:ff19:30c8 with SMTP id a12-20020a5d456c000000b00313ff1930c8mr1870022wrc.50.1687873075135;
        Tue, 27 Jun 2023 06:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687873075; cv=none;
        d=google.com; s=arc-20160816;
        b=gm9Sy8MtNoXfpK7eQlOVQd/3hz26xH1oxjJjUDQyAxBY5lbu83Ae3PJHGl4eBYj4eZ
         uJZ/9bk85ld1FXcYQZSNhggNF3kq92MD4vC8y/IgCaRN3h0nOGdDIlPgcQfEO9VbUHuK
         vP3DLlvLIlmQac6t5pzjo+QVPuV1F4tS6kc3MHqwHLScRFVCSXfjDoGpIiMfZpNZgMmo
         5dHtXq6WzIFPyUaw65c9cc/qeUBg44z2Bn0Favr4f+WXSrztTl+J7RQbvQUq/QwM4bLs
         F1WUmXUR+ScrgI8wvOf0dofIdaPfhZ1C3WOefY9lzouR6S3XviKrP3lgpkHS2HZ8PFvD
         dpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6Frfgu818BLRmW8RT5iuIKBeCMX5Yf0wtXOq08nvf70=;
        fh=oMA5r/9sLN71+E6gM+hD1dlCNT0StpPMLqUdYOw5oq4=;
        b=vMB8jtJfAyPfT4Xq6YecalPgiByZsuCEphj/LTv8pHvudbeZHcMc33gtnlbB08TQ3I
         P5JZEJXtr54m8phtJEGGt2zmRyUD2UZ19Ut71NUWQ880EUOTr47E/ypQYpoUCnkFqsRE
         qpLjFQIsCtdghlGTcIw4OIMjIIFpTAwtnEQjU7vPkY6jRFzDMX1mkVb5ok+jgi7ZI3HG
         f0QJ4rGNGVzy1YIJALp38Djp/3jJR2C7l422ZmeF49XgcPWaGlrcmAcZKglDw99bUHFM
         V8RyTM0Q2zOetzsfP4pGznMWgVOSMkV/dZj4QgabxtkIP7s1MzLlxjdD/l5ZoSGzxnbX
         Ic2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asw4pyIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26-20020a5d525a000000b00313f7836106si2044431wrc.144.2023.06.27.06.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 06:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asw4pyIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE8t5-0003ik-A1; Tue, 27 Jun 2023 09:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE8t3-0003hf-W1
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 09:37:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE8t2-0007SD-5V
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 09:37:41 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51d9850ef09so2738918a12.0
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687873058; x=1690465058;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Frfgu818BLRmW8RT5iuIKBeCMX5Yf0wtXOq08nvf70=;
 b=asw4pyITOtxsoGAa3hMo2/UYztp+zVXO6jt1P6j95r8D92fAyvTF99xzzVmFlecASE
 wR1YkCfv40lRUKw3JAMAcTjRZx4NtBqbrZT/8q+dalB/TlWZJg0jl86t8rTpfd7Iapfl
 w6uFZAtpJApRTnqy/DFmjPklrnZxvByz/NGjy93L6aPbeCiVzwCus8D9f9E0eJyiDC2X
 j9A0SB0GBQRarB+QLFpZtRnM40dGcRQkQMUZJKhcvFhyJ6Cevf3SW01HPgmwECMfKbwB
 JPBtppQoYALWvw7uKrludEW0/eBQgLNlfmztrFjVCnqgqLq3RKj5kjjGm4BZ39qMuaHb
 JeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687873058; x=1690465058;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Frfgu818BLRmW8RT5iuIKBeCMX5Yf0wtXOq08nvf70=;
 b=l3coK+LZx6I5rm+Y6cQ40UImhTq/sxmRe/lD2UV2ujh0AaArifLKGoQnTm9pQcvRhR
 EJ1Dkkn+A4XlhjIyngbBQ1IS38ZDzj3+vYGHcEpOZuDWzAVG3uC34n/yhkApBqpFmMLF
 6ARCo253UUvY/IEWdhmYbA/Ln+TlRKhvGLuaVvKTyYPCtOtOblM/2tUqCn7FBSrYZiw7
 PxtJTg9lYnxEBaM0BTUal1czxHDqShmnx3OvsLlAOe2D4/En9+OtbMvHrDEztNyfSLqc
 V+/09eCMFyhuZVgG+/OVShOyvO8RSRgXdmiwL1CWZDoIn/w/Sn4pkPf4XHOtG8GXomeb
 i+Ug==
X-Gm-Message-State: AC+VfDyTrrANPR3SWasQMSRcXvLL9wcgw1f3FJcFnz7g1fWwdP2HUgzU
 KbE1NCxPIIr8ThFVu6VH21n8H4MdpgNj7JL37Wiwjw==
X-Received: by 2002:aa7:da43:0:b0:51d:7d72:6635 with SMTP id
 w3-20020aa7da43000000b0051d7d726635mr7045659eds.11.1687873058592; Tue, 27 Jun
 2023 06:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
In-Reply-To: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jun 2023 14:37:27 +0100
Message-ID: <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: abhijit patil <patilabhijit180@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1PCLw70+r9WV

On Tue, 27 Jun 2023 at 14:32, abhijit patil <patilabhijit180@gmail.com> wrote:
>
> Need hello world program for ARM M7 (s32k312) using qemu...need all files for startup linker and main .c file and also how to execute the same....have program using versatilepb....but needed for this specific board  ARM M7 (s32k312) using qemu

Hi. I'm afraid QEMU doesn't have a model of the s32k312
board. If you want to run code on QEMU you need to build
it for one of the board types that QEMU does support.

thanks
-- PMM
