Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B619FD877E
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 14:27:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2VOJ-0004lI-37; Tue, 17 Mar 2026 10:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w2VOB-0004gB-HA
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 10:27:21 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w2VO3-0004Y1-KS
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 10:27:14 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-660a293515fso10918877a12.1
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773757629; x=1774362429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iyvqv2oeZF1JtrNEpiMY3HnJkSD10YJO054iHA654sQ=;
 b=B8QjSaTCpZ9hfysE7v8gjQAyyjkJ+qqsubBLflTBgB9+GgwwHny8aM0/j6MQ9fVIxS
 6/XbzLhaky5BC4ovAIvrel1+ceRqtBAJg4OZVygulTMuXQXMegSR4PvfGlxXD+TPJ5Uu
 JSbixnTCKgAEuXtB4xcWy2Q4vMrHiO+/24suwFXr3Qgvc6V0rFo1RS/a3qHpMS6D5+wA
 6Tma4hS+ppY3YGSzpkQp/8kbPSJjACli0Pd/IHEihspC3YAR4dYE8lKlGx7YVar/12YW
 KvV7BLBaR4ukKB7GbSSZerJU1EmOt1o6ZPT5nTkz8KBWUFQ9jHCsP3+Q439D3xyBaSHU
 z2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773757629; x=1774362429;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iyvqv2oeZF1JtrNEpiMY3HnJkSD10YJO054iHA654sQ=;
 b=NeINp8H5W3CLa7tkobot/sgjr2DaUxeBGwUkZIUz0eOLr9qP2SlVUG3sYec3Y36Q3H
 4xsdTJMmlOtDJTESGQInLH2OUM7C8sOAggiEmDPvTBSBcmKK2/mVeQsvXQBLxpsNf5sy
 kcDoiqT8+eKZ0bRCyhRcJpbwTNemQt3dHalDgLbWqpXQHiNOmRtK3RVWCkQVs5ZDvyko
 r4wGJvwhk9n8wIjBlCGLPS63x20QIAw0hke6qZ8YUVsTV045hXV+E1W1VbW3MC2qME3V
 PLtGTmIE3YWN35RkDYFWe5bGlOE+ITrGG+m93c3wuvpYaVejLBXPXPULkYwQnqLlHRkP
 leDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN5a2Pp3l6PiKSqZgA0dWEC6HLfxW4OG+OLwpw6bHZyZgAgH4dgdvYrkco6/S98P21YkJWMVJPSQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNKzC39WAav2FLQkc99+D62tlRmbNEjnXo545U2RMqPLlKPozO
 uZU2vZ8ETehOQ9pdNaEU8gDZLebGVvgfB1LV/C7MfZtPfpyiB7c+7k4t7nVBYaDXR+I=
X-Gm-Gg: ATEYQzyvUyxpnZMPyqmwjRyU0ONn/9RfOXCovogANChjXkdvFMmwsk1kjw088aNXq5w
 UZLX/BKye3d603ZscFZv700m3ehFvJH4rHsvJ1PRysV9rVnYWGcVVsfXHySjOooh9qftQvOEHAj
 ZEg0a7FjlAtxltZKIy4QJD6s0FWUn0yEqwUaWieqI6RCa3owL/Vyzg1A+xHy1wJuNvfofd4Oy4m
 T56nizMaOu37Lllw3PnWDNjnTTkH50AjYXXSR0NtiXMJkV/tKEmzQUmQqT+RaI+ULcCa2Pc1C8f
 yZOqlgM8iyMqBtE0ZzaHRbn/WUZM2vNiI7/zGp7IskPQP5X5Wm6M+8M5pHfUB684a4zzgETgULS
 svUgZ8yfQ3oF5+XXU1L2NdknrkMH8gZA/zPaoxd9m9MXqXUN9YIVopYuSyLbMVRVXRoRdkdRX18
 bFRFiqIJWRgQi0pSDb+sUqEXc=
X-Received: by 2002:a05:6402:1d49:b0:663:4315:7274 with SMTP id
 4fb4d7f45d1cf-663bac03524mr9294711a12.20.1773757629237; 
 Tue, 17 Mar 2026 07:27:09 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-667812202adsm424322a12.2.2026.03.17.07.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 07:27:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8DB305F79F;
 Tue, 17 Mar 2026 14:27:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  agraf@csgraf.de,
 peter.maydell@linaro.org,  mohamed@unpredictable.fr
Subject: Re: [PATCH v4 0/6] target/arm: ISV=0 data abort emulation library
In-Reply-To: <20260316025034.85611-1-lucaaamaral@gmail.com> (Lucas Amaral's
 message of "Sun, 15 Mar 2026 23:50:28 -0300")
References: <20260315034123.41921-1-lucaaamaral@gmail.com>
 <20260316025034.85611-1-lucaaamaral@gmail.com>
User-Agent: mu4e 1.14.0-pre2; emacs 30.1
Date: Tue, 17 Mar 2026 14:27:07 +0000
Message-ID: <87pl52cz0k.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

Lucas Amaral <lucaaamaral@gmail.com> writes:

> Add a shared emulation library for AArch64 load/store instructions that
> cause ISV=3D0 data aborts under hardware virtualization, and wire it into
> HVF (macOS) and WHPX (Windows).

FYI posting follow-up versions as reply to existing threads is likely to
hide your series from the patchew tooling and possibly the maintainers
as it hides in the old threads.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

