Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB134CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:56:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHLw5-0003vO-BZ; Thu, 15 Oct 2026 09:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHLvy-0003ts-7F
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:55:53 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHLvw-0001FN-JB
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:55:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8ac9d666d4eso20483357b3.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 06:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072547; cv=none;
 d=google.com; s=arc-20260327;
 b=MPRIIaBlfZrWo0UwjBwCkvKoKJxc4+NloI65xC7NM33e35ounqx8Bpj1myGCLEmM/A
 N4s/ULdr7lcQ4+YbrV5VZEWOWzT8An9hzOsnNdyRBbHEesi8jFwNmpSqu0L4im9J/p6R
 8U7PclZ2eLrbQblpb+BzAPtAFRTl9teNlPtJ5KAXBT5o45GdnUMBIfuDKC1L6wuSE+rs
 9QaXl2NEeSugTu94OGv3powh9y/+oDbZC0bzftUxPEXq3B0BhK4OkSO2PzpM7Bf/06ww
 G9Ua+8cNgYcRPMqxyqFscRTOLG8fC4pbXx/I8rOORyXZ7anTzv5xerKcldd2kIIwdCpz
 RirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=M0gpN+JJF2TYnnPqlU+Vv4DSdt+bcp5pdt9jGNK5vkU=;
 fh=opWmL91d2hiqkiNMTG2W81MFz9cX+jj4i0gUKxliHUk=;
 b=renMdLk2ynmaOaTacgFd23CMVBE6rOSqG47SGMBYFW/vlWoXVC3fql+/D8lMGEIYZ3
 Skv65E0jDwmnr/P+hv1nTGpI/4uMv2+9yEha6k/7sJgVrjWbzdpxKRtEjUYPl7hIAEPn
 limiQpYHGScOG4H5R/ffpQl3keDmau0TIVIzuHw3mc+1aAvMjxY1dTGh8O8p0fXEmoem
 DmVqI0R5nk6oIohl6Wt3G2QCm5YYQqKBzJM05Z1kH2OZji+ROv1thqhxjRP9zi64a3eI
 YaKh0IOVTHsqZzs2rCkFVYNlt5pQNoOK+yZyHffgLj/BE1k1pv066mrkQsr7XbvN2JRz
 5yRQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792072547; x=1792677347; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=M0gpN+JJF2TYnnPqlU+Vv4DSdt+bcp5pdt9jGNK5vkU=;
 b=mNF2krjVyavyp3fYz6LPRktcTYNscm35hI1JVODqH2Xlj5wYcodTqDsxjnF+MiwWPB
 ftPUJSS9FNrzFrmr5CjI3qf5+pOpDqK8sWkDqcfoHw0x1A3iuGkt89Pj3n43YBLpR43L
 wKpF3GtQbX9FwcUNut63bDiQjMMgUdQO/wTT/2rIb70FnC7tnOUUl1fAZ/DDaaWATflQ
 vCHk5xMdN1G4LV10NUlF1k2RCogcVwjQljXBHYP1IIU4rQqSiA8zVj2/Gbs9rjiMyuod
 o1waYDVTmF7giVaaQaPdLrBRQX/mliXoc6YdGA4Hb9dwSYx+xrK+FTodUHnweL/qBumD
 9m/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792072547; x=1792677347;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=M0gpN+JJF2TYnnPqlU+Vv4DSdt+bcp5pdt9jGNK5vkU=;
 b=hcGgVlhqxUNlY+8Bj18r3n481jhKdaXyb0u66PxJ3B72yg8x2FJh2znb5NDUdEPB9s
 8v4b7CtOmJ9Ldd6hWCImUqdb+BGjK8FvaHnMJexvnIh/2F7EavDwc34nZdLYy4MqZ0TI
 AsX9LYDkWTgF0jlUL3tJRiM1ZBHXz95Szc9vJNbhcV9bQr+Loj2fL/5+/lEey/Mzn5CD
 HZJIfjXGcTZHJT4d1BEphCo+X0L2hjfgADDw5TYYdBNSsMpmCwhJvdbV/7EDXp7RhLMF
 +g8ruLHPvFastLt0/fWPG0/XH+11nKfH4lG4Ga+KwbuUumt7hTkzS2edl0P4HENpBIoA
 JFyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvBm7EexkdHpbkoMSLvDYMZl6Fsbcm65lMs+4ekRHAkSMePZoqGv2aZ/0NEm40CP0VOcuBEZ436g==@nongnu.org
X-Gm-Message-State: AFq9FYJgz1W6SBU+BU1ANw2rGOLw4x6IYLTHEGz0Zdr88VIuPgo5sW1J
 +uuNJxqIaQz0xO47f6SVrWipeFjprL6BG5ATME5vFcIlDWVL4wiIu0NhOHNQLEW/eEhAsVxCIMR
 UMEWKiJXiJJmUHmMb/SfkFMmJgD1u1vT7ro2HTLP9xA==
X-Gm-Gg: AYBFou2BfaFUty71D2G7uHDH1t5d3PmK5eCCES4v1PR/v27n0If8JqO0q8t4OirAFbQ
 mDxAhfLuaNCLkdMKW+AO/IUUWSc9h4bSfgSsdz+fGJAfgOcEJCLUy07l5nbF87FqCEcJDdjmAf/
 bU99JvzzUft6P8Z1OET9SPxFVk4PFedVfwpzO4wzs6QRY6DrmE+9xOFLsmW6BeQUWSFHvNc7WQ8
 dBxqBJmChgohNyzbU8tEqG2+r7bekUqXuAc/71OMDsr9if3cNszwltITAULD7bwdq80zLW2nwlL
 +U0gtr0kK922vzpH3oKKML1sF2Xnn40prTXuUIXcFXz9qMith9jmkcoeJPrVuDuxWBVmruDc04T
 Y3ix/FP7QfUC5elRMNW3go19msqB2NbarZHHFn/Q=
X-Received: by 2002:a05:690c:7447:b0:883:b158:49e7 with SMTP id
 00721157ae682-8b07edb8f64mr63710757b3.24.1792072546632; Thu, 15 Oct 2026
 06:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 14:55:34 +0100
X-Gm-Features: AclHuK9725igU50cCxm947ufpQXnYLIptKQMBhaQ8cS6EWuDU6ZauTOTTQ8FQVE
Message-ID: <CAFEAcA8Jj=+Lh1vkk9Zytst06cwD72EPy0VQ5759OG2xhx8Vww@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] hw/arm/raspi4b: working PCIe and GENET (real
 networking)
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 11 Aug 2026 at 15:35, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> This series gets raspi4b's PCIe root complex and GENET Ethernet
> controller working end to end: the PCIe link comes up and devices on
> it actually enumerate, and GENET passes real network traffic (DHCP,
> SSH) under both older and newer guest kernels.

> Marcelo Manzo (10):
>   hw/arm/bcm2838_pcie: add BCM2838 PCIe Root Complex
>   hw/arm/bcm2838_pcie: add BCM2838 PCIe host
>   hw/arm/bcm2838: enable BCM2838 PCIe host bridge
>   hw/net/bcm2838_genet: add GENET stub device
>   hw/arm/bcm2838: enable BCM2838 GENET controller
>   hw/net/bcm2838_genet: fix PHY autonegotiation-restart deadlock
>   hw/net/bcm2838_genet: fix bogus RX checksum reporting
>   hw/net/bcm2838_genet: fix TX ring activation check

These three patches are all bugfixes to the code introduced
in the previous patches -- you should fold those in instead
of having them be separate commits.

thanks
-- PMM

