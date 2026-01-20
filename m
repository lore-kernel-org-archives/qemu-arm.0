Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F7FD2ED0F
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 11:02:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi9V6-0004lx-6o; Tue, 20 Jan 2026 06:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9V4-0004k3-Rj
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:02:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vi9V2-0003L2-Tr
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 06:02:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso6972425e9.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768906935; x=1769511735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xSG9PX+BUEW13FzyKteNKhsD2RRqb7YazOQZIxP/CKQ=;
 b=eVbpLSEfVxri3nXVmttJ6ajHA3bwXfSeu2I9lH3EqrB/sUb1TLvIb8EAtJ/hlMb2Jk
 /Pg15HkvloIop5A1y54usic36upoyiBOuAQHl9mqLJx27TxIKGXlO6KiBan7uXRxoawC
 VyqG+mI4vVV71Qh3SU48fFncCtG6Xb6nrcNdoIA+y+OEI8n2K9je873ZDI/8t+uLQpI6
 88Hndp3oHwvVquSoBSvXhnV3djkQDoTtkWiPEQ4rYZY+e1Ror8jwxg+Veq4L16MsP5JS
 etRBTFQj4HZ0/7570Mn0+Es7lUdxNY9hTGGeXs9MjU4+JBpCV1hzbOqaj07o+L1XWhSu
 I7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906935; x=1769511735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSG9PX+BUEW13FzyKteNKhsD2RRqb7YazOQZIxP/CKQ=;
 b=Ph8Ntp6YBlX8Fc8svPpEHZqpUioLgvqkEwXh1MMi03hfj79A+IKd6h0n1gofKgdcKn
 ZaFA1ghF5/0fXFnIo3kieh5h63WVB/9bD01aE+gV20SwVV7SiYLzetCDQMZDE5Jqwhvf
 ZzCz8yD6Ho/IX+ddQRT43uQR+olYg4pEeXENWkzwdEtaAodcqEJ76Hh+XjXB8Hp19MF6
 apcP0SNhqTcn4YDAl7GKyPTwN9++bcsjMy6FhUcxTCcQWztpi/zgJ2cjRe205v0igrnI
 Qz600guSQ0ferBlTFe2Y3VrisjE+XXPF8v/gtm/tIV2NzgS3iE7WY//FqsosBJDWYNau
 +EMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQhw8yTC1ItzJtwP5Y0Rziv+rdHd/gpSuRf4GlUr0a9h8RXhbNfwKXJ8VS+M0szCKci1PITRdD7A==@nongnu.org
X-Gm-Message-State: AOJu0YytpCqaa/LpWNsMYwTQ4ipMUcd1KQw7NyJIplC6rR/G3AaVTvwo
 Qbrj4pyYyzhqieL5zMLtk05NdOreBM1VQBPRMAMvPF8mFQUwoyCon1ladTlbAq5B2Mw=
X-Gm-Gg: AZuq6aKws8SaGGQdf09M7SBzYyDZTfk1cIvX2ILtcONOBMriRR5SbN8DFMi9MuHh1aH
 PIN2eUEs0yF2tnEwRplUiP7ZjUNufo5QA3Dma5IHlsCQg3igObF0RRlNoJ8GRDQQIWzmW/DrzGA
 H6MEGrDKRstSk/lQfzdWCgBiNCT9ErcyqYpHnCyExH4ADUm1VQyacqhMK7MNBfKbppoL6mTI7kw
 /kazfIcp61KAQALr+zZWu0xqO/D3S4C5RufLAxOfxAUqbPtnA8POwMdxbZ1ZCDncHijZsoRNfWd
 RBfJVtYbWad1AOsyabfscjRkL1LpOlw/gQfWsoknVnnf8cYnGiSz5tUSRu2bbSw4JMtMwoWUfjw
 LyMD2uJ7rREL8BlM7jkZWQRpWnNYtNulmqfvPg5qJcy79ZCBAfSWsCJtp8tfzctvRTrPifQCN6f
 Laq2e75k8wO85uuUIAW9AmaZmLaJGyH0wqb2A1R5EBdhGn79kK0/cjCA==
X-Received: by 2002:adf:ea0b:0:b0:435:94aa:df3c with SMTP id
 ffacd0b85a97d-43594aae27cmr971722f8f.61.1768906934862; 
 Tue, 20 Jan 2026 03:02:14 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921facsm27509337f8f.5.2026.01.20.03.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:02:14 -0800 (PST)
Message-ID: <bbcbfa37-6d13-4c6c-9c14-84975c13a7e4@linaro.org>
Date: Tue, 20 Jan 2026 12:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 19/26] hw/arm, accel/hvf, whpx: unify
 get_physical_address_range between WHPX and HVF
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-20-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-20-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 16/1/26 14:52, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   accel/hvf/hvf-all.c        |  7 +++++--
>   hw/arm/virt.c              | 43 +++++---------------------------------
>   include/hw/core/boards.h   |  4 ++--
>   include/system/hvf_int.h   |  4 ++++
>   target/arm/hvf-stub.c      | 20 ------------------
>   target/arm/hvf/hvf.c       |  6 +++---
>   target/arm/hvf_arm.h       |  3 ---
>   target/arm/meson.build     |  1 -
>   target/arm/whpx/whpx-all.c |  5 +++--
>   target/i386/hvf/hvf.c      | 11 ++++++++++
>   10 files changed, 33 insertions(+), 71 deletions(-)
>   delete mode 100644 target/arm/hvf-stub.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

