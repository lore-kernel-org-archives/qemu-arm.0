Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp435607dyc;
        Thu, 3 Jul 2025 03:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwKJ/qsQCn4sLwoOiXgjfteUQQHTov8MIQadNLZd4vanWKMIX8jAoKeHwP4jcwIzMpRRNuIITDki8Vlg==@linaro.org
X-Google-Smtp-Source: AGHT+IFpyeSChwckXRgAZFUQOtoR+KQWrKgQtBYs3cDqah3S2+0a/audSu8VIwnc1ym9g5DqXwaP
X-Received: by 2002:a05:6214:500f:b0:6e8:fcde:58d5 with SMTP id 6a1803df08f44-702b1b9d3cfmr87265126d6.42.1751538372491;
        Thu, 03 Jul 2025 03:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538372; cv=none;
        d=google.com; s=arc-20240605;
        b=GcfJd8KrrPz9FbZQUTHAYzGSmlV+POJVuXG0twfgypR0/i54qvBqM2HpFE9XUdcn0R
         dYInsJulA9yq0J1cuo9L+OudqMB9RTOZyeNZq4tLZAyJgeMi5ymnd2Ymq3b/AX37bZYH
         r7oBCRUfAW8kiJehrIMUwbFA1y7MVV9MlDJMuGwPu+6qOiuMm6Rydtf5fISskbNCRm18
         yXstrTz8lpcN6cXZuPlcV1BejmOVqCQfXM06U9bVdqgTcc2Y4w5AD2DItEhQnwBvUW6l
         TCxXzLLHdevC4wAcD9GfhXbMFXZ5YieeuiiIyZcTjEfeE4SBSAWfdq/fV18Um3QfvbS5
         vBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=G3iJ5JjYU4isrADYml2qhwyxaowAjhQrTHID1xmE0IA=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=FwYow/M5L2IYnVSx65SPKuAv7yVHZV1V5iK9tap2E82UZ75Uv+ymWIpZ+TuxEqtIFZ
         E3TzH+D2y9SURt2/YDFp6CnKShc+F/Ku9HH/YCUu6pqo7m6BAVMaunhP7OiROK94Nl/A
         sJ1LQ1evddB4yBg4ARxKYcnlOUc2aAbjFsEPqqacCaPcf10NOeZhdXT2vPd+233EQvoM
         Ezu4bwUiSsWhsfLLHpKTMxFB8dt5TShx+H3ZN82u2aj+QGpRocmCtRKLOMX5QI1FZRE9
         umjTsdcMpNS2Qrc1DK5omLFBlHhGgQWLrEeWaI4bmJi+Y2b0nF8yych8ty0etgYh6HPk
         pGnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZ6UYqe6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77389cdbsi166958326d6.354.2025.07.03.03.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZ6UYqe6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXH8a-0002ai-UA; Thu, 03 Jul 2025 06:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH8Z-0002aI-FC
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:25:51 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH8W-0006F8-KV
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:25:51 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-708d90aa8f9so79816607b3.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538347; x=1752143147; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G3iJ5JjYU4isrADYml2qhwyxaowAjhQrTHID1xmE0IA=;
 b=eZ6UYqe6G9dcAtvi3p4qvhUn818/1tTpE4BFvPVcUtf3bR2Qk/QAMxtHtu5rxCkvAF
 FQYHP2wt1D9nquQtoLquKkIzmiwTuSJ3zaJNP+NN/JYDQ/gdXUTCUCYhGzijYoeDSD1S
 EDmMv3hGyhX2BjLW7ssMO1Sd0fg16d+9s9QyrsJllGfP2dxRwRRkXRg0L90OldUBuurq
 MefWI9rp8uSeiNnl9wF3ljNelvfw1Dv5I/NKa3ilJl981NVqB/PdD8/sQp32Z/9m6keD
 EPjujaCmQ4ZwkdZNqeGJVDajw24/3/IRb18eYupA4vmfZS+baiH1bR39qHx8hKpeXkrY
 LGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538347; x=1752143147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G3iJ5JjYU4isrADYml2qhwyxaowAjhQrTHID1xmE0IA=;
 b=XRLLc2y3BRPDreTc2dKzQML9vVgfMLEwpecPySEr/jdXMyzTQww+Xx44cS7GVqlWMp
 mXNrLfVlZu1Gg/UkBeo3Hd7mis1MAN2G/g7rjWYGXeQ/cJuTSAaQubMOy3lPUREz4j/+
 uvtSIQqFnUCm64e9PKMXs7jjdzGoaOmnUWZ43BEoeuobbbe340LlpTkxsnSC9xedzbSk
 0byfaHks/S/qIHKf6+iq2iR/EVn15HojmwyUhEWY5RJnU81tu2xMJcLhMZE1NCQjMYe7
 6x/I8jMq6/Vo5y34p3pPwBds2ust3k0eSX9VMxFalt84aU0OX3x9lvaJZAJBJfMvKVan
 gxRg==
X-Gm-Message-State: AOJu0YyLAsl61oOePwSZpJFK+tQT/7Rir+VoMmdqlKRpRH3qs2Vy0bA1
 X6DRL0LuUsCl+GWHnQmpi/6nPEe4aBNTPdqLP3Sp36R9X6X80DhAkiTRQkMz3JSvVnm/I20QSZX
 3gVqUB9dt5gsrgpNSwor+ABoncSIHOOa5i0WIzdZtTA==
X-Gm-Gg: ASbGncvu1TNdXkpm2T5GHqTrfUOLr4zpHvBmSIzAvCYcYVQ3DdcqaEfiDcaVXMcCbrn
 oaKo8qFhLdYg2QNHJCHh2EkXKwYMFvcWcl70ES9rbmBlVp28HUCEAgEWyPTUAqVt8Y7EY5j5B3H
 HYYnPkOO1moSd71v2t+4C4b8mgxCdVx9oxeDtnFxE6wX7hdNN/VjjmMcA=
X-Received: by 2002:a05:690c:10d:b0:70d:ed5d:b4da with SMTP id
 00721157ae682-7164d305dfbmr82215017b3.8.1751538346980; Thu, 03 Jul 2025
 03:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-53-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:25:35 +0100
X-Gm-Features: Ac12FXxROn1CBPYAo5MWRcA3z8ON9m1TIqbzsIcXYqsBKat4icIJY8gQWzvRYag
Message-ID: <CAFEAcA9Ugoe1MNLTaM-Mdb=YYv-Cpri+_=_PkRUi3g51YskSHQ@mail.gmail.com>
Subject: Re: [PATCH v3 52/97] target/arm: Implement SME2 ZIP,
 UZP (four registers)
To: Richard Henderson <richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0bRE+314+B9e

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    | 12 ++++++
>  target/arm/tcg/sme_helper.c    | 68 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c | 39 +++++++++++++++++++
>  target/arm/tcg/sme.decode      | 11 ++++++
>  4 files changed, 130 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
