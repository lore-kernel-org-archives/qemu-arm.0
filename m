Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9080281lfc;
        Fri, 19 Feb 2021 06:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd1JdciM5P6ZkTXB4CEIXdLyPmb6lCBkJ11zWC1F8O4eQDvVFBBKX/8rLP3bnkNK1VEo+8
X-Received: by 2002:a67:f581:: with SMTP id i1mr815292vso.27.1613746345641;
        Fri, 19 Feb 2021 06:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613746345; cv=none;
        d=google.com; s=arc-20160816;
        b=taHqs/9rk0Wh8q8wlom6NECjY/fRScW7x8SrXohtcUWEtt/z7JxwyFoVL0+qTgUJTI
         bde4wWjvbE3Xfmnzcy1KP9ADeiCK6JGltz9DUiBJlnn/i1ipHoy4BffLKQ/d/KOqcA/i
         bqFz1BSASbU/YMRCOIZVUrVJqIzFibRRESog43XiXq23W80ml/8SInK/UP6sHhFd7OUL
         RrxGw6/1NZ8z92pvnOgoh920FCZEP6Zmupm6bV2bhbAADCD0WQfZn3pV8qFVozcsrtbx
         jB+MNMRKEUYsswdev+BocrZETgaLGT6jDOomRpu6jFGkctk0qhtBMiHBnzslG6W2pAsc
         FcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JjzammxlnoyyAwwWhFgyD6FVkMWPaU3DMBqWjhwZgfk=;
        b=bvYBCMfOb2R1WxYBokVdBU06UtfE/zDj2ef0pjsKdZqAc8iYjxJYYie9F9ptgksj3n
         Fyb3kdlEEQMNssRytUaNaykzeg1/xZqJ24LaOxjAnzyxuzpXNElLd4gbDqLFlM1dBgC7
         n039GFCWOipRimrisCuixnKtxdQKp4xslvKz1v08MAve2SMLM4LWZcNbu0g+uXLkjgST
         pdlQC5P2ZHymiWZxFTMYNA0eeTakas/jWIiBzCwr8GDV2yw6U4Fw/FGsHFzntrMWMJGM
         TZd2oIemIAJt6s5StlPkaFwbeq0E9jpZBgf6s+IPznxD5JkwYdLoubmkrqDOMFXsIhfM
         obpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yelb6rlN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24si1782395vsq.348.2021.02.19.06.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 06:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yelb6rlN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD78q-0007bt-Vi
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 09:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73I-00028E-JO
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD734-0003Nu-M9
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id n4so8911065wrx.1
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JjzammxlnoyyAwwWhFgyD6FVkMWPaU3DMBqWjhwZgfk=;
 b=yelb6rlN3TMEUdtSsK4E/CbAAHpVpT7NJIbyy4l/jesi59UhvzYB3mkkvU85KkntT6
 tId7Xw/jX4G4HBiMb52ChjBO4IWqU5EiGplFf1EhCbGqpcGLrjZ1j5/k6ykpPbvjcqNk
 Bc/LeYKxTRtBD20jiSAnO52EvtoZ+9NAhdWw9AEzRgVtiyNcjex+R3v9MPqTT5RBHtu9
 iMOLPe/C0il+QaVUG5o3dxuG2G4YArdFt/UCjZyHl841apvkTnpuvSYi8r2Zh/4ARgB4
 yDu/GPLli58I+3UTMXUZoozLlzf2MKorE58NLgJeh/2SyzwryKOZtmoiTpWq8sF7PFYK
 ti6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjzammxlnoyyAwwWhFgyD6FVkMWPaU3DMBqWjhwZgfk=;
 b=OKXEYaqtI+4VhFOu7V7gkaRQdKCZpOzDwrUzyjC6GQmUdcOa0EAMI/ns2lvhOYZT1w
 Y4wGuCyW/qRQVAIk7lkU69hYHyObv7DsfD4cwsYEYJFnQmu/i5g/NWDLT2XM6G2u8xNK
 nBiCztqvweY/u6uKz0ByIPaiqCYgTIncd9YcpNOuxcLI2h8jPqM0UBkchDZycrBq9Cw5
 33sXrWp+spHCNpfegKaqzyAGpe2xWnDjJnBr4g1vMlukLOvpphEjrfVuV6yygYWsWpiV
 8uLSMJgVEp6KdqvwJWkmNB/8ziKDPTchonq30ZcdAKMwWHBanKfwLVppC0dmINLojha9
 iJmQ==
X-Gm-Message-State: AOAM531vlGZbjnIpjK+bLjAo/19N4eWV5l/0Gxg0qQATrI+rRk8pzgUr
 9TIivfUyb89n3CbJm6qQna+tIFE9eDPDyw==
X-Received: by 2002:adf:fa01:: with SMTP id m1mr2165556wrr.209.1613745985002; 
 Fri, 19 Feb 2021 06:46:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/44] hw/misc/iotkit-sysctl: Remove is_sse200 flag
Date: Fri, 19 Feb 2021 14:45:39 +0000
Message-Id: <20210219144617.4782-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBZyPsOkfjM+

Remove the is_sse200 flag in favour of just directly testing the new
sse_version field.

Since some of these registers exist in the SSE-300 but some do not or
have different behaviour, we expand out the if() statements in the
read and write functions into switch()es, so we have an easy place to
put SSE-300 specific behaviour.

