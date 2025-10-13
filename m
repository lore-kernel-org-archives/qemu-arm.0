Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8CCCCD18D
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 13:44:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8Ir0-0004Fq-27; Mon, 13 Oct 2025 09:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iqy-0004Eb-Ah
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:44:44 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iqw-0007Kb-7p
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:44:44 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63bbf5f77daso4160652d50.3
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760363080; x=1760967880; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lYlDaqGkSPIhQvE48PP9/3xCKe4hnwWSv1ls4SqIL0o=;
 b=cxMXvvlLtElnvA/mJj0L3lhxPmB/agsjSoIAWZtJiVKl02yviLUfsNoRx66g3RkOb+
 oPxGaVHbixNbF8y6fTc6AfriLcMA4FlFJUW7FoalCvLn0jNd/dFEMZDIf0GtrnczteD2
 DeoYC7cKx4rQADOxBG1QFzfsLG0FbNAnasNxZmwLQeyGnGSfkBCbhHrI7HkXIkEWoXWB
 2TAJ/Uq+HzZ8D4N3hX4M0RTfpiQIPxvc1Itm86g9FND3/o2VYXzjkyfxAg/ktXZxIsFI
 36g61I3iFVhdvKOWblreV1P+DIWNnyO/NcKTo4siPayBFlNkuTQi4NtIG4cdbHNALRO2
 tfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760363080; x=1760967880;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lYlDaqGkSPIhQvE48PP9/3xCKe4hnwWSv1ls4SqIL0o=;
 b=N0S/J1P/32gexvQ9PGTe6tbZz8841lnSl3GrSEuNjsgcUZM+iCrEGvVvPiad0hExl/
 rlY03KyNZrK1d4xqDlgnsBbAqhl/jbhHRszgoJ96JAQObFe/Odr7qshrIxZGgLsa9DoY
 RvEm+4hxkYc88MPk7u639h0rnmcb6nUi2up1E/Zh+9ji6YkUS1NJ7kltCQQcfXUAZAax
 nErAtm8o9AfSinmjxKWFiOn0AkpGc5bEibxn3lJJaQ5KoHQpBm5q+7cEYgkIeYezbPcw
 HcaDsiwVSe06g4pu4zyuJXlEk849nJ1glbU+oppJu6WXj45HYj9gWfdmIcWGfLftnbP1
 0wLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPgVokD+3pdD4cNINA/N6pIh/9t3+NdbVZyhQhgdmIjZily7bmiowasE7pbQVUOAjiQJSCZSVzkA==@nongnu.org
X-Gm-Message-State: AOJu0Yy8aqfAp1S5k2kXiKbTzRcb879IUiZawul8hE1GyqvYWeJbp7D4
 Jlw8pWOtL6d5zzPNrF9X6fWR3y9nYbDXnwpSzOPmzzPhE8fp8JclLrnWhDrL1x1TpK9WX+ooO+i
 EWAp2WtrWSa0f4QOpVP9OJTRpJtuIsTPpNnRqEPWQmg==
X-Gm-Gg: ASbGncuzOUWF/xibQ1Zpkck+7TyZyyQ13juryBw/gblrSLZjY3SC3AmeIyvnFdYqNs/
 GnJqvlCl4096RpkxBrW3Thf2s8LVLMdPiK79t7UIc7ZoghfuCUCcYGM9paj2CdtPG03pb8pPhlt
 AZuYmtJ30OPX32I/e2cdB/AlDng/34aWhjhsvLha8r27fwoNlvr93d6ghymoFEA73W5k3LXn9iP
 YaJ+cbMFYKmiraueLRojJ5OOERtDFgTqsGz4F5MdA==
X-Google-Smtp-Source: AGHT+IHGYCU+c6krGir17pJ4xMAlHuf4CFSdND9P5PawGmnWccPfCqPE0j8nTezrAsauTCE03k7IqF2Wsl2L2XKCc2Q=
X-Received: by 2002:a05:690e:2501:20b0:63c:ea9d:7437 with SMTP id
 956f58d0204a3-63cea9d7868mr10120174d50.31.1760363080400; Mon, 13 Oct 2025
 06:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-8-richard.henderson@linaro.org>
In-Reply-To: <20251010201917.685716-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 14:44:26 +0100
X-Gm-Features: AS18NWArVHYMa-tnUG8-dBkzEGMf05SqivFMpyVzQOpDhl-xQRLltUzoSYe7P6c
Message-ID: <CAFEAcA-1ShkSaGkj=L7DghVzpJFGS==Oty4isPL9NxYLhiz_Lg@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm: Enable FEAT_AIE for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 10 Oct 2025 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c        | 1 +
>  docs/system/arm/emulation.rst | 1 +
>  2 files changed, 2 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

