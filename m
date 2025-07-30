Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74608C83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDyZ-0005Ea-0E; Wed, 30 Jul 2025 17:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDh1-0002vj-Uh
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:46:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDh0-0000tQ-Bg
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:46:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-24041a39005so2131315ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908388; x=1754513188; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vmxPo0A8bpk2rMpqYh06maGbBOAmxC6y6Nx0uRuVuUc=;
 b=zxaUPMHktBiSzysWr+WUCGYrJi7j51j1jNpob7lVhxRogvcMHR/o7dPiUcJ7mfOHSh
 L/Dau3ZMVxcwaKL1NfZl3WH45M5l567M47WE9/XFzhGsdSosl0+twdCVutIuloKKbFNM
 lCHsn18RS+kzfweSq3H9cSssJuxz2FplaJb7fsYgcxSk7ZXwMiQSWVLRc2Xh0m7cecoQ
 ePmwh0oxodtG+74hAXKLWposaSf/BnoUFWCHJ7b27qAg3oZAGT1UHhD/wqG5K6mqpWuT
 hl7TKskvhZ2p8bTGBgqmwJ/mTN7HpklZ9YSb2B4AfY1dV8oVIQ9+qxEKI8bfAbioLpKI
 XnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908388; x=1754513188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmxPo0A8bpk2rMpqYh06maGbBOAmxC6y6Nx0uRuVuUc=;
 b=Oamg5utgfiDnVTu/ytc/gYxegT5brquTJ0I/gROOfEnrqqdCXqjjeM34zsvM4BIf/B
 BaBgS5JGvO/O/aJKdmuJACiv5gzjISLaixBl1YuTKnfosqP20JHMEgqqIdQ4QDhcLh40
 7t3L0I3PZKYSq0hY2FTRm3cJtUCK4FWStSQ4vO2O9Tlcp2ZCqrUKL/La46fnbcjwkil7
 +LLDQdyvyFtuXYd5i69WoyCCSkJLsn03W31/ND2HU8HszfodMAJCeRZ6/Y2ZJPgVgZb7
 XveUGgSJA1gBWWuafzJhFEOdm+R7XOlBCDRbVoBpuZ0+SQgzkVu1WJwV0viNbIECprH4
 pfgA==
X-Gm-Message-State: AOJu0YxrMmAYh/PsZbo8k6ZVJZDPiGR80TdaOSPdD0KUv9rTC0eLNVtK
 Nge/R0MKTaQ3q+cYkIUaYmvBNalW8xGGN8aEZWbgoiq39nCr1N9NvKvYL15BRTD6Sug=
X-Gm-Gg: ASbGncuCYRDYiK80F0DopShBG5b2w2ea63UHO64czJC1f7kOM5r/J/tTEfQK6v16xNM
 viG1Vj5gxftVWzXnctnQ4/TC/swxtUB/5lOXdVGTrT3yx/GA4ITJALfDNZX9vmZ7zgU/HG8Db+y
 ZX3MXfrZW/8ETaA9tagBzEb3b+aj6hA9AQ6UQ1ngPGorhSSkYwf8XYg6g93HkVUos/KodqHxdD5
 F3O603d2nvkYFjdaudU8yybCXJvxu1NHjdgUefXAjQsSibYds4TgZVf48DgRq3OfsnEmSqBXnpq
 JgvcB+AukXDPvnLOLftp0wP/xCv1PiZbI5Kn9aydgiidljN3RJwTN1ChEVeiZmMHIzJeI6DRTPD
 sb1NCYluHi4XJcGAbo+zDRerxWQ9mT/+/8Ro=
X-Google-Smtp-Source: AGHT+IF7CMFgC+ApnYdNjeIbhixHt7kca5nAs1AV/UKqeTi2OLL3bRAvZL9AGp0LUhEvNQUU/hPnCg==
X-Received: by 2002:a17:903:1a26:b0:240:887c:7b95 with SMTP id
 d9443c01a7336-24096ac57c9mr77548845ad.5.1753908388560; 
 Wed, 30 Jul 2025 13:46:28 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899aa1asm91845ad.122.2025.07.30.13.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:46:28 -0700 (PDT)
Message-ID: <b5b2a7cf-d083-4a50-89fd-32e356288708@linaro.org>
Date: Wed, 30 Jul 2025 13:46:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/82] target/arm: Do not migrate env->exception
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-19-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/27/25 1:01 AM, Richard Henderson wrote:
> These are not architectural state, only placeholders
> between identifying the exception and delivering it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/machine.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


