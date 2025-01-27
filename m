Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2378711njk;
        Mon, 27 Jan 2025 03:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWomrWytqY2/zyLt3ntLFk9AqzAFk++bWrcYlnKp9OwSjCOAb0ArZ8McClo4sUUppqFluA1VcpGQd5XLA==@linaro.org
X-Google-Smtp-Source: AGHT+IFV/hfckpPls8vX9mvHpbLhh9/GYubKUoAY0CYKhLeCGC8ijeNly4rGGazhhNaKN/u6BQ8p
X-Received: by 2002:a05:6214:240a:b0:6e1:715f:cdd0 with SMTP id 6a1803df08f44-6e1b215a5bemr627078426d6.16.1737978984513;
        Mon, 27 Jan 2025 03:56:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737978984; cv=none;
        d=google.com; s=arc-20240605;
        b=hwQcLYtQZj/YyI4Xrj3bWV4biZFURy+yY/USCyO35gRjmj+AQwRTRrEcrDNu83CCMa
         7xIsOHigPCIf3M6n+RWzy4XvC9K2T6BLMBwJZPSK24TNz7qnwDA7rZKMRsQFOAgRB1g5
         9nzUniMmFdU+3BFJrb04l8BBqFcZ8yAn4d/Uez2Fv3IVMM5yo8NIIOTkoE18cM9T4rJq
         z3UQvfRyWgIe+aO/jPeRBUvych14hOOQtzy2lVXNlFODREug46csnH2exFAen0DCLbgF
         f8NylJpp9x2CMu8GqiIJYtporWKmtrvyWHOt0YD3ShHllZMrzhbXbWbyeFn0OG5VYNpO
         IVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JX3MnHembh04tcm3f0aOQ5qd9/M1w32l0pc1xIgIK0Y=;
        fh=UT36gCECAOtEsgOrSReymFda56t2Gj969DHeMwsi3As=;
        b=e+0vSa0imwba+plQkQEcdiswibC4VEc4+/0pHxpgxUCj/nSeaGHinpzf2Bzqnhvrki
         tLcBdu5sKVaTBZIpRhGorLyklg/M1kaKsKnNdWmNjFTAJgfiF94+YDZbZqx3pb/xqtGt
         rRYJ+wfXn6Z7d2XJWFzlUwFPA38vxlp2FXLMpMY1Hb9eCSgnDy5hPuisojpThVeLPCBP
         q/aIBh9naQn8DpMFPU4+Enltr8y4d/NKcpAi8zxPaBE3Hj+lqND+KTq73lW3BGMmu5Oj
         4qemQjsgm1UexnpzrHByghoC86Dqmoxp25XHSqd5NQSp/eIE4xPOOTZI5QYmJGqhiRTP
         dADA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRRuP110;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205f00af9si96956776d6.283.2025.01.27.03.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:56:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CRRuP110;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNik-0008PR-LH; Mon, 27 Jan 2025 06:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhv-0006xJ-Kp
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:55:21 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhs-0007Ad-GE
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:55:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so47205675e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978906; x=1738583706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JX3MnHembh04tcm3f0aOQ5qd9/M1w32l0pc1xIgIK0Y=;
 b=CRRuP110n/bB1EYG+advtZI+agZNuvNdW4Lp7K3IM3FHsVcPvhwF0DSV2YypkZj3db
 ddbGpDUZky1gOIF8IBQ3PhKFhspIjm9hnDyOLakJnO/PeC2UrnXmsPwsz67+KtgJ79mi
 hy3yOZTkRlSXyWm5US5ASxlX5D+idxObKplBa2LJRHd4xiVrIpiAeAzSqb0Pc6Q4o5Yy
 oR2c/+Dz/2HjddgAJ55ClmYkB4Y+4CnhLsdDI03R2t4tsj9+wJL+Ke0BbM1wzOPRpF8z
 ZjrarzDZ4wfY2OESQiJ01OzK/epaZDgJ8AfwOBO739T+xdwZnRJ6fWRW84n2hNEYfHPT
 SrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978906; x=1738583706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JX3MnHembh04tcm3f0aOQ5qd9/M1w32l0pc1xIgIK0Y=;
 b=Ot40ZpQFU5h75kF6Few126RuFnHwnNvWxzoYXQvU+ApAtkJFe3vNKyJ7OuDhNezII0
 Iy5X3djejvy4n+ZRx7yIMTIVPVbp/m7Bamxod9hnV8P5OcsqrZZmja480p+TAz4RVRFt
 MjmFS6rLiU9/7NYzsgQvghS9dFehSlLKLVJ+ppz5wFbbpscBdxdvuF8h30H7qtA1HWuB
 EKNvT3kJu+CF4mxZfd4OIXOnHQA+aM1+09b5/qaII2vpRXbuBbQqSEBtvujRrvS1BVz+
 O6wFIiRDJasj5TSSM7LB57QHAbLemmKgQAtwzd6xlqbShNSZT0MTywMb79f2uUr0shla
 zlxQ==
X-Gm-Message-State: AOJu0YxT/n0lBbDPJvIzl0A5pv8az7hPu3zncnyBXqJ9A2O+bGrojjv/
 H1MiiahR6rP3Dc+m9s5WIGjFrVyoGS/vO9XBbxwhZku9Q2Nl+oqqPOA2SM7PKMg=
X-Gm-Gg: ASbGnctax1B/hFuT5tEVfQb5LKc7aoiJY/cd10weng4dZs0tqTHCuKbrum6TfJZQ1K8
 CrmKWnS2ed6tUCqqcy5zsJ34cDmFwVqPbiJfmH69x7UknzY4KbL9nl6Oddrrm6F1tCuK87In/FC
 QYreNDdDXrcFq+F04E4XbtigQ4CiAH894T2fob5iqJf+iB//TBgl4BtW4KHiEN+9+MCXRvKph+O
 CkUEZ2cDjy8GvwuSFsvGCv/FpiqavX316/YEng2Jn/7U6USRl3RV62c0FUHyYZ4iUUXaNFTkdlF
 u97VNLj8zyU3ZRB9JDl1MmC4x3sWTeba/apBnc4qbQnPu4kXhS0Ehds=
X-Received: by 2002:a05:600c:6c95:b0:438:a1f5:3e41 with SMTP id
 5b1f17b1804b1-438a1f53fa6mr346012555e9.12.1737978906511; 
 Mon, 27 Jan 2025 03:55:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54bfa5sm128347995e9.25.2025.01.27.03.55.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:55:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/10] target/sh4: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 27 Jan 2025 12:54:24 +0100
Message-ID: <20250127115426.51355-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: IgqeOGnh/ZRX

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index e3c2aea1a64..9d3e6cb2fd7 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -134,6 +134,11 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
 
 static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
     info->mach = bfd_mach_sh4;
     info->print_insn = print_insn_sh;
 }
-- 
2.47.1

