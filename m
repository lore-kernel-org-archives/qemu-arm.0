Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp370576ejc;
        Sat, 9 Mar 2024 11:31:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXlSgj/KnGx8GccLS3LYyzy7D0XVhQxy/MYSfQuJs1z/nLE82+wZJygNXtpK+UYH53LQsKI4kfUMt1CBDGqaN5eVrxukaqa
X-Google-Smtp-Source: AGHT+IGT0MClbfO3cP5Z2IZOf1PMCWfcDiX+krznvXY1ZapmEw7/+zGe/u2+sLfX82UQ6Y/x0rPs
X-Received: by 2002:ad4:4d4b:0:b0:690:4ac8:2283 with SMTP id m11-20020ad44d4b000000b006904ac82283mr2403663qvm.20.1710012676699;
        Sat, 09 Mar 2024 11:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012676; cv=none;
        d=google.com; s=arc-20160816;
        b=uZMVow0L0rGgoKO4g+3XABEP+zPM0m7bSbgQmzw+LMjq5Epl5xUUmzqpb9w50NaUvb
         VcgpJ28dvcmptYfFX6gNr5UFRn6sK+WMZWjqh/tlSM0+DwqeQBUZX/pG9UdqcGgUCT1A
         kh5qXx5xpSJB5jCu0zywFXhdRMy+Eo51zx6AsczZ1vU3uRqFs0vXjZ7FEp178MhIPpeO
         aMv2sQ/8OfKFXeWAoJlJIhJ2DH5MLBm86jHyom+GoZY7Pxa4QIwQTUOFiLYjOda9Fvr/
         eD/P9vUQ9A5aGaFsDlEQ+2I+ZlobBs9tgtVoV89l/nJpWb/Fww+7FsDHTfZfghZkqnqC
         fI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tvU56TlvWLPvO+A3q9kkdbysgtf1x6xX0zRrOdKGxe8=;
        fh=MRpuvAMiIDngljO/1ktWIu7Kho7sXmLGHrYdpgFbLRA=;
        b=MA/X8SBzktU5vJlCNYE68bCH+aFON3onsm//WgOWRWVniYOj2/of5s1S93KXJpF1lS
         Qa4AavQOPG7JHdnEP1iGXoNveFZMwBupkQLcHmG1rf7YKqchG+N0XFqvz/D0ye8MOLva
         G8m5xX6FpCe5t7Dr9fU1lXa7/wtiAgGAc9fNSiwH7nMx3LUzCATMmqwI8A0auIe19MET
         pOa429EY7h6J1ehqRRLLwM8XW4EZTiEr4k6vw/tLauqX/CMiNB71axr1Ul9Y0V2sg8et
         Z2cbBYtUC2lDLL1TT/3OUPL2M5WixFU8Qjon/CaazBUMhWarPLvLv8VZB0+n9CaCsJSX
         QvOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUAXyuSa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020a056214076e00b0068f3602c8b9si2143329qvz.40.2024.03.09.11.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUAXyuSa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2Lh-00015V-TF; Sat, 09 Mar 2024 14:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Kp-0007nW-90
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:26:25 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Kb-0003TQ-7e
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:26:07 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5684ea117a3so97730a12.0
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012363; x=1710617163; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvU56TlvWLPvO+A3q9kkdbysgtf1x6xX0zRrOdKGxe8=;
 b=dUAXyuSaH80hBiFEDuHX/ug9wrvyJbsAkRoLQgaLUJM8oR1PicFyBFvTbwU4mhbAHc
 hp3aiQ9ZuTV0Yz7WaYZ1lmn/P6kcC1sDO96zgd3nsr3Dy7PVWvOhbT6xTguWf0P2zpQa
 uQDS0/M6+N1kXD8QmYbQP0wMuS4Tmyd7VzNdKEDiQABH1DJtXvjF/1zX6YVkByFBMOnF
 rQPVW721B0kX7brrFfOS8J9KIr4EihOyfbcVlKSWrOpCa1j9UmQQDnR/RxAP8szw5Pdf
 5emPGM5f4GAV6JW4yHr7wllFiyvzX6M28s79hIu+xjNWrejtezY8YYr0e0351v+ShJy/
 TNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012363; x=1710617163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tvU56TlvWLPvO+A3q9kkdbysgtf1x6xX0zRrOdKGxe8=;
 b=dsUAxQe87/8q5W9BSWmX23v1VU/m11wCc34b4jyHjDNPWZlAhPyyFSm3TMofRyz7bv
 w5wcynjx7hJTMIi8nHxIUAqidNOhEa6X07sOWECuiivIv+962udu4pBPJiecttuaYxcC
 fSFTWK/fAwI59ORMKETg8Pgk0eNBVaKl7KYDY5ZHphz06PjU2xTYg6ZWj+N1X19Zs6Hl
 t63wvA1p0jwDdSuSKbsUXX+j5i2NDs1eq7oHLXUq0mAZEymwcabRE7Lyzx2iKg4XuMvh
 vtGWGqd7YU1H3YzXYhxh46xQasskVM9SOQtGxYbvthdtqd+UUpFUdpvAb3kCubGR21AM
 P32Q==
X-Gm-Message-State: AOJu0YwjrWxg/uP5nLbTcQqPTH/e8ziiZkyFiRVNUv+bJsyTcNwxTezf
 JYzzUHlbg8t2IhnhJK6my1dg7j2rgNHyiLouW115AmMyyfLcRTRVDtrk72C4AtWJvMcUCJpMLwG
 /
