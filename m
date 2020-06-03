Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp30608lfc;
        Tue, 2 Jun 2020 18:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzejckWnlhxrd8uMy6fTgvP4oiqpcg/RP9eGqzKuxdi0rDw5NcGvk6gKntbq2+ZyFPnN3iI
X-Received: by 2002:a25:d295:: with SMTP id j143mr13213948ybg.65.1591146810565;
        Tue, 02 Jun 2020 18:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591146810; cv=none;
        d=google.com; s=arc-20160816;
        b=lKjKd9iUVXVflEPyvnkDuLAP/XM0Hru0SzUJDGs2uPsCedy24HBG2d/5MpOwviKGED
         UaPf7DKRjN9k6odbipTySQ2BvqesdruacG1Ibnh92ShJhlpnQbdAoueT44y06G0kM7xU
         71kixOma0r3P5uOQkf6fKyTePJscf9NXJajJ+VtRDUAjS04BZWvY46PyehjZXtsSqa/6
         ROUReoWCAUFMSm21fwnKpKMDBpqgfH0Im16ROboPxqq9E/2/wShoZ98wfLBV+AgcnbTC
         l4UVko8tMWr+Gsag2vI+XQ09UGR8WPUAtkSW6PlPLFQOcWkU9uKMB6Cj6L/D2ZiJMR/I
         Jc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OzobXxmD62KwDEFdjrZjAAighBDtrTCRu38jKjN27BM=;
        b=uMgrPLepcPSLlcelancaq6b+IRl3nyygzDwRlC0lyg6GEx+lbW4WrZjxVVsbct6793
         EU62k6FwIuSA02IACCgmzSznUyPD2XSOtQh4ysRapy9aoDTtBy/ZL7ghc/J/6AlBg//f
         X+3NU65C9t3WNx6CL+j+aiwiJ78806xntGOxFlI2zPp1QSDTN8SfZZHwc9Yf6h4ViJ7h
         x3c56rGTiLESjrcLIhT8yv2DBCkc9oT1DuJ5GRJ+WzofvX8bV4DKGimh9I95wyPoPVEs
         OXPIgxgEELgTv2CgSe6zLUchRSrfZmoC32ErJmfwrU1YYaY07aPhA32/kbCr9MBOqEwB
         5mvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZT0kiUc1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si315710ybf.446.2020.06.02.18.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZT0kiUc1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgHyD-0003Hm-QA
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy6-0003HK-MF
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy5-0003U6-EI
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:22 -0400
Received: by mail-pg1-x529.google.com with SMTP id w20so545331pga.6
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OzobXxmD62KwDEFdjrZjAAighBDtrTCRu38jKjN27BM=;
 b=ZT0kiUc1Ujlo87PPHi9f6LpaacySTV6JqK01cnZQbuxrdlllwF9L9JfwR+IPMtpQo9
 eXepl4920HFBg9PcADbYfdDMUiWrkAwB7miHPLicJPYoAfuA5uS+IBaNwiIz2GEfyY1N
 4eRMidlP2GNbGI9eliSbGzrbmGcDK7vInBFbC+LRLj6jICk16fXlncNUg+S6sNQ5/9pv
 xNRQTzxw5/TyCq7H9UFqX0eN+Ytnwn/pF/qHy/jc0iQ/HkwY2g32D/17tWj11D1Mo/CI
 YJrw1KFUk4VPlKKYqqi2PAIdVi7RY4DsjNQYdB9lSH4/EuHR8td81wRKHGHoA/adcsX8
 AWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OzobXxmD62KwDEFdjrZjAAighBDtrTCRu38jKjN27BM=;
 b=CiNVecUq/jVuviycDhEZywbblXycdtMFrzdzAQfbpdPv90rijBMkISRSXpE4hdthRq
 WU8Ucz8LdwpH9+6Cu/aUFSQ9bcG+1RhTJWPGQdmp1pRMMKBPxr3k8YBEqo1onBEHuuPl
 2uB/GL6cvy94HbMiJMV3W9RFu5CrUwEXTdqcJ8riuqQs9hExNmSXiEGJQpscAoGUqmon
 MjJKGKtSLCDyktxlMEv1CAWtAEkm0b+j65sS0uiP59AeyqgBLFXW8o9nQVf+WVv2OiwQ
 ivL3NsbrJ6/RZsCQp8jepKvUiXaPFY8UxndfPR9YJF0x0VHrfKETNgxUtOvyUTLUsPNw
 xDMw==
X-Gm-Message-State: AOAM530oOdGKitmHYqa/oOBxbVtJPk3hxi2Yllw/uF4lloA78jhhmceG
 /Tirp9slGaot3uzneeCZKHvkhg==
X-Received: by 2002:aa7:8b56:: with SMTP id i22mr20028587pfd.63.1591146800024; 
 Tue, 02 Jun 2020 18:13:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/42] target/arm: Add isar tests for mte
Date: Tue,  2 Jun 2020 18:12:36 -0700
Message-Id: <20200603011317.473934-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8h0Renxmu91e

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 677584e5da..f8ac11e73b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3814,6 +3814,16 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+static inline bool isar_feature_aa64_mte_insn_reg(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) != 0;
+}
+
+static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.25.1

