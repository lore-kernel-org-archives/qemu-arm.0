Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2074196lfo;
        Fri, 5 Feb 2021 06:48:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb3Ye5n8dZCS+qVmNCPHCoRJLE2igjP+wCLgeVFXbweRoHGhsU++5bse11nKSnKrya+rbH
X-Received: by 2002:a05:6902:102a:: with SMTP id x10mr6932550ybt.70.1612536526823;
        Fri, 05 Feb 2021 06:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612536526; cv=none;
        d=google.com; s=arc-20160816;
        b=POSPxQ8lPFMJC5RilDSAl2aEWnvvmjwkvV96olfETeHQolhxfJkdOIdfW8vrD/vqih
         7WTdnamEakeExpohh7dMCmf/+yJZNxpPhzKQ+ZJOGsOFtIoEarAbidYm522o+P47z5Xa
         rXBlJ6JiyNk+98TRo9zwSEW1byE6vbU9AMkYygKZHP0f0dWvQZ8rbZx8BWjOZYH8mncR
         J5eXBCClZZgxJGmqqdqEPfnHA0OGc2fTy6SxDqQ/wr7CeYmWwq7HTdVKou0ODdg4sK+U
         jJrWRpEI3Ni0ei3ULzK2qrgG4K9YopxZUKBDphAEudUBTzj1mgwxFQ0ClU215a1KQ/8/
         bafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gjWjrkoo9fwMU9Sch1mUKkw5VscVbA8NCnnTZX/2IUQ=;
        b=kJVWDmgYeai1gfyQkbR/FqKlIxqsiyt9V1VYQCHtNWfXkIISJ4rNc+K8meP/KRQ1lJ
         k5cUTi4OVvie2u1olord1sio6gsxF0Hto2BYZUy+ok9pUhMJ7bvUMdUarnCKuZ2556Bk
         16wv7MKYVbRFQVKktkWjeTTcjZfwsB5i8cqfv+ru+0uEn1VmcnkLN+Pn3Mverynbwz8/
         yPatzCTFObw/SJnIqfSNhsKimRHHAVhq1MzmWyxSAQPXYP7+PmphFYHDyHMhpIaoH+KE
         rsfPwguotqnE1eSbQ6GHW/32iN3/brssBlKrm/zmNRZj2y0VWaM7V8+4mhOGaVSkW1Vy
         U1Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YfbL3wd7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si8570226ybw.316.2021.02.05.06.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 06:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YfbL3wd7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82Pc-00077p-Ok
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 09:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Lj-0003Ia-Cs; Fri, 05 Feb 2021 09:44:43 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:32938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Lg-0002bB-NP; Fri, 05 Feb 2021 09:44:43 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so9109472ede.0;
 Fri, 05 Feb 2021 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjWjrkoo9fwMU9Sch1mUKkw5VscVbA8NCnnTZX/2IUQ=;
 b=YfbL3wd7WIFvDX66J6x/emlBwMT1vunccIADjGH5sA4zJ/cFFH+CrHhF7uOUJBg664
 JZMOaMoGEKYIXEX6q6Dv3gnJCQwTdw98g/8Uh4Zf9GdgGTPkDZz0KPypUwra1LHb2608
 nvejPdqhCSGmvdDxA2ZSwlOtqiuorJgOM1Ia2etQUCTLYQIU+vUKfGCTXAsTHKm80/62
 X1mrFC7nqOdzl1YEpve4azx4vA/4JKMHno6PCGoUzxFl2KK8n7lJwAPqG3QNOmgm5fl6
 2Hxls14icc2CsOCssTn0V1furNTPQIOa0nVvbO+prPo9EQudmofNp9WJXUAV246yKH9c
 iEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gjWjrkoo9fwMU9Sch1mUKkw5VscVbA8NCnnTZX/2IUQ=;
 b=l78Ovalr6my6hWGs/Vq2PlRdZVnkvfpz0BaVmJZsJiU4IVSu/LjoHklNtj83i2+HLA
 QV2f41cpc1d2DQ5FHR10zznSJgJcAzYEO8jVrP3+dyJ2lteFw1RXIWZAhJTh3rbO8E5G
 Wn2VZG//QYIfv2vYeS81pdndOnpbh7VH74hDpkdXY3nzeq5YBE3DouP5eRSBZBWpMtVy
 qMpfj9/vEuJtBB3nlg41Ya9SSNGmM48ABwbvAqgoNBHuNQ4UAoNuv4QewBiQwpGQj3WJ
 9aLrRWP8GOmTS3w++lY+reT7eajBmQRhzekDATGjtZogMclI6kIRoAfCc9eMQISVeHXf
 kFcg==
X-Gm-Message-State: AOAM530Zjhk1S7HO/x7aGod11k3ayAu912sEsvau9r+7KeFtT3rbrESy
 okJgzbtewejGyODOfwngNqw5vcmF8Vw=
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr3755462edd.158.1612536278411; 
 Fri, 05 Feb 2021 06:44:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hr3sm3883275ejc.41.2021.02.05.06.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 9/9] tests/qtest/arm-cpu-features: Restrict TCG-only tests
Date: Fri,  5 Feb 2021 15:43:45 +0100
Message-Id: <20210205144345.2068758-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DWccwix0nE5X

Some tests explicitly request the TCG accelerator. As these
tests will obviously fails if TCG is not present, disable
them in such case.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Claudio Fontana <cfontana@suse.de>

RFC because of the TODO.

Roman posted a series to have a QMP command to query enabled
accelerators.
---
 tests/qtest/arm-cpu-features.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index c59c3cb002b..c6e86282b66 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -20,7 +20,7 @@
  */
 #define SVE_MAX_VQ 16
 
-#define MACHINE     "-machine virt,gic-version=max -accel tcg "
+#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
@@ -41,6 +41,16 @@ static bool kvm_enabled(QTestState *qts)
     return enabled;
 }
 
+static bool tcg_enabled(QTestState *qts)
+{
+    /* TODO: Implement QMP query-accel? */
+#ifdef CONFIG_TCG
+    return true;
+#else
+    return false;
+#endif /* CONFIG_TCG */
+}
+
 static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
 {
     return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
@@ -352,7 +362,12 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
+
+    if (!tcg_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
 
@@ -387,7 +402,12 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max,sve=off");
+    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
+
+    if (!tcg_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
 
     /* SVE is off, so the map should be empty. */
     assert_sve_vls(qts, "max", 0, NULL);
@@ -443,7 +463,12 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
-    qts = qtest_init(MACHINE "-cpu max");
+    qts = qtest_init(MACHINE_TCG "-cpu max");
+
+    if (!tcg_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
 
     /* Test common query-cpu-model-expansion input validation */
     assert_type_full(qts);
-- 
2.26.2

