Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp878571ejg;
        Fri, 19 Jan 2024 03:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtvUUTnSX/ohCuWA2ECvJzBiJ5V6r2WTUcXMaVuTaVxFM97SpYMxI+sGfVv2Nm3nrnJ7h3
X-Received: by 2002:a05:620a:13f3:b0:783:689c:fb0b with SMTP id h19-20020a05620a13f300b00783689cfb0bmr1039853qkl.2.1705664186673;
        Fri, 19 Jan 2024 03:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664186; cv=none;
        d=google.com; s=arc-20160816;
        b=fSwJ5Mr7xNzBy1hhfUljNdonu4YafnoOcU3JfNacMXZpq7hAbE/vU8GFRnP5DqaCqx
         1L0M/fTDC3cuqGiozOcDT9I4Xsqt820kE5sRrPOSEaeSgEinQlq76Bg6xh3hF1vkyO7B
         puLuf38ryL0NWEpRwW430yPG+a1V2/Yca9+156mPBFIIzk7bb9iK3RzWAPOP4K9CAotL
         ddUdA5xnZXtIeR+xtuoofML/TDMhWyh71CWgsCxPsj1L6TrmFT4kTigH2fD/aQd2Txg0
         UtIR3EYpQzJSCfjY50CpyUsE7+pCeWfOS9UqHu9x1a7ScwUQoZXDghQ8oBTpeAisfbtM
         1yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=grikY+amHmPq7q8W8EjnJR7Fi9QeXPdA+8sNJUwVsyo=;
        fh=mNIn0IJuUUufB5QRXQRd5w9ZKLOgI80E423Hl3yXJsM=;
        b=TZeGqrnla86xSEvSth6G9wGx4iHCRBkEZ7XBhD9fAer4yX6W6iDId1J3Bz3ELASRgs
         5uCr4s2G7En4WH9B3I58zIPa5GcoXov3U0Divtlmr0qKk+IVX83EBeYWRUr6b2oFvIQB
         PGiBPn4V3VtfMO+fNzC4C/ddhiagggnZWUzp6QzoGN0JLiRpesVfIAQ6ChSftmUJg20z
         ImwL5icdGJM9LMH6WNJoGPsx54jQ8tY+ijSU0gBdvfW6ZvD3C2K8D+DeVDh3eXYbBo5F
         zRP8FwU0Oumz6dFsUKbzHSoS19SSJNGYkR7tq+tlAK17pJR326G/ShOSxlPKxp9LS4Qc
         psEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6oNhbaa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05620a121200b007819059f7efsi16038585qkj.766.2024.01.19.03.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6oNhbaa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rQn9k-0001Xx-9B; Fri, 19 Jan 2024 06:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9i-0001W7-VS
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:35:27 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9g-0007Wu-13
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:35:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-337bad75860so450549f8f.1
 for <qemu-devel@nongnu.org>; Fri, 19 Jan 2024 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664122; x=1706268922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=grikY+amHmPq7q8W8EjnJR7Fi9QeXPdA+8sNJUwVsyo=;
 b=A6oNhbaaso+N9ZBobJD74HwobF3vF94lpf31BGUc7GFKzTCqQMdN9byuOarlClYqdg
 UgJmkPP8hcOW07v/NyznC0Jwdlswox3Z28L9csV3wWSDPd+PWGoOrhDnmIbtSL/Oh3vo
 XEBUijIIIMbLH6StMm3DSlB3H4thutFIaULdOf2bh+gJlFqPyP9tDCkFh+Hs3cnexc7u
 qz9/nGMGaFTLeeI1G1kRMopa+FzCZuAGWGy+3dwUg+9oieRQ8E0PewryPZqo5fN5RH6d
 7xRP+0hhsUPHwkFAlLb6aZEtsOLLSpXME7roqFbNFRNmWcdGOBwm8Kq7LULkYpiPRwSd
 /LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664122; x=1706268922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grikY+amHmPq7q8W8EjnJR7Fi9QeXPdA+8sNJUwVsyo=;
 b=GkykYAqIQNoju37ldym0ooWZb8J/gVjdrzKOAIfmPbDdKfjJqvLNupXFxoht0A3oNC
 HIfHjYyhllHmZxHTERQ6J87rBc8DfAXSMrBXyAgcT5pNAp9FrOH6NNj3+e0r/XzqPBv0
 nz/KbsnSkbaUOx45meAYJMaejvPS2rbpjIRw9LkD0MvhtBx7vOB0VpsBxhH+h/D+s0PB
 t3Gei1X/RM38HqWyn+P9lHNP9x6GraOi6TxxktilVEpsbRptvyY4B5HoJ9mVP+dN6MXj
 S2jTn9uolMrl4njiOsj+cwDp5o3Gc29RxctlhH6RJUcpo5NxXP6KYlAl+NE7IG/n+Bme
 arOw==
X-Gm-Message-State: AOJu0Yxrk7zbNCExsSGQHkpyyOxRVsLbHYeGFIVZvEXhfx4xct6Wfn9+
 6vQNs2fU4QnnRYMlaMCsaGgfzbbASKjWu/jEa1/zlXN03JC+dJS3J+G1Zv3dmeo7efHDcpFHKRd
 9X7obMg==
X-Received: by 2002:adf:f408:0:b0:337:68ab:617f with SMTP id
 g8-20020adff408000000b0033768ab617fmr1477351wro.15.1705664122436; 
 Fri, 19 Jan 2024 03:35:22 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b0033609b71825sm6271320wrt.35.2024.01.19.03.35.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 03/36] accel: Do not set CPUState::tcg_cflags in non-TCG accels
Date: Fri, 19 Jan 2024 12:34:32 +0100
Message-ID: <20240119113507.31951-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HfzTvrE7/EPY

'tcg_cflags' is specific to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231130075958.21285-1-philmd@linaro.org>
---
 target/arm/cpu.c  | 2 +-
 target/i386/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 826ce842c0..593695b424 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1796,8 +1796,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     int pagebits;
     Error *local_err = NULL;
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
     cs->tcg_cflags |= CF_PCREL;
 #endif
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2524881ce2..03822d9ba8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7221,8 +7221,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     unsigned requested_lbr_fmt;
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
     cs->tcg_cflags |= CF_PCREL;
 #endif
 
-- 
2.41.0

