Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFB0CD342C
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 13:40:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKcTp-0000Ni-In; Wed, 06 May 2026 09:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcTj-0000Fe-FB
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:39:56 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wKcTh-0006zL-AH
 for qemu-arm@nongnu.org; Wed, 06 May 2026 09:39:54 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-79a2ee65171so67616077b3.2
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778074791; x=1778679591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKVgFAzVfqzQY9IEe4RfflolbrKsfqDi1J4nmML3MUA=;
 b=sjgalF2OhjxmjJVzhIWd79kKuLmtLyxfD5aNlJ/V2BDxKoVQbjTWW3HlqwWNtNf924
 2mlQ4kMHt29BmKZw74fx2+p2CyjXJBrCQ/sChewQEXkQXZdx5vkt7dhNCT/VwSoEVAr1
 rkiGC0LPlxE7+lShDpIpTzDYD7Fd+9zE/XLSOlaoEG2mAcIHgKjDoICAo8cDPAmCaxlC
 XYeaemKFQrd6wSfLvGiYRrDLaKxDRyfOJ5dcV76CnK/8fWeOLxlZbH/qgfKUDiWyU1CB
 yjKsQYVVBpCela56fwUhKeW0SlofCOPczB1AIALDqPeaHyIjpG7LeweB3JuF6oetxV1Y
 ILRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778074791; x=1778679591;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WKVgFAzVfqzQY9IEe4RfflolbrKsfqDi1J4nmML3MUA=;
 b=m8DwGmLGu0KrXlaR1E5V4DL294A3w0zDX0MPnNICAguURNQj6C2p+VWywj/YqqVkwK
 H1JuwbYcPH1/30rqGh5UF1oMNCvlw4XCnw/PmeNNM9htiCAlDFwLKd2JB+rSsyRqvJkU
 cMvWLYWIDlZYD+XgB8HSyEu5bVrXOW/eezbrLIAU03Clm7A0JGGyD1muHf/cgPKERsTH
 ZppG/V09m04Q4Wp0JBnqHcHnJNnQ8VM+1krmhMxy3JwUqJW+vYsv8Rfk08UXZ71SNvGh
 AQFGXkDBhMOokT38lvqp5UNAdZzwYeAQNoEXWwI3OihTewWFn7fcGv9ZHLOjgyIvZcrx
 P2dw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/e+Y7zVjdZ9yZb32EbDVjefoJKmJ3Kf/755QFGHA1Bu6rQsVHPssAGCzFCBqACpkgj8iw/veAGeQ==@nongnu.org
X-Gm-Message-State: AOJu0YxN3+THB37Rpf2HP6Xa883de0pIIN3feiPyjF0VFVuSp94RoIEf
 /ufOuEoj8Qsxk7Nfub+tu0eb1BjrHIqm/tU0f+XT+j1g5acjD4eTS6r8Nv9oblkuTR0=
X-Gm-Gg: AeBDievR3gNr1Itd9t69LwdJDJUSrEyduqjh3595jF2PIC56v09BMfcmwQqZ8/eKpeR
 3aR8uQY4K0wKV47sD1xApE/E2L+Wp9qsb1dbKduU6M+nvDzgYPoS1xaaWrHo/imxCVvr5OXyRem
 pVf/6OrnmXEPnbKj1Cz9AMfq86KbrGNExSTNQWuT36rQcamrQJbdljDcVu+5AJk45/xkMKeA1Jy
 n6c3GsD+gZ0t3Y7YQbUvHIHU2U/c6d2BuYB0n1SDPenzNUHQB56PfTgGkW2mNTqOy6TsdsuTND+
 1YjbezHuA82GwnQ+sPd1FXSjj4PejAjNPvWfOMfR4rrZplnG0fILlu4xySMeaJsqLKWIPcxCKpS
 QVe8OUMmDn/h63rc/lUxJIfgRCm3Qsbdh5x8Gss23SJWnRpls+v9UlTlroTjTOzXAI1rGaBmmqp
 Two+qNguyh34+6TZJfWrWMjVhxicypuMFXxOYLLpUIWp6FTTR2X5d4nKCY9bg/zobPJzyCuSkEZ
 h9sy/MdLtE5sQuLZ8GY
X-Received: by 2002:a05:690c:ed6:b0:7bd:5d03:dc1a with SMTP id
 00721157ae682-7bdf5d7f3a4mr42062777b3.1.1778074791164; 
 Wed, 06 May 2026 06:39:51 -0700 (PDT)
Received: from ?IPV6:2600:381:c938:6375:5307:cd92:1ec8:e891?
 ([2600:381:c938:6375:5307:cd92:1ec8:e891])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd66527421sm77820107b3.2.2026.05.06.06.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 06:39:50 -0700 (PDT)
Message-ID: <31bac9a2-e91c-49bc-ac99-0ba88f83e6ed@linaro.org>
Date: Wed, 6 May 2026 08:39:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/15] target/arm: emit tag check when MTX without TBI
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
 <20260504-feat-mte4-v5-5-232a648e63c6@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260504-feat-mte4-v5-5-232a648e63c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1130.google.com
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

On 5/4/26 10:50, Gabriel Brookman wrote:
> Previously, the TBI bit was used to mediate whether tag checks happened.
> With MTE4, if the MTX bits are enabled, then tag checking happens even
> if TBI is disabled. See AccessIsTagChecked.
> 
> Signed-off-by: Gabriel Brookman<brookmangabriel@gmail.com>
> ---
>   target/arm/helper.c         | 10 ++++++++++
>   target/arm/internals.h      | 13 ++++++++-----
>   target/arm/tcg/helper-a64.c |  7 ++++---
>   target/arm/tcg/hflags.c     |  9 +++++----
>   target/arm/tcg/mte_helper.c |  9 ++++++---
>   target/arm/tcg/sme_helper.c |  4 ++--
>   target/arm/tcg/sve_helper.c |  6 +++---
>   7 files changed, 38 in

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

