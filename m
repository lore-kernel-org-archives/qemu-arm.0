Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp558283njb;
        Fri, 4 Oct 2024 09:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpWl+gyWb5Et0MW7nog1Ou7HREZJ3zUk7DCMo24G+tkTiYW1W/CqQ1okyJRWrYASb5XRS6Uy1unFKWBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHvEYeI4mQo9m0MEALAluoxzDaALog/97/XRoCDneeHFnDAE+XpW+0Ux2MkA3sp45rnjmnL
X-Received: by 2002:a05:620a:1929:b0:7ad:832a:4063 with SMTP id af79cd13be357-7ae6f432b64mr530306585a.7.1728059053799;
        Fri, 04 Oct 2024 09:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728059053; cv=none;
        d=google.com; s=arc-20240605;
        b=Ki1NJiPWgfN7LVfeWg4EaZH9KGdU5GJ3GvKCn8j2w3l2P18W9NK1/ehlKXg+WkzKBb
         ZSQTb/NmQLdQP5IE/wEn0FN1mVTuOjkgC21U3uEJepaNuNIwlqZp+6RFLVvwHA84LlxJ
         xRadyilJx2xtl6Qz/YzZ5xa4DsUgd12wagESoKUHauPkCW95EH0OxB4h23oefGDr51ma
         fUOyD59KPn8Sq0tXsNZ6Xvq+vtOh2mw8lefjvbuWuumWeCNiHQHUN+ChH7yzl/tetqgb
         B0J02aJZjiHLcdQ+fXkn6DKRC2BJaT1SSpd0ZUQcyaBan/OGNkgK4TPWdNBlX2/dXnQd
         1OTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nhw11vsNB7sU+tP522HMuXKhN8uIssw/t+jNogdyCDQ=;
        fh=QX+Y6X5/NXmSWDBdpt89cXIwKeNmX0J//0WgHHO6dbI=;
        b=hrDs27+n+dt1M01z1GIPQjZvaskxwNdABk2CceWtSQzz5PMc/NrHGWoi6xx5+PwH+Z
         gwRWn1lcEDW4rnH5KNvxOFfM/xyxqWODM28uhLVcsuoTjwe2dL6xC0yc4eUtM/Kn8zti
         RleHyqdqNvD0AMphJ19hI6s8odcpgho+yFc3bGovgTmZ2MDYeM8LKYfFk1KkVRTYblz/
         wxw0hJmY+52DE+RldFbZI815pK5dNEINq1UMQ46cctaUkGmT8nZ4Qw/zM2kGi7KVtftE
         NGPLeDDqA6vaK57zmPBSnVZpL4MIrzhZ3aljn4HITV7/1i1d3J/0toPUclNE2xYW/uA+
         fwEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JSCsNJ4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b762f9fsi394038985a.212.2024.10.04.09.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JSCsNJ4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swl67-00011W-RG; Fri, 04 Oct 2024 12:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl60-0000vN-MQ
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:24:02 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swl5w-0004Xt-EA
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 12:23:59 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so3343828e87.0
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059033; x=1728663833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nhw11vsNB7sU+tP522HMuXKhN8uIssw/t+jNogdyCDQ=;
 b=JSCsNJ4/h4mDFcEIhn6sh/a5cHlTQB0CClsvKocKhtPvyhyblvIgqCujFye5hkL9lC
 P4HGffO9jgJf/A3qRR+AUliJMiJ1vvDTpBAEEpO4bJy8DgfTUAMMi3M3aiOkwy8wkNlJ
 T6XDK2shCOscBdQjIaeBIzFTLvig6SBCHKtqdTEmn3q3cmjpDN/LqrPoJp9VCf1nsE0r
 JmbEM1eq6FynZsw93quaNYNC1jDTPNfIPHSunCwGpbTFZB5bKjHZnehhxtLWk6Wp5145
 F66b2OaScIJ3gzd4NvFlEBWVMPF5jENLCZZaE7oYbi0tM1lm79ULgYTDppaJWmWhBs5K
 S1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059033; x=1728663833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nhw11vsNB7sU+tP522HMuXKhN8uIssw/t+jNogdyCDQ=;
 b=riz4edSNtX3Sc1ZiNGciE1RggCwvbC44VHqUdUKuQz2LK0R7TbMrO0tn6u/6AMfdbo
 YJZM8m1gvmuxelwQ9la0o/nBopYWxC8sYq/lnQ+x23fjnv9kkEDpFFx/CfLQiyZJR0xt
 76/1Jk1hdQzbrCqakUwr/mHV/KX1VPDzRMOlvTf7rWvYmzImT/2F2kIkyNaF8YoryXIz
 0CQsjNMKmsogtQp6awd134QB4Nm7s7u3UkJFXDbY6tq73zUOmS4r4EynlEUba6e6hhUp
 10fuDPfHmBNujZv4hQOELUpxC2+HNPHDjQ7CVc0MiuQUy3Yw2cNwJjlkOPPdXEWxmyjf
 mRPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIIKTBstcDLB6+X5ZGULkQac9Qail10+Skr0KluR2pDuVePQIjj226tPvbqyWH4dGnRsiI8QNLUA==@nongnu.org
X-Gm-Message-State: AOJu0YykteoHHLxrDLZLPOIG0OljxHlbc/hjGVK+BV6OX1VjGfBD1UST
 xroau/psRXfKCY82CH44UU56yFGtFvPXb17T0tL2yaclZkQnRYd9J6f/p6N57+g=
X-Received: by 2002:a05:6512:a96:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-539ab84a43cmr2465175e87.3.1728059033509; 
 Fri, 04 Oct 2024 09:23:53 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.208])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec83efsm684e87.75.2024.10.04.09.23.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:23:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 8/8] hw/core/cpu: Expose cpu_is_big_endian() method
Date: Fri,  4 Oct 2024 13:21:18 -0300
Message-ID: <20241004162118.84570-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004162118.84570-1-philmd@linaro.org>
References: <20241004162118.84570-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: sJwOhSiOIx/i

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 8 ++++++++
 hw/core/cpu-common.c  | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 22ef7a44e86..2550bc98dee 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -608,6 +608,14 @@ extern __thread CPUState *current_cpu;
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+/**
+ * cpu_is_big_endian:
+ * @cpu: The CPU whose state is to be inspected.
+ *
+ * Returns: %true if the CPU runs in big endianness, %false otherwise.
+ */
+bool cpu_is_big_endian(CPUState *cpu);
+
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index aa5ea9761e4..277c4ee6720 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,6 +66,13 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
+bool cpu_is_big_endian(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->is_big_endian(cpu);
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.45.2

