Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp494084njb;
        Fri, 14 Mar 2025 03:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq6eKXMWpQZ7mIBBmQ6ypy8WlpqsIkcIVrbw5J1hKi5bD+3siNKOsweXjy3AqgFZR2xhmt9+6X5eA1Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVw8npE5vvEYk3PAsgryF2eXzSBTYloXNxgfn6dCBq/y3G5ja4efz51FeX8cUukFOtvq1n
X-Received: by 2002:ad4:5c4c:0:b0:6e8:ea29:fdd1 with SMTP id 6a1803df08f44-6eaea9f4500mr25955186d6.3.1741948219085;
        Fri, 14 Mar 2025 03:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741948219; cv=none;
        d=google.com; s=arc-20240605;
        b=EoND2KnYM96vh5kMn8uXKHH/MZwceBp5VZ5/hja/kXnSICiah4SB9PgN8VypcTD166
         1UMVGPKLpQrKWvWPXLzjfnTCFzsFmIiGUjhpHTiPBmB+o1t/fv2mcS0fDo1QI3o7h6rW
         mTTGU9dGoMJO2htjPwGMCfKksA8zAYo5MY3eWp6cy21GPh3IOTPg7mj/2vsGm/iO/gVb
         jpjMjI4xs8PKqXDzxjK//WIaFP/2cFMxv/H9xovAqDR+QcROa4Vm8WLBpvugeiv4voHs
         XWyrjZbyfUseu6/Ep9m3Gfo/nlBnqTT8xls67dGP0GmZJ0uOK48r2PowMC4EBSJIdmJu
         +O1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dOhW+BbCDJrnLdg7ZGblCW3fBpI0xRzuTSx8nnuc4P4=;
        fh=5DsJ9r7l7NfsB7wrXmV8ETMzMy10d+Lu+PRIymXaJ7o=;
        b=hG/qwwNJnoOmqL3X16Kia8/2xsMhoLXB+w8Z/1XhxnCBsx9gmlno4gbg2741ifXE/F
         w5zMfiHwtUnm8jde53OXHSghmRuURCQoKpra2TRWwnkloBZcCjAQgmBsDsCfk4Q9UIOG
         tIzHI1wQIhNqrux41aaud1rDejMVOISGTwzLgvct5hBzBoocV0JVX6OsC1dSS3U/9uP9
         jQF8MOtecuOD04UldieiAfhjulQJXGHh6AqApHhZbZwlIIRKRF5zMW4Cn4S1eGMqS5aY
         +SvQMwF29HrXbLvqCaH96JWAVW6NBY5Xh12isdP9pa33SBvfHDeppHTBvvPpD8kCdzfE
         yrDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rzEZ8QSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade33c852si35691126d6.266.2025.03.14.03.30.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 03:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rzEZ8QSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tt2If-0005cJ-Pz; Fri, 14 Mar 2025 06:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tt2Ib-0005ZH-2I
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 06:29:53 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tt2IW-0005R7-HC
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 06:29:52 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e634c42a296so1625903276.3
 for <qemu-arm@nongnu.org>; Fri, 14 Mar 2025 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741948186; x=1742552986; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dOhW+BbCDJrnLdg7ZGblCW3fBpI0xRzuTSx8nnuc4P4=;
 b=rzEZ8QSERoSUHhoWhtH37Cb7KW0ct4/t82htGoWhwJZYTuOHK2IPcFpCjqBR2cbLJo
 XWVxc8nKWI3r6eH/YqcGVDgpnxE4jZxUBNh0cGTWxBA4U9/bJbKe5yx3nQ+s7FpZypES
 zBZTFS1ptIDbf1GSMZlU6TPsPSJTJBbxgOW0Ulzt+MKu/qj1m/vHqL7gpO1dfoapNjJv
 WC4Cy51Fd5NJd5rMN9f2d0DdPGA4Buif0Tj3u8V5JfSsdJBUE6/VKmWZHe9SWM/dEIPM
 NKK5zu4HXe2QMa5wgmIXcsJD5W0XpwBmtsYQekSER3F6b1QBfO5fnkAIlM0wiLM/CUxE
 jvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741948186; x=1742552986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dOhW+BbCDJrnLdg7ZGblCW3fBpI0xRzuTSx8nnuc4P4=;
 b=TTir8wV3N5MXmAZ5oovoenZaCU+4TekTbWgTs06iyMX23ICTmuDRixCdkieMApdRiR
 Oet1qfVJXWN0e662puco9tmKBnD4MoryXFqWqE8Nqgh5KOFmJxR7wzBd/T2ZX5oTbLU0
 V7m5tNwISzyGUest2kcAVA58PEehfpBK5ahwJmpFl72185Y/w1R0xNcx2cr5w6lTJzlB
 m1vitoSsmpprZUisTtAKSOGFUDNcjRsxzhj32v+MOytyx+zqMtcnRiyaniLXraREYrXD
 d5LQvQKvmCncV0UM1aGVD9PLml29+rP3Xkr9L5x2dEUMvaTOs+pA492RLf31urNr75oM
 Cauw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhIO5S/uOijFVil51Nwq6r60gIb3QUMc0FowoGtNHIiV0X0M9ViExN6MyK+tejWb6FiByyCBTjkA==@nongnu.org
