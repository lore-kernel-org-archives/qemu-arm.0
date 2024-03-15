Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990046eju;
        Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOOH559r5pZeAJzc6RvIgavNC9BHCn69AurrccQJygY3wF8OQzsLSe7oEv1Iszq0dDelFtRAgv/BJ2tjeuU/sNoHxVOSUG
X-Received: by 2002:a17:907:a0cc:b0:a45:73b0:bcc3 with SMTP id hw12-20020a170907a0cc00b00a4573b0bcc3mr4393385ejc.34.1710508255858;
        Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508255; cv=none;
        d=google.com; s=arc-20160816;
        b=hESIYa0VEaS8+fWHPZhk7aS6nSePhRZ/9vkUyLHOv2oyo37f02zJjvAl+JtwHDg6Pi
         fudUQ0kB7UNSH/HU9TYUMKDGEnG6YmfwrNB/t3xZJvn6pZVuHy3WF+x3OEbweFmZNZxz
         xBev7kW9NztkDjxhDU6JEu+ls42g1h/hD5HlYJLzxQaZgtg76cMyhmBA6pThcYn4ciID
         U5lZic2lIva57OQ7dVyBEcV32FYhIobWp0HuiHn4a3JdWciXcwJjwYKRxAccvvwfcYQr
         gWkVUHIKG5Yo+09dR2/x9E2ebAFj0CXSvvPgKuGEh/jN8ul4Jiq/H0u3PX2NbprSkn2V
         6zIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XKSoPbdfR84sDrdE++VJn8/NPQXAflULbgNG03R7vOs=;
        fh=beHVOBiTOHWrTf34JPc7gjbuQiirkawKrj7uOxuUq5M=;
        b=eAYjXKnY/d1iUbIO5VmLhIo5F60BEGrw6KK0UhXxp+5Xiu23EZuFEfyRYwnScZq48r
         ARBr3NZo24+nS9elRquLE6gtDRbsrpfhITjbZajc7i2ZHLSQEn5tiy1Y9yOIwJQHoKzs
         9krq8UO/I7qlQnIuWZYxBCWtC7zxjLZzRlPLvujm6G2vGhrsot2Cs4q8H8K+UwtYOLbr
         R26xN+39TUAqm7SvbKCbOYqN2NVCJzqJQ2CsswSKbbhDbV4G7HINulq1/C3XyjrQsI7J
         h2bZIsbhS5aC9QcvV/1M9SCLnuimgKqHO9Tn3X15HTGIymf8X6i6oXOUzhNKGVopkNvM
         BawA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBgOJXq0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w7-20020a170906130700b00a46617ed435sor1795336ejb.3.2024.03.15.06.10.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBgOJXq0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508255; x=1711113055; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKSoPbdfR84sDrdE++VJn8/NPQXAflULbgNG03R7vOs=;
        b=tBgOJXq04rsLDHAamOQeHasT50TaQjp3f1td6Sbt37LJqQfwxyNaDS0Y5zoWrYod8e
         fm0xCxktTkPWBtGNUt7lA17b/5duKp44x4DcFaNkXbdrL1+ZQbHPkRTCtzD5X/pHWd4B
         RV9BFMqdf7rvF7H5YZvR7ZwOm2oZkUbQCxIDgkZlnUjaGKUdDyM6rVjPkoQHFl6X4NIq
         SjGqJzfECsTuCCsjWEWqLI6H5uEQVddLPuTEPd6gyHNI2hb37XWWQR2JwuY/jwm1wSR9
         m2FSjWUUZYv1EPfsub5tXqI61/fa1qr5t9UWbSXnyiDdtQFQOlF3lV751m1LSZ5IFsFu
         AWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508255; x=1711113055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKSoPbdfR84sDrdE++VJn8/NPQXAflULbgNG03R7vOs=;
        b=Al+4fm6x0s1mRmgov3sUtjJIQRzvKbeqwinDJgT+PmALBYZqO3tKGptKqx02CGO3wk
         HM+jQA63D4GMg9FkXJT9SUD0ltH4ZCk/iPZGt+Nu1Wbtbo+fvGtucK06Zj5nKVy4LRnd
         lbaHhkOU1EzECsSxeue8ZsPEwleUcLq4W/PUKM+CIyqm3EFgRV/ZfMNR7zS7zPJCPCPt
         in0zJeVN43NOYneAAxGpx+93NO9zkPcn6szEMp3r79Q+nstvmfqYa2khMTbXKg7LsbIb
         q65lclFOBvP5MjrPuV682NEnp2d7oYEkrsggMZ654BPnZWqQaD0q3L6pQHmS1azjb0zy
         NvoA==
X-Forwarded-Encrypted: i=1; AJvYcCXAeSnNIdlA7Fr9vuO0QK6KjvYP9mCzjweXHIa7XQF0uhIfIJiJnFYQmtKeROkBHAq8hiOFjgXzlj+Xf38xSDTzXG1SYaiV
X-Gm-Message-State: AOJu0YyOoh1VDiqrIKPtXO3X8u8hoicLT9hxsCkSE99+GEqhEFpy0D18
	wHJQfBSOKh7tGPds5UfP/bpE/nWBnefOqhjjvoT9UjLmQ9WWCLqeindIsZMHds52rA==
X-Google-Smtp-Source: AGHT+IHYyeLEfVVgN9kci+ZeRoPz5G6i50JiPnnqzD2jONHSLkszD0RljwqLECh5RRITNdvEpl0ANg==
X-Received: by 2002:a17:906:5a95:b0:a46:74fe:9177 with SMTP id l21-20020a1709065a9500b00a4674fe9177mr3636958ejq.21.1710508255621;
        Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id sa15-20020a1709076d0f00b00a45bbeeea9asm1681047ejc.167.2024.03.15.06.10.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 15/21] target/arm: Use QMP generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:03 +0100
Message-ID: <20240315130910.15750-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cuwmqP32og4v

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 3cc8cc738b..c5091e64ec 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -28,6 +28,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/commands-target-compat.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
 
@@ -220,29 +221,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     return expansion_info;
 }
 
-static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = cpu_model_from_type(typename);
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
-- 
2.41.0
