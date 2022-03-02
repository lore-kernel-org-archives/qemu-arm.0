Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp291872lfo;
        Tue, 1 Mar 2022 16:30:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBygNkde0wZqmDqKrAtpFqPjb6vP9xO6+C/Vfx/eGL3tQ44ZsEF6xYafdfhHE2tp2FCl6t
X-Received: by 2002:a81:49d0:0:b0:2db:dc6d:445d with SMTP id w199-20020a8149d0000000b002dbdc6d445dmr6170011ywa.512.1646181050486;
        Tue, 01 Mar 2022 16:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646181050; cv=none;
        d=google.com; s=arc-20160816;
        b=Op3BecqfWlAlKejnKXx9Nbf4a+BRcIb3V3BUsJ8tXj3o0SFw5UzNFr3W6dAoIeshqX
         xaBKUohwltFpXnxpveG0eUF1e77Ac9Y0b5L9DPsmU8yknUpKigFA4KrKjRtGUM5Hav1i
         DqFwUHiVfp7ipZ/FB8uTdHzNnwv9HXzy4CLN8biT1/5zN44+3S5MgiJMzBmyK0wziqg7
         Rt3CXIWxHz6li1+TqpXq2Idr8ldgOaja+zsqyOkNu9yp5+7qLwIgl/PK+zfLwAdVyYRW
         3izJjrKpm6xr6QVsTLIn2ZbykVO8iQaWF5U1j80JmUEQJsp6lkfjl3x+opAY6F7at8GY
         xPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=y5gTl/dneFYFAvtKtWO9nY0S7K6+kknOpexTazdaxEs=;
        b=UjgsiJy8SHqETxlqUMRQf/omDSNiS3DyQ9Hiq03WeXUjL9AWDe/0Gp+5/H6YwMSFu3
         JzdsY7PcjZZ28aKuflhtkSe8mSSQtBwEFGEl5aCYyrRcsB5UTqH7c//5ebRJKpArQOA6
         jE+Z+YDli+U00Zvbx6OLQZOH5bsyBMGBMoc2Bd+1JY3Zg6MG9IQFRihP4HY6sCzGxqXh
         MCtcqxaYb5qeKx2dJzYQez/Sqs9UZ319PDZecHYY8KqOp/JfnMqlZ2WI6LTMHbgfDMwd
         +6oYN8LB8TakqB4RKHTFsw1PjWvR7BJa5TrJ8dNcYJeRS54GcXESGaymn0s+kkZnsQv2
         7vjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=nx8FQfYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p68-20020a257447000000b006289d12688fsi520625ybc.558.2022.03.01.16.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=nx8FQfYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCtF-0007E0-UE
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:30:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CbkeYgYKCA47w7865u22uzs.q204s08-o50121u18.25u@flex--titusr.bounces.google.com>)
 id 1nPCt3-0007Aa-Ne
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:30:37 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=53223
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CbkeYgYKCA47w7865u22uzs.q204s08-o50121u18.25u@flex--titusr.bounces.google.com>)
 id 1nPCt2-0008TA-38
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:30:37 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 b11-20020a5b008b000000b00624ea481d55so2012ybp.19
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 16:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=y5gTl/dneFYFAvtKtWO9nY0S7K6+kknOpexTazdaxEs=;
 b=nx8FQfYcIlwYQCKoSNLt4hpEb4Atj3F/pijmn/6Z17dmA2rq113DzDAGqufZKh+jCp
 je02+us+xkW9DU3SeSEYLadFqpDrCIy87CBXKobyt4jeYjZr39Mri2g/CtONMHH/L6he
 fYI7Kbrkx/IYasIAKYY3ERukb9+WZnydK4GmrWq3v4yz74gtQqgmZ3LKeodZkrUydsh1
 ZDpXrTLOuto58mw32r9ruqofaEYPtktCRsil78J4xgBJA2kDXcLbUdmhkPWx8GiWJgI+
 TV8/OCg9aRbu8YYi0v1k9k6y+9gz36NvNyPsVKflkrRT0Gl3p6ONtAXvRgfWlBVcoj7R
 sp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=y5gTl/dneFYFAvtKtWO9nY0S7K6+kknOpexTazdaxEs=;
 b=B/VebbcXDJzTjBhy8R5WMlkAAD5moCgjq6+Kz2QXrEev48NUm9vW8ewZk+vvRdc1gw
 6xSxthVr9XlOwUF8F3cYGgIxSFXpC2NDr79tcbsKvTLdCuNe6rVJkSm33CIckvIhT6aO
 I0fTXdxsYvS2iGBWO5/Y3/yRL9rVVBW7JBUxQyw7RXVohMUoKCkLlJ6jsYlYcNDvcoWu
 u4OnF6v4fNYbiT8q5A4tBn11oWzyWHqzse5NYH9Yu5lkmdMGn8F3IUzb3TMbW1mNw05y
 WPG0m57I33HhPvoJL0OrNO4p9McUaqfNlTJA0I3VL/ymXiBxm+M/Qix9Va3tPsQuy9D2
 P7tA==
X-Gm-Message-State: AOAM5339ngBfAQ1+sEhZ2CL/vTZa+GSQaXHYMoyeEZ3y4YZVRO/79Ccp
 Ycc9nrm5p0WipjKtAIJTKe1UIM6Tj+c=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a05:6902:102a:b0:614:105b:33a6 with SMTP id
 x10-20020a056902102a00b00614105b33a6mr26630778ybt.457.1646180617455; Tue, 01
 Mar 2022 16:23:37 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:05 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-8-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 7/9] hw/sensor: add Renesas raa229004 PMBus device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3CbkeYgYKCA47w7865u22uzs.q204s08-o50121u18.25u@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: cb5ALj9q1yms

The Renesas RAA229004 is a PMBus Multiphase Voltage Regulator

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus.c         | 18 ++++++++++++++++++
 include/hw/sensor/isl_pmbus.h |  1 +
 tests/qtest/isl_pmbus-test.c  |  8 ++++++++
 3 files changed, 27 insertions(+)

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
index 59fa67f110..80d6c24ec7 100644
--- a/tests/qtest/isl_pmbus-test.c
+++ b/tests/qtest/isl_pmbus-test.c
@@ -383,11 +383,19 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
     qos_add_test("test_pages_rw", "isl69260", test_pages_rw, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
+
+    qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
+    qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
+    qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.35.1.616.g0bdcbb4464-goog

