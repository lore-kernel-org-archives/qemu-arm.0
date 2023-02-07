Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5615045ejb;
        Tue, 7 Feb 2023 09:52:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/HmX4EAdzTT7TeLp2jFdOct80OIWbqDgY3233J+MUJ71DdeT6Oyhvj7E+yILpvOewdLX01
X-Received: by 2002:a05:622a:246:b0:3ba:247a:3fb7 with SMTP id c6-20020a05622a024600b003ba247a3fb7mr6350904qtx.53.1675792342300;
        Tue, 07 Feb 2023 09:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675792342; cv=none;
        d=google.com; s=arc-20160816;
        b=W/jyXLRQ2Z0kKUbMJVV3dWkFLc34kRV6iPf6SuHfpWVvPGlNAA3uoU4Mzi4F6AQTi4
         yRGFEjVOEXzf1994HpfHOm47n5jBMV++hDmHFVua0u2i6SxRUXeb9v3wIu91Y2+KhyA7
         ewwdvuKGt/SZtu9ZEoXolurjo0weDFN8yPUTYhiYrgbnkGys9dZSSri4/SAFDaVK+9OT
         A5RmTKc82cvDUi7DkonpshxQnIjQjb04zCNhzmwt0Kw9l9C1CMFIRKSq467uZj21+USC
         CU/zlDghqK+d/IFF6qKBK3m/UcAlTpSypTy3KwelSdbxZEQgCk1pqBZB9DmITNAlTGKN
         /ibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XSJ6C8pkRNg8mkmcCvzgVsMd48AVM2vioBD16Q5gCHQ=;
        b=0cuRgBPJmHB5u21lcjduVEPQG/PjU10Sl8TxO1aAA0dTbL7kLO7o75RUqlsMtv65P/
         IMrwXy58XTVz80dSJSxfxI9msbLmkdlKL+lZPfsuCUf+WFqD+jmzXWXYPKD9IkDuOlBI
         EY2TJ0gflHsAmc4KT3z9C3r36KPukUo6iW5aUYpdUjNpOgdaN6YtWXYnhz/nUQcymAJL
         gWhi5hDR2ZuLTCdoE+2W7D3DGviJoSJzViO0LGmU9zmh8Beecfh69RZatKu2Z9UqxCtn
         1ySMcFdS/h+T0TToOsYWbZQFDgw9GL4vb36ABGC9WEhjayLyqM9csAEgW/EviPlVoFL/
         fDiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fMqvW6MZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020ac87c47000000b003b65d7f960esi10323507qtv.714.2023.02.07.09.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 09:52:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fMqvW6MZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPS8e-0007rh-Qo; Tue, 07 Feb 2023 12:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPS8b-0007pL-3a
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 12:52:14 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPS8Z-0007Pd-Lr
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 12:52:12 -0500
Received: by mail-pf1-x429.google.com with SMTP id ea13so2054921pfb.13
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 09:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XSJ6C8pkRNg8mkmcCvzgVsMd48AVM2vioBD16Q5gCHQ=;
 b=fMqvW6MZ2QKORv/grUk/y47PIK3jsFcsDCP8yuFhJdLJlJkc0HR9v732wdbCsyFKAB
 K5kFu/S3SV57vpHG0ZuONMVrMZHpYgafxZt6ukxt99IxYHOFpNrPW27fNnGXI9otseHX
 K+Nx3a+5uNrXAjGpkNxvHTvbnx9IfPX28Kg6x/VNSEqCaNdWh+ZGMMrc0dkizSh0vB2W
 vRmQ/fxI5Tu1h3CZrnAudRqtTEIeEJvlvlwX96PKqoePlZXBhESE9f1B/XvjVEGRJj+B
 srezQ+fqBR3daNV4rV0RIrsfUdZ//UvG239CG1OooZCDsaiPVes259vi+5bYvvCvehSR
 J6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XSJ6C8pkRNg8mkmcCvzgVsMd48AVM2vioBD16Q5gCHQ=;
 b=Iie48SPNPJfQ4Zs/J8lr6M/6VWBumz+KEiiu4uz2vG0/bbpzJjQUyhghUn0vsqtBIU
 HDVrMiaFVJLYf6ocZ/7c9KkU1UsowRTYEh6LlKENjBkKkg7TmvVWhcKbptPcntfcTAfA
 uXGk0HsirF9sURduUQ37IB/ztpiUMDTrho6cW1osZXHl8lRG0+Feu7yittfhacyczsKf
 BwgReSiADLXqdhxPOPby2dxHVB1iOFncjT4B9uPo7/eL0talBaD9F4dcWJw4y1D+YyhW
 p/zNy0vNRRmtGd6E139hb1C9AsBQohCexG5mwvXAv35bTMCRrBjjofFBgITB0VIz1OQj
 WxVQ==
X-Gm-Message-State: AO0yUKVAc0rPmaZ539+FXa3RDwBRc7MxoNfJp3oOME4V6wxe8B5Mabou
 LR0dUmk+NcrDETofNyiPlXqQhxTS0ZuAQeEe5Oct3Q==
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr475961pfq.23.1675792330200; Tue, 07 Feb
 2023 09:52:10 -0800 (PST)
MIME-Version: 1.0
References: <167579147730.28776.7263330829354840538-0@git.sr.ht>
In-Reply-To: <167579147730.28776.7263330829354840538-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:51:59 +0000
Message-ID: <CAFEAcA8rBdUs6Ri37KP=hc2ZarRKCTDGq=TxHr6xAhe7KkfU8A@mail.gmail.com>
Subject: Re: [PATCH qemu v4 0/2] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: MlV1r6umvNU1

On Tue, 7 Feb 2023 at 17:37, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> New in v4: Moved arm_v7m_mrs_control out of the `#ifdef
> CONFIG_USER_ONLY` block, unbreaking the user-only build.  The downside
> is that this function is now taking up space in the user-only binary,
> but it can (presumably?) never be used because there are no user modes
> for v8m cores.  Let me know if you'd prefer for me to wrap `#ifdef
> CONFIG_USER_ONLY` around the v8m registers in the gdb stub.  Also, let
> me know if you'd prefer a separate commit for renaming and moving
> v7m_mrs_control.

We do support the M-profile cores in the linux-user executables,
so this code is "live". The view that the guest program and
the debugger should see is that the core is always in
user mode (aka unprivileged, Thread mode).

thanks
-- PMM
