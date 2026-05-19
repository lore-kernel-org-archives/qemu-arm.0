Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6043CD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 16:41:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPNV0-00084b-V3; Tue, 19 May 2026 12:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPNUy-000844-F5
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:40:52 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPNUw-0005o9-TB
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:40:52 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b941cd869cso23169085ad.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779208849; x=1779813649; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z9EOHuMQ1fN0/5l8TzQ/RHCs46XJPcImQQNyGnMI3NU=;
 b=G234hMBlZgCC62r6t/39HJP75WjiGjiiZZ5saw6dVb2SHYjHwZjlDJFgw3k7SKFyqw
 Y5HojS9YTYXGC8CJKD9zCHBKv4r6emMpstpCOAGW1/6yfeYTdsfU4j7OjiaJl6Hunx9B
 U5lpqvCa3Hzlp3DBpE7dD7leFc3PbFfBglzPdSyrhGJg27RbK0r1bm9c3b/9LEvxyV97
 TD0u5iichg2SM4dKljBMaQCcDCTGk/CP+7w9eh+tnxtFui+Bj+R+yP35HGdWHiENALk2
 U/4eURqYuhFD26BsUo/7ZsdHwNVoiqOnLe4kZIDVRlKGigRafwtsyULKHUAS3PVbcZZa
 9ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779208849; x=1779813649;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z9EOHuMQ1fN0/5l8TzQ/RHCs46XJPcImQQNyGnMI3NU=;
 b=FsWzvBUoX1zn0w8nCkQVQVeJCb2zMfOoqDjvJ7GWi5OU4otR3c2nhSIJOPOkvRMFcd
 0tKF0Hzl5qVOt/wRAGzo6ShANxTQaENLlRqBj3IhMXEGtik95M3VMRqJ4ZhvnmMbOWXk
 E+FB6CtiOz6ITYITU9Zcpn0qTBNmwPe1QYoZCBn+pEWFmuvIRVRZE7bwC9vjhPgYcEY3
 eefGt597e/6d2rHVD/zbvQTTAYK1w/9BFI0BnqlwuXmNrCEwBNazZnOET3UTPxRDEwxq
 K40LKsddaSemODOmp3R9I/O/gtGMJHsKRvZuCRntDWnKYMorXuCKWtZZTv9/qDiLFin2
 31FQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4ZMVW19EcJ0/UGfzBIJ0N6wl2Fw7SlOa43RfXgHsHnQyoG8e5NZk7a6glsd8A90w+4Xs0EJpefg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/iuTXumH6D6zm5nzq0Xu3vSIDKmQHEcTvhA2gjbAg+cVCHKSN
 Bi8ZrD26DyeMnJYM/0XK3U3fKs2fe1EkxoRJSWc6Dp9ExXLLrMI8dmDSsAshOoSrM1g=
X-Gm-Gg: Acq92OH8n0u6agqz6lQIPqVKuQEAL0mvOw9llXxV/EkDwVLipodRUshIogT/sO56K3i
 ZjMai2k88t/648HtAf+Lnn1pDQf8/s+v/mgUKm9/ftT5+RfGgelUR02OrVL8cbQsjuNm5DfRSJF
 pPsi2UCBFkU5KNNT/B+UZXZtzLSD15yBk+2NM4VDMbt/5ISiyhTozLS4yvOdJuEjc1RLBiQOwNw
 c01lQppXY/TSVzUcHvkaNnuuNGFdTN/ULOM/j9HjkwWKr9WdCPflxsVRspRGeIFIG1O61HEtVP9
 CC/NzGZRRWnn8c8PHLd54DTUSnlGBrZE9aHMEr3//Li/6K9SJ9cNHkumqqXYH67PNvu6BpFzn4h
 pxSzod37+YnGhSCvuUKHXvtui6N8fYjUaQamU2JqLUJff1TfAzSM2bT0Hg33JtF8z+96eFSXACb
 PsOvKP0/fmAwJmzBIdr1yecG47aSfksujOSSGH
X-Received: by 2002:a17:903:240c:b0:2bd:2439:25e9 with SMTP id
 d9443c01a7336-2bd7e9e263emr209751515ad.40.1779208848631; 
 Tue, 19 May 2026 09:40:48 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f27csm187143305ad.25.2026.05.19.09.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 09:40:48 -0700 (PDT)
Message-ID: <922e46d5-f9f0-4839-a4d9-79d16450fe4b@linaro.org>
Date: Tue, 19 May 2026 09:40:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/63] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-4-richard.henderson@linaro.org>
 <CAFEAcA9SG47Nn=dijm8AHMFQzq7EG+=LyLkRL7UtYJsNBjfZKg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9SG47Nn=dijm8AHMFQzq7EG+=LyLkRL7UtYJsNBjfZKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/19/26 09:23, Peter Maydell wrote:
> Because we use either FPST_A64 or FPST_A64_F16 here, this doesn't
> handle the FPCR.AH = 1 case right. The pseudocode FPAbsMax squashes
> AH to 0, so it always has the behaviour of the "normal Arm" operations
> for things like what the default NaN value is and which NaN to
> propagate when both arguments are NaNs. FPST_A64 and FPST_A64_F16
> for QEMU both change behaviour when FPCR.AH is set.
> 
> I can't see an existing fp_status word that we have that has the
> desired "ignore AH even when AH is set" handling; a simple fix is:
> 
> diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
> index 2f481ac489..fc2566bddd 100644
> --- a/target/arm/tcg/vec_helper64.c
> +++ b/target/arm/tcg/vec_helper64.c
> @@ -8,6 +8,7 @@
> 
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> +#include "internals.h"
>   #include "helper.h"
>   #include "helper-a64.h"
>   #include "helper-sme.h"
> @@ -152,6 +153,7 @@ TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status
> *s)                     \
>       float_status local = *s;                                            \
>       set_flush_to_zero(0, &local);                                       \
>       set_flush_inputs_to_zero(0, &local);                                \
> +    arm_set_default_fp_behaviours(&local);                              \
>       TYPE r = TYPE##_minmax(a, b, &local, MIN | float_minmax_ismag);     \
>       if (!TYPE##_is_any_nan(r)) {                                        \
>           r = TYPE##_abs(r);                                              \

Thanks.  I believe that leaves nothing of value in the local = *s copy, since minmax does 
no rounding.  It would be clearer to have local = {} and drop the set_flush_* lines.


r~

