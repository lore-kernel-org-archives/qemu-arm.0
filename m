Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933851njk;
        Fri, 24 Jan 2025 08:41:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFJoseV/ZcepxcxSjoxOlqWALgYg+ANuguGqbs2AOfUhtQlp45xohT6/e4/YsWG6dj5kTasfhtdOqGgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFLqIBuJ+nqIsF8Zo54btqfpU0QMU2P+3XDBvVuXmUk0Xq93xq0wvpAIyZaUHTRWRDdJvI2
X-Received: by 2002:a05:6102:a52:b0:4b6:1991:4f4f with SMTP id ada2fe7eead31-4b690c6b3a8mr28114259137.17.1737736863590;
        Fri, 24 Jan 2025 08:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736863; cv=none;
        d=google.com; s=arc-20240605;
        b=GPwpRjJpT4FL44Zol7JXyTsaRYSY1kGIiOB/Em+mJZEeYE67ibwHx73uc285E1k8/N
         3pBsnfgkMmU/UvWy5Y7m3Y9uSKDl53p6Ze78S3UlyhA9wl4LuMOy2wAh1bYe/3QLCeTA
         0F8nG+/bOvjVaijp0gIEnLkNrMbGt964FxIMakEn7S3JqZvvWFdBqJ0GD/NQTraTdZo3
         EEE7hdJKcl2jHetYkYwxr++/7bYK2sTLnKKM3G3rETpUzgeiTe9rkjwqeEPsKBROGev6
         B1cuMHuy0n8XKsyZwi+JrZcrwEPBthZacmwDi2WnKQJuNyNK7oDXgdGrmAKCcDVlPqEn
         CWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lA6x5OsofqZFLGhXUxXjPh4lmTqYPUIQ861yE8d4HvY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=KWEepDHSNFG+8wza4vzGCzt775W3Ou7UakAqNwiYwQGbJO+79MZqL/DL9X4FBAJYUl
         aC1t0v5gH1/g9uD9MWkoKdmsr2FssKxzRrSEMIo/unDlTIGWyHq0Weungu/4hYaUmbA7
         KjrOaquusMU9cJfXXevk4Ir8fM1xd1MoXWkU5LnwOaENmAaVhZ9LV9bOP958XoLF6e8T
         o2JOjFNAYnRh+GJl9a9ZGjTslQSTmG6pnj6r5kWqS5Bzti8MWrCklE/ME2x2SzOx5Fn+
         RxiLkJ+NN9vBpBpDPXJesHQgCVPqwqCtWPGD69BeiOh3QOa41LzmoKWIZvrELa/U0lkW
         zoTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0uuLkrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709754aa9si813385137.41.2025.01.24.08.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0uuLkrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMee-0002pc-0u; Fri, 24 Jan 2025 11:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZX-00063p-US
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:28 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZR-00062V-K2
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so15868875e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736209; x=1738341009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lA6x5OsofqZFLGhXUxXjPh4lmTqYPUIQ861yE8d4HvY=;
 b=F0uuLkrhRCUmYBjk8PmKKFNE5XFPsRUxziw4jPaCl52HmJn0AnpONVp/zxEzSThYJ0
 3fPCnsQh6XTSCDCNp8qR8zYt4EOkawy08X1h2zqw5sC10grHUI9c0zuLkXs6FstYNdsQ
 XDvgqTpELPxlQU7VkF6BCXQwv/Y2i4Nsc6hvAgiK5M2wG/6pgVYHqf+oB9v7Laujwiks
 46gI96cOt8bIYG9OK5vxnuXS9qbJC0GtFquhRhr2/fNlyd4BCw2rIYwi+qyaIymKp1zs
 udBd3WDGJ9S/U3rY0Vq8LqqsFSo+5oZG/w+3Ero1aUt3qedFHi6ZGq+J4QN1bc86M+x1
 BpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736209; x=1738341009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lA6x5OsofqZFLGhXUxXjPh4lmTqYPUIQ861yE8d4HvY=;
 b=xJCTPArB+EfVlDu3T0OkxHArZDwgsfNNTOWZBvzkhgKZlddh3YMdLJm/sIcO0mdxpD
 EoYFcQeUUsGtD/SxjIRcnuwAGN//eSXQbi4+ZaTQ0ySKxJ+L0PCj6iMTeckZCs5M+KDW
 7X0CfXsf4OEGFAMLj0/tf0rEe2apdw7hjhbruuc2EZCuxuvE36HQ9pcBvEOTaYy88wgE
 8iuHmtPfrL3mk2ErSVvt7YPRlPUphRbGF6bhCZROgtb/NO+R7QwFLZHctMcmU2ae9CaJ
 P5ptEkXUam0wyOMm/oHVUHx7tvYXAoF+VzZ+NTjLFIidiITBmI6XQcdLbClaf8l/+mZs
 Z7UQ==
X-Gm-Message-State: AOJu0YxTMTSYj5kMiQ57gK07FRK/pKGiuprW5uiMMbCsC5xwXLW5MmWX
 KOakRl9kbFjaHFtyvlGGW3FDIGM0y3RKWudXtpq5ceOCo5Re/Guw+ryljdv1X2EU7yRD6BWtvAi
 6
X-Gm-Gg: ASbGnctCbeLPxcjq5IXHnqKcn4aKFQ1s3WQw/s3hICGPtKMhMMJy2mFFcpNl9yRcWmn
 pR5S5hK7ht1Bhd+PHj9mgNhug4cMp8086RC7m4hv0GT+mEt1HuLfg6jWWjRh/1LkxYMV6XyPYad
 +X1MOF/MZuHKG/Qjhs8Y5WEX2SmCefIs5s7KF0dwXC0nmIT/7KfL8JCdEufl03V5yyuJunyi6XV
 npmAonV/vPfv+wo7dsNxY1usv1nvaU6u20//MstMHjVNWNWU08hCc2fgLpOqy7lvCSbrjee7WVi
 A6HT2bV+/Xg=
X-Received: by 2002:a05:600c:3149:b0:434:f270:a513 with SMTP id
 5b1f17b1804b1-4389144e70fmr297782605e9.29.1737736209377; 
 Fri, 24 Jan 2025 08:30:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 72/76] target/arm: Enable FEAT_RPRES for -cpu max
Date: Fri, 24 Jan 2025 16:28:32 +0000
Message-Id: <20250124162836.2332150-73-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nngd9aoklCwr

Now the emulation is complete, we can enable FEAT_RPRES for the 'max'
CPU type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 63b4cdf5fb1..78c2fd2113c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -118,6 +118,7 @@ the following architecture extensions:
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RME (Realm Management Extension) (NB: support status in QEMU is experimental)
 - FEAT_RNG (Random number generator)
+- FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SEL2 (Secure EL2)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 0bc68aac177..29ab0ac79da 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1167,6 +1167,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     cpu->isar.id_aa64isar1 = t;
 
     t = cpu->isar.id_aa64isar2;
+    t = FIELD_DP64(t, ID_AA64ISAR2, RPRES, 1);    /* FEAT_RPRES */
     t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
-- 
2.34.1