X-Received: by 2002:a17:907:c783:b0:a3f:29c:c8fa with SMTP id
 tz3-20020a170907c78300b00a3f029cc8famr1757717ejc.66.1710012363488; 
 Sat, 09 Mar 2024 11:26:03 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a170906371900b00a4410598eebsm1177473ejc.67.2024.03.09.11.26.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:26:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoling Song <xiaoling.song@intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 38/43] tests/unit/test-smp-parse: Test "drawers" parameter in
 -smp
Date: Sat,  9 Mar 2024 20:22:05 +0100
Message-ID: <20240309192213.23420-39-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cktcvldzxTWm

From: Zhao Liu <zhao1.liu@intel.com>

Although drawer was introduced to -smp along with book by s390 machine,
as a general topology level in QEMU that may be reused by other arches
in the future, it is desirable to cover this parameter's parsing in a
separate case.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Xiaoling Song <xiaoling.song@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-10-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 89 +++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 090238ab23..aea1b2e73a 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -329,6 +329,11 @@ static const struct SMPTestData data_generic_invalid[] = {
         .config = SMP_CONFIG_WITH_BOOKS_DRAWERS(T, 2, F, 0, T, 2, F,
                                                 0, F, 0, F, 0, F, 0),
         .expect_error = "books not supported by this machine's CPU topology",
+    }, {
+        /* config: -smp 2,drawers=2 */
+        .config = SMP_CONFIG_WITH_BOOKS_DRAWERS(T, 2, T, 2, F, 0, F,
+                                                0, F, 0, F, 0, F, 0),
+        .expect_error = "drawers not supported by this machine's CPU topology",
     }, {
         /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=8 */
         .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 2, T, 8),
@@ -420,6 +425,26 @@ static const struct SMPTestData data_with_books_invalid[] = {
     },
 };
 
+static const struct SMPTestData data_with_drawers_invalid[] = {
+    {
+        /* config: -smp 16,drawers=2,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_BOOKS_DRAWERS(T, 16, T, 2, F, 1, T,
+                                                2, T, 4, T, 2, T, 16),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "drawers (2) * sockets (2) * cores (4) * threads (2) "
+                        "!= maxcpus (16)",
+    }, {
+        /* config: -smp 34,drawers=2,sockets=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_BOOKS_DRAWERS(T, 34, T, 2, F, 1, T,
+                                                2, T, 4, T, 2, T, 32),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "drawers (2) * sockets (2) * cores (4) * threads (2) "
+                        "== maxcpus (32) < smp_cpus (34)",
+    },
+};
+
 static char *smp_config_to_string(const SMPConfiguration *config)
 {
     return g_strdup_printf(
@@ -666,6 +691,13 @@ static void machine_with_books_class_init(ObjectClass *oc, void *data)
     mc->smp_props.books_supported = true;
 }
 
+static void machine_with_drawers_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->smp_props.drawers_supported = true;
+}
+
 static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
@@ -854,6 +886,56 @@ static void test_with_books(const void *opaque)
     object_unref(obj);
 }
 
+static void test_with_drawers(const void *opaque)
+{
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData data = {};
+    unsigned int num_drawers = 2;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
+
+        /* when drawers parameter is omitted, it will be set as 1 */
+        data.expect_prefer_sockets.drawers = 1;
+        data.expect_prefer_cores.drawers = 1;
+
+        smp_parse_test(ms, &data, true);
+
+        /* when drawers parameter is specified */
+        data.config.has_drawers = true;
+        data.config.drawers = num_drawers;
+        if (data.config.has_cpus) {
+            data.config.cpus *= num_drawers;
+        }
+        if (data.config.has_maxcpus) {
+            data.config.maxcpus *= num_drawers;
+        }
+
+        data.expect_prefer_sockets.drawers = num_drawers;
+        data.expect_prefer_sockets.cpus *= num_drawers;
+        data.expect_prefer_sockets.max_cpus *= num_drawers;
+        data.expect_prefer_cores.drawers = num_drawers;
+        data.expect_prefer_cores.cpus *= num_drawers;
+        data.expect_prefer_cores.max_cpus *= num_drawers;
+
+        smp_parse_test(ms, &data, true);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(data_with_drawers_invalid); i++) {
+        data = data_with_drawers_invalid[i];
+        unsupported_params_init(mc, &data);
+
+        smp_parse_test(ms, &data, false);
+    }
+
+    object_unref(obj);
+}
+
 /* Type info of the tested machine */
 static const TypeInfo smp_machine_types[] = {
     {
@@ -882,6 +964,10 @@ static const TypeInfo smp_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("smp-with-books"),
         .parent         = TYPE_MACHINE,
         .class_init     = machine_with_books_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-with-drawers"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_with_drawers_class_init,
     }
 };
 
@@ -908,6 +994,9 @@ int main(int argc, char *argv[])
     g_test_add_data_func("/test-smp-parse/with_books",
                          MACHINE_TYPE_NAME("smp-with-books"),
                          test_with_books);
+    g_test_add_data_func("/test-smp-parse/with_drawers",
+                         MACHINE_TYPE_NAME("smp-with-drawers"),
+                         test_with_drawers);
 
     g_test_run();
 
-- 
2.41.0

