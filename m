Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp940281njk;
        Fri, 24 Jan 2025 08:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfz8QTsq3DqamQ4PdASuUzOEzyTw0blC1CIj9pOdYMGMkC7+rAOdFrb7IILqn6FQ/Eg/hRXBMXHuqjcw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+SaWzgEeY9CBZQdMVMhMwAUGC8Ah+hTYpgeTbF0rLyxu78Y9FPtBf1GvjJLzUqUc9gsr6
X-Received: by 2002:a05:622a:38b:b0:46c:7646:4a1e with SMTP id d75a77b69052e-46e12a62966mr514482991cf.13.1737737526318;
        Fri, 24 Jan 2025 08:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737526; cv=none;
        d=google.com; s=arc-20240605;
        b=GJuB6SMCpgj1bGjAoMp4zp/gU37TpJ5V1LVaCL/QO5VmRNd+/vV0UVvb1vBJEZ+t8E
         sNgJ5BsWcTg16MwFs+afmRQ3NNovt4+DprWDpWRvpw0agjfHdUhF49R4hEbuwxo3Nm56
         347YmeF14CkjsLORYAM1hsQ+GrZSlk0XEKQ9d2fYYr5CVmGxRHE6Y6YxTUEfxK34bNyA
         sZZrfmcl3E8/SocuhACHPCq1QV4pfUsisYG+FYsHJMdIAlU6HkWjm68B6mnBUTbbfTJX
         jP9spwwfhfxd+QdBxgUJyBL+rNdgkDI4aoU9h36jdDBDYcV0nswpOqKwGqgNWNG+1iUY
         WCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0LCjAHMbeciqIRiCxO32hVPO0Zm5aqjupkpfzKpyKb4=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=JX7sMzDUElesE5j/swo+reBfEPM+gmTDxM0Rtykf5AcpdNaaOL3/JsqN0ydIUXdQht
         rikjvH6Doj/yQuB+jRPIi9M4lD6H4v+5BpME0Dni66OQFze6V8zbOqGkYCEk8gNziy3u
         P0govofKTSg/Ln6LMRj+l4bjIgNwtl+PhPZ5DjMlBGHshdz9MJqey0YXGAXVuQgWi9KV
         WawWAsTmgyCqPNcP8/iVu0LmtvXEh+8hxekmLe6i3TfMkpcn7Hy7Evg9CT+aODVglx/0
         538T6grgtdrkmmBUbRBpP6J0oxU5p3cC/aqsri5I2kS6o9MwsFUxCKYKrBI13UJn7S73
         iovA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTxfqGnD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b6bb4fsi31401381cf.243.2025.01.24.08.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTxfqGnD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMuH-0000qp-BV; Fri, 24 Jan 2025 11:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMu7-0000Hu-Bu
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:51:35 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMu4-0001zk-E1
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:51:34 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2f42992f608so3529701a91.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737491; x=1738342291; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0LCjAHMbeciqIRiCxO32hVPO0Zm5aqjupkpfzKpyKb4=;
 b=pTxfqGnDoaZ9W2q6KM7SpUS6ZGQbdT54vNQyhiXZLHgkYxEL1/7XGN0a01wiEZS5ER
 c1x6ksg++alKM5JZWTTP38wjP92PWNO+P3OXLZujbSTtDI39lYSdmcmMumyls95/UUsg
 D+06xCzidmFL86eat3pCHzz1CrhIxbFlP9C/hYnr5WPQ+gW/CmmlG/TIXfn6iNQ4Txmi
 xsl+AegPROwMtpTzzViDOsWvJ+WAEX39XKgm8aGP9rgQ0PWN5Yw/Li//J/eTXlAOvzVx
 SCcUriapPN4t8wDwUhZ4PbBsu1yXaRbThW1zJOi0Xv3U8I4kdLYSHh5cSUl2st5nQB0y
 WRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737491; x=1738342291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LCjAHMbeciqIRiCxO32hVPO0Zm5aqjupkpfzKpyKb4=;
 b=F6KZQEQ2ZV+zy2fiYA5YrX6P46J+8P8/BdGPedpcoeJ2afWp9TH4KoBXEYLkTYvq/l
 fANHm/pn5cXR0x8/hdXpOvbaLJHy2kE+dK9psdxo0qNolgijlPgn94/5AnHF04xZ8St1
 nlpHCgMTXibrlIIiSaNUGmjuH6yOPD7708CTVAK0NQN2xYUc878G8S3Q61Mx0PNOO+kJ
 U2oLlyFrcNLYKjlZO8iPV7OLat6OOeQPJK31JG9Kuvx5IY3UNd22ig0CRm6Mw4N83I2h
 qIoPXI1m9ipijt3lftaS0htQqvfI4mPQ1wZs9hD/WAmM3COmNHZ7KYbgaMpuEtGGHvZD
 GLzA==
X-Gm-Message-State: AOJu0YxSKJbGPna1g4QoJCIWM7SslXgq/xXV/dZYe0r8HBWwFDSvqmIj
 KXQDBW6mgbLtZuUwsa/4HSZjX09cRpOoQLSoxuoXFwj3uxa3IZp9i0fT2PMSxYM=
X-Gm-Gg: ASbGncsIARTiPPkoDLH4R6ykUefc74VAFbxXpGxAZIE2kvTEpmwv5QZw3DtxbGE6ApN
 5Oquqi+jKmfSYppv19cT3IX9Zx0+AFdbCJVz5lphDLiHOyklQiayBTEQKGNq5Qz+w11UTEOsd3q
 SY9yowVAsFYUkTEx5l8LMPWWvtJ7W9dEZe8qSkPW8bDrnC4GPZD46ERy/EPKlvqOM4bRxtms+6v
 MFcUdfIuQikn9r272yzRNbxEW2UkG6dQYon/Tt0tjL7OCc4Kl8RPc+pl1zRCAmCcwbgjZphZCWW
 rCi3QZo9Q0Ex4C91xvQQ1PHV
X-Received: by 2002:a17:90b:5249:b0:2ee:e518:c1cb with SMTP id
 98e67ed59e1d1-2f782c4bdd2mr48156264a91.7.1737737490973; 
 Fri, 24 Jan 2025 08:51:30 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa56147sm1975389a91.15.2025.01.24.08.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:51:30 -0800 (PST)
Message-ID: <52eac72e-d86e-4cee-a7a5-2f982fd781be@linaro.org>
Date: Fri, 24 Jan 2025 08:51:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/28] target/tricore: Ensure not being build on user
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: En+tSxEJHz+R

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Currently only system emulation is supported.
> Assert no target code is built for user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/tricore/cpu.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index 8e431d79222..cf9dbc6df8e 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -26,6 +26,10 @@
>   #include "qemu/cpu-float.h"
>   #include "tricore-defs.h"
>   
> +#ifdef CONFIG_USER_ONLY
> +#error "TriCore does not support user mode emulation"
> +#endif
> +
>   typedef struct CPUArchState {
>       /* GPR Register */
>       uint32_t gpr_a[16];

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
