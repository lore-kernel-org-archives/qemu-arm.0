Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp959836njk;
        Fri, 24 Jan 2025 09:17:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrvfpVyYyCPqd5Q44GbwjVuHJv6MMcRN8gg0ENHjUVxdkQDgP8GEP5UjBqDfbjWNGahuN4md5rAH2OTg==@linaro.org
X-Google-Smtp-Source: AGHT+IEv9OGlzriO6A3/wvpX2oSpdp7T0ARvVW7diZjSoLUAUGhPBoYoPbta2m6d4ikiGYIuOY5U
X-Received: by 2002:a05:622a:11d1:b0:466:a584:69f8 with SMTP id d75a77b69052e-46e12c73e16mr473352131cf.43.1737739057571;
        Fri, 24 Jan 2025 09:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737739057; cv=none;
        d=google.com; s=arc-20240605;
        b=KeVlQuTq/n6WK+DWJf0PsNoDBNU8kSnrEqnnnYlYzvp4m5qhQzI3FK4biv/RR65Bkl
         bEJC5qS/56sK+keKq33+p0SEwCluL23hGXJL29NahTVUM5YGswjoVLCG+li0GSEks0Hu
         P/e34H9uR/fMzKghKv8IgjNB9MjbBNx3+v/XcM0qO/G/M9s2g7ov64LlDn3byQr/jww1
         U6BBf0dTJuH7uPCBzszvMULFlBBh6XX4YwvMPpoxlTw/o90y7yxDkqfgEmQApnwN0bhA
         qKVuFhPDwM8R6UgAtspTH6NCIloeZOocwKXz8AjBc4FqtZFjlfuykh/9w/5Ox9g70HKD
         rIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CpxW8MxerAbm+Np/0rRPy4odW6Pnkt4zy9gY1/D9R70=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=F8w9xLSRBYXZT9e53bmip5cuKNp+YKM/9cEF6fSaYPkaE3Xx9L7CEzcirCaz0NvrYB
         QGguiozSlJMQYBAmsT9Ea/APDiDSxB51UMAxLvgaU33VVaGpavkmO7cM4WgsDM6w/iUi
         yR4P2gW+Vm/+izqd1Q4j6blS57mmD48h+DTYaRFQOYSgM+szNNhFWtYnietrq7HV6RxZ
         GbWEkv0dbPlwmPU7QAjuPSQyOrePMouYGLa939WrDCLPEdO4+FDz6a3UtWeeFYPA5ara
         aCI/0IygFK6HZp3OoPMDw12M4S+e+MZm7UJj40inoNGP5HTegYloQlOgMSr1pcquuWrX
         DGdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jz7QSdF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-864a9cd6eccsi741045241.91.2025.01.24.09.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jz7QSdF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNJF-0005rl-GD; Fri, 24 Jan 2025 12:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJ9-0005qZ-4L
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:17:30 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJ4-0006zO-4T
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:17:24 -0500
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7be8f281714so227720785a.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737739041; x=1738343841; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpxW8MxerAbm+Np/0rRPy4odW6Pnkt4zy9gY1/D9R70=;
 b=Jz7QSdF35HE71nst4xoNZ3zJt2yMRj1wzrFbtXBsP86Lz9O+SqJ4ibySxSrfala1gu
 odh0gBosKQ8+vUHiwb67lRMmxlFYCIw8OpDFfc3SJweJPgWKmqI00SVWfiWY2Squ5pzR
 2zoMH3iHE9ohG4oEwcRs+KnlUvfdfzdilGEaK/JvRhhBB/GsbDRyO1UbEVwKNst+qUBj
 V6OM2I+dGh7IuaiCH/EGqmk582mhVyL2TfiBxb+pfolZ9TZarIFbR+pUXEZEJ9Y/8QcC
 Gc0tKqzpH0VxvhBJxsp/NZ5aN8XTnHNMZVSzygrIcpb4b90aFpxAkvmx916s/yEPAKGu
 O0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739041; x=1738343841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CpxW8MxerAbm+Np/0rRPy4odW6Pnkt4zy9gY1/D9R70=;
 b=Myu7uHQK3DnoG01Qg86VXMue7YgVymUJqlZ2XnwfTZtjUjEp9KAaNDhh1WYN3+VrZM
 VxTjUw8DMWEd6NvfGZ3T2YVZ/URe42gZEVehgvUDpQ8LJiTNAZ937ZC8EURLrOZxTd2J
 0l/zQSGgMIVttgv+p5AYwNA5Z1i30sptx8ePIQmnqKODG/lYSc9o947QY5xjx1lvBlZ3
 GerxU5lR52bv2s8PuaTgs7TWHluDE2OToiQKhf+Ry82aGV+Lpkaaorf4KomsqHplX3gF
 WxntTwX6J+h2VbHCh9DD9iBEDMEI1SB2WjdBIq0u0a0k9vTC5sKhWaZ8fjJFN1E1rDfQ
 P6lQ==
