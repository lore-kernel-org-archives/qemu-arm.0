Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA20C4451C
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:36:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viWVH-00063q-3J; Wed, 21 Jan 2026 06:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWUr-0005rT-A5
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:35:37 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWUp-0001dm-To
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:35:37 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-78fc3572431so67610547b3.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 03:35:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768995334; cv=none;
 d=google.com; s=arc-20240605;
 b=dFS5hwQrETHLjWnwQhlLFw3pFthtoHlfJg7s0CwzZAaYpZ14WQVlaGHRQCW6NSZ+kG
 ONOP0aLMtCRrTSw/T3iMi6mdE4UsBe4Dfl1s0g+yDIevaUeckVDWBnoYYOfFFZz/tPLf
 a6LaNkWLxhWH7dZFcwdDwDIVSWDSHJvcmU2o4719wh5uRImkWBgQmP6hXiNEnMmVnTTA
 SDC8s548i0Y7qtOHcfDpozPdGGem3FtKBY/mslDVH+6bKuxrecNB0oNgqx4t0Hyw9QSc
 LecITidrgdiI6pgjijDEX4MHdR82YiNp8vgON8dD0jK/P/4q67hq1WyLbWjZ5Dg9kfIF
 cuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CTXGStSvmm1yjBO9Xjutw8UK+wBr8b1H6oZ0poQIm1I=;
 fh=qsHnIRqiQJSRNumOxdpXJro3KazAb5QZwFrEh4hv1PY=;
 b=A/S1j27vOCv/zmGQGyvZBuMDckCo9eiRVerW+DT8hjqzoVNEyl8yv+1ZdmREuYsbfv
 CB5QyKQOAr0Rs4JVAPR5lC8sPrMedq9+PrViZWnldgjBtqgTlwmxTwarx0hkrnjdV4c3
 P5rqfyfjOGlKZNjmRJi8HfFtWjGgnbAnflqARCPdQ1i2TtUcZc6KyIZHKWJj46MbX7jz
 UDbCVozrVaPZvLM7zLyebA9X0M06sfnTebESdmH/bRPsboD7t3Ke2v4McERKpNAkkvFP
 +t9RAFmRaGz/0eBSNpTB5iVXZBWuN/73piOpPQeyEHYmpL8kKjxSJhdHl4lHP3XRpljs
 s4lQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768995334; x=1769600134; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTXGStSvmm1yjBO9Xjutw8UK+wBr8b1H6oZ0poQIm1I=;
 b=RrHO2Z0JiarAdyrL7F6Y1Nmesh91uo7dgKJDqmgKFvPx5ojAKeWW9qh+QWJsZaneah
 F70+IXqSNKN8M2b8nY0eDHCQ6+ngn/Zu4KBO+IldTBdeB8LK05GTKHBoCDX0+3EpbcYc
 rsWYPiBHdySzuLHx72a/ImMdXJpVNeEpvlOzQSMljsLRJNicinqQ1hYv5hagZSx2s+UH
 k8DhSR7qrZJDvumh7pf1W1wukM6HAgbf05emUWLvAhU6byIq1HivmkBllZDhxa94uiSf
 LnuQQMNgad4BOPELJ5BEFYRZqQHsWbg09DAE9AGBWJJOhyYu6RmB0YQMJupRsApYCWfx
 er0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995334; x=1769600134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CTXGStSvmm1yjBO9Xjutw8UK+wBr8b1H6oZ0poQIm1I=;
 b=OzCn99HWCef3At24aTdvKTMaVNekP1bJQMswdGbI68D0xev6CoA38pEBNMRLG1fAVK
 tSCEUW/SO2r9CjYdj0AK1i+64z80660jDVruK0J59Fw0TdSaF2qf2hRYvVffMVpgev8m
 KmrGyclS4Ephpe2dwh+UKv/TT53fHZzFmxMvwEX1YjdjRPpV2iFwRjJ30d6kimjtg3/E
 oPeCbiMVWEEvUV2OhACWtZ/3c3LPb2w21FTvJl8RqlPCH476lGjmOH1QkBxgvJqW9vhD
 RCfsejivUKVnAX9QoB+qv9GQS7qhUuBJ6Oj75o9Zm5y1TOMYcKIngk1g/O8cmgzyWINB
 rUrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSfKXAQoJwFYu/aznm26PlviPPyyHfZWh4189YIVdGZ95d1KtpJl3ntctBe22vgHqTU7u9ZGc1Kw==@nongnu.org
X-Gm-Message-State: AOJu0Yx10fFZGXYSkvv8qhDue5HNSxGtzzAlLppoYSYC2rZT+zehVAV2
 DX1UYmxMNKKRoudjGxWCOr9kpOHVryfTu39j2M04/MPezLNXarJsczBgaPgVqqrlOLtKQrORib+
 F8LJjEFS3qx9JMvC/ZMSmWoiQ6Cx4srz8T7aHsgnwMA==
X-Gm-Gg: AZuq6aJMtm+XoIs3cSKyu0Q0W3PyhlZT9jJbselxjtIk2v1vOKV13eXjS8q6BF6Cu0S
 rBqk+Flxoqbg4MshPU+nrXAmIPv4RlUK3dVRAerIyrLV6J0HQYwWpVC5scpRc8VexYTcl+uipyj
 iozCaZCZyLMZBDgWT/HioeTHaG8nS8sXBh1h+dQghyHNpcVVd+myCS7VSDHH20ZGlROitT+22QM
 uH8zajiv5X2Yw9UA7+2MxoE/1Q5uvPX77hxQACOVe5fR9cuG8YRE8UVXXI3P5V3bo7BBi7oTqxp
 Q89S
X-Received: by 2002:a05:690c:6a08:b0:788:c21:b05c with SMTP id
 00721157ae682-7940a48aa91mr42179337b3.63.1768995333696; Wed, 21 Jan 2026
 03:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-3-alex.bennee@linaro.org>
In-Reply-To: <20260121105932.135676-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 11:35:21 +0000
X-Gm-Features: AZwV_QhdYF7RNzfudv_Yo6xtdJHYK7rGmuCbnFW6W2vq345xErmbhGyC2qQ03w8
Message-ID: <CAFEAcA8L7afLEPCxrjvPqB-pxfY4crsa-w8KmmKGHnAgiWrqVw@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc: declare GIC regions as little endian
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 21 Jan 2026 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The GIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. This should have no functional effect as the GIC
> cannot be instantiated on a BE system but will help the single binary
> efforts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/intc/arm_gic.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

