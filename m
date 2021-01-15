Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp674843lfq;
        Fri, 15 Jan 2021 14:50:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykTFTqk3HNOJdVrDikwIV9scP72i8XtygQ0AWDirgmNOaKIkBcbFhnlNg/t/OQFl4gGrum
X-Received: by 2002:a25:8a91:: with SMTP id h17mr14842861ybl.4.1610751056231;
        Fri, 15 Jan 2021 14:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751056; cv=none;
        d=google.com; s=arc-20160816;
        b=j2GtQbLIdyl4Oc8ZKvv83inQh7p3aANemmf+tv/rzzT89rkdEAOrlOePaHpcyXHxDD
         NRrEmzGT+Hp2Vw7Mv6mOBn2MXYo6CpUqekUqCdFZh88pdCs3QYaiyqGmafTDJz7QtlLL
         jS8wxbCEWUuyBuz4jXMFJGoqAwxa3CXN38WFk9wytiSFu8aJfq9gro3faDkTJ6hOytGh
         T0doPhWQM020xkGw3Cmll/aEZy0P+4dXwo2K3KNxybawJjNLouMcb80Dlr5O285gQVwB
         UdQxs4+jdkqrfbWPaPVwWPwiy0iv5WnJnKgM8Rs502GbbYtVUb7uCeATHB1aFHXs+P/u
         AxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q6Vn8EuRt3zWEIGcR+Vsso1EpzS5NZb4Sjnv0xY+IUE=;
        b=Ji0MfD2ZMdNyU77z1Qlw9pQnbovWFaZegi1DCVUkurLfw2qpRY3lQpaCmyhHH7tH+2
         MlRlF3muymbky0XncOPrtyelhRieropqWF4GLO1d4jGozSQNvQ1SfYCES3otnpi3XkEP
         5WJInROUCjKZczfmQBTXlHgAEtOPrl0zERtGgqoHlf9FE9Tlx7FSRyamCv+v91b5QIlX
         zF/o21fPFObhQfKedJRIZQgxJ5gB+6ZdDWlv8+CqKnS9ghuju1zs4IZSh/c7JFPUyT6v
         8lPvZGzPgYaJOgxDMQZhfYSX4Ui5RtSZPJCXRywHp7gCV1l+MyzOcbEMYY7Po+Ik8C4O
         TyFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PaMRsJ4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si9637008ybj.479.2021.01.15.14.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:50:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PaMRsJ4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0Xvj-0007oF-Jd
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xru-0003WD-C1
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:46:59 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrr-0005Cb-0i
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:46:58 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u11so1155204plg.13
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6Vn8EuRt3zWEIGcR+Vsso1EpzS5NZb4Sjnv0xY+IUE=;
 b=PaMRsJ4AsTRmfgunMw9G8wCbtxV4VxB1Y1z9QfOjPTRXIaAdiK3IdR+RcWr7+RQjVV
 +5NEQMFyR4LvlAwjdEjoQ97GxyFyzv+Igw+PjGZnPtWaKBdm2i2I62Lt3mhEShKDLWKb
 RQVHuBB0r5K009sLlE/7GuVkX8lqY/NWLZKu9WwpBL0WTWSYLqokrupSOpy2itAf/I8r
 xzKYdyff9RMsNShrlrPEytol4MLV4QYtcmIHF9d17/OvZ34GN+wYxIRoVJy4rVvkegJ6
 1DN2OBlmCZw2Q4pRc2GZ8uYn0/uzok7N19XV7hNiy5EMdYYwoHXDn/jPqInbKKV2oEaA
 Pm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6Vn8EuRt3zWEIGcR+Vsso1EpzS5NZb4Sjnv0xY+IUE=;
 b=B29J401nB+olxr6k0C3vSmGywLNnBym/bhMngJcivASPRcLhVs5rAGNrUElUZpr2t2
 5cvcQ9bjKtqcKVoCg18A1Az33EWafYzPc/UUcvap5Dx03x3KdLuiCd5oVCG5DqwxCdDf
 TYbkOM9XmoQWJqSSXnednO+ac3LDuhJo0/X27vqNl4gmJuz6h1ydNR//7A4EUqcLWTTq
 DnDe5ADFlnrALoXNCrcckJhycqRtRChM3Ouobtw5b64cAQ4uy7VtAZXW7mZCN0MmY5st
 kES9/lA/BAT7f8ADq3T8wXl6Mg30fDyCFTRstNp0Ea0atdabxQdp8C1h1RTweNfpwl4I
 UGcQ==
X-Gm-Message-State: AOAM532/QCTjL2ufUxyG2oNjue/H0/av+K+linp3g8C0DZ7s9KnoN36Y
 bA0+AAszLHVOnmZ8MfRDK7tQTg==
X-Received: by 2002:a17:902:8341:b029:dc:27b:be2d with SMTP id
 z1-20020a1709028341b02900dc027bbe2dmr15083974pln.30.1610750813805; 
 Fri, 15 Jan 2021 14:46:53 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/21] exec: Use uintptr_t for guest_base
Date: Fri, 15 Jan 2021 12:46:27 -1000
Message-Id: <20210115224645.1196742-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /SfnI6NpPfkv

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 2 +-
 linux-user/main.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c23c77589b..c52180e8e6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
  */
-extern unsigned long guest_base;
+extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 65163e1396..5c8e6a4acd 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,7 +41,7 @@
 
 int singlestep;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 unsigned long reserved_va;
 
diff --git a/linux-user/main.c b/linux-user/main.c
index bb4e55e8fc..2600245300 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -58,7 +58,7 @@ static const char *cpu_model;
 static const char *cpu_type;
 static const char *seed_optarg;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 
 /*
-- 
2.25.1

