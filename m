Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A929DE6781F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 19:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXlsd-0008MP-9T; Mon, 22 Dec 2025 14:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXlsa-0008LY-Ox
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:47:40 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vXlsZ-0004ah-0N
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 14:47:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2a0834769f0so42695925ad.2
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 11:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766432856; x=1767037656; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYV0aVpU4rrQzfRHRMr5FT+FlJ9gDMOP85DbxKb2qHs=;
 b=ZQGlEMqQo5EmAlcMVm1gwS1Z8jX14t4R/i5YIAdaHYB45bk/DIQf5YfgPyqcPYxLXj
 +iCwYc+MPmoJUB15VbX1t5d4kkwBdHoeks3RsKMqBxG0OWAqrPmjoIiYyCjVdkSbD2Hw
 Voqx9ohtPfTTuZdMejjjUHe7rHdBhIeKKIXmCXUHfA4550/i8/Ka7Eb+RbTUUsR1WwS/
 r6xdLZkblKn/ANMYQVZKGWUMGwrwujYQ0Nvp12ncuhGm7aUMFg+PFfinfMZlB9Zw6hvk
 oxQ676VhJgzEVNroea/Oersnqtfvq24nOSrgQZjJphc4bQ2OCaGnTCEgQL4ca3NCLLm0
 hNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766432856; x=1767037656;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYV0aVpU4rrQzfRHRMr5FT+FlJ9gDMOP85DbxKb2qHs=;
 b=M9d+9jDEj4e7b8csRnc10U2chNESig4VwAlHSvQx4KO8+usHP/OxpqMx1FHsHf4IHS
 8QoulMdYuGVXVVsVyxa8Of0rPUQQPryNdyOFefU3XQleq+JaxDuGHRwNxm0A/FoEJimR
 n2CeWgMelVKlHOIQLvrhNuMw7BlbRhv1Wkgo5qkW420wwExPYb11Feo2BZINlqrXx7ZT
 q0wgmwbAi2Xz+YbS7rBhnG5w4G4xSrBOAUx/ydXIDCjSTDFS3FjwG0yEKcksJHWzIZLK
 2LdhtBKcTloLI43KO7GhVfkxWmgUxEPZNqCtvOMnfxip7kK5likctDCn2ve2Jft018tH
 t1Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFI7obSV+dnq/xOFOW5+0/wmzjuLa+s61zqqCW+DppSqroAxsOKJ4OI4n2kigilfTpjPKjy62rVQ==@nongnu.org
X-Gm-Message-State: AOJu0YwconDQC4YF/NO+S4TRJp3Fb5UuEIckjDnZNpBL4mnvS+EUUCNM
 91HJj+yOGXXkVMxwmUrkqRDisW5zGPgSf+qBe1rnuU7VMBPXrZhinIv9q2ytGHA0yd0=
X-Gm-Gg: AY/fxX59n3EYctAhaRvhngASxhVXJEPq/hI+hR2CeEcI0in8bfdLbdXqxdTr5OotJ4W
 r/+VS7WtB2SJXL3M8JuzXJ4Eky0IF1OJH4KM4z55ud5jfyM2Cg0Owo1D+Huz+YbU8zAPMmlAyyg
 gs0y1Y0bbX7J/Va++kKqkMbJjgGEFXJrHOmR/qXTxCdZBOJNPK0I9wDXDFp3cf+/Wb/TnZS20m7
 GakMXuH3imuvawvvKKbFAXwwLpzbA41OdMVIvXLirDHOGzKAau/N+7mM2JKXBCCjKCy34HCabbX
 zUoOY4oRL9QUDMK+Owuh+uGIF0KwDoGSh5WmD3P2mChDuUyLBZ/cSos0fwBee+ek11IvtUSY5Il
 erWdRfzmOXm0koBPzAh9xuuO+swDOPE2lZAGeK4/StTZAO0ydbtcd+8FVhCaVBDFsTcp7ivigYL
 GYvr39IwSVYDMNwz7DMPuMakFLe8lpgNF4g9mzxJSlP1Qy2lSaW/4QHio=
X-Google-Smtp-Source: AGHT+IHEOSoV+Bp/Ivm0QKN288n/13JhHQnOQGCpK1v9mBdZBSxz/D4xjuxdwPgcrrmaPXEvTtk/PA==
X-Received: by 2002:a17:903:4b4b:b0:2a0:c852:5f9f with SMTP id
 d9443c01a7336-2a2f220552fmr131430745ad.7.1766432856260; 
 Mon, 22 Dec 2025 11:47:36 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d77359sm105820585ad.95.2025.12.22.11.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 11:47:35 -0800 (PST)
Message-ID: <7c8fdad5-90b7-4077-86c6-7b68eb8fddb2@linaro.org>
Date: Mon, 22 Dec 2025 11:47:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] plugins: shorten aggressively long name
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mark Burton
 <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
 <20251219190849.238323-7-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251219190849.238323-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

On 12/19/25 11:08 AM, Alex Bennée wrote:
> The old name comes in at a 51 characters, contains at least one
> redundant token and exec is arguably implied by inline as all inline
> operations occur when instructions are executing.
> 
> By putting the name on a substantial diet we can reduce it by 15% and
> gain valuable white-space in the process.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/qemu-plugin.h    |  4 ++--
>   contrib/plugins/cflow.c       | 22 +++++++++++-----------
>   contrib/plugins/howvec.c      |  2 +-
>   contrib/plugins/stoptrigger.c | 10 ++++++----
>   plugins/api.c                 |  2 +-
>   tests/tcg/plugins/discons.c   | 18 +++++++++---------
>   tests/tcg/plugins/inline.c    |  6 +++---
>   tests/tcg/plugins/insn.c      |  5 +++--
>   8 files changed, 36 insertions(+), 33 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


