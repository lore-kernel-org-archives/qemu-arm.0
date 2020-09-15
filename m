Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2795752lfq;
        Mon, 14 Sep 2020 20:12:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPz9VZzapVTKfqALhtcuRmHiuRebzyKqIndfqUZk2pUnMzKAjjxzu4x11Po/eGrDdPSdKD
X-Received: by 2002:a5b:904:: with SMTP id a4mr25406499ybq.59.1600139563836;
        Mon, 14 Sep 2020 20:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139563; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy5t9YpWgKkiu6IN0luuapz0rj3HiirJLwGS6MheUn83hHpFpsf1d9IqRMi0xkYLvY
         iAQFE+K/1YmkqIWKbX0IB7Jg0fBBpvVdcYSnScKPoiUkzTLNX7mMEmX/wFr8hjqXB3+5
         K5FssiIDpXWAVTBee8bChoHXXS3WFf3b+nVdNVuh07i8IF4IcsO2lMRA/Co9OZzBnTZZ
         CIaLMWnxl24DYi+BEWy0O0tSN3X/WIsx/mviZBWSEtzGo6yeeoginqKHPHtn751XAuAK
         vu7Ysre8rasQnvXXyebhnhVK6v7XQeZMAEOA8Z9kz/pT5DgyTXgog+JSptSkP83H4xdd
         fvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fLJn3KGoDv4U0zm6QvQGS4S6fFA4pWWn06jbXE+Tvuk=;
        b=HTXo9CplV7dDFsybVVRojWtWxJgtUZg16zyjGrMEPdY1A6rwoOfl7dpzmtMIVMl75E
         KDiH2GGV0ysPQABuVVnBo8Y0Lof/JdJq/xNRA3qk5higyC0vgzO3t0LT+mQr1LYTNlJq
         mwyRoxtI5gZEYlWVz4eYLfqJqQhwZgjPvd21uO1xww0UgsDNuo9WrsC8Fw+YqWVWE5r6
         fmDPPkt8+XKvWR4Spoz5UdFbyyKqswJmid4ghyTy5Wk69ksFgOVx129bbwO36RizPvMu
         Y4m3b2QWor02dcSB8Xd7x7gP+P9zEQADusFgxm/WdWma7/6jc09OS9flKu/Olc15/Yul
         kotw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wridOrpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si12269823ybb.384.2020.09.14.20.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wridOrpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1Od-0000mC-7C
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O7-0000Et-CO
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:11 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O3-0001fl-LA
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:11 -0400
Received: by mail-pg1-x542.google.com with SMTP id g29so1243034pgl.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 20:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLJn3KGoDv4U0zm6QvQGS4S6fFA4pWWn06jbXE+Tvuk=;
 b=wridOrpG5CScKhmqwIxVFGd3J5VE6XNpo8HYGuvrk0FXgI0Z7wJXOCIUwexMCAfh5h
 xM8RAk+ObbXIZDY/MjfGaqPksQE7S8w+62/6DXBcygOlnKp79q8bPn7EgY6eV27Y4cwU
 2xfIJWFymvYSzuw8eHQBbdFp/JCKrnz4a3Km9BSsfeInn1Q7vAayZW+yS8ewMg3vL/1q
 JHq5f4AO9mXeOcWrLPO4koLC0hUexM96RpTs6GEkAXGsJeudV6u2I9G3DBq+a53w8N0p
 1r07yf0FLknjnwajCNM6st1Z9Xhtf8XScHm8LsGIUWhwYthyyjTfMr4TkhvO9QefR4j3
 +xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLJn3KGoDv4U0zm6QvQGS4S6fFA4pWWn06jbXE+Tvuk=;
 b=J6ZpCg882KhIN2s+QfSgz827gKxbtNL2Qf8vUj5d4fiAPzoHaEfU15E7QLHRjWsVEn
 dV6VmfIhs7FnfxL5Q2ac/tEYPvyUYRQtc48p25wd/dkRpXGAyvjiq0kpwGLtc2oRsmle
 q+/p0MSa1hUhf1GYjsvIKZYadQ1ysaipp1pEydllNhfGsC8uf53HCo49132VBeVbH3z9
 s6NsiQ34qf1ND2RJ+JuQCqwyiu6bdqRJ6Awv4jvlVuaaGG8UzUeTQBGcW7uXzflPwSGj
 c4979x1gVQ9y7KggF34NfXbpn3fnPjEuo2qv9jsXemfDijtr76ypYMWGwJ9t3k6uMY73
 QWTg==
X-Gm-Message-State: AOAM533uI61hgxXcbPbue5Fnr01HbbMqpx6vh2R/p7In1t8XPYXdwntg
 My3orw1y1ZsuUM1I/iB1P5vS
X-Received: by 2002:a62:17c5:: with SMTP id 188mr15658196pfx.148.1600139526235; 
 Mon, 14 Sep 2020 20:12:06 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:05 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 02/12] target/arm/kvm: spe: Add helper to detect SPE when
 using KVM
Date: Tue, 15 Sep 2020 03:11:38 +0000
Message-Id: <c32b0afe693c158115499da7b32321011deeedd9.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iBHYjQTW6xIY

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm.c     |  5 +++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8bb7318378..58f991e890 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -214,6 +214,11 @@ bool kvm_arm_pmu_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
 }
 
+bool kvm_arm_spe_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SPE_V1);
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index adb38514bf..f79655674e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -283,6 +283,14 @@ bool kvm_arm_aarch32_supported(void);
  */
 bool kvm_arm_pmu_supported(void);
 
+/**
+ * kvm_arm_spe_supported:
+ *
+ * Returns: true if the KVM VCPU can enable its SPE
+ * and false otherwise.
+ */
+bool kvm_arm_spe_supported(void);
+
 /**
  * kvm_arm_sve_supported:
  *
@@ -366,6 +374,11 @@ static inline bool kvm_arm_pmu_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_spe_supported(void)
+{
+    return false;
+}
+
 static inline bool kvm_arm_sve_supported(void)
 {
     return false;
-- 
2.17.1

