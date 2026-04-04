Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEFFE63FF9
	for <qemu-arm@archiver.kernel.org>; Sat,  4 Apr 2026 23:27:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9AOp-0004PT-NC; Sat, 04 Apr 2026 19:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9AOo-0004Ok-BA
 for qemu-arm@nongnu.org; Sat, 04 Apr 2026 19:27:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9AOm-0005Tz-Tm
 for qemu-arm@nongnu.org; Sat, 04 Apr 2026 19:27:30 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-35d9923eec5so1742669a91.2
 for <qemu-arm@nongnu.org>; Sat, 04 Apr 2026 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775345247; x=1775950047; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Il1L2mfeL6LjxRgw84cjobckL4+JaKlEhePrj01OVqQ=;
 b=VBubYWDUI9aWoSuo4c1v+wnEtdHWLJLoA1MPoFKE4jVN2o4j4WQh2ZSCE5iU65laFB
 qVnkGscSupOx5vcNxj4RHhewUTZ8yqnoEnBJnUDIwKjqMMa6RvWhjnBYtu5rjjbl7205
 vxa9IU6HsToeyLsCg9gMoLhFkhoTFaX32xmj6grwX1DbTRO6wxGJccL9NrThFPvoV7n4
 deaBNDFbIkAdR43I/MmUOOdB6yf4vkLbP5M5PuaG9jmPJau9BjNsvaEO3PWIpNsTOyUm
 0jIIMRyoSFYZHZX+WcCw9JnT0PNMYqlNwhC82W1Z8nhXbAuiImAFkmpCzFKyV3ohNe+G
 M94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775345247; x=1775950047;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Il1L2mfeL6LjxRgw84cjobckL4+JaKlEhePrj01OVqQ=;
 b=nR+HGQuuoxpvnDssoR1BD7mF+koQbnPvN8SFHGqlATcB7UDdBLlNhswcsd0em9o2PI
 ub7c/H58tBludp2E9vVg//c/b1+jJwUJfj0k7+GuCA9lVgGVOeiXwse8oqzoXv03kqYY
 81nPaKOv/Wv3CeL5JZ2owqcLk7AB9q9PpF7fFOZneqSI4WybFjR8zv5TSA6o96caa6/h
 LghUokOzsVUEqi7TX7A/8mEPbsOf/7SgbpZ2Wekq03cT5CZKjgtbyNp2G3LNLuGdtZrO
 i62u3yBMMca+6FtpPI5fxH/kNhOl2Oze7r29XCv+6uqeGR0F108osu/jKScRGQC/k/ER
 uoiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB8AMOEZ+EKuBBbg/R3S16gppy38rJt8Ya5U1wRKgapdhHy8mzpLJdcNW++ZhjG/qk8YZx8dqEog==@nongnu.org
X-Gm-Message-State: AOJu0YxR09Dh32XpxxhQ+Y2zkW41S6xYNmDdV+I3bOJjsstyQDbuF2Yd
 Ga50adDctm1KMe+UbC5BmEncJld/6Za3OdGbUmUvJpo/UwXKY0ivME3qtmP9cX0kU+0=
X-Gm-Gg: AeBDietN3M9uj6Lpcp/kQ9BCFl0EBks5M8NQuOdp6gIaOq/WhGrOx+6i9KMH5RkEVRN
 HtSLDKMhRAx4ly94q4AC75ihraXul1KVXOFq9ElGNrpehDb1gJxJCBDgIE3IyCkDyYV45dVnJzJ
 o0fnIl0BNssGWu4XdOkw5qTPK6PPviAQ2RCpku498YxSUwL+M7AcjrpS1qnw5gDh+oNvVZJ6MOq
 /G0NHGBmG0r+9NAPckD2rKIrS1ri/cAytt5DzCavX8R0cKUWwhfZoiqmhkIvCtmLlBca7Y/0DyF
 oMF06QJwE574X6IF8u5Op9uJoQ2GzOIdlUlDvCQmGGP0BXGwPESIj7KaX29JnR9zgMK2nCWy2M/
 Rtr3KNmwpNWAqdv3Lpw5ArPhtYA5DmsCkeYOukp8/DXhGXAVbNdz3+WPHGnPipR9es9/vaXNAyd
 sR5WMZpd+ekgyDGch+Jan8PDnyce4zxgmd7Y45JlDDMNSGEekZsuWqInb8RpS6q5We4SY=
X-Received: by 2002:a17:90b:2b4e:b0:356:35a5:4a64 with SMTP id
 98e67ed59e1d1-35de6842dc2mr6931907a91.4.1775345247149; 
 Sat, 04 Apr 2026 16:27:27 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe624756sm18566834a91.5.2026.04.04.16.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Apr 2026 16:27:26 -0700 (PDT)
Message-ID: <e46477fd-ff3d-4c53-8f88-0980ce5aae4e@linaro.org>
Date: Sun, 5 Apr 2026 09:27:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] target/arm: add TCSO bitmasks to SCTLR
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260309-feat-mte4-v4-0-daaf0375620d@gmail.com>
 <20260309-feat-mte4-v4-2-daaf0375620d@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260309-feat-mte4-v4-2-daaf0375620d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 3/10/26 08:59, Gabriel Brookman wrote:
> These are the bitmasks used to control the FEAT_MTE_STORE_ONLY feature.
> They are now named and setting these fields of SCTLR is ignored if MTE
> or MTE4 is disabled, as per convention.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   target/arm/cpu-features.h |  5 +++++
>   target/arm/cpu.h          |  2 ++
>   target/arm/helper.c       | 20 ++++++++++++++------
>   3 files changed, 21 insertions(+), 6 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

