Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025192ejo;
        Tue, 12 Dec 2023 08:30:54 -0800 (PST)
X-Received: by 2002:a50:d0d7:0:b0:54c:48aa:cd12 with SMTP id g23-20020a50d0d7000000b0054c48aacd12mr6495412edf.34.1702398654489;
        Tue, 12 Dec 2023 08:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398654; cv=none;
        d=google.com; s=arc-20160816;
        b=BjZWJn2FKnKHfdjzlHkZqHi44fpbqcRPT/Z7Ws7hu1hhPImikqLQrdts+dTXr0HDir
         CQCjNTsejDkctfuroXLAj5fLQh8TQKVxV+e7fH2O7qqHD1ljfvCRDYYKuqUVVKlIkaWx
         LPh/T1jjyxfghhOiDh2VVNo4gzRrqFs4OcvPjkhwL71MPZfwI77McOgrxUiAgwV/e+la
         XSbzxZzBmKgJjRJ1oOMNKtqbYkGNqiHRIzp97pQzUaCtYKIP9AuVkUfN9TBchsRCAYpw
         r4pJSFivnOsM9EhR2xnryctJFRU7o31D5gcaKMezyFNVM3VdOI6MJDf7YY8cMxMwUFBN
         pbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fk9JJHzitncXlk5Oc4PyYe0vp1fu8mtq0o6tXQCqyhw=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=kt4J13Nxo+VHkZu/RcQp+q9ivLaMX85C9W9nCyE7IvKw1SDVPCYCAeZIBaIOWiXWOj
         i6oLb0vbZtfZzXGqRKz5ANemnFTochvDBTpeQH/fPjYScVOKGrmbrgr721sa3OTdYgCl
         PYqhEpNniYV+/Su44wsdgsogDmA8jn6MtCxh3p6I55S2w3r7C9dDfcOQMdWmP17oDZqt
         B6Cv2qa02VgSlKIIAROzrZ9Z04TTrUl1GKzhfECQy9n2PIG89RnJPMN3alSkGsJRnHot
         wfu+fpgKzLEmfFTX0jDPdzEi0rIyjBTn5DlyA62o5zEDs0Qx9nyhQyHUtiwbdzHItMrE
         7MiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vxop1CaH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y7-20020a056402440700b0054f5efdce96sor3539396eda.0.2023.12.12.08.30.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vxop1CaH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398654; x=1703003454; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fk9JJHzitncXlk5Oc4PyYe0vp1fu8mtq0o6tXQCqyhw=;
        b=Vxop1CaHGe6k+350KiInxwtW6n1VtBQFeDRzN/vDVpQ+iyAmiGeJaIX7Q//lufz671
         5Cv3o3+Wxv39N1WTrM6Hv/NlQzrnHDwtadIc92XW0ivEtwKsaMuq8Y38HHMIXw1HgU6Q
         ofmFxFfMf5EJQ+9Y8DQ5Ems2+h4RvaGZiLHW+/7Qo9nIxME8j7iBwZuBb+uTBi/guE1q
         awg0hFjNQ6QChJlB3RRw9ZOizk2ajWfP+DECVmGygipz3nfkJBJz+RDxWrIzVepCbJzA
         c7WpBzQoWdEgZwC47yqiQsrZRIcjHvwuK761UDqCH9zARPaq7afsUoePCB7voqCTqchH
         xdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398654; x=1703003454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fk9JJHzitncXlk5Oc4PyYe0vp1fu8mtq0o6tXQCqyhw=;
        b=sNSFKY1M4GpEeEpZnKRXaEnH4VnrpesKNNKpFK4ZEnm/qW1YqcWhLzEUIyk4M+jkrE
         62wx15EgvAfoZsJlMeX6djeUA5usMQ3v9oa/obdOAnZ1ZqUqXJ1+EtdHVVrnvg8h9Kwu
         CEGzcbJmNmZoRND0rMf4+mLfhioOyI58dmD7/x6Q0tNUNEDCw3+w9tTpR1pnDK254Jow
         1MTxMeFGBqakgAdmKRLYAWf64aGs6xb30uWpJOe8irDBotoBZQuzuv1o0x8++Zs22o/5
         k8YWCfMLh2p6tlFVbkzJgLkBEWIj5yH7I4U7Z7uE4O4KvRIldthdLdhfSPTyNpeCBNVj
         4qHw==
