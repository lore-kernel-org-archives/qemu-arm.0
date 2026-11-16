Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927A606A323
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OUuvXSVN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT1q6-0004P6-B8; Mon, 16 Nov 2026 13:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1q3-0004OS-RU
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 13:53:59 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xT1q2-0000G9-BS
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 13:53:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso3684696f8f.1
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 10:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794855236; x=1795460036; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bsHRawm3s8PBxNWetjMw6HAVt2xlFOc5Sp4jfSBTOF0=;
 b=OUuvXSVN895dxXHjkWOYkKpAKuSVAJVkftW0N0wuj7bTAAaGIJHtGfOZrRndlqbTGi
 0QikRC6+72Aa0kt3sg5XZu3y1NHlab/uLzzXh4rrI9cN4QKN5IFJtaxnC2rjlrs9k4Zm
 XqDNS6Xr5f0GzkRLO/QTfNPdcslyjyKjkBGFNpP66ja4LbidmJ6C/kH9dc2hdVXXYhFd
 ck/eJawT92nnayeVq8YEcBigyPIPkgHlI9h7+ov4psOxvbuWrbiuUOEecO0Tr0XLNg+j
 3DmF2f0hzjR19KkcMaNyHGUuMMf0VUNfHmA5ZbbyyqGFKndhoWxrSMhlyxbNf9uNq3AW
 Ce6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794855236; x=1795460036;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bsHRawm3s8PBxNWetjMw6HAVt2xlFOc5Sp4jfSBTOF0=;
 b=g1hk/zE/gcpZeOeo8ITlnLuV7ZzUKqhMXsiMmUbes/Am4glGLKY3F2FJUQaQT/e6Oy
 5HklKLaQFUSprSjOmCvekiRTItn/iJDXwKyEh6ORQR6K0QW9LdiSZmEMFjIL32x+cHZY
 aBnZdhXDwULIX6Rkj9CeU7smRIbpqioTk82XZ4EcCBv8sRgzaW4zpSUandvgKgcFQizm
 qHF82/WmPekKMzPRwLVlUh9ntZfy6MGCIaUts2iOmftg5Udu6gvelJ5xSvDSNI4PEL7X
 qlENmcP3dkNcQV0byxDHPV80yFsg7vIYsYmp5jQoBh2y2hr6QsolhnLl+d/GR0kzlowE
 oKjg==
X-Forwarded-Encrypted: i=1;
 AL+hErHLC1DLgXKidHjv3L/pr8a5q5WiyhxvxYXnVMND5yxfwjKopeD1rIPkKHJ87Q/K6G8yS3S87VBP3g==@nongnu.org
X-Gm-Message-State: APuU4Z/GnmumqFF95QHETrO105drxXaHfmIS68TthiRP+jwxuLrfLUIM
 XF3cg8dPTyXgVevyyjB+vUuncjLjIfA6yKZRwAsfgE9o57de5gxSdxgK2pGfpJop41M=
X-Gm-Gg: AZFdTZf7xyWoX4CxWkAVGYJuAQt1gIE6BeGZfta7ufcMKkw2cKhAyGRaExbIEqXW1KM
 j4iLeQjk1j4k/gNrD7pvm+JRJ+f+67WyEIWvu//R3VJZ93SB5GmamhyBP+Jk6h/QIi/n1+gcRYC
 aOWwgqp+wAxNupZ3oKzJlur+vLB1dlsm+kcxIFHycGB8Brsg/veznYlP3MkXVaMAHaOlixD2Nd9
 2eXV4LqTGzFQkDhG6esgGX2yGyXV+BN5HqDYiCv7sUNc7YgvZG0HjwS/8rgImpJblY2zrPDyn/i
 w8QunmEMM+WoqQbh22vXH1LryzzwElAiaMkzrgVjOeVk7r3aGIBgVG8N+AYWzFpwy4CAX1L46k2
 L9Cmbuih3YwwGunTBi78rpj180tp4h4BbpxShxkvPU5oTbNNcElEVESL6i36EV1GKsAJDPofsqQ
 aAxXOO1UTYdHIATIyjqGYcPJOYmmFZETLj6yPfR5DfwxUheBqTAcK9cFD9tPm6R/ViPRuO9SpMF
 gNJe+0N1EkKeV3n0AxRQtz8bZkKu2/0+KrBJhQAhf9rTtWltT7+VqQhgGaq1Pm1jM9mBhI9Lo2R
 +B+Po0NtxGMDhVUgd1sBplmPPkgo
X-Received: by 2002:a05:6000:4a03:b0:48e:f10:ceb8 with SMTP id
 ffacd0b85a97d-49c6fd932fcmr23863250f8f.11.1794855236034; 
 Mon, 16 Nov 2026 10:53:56 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e31sm20598177f8f.19.2026.11.16.10.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 10:53:55 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2AC005F8FE;
 Mon, 16 Nov 2026 18:53:53 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 palmer@dabbelt.com,  alistair.francis@wdc.com,  liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com,  chao.liu@processmission.com,
 peter.maydell@linaro.org,  richard.henderson@linaro.org
Subject: Re: [PATCH 2/3] target/arm: Fix RCsc ordering of store-release
 instructions
In-Reply-To: <20260821064032.49556-3-zhiwei_liu@linux.alibaba.com> (LIU
 Zhiwei's message of "Fri, 21 Aug 2026 14:40:31 +0800")
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
 <20260821064032.49556-3-zhiwei_liu@linux.alibaba.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Mon, 16 Nov 2026 18:53:53 +0000
Message-ID: <875wxwk3pa.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> The Armv8 memory model has no RCpc store: every store-release in the
> architecture, including the AArch64 STLR and STLPUR and the A32/T32
> STL, STLB and STLH, carries RCsc semantics (Arm Architecture Reference
> Manual, DDI 0487, section B2.3.8 "Acquire and release semantics").
> The architecture therefore orders a Store-Release tagged RCsc before
> any subsequent Load-Acquire tagged RCsc of the same shareability
> domain, which is what forbids the [0,0] outcome of a Store Buffering
> litmus test that pairs "STLR X=3D1; LDAR Y" on one PE with
> "STLR Y=3D1; LDAR X" on another.
<snip>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

