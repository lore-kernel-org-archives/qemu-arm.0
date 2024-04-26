Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638676ejb;
        Fri, 26 Apr 2024 12:47:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLcJ/Xx0Lawrl7xdGOiaJpAt5VYjsCQqVkFrfZJxAVq+l0OJofJFGPn6vPdsjpZ/Y6Ko7O4oc4oIdny+oglB9GhGUHaMqU
X-Google-Smtp-Source: AGHT+IEIwd/h0kqohYm7/kke+8+dlcZwFIT85gaqZ2omrayPuZhQo3DQkGwWwtDStgNKoSkGmtWu
X-Received: by 2002:a05:690c:7249:b0:61a:b1a7:b300 with SMTP id jm9-20020a05690c724900b0061ab1a7b300mr3984809ywb.29.1714160831459;
        Fri, 26 Apr 2024 12:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160831; cv=none;
        d=google.com; s=arc-20160816;
        b=zlyy8iZy80vXfIzgHWtpe4EV012lVWGeq9n/FwoY6w7lgBPVA49htS++IWlH0+B0fq
         MXNQ9b0pw+QFS81Ox5sfknd1fltLGe4rqL26QgtXxLcA1Pyt25/N8hNbU+JfaVltvcWV
         N3TGo8SS6vVi+AbJp9vB+Ok9iLxbyvdW8dAPFBlAOwrLknfxwXI0nzMANvZczWDZzRNu
         DfuJ++hlEM32dD8noxP43d5M2RnlQTUz4FFwwVycekcqLOOx5xzkoWHlL2th1P3gf0af
         oKcaoaCEjJvkVJg+HKwawIlsp6UYXAMgdjaIFhyVSyw4V7QD08euBm0q/A6Y7FUxOIJt
         LZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rBREpUZQ0r3GUKko+t9VMOEs4AUMGwGQ0XgatsXxsV4=;
        fh=gUEsd95llBLtqUKhUnPIoHQ/SNwiv/bmtZ7rMzFWY9Q=;
        b=uFPZVz3ls9OLmf/SaaFVVLA8iuhHIM1IDhCG9Rp2I09XQuCttqjdpgoqTBQhtRhmG6
         rhqblNoac8bqyCcnjruOHo+N9xVXi+PaRrw1QrOTM317Y2WGZJkihOsvWMA19bN2SBaP
         ovvtIdOrLjMT3Clmar1gHmrC1zHa+I346k+vhxZ/XbuNqnupjcgyYfndjy4jQBi9i4lV
         NY8UholosdOkDV1HBGLH/gfh0jueA1Qx6gD6LVI24Og6TvqRtvRdFFBpH3uaFc0K9nRl
         6+nCTuPpmHQ2Mx9He7r82BKEN4GezvPgePjgQL0PieUKMtNI+D1QMsI+867zgpkTHloa
         zGRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcmflDGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05622a055100b00436c99f56c2si19458937qtx.96.2024.04.26.12.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcmflDGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RWF-0003tF-OA; Fri, 26 Apr 2024 15:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RWA-0003km-NI
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:59 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVv-0004ph-1v
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:58 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a58989cd1f8so330387266b.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160740; x=1714765540; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBREpUZQ0r3GUKko+t9VMOEs4AUMGwGQ0XgatsXxsV4=;
 b=XcmflDGOl8Qt98eajrPFbuXni1rhiWTTaGibRfYCpKbjL+q8DCDvVxKSIDweDvY6gv
 NTxVdZIMS+WhDt/YGkD5fgLSBjWPO3fnez78At/yFk0vP092Tqr5xon8BgJxu7iWqpBB
 PDMzn+TOSh3Agl5XuPsc1KgqOHCqOjF9bflWYi9zhHHEJW+o7B2GXpv2V3H6W7qVZ8Fa
 7JhQxMsyvPtMGbZRsYRuEDDklsaWbw+ZgQioxQKay1F+FxU17kNd7AvcwogxnsCJf3Q6
 9cq+6oVFRTK/b2K2WobBOjhaeqeSYU2JWpPnVhhCzhrqkPfsnL66gubkNAAHdeTh7e6v
 rhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160740; x=1714765540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBREpUZQ0r3GUKko+t9VMOEs4AUMGwGQ0XgatsXxsV4=;
 b=ThrX2GlrbYbA/d7WIMnTDuIZS6gXlaiunnXejKac9KYcRriONIcwE1FxCXunMLai8b
 tsLo0jkzFAYhEuEs9tyzE6Ce1Ec1oHjbQlnBQx4Y0YhrzvEMlw4FdYttg4+K19Y92B0Z
 dkfzpr0wezbzB9oz0vmAZAHOdvWwtLF/qts4XvrgHCCnUHhn7MI/6Y7aY8WlKsFurXRM
 8pNs/74uxmVtqrMFxbWW4/j/mBiIZpWr4BuEB2doZBiWz5SDjUOWkY61p/5TKgoXF6Di
 EFggyXmA7tqqzLFNOSKIrIDu/cdywwNaAFTUFFw8Acujdv+6vcRvwxgpEtWGF1eIVtxz
 cabw==
X-Gm-Message-State: AOJu0YxWmWSHuTT2GMZJ7Z2AGs7ZJ+sLFrfJDKA/EFHI2fczVVNuQDMs
 vcYQhMzEORXlryeI2Fe5sZrSXgCYr2Wlil3vFuQSGvduiB+rNeDc3A/yBMxuTME=
X-Received: by 2002:a17:906:2854:b0:a58:9a74:5e6d with SMTP id
 s20-20020a170906285400b00a589a745e6dmr335495ejc.11.1714160740621; 
 Fri, 26 Apr 2024 12:45:40 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 se12-20020a170906ce4c00b00a587271f77dsm5326419ejb.176.2024.04.26.12.45.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 37/38] hw/core: Avoid including the full 'hw/core/cpu.h' in
 'tcg-cpu-ops.h'
Date: Fri, 26 Apr 2024 21:41:57 +0200
Message-ID: <20240426194200.43723-38-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: GkrneXC4nc/2

Only include what is required, avoiding the full
CPUState API from the huge "hw/core/cpu.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240418192525.97451-4-philmd@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index dc1f16a977..9387d38748 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -10,7 +10,11 @@
 #ifndef TCG_CPU_OPS_H
 #define TCG_CPU_OPS_H
 
-#include "hw/core/cpu.h"
+#include "exec/breakpoint.h"
+#include "exec/hwaddr.h"
+#include "exec/memattrs.h"
+#include "exec/mmu-access-type.h"
+#include "exec/vaddr.h"
 
 struct TCGCPUOps {
     /**
-- 
2.41.0