(Until we do add the SSE-300 behaviour, the thing preventing us
reaching the "unreachable" default cases is that armsse.c doesn't
yet pass us an ARMSSE_SSE300 version.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysctl.h |   2 -
 hw/misc/iotkit-sysctl.c         | 256 +++++++++++++++++++++++---------
 2 files changed, 187 insertions(+), 71 deletions(-)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 7cdafea3e25..980c2ddfd3c 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -64,8 +64,6 @@ struct IoTKitSysCtl {
     uint32_t cpuwait_rst;
     uint32_t initsvtor0_rst;
     uint32_t initsvtor1_rst;
-
-    bool is_sse200;
 };
 
 #endif
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 34b37fe8824..c67f5b320ab 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -101,28 +101,48 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         r = s->secure_debug;
         break;
     case A_SCSECCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->scsecctrl;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->scsecctrl;
         break;
     case A_FCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->fclk_div;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->fclk_div;
         break;
     case A_SYSCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->sysclk_div;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->sysclk_div;
         break;
     case A_CLOCK_FORCE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->clock_force;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->clock_force;
         break;
     case A_RESET_SYNDROME:
         r = s->reset_syndrome;
@@ -137,60 +157,100 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         r = s->initsvtor0;
         break;
     case A_INITSVTOR1:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->initsvtor1;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->initsvtor1;
         break;
     case A_CPUWAIT:
         r = s->cpuwait;
         break;
     case A_NMI_ENABLE:
-        /* In IoTKit this is named BUSWAIT but is marked reserved, R/O, zero */
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+            /* In IoTKit this is named BUSWAIT but marked reserved, R/O, zero */
             r = 0;
             break;
+        case ARMSSE_SSE200:
+            r = s->nmi_enable;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->nmi_enable;
         break;
     case A_WICCTRL:
         r = s->wicctrl;
         break;
     case A_EWCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->ewctrl;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->ewctrl;
         break;
     case A_PDCM_PD_SYS_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sys_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sys_sense;
         break;
     case A_PDCM_PD_SRAM0_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram0_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram0_sense;
         break;
     case A_PDCM_PD_SRAM1_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram1_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram1_sense;
         break;
     case A_PDCM_PD_SRAM2_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram2_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram2_sense;
         break;
     case A_PDCM_PD_SRAM3_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            r = s->pdcm_pd_sram3_sense;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        r = s->pdcm_pd_sram3_sense;
         break;
     case A_PID4 ... A_CID3:
         r = sysctl_id[(offset - A_PID4) / 4];
@@ -284,94 +344,154 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         }
         break;
     case A_SCSECCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
+            s->scsecctrl = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
-        s->scsecctrl = value;
         break;
     case A_FCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
+            s->fclk_div = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
-        s->fclk_div = value;
         break;
     case A_SYSCLK_DIV:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
+            s->sysclk_div = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
-        s->sysclk_div = value;
         break;
     case A_CLOCK_FORCE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
+            s->clock_force = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
-        s->clock_force = value;
         break;
     case A_INITSVTOR1:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            s->initsvtor1 = value;
+            set_init_vtor(1, s->initsvtor1);
+            break;
+        default:
+            g_assert_not_reached();
         }
-        s->initsvtor1 = value;
-        set_init_vtor(1, s->initsvtor1);
         break;
     case A_EWCTRL:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl EWCTRL unimplemented\n");
+            s->ewctrl = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl EWCTRL unimplemented\n");
-        s->ewctrl = value;
         break;
     case A_PDCM_PD_SYS_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
+            s->pdcm_pd_sys_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
-        s->pdcm_pd_sys_sense = value;
         break;
     case A_PDCM_PD_SRAM0_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
+            s->pdcm_pd_sram0_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM0_SENSE unimplemented\n");
-        s->pdcm_pd_sram0_sense = value;
         break;
     case A_PDCM_PD_SRAM1_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
+            s->pdcm_pd_sram1_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM1_SENSE unimplemented\n");
-        s->pdcm_pd_sram1_sense = value;
         break;
     case A_PDCM_PD_SRAM2_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM2_SENSE unimplemented\n");
+            s->pdcm_pd_sram2_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM2_SENSE unimplemented\n");
-        s->pdcm_pd_sram2_sense = value;
         break;
     case A_PDCM_PD_SRAM3_SENSE:
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto bad_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP,
+                          "IoTKit SysCtl PDCM_PD_SRAM3_SENSE unimplemented\n");
+            s->pdcm_pd_sram3_sense = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SysCtl PDCM_PD_SRAM3_SENSE unimplemented\n");
-        s->pdcm_pd_sram3_sense = value;
         break;
     case A_NMI_ENABLE:
         /* In IoTKit this is BUSWAIT: reserved, R/O, zero */
-        if (!s->is_sse200) {
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
             goto ro_offset;
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
+            s->nmi_enable = value;
+            break;
+        default:
+            g_assert_not_reached();
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
-        s->nmi_enable = value;
         break;
     case A_SECDBGSTAT:
     case A_PID4 ... A_CID3:
@@ -443,15 +563,13 @@ static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "invalid sse-version value %d", s->sse_version);
         return;
     }
-
-    s->is_sse200 = s->sse_version == ARMSSE_SSE200;
 }
 
 static bool sse200_needed(void *opaque)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
 
-    return s->is_sse200;
+    return s->sse_version == ARMSSE_SSE200;
 }
 
 static const VMStateDescription iotkit_sysctl_sse200_vmstate = {
-- 
2.20.1

