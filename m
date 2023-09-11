Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1359622ejx;
        Mon, 11 Sep 2023 06:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkd3Mg06p+Uz45i+3Lpxl53Dg6lRC3WtMmrIPz088UmCmkeB0QdbadwHAG+2Vvin2cJGB/
X-Received: by 2002:a05:622a:155:b0:412:2510:2c81 with SMTP id v21-20020a05622a015500b0041225102c81mr13664560qtw.63.1694440437432;
        Mon, 11 Sep 2023 06:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440437; cv=none;
        d=google.com; s=arc-20160816;
        b=aYLbecouJZqU4oVFD3p06NZNrwL+FPUGnrWLApSekZTwH8TzbtUPUvgl0l0yXgTkLT
         RBtTZMNqNAB0mjWgHmh1pva6biXTaddebMldCTTN9REmyOMyW1I7RnruazNP4wkCN/EP
         NLlPFP6BvXjxCsCg6hkfm4oPq7evxdQZCafwEI/NoDHuzo5KIfqRJF/botAn6/1E/p4F
         e0a8fsA4DdgQlcYiHA74BAZdKSzCfIf8LT2DASpl2O/9I/4zuvmqZ6v/acC4hRr5hfjD
         GLj8KXFl3HksbggoL5Jj/Epi0pN9Q2NL0fEC46E0J8cNDRLxZZVYfEgJGP+cfNcag/aK
         dVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BQa+831csKF+bLc07F+cF6xTN80jpivchM4xDwQv7Wg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=a9VQ0g4VBrWknxUvlRmS/i/O2zoGyf3896RYJr7jvzxQ5cdR5UDc63RPdja0XPCDTB
         5XKRC6T2h2WjGJyMWYMxM/KWobN+0IQqNACpZeFXQc/ju1jJnUOtIv1dN5yase/NrTtB
         1as8fFIODrZZcO5dXVZJvq+njxZfnXZJjv26ExBdDSieSvfSnExhw1HamO4mjMqmljNx
         PChAqdIkH2hEe6XL2YKA896PnMW9bDKGlqu9ShKazBtXqSX6jc8Pwbn5smx/vgZKWvLS
         ghOTDyyr7G66bwB6LJ7KBno8tIMSMDeaqyoYBmPt95gjLItx7wbij62cOae+1GWBnRCz
         gBZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7jN4E+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05622a1a1400b00411fc775858si4725156qtb.92.2023.09.11.06.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7jN4E+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMM-0005fd-Gj; Mon, 11 Sep 2023 09:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhML-0005fM-Jj
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMH-00039w-Kg
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31dca134c83so4467513f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440424; x=1695045224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BQa+831csKF+bLc07F+cF6xTN80jpivchM4xDwQv7Wg=;
 b=i7jN4E+xn3ChVmvTKzK7XyPrWahNIfoD4Wtu2UQCTtR4Oa4x2N6UfCYkoGAp5BArQD
 bVjcAfAeDxnSIGGUJ8jA6LPjdBaKdU5aLjs4r9QY24Ayxi7VRTKFtg5SP6AJs83aU8we
 86pU5I0urg49xgijpiVl9firM3XZ4Hk35ySjuhH7HEfQdzn5By6zbTT93ai4+UKAWSgx
 J4BX/B71hU+tyyC36RBmCIS0veVl53ZQ/HiLUeC7DYykd5GAWAsfNHKo1PBVvkIpj9xQ
 TketVJnYfjo1HxWUOH8PrvhRK0nn+/d2DNDgb0iS8fDT46yAJwyaRjvt2ZABHjLwZNtk
 pq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440424; x=1695045224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQa+831csKF+bLc07F+cF6xTN80jpivchM4xDwQv7Wg=;
 b=oMzUyjYBiwRuExwkIIOllrIO60flMEliwaodEOxsaJI2AI7hunAuSil4V9KXz+oNxG
 ubltf2T9S7dubQQnGSWhzHXTgi0HPSayA0jPtFhUTXWuBrWrcyxjhxcbdR4AO0b2OIc1
 2c3i5zWN58xq3LQabJG+QLVIi3GWKehhxw0yKSqdhLWDFgp96Ns0LMFVOrci+S1W6RI8
 c45xDP1RAhlp5fX/PVnMXSOiPF79hmlg6sJIZ9F7sPC6MyEpfge/a2cc9CV7LlsWo35u
 nA2nyo7SuByz2b86rZqIbD8gzGJ6Cor3mfJnav4b0fGaIryz8TVtA6uLqEdY+4vYRG4D
 XGag==
X-Gm-Message-State: AOJu0YzcuhOaUarfLPrnomN7I7c543VOSF1slyht4ytEC/HSnE3raKUx
 kEJCx+f+ZvBXYDSByhoQkF4vCyFQd0Fsb35veqs=
X-Received: by 2002:adf:e10c:0:b0:319:85e2:6972 with SMTP id
 t12-20020adfe10c000000b0031985e26972mr7262992wrz.42.1694440423833; 
 Mon, 11 Sep 2023 06:53:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] linux-user/elfload.c: Correct SME feature names reported
 in cpuinfo
Date: Mon, 11 Sep 2023 14:53:35 +0100
Message-Id: <20230911135340.1139553-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: T4bVIDNI3GKj

Some of the names we use for CPU features in linux-user's dummy
/proc/cpuinfo don't match the strings in the real kernel in
arch/arm64/kernel/cpuinfo.c. Specifically, the SME related
features have an underscore in the HWCAP_FOO define name,
but (like the SVE ones) they do not have an underscore in the
string in cpuinfo. Correct the errors.

Fixes: a55b9e7226708 ("linux-user: Emulate /proc/cpuinfo on aarch64 and arm")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a5b28fa3e7a..5ce009d7137 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -844,13 +844,13 @@ const char *elf_hwcap2_str(uint32_t bit)
     [__builtin_ctz(ARM_HWCAP2_A64_RPRES        )] = "rpres",
     [__builtin_ctz(ARM_HWCAP2_A64_MTE3         )] = "mte3",
     [__builtin_ctz(ARM_HWCAP2_A64_SME          )] = "sme",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_I16I64   )] = "sme_i16i64",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_F64F64   )] = "sme_f64f64",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_I8I32    )] = "sme_i8i32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_F16F32   )] = "sme_f16f32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_B16F32   )] = "sme_b16f32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_F32F32   )] = "sme_f32f32",
-    [__builtin_ctz(ARM_HWCAP2_A64_SME_FA64     )] = "sme_fa64",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_I16I64   )] = "smei16i64",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_F64F64   )] = "smef64f64",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_I8I32    )] = "smei8i32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_F16F32   )] = "smef16f32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_B16F32   )] = "smeb16f32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_F32F32   )] = "smef32f32",
+    [__builtin_ctz(ARM_HWCAP2_A64_SME_FA64     )] = "smefa64",
     };
 
     return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
-- 
2.34.1

