Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2480425lfm;
        Tue, 16 Jun 2020 03:18:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWdENAA7pgFbbl+YOAh9fRT1n/6PVWdu+vNtkxGQHDKEbATmsN3enAlgiSUOafazegh3dq
X-Received: by 2002:a25:bd0e:: with SMTP id f14mr2795883ybk.427.1592302695831;
        Tue, 16 Jun 2020 03:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592302695; cv=none;
        d=google.com; s=arc-20160816;
        b=Kx5ldg67B8IVQOC7aIoN6FNrLxjkeCLTOZGpdUpNcv6cyjib43ecTLFnT5K9o3fnpg
         ksUftpBGCUiCdCnxCqa2BO199aXwPdMVd/U9rps4sazfRcznQe9tLx02qW+AyHUJ/Gc8
         5fbU8/I35Y8c6ROu4SVqAB8v08PP8hKyfcoEtdLu8LSrbKhJAM18/gNSSrJfDk9A/Azx
         yqZ4AEOzRtoM0vMXCm7AsZXl/34bjmpwH5g2EdCqA5j48+lgZ/B28e7Ko23upzG95UYr
         7W7ORUlay77mFsCPr5ZWHOklDiWVlxmpR2mcSLqL9KTL5k4/g6JC46/RdXY1OTMz4ngM
         i9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=V90nUl0nGN3ZaSTqSpnvxDZFfC3709HrtSe5tJwmIJw=;
        b=ZVryAgVcpM3sCGx2grah41fkDKg2xHoWzV2WrbfaC5AtcqE7DttFOSoCbRO7cjRtFd
         4m48yXBE5nLVAnayssQc1My2ztabCFHP/mXCWJkjPYlmlvgiw35Ilc+y1FNX0m2U99I2
         61x4IE9HhMIHJoZgGXp0ed5AYwPoE0dG494GZY2k1O89PPXw3nE4SGOlRDUT2kAYZtNL
         KO5WRdTbiF1U4hq+FfBbL7nGxN59i4/1HBu/DGkM2MN0KZxQe1XiGpsQ/mbXt9VPI7nM
         AiTB/ThWI1VbLvEx/2w2G9ZGP0d4/Fo19WCUBAI7uiJpdie/BvXh6uLCzDaDKuKl3U7A
         kdZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="P5vQp/dd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si14528782ybd.42.2020.06.16.03.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="P5vQp/dd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8fX-0002Fv-76
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8fM-0002Di-8g
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:18:04 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8fK-0007h9-Pm
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:18:04 -0400
Received: by mail-oi1-x244.google.com with SMTP id a3so18784849oid.4
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V90nUl0nGN3ZaSTqSpnvxDZFfC3709HrtSe5tJwmIJw=;
 b=P5vQp/ddutgi3LHR+7Td0t2DPWhFb5tL9Tr2PLVs0W8y3WQipHMlVhc7xHDOs7efWL
 t32bbhaypKjhijmt8x4Bc8EZU+e/umRdkqdni0neSo1nEKff0IdCd6CXdXc8Dgv+xAqQ
 3ed4CdJ6WJO13/vsWgQgpddnkHjsNxxajpY3kztL7PeqhneJTyNCfIQ6KzUuIhTS4W7J
 7siv05gt/wHz2RB0Y9b1qNfRtLbqh5tzwsuBcXgmw/FDFXLiCJvw0DNglyHnDq2lpVtP
 1qnxcfeZDCbkcx2MeRTeKzUN7lEFf7xIjDqWEnYtlQ4j6iiLgVWE9Squw3kNuQHqVas5
 vddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V90nUl0nGN3ZaSTqSpnvxDZFfC3709HrtSe5tJwmIJw=;
 b=ggKR5uODpewKvaKAAmQZChQ+YL5UWBaCKs7gnIDBRtkor685YEwGVEaEzZtfWPygUa
 jFGvizmJwJ/my7hm6GGlKcr0GFyFHkSKPihn2ENMuB/YoRLCMfdooeUDZ8nps6eeq71h
 +dAN78g9tfs8gdMnytgtlKWFw34vFcSJlywcFcdtFohUBLNyMPMI1DGkB/Z+egNaC6jU
 GGcaki9Mk51Lm1MUesj6Wez0BXt4MKoVGLfga4uxoBEEoKklxOp9HMGYILyuj77PFc0D
 whZjAfj6H0FoKz2kNgQ1u9ONFrqhSW/S2y9ZSmfYtH5jd+yEO407C/NW2bUef9r0TI+H
 89Lw==
X-Gm-Message-State: AOAM531SsLOHKap8ELiniLjlxm+9b0EHHdEmUckJjFPIzy27zD3YXc64
 hERn4gCO04t5USi4TGpdsaToswExm2BNETPzhm1Pcw==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2693048oia.163.1592302681579; 
 Tue, 16 Jun 2020 03:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-4-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:17:50 +0100
Message-ID: <CAFEAcA9335-h=44X-kRMd3vSaGqeRwJnFtWkGUbzt3jeChNEmw@mail.gmail.com>
Subject: Re: [PATCH 3/7] hw/arm/mps2: Add CMSDK APB watchdog as unimplemented
 device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O5kxtd7XTnYh

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Register the watchdog peripheral as unimplemented to better
> follow its accesses, for example booting Zephyr:

We have a TYPE_CMSDK_APB_WATCHDOG device; so we could use
that, I think ?

thanks
-- PMM
