Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F114C44500
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:47:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdQ-0007AB-HO; Sun, 05 Jul 2026 00:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcE-00051z-Kp
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:03 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEby-0004F4-7V
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:02 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ca1479dfe0so21656115ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226265; x=1783831065; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWeC8sovUKFGxLFpRs93xUZHyuZOaYN5bdNXTrhkucI=;
 b=cC9q01OUBlRXqol6yGorabAnkYudCFr7BfXr78NWmn4JfsHKSBJDUX7RvvIKPV8TJG
 ztyUygPuVJfsqiyLp3JlGcw8TyII+YyXZcoW3V+fBYXI069r2Xk3X7zyNqmSskr0kc0T
 S069kHha9ZmWAnmVDRdGPOx7va3pyx36gAmnLOAZlIsrW/bwG60tigP9QOpD7x6vkhRa
 y4J39ISJfC33S5Oql0hHagmeeKUI1QVaJui7zQPSD8+FwP0dmhStyS5Ok2Qx6MGTtGRS
 xR6Vhqg9mBjM73AC1bOx29DB0Ny+t5EqSGmMeF+KiuTRhKVm5NVYOPKFkiY/GgjAdjXP
 NvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226265; x=1783831065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LWeC8sovUKFGxLFpRs93xUZHyuZOaYN5bdNXTrhkucI=;
 b=LgmnxXSDYGuSfSicTgzWNxjPTHFCAjZ35nOaZvGcAGNv5dj07xiBBhqQrPW9Kz4G27
 WUkZ1x0txbykpFGyHU4HHX8oqvKLIA4XrpZ92F1O3YOmMPwBDyPnS4aWsJuMyMSM48hM
 OxSJyy3R+3OZHVGc6ZzdGsrLlh2KFP4OgV46V1i4Lg2iuAAlsM0Q3dKb5UMg5r/UgvRp
 e8asLeiDA0YPXyW8yKMG9EruH1I9ozowCk+QOoPosG/s12UEDKLGEX8CO+ZyxCOb3UdY
 d6l52FfSLlPWvhvu9ZnFFg58GgPHGQFSxZrkW1OFbgxVutYEy8oP7LNCr/vtVhNoMgmt
 L1xg==
X-Gm-Message-State: AOJu0Ywil+ba8DVH9CJUOXA3OLroJceMBAXIFvl/p+igXqXPagaHpn7w
 qPYHSXG6crqdGuc8S3Akozq1epmiTTNU9QDiG5vXdVYjm1/PXrSMYqythnzdgzOWH1oNL3DJuu3
 OEvkC
X-Gm-Gg: AfdE7cnLGJlpshGlJ2KFRGu32qiSvJUb5MWsooBzaHk2Q5za1f/5xc1qo4Jtl+YmeZB
 8pygB9HpnXuxx/ZGfXp9gKfFFxoVVhainVnZYdano66ClIEdB+0B//NJdKuDyvXb8W1DYM/raCf
 iSCBkujlYr0GLnR7XCka0whQvSpvBxKkY5UWOK7jOJnZSht+VtzN4QEPi56oZXTLxnn+omKXa00
 v4xIQVCmV/UsdkYAQXYpwcx4KdLEc0BA+i2asqDIErizR7+iSLBcs8DGDQS6Du0qk9nd0JxDHag
 wDsz5E4BZ3GvKU7SR5xY/vSzDWG8tdQmutpSxCanZYKpQ+DyrfPM2++RYwiBJBNzetxHgfw4iMl
 f/n8i6iURz/avQMctI63LVhFay/l0RPfAPhULetrMvxc1XXcXPW9wl3vrzZ/i/U2avZgmbhDonu
 9m6y+tWys1K2rzXB1AVWNZaE74WeuVjr5CP/vN5HofFeqolyw=
X-Received: by 2002:a17:902:d4c7:b0:2c9:e261:95ce with SMTP id
 d9443c01a7336-2cbb9ee3915mr50012645ad.30.1783226264680; 
 Sat, 04 Jul 2026 21:37:44 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 20/46] target/arm: Make check_watchpoint_in_range static
Date: Sat,  4 Jul 2026 21:36:59 -0700
Message-ID: <20260705043725.1373137-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This function is not used outside hyp_gdbstub.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h   | 1 -
 target/arm/hyp_gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 370876851e..53091fc73e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1966,7 +1966,6 @@ bool find_hw_breakpoint(CPUState *cpu, vaddr pc);
 int insert_hw_breakpoint(vaddr pc);
 int delete_hw_breakpoint(vaddr pc);
 
-bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
 int insert_hw_watchpoint(vaddr addr, vaddr len, int type);
 int delete_hw_watchpoint(vaddr addr, vaddr len, int type);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index bb5969720c..456a09e766 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -182,7 +182,7 @@ int insert_hw_watchpoint(vaddr addr, vaddr len, int type)
     return 0;
 }
 
-bool check_watchpoint_in_range(int i, vaddr addr)
+static bool check_watchpoint_in_range(int i, vaddr addr)
 {
     HWWatchpoint *wp = get_hw_wp(i);
     uint64_t addr_top, addr_bottom = wp->wvr;
-- 
2.43.0