X-Gm-Message-State: AOJu0YzOmn8Gvi0q1S00oCYeV0adBrJ26z2PqNX72Asfpt9yEVTJ4d25
 XYQJyV3zSthuj4SyEppOMs6gnYOT7IQcPeKEBg4hnooNytGU2MNDenFEO7jZUvs=
X-Gm-Gg: ASbGnctoHUVFwEJsQ0m0qVtrW/ePgQaFYdZw2wiQj6sgPNyq8C879QsPzjmNRcZ0tHJ
 pxzB90OzTuscWn+KklMQLvPoKAkbbWmVSSuUsLOj7WOtQPGauShbJqffIDrMFvGTcmoey+WYPCX
 lmtxAcJrqq/DOKENqDAzVsNu2Tk/hhEYaPQA8efPmDjgV2UYjFow3tBGZhU30neb2E3GujCrqpF
 lP+Kmry9yLgrvuDlg913yWKfnF1pG3WdldQTpJqOGSibiHslixWPSjgzgyOUSPqBqzXW6ljPyvj
 eMVg7O4LmgHC8JzE+DgozxyQYc6TY9P9Qnzd4GxOwVlwlm5P2OKUOV387fn2Go6OJQ==
X-Received: by 2002:a05:620a:2a15:b0:7b6:e888:6b0e with SMTP id
 af79cd13be357-7be63219d5dmr4527197785a.2.1737739040901; 
 Fri, 24 Jan 2025 09:17:20 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9ae8aaa9sm113008085a.34.2025.01.24.09.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:17:20 -0800 (PST)
Message-ID: <0bd61928-5bfc-44c7-8fc7-333f8e2e0b77@linaro.org>
Date: Fri, 24 Jan 2025 09:17:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/28] target/riscv: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-21-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
X-TUID: 2TGe0BE1Eee8

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu.h       | 9 +++++----
>   target/riscv/internals.h | 3 ---
>   target/riscv/cpu.c       | 8 +++-----
>   3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 97713681cbe..32e8e064f36 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -552,10 +552,6 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>   int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
>   uint8_t riscv_cpu_default_priority(int irq);
> -uint64_t riscv_cpu_all_pending(CPURISCVState *env);
> -int riscv_cpu_mirq_pending(CPURISCVState *env);
> -int riscv_cpu_sirq_pending(CPURISCVState *env);
> -int riscv_cpu_vsirq_pending(CPURISCVState *env);
>   bool riscv_cpu_fp_enabled(CPURISCVState *env);
>   target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>   void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
> @@ -576,6 +572,11 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
>   bool riscv_cpu_option_set(const char *optname);
>   
>   #ifndef CONFIG_USER_ONLY
> +bool riscv_cpu_has_work(CPUState *cs);
> +uint64_t riscv_cpu_all_pending(CPURISCVState *env);
> +int riscv_cpu_mirq_pending(CPURISCVState *env);
> +int riscv_cpu_sirq_pending(CPURISCVState *env);
> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>   void riscv_cpu_do_interrupt(CPUState *cpu);
>   void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
>   void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 67291933f84..86def39aec2 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -142,9 +142,6 @@ static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>       }
>   }
>   
> -/* Our implementation of CPUClass::has_work */
> -bool riscv_cpu_has_work(CPUState *cs);
> -

Why move the declaration from internals.h to cpu.h?


r~
