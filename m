Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp2067275ejb;
        Tue, 6 Feb 2024 13:01:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6btPtd2BGBB/4jqqqL7HE0c0xWBre+uVGtiOLHWxb19ErRzwsGL/TUXq0HKlECvEuUqZ46TRcCOYee14tsguG4MBTN45r
X-Google-Smtp-Source: AGHT+IGM1VGbMVRUp2wGANB00+cpGsW7aSAwdc8KoOudVdBg5+d/sl5hleT+v81LiFmgZcqIv26Q
X-Received: by 2002:a05:6122:201d:b0:4c0:3d4e:774b with SMTP id l29-20020a056122201d00b004c03d4e774bmr898078vkd.9.1707253265370;
        Tue, 06 Feb 2024 13:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707253265; cv=none;
        d=google.com; s=arc-20160816;
        b=tq0ZRgfHQaVMNgqxLFujEwwoF1Y7zGe3SV7OCNNROSTzXsgYMfi9DmKuxjSMDdIe1L
         cD4f8zju8NvHtUB2Twv3+YcNNaL+lOZD3DtzqRuaUxKDlEw/g5uNSGlElm1r9gEJtNHV
         DlEHlLrGjSoWB++V9YXFik0oejFPzFzkIXnxfr1UIXyMBgswBUNKy80dIx3BLFAWQOIj
         jm9oMwMdhRE78zLLEGBlrePx6sSycgQyW2xG3MQFZacU4amDE2Ful58TFuSj+zkfIIuj
         Tbu36xkkdTJj5tStUE/3xRriobp97jWi4rEAdWW4KYs0PRB3nJZih4U1GsG5zbXhtxfm
         UN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=h2qa7ZciGW1AFvnMDgRHGxHRpndT8DpWvnBRbYSqNpw=;
        fh=F1U/smBNN5YWkLxbowzz5yqQe8dLxeJOGAxOJfLI5tU=;
        b=CY4ELaR20U5cAbU/F2gkysir43iuBuV7XyJQ3f6zPznmGpyJ45B0RUZBh65qCcDMNO
         kJ7nUx57fhRF+02O3OF9hCpAKgfmQeIkI/u+GuVvSeJdTU/4m01Cfmyov3amSNChk7EI
         sOj9eDoOMmdSMXNEEJBRWnY0STKrq4IlRE9WnLEaZD8pPUbu1hV1DSMy8wk1gKBg3Etz
         Vis2ZZuAiK4bGqjYCyB1Hy6s5amg+Fu+wdSI4smadwhI6jLnfq84F54VVXiVYzg1nyaK
         VPkaRUOiC5QYSF2t0qDUs24k8kJ9PMJ/3OIfMxtS/2nvxTSYfqS4PhYxdwg7A+ZQEx7U
         rmUg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kc+R41GA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWUsZA5yt4EGHQoQxYpLF/z70rmojKdv6DBMHag0pydp9KaW6d1GN/VYbW8Ac56KEKA8UjVHLKUt+WyyHs7GZHFrxrEUGEv
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a056214202500b0068cb0a77fb2si3134744qvf.342.2024.02.06.13.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 13:01:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kc+R41GA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXSYt-0003DX-VG; Tue, 06 Feb 2024 16:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXSYl-00038N-2Y
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:00:52 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXSYj-00044I-Fk
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:00:50 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0abdde3easo32849181fa.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 13:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707253247; x=1707858047; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h2qa7ZciGW1AFvnMDgRHGxHRpndT8DpWvnBRbYSqNpw=;
 b=Kc+R41GAemrxARd++f15Sd8J87p73DFZ/N+gR30uHdrnyZJ19yot0eI7cxEGRsHF9O
 vfr82LJ4hMplihxG1uMrDhkQ92kez/4qo7q/SxZ5ouVGalvHRmbCXfih8MdpgP4rmzWX
 M4a1sy8mqwODeW8G9pMVJE7x0zXNfyfHx9vNQKTIFTS+uy4+vpYBVyzO2nlxbE2j/457
 mwoIsf6xoNLvho3IjH3OWjRqrKgQ9G8SJxilSxhJsvrIU2z4xUIkgHKVQ6R8gZqY1ePD
 41vD+tYTAdBsx5JzaqksvTtTG8Jg/xTFGaC3SQJ6s9hM2ianLkk/Q5MiufXssOqD0KzU
 N4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707253247; x=1707858047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2qa7ZciGW1AFvnMDgRHGxHRpndT8DpWvnBRbYSqNpw=;
 b=teCMecZipp/XBqQrIUEQrYRhIgklhNabzd2cK4NCwiLgKklMuI6NuwB2wAGV6EQ4e3
 pozYsdIrPiSHKmLFdh7CWaUUOCHh3wr2hHIYQHTd2ZRgKAiYvb0Kle32x5qPTQyskc7c
 bdpGNrvSXv0mzwtGFK0yZGbAtHHtzQZnEnabuDK9l+bi2HDigQbMgV8GgsZU4N/aflnt
 xBBvi5GEsPOXs+0A0o1Go2q4EmK+ty8Bgg8bPlHRDpZZa4SFbG4RjDT7jPEaUuoXZwLG
 F1n4MXJtAsJHevkUUgCD+iNU4thB/drC/vKxi+xraSSZ8kxnDl/A3eCahAB1TqFxVkAx
 AhYw==
