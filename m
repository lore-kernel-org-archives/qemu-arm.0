Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63772CCFA06
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:21:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrgS-0000Sn-Cg; Mon, 03 Nov 2025 05:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrgP-0000Ir-Qf
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:21:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrgE-0004OG-Eu
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:21:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso1638458f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165248; x=1762770048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CufbQupGdsCIUBDT59fiOpwXVN1u/Jn4Hb62P35O8nU=;
 b=lxhU0f2N0M9yqt3176rNeIUpncbk227YvE0Auc2bPt//bemEGDMFWb3dGxvuuP/zoJ
 IHebshbXrpE4VeGewxhkcXdqNG1rR5Cvmc3B/l6+laOFg3ui9NDyXNn4O8l1iMtFDExQ
 RDCKb9jGhB0B8sof+JabwVjWm2Ux+mDpm+gYC3YV033A7AqW5ZecvJvYd0qrN9txi8L9
 2pCkMR6FBwwjS2forfio8RyugDvkCeEfGRmQeeoUC01CpR808dMbR68IrY0MHxjjFRpg
 i9oV6vnpoAvY7xL8lXgHolrhjLLCkloCrx+TLGZbMF7lbCKOCNIirevERYFqxHEMgjB7
 aqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165248; x=1762770048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CufbQupGdsCIUBDT59fiOpwXVN1u/Jn4Hb62P35O8nU=;
 b=RCc3YomblpI/Pl8xMrL+OU91kKrBBKkjWlzUVocdVwso8MMwulB/SvQXtaPXCZJApz
 5VNWjZVsg3k3GdmXHhuLXLf2Fm92Vl+djaDNGNsnV4JV61eAsAAj9HqTpHhd0OfQP9Cb
 5FFh7NZs3gol/3vvAbcf1S4jRBvzmP0Tdkt6SLPAT31E58bYO+qLUoi7fm1mAWMjUNgj
 zrek8muDN+igFNoD3OOz4RfBzEcGaIhJz2+zVDLnQQcmMk8A7RGvtoq7sUmb8RyMrjSm
 qwABKae0ire3m7NyMD9zatTs6zFPdZrVmVdeKSAolCx5nhDG/bwufliP/aRgEfd8MRZ8
 lmeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbORwBdg9v0Qxt2vNRRGDe4pWr9j10uURYFuYSYJ4d/73WjyBhhqFc/ZHprQIcq4Ou1X+hkvbUsw==@nongnu.org
X-Gm-Message-State: AOJu0YxN5bi9fq6Pg9jvPA7YOAA8eVYCHpsSLUsWsmx0esttMwJK1pAk
 Cg4AVsNlHOQ63v3sy9jRtNo67uAP1u3ehDGtweCqN9t7rvexol4fz91hZPDSb1EoNqg=
X-Gm-Gg: ASbGncuMxQodf1//ebH+R1GxVdouTTcSuUQHLvkOJS8Ex+ju2eRBimRfnL2YNKJgHkY
 ABSav+M5e+IpS8nWhskwerGMM+t/cP9p7s5IBi/OvxhtXBWemh8q6honng5Xa74P1dLBtqw/ro1
 tYjM00BkmHrwTHVD2HmEF0BFsaKgWNSelUmYEztgrwfYkcd1iuu+oxeGioYkAkOWZ6nEYwlOQob
 atzjfVIDWKmorGEhuzFOcUzjaGSUsfAND1mjoj7WYnh0GQZYeZkEIZlqBSRw0QhU2rE+RHIc/tp
 WwAe8YgEmo6o9OoiAB5YsNM5oqt0GyeoDwB71CcZs4229/JVopo1VTMQJLeZ5VUtwev+hft/Kjp
 PO0GPl2iIH7OJV3kUcpjcVuSq7SRlEjz25Ow98NwnBzESSZRwdYVW/T4MthI3tt3+ofddt/6t4u
 v7tgLJj9Nqa1fcTCRlWworflGDt6pcq3dW3ExhTGebiMiQ/vdwd1n3z9wXc16Kezx5R28+Eg==
X-Google-Smtp-Source: AGHT+IEFvBTZvHTIbsC+/DV3U1Q5+cJ69RvjEEz+/OjhJi2BYiQHf9lcDEdbIzBJ017VkjLagnQZBg==
X-Received: by 2002:a05:6000:2887:b0:427:e1bf:13bd with SMTP id
 ffacd0b85a97d-429bd6e1683mr11289339f8f.52.1762165247918; 
 Mon, 03 Nov 2025 02:20:47 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d28f2d29sm6299293f8f.5.2025.11.03.02.20.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:20:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 23/23] accel/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
Date: Mon,  3 Nov 2025 11:10:32 +0100
Message-ID: <20251103101034.59039-24-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index 268a0bcd8ea..60378075882 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -200,6 +200,9 @@ void hvf_arm_init_debug(void)
 #define SYSREG_PMCEID0_EL0    SYSREG(3, 3, 9, 12, 6)
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
+
+#define SYSREG_CNTV_CTL_EL0   SYSREG(3, 3, 14, 3, 1)
+#define SYSREG_CNTV_CVAL_EL0  SYSREG(3, 3, 14, 3, 2)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
 #define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 12, 8, 4)
@@ -2017,13 +2020,49 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
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


