Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180266ejy;
        Fri, 23 Sep 2022 01:48:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Ke6eCgTLJcURiH6RkXazxRL4sYPhlPTFhH6yhNXog8r3z+0vnDwuienPbfq1de/AogPhO
X-Received: by 2002:a63:e352:0:b0:42b:dc03:cc38 with SMTP id o18-20020a63e352000000b0042bdc03cc38mr6417098pgj.545.1663922899850;
        Fri, 23 Sep 2022 01:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922899; cv=none;
        d=google.com; s=arc-20160816;
        b=mhG2XQEw05oLqBagyZTZEwVb6bJTT8inaxoPejR0aBVsSL00qvbOvWTc59sgPQn/zs
         /2FG6oe402wP0PHIRPqBvlNKypJLlPDPnTsa4wB83fHaTXPW+ABjSS6+kHhXRViwUliR
         HvYkf0UC/0RX588XF69baq/e0cwQaaMRiKbgBGQQYZlF0FVQJDxnK5tTdgWw6/WQeDh8
         d4N2Flu2TFmwi0B+nQVW/7/JE+kgjQRHC8MTTHC71t2taFtEk2FvG74nEy2KoPjxu5gS
         wIcXFg3a9H/Vy4g9Bckxn6cvbvoSxMKsdre89kWnNNCDSCO2odi4SoG+yKaq3qVZoHbD
         8JRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=p3eRUasVvLycMkHCR1+QZ5Saom4oB8d9AFSscOTb4Lk=;
        b=gA44ID6ob/rYztAsYaRLjXZkSoQNG8ERy3NQ1MrTEjf0g5gE6lY7RelEl+S2wa+w++
         FPa2e/CxdLca1nQXrXQ1ZknKDEO8d+rK+GKXi7v9DwuHLROsEzNsnvzRV2qX7kzX8qCt
         An5eW6wuXdtFw0bS2likpAuKfiERBPpxLJQCxiG4jGkylXpez4CRgucSQrZj80NhQSlQ
         MJxC5xhwsxKlA/NRl7fNvhIY4gncPlYkIw2Swn9elee1PNn99MY7ysA/IqZS+8rkTm6Z
         uASuVUngx7NnvvgWZZ566B9wyKESaWA2uXxEamzG1Z/xZsC8HkN9yz+XkQkSWspLHXtc
         9JzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id r20-20020a632054000000b0042b6f63ce67si8436300pgm.407.2022.09.23.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5F6b6Qz4xGG;
	Fri, 23 Sep 2022 18:48:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5C2j1zz4xGN;
	Fri, 23 Sep 2022 18:48:15 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/6] cpu: cache CPUClass in CPUState for hot code paths
Date: Fri, 23 Sep 2022 10:47:59 +0200
Message-Id: <20220923084803.498337-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RYPGMSjn6cl3

From: Alex Bennée <alex.bennee@linaro.org>

The class cast checkers are quite expensive and always on (unlike the
dynamic case who's checks are gated by CONFIG_QOM_CAST_DEBUG). To
avoid the overhead of repeatedly checking something which should never
change we cache the CPUClass reference for use in the hot code paths.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-3-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 cpu.c                 | 9 ++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da1316..1a7e1a93804a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -51,6 +51,13 @@ typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
  */
 #define CPU(obj) ((CPUState *)(obj))
 
+/*
+ * The class checkers bring in CPU_GET_CLASS() which is potentially
+ * expensive given the eventual call to
+ * object_class_dynamic_cast_assert(). Because of this the CPUState
+ * has a cached value for the class in cs->cc which is set up in
+ * cpu_exec_realizefn() for use in hot code paths.
+ */
 typedef struct CPUClass CPUClass;
 DECLARE_CLASS_CHECKERS(CPUClass, CPU,
                        TYPE_CPU)
@@ -317,6 +324,8 @@ struct qemu_work_item;
 struct CPUState {
     /*< private >*/
     DeviceState parent_obj;
+    /* cache to avoid expensive CPU_GET_CLASS */
+    CPUClass *cc;
     /*< public >*/
 
     int nr_cores;
diff --git a/cpu.c b/cpu.c
index 584ac78baf96..14365e36f3a1 100644
--- a/cpu.c
+++ b/cpu.c
@@ -131,9 +131,8 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
-#ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-#endif
+    /* cache the cpu class for the hotpath */
+    cpu->cc = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
     if (!accel_cpu_realizefn(cpu, errp)) {
@@ -151,8 +150,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->legacy_vmsd, cpu);
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
-- 
2.37.3
