Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2066284njc;
        Tue, 11 Mar 2025 11:59:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsLQOLI2iPdCEY7FnxXqH+iqIiQwKOS/ScqsVqpCIq5Y4ABhh/vrAnDBzWR7AhLBeHyFYIQk/3pL+lWw==@linaro.org
X-Google-Smtp-Source: AGHT+IHbZaI6tT9kGrAVsEqQRRCxuIg9LDXPYjZ2kH/jLkRx/1svwG9J0slNszNnSDdjfgW4UOFF
X-Received: by 2002:a05:620a:2786:b0:7c5:48e3:2d4e with SMTP id af79cd13be357-7c55e885c59mr674913085a.28.1741719597793;
        Tue, 11 Mar 2025 11:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741719597; cv=none;
        d=google.com; s=arc-20240605;
        b=R2B5kdTDqYBXEV86DjGngkNOPqpBfpBH1ITiHouwD/NdtJeDJOrawGb5ypsaEMey5k
         +hWrK5sQ4ye+tL3DoUjAZFbdAFyG+A9m39jlk++2nYH6cw8/2mWTJeGWWGtbUrxxq5nt
         G6PJABBRZsD94jr4wHgoJA+LWoLoXkuuiUqlHgIrOKqZmPxZjbuLBXY4Bf8GC9sj7sH9
         4psEkTCgSLpw5XYAzDheUlEZxh5PCEzpeKRdV/ETXKqTrrsjDWd0yB+Ddbbx0VjQzr0R
         1F3LZprcDGHToLegBzzjDG9SUci13gdX6buYzbmH4GeqKfGRIiRpPctJIwVx8Rn/twbC
         NoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jm8mwg02UjcwLjJ8M75kyMiN4uD6fZT2pZoox1K2hcg=;
        fh=4QYytQN22b7c5osfma8lbHYAImcAsrUz8lVKWtNTeNo=;
        b=l0NFai7ST+dk4DBzbiSxFW1j2GNGHdraMaXCrAPDmOBMoiKL7woQnWTvCmZS0112Mi
         rr1AutKTpMvX5CSOp30EavJJPbSY6TAdav2upY+MqPOv8Y1GLSLPVncEl+EuPrKOLglk
         W+NwpPhXDEqBRQ+s2voi/yl5QFdlIAVo7/1PkWvKSx/wgYtfUq+jKeT6cVWzvRk52193
         eor4qJkiTEdBIIYO6Rf3AYbBvHGPCylojpGKNzODqXdKan5F/4f83k7k2BEFO6Oqcn/c
         v6VXM59Ua5jNISahiq0x2lhG4+ip9OfoHyIh5EJTUQGNi/dBR1JiRD6L/kYT2DZFMw2s
         OLJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ilL/JdHu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53e37647fsi753075885a.315.2025.03.11.11.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 11:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ilL/JdHu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts4pU-00082Y-3u; Tue, 11 Mar 2025 14:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts4pP-0007yd-K4
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 14:59:47 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts4pN-00084z-WC
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 14:59:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff797f8f1bso8099629a91.3
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719579; x=1742324379; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jm8mwg02UjcwLjJ8M75kyMiN4uD6fZT2pZoox1K2hcg=;
 b=ilL/JdHuamz2L2UojZ3gmFvbAMabkC4FRV6kFlSfyWKiLLMuk0XMkrqPU+7eAHEi4g
 IuRGRuIvxopzk6N/hpQZNo467BEx+7Zq3xB54x8umt6Cb0e5LS+T0PYvXtJSXAOQskoL
 3DH3G+7HjPYzhjInvHvgbK8uoC3sc1NZ+reKhseJSzbDYLOquTYxuJXWjYm0DwRH6RqA
 sEUsu2w/TWPH8+U0RyqHTy2S7+OBK/gLPlvEGy0k1KlgYF1RczHnSkLQPbQ/JTnsOh5i
 AydH8y9Qyud9a4D8KotAOPdemw6qw1rLiV3um5WfH9gfQCqfY17XnyJaYl4DS3FlAUBh
 76Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719579; x=1742324379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jm8mwg02UjcwLjJ8M75kyMiN4uD6fZT2pZoox1K2hcg=;
 b=B8aaImlwaLA/KTfkvIu5Qa7OZGivPjHxQA6S2UW7dsUJS1hwBKAHWJvszeWSGO2jfz
 Tn9D5XzgCiUPx0IKrdETQiCV2IdHB+0ik5rj6HHfagDvwr+JCbMHKwPnovEHJuTBYlz3
 FrWdDanaGlhi2HdcSuteXFq3EzSS94bez7jz3N8B3Oo7Fmys2czBku9iiLw10SlDfWVD
 QcBMOPlqzMfGC2oQdX8vGYqTph3gRhN1TP9EJx+DcQw3qJ0aSQlKQSc8tWxCd0Uzs5HQ
 HDZzzocDIjBUrtB/zhtic2Vd6kDVfmDPimDfGtW7Cqk0hkU0c8kR04ho3W1CAODt/kku
 zucA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/6kNMGBHMdL6Iu6Fksps3d888BkqGmwh1lC5g1KmaV0oB2A47JgOJ8waHMR8VxV8fETc5dX3qTg==@nongnu.org
