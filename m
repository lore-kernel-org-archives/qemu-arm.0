Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2239116njb;
        Mon, 10 Feb 2025 13:54:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWchciGbz0vFTfWMkSaMhCiqYs086zLlaN1fuI+zjM7f3dm1XRnTontimRoEzW69wyM/gktg0HWGNvWZA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJWHh0uATpZMWVM9jxFm/n0GqwOZU903pQ5EH9v4+fXSUyU8DTlaFxfTlXME0MXS1iyJn6
X-Received: by 2002:ad4:5f89:0:b0:6d4:254f:1c8e with SMTP id 6a1803df08f44-6e4456de11dmr251444426d6.37.1739224456453;
        Mon, 10 Feb 2025 13:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739224456; cv=none;
        d=google.com; s=arc-20240605;
        b=WzsWc9yUsaYhZZIcrGv3t2lc1A2okz2C2/GYFfhlv3tLnnRIoGjH5X6gx1cy8nGp1M
         7xnmlAhaDvIhtPXxa8dvXxzITlrBTItMp1zGOOqom40vMH9XcZfWM3LW27mzcHGMXI3P
         UPpyuPcPDJYnHiJBFAkwIVFz/7FzqNh2CcdXJKc3b3wFE9n2I2JPmjNNaD++F76PDgQl
         7COs5KNRvmiI64Ub4Jgvrgd8rYM4Iwd9pGd5jn/3+LMQlgsDqFGFPSa2sX8fn+XjXWug
         PwzUlgJjRJF+ekl5H3VTkVNZfq2nD4TMhutpAO6dH86bBBi95YLIFP9KZbKqf3Dvrchx
         28RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hkNAqktjdKbKBJHHW1z6rMMw680e2czk9yQHTsJnsUg=;
        fh=s4oaDWoM8t6ei951G6bkFv/xgA+kuFLeLd79/G1gMfU=;
        b=ciKcYmx/9oOPajEXjOMxHHZX33jkXkLpqpuZRS8A2jm8Tf+YiGPMmIt029befTcBAv
         PFqZl4fxEELfCLrBkfvx91mpAeTVBxfZB7g9lovpuaZqF2McQBuVkdXK0penROT5OdKc
         XJndqXR9bR4XwvDT2UP/hrbOe4DtoTboMWBRol6xihK7ER+0cv+83m14isHOS5Lpl5jZ
         Ci5Q88nkmqaBtRvC3hK/7Cr1EAqgaRmA4mGH29R15zWQi9rFn4G5owUc7T7Hjp+TWxy4
         /PaYFjoRjIC0X7/ig1VrTegnSfL1mojZUx7udkuTT8OmBly/RyXujD1sqL1AdUJe1Awr
         K+5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oe7FMqtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bb1b03csi100736196d6.465.2025.02.10.13.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:54:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oe7FMqtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbjE-0002FG-HF; Mon, 10 Feb 2025 16:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbjB-0002ER-Rg
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:54:05 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbjA-0006BC-2I
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:54:05 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21f2f386cbeso90093605ad.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739224442; x=1739829242; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkNAqktjdKbKBJHHW1z6rMMw680e2czk9yQHTsJnsUg=;
 b=Oe7FMqtBLtSWnNRd9YV1Aa+CAsWZii76y6x/ncfvh/4msDN/ARIyR+v21NN+X+DQUc
 X/wa43wTfX7ab42NVOPEr008BHIym+Ye7BxkTZ+beNDyKHXD2zpk7TpIT21Qx+9IpsVs
 +1efn2taIe4jdvEqzTJIrMO1LDx4OXTwp2FFLriWYxaN4sSS2qTEwAoIhNM1teHzOnAl
 nQ/TwbP+q59FJQ2AnJ90rRbnP5TuhxVdqFYE6HJv31ZRVNTcb+KbiLDW8MkO6tpD2XQb
 y6uqDpO3kLBCa63QhPb4voTv0s5mjN0m8w4KnmC7Ytl4mbRoWkC7a75kxOSIOAUVVVUw
 2kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739224442; x=1739829242;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkNAqktjdKbKBJHHW1z6rMMw680e2czk9yQHTsJnsUg=;
 b=vA8nlBcaHJ9Vr5LCyIzXO8N7ew7e92O/bdbiOMEoWD2DGMrayhikKLwjNuSjr+vrui
 JTBWYnSjUFl1CxDwvKYJ4+25h+x4/tl5vxt4DPwLUIczukjIhW7TgZjPF9Ja/pUt0hkL
 sNqHP/eu4+CkKbexcTw9J8Aud7gKMDR/FSPB0CXtkDcXO7nNT3DqakUxQ2tDL+MJd3v1
 DSYXzgebSs9g0k+zkEQlOcYIeReSxz/w0A0uyEo476+eb/M8vVmbrpWIVLMRHJhGQAqj
 jb/uUq5n8+rq7nhA+Nb3DCngnLFAUSbQiZYFuNLZkos5edm8+IxL3HyMS77QPmJjKSHh
 k9vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUGgzCGaSFLBZ6Adu6vyL1cBXuWE4/DeS6mCyWTnxWzm7wXJSTL3BjAVInm71m0XP9d6hFypg6Tw==@nongnu.org
X-Gm-Message-State: AOJu0YynXWmi8rKb8WhlS8+pO0RGLPZ6yunww1W71fL1VlRnZsCwtmJD
 psGbeMPyPGedCaia4Mo4lFV0978SeS8pCs325Izk5AYGsmoYRiWLi8oEOEhBNY8=
X-Gm-Gg: ASbGncsSpNQ1Ht4Nj6Bnd1Mjrf+EMucobZBCdUpJxn6/NdUwHOBGTsQ7ZQzxINoxWYM
 lDWPOJbiOYHGfva4RnGuzYsfTcviSomGT9HF/t5CuNn6sNlOCEp/Rt+qmE1yPg32hwS1SaLQMwa
 /NEpZ0euLZ6BIcwQ+4UbZoLSm7zfe5A/HK/RxupaopRrPbOoU62mrWB2vpQqLENbqFE57vOFOl7
 WpN8JMv7XXLw+VD55P2+4dd9EM0qePfQ1bgljs0Ehwx9tU05GzmBxDQiLtBkEVra7lT4MXGhdsK
 UiYPNL6prEttaJ9Kt6DGexq4sxYNrsOKXmRs5hbEDNDVhojfFhDmZ1c=
X-Received: by 2002:a17:902:ce8c:b0:21f:6bda:e492 with SMTP id
 d9443c01a7336-21f6bdae843mr153272365ad.35.1739224442264; 
 Mon, 10 Feb 2025 13:54:02 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3687bde1sm84029975ad.195.2025.02.10.13.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 13:54:01 -0800 (PST)
Message-ID: <45b18fab-59a3-49c4-b600-b9a26b815961@linaro.org>
Date: Mon, 10 Feb 2025 13:54:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] target: Set disassemble_info::endian value for
 little-endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BJSiNHaLOB59

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> @@ -35,6 +35,11 @@ static const gchar *tricore_gdb_arch_name(CPUState *cs)
>       return "tricore";
>   }
>   
> +static void tricore_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
> +{
> +    info->endian = BFD_ENDIAN_LITTLE;
> +}

While this is not wrong, since there's no disassembler it's slightly disingenuous.

This is the only target without a callback function, correct?  Let's split this function 
out separately, along with the hunk in patch 10 which makes the disas_set_info call 
unconditional.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
