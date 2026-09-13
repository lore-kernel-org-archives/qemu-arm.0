Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0A6C88E56
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 03:55:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5bJD-00029a-6e; Sat, 12 Sep 2026 23:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bJB-00026C-3i
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 23:55:13 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bJ9-0002gp-EY
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 23:55:12 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d91a931f66so4307235ad.0
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 20:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789271710; x=1789876510; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+8OKaegf2S5BKtFSNoGGPTbptNQTUx/6Ai3WAJO1X0E=;
 b=xq2sw934uQ1J5mhJ5MAQg3Kyg+L+yXGXetYtZ6Wm6/jmXfzYrmeqgb3b3pI7Ag/84O
 EMNpwtQ6FUO5aa6l7WuNGe9tVO0KdDtP/6JUinwzGOKarojc4HpfkvFoiCrpQ7UNXzNo
 0xAYX2kOMbYd4vvO+0T+8jUiLy6m0JnGMiXCiXDWyJaZ+16sUeYYFzJUZsMrvdq+1i0R
 BPZfIFdzUINGRE+y2L3GX2gWaQ2gj8KbBBgrhSLa16X9UsoN698GKb5NaU6FobFs1hnh
 Jb9lPp7+CsvkrCpzb1D69b6HS2WvEZ+nkeCupRGHO1BMkmqoHyksVQWSAL6yvd2ddyDE
 CmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789271710; x=1789876510;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+8OKaegf2S5BKtFSNoGGPTbptNQTUx/6Ai3WAJO1X0E=;
 b=N8CnK2G1f/OX8MC/GMGJydxG9YuyMu2wUJxawGRmyXJC1hNTmroHuFPPSQyTrMtCXk
 oR7ZZGYR2F8s/9hXlKy7KNl/Njzght2Jmgyc4s3IpXmMgxep/BzFin1JznTBOkRpgl1Y
 e3vbT5oMTY/LM4rT1iD4wyKTVyFV8s44Jt7is7A6NTRN4KS52DBRrfbeWEguxtLnuSWs
 IuWAcpcaBg+SxBirKqufLNSPlQYDdFVbGNvW0MBye94Cv162awztpP5aTIhPWyFJ4Yzn
 8iDARs9rUQPYrVFwdq/8Wi43p0ahrt2vg4kTFh1T/EzGqf6BwBTkjlC5Y1gV40h5yaRV
 zxrA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeD61fhCXnn/7mPHt8IJ3MdL/ix2152/0DOWeBKmXDfdArJtlU9+LsHIKZY9EB+4aEqDeF5lCSBg==@nongnu.org
X-Gm-Message-State: AFuF++mA4YWwKi26TDt5hAgEsK+ytckdw3Gg9bdqKqLAupIjDAxufLX7
 vjJtQEvBq7rCBy5RpM/0vXB8h2YtUIdMi24DZ43kf9MDb19M26J8dvcg8QFnUV9baQc=
X-Gm-Gg: AYBFou0QK7rba1S6Pw22xYMqjWmDEYGyg7QpMKIcUb0oGjB690gUIjNUkz02ghR0Ytu
 XpEH3YfC6p4S5iwkV1EZxBqejDB98PzEe4cC+IfTWB5LGXfdbXN0oGfEjuuFsveiMkFEULL5f0X
 9utTsoztGDfXghOM5KQZE6lx9EuJdoaUKPmrYYjSjcqZ2fRT082bMnseabTq0aB00rI/9EPCgH8
 6jTD+bNFoMMXvzlGBrcIYOIbpvRiHNSu2sQLYQgvo+5xig52bqLdPfE0XI9+KhQOkHQR00qqrbt
 ohdkxSPQCNnJpaI0v1Wwed4v8XJPf3HNL6Df5YTSBNPPqCXb/Lb77/m2o4itADAcuKIVOdajKiR
 bWmovhNLVZDz5HyjUW31o2Ui8mzzclq2ckuySAG7fAZmSYawpr2gdG19MyetqDTn2N++mNKwHbI
 ePYCA+oZhJjAlVZd4OLbal8WTtOXeBi1gwFlTLVwfkwUQs6nFbDEwNS+4mnnM3ZWeK9dx8TwKpA
 GkAxs4DMTz+ZrdLpQPOnQjYLQL4zeesE/mSMq1Y7XTssYSz9HDSOW+S1ryseA==
X-Received: by 2002:a17:90b:39a8:b0:398:9beb:5c17 with SMTP id
 98e67ed59e1d1-39dbc6c6a25mr8666911a91.18.1789271709791; 
 Sat, 12 Sep 2026 20:55:09 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365ba729dsm25656638c88.14.2026.09.12.20.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 20:55:09 -0700 (PDT)
Message-ID: <ee1807fd-eb2d-4fcb-b7e5-e44e64829b5a@linaro.org>
Date: Sat, 12 Sep 2026 17:55:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] target/hexagon: Move to do_interrupt() (BQL
 acquired internally)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-9-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-9-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> hexagon_cpu_do_interrupt() already acquires the BQL internally,
> so register it as do_interrupt() instead of do_interrupt_locked().
> This reflects the actual locking model used by the target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   target/hexagon/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index b5dcbfc99db..7067e5b70f7 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -769,7 +769,7 @@ static const TCGCPUOps hexagon_tcg_ops = {
>       .tlb_fill = hexagon_tlb_fill,
>       .do_unaligned_access = hexagon_cpu_do_unaligned_access,
>       .cpu_exec_halt = hexagon_cpu_has_work,
> -    .do_interrupt_locked = hexagon_cpu_do_interrupt,
> +    .do_interrupt = hexagon_cpu_do_interrupt,
>   #endif /* !CONFIG_USER_ONLY */
>   };
>   

Eh.  Except all that hexagon does is acquire the lock at the beginning 
of the function and keep it for the entire duration.  I think hexagon 
should stay using _locked and *not* do internal locking.


r~

