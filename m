Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223F606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X775BE9q
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVSI0-0004Fz-5N; Mon, 23 Nov 2026 06:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVSHE-00046M-DB
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 06:32:15 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVSHC-0004Bt-2C
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 06:32:03 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-67c24619b19so2369950d50.2
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 03:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795433518; cv=none;
 d=google.com; s=arc-20260327;
 b=d7TA6dXokPtoYHaWzUYXcfYfKaQsLH9u8CcVoeIGUBPnYMOfRrzE711L2V4Jh5rNXb
 IwMDptfF0WfAi+3x1Nh0FKIzYsjAgQr/TYLXVMHYIa6ozV9atgwnV/+IAk8lEimX8FFh
 a7qf/gOLDlpN3yuzhSr2G5ipq1G2OT7aeRood6c0hLkw0BXYDsaqxC4A3F31vBSNvDNS
 29VrgCUzSp0H9u0oYC950HVxA1msCjcANOe9TmKz+yDdSmFnAI5RZMXD/hSRFbvo9W2z
 Jks2ffBcb8AGIsoTdrZ81JKpduWS+gXdiTWMlNGRxBONG7PdMDPr4dNVptGoR0NlcIry
 95FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TU370y7R5L29omjWNVlDL5In78ul3RsztEX0Ft93XdQ=;
 fh=I8e+TbWc2TBwnymbsx2vdYnK4MYXBFda4o25nt/dEEA=;
 b=pdLPFlayDoTNVxpk31LXdpJTSWKPTVWWJWCrVFVLRjp/eKrjUs6FTzBWjLZX00boKf
 UsxQ1xErFP9Cy2Den2zoB/NijCn1qVG0RAqgEoYgCNlYIxUmfxnaSgMJ5SspId5Oa6kF
 SNAKPHmHLWifT9OZs27ROl6C3itJILbyGRRJAizUe566cKr0jbbrET9SA7vyuifPeJsq
 re4rY9kY0vS9Hi3krjyoEEW1DUMEH+uHJEfNTG6aAnbKz4RKcubvpk4yrfU5V6tb2hcc
 Lw7GZachv6NlCyTjqgLG80HZ0r1ICZfJK4DG2oufvNc+BGZXkSxBEXFqEdLnrqa2ZkmS
 Pr0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795433518; x=1796038318; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TU370y7R5L29omjWNVlDL5In78ul3RsztEX0Ft93XdQ=;
 b=X775BE9qy6mioqDEEOQ2USPgsMmKR+4dS2d5dUEwLerjGpPArknDkfXn/fWS6cFCuf
 k+PQ96Lzz45/InDSNXIdSRZRlGhmRSLpFAkU528CZ4aUK3OKCUjY/pRvoUmyF3H6X+xq
 /c0uf8VOcqk8VKF0HKI/tllTats+hvo+UHb5pxxhHCEKd4PbAVxRYI0z48AEu+cNIJl3
 Y6hp1IKB5JeaQFPEfLg91J9FgIqbL2KAUJBG3R0TGk4IgeJfPDouq6iaoIMRkbhs/21J
 85QRFZHiW6/KhyvLe+a23zM7DeEX1YFcy61V+HlLrZ2FZP39wnVH4sWUMG7OW6oGHybh
 jTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795433518; x=1796038318;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TU370y7R5L29omjWNVlDL5In78ul3RsztEX0Ft93XdQ=;
 b=yv2SpZtd+3V48OEm9gnooGOiyp4+4fqJx9mnjYca7LKz3oKRxK8YaHguABZfr2MGEc
 mL+WVeZOSMmT/LAOrATKT+wtKxm6ByhnIOIXZCI2gNDn6shfULdrUb+H/HoR2KoNMSRF
 ZPQZDt3t2RmwLzClUCdg9RWKEGk9VsbChbl2qBBhYb0fECeLkkQhncZBLTjJGnsbiLPZ
 94YSLHonkAJs5Bg3TYneiWDSA7F4flaAdN+BSm3DpvnKkkP6xVyst06mMTny8V159gLa
 B+uwi24BRTQo/Tp2bSPkb/qnbWrhKV31hOKR7XrnBTT7gsnMIYEoIzrSk+1nqCylZ2ZR
 nfgQ==
X-Gm-Message-State: APuU4Z+eq0CN5oo4u16QpyQFdnDLb081s9KEVMtiLtwFV5Vp34kwv2TJ
 5sB842RqBeefyaQLZcvX59H2QwAYOkoAUpiqbHERYCkNaJMKI+BM5AH4WRtewTd4qVfPqNTm/fC
 FOE+2njhJMRVdIhRk3bxfbyE2RAndU5atAxhqnpTJsVWz2IH0MJmr
