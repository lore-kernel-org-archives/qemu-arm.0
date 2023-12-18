Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724825eji;
        Mon, 18 Dec 2023 03:38:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1aktxnX7po+jAJyR0dXGdCdUeMFPmtn5ZX+fus/ojRR/UgVcsNGW9qzPHp278vZahmhoN
X-Received: by 2002:ac8:4e83:0:b0:423:aa14:ea51 with SMTP id 3-20020ac84e83000000b00423aa14ea51mr25010858qtp.68.1702899520956;
        Mon, 18 Dec 2023 03:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899520; cv=none;
        d=google.com; s=arc-20160816;
        b=il626FQpp+gkwmuSJUaDT7H2lTZGPaff24BlKihPGokhSKrVDcV7jHOm7k5UR+69PO
         nZTQbRgd7g1feiwTb38eeIqjjKMm8WWaf+h1P0O7ixBhehHcm3kX+vF5aLXva2iUz1Ok
         QUS+ntAecdcmND13PUTI3F4dKc6GP3c4w0oWT6LOea9Gq5ZScdJGFnabqwD9pTRcrvMO
         WHbEvq6zq6YkNTTw+3n4GKkAoY7A8LkFCRxdNRvPNnIsfqyMGhGCskgdI4mHzDaYLV3y
         t7EGDoQod/jmTFSLv6N40akMx/ZGb7tYoeZWQXMiIGiZdEoyE51qYoFtOCGz24nRW9Ew
         EtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rUb284RLcdGQfWf93deJoRyDRaWXUjDKOWFu048BNus=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=OhyGBeCR0eUGlGVraEs8iWR6b4SoQgtZ8Z153VkJupnwhAS8KRPNSOR+kuXjL43ieS
         ExV09+DyumHYX7LCtyZFw9HGM7bmLQJ5MZIqqqP7KzPbyWlMo592qa3xj4hGx90uoQpk
         V5wB+6Qbg6wHJRUj1fmCWrYARS7dWOZSclHGIYSRuaFIZ+boFUUC8qyQbP7aW37x5FNB
         Yj1dgAWcgCb6q4eMJ76VEDaZVROVs1lKqry4ONPK/W/fNiBM0OJ11+oJx/zfIgD/KPir
         XZaxQxF13AJkGn1v/wbPvEmunAs0GdPUYBp8hPNgP/VRR6vWEPKDBq3R3WUpP8tLuVOr
         lGYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuWxc7EG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg10-20020a05622a580a00b0042581e4d6f6si25361345qtb.547.2023.12.18.03.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuWxc7EG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsb-0007Zt-8U; Mon, 18 Dec 2023 06:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsP-00078l-2q
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsB-0003Oz-U9
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:36 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33663adf953so823909f8f.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899202; x=1703504002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rUb284RLcdGQfWf93deJoRyDRaWXUjDKOWFu048BNus=;
 b=XuWxc7EGvIn6Upc9E8Sb6LgH0Td+GZtvdIMYrEAJNDfJfMgF8LGAiLtxuqMfSvk9a3
 FiiMshbApzx1mQJlCf4NsgEkh4vrtffJ3D6PwkGiq/UMffFOB8XgDznGFnjbdgvPHIwC
 yv3T1cAuqwT8CsGaAJnmFkoQYLSz8Ib0mSyxnOrBRdxjsV/r2JuPqYJZ7g2/hseaYMS/
 9ReFRwbd5PXDr8EP3WsK4ysKn5hCb3MTtluDOzwAlM+BAM6G8sWqva+VcFZwMbyzylQB
 wH3hKVrtrlmM35OzxLloxts1ozn259ew+n9C2Ilj2HrbDm/qGY57B3KTDzkDXjLxezq4
 Oiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899202; x=1703504002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUb284RLcdGQfWf93deJoRyDRaWXUjDKOWFu048BNus=;
 b=YIgkFynahoEn08ohynDa+SVrAd2q3GETr2zGQcIhXoa40Na2Rv2fpmMntBsYGZdf9m
 V/Vs4zuQ2yETL65pbxkvI8Mvl6iLETTa+86ZeJvzSfRyQwoBANKykyRXio8mBTzYqkZW
 4Y/dG9zUMmSzL1Ycyrbb+XDED3bCf/VyUGj4e2RvLN8FbH/YJQARCNEyk9XsZ4xEpx81
 goYJ1sxGlxBl6JiOo5ODPK5GwJzZxqDUVYO/mxfUDCgnhC2p+mbZ0nmBNvvLWgDp4ugS
 RY7m93eoAVjMze6vt8rfgTJv3An2THKz7l1E0kfmJOduWfvheva+5OQrQ+GQI6NGzsEp
 8RRQ==
X-Gm-Message-State: AOJu0YwaSC9DFTbyWwKIhwr3tLInA6SWWZcnBa9IIrVj4zfxl+UeQorp
 ZiXisKrxjKy2DRkbCAtMt8muViUkfPiMqkpJxgQ=
X-Received: by 2002:adf:e8ca:0:b0:336:668b:d1ed with SMTP id
 k10-20020adfe8ca000000b00336668bd1edmr1166994wrn.118.1702899202578; 
 Mon, 18 Dec 2023 03:33:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/35] target/arm: Report HCR_EL2.{NV,NV1,NV2} in cpu dumps
Date: Mon, 18 Dec 2023 11:33:03 +0000
Message-Id: <20231218113305.2511480-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: vn2vIiJ81tcA

When interpreting CPU dumps where FEAT_NV and FEAT_NV2 are in use,
it's helpful to include the values of HCR_EL2.{NV,NV1,NV2} in the CPU
dump format, as a way of distinguishing when we are in EL1 as part of
executing guest-EL2 and when we are just in normal EL1.

Add the bits to the end of the log line that shows PSTATE and similar
information:

PSTATE=000003c9 ---- EL2h  BTYPE=0 NV NV2

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index da0c02f850b..d1d592609eb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1059,6 +1059,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     uint32_t psr = pstate_read(env);
     int i, j;
     int el = arm_current_el(env);
+    uint64_t hcr = arm_hcr_el2_eff(env);
     const char *ns_status;
     bool sve;
 
@@ -1096,6 +1097,10 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     if (cpu_isar_feature(aa64_bti, cpu)) {
         qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
     }
+    qemu_fprintf(f, "%s%s%s",
+                 (hcr & HCR_NV) ? " NV" : "",
+                 (hcr & HCR_NV1) ? " NV1" : "",
+                 (hcr & HCR_NV2) ? " NV2" : "");
     if (!(flags & CPU_DUMP_FPU)) {
         qemu_fprintf(f, "\n");
         return;
-- 
2.34.1