X-Gm-Message-State: AOJu0YyMX3vnDXx3cWKZLwyirk3xyX+Z1X/lFQ7oa3hVNrqp4mwhTf2c
 +knAfvLkgG8eylxHwKZVRETQnnVnF7/mK8H3QOgh1p9WP/mNmWHT52fiRo+oNGKqi+E28mRQ2lP
 LQ4qC9XB0xKEsKB7NaWHANYGhd6/wmucs9UFjZw==
X-Received: by 2002:a2e:9114:0:b0:2d0:ace4:8896 with SMTP id
 m20-20020a2e9114000000b002d0ace48896mr2695584ljg.29.1707253246942; Tue, 06
 Feb 2024 13:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-2-peter.maydell@linaro.org>
 <768c7884-1a59-461c-a810-4f8a89d4bfda@linaro.org>
In-Reply-To: <768c7884-1a59-461c-a810-4f8a89d4bfda@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 21:00:36 +0000
Message-ID: <CAFEAcA_-8Q0=iZjchVwxDNqMDuYjdLH7XjvHPJU=1oJ3smDFzg@mail.gmail.com>
Subject: Re: [PATCH 01/13] target/arm: Use new CBAR encoding for all v8 CPUs, 
 not all aarch64 CPUs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: /wZipwuf2Jlx

On Tue, 6 Feb 2024 at 20:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/6/24 23:29, Peter Maydell wrote:
> > We support two different encodings for the AArch32 IMPDEF
> > CBAR register -- older cores like the Cortex A9, A7, A15
> > have this at 4, c15, c0, 0; newer cores like the
> > Cortex A35, A53, A57 and A72 have it at 1 c15 c0 0.
> >
> > When we implemented this we picked which encoding to
> > use based on whether the CPU set ARM_FEATURE_AARCH64.
> > However this isn't right for three cases:
> >   * the qemu-system-arm 'max' CPU, which is supposed to be
> >     a variant on a Cortex-A57; it ought to use the same
> >     encoding the A57 does and which the AArch64 'max'
> >     exposes to AArch32 guest code
> >   * the Cortex-R52, which is AArch32-only but has the CBAR
> >     at the newer encoding (and where we incorrectly are
> >     not yet setting ARM_FEATURE_CBAR_RO anyway)
> >   * any possible future support for other v8 AArch32
> >     only CPUs, or for supporting "boot the CPU into
> >     AArch32 mode" on our existing cores like the A57 etc
> >
> > Make the decision of the encoding be based on whether
> > the CPU implements the ARM_FEATURE_V8 flag instead.
> >
> > This changes the behaviour only for the qemu-system-arm
> > '-cpu max'. We don't expect anybody to be relying on the
> > old behaviour because:
> >   * it's not what the real hardware Cortex-A57 does
> >     (and that's what our ID register claims we are)
>
> Not even that, because max resets MIDR.

qemu-system-aarch64 max does (in aarch64_max_tcg_initfn(),
yes; but qemu-system-arm max is set up in arm_max_initfn()
in cpu32.c, and that sets cpu->midr = 0x411fd070 (which is
the same as A57's MIDR)...

> Anyway,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

thanks
-- PMM
