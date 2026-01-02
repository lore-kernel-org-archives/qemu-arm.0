Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C380E9410B
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Jan 2026 10:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vbcpw-0006S9-UN; Fri, 02 Jan 2026 05:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vbcpt-0006QZ-Rg
 for qemu-arm@nongnu.org; Fri, 02 Jan 2026 05:56:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vbcps-0002wa-9t
 for qemu-arm@nongnu.org; Fri, 02 Jan 2026 05:56:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so74620175e9.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jan 2026 02:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767351406; x=1767956206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRU6gSh3mMKteqWYhrDkKojuHknBG+ahgq/nZ4+EFEc=;
 b=FPFa2Mq2xGlKAuk0mwBYTWSS3itGkKa4i4pd1RyNW+oG+3cwEfAf49fuRTJmq6IsGd
 Wb5V0dfeqKqImsnKjJuEKIoYkShC6bBISjOXFYcGb7ndoTfn/XTDxh/UZpt9pT0b4Nad
 NeLTyKhtIK3CLfe04N0fEO5iDF3D6fxShVvxZBSwK9s9PbUWI2B34EC4Mh2HLFlRTM1f
 4dk+7/0lLkSiUp5eTjMKirew+CeSyx3dFBKhvXIEmu+y9oqhOQ01Q/6iZrwyVkexmxY2
 t4XBuO10U7tNf1b+T9cXBV1xXyso1JPorxE8EqxWZq4ipknbSqrFR+KCs3U5OJkD5OwD
 gF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767351406; x=1767956206;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRU6gSh3mMKteqWYhrDkKojuHknBG+ahgq/nZ4+EFEc=;
 b=Uhd4eLFP+0SinX/mxTlD49J5DOFg8EOlRaRWkXMS+0Sn24jKP7LQx0/XRcZKD7KArx
 oFTDFcCFZC6N7mDCgCY+Xkn4gHFweR862BWCuS13S8ruNpOwe9Y+ln6qW1mF6Qr87GvY
 0u1nGA7f8UeTc4O0wlBzXT1WGcUtdke5UnFeTt/x2IwitDMSLnt+Vk4UJE+GsYGu0ZjE
 27G0NKiLU3S2T4YvFQEN5tMdLGTLgplTwIOsL8yWwB/Abyj/gXaL/8V2lHKL98EFzg8J
 AWRhxYOiDd1LRJFJ5sWG3d3rqGVH+fZg9cFu4PTPiKeeQ547SwNG49Bya4pVhwMjduLp
 j38w==
X-Gm-Message-State: AOJu0YwVq9aIRXBfRzFjXr1/BqfT8paIjzNh5AJum5pfZODIRA5WT3Ss
 Muk0JmBGpskJsrFq2GX9vLLAS8fpdVa9taaEml5qQyxa15O75ds2PETShve4RhH/rt0=
X-Gm-Gg: AY/fxX6HsyTgn7FyDU4kbi+moLrDK6SMP8RM9kSCwf8Bicptu1/m617JXfi4nZZABEp
 Mz1K3NI0gUpCjnrBZkokyQX9bnNDFTT5JNiO7ysMqgopXQakDkuW3xtsFRKL170GJmcfnNwoV/3
 vKgy1+QPVdcraTVcsZ6XncOyjGW5+YFcyyYQAgQ3mnt/bvEDf6fwbn9EV71VE2TGMiBGk7rCdqo
 iGwiwDWNG+NafnkQXdL+zRziteSK3EbSzOfZkIAXafoGRQpvzLRLG3IsoOPxCT/C/BaeWYQt3wz
 glH9vKg9v3rW34h2ZFgyMVG0PZCB9IA3dphwknP8yhIYvrG/LZtIcc02znX/jd9QpZhRhMmTHw6
 WilA5j2hBevxxvcYhcwbs2qBDlTK5mX9KfrMYyiZIIdDM0L0RYFFzWYtJPp7TTD80BXCpAccJmG
 7UF05CMDWx4SQ=
X-Google-Smtp-Source: AGHT+IEgCFxfzDN5iaBCYLEeHQ321oRDyR9+ML7gyWOrcjniCzSGYXlBD9z5XE7AXKwpAwFHY789sw==
X-Received: by 2002:a05:600c:c83:b0:479:3876:22a8 with SMTP id
 5b1f17b1804b1-47d19555940mr532890615e9.16.1767351406586; 
 Fri, 02 Jan 2026 02:56:46 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08efsm84673261f8f.29.2026.01.02.02.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 02:56:46 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6EEA25F7FE;
 Fri, 02 Jan 2026 10:56:45 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH 1/4] target/arm: Don't specify ID_PFR1 accessfn twice
In-Reply-To: <20251231170858.254594-2-peter.maydell@linaro.org> (Peter
 Maydell's message of "Wed, 31 Dec 2025 17:08:55 +0000")
References: <20251231170858.254594-1-peter.maydell@linaro.org>
 <20251231170858.254594-2-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.14; emacs 30.1
Date: Fri, 02 Jan 2026 10:56:45 +0000
Message-ID: <875x9kxoya.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> In the definition of ID_PFR1 we have an ifdef block; we specify the
> accessfn once in the common part of the ifdef and once in the
> not-user-only part, which is redundant but harmless.
>
> The accessfn will always return success in user-only mode (because
> we won't trap to EL2), so specify it only in the not-user-only
> half of the ifdef, as was probably the intention.
>
> This is only cc'd to stable to avoid a textual conflict with
> the following patch, which is a bug fix.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 0f150c8499e970bd ("target/arm: Constify ID_PFR1 on user emulation")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