X-Gm-Message-State: AOJu0YwPczYNda7bIko22Hq9eAac1l5CWoGN9yznScUG7AVyl/vxmKIi
	Vc2r24SIMYcHKO1EJwJqNHPUpXMxIYgtR9u8onvZ7w==
X-Google-Smtp-Source: AGHT+IHCfIPfE4fEwDyyFMjmaGejqoIGvfIwWtE/oswuYPmcgEXdfF5BPycsGGn8xaXL3QMiy1vmXQ==
X-Received: by 2002:a17:906:847a:b0:a1b:760c:e4de with SMTP id hx26-20020a170906847a00b00a1b760ce4demr7480701ejc.15.1702398654234;
        Tue, 12 Dec 2023 08:30:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id da7-20020a056402176700b0054ca2e83d4bsm4804788edb.17.2023.12.12.08.30.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/33] hw/cpu/arm: Introduce abstract CORTEX_MPCORE_PRIV QOM type
Date: Tue, 12 Dec 2023 17:29:10 +0100
Message-ID: <20231212162935.42910-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: H7Oc3r+xuHEE

This type will be common to A9MPCORE/A15MPCORE devices.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h | 21 +++++++++++++++++++++
 hw/cpu/cortex_mpcore.c         | 22 ++++++++++++++++++++++
 hw/arm/Kconfig                 |  3 +++
 hw/cpu/meson.build             |  1 +
 4 files changed, 47 insertions(+)
 create mode 100644 hw/cpu/cortex_mpcore.c

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 9147f35c2a..c5dd7200d0 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -17,6 +17,27 @@
 #include "hw/timer/a9gtimer.h"
 #include "hw/timer/arm_mptimer.h"
 
+/*
+ * This is a model of the Arm Cortex-A MPCore family of hardware.
+ *
+ * The A7 and A15 MPCore contain:
+ *  up to 4 Cortex-A cores
+ *  a GIC
+ * The A9 MPCore additionally contains:
+ *  a System Control Unit
+ *  some timers and watchdogs
+ */
+#define TYPE_CORTEX_MPCORE_PRIV "cortex_mpcore_priv"
+OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
+
+struct CortexMPPrivClass {
+    SysBusDeviceClass parent_class;
+};
+
+struct CortexMPPrivState {
+    SysBusDevice parent_obj;
+};
+
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
 OBJECT_DECLARE_SIMPLE_TYPE(A9MPPrivState, A9MPCORE_PRIV)
 
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
new file mode 100644
index 0000000000..7d3796bd69
--- /dev/null
+++ b/hw/cpu/cortex_mpcore.c
@@ -0,0 +1,22 @@
+/*
+ * Cortex-MPCore internal peripheral emulation.
+ *
+ * Copyright (c) 2023 Linaro Limited.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cpu/cortex_mpcore.h"
+
+static const TypeInfo cortex_mpcore_types[] = {
+    {
+        .name           = TYPE_CORTEX_MPCORE_PRIV,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(CortexMPPrivState),
+        .class_size     = sizeof(CortexMPPrivClass),
+        .abstract       = true,
+    },
+};
+
+DEFINE_TYPES(cortex_mpcore_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3ada335a24..3040342fcb 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -643,6 +643,9 @@ config ZAURUS
     select NAND
     select ECC
 
+config CORTEX_MPCORE
+    bool
+
 config A9MPCORE
     bool
     select A9_GTIMER
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 6d319947ca..8b376d6e7c 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -2,5 +2,6 @@ system_ss.add(files('core.c', 'cluster.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
+specific_ss.add(when: 'CONFIG_CORTEX_MPCORE', if_true: files('cortex_mpcore.c'))
 specific_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
 specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
-- 
2.41.0
