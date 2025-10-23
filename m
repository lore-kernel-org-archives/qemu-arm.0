Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37856CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:40:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuUq-000661-60; Thu, 23 Oct 2025 08:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuTv-0005FE-9E
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:31:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuTs-0008O6-Jp
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:31:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-427084a641aso551217f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222705; x=1761827505; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9xBVWd6FRt+OGCLZ6nEzr4EP/14LH00UlqrogCUybs=;
 b=szpLmfg2FC2G7G+igeW45fL7idbOcuRAt1Pc3SO7bF6x7DShjORFITgZgnBX16E2nR
 UihLWS9qucJ+p+vKF0BeRPVk6hj4B/DpuUNsmhqlczO7kNV1J1bOYxzEILLJB+CheXLs
 vBrjIMByAmyOt3QV4ScXBdGaeF5tO6+3boD7VfFh/VKUF1MW8BlehrQ1ui7GSdlc97fR
 QF1aKMRrr0nhRgF9Tiu7J1BzGjI1yCcbijC4xlibIUdDoh9dWGv5XKVABgETOAYUkhVo
 XV3pzdf9zq0fFL5fc5+Z+t1zSqWupgR8B2MMygkG0ic7mc2UuUrVUjUEOl3j+Mb8x4y+
 mImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222705; x=1761827505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9xBVWd6FRt+OGCLZ6nEzr4EP/14LH00UlqrogCUybs=;
 b=balXlsTR+mJAIW571cR0JryDLd/R/F065lZ373fwv5qhfqy+dlFAuV4gwLZ6MnypVH
 jDmXWbCMfuk46XVaUtWc78mwEqL5cKNJXKuBFJGpqZwi0dv3F2hIfgmc/7fzaf0RGomN
 UhOe4oaCAery2EIEZa51h7TG37MPIbvY/X5GMGfXd6rRO/+RaioiJ+K0EvCKY9oZJtSM
 DAoZ+EoQXVeBXRI8Rio6PTAZMULEOszJlfYKMCEFqkWYqMNX18GOxQgasyA8TG2SGIFe
 UD8FSW/+X+s++wWZpEc/iAutWo7X8fcWP0cltCGgNy9T9wmrsZvQKEYQYRnALi+FqBj6
 bCPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0LNpP2rOaZIw6reBdJy6K2lNcjo7e1+tt0I33sGL6zZvh/9JvKkd00OGIx//8EyOTWOV+hnQpnw==@nongnu.org
X-Gm-Message-State: AOJu0YzYeBTotrgUq6/o44S/ExxeFyfBPUbgA719V5VhdUI23VCWHXGy
 jQQS+mBoIbDqePOKdojrheLZjDemAIcg80VviXye33To5bHOLzDF0kuvBg6B64fSJg8=
X-Gm-Gg: ASbGncswumx3Zq9DztoEsIt+JuXmu4lSi6yykSv4xeRHh15Jm43+Qt1GuxmY3vldxVD
 Z9EE1ONgMLlQqmkkMlnTZ07R0WzsPifJ+eKTb62Oam1bLZTECPoEIHTTHnfDqUiYDFg98wJD+zh
 hreIBf7RyaY1wsX10/OC0pq1KxrUPkTBeLg0m3eiAkHL/ywmeGGlrqQT2dFr3XpI05bgVcRNHKX
 S1O6WKmz7qACEJAhsmsPZtITNU8TK5eLGnk6EYDIpZDlBihHA8oKFfj2cK2RXr+zqiyEPgwBf3a
 SnpWZhwawByFiYY4ScE/CrhMJYQ0Wk15g7NtJl9+9TAncY9oRUGtA6RfBp0agipgkpfdP3G6vwz
 ennt9+WBhy5SGnF1VcbEyt5LMNMLPv1LKx4ubkbv84bxohopsDhfjIC3q/J8/NJoF6Qoc/IbQ0s
 5QVvZARdr9/d4Y9VmrVOWmOVIfYU3n30U2GBGWY9fauHizlpVVkg==
X-Google-Smtp-Source: AGHT+IFepACm3K4zjIZUTmac3W2rSbj15b968A/27aOp77LvhZzzmOLCvTNXq2XWyWm8tmCnMF9LEg==
X-Received: by 2002:a05:6000:428a:b0:428:3cd7:a336 with SMTP id
 ffacd0b85a97d-4283cd7a3a7mr14311255f8f.63.1761222705120; 
 Thu, 23 Oct 2025 05:31:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897ff371sm3744166f8f.21.2025.10.23.05.31.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:31:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 50/58] accel/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
Date: Thu, 23 Oct 2025 14:31:34 +0200
Message-ID: <20251023123142.8062-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 36fa67caf62..dbf6b83532d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -201,6 +201,9 @@ void hvf_arm_init_debug(void)
 #define SYSREG_PMCEID0_EL0    SYSREG(3, 3, 9, 12, 6)
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
+
+#define SYSREG_CNTV_CTL_EL0   SYSREG(3, 3, 14, 3, 1)
+#define SYSREG_CNTV_CVAL_EL0  SYSREG(3, 3, 14, 3, 2)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
 #define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 12, 8, 4)
@@ -2009,13 +2012,49 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
     return ret;
 }
 
+static void hvf_sync_vtimer_pre_exec(CPUState *cpu)
+{
+    hv_return_t r;
+    uint64_t val;
+    bool b;
+
+    b = hvf_sysreg_read_cp(cpu, "VTimer", SYSREG_CNTV_CVAL_EL0, &val);
+    assert(b);
+    r = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CVAL_EL0, val);
+    assert_hvf_ok(r);
+
+    b = hvf_sysreg_read_cp(cpu, "VTimer", SYSREG_CNTV_CTL_EL0, &val);
+    assert(b);
+    r = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, val);
+    assert_hvf_ok(r);
+}
+
+static void hvf_sync_vtimer_post_exec(CPUState *cpu)
+{
+    hv_return_t r;
+    uint64_t val;
+    bool b;
+
+    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CVAL_EL0, &val);
+    assert_hvf_ok(r);
+    b = hvf_sysreg_write_cp(cpu, "VTimer", SYSREG_CNTV_CVAL_EL0, val);
+    assert(b);
+
+    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, &val);
+    assert_hvf_ok(r);
+    b = hvf_sysreg_write_cp(cpu, "VTimer", SYSREG_CNTV_CTL_EL0, val);
+    assert(b);
+}
+
 void hvf_arch_cpu_synchronize_pre_exec(CPUState *cpu)
 {
+    hvf_sync_vtimer_pre_exec(cpu);
     flush_cpu_state(cpu);
 }
 
 void hvf_arch_cpu_synchronize_post_exec(CPUState *cpu)
 {
+    hvf_sync_vtimer_post_exec(cpu);
 }
 
 int hvf_arch_vcpu_exec(CPUState *cpu)
-- 
2.51.0