X-Gm-Message-State: AOJu0YyZa6Xf1oBAna4twQamH7YtbcnlLSH3AplN0j+pyWYiOLwpxpVH
 ppGAAfnmErhXwwyzvoPA76VG2ieSvUsf00jtLq3roDG7Ft8SEZTgbfagbRn7FvYLkJFKri6QrjJ
 pcBgoSMUB8sjPMQBNol1jczoRTMdGkvmax7ma8CNJpxrQxoF8
X-Gm-Gg: ASbGnctAi/HTTjRLXIxeNCFvTOjMcUm5mPgJS2hncs+eejTYS5inrK+FTmlWrfEM3n9
 syFHOG2frGKfccVVEApUFYN0KMT7Ex/VfWaQY8GhH553mMRO+9p0NC85RjdbqgeHcPWCJohK+4T
 bePCWC2ZRNRNrcN5TW4os88Wm1qEU=
X-Received: by 2002:a05:6902:10c4:b0:e5d:bcc5:c33a with SMTP id
 3f1490d57ef6-e63f65c36b7mr2262883276.43.1741948186641; Fri, 14 Mar 2025
 03:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
 <CAFEAcA9yKETtDhJroC7RD5itUjsYAkj0fVXHJaUxoU_bce7Gvw@mail.gmail.com>
 <52ffbdcb-abdc-459e-8d49-a0c9e1a5de92@daynix.com>
In-Reply-To: <52ffbdcb-abdc-459e-8d49-a0c9e1a5de92@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Mar 2025 10:29:34 +0000
X-Gm-Features: AQ5f1JoOy3YqSTajzehdP8eUYxULBISmp4a_tdqI7WP_WgM0_LZ0nHeWaurMtHU
Message-ID: <CAFEAcA8KVogRXr1PAocWPJzj0nLzCiQc9SQ1n9rWHHF3P=ZEVA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Define raw write for PMU CLR registers
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TI9N21hkN26d

On Fri, 14 Mar 2025 at 10:24, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
>
>
> On 2025/03/14 19:22, Peter Maydell wrote:
> > On Fri, 14 Mar 2025 at 08:13, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >>
> >> Raw writes to PMCNTENCLR and PMCNTENCLR_EL0 incorrectly used their
> >> default write function, which clears written bits instead of writes the
> >> raw value.
> >>
> >> PMINTENCLR and PMINTENCLR_EL1 are similar registers, but they instead
> >> had ARM_CP_NO_RAW. target/arm/cpregs.h suggests this flag usage is
> >> inappropriate:
> >>> Flag: Register has no underlying state and does not support raw access
> >>> for state saving/loading; it will not be used for either migration or
> >>> KVM state synchronization. Typically this is for "registers" which are
> >>> actually used as instructions for cache maintenance and so on.
> >>
> >> PMINTENCLR and PMINTENCLR_EL1 have underlying states and can support
> >> raw access for state saving/loading. Flagging a register with
> >> ARM_CP_NO_RAW has a side effect that hides it from GDB.
> >
> > No, the CLR registers don't have their own underlying state:
> > all the state is handled by the SET registers, and it just
> > happens that you can read it via the CLR registers.
> >
> >> Properly set raw write functions and drop the ARM_CP_NO_RAW flag from
> >> PMINTENCLR and PMINTENCLR_EL1.
> >
> > I think the correct fix is to mark all the CLR registers as NO_RAW.
>
> My understanding is that ARM_CP_ALIAS is ignored for KVM to avoid making
> an assumption what aliases KVM implement at cost of migrating one state
> multiple times. The CLR registers should also remain as possible
> sources/targets of raw values.

Why? There's nothing you can do by doing a raw write to the CLR
register that you shouldn't have done by doing a raw write to
the SET register instead.

thanks
-- PMM