X-Gm-Gg: AZFdTZc1ymYpgAPhwzr9uDFLPxyoXsqpmhnm744MI0apBQywUVu4AS4j7rJbt8+EsA7
 qQ62bgOUDUTrsWAGwKw2W+hTcu5cwQBaPgVPsyc7OzObAcHsrK5Rfum5tqytl/tuR1nDmRhGFNf
 1Wfg5sBG23SHdM/UL9mKHd+v5pgDOs29cJQaoM+OFMMljvCR9+330AZhSQ0uEQ2JsVmlY9oRXpc
 XKTsQNLQMC1J5YtcMKjU/ktJtGtqXvYH0ZHS8/p4COJIF9tprYbtHJqkh/bSZ9NJcJ2DF/03QlU
 gJpETMz6IQSlDFPn7lUemC29rIZlFVgxwOI2A/UGhH682scAXU1QTmGgN0fXE1ihL82DmHbmPWz
 3VKLpJEJRAvtE9q1HRiS7m+M21N+7omj2RD4rXKbBo8n6Jc8FtvM17mIvdHDy9lHGF7aobJWrMn
 1OjfIZ7wbuQmR6a8mgW033
X-Received: by 2002:a05:690e:47d9:20b0:679:b313:137f with SMTP id
 956f58d0204a3-67df44107aamr3263674d50.24.1795433518297; Mon, 23 Nov 2026
 03:31:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116114641.1799526-1-peter.maydell@linaro.org>
In-Reply-To: <20261116114641.1799526-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 11:31:47 +0000
X-Gm-Features: Aa3M54oZc21ZeJxN0KTDhbfO6CCXWLukZNzGqP0wU78Kqjb-7lYDlKLx8dUw_QY
Message-ID: <CAFEAcA-Vns8Ho9h1B726=L31ug+Jht1jy9xtiEP1Bf4=E0=iXQ@mail.gmail.com>
Subject: Re: [PATCH for-11.2] hw/watchdog/wdt_imx2: Fix migration when
 pretimeout-support not enabled
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Could I get a review on this, please? I'd quite like to be
able to put it in the pullreq I intend to send for the next rc.

thanks
-- PMM

On Mon, 16 Nov 2026 at 11:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The wdt_imx2 device has optional support for pretimeouts, which are
> present on most i.MX SoCs but not on i.MX31.  If the QOM property
> 'pretimeout-support' is not set to true then we don't create the
> ptimer associated with that feature.  However, the migration vmstate
> unconditionally lists that ptimer, with the result that trying to
> save the vmstate of an i.MX31-based machine like "kzm" will hit an
> assertion.
>
> Move the migration of 'itimer' into its own subsection which we only
> send when pretimeout support is enabled.
>
> This bug has existed in the code for a long time, but it was hidden
> until commit d9abd0253be ("hw/watchdog/wdt_imx2: Remove redundant
> attributes)" because a bug in the VMSTATE_PTIMER() macro together
> with the fact that the vmstate_imx2_wdt version_id was 0 meant that
> we weren't trying to migrate the device's ptimers at all, and so
> we avoided the assertion (but didn't migrate correctly).
>
> This is a migration compatibility break for this device, but it isn't
> used in any versioned machine types, and we've already decided to
> break compat on it this release cycle.
>
> Fixes: daca13d495a11 ("hw/watchdog: Implement full i.MX watchdog support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4876
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based-on: 20261106163657.3825938-1-peter.maydell@linaro.org
> ("Fix 'version' arg of VMSTATE_PTIMER")
>  -- the patch in that which sets minimum_version_id to 1 in
>     the wdt_imx2 vmstate would otherwise be a conflict
> ---
>  hw/watchdog/wdt_imx2.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index abb8edfae25..b4196de7021 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -221,13 +221,31 @@ static const MemoryRegionOps imx2_wdt_ops = {
>      },
>  };
>
> -static const VMStateDescription vmstate_imx2_wdt = {
> -    .name = "imx2.wdt",
> +static bool pretimeout_state_needed(void *opaque)
> +{
> +    /* The itimer is only present if pretimeout-support is enabled */
> +    IMX2WdtState *s = opaque;
> +
> +    return s->pretimeout_support;
> +}
> +
> +static const VMStateDescription vmstate_imx2_wdt_pretimeout = {
> +    .name = "imx2.wdt/pretimeout",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .needed = pretimeout_state_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_PTIMER(itimer, IMX2WdtState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_imx2_wdt = {
> +    .name = "imx2.wdt",
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (const VMStateField[]) {
>          VMSTATE_PTIMER(timer, IMX2WdtState),
> -        VMSTATE_PTIMER(itimer, IMX2WdtState),
>          VMSTATE_BOOL(wicr_locked, IMX2WdtState),
>          VMSTATE_BOOL(wcr_locked, IMX2WdtState),
>          VMSTATE_UINT16(wcr, IMX2WdtState),
> @@ -236,6 +254,10 @@ static const VMStateDescription vmstate_imx2_wdt = {
>          VMSTATE_UINT16(wmcr, IMX2WdtState),
>          VMSTATE_UINT16(wicr, IMX2WdtState),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * const []) {
> +        &vmstate_imx2_wdt_pretimeout,
> +        NULL
>      }
>  };
>
> --
> 2.43.0

