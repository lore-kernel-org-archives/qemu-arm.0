Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A2D606A31A
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXicbR4O
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNC8a-0002IW-R7; Sat, 31 Oct 2026 12:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8Z-0002HO-6j
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:59 -0400
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8X-0007jg-Kl
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:58 -0400
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-14394530ec6so2227790c88.1
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793464856; x=1794069656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fHHC5F8+tcKoUA5JCbuoFtrVUQBUacQIczqHYbjiSnA=;
 b=VXicbR4OxRvGQ50UZ1lUPfh3EThCX2HnDo/GYVqjultgk8sUvt1+cBDLjxCRkMdiA7
 qMKFmb05uj3aXWXOOEvee+EMDrJIcXVEOA8kTNPlVDzwgLi0HJAcde7B1OIbYjYaNl9O
 405Cb8/k2mOX/xt6KB9PBFnsB8XLsNdFAukDcoFncWloNlAQDbNXZ5nfSMvq6ZEApuDF
 LDPW1sMZ1J+HzaRRZiAHu0fNr4ySDhhVzes3YHN/WcruFtH5wlSuyYF50pAwMhSUoYzl
 7+mHH4IdjPjYIHkYXQH9UQAvgkzAHRgLVl7+tpJrzm30zFjvQJqRsnK7Qz1ysbx4yDMx
 ejfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793464856; x=1794069656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fHHC5F8+tcKoUA5JCbuoFtrVUQBUacQIczqHYbjiSnA=;
 b=liqlyaadWPyxZ7bgK4AWH7Ee7kuqa4KVO9v6/bg34l0YvwadXT/+bXdVGjVuqKB0ye
 HCPVbKEjr/QfYehKLCxtDP6Sg2Y39YSdLuIrhLMvLAwcIhxwsjwtBtBxYYeYdkEYugfZ
 cLbyGocc+CuP6CsuHLJBEqHignEcAAfCpR9CmspEy3os/D+6NsejUK03JMJ7sZg2t1s1
 aIYCKFbn829WLtqzSvGYNp/VPMhGK1DWExpxsT5bvO7511ivEfHZAkmPiffcKp8I0X+w
 aRzgxKbPsHa/G5qJzENs//mci2FmKXI/rWoHamVqD1vEI0Jh8PuNVxK1A6dnEL9TEiGv
 xTYg==
X-Forwarded-Encrypted: i=1;
 AKwUvByTCG3PvrcNkJbzlhx4jXVOo0Ovvt9N2lNkKsrrwWe8zHU31IvXCnZUuIpfxUMceO5sH3r2IBd0JA==@nongnu.org
X-Gm-Message-State: AFq9FYItPrUTBj+ok3my7OItQwZHU0G4NR1c71MBUZlD1ivC9X5nyDk7
 lkboep624TXk8Ov+DBgPPzoYaumPRuT50fU03PLbtj/jCZ1MSlvItwSp
X-Gm-Gg: AYBFou0gLTTvC6USfrgZwk+ckbIUAJHJ1ie/HPjfkIuT9cYKBMnPVn40UjMt4QYyOcE
 ldg1jnR/08ZpYlsH/ocmehiD58CXnVWsbKwWjwnyUgEG3Ltq/RX/2+r4p2aXEEPm1JlVwzB+MwB
 yOTAeRW9EDCsk99l/lBxH/CVOUSUELNuFYjfeAqMDpOSiGHaU3ot5VCPGwU4z9+hSu9j1k+rGVf
 OZsEvEmKIjz8I6btl19AmVL3wlA9LsiBnlSuEZrK+ZbNDCX0OrrQWSLVYSvMeZnMMUNrZ0cfU3/
 W/2x+EVs0VZezuJseU63MueECuPxG66DkOW7ua4q27G7B3wSDzRbrSFCw1ZdB6HSjiPegNTrbNo
 ippAb5p5AmFkdJoaqMBuFYbaVi+4lOy5QIq7Nyec/bcutSRx5BSEqrRMKhfhxhBtxz280cks5Rz
 vnUrkDEBLJswsKH06v01ZaJksQJj1iCwA/xEO+0e6tUgiJbdaGxWE5SX0YDu1sIk/Q+fqvGSetS
 8MHwo1KgScDMjxMi9jPQiUkDiyPZaoY/YBPnVP8SL/FTVZ82UJOzOFDWNxvQKvMlkahfBcdvCvQ
 9PB3Otu9s7vtg+2W85njdHmSu7YM3bp4QAMhZDozdtHjHPPxSIbfeI4BPdgHID7BFLxXeQ==
X-Received: by 2002:a05:7022:7f17:b0:168:3243:c937 with SMTP id
 a92af1059eb24-1ac5cb1c8b3mr9125188c88.16.1793464856216; 
 Sat, 31 Oct 2026 09:40:56 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac193b8179sm19574572c88.11.2026.10.31.09.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 09:40:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 06/12] target/arm: register separate max-v8 CPU types for
 arm and aarch64
Date: Sun,  1 Nov 2026 00:40:01 +0800
Message-ID: <20261031164009.2048-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031164009.2048-1-luoyonggang@gmail.com>
References: <20261031164009.2048-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

max-v8 was one TypeInfo whose instance initializer was chosen from the
selected target at registration. Register both initializers, and let
target_arm() and target_aarch64() select which type is available.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/cpu.c            |  1 +
 target/arm/cpu.h            |  1 +
 target/arm/tcg/cpu-max-v8.c | 16 ++++++++++++----
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 510fc9eeb3b..6eb55242980 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2695,6 +2695,7 @@ void arm_cpu_register(const ARMCPUInfo *info)
         .instance_init = arm_cpu_instance_init,
         .class_init = info->class_init ?: cpu_register_class_init,
         .class_data = info,
+        .is_available = info->is_available,
     };
 
     type_info.name = g_strdup_printf("%s-" TYPE_ARM_CPU, info->name);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index add993ef101..3240a8633ee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1203,6 +1203,7 @@ typedef struct ARMCPUInfo {
     const char *deprecation_note;
     void (*initfn)(Object *obj);
     void (*class_init)(ObjectClass *oc, const void *data);
+    bool (*is_available)(void);
 } ARMCPUInfo;
 
 /**
diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
index 65f851f2006..e819d07e6ce 100644
--- a/target/arm/tcg/cpu-max-v8.c
+++ b/target/arm/tcg/cpu-max-v8.c
@@ -121,10 +121,18 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
 
 static void cpu_max_v8_register_type(void)
 {
-    static const ARMCPUInfo max_v8[2] = {
-        { .name = "max-v8", .initfn = aarch32_max_v8_tcg_initfn },
-        { .name = "max-v8", .initfn = aarch64_max_v8_tcg_initfn },
+    static const ARMCPUInfo max_v8_aarch32 = {
+        .name = "max-v8",
+        .initfn = aarch32_max_v8_tcg_initfn,
+        .is_available = target_arm,
     };
-    arm_cpu_register(&max_v8[target_aarch64()]);
+    static const ARMCPUInfo max_v8_aarch64 = {
+        .name = "max-v8",
+        .initfn = aarch64_max_v8_tcg_initfn,
+        .is_available = target_aarch64,
+    };
+
+    arm_cpu_register(&max_v8_aarch32);
+    arm_cpu_register(&max_v8_aarch64);
 }
 type_init(cpu_max_v8_register_type)
-- 
2.55.0.windows.3


