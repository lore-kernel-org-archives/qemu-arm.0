Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1353973lfb;
        Thu, 6 Jan 2022 15:23:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys0YbDhD2I70QINEo4UTfEqGhQKlK0f1JreSdbdZFr7gwlw/MQcyLUxw065tia9VgLErCF
X-Received: by 2002:a25:2cd0:: with SMTP id s199mr64858989ybs.234.1641511410816;
        Thu, 06 Jan 2022 15:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641511410; cv=none;
        d=google.com; s=arc-20160816;
        b=srUzkRc8GxhU5p98kfBQihCj8kzyqdYSJDFx3PYTmZ6LbfchDtoIgZKhAC7y8DCIOn
         kEIY/LawWbxwYXUgHfwDG8QlWZqlCun0wAvSZxHozXglKHaB4BNoGwomAA9T5VF9Kjc7
         P+AVV2VQ1TsjDQ8OVOIrBfDbUiwJUKzcQyVTLz0jp0k3F0D6ysUdnVbUfYK33AvlqSNH
         GkY7r0zwA0ESvnkJgEBjb1xfen/FwUTDGRbWpt6T3Xwp5LA8pbowc1kVyjgH+O3vF17M
         Thntt4SgX8scxaGOCgLqZZ/dGZSwyorjgBePKVJSjcNUJ7T3urpk8ErMhs7YZxDWsQxH
         b/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=6LLiL4AuMjgwJDw/hLv0NPZST2B5iF1mx74lkuGwVXU=;
        b=WLWKj9jryo8sUTvdlDo178nQcDHyDagWhLLT86M/l2jYIDxRjjg8B2uEC8AezQVhft
         kNd5uUNN0VSKTbtPYzDJR1E8WPieLjwRPTfSoLFdVLzq+4S8I/KWSG4BEqfYdwuhKYcp
         fhW4df1PfR8H3NaJjZSVajkDjv6tr68NJGO5B6cHbUjsGPydDXOM6KiSbCUvZ8AfHOQO
         XJCgjM+Xu/+9yB0jzAk2NSGG7QoHMNq0DuB8osZmihh8S/gpG1Yh+HMlZRwStFv7agDn
         F6j2Vi7hC8/d1xzPfyCgWoHeFN3l0L3S+tccuqU4LeqxWz2TNkOD1P6ZxrF77saePjni
         u7hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kT86I2A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si2468658ybg.275.2022.01.06.15.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 15:23:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kT86I2A7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5c6U-0003Kr-9J
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 18:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3w3bXYQYKCCQTITUSRGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--titusr.bounces.google.com>)
 id 1n5c1S-0004h0-85
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 18:18:18 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=36681
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3w3bXYQYKCCQTITUSRGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--titusr.bounces.google.com>)
 id 1n5c1Q-0006Lw-PE
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 18:18:17 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 e137-20020a25378f000000b0060c1f2f4939so8067996yba.3
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 15:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6LLiL4AuMjgwJDw/hLv0NPZST2B5iF1mx74lkuGwVXU=;
 b=kT86I2A7X33698nvhWqXd10azQVYBJoLMMVvbxgM0BxL49+NvqdjoInbNcVknzcTLE
 aVbM0eeX9IwMHydD9xILzF73LG+I5ieBd1ZgzPnrfN8AVp9NLSxKqck6qPyCSP35STae
 tsXfbojoEvrMxEBhMsosxdcmB6atvfRuasmYeMOqMZ1sPpuQqc8EubD7gjuYRrMYR2S9
 ZKsS83O8HCFLV/cdKsfXsqdqQNKq4WGpRhTyaSlsEzFGndHYHkcqvrRkxOaQJmsVZBP1
 bZorWcEN9uKmHpajtkbscUEqWBsGjaSvvGbZBnxTiy9xQJwsydxxnn9Pm8M90lzwMQjF
 KIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6LLiL4AuMjgwJDw/hLv0NPZST2B5iF1mx74lkuGwVXU=;
 b=ShiRlXfYuhzzpvq7lf8iJzfZDkj18gUYHLWjxEdwFQNp40jb1+TvBKy8Y2zSZjU/Eg
 SddTQtZDT0eGPsfxwEsTIcv38NyZvywLcUVitbfN3Xk+1HsUjwJzTCwzR4WCIQPtdyZt
 /pTnAelJ8sCtOJ1m5a7V6U5Z7f+EXoZ2ZCniOlcB+k4fR7CCiEa4DKsKIimOv8YMTlzf
 tbcfZIo1n2iTVDQJ8n5JFFAqLMdhrYuHLelnS86jZi9euGJXi68VQ64bRtiM3hUAwS6K
 0UbusKjDYwdQupoJ+PTQ43o/Pt+Yuk3ZTVqYg7xZ9U8R5Nnk1lWAv9oyRR1NWu8SzXX0
 Y7hg==
X-Gm-Message-State: AOAM532ZM+kloHJ0msfo/c6OGYfuQ+9De8OpwQ0GeLFgpgQTshEnq7+G
 dcEM1NdlrFu38Ozb8JD6sie7JD9rkNU=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:8a:: with SMTP id
 132mr62878693yba.738.1641510595760; 
 Thu, 06 Jan 2022 15:09:55 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:35 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-5-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 4/5] hw/sensor: add Renesas raa229004 PMBus device
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3w3bXYQYKCCQTITUSRGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iNteF19Pcs5P

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus.h |  1 +
 tests/qtest/isl_pmbus-test.c  |  7 +++++++
 3 files changed, 26 insertions(+)

diff --git a/hw/sensor/isl_pmbus.c b/hw/sensor/isl_pmbus.c
index 8cc7220a57..4ff848f663 100644
--- a/hw/sensor/isl_pmbus.c
+++ b/hw/sensor/isl_pmbus.c
@@ -194,6 +194,15 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
     isl_pmbus_class_init(klass, data, 2);
 }
 
+static void raa229004_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas 229004 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = isl_pmbus_exit_reset;
+    isl_pmbus_class_init(klass, data, 2);
+}
+
 static const TypeInfo isl69260_info = {
     .name = TYPE_ISL69260,
     .parent = TYPE_PMBUS_DEVICE,
@@ -202,9 +211,18 @@ static const TypeInfo isl69260_info = {
     .class_init = isl69260_class_init,
 };
 
+static const TypeInfo raa229004_info = {
+    .name = TYPE_RAA229004,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ISLState),
+    .instance_init = raa22xx_init,
+    .class_init = raa229004_class_init,
+};
+
 static void isl_pmbus_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa229004_info);
 }
 
 type_init(isl_pmbus_register_types)
diff --git a/include/hw/sensor/isl_pmbus.h b/include/hw/sensor/isl_pmbus.h
index 8115aaa698..a947fd3903 100644
--- a/include/hw/sensor/isl_pmbus.h
+++ b/include/hw/sensor/isl_pmbus.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA229004  "raa229004"
 
 struct ISLState {
     PMBusDevice parent;
diff --git a/tests/qtest/isl_pmbus-test.c b/tests/qtest/isl_pmbus-test.c
index 3e956f912c..5bdc247428 100644
--- a/tests/qtest/isl_pmbus-test.c
+++ b/tests/qtest/isl_pmbus-test.c
@@ -372,10 +372,17 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+
+    qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.34.1.448.ga2b2bfdf31-goog

