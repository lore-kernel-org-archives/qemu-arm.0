Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8529C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliIr-0007kV-AY; Tue, 12 Aug 2025 02:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliIO-0007J8-Vq
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:15:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliID-0004si-H1
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:15:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so3094892f8f.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979325; x=1755584125; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAEMNR4UKt9hMxT0tjClDsiUUMNdqUhcMcchVHFleWE=;
 b=M0iiiYXE/Xck8zfN1B2gPOvDWLD2RTjdxMd1C2UrqFc4sIomlJTabJWSXwzdz/ufQw
 tfHtxsqeYgy5Gf4xur1486lRlld6ba+OoMu4aXrjlMdf6G4v+ROqV+S1LUhFGX5piR5g
 UrRyTX0CjKjw/ppJVkGfvxpIboUSjihBIMNMWSjIeNNGKVgD/8owO8ieIzoM5hIidZMa
 pAblmqHnnw2u3iRGqUqzZ9ZP+fu4nhNuQjp2KRRSvcciC3SlCfZoV6tgZ27pURMsoxm2
 JvSW3p+kPCbycu0UuRtn0sYFe3JgkM98Eufobr7+N1F2Y17GsenA8O49+KNdsMWEABVY
 SGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979325; x=1755584125;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAEMNR4UKt9hMxT0tjClDsiUUMNdqUhcMcchVHFleWE=;
 b=v00ssePp8sri4R+rJ7q0afk5Rin32K2GJzaCmHmPcygYQpBhULA4I13ymlQAxCqOMu
 isAGnUF6yuFMtOzl1qIXOH3UoUrCDrtNqExR0aHXbGC24XDUf7jaqnNsxwg4GvjcBQi2
 XI/aEMV8fZt8YjuAPOJlJX3ldwqtd6sxOTLiJ4gKEdeVtf4uxM1ld4VItHdpHFsSnERc
 7/PrW1KINDHaNiI8cBu2zkoXYt4QeujS/knj52RF93T+zLUJ5aoxWXhVWaBIoajZSXzt
 FTgqc26ATagPc948jIgZichlA8Lq2HbTdagcvr0sGpo3li33NVsaRpoF3KMRuDEQ4azd
 +BDg==
X-Gm-Message-State: AOJu0YyS5PPcZpGfJOEFRXmZzaYdmnyHm/6gGJtwvHM1PwmFFfqSA9Co
 UP5Uqi+4RH74Qta07F09+BK4VKPpVhY5DqCCYgEwwm2gskmFaGH0ortlDJhre10mceE=
X-Gm-Gg: ASbGncs9KqMnlQYpf1GxsV9BPoyHPqnSIdSWafMxeqZFBPfxLgSWt7ASzuX60bWOEqJ
 1DWhMzxbMsYICQklFrV+SBAALrL5WKds3YYxPEIV1rEz9J20tTbwZ9WLv4kgb2kxyl9hnex9WYh
 Rok7xnad8lGq1Y4zpu1Fjdib/slQvXgnmkBCygJ16XXA3LmlPo/HMisGbnpSAmr2MuXx5q1XE37
 gBKfgz86eYRehY8MBZuVRq8IuXe+Xb3X+wT30b3sK2mGbp7WpEIh7nGVkDnlO1F0YfaTvqYVXO/
 iUAHgk7exPgUY7v0R9WxFQyh/wvH2jvaOSz9VjgGQMbJCiY6iyQppg2SkAn/3zCgXTDuqfLK0L4
 8E7q2SDYi6xk2ltqd2kOeZBDEOzgRwtVWYuHbt6PXo53pMfuvBS4W1LaSl11O7BaycQ==
X-Google-Smtp-Source: AGHT+IGXGRVTMoRaLoZrnK1hSDxHKmnt1OBDhYL1ZJs2OpgTk5sc+Q1nc/j3e6R+oNc98cpqtDzmwA==
X-Received: by 2002:a5d:5f86:0:b0:3b4:9b82:d42c with SMTP id
 ffacd0b85a97d-3b910fdb252mr1777167f8f.17.1754979324721; 
 Mon, 11 Aug 2025 23:15:24 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de91ea4csm337087345e9.10.2025.08.11.23.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:15:24 -0700 (PDT)
Message-ID: <812e4a05-e143-4858-8c14-eac40368499b@linaro.org>
Date: Tue, 12 Aug 2025 08:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 37/85] target/arm: Remove unused env argument from
 regime_is_pan
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-38-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-38-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 3/8/25 01:29, Richard Henderson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   target/arm/ptw.c       | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


