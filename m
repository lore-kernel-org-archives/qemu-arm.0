Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2023545njc;
        Tue, 11 Mar 2025 10:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXX92PDfnundEo+Bwjkk4fcq9yViY6NkSyAJCluAhxNUchllWdFVUrlcYpwPUZiwk+u23fhSlqIoHPVfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE9vUt5Xf3c/G+Tax6wHh9UJJIMtUMnKjtsZmWtNa2Qrm0DLNpLZEvkaYyg8/NZfYTJk3iV
X-Received: by 2002:ac8:59c3:0:b0:472:fcd:a61f with SMTP id d75a77b69052e-476109bc97amr227155821cf.27.1741715048479;
        Tue, 11 Mar 2025 10:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741715048; cv=none;
        d=google.com; s=arc-20240605;
        b=kaCBEoOkzzGuwtUTJztU9AmSP4n5c44pfCQ9p8MVwHXom3peHoQXW5e9mgP/3FMKO0
         /Ri5vMiPjbk+2FFgj9z+5eCT/yP7p6iibkhpl5gg7f4EF78rEBykcRqq9vLMs5MscB4V
         Jm3bC+ISdhxastdtAuVR/KmVlE1E4qoV0CbAzcB927ilG/WU/mYmWPFtapdQX1C8VvQC
         nAlLU8orlDeWrGJXQhm4x8a62PXaWNP1RPiAvCB8Pw99cY52WrJQAbe58KBiq1+0RTMf
         I0p48vz1fCHQv0SycuaCAK84/q3JGN9Zx/k23u2QJk1V8TqmAgX73ahTdUcMyE8Wa0K0
         QFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Z4zPp4GSZ4Wx3O7yXUJ/bzWCT7T7ILy6438xxHvH6Fg=;
        fh=E1g9FQBxloCoe+tw66GhGnq0grrQB2yB8sJbLyDeFC8=;
        b=bcu505jKRqS1xk/14vNaI2jFV9ff9PCkst/iKHuwRYngO/wMjo/8fbwDFKRhQ98VaL
         RAFrve0sp0PgYToUwwpujH3vxm1z23TgtoTevsJ2hGyObCMEu3koleJGDnJXDocNAvjo
         UwE89pZUKCFGj/nbpaloPVx2XYO3uHVShdtW1FVmMfENxfJqgh2oAHVrpdMMghd2HGPR
         16QVPervBgf8fEphkzR23ZXwYo2D0mlo8JW1dMHwQWlMcyQydutQD1Qj4vDbrud4z+jd
         6AWRO3c+viIwtKJ+L5OYK+UARzJQII8kdYorJqW9INOlh96F3Sv3fnQ/KhF5jjinZHL3
         pz6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ga9YncXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d98611fsi113057471cf.133.2025.03.11.10.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 10:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ga9YncXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts3e8-0006R0-2g; Tue, 11 Mar 2025 13:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3e1-0006I6-5Z
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:43:57 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3ds-0008NB-Bh
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:43:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2feb96064e4so11236932a91.1
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741715024; x=1742319824; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z4zPp4GSZ4Wx3O7yXUJ/bzWCT7T7ILy6438xxHvH6Fg=;
 b=ga9YncXS3LXLIG5S3wxKLqh3dsdooDEl3wtysBVDwnYGCzy0DGARfwQ0TS2f5QPGb3
 tbnMk7+4sLsgfHxnrYQpEG4HFELXIFR2inE64mE6gjms/k/v/MXGKrI+icI+coRhDTn1
 bvOK+adSKVO6HI4Cn32cHW+NGqoRN1qRKHC/gDpnRcauTDaBbpRCV9skyVKqR3gvvspH
 uLbZD1EDp2aVGUaPuQhX9b9XwnXcgsUhQM2RwXfxfM448kW1R7loCIDfW/fwqcl8wOZh
 9i8CCcO+VJOZw+l1FQbvl090PWhT17JkrATejUjvcbZw9gCi9jOHau5S+dzyU3wZFi9O
 bL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741715024; x=1742319824;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4zPp4GSZ4Wx3O7yXUJ/bzWCT7T7ILy6438xxHvH6Fg=;
 b=IsO0290+IdU50lbIZoNI9z7pGwm+jkv76YnUyt8bVFqbztKk0DdGe4Pd3avIr/avOU
 iXZl2gbmR5OymExetTGmzwmA9eSEit2cyB37erFYHKCBmGgC/NqVBISUJq+OD5unRJz4
 8FAAytYTdjVAeYaDIiubW75VdP8tJz8rGIIfmzOhSfxw7WBNMsKpEO6Av1PebPekfZfE
 +m18aKV6E/gI2Yr0IpTaehl/y8IHwyADe5Kv7kkDrA4ecLpraEw9ItLTpvFDy4XpH1Dt
 L/nyIw6DjmJ3eS/UyrzSXGX7F2CM/LFU2XMDOyWXPseiQdZhrBXGhb97K8Cwxh6vdxIH
 BZog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU5JYWopMcm+brBcvoGffmPkkK1gOOCB+E9hHETXinORBoTFkIvtEZHqtBq5Rx99VShOT7ZcamlA==@nongnu.org
X-Gm-Message-State: AOJu0YyS4b4UKHt9QaK4aRXu3DR0+CcsJeqj2xbK2FiiqEulxSS9UOQN
 9Nhp693qQY/9yTO3Wtd0qu8ztJZv60BG2qSwwEj6RBbNIektKepfHgcNQ+M6f5WkJ0W8lFBFYI8
 I
X-Gm-Gg: ASbGnctrw7numJMcgLpLLkRsnf2bbGRAbhwZpDRalcorANl9TSAEw+hw83UGjgkqvst
 +biD3UC1w665d/wUAXx3W9ku6s423UPvKROqc6B0NFfsgLEKQgz0Quhpjs5Dubc8Q958mkJWg+V
 J2tYFlQ0NAY3JQayASd9a2ogMeGc5OzE8lqEw5Rof00BqM8jE3QuBK/lzcQtmr1UcX3jbp8XzxD
 Y4Vemh8tksul2NRNxPA/QdO5iyhfcIr00tGF+s7wA83JLVDMQVfZgq1CkmsDVE6ryhQ2Mv/ec7b
 eNzCD+mdFt9MnFxcFmkRiT8w0pdY3d3BKaMUpTNoJOMTl/C9iYTquGn3dcfKEFckppEOC7KoCq9
 I65HB1nF5
X-Received: by 2002:a05:6a20:4499:b0:1f5:6b36:f56c with SMTP id
 adf61e73a8af0-1f56b36f8a5mr16243530637.39.1741715024521; 
 Tue, 11 Mar 2025 10:43:44 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736c78389d7sm6088696b3a.4.2025.03.11.10.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:43:44 -0700 (PDT)
Message-ID: <e3c271d3-3088-4254-9739-c2ac6cc78e2e@linaro.org>
Date: Tue, 11 Mar 2025 10:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] arm/cpu: Store aa64mmfr0-3 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-7-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-7-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: McyqnyJPZqPx

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/arm/cpu-features.h | 74 +++++++++++++++++++--------------------
>   target/arm/cpu.h          |  4 ---
>   target/arm/cpu64.c        |  8 ++---
>   target/arm/helper.c       |  8 ++---
>   target/arm/hvf/hvf.c      | 21 ++++++-----
>   target/arm/kvm.c          | 12 +++----
>   target/arm/ptw.c          |  6 ++--
>   target/arm/tcg/cpu64.c    | 64 ++++++++++++++++-----------------
>   8 files changed, 95 insertions(+), 102 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