X-Gm-Message-State: AOJu0YyAGLXOfziqK4Tk3Y3+db5S/zhApgMRhyvdhI5Dn/vDHalYvgE6
 MoCtzm80Mo+JoNSuPogpGSTpzFiTOitwSaW3gmkM7GfoaTlC8B0VNEOSrspQgYI=
X-Gm-Gg: ASbGncv2Wzqf3Y94D/O7832txOj2GyhDIv+6snh4U/wv43wlPp/7FMHwzlbbjfV2/v2
 1aHsLalWMf7odxB5n1715w6UxDCj2gfNI2fPnSdMzxCYf3wh9BROWbxtfUt2Ug9Ftkg2B+3N8M5
 HOwJ/QTNHlpUiTY70NLSKEuyyUhVw1BQl9AWAF87nNhzblJ4XumUGfZHalTnG1dqEGr/CiN4n0i
 zidGLlGiMV7KVIx+HlJb1gKVFm14S0nw1KYzh+UU8bDwI7oxhLbZeAwBlLrwDiY2Jp+D4bGSqku
 XIH4FGj3i2pv1xqFdcvpX77h5tIE5zhTwi3XoTkurEvBtRngCNkvluxi/biEk8Ldb2yLGKwpboj
 pDAD40FmA
X-Received: by 2002:a17:90b:53cf:b0:2fe:99cf:f579 with SMTP id
 98e67ed59e1d1-300ff0a4428mr6186897a91.4.1741719579132; 
 Tue, 11 Mar 2025 11:59:39 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff6933a9cesm10389683a91.7.2025.03.11.11.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 11:59:38 -0700 (PDT)
Message-ID: <dfc5ce05-eb68-4ac5-b3cf-49afa4a7a1ca@linaro.org>
Date: Tue, 11 Mar 2025 11:59:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] arm/cpu: Store id_dfr0/1 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-12-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-12-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eAP3q9sJFPzW

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   hw/intc/armv7m_nvic.c     |  2 +-
>   target/arm/cpu-features.h | 16 ++++++++--------
>   target/arm/cpu.c          | 13 +++++--------
>   target/arm/cpu.h          |  2 --
>   target/arm/cpu64.c        |  4 ++--
>   target/arm/helper.c       |  4 ++--
>   target/arm/kvm.c          |  6 ++----
>   target/arm/tcg/cpu-v7m.c  | 12 ++++++------
>   target/arm/tcg/cpu32.c    | 30 ++++++++++++++----------------
>   target/arm/tcg/cpu64.c    | 16 ++++++++--------
>   10 files changed, 48 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
