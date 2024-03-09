Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp370029ejc;
        Sat, 9 Mar 2024 11:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUuV2+3PFVoSBt7ehLEN8aedYhHztki7sT2Wxl11YznNN/JVhe1JaUHsiLGY6EEK6oy0C2NwVAJVMouo+nYTyQTMz1++Cm
X-Google-Smtp-Source: AGHT+IHwYg8trVKF6umzNktkS4l1yC9cgGV1UzFv4Q8zUljiny39RqG05l7QZkAVlswxXH8a5YoU
X-Received: by 2002:ac8:5a15:0:b0:42e:774e:2987 with SMTP id n21-20020ac85a15000000b0042e774e2987mr3517625qta.38.1710012599594;
        Sat, 09 Mar 2024 11:29:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012599; cv=none;
        d=google.com; s=arc-20160816;
        b=uetaoK/4FYa0gYjtQVOmpQ8HCsrwoS7tcgV+KdwgLLbehFb7OhadaH9Xx7jQTTi3/R
         t7A7I7bzEq+QuXfyV+Aj3Nszu3C5RuJWIrtkj/f1Bn49YKuSc9/e17jh5hEwgHu9LmFh
         LWH5V23bsyQ0d1AqQOqzCP7C46uZSubRuDUdJ+7w5g7zUdxyRaNNo/mka12WBrgoqa3P
         qfyhkvLuKThEy7Di2qMmoiKoRTNsJfRZLtfQtS58jWp+M1OihRo8yULucOAUpxxMhnB6
         EHsx5lb0HnpYQ/0Mdw2E3xKQIQhE9pH8iB4CXZJQhZ3K27D2lVN2YgC+bCPSS1pEVVgY
         XnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iUC4gt3lxXhDXO4ThAk9t583cQlzaBs4BIxFd2rtuRE=;
        fh=Z8QJGE7HU6A0ONXLTth0j4JAbqsEyH70gp4Z9jIuhpA=;
        b=ImRsY+1wLBtgGqkPpmatpE2gdRhUjAysUgpdua2c3jeNhm21AbTDB/EiS/elMPSZQ1
         830/AZWcT3mtp7piknOe2If7g+8trtf7J6xK5ui1ZpaOy1PPq+U/lodrViIV/wdoYXsp
         YV4FYWapMblQuiUwelDIHELPi1NeM5msVDWo485kI5+5X3JphTERc3cj/Vp5/ChANjld
         7FoQ8sDj0C+c3ZMGt4Yr3ewcdTCx1T3Q4KVPeEcH8k54l3cEw/N0OToQBpdW3ocqTACX
         tyCmqw8Me6IQKEGkTguPBKDnNbbvLh8ltScY6UkkfedRFZagC5oJLhNhHZ+XCybg2UcH
         hV6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvcjzE2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020ac85996000000b0042ea9ce34a2si2144064qte.497.2024.03.09.11.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:29:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvcjzE2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Lo-0001iL-Il; Sat, 09 Mar 2024 14:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Kt-0007r8-QC
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:26:28 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Kp-0003X5-4F
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:26:22 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56838e00367so1124018a12.0
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012369; x=1710617169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUC4gt3lxXhDXO4ThAk9t583cQlzaBs4BIxFd2rtuRE=;
 b=mvcjzE2liCot4Hk+YGLy9r6yBJyx6dnBEujXMJiDxRuS/prYkYKnDcYUOuma6duE7s
 p9eyBgsXrnA/fe709cVx2vqW1ggexQd4ZkwTeKPWEzBciJiFjBTu30pYMxaWHDNrUq3W
 jlh4+9DforgvW5jg6O2X/STqOL44OSPDZiaRGni1lTWUwUVT6/UeW7i6CjzXHfANI4PH
 baktCYE+f1rn+2YD6zOy62AMPYhK7QKyF3yjrlG4Qvt3/t7rQcYOa8olExFGKcQG6+3T
 OFwFBgILiDfIg6x2zxPsnXrh5rFdIAORZEuL1u17Png4apBTI7m3kQNaNaIZLHnNj6Go
 qZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012369; x=1710617169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUC4gt3lxXhDXO4ThAk9t583cQlzaBs4BIxFd2rtuRE=;
 b=EfmzU7lU/29WOMLUhs3dCgLq7MVJeKyBsB/U+3P70sYvskF4YidpxArx6+Vw/xYD2y
 tg1qW7cvE4MQZoJ4N0UPYStsDoRnpXAoxcNcqlp7jr2vgkj/uOvoNLiacld9ztHRQKLm
 /iYNnMEjkkHFpFz2pDYZbHTKEAOdrnpg3+Eq8VeaoehyLMrCi99ZcmlY3Wo1LdIF9tEr
 AwhYDfGMO4aSVWODEOHZV7TvHSn59OXQ5MKGSDQ4mAybp13Pd05p0ykMZETjm++Go3L6
 02KiLlubs91n4NksiGrmkZ2wWi6ffCxFsFAMA7I/VU/AfnUcMT6pP2caRRNcklmXmY83
 HKdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWalRGF15/Xrd2o++q0ILpiWv2v235B8i6/DKAoO2fwYnbxbqiUfQbFRDAgPvmVzS+/Pb8zs8UWMUyVUU/ZwgkzvmBu
X-Gm-Message-State: AOJu0YzYV/7dchkzgHgHQ87AQuTm2imqCqQ91SPZE5YW3V28HvZejUum
 Q+uKh+7Kg8BAW1kg8rO8QcsM1VoERM/oyDrAEJiT6dnfWyStZwvpytME+bU4BbI=
X-Received: by 2002:a17:906:f150:b0:a45:b761:2c2 with SMTP id
 gw16-20020a170906f15000b00a45b76102c2mr1165498ejb.60.1710012369579; 
 Sat, 09 Mar 2024 11:26:09 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 ce18-20020a170906b25200b00a44f3fb4f07sm1172207ejb.191.2024.03.09.11.26.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:26:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoling Song <xiaoling.song@intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 39/43] tests/unit/test-smp-parse: Test "drawers" and "books"
 combination case
Date: Sat,  9 Mar 2024 20:22:06 +0100
Message-ID: <20240309192213.23420-40-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: Z88/WVq3C9ju

From: Zhao Liu <zhao1.liu@intel.com>

Since s390 machine supports both "drawers" and "books" in -smp, add the
"drawers" and "books" combination test case to match the actual topology
usage scenario.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Xiaoling Song <xiaoling.song@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-11-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index aea1b2e73a..0cf6115198 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -445,6 +445,33 @@ static const struct SMPTestData data_with_drawers_invalid[] = {
     },
 };
 
+static const struct SMPTestData data_with_drawers_books_invalid[] = {
+    {
+        /*
+         * config: -smp 200,drawers=2,books=2,sockets=2,cores=4,\
+         * threads=2,maxcpus=200
+         */
+        .config = SMP_CONFIG_WITH_BOOKS_DRAWERS(T, 200, T, 3, T, 5, T,
+                                                2, T, 4, T, 2, T, 200),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "drawers (3) * books (5) * sockets (2) * "
+                        "cores (4) * threads (2) != maxcpus (200)",
+    }, {
+        /*
+         * config: -smp 242,drawers=2,books=2,sockets=2,cores=4,\
+         * threads=2,maxcpus=240
+         */
+        .config = SMP_CONFIG_WITH_BOOKS_DRAWERS(T, 242, T, 3, T, 5, T,
+                                                2, T, 4, T, 2, T, 240),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "drawers (3) * books (5) * sockets (2) * "
+                        "cores (4) * threads (2) "
+                        "== maxcpus (240) < smp_cpus (242)",
+    },
+};
+
 static char *smp_config_to_string(const SMPConfiguration *config)
 {
     return g_strdup_printf(
@@ -698,6 +725,14 @@ static void machine_with_drawers_class_init(ObjectClass *oc, void *data)
     mc->smp_props.drawers_supported = true;
 }
 
+static void machine_with_drawers_books_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->smp_props.drawers_supported = true;
+    mc->smp_props.books_supported = true;
+}
+
 static void test_generic_valid(const void *opaque)
 {
     const char *machine_type = opaque;
@@ -936,6 +971,67 @@ static void test_with_drawers(const void *opaque)
     object_unref(obj);
 }
 
+static void test_with_drawers_books(const void *opaque)
+{
+    const char *machine_type = opaque;
+    Object *obj = object_new(machine_type);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData data = {};
+    unsigned int num_drawers = 5, num_books = 3;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
+        data = data_generic_valid[i];
+        unsupported_params_init(mc, &data);
+
+        /*
+         * when drawers and books parameters are omitted, they will
+         * be both set as 1.
+         */
+        data.expect_prefer_sockets.drawers = 1;
+        data.expect_prefer_sockets.books = 1;
+        data.expect_prefer_cores.drawers = 1;
+        data.expect_prefer_cores.books = 1;
+
+        smp_parse_test(ms, &data, true);
+
+        /* when drawers and books parameters are both specified */
+        data.config.has_drawers = true;
+        data.config.drawers = num_drawers;
+        data.config.has_books = true;
+        data.config.books = num_books;
+
+        if (data.config.has_cpus) {
+            data.config.cpus *= num_drawers * num_books;
+        }
+        if (data.config.has_maxcpus) {
+            data.config.maxcpus *= num_drawers * num_books;
+        }
+
+        data.expect_prefer_sockets.drawers = num_drawers;
+        data.expect_prefer_sockets.books = num_books;
+        data.expect_prefer_sockets.cpus *= num_drawers * num_books;
+        data.expect_prefer_sockets.max_cpus *= num_drawers * num_books;
+
+        data.expect_prefer_cores.drawers = num_drawers;
+        data.expect_prefer_cores.books = num_books;
+        data.expect_prefer_cores.cpus *= num_drawers * num_books;
+        data.expect_prefer_cores.max_cpus *= num_drawers * num_books;
+
+        smp_parse_test(ms, &data, true);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(data_with_drawers_books_invalid); i++) {
+        data = data_with_drawers_books_invalid[i];
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
@@ -968,6 +1064,10 @@ static const TypeInfo smp_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("smp-with-drawers"),
         .parent         = TYPE_MACHINE,
         .class_init     = machine_with_drawers_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("smp-with-drawers-books"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = machine_with_drawers_books_class_init,
     }
 };
 
@@ -997,6 +1097,9 @@ int main(int argc, char *argv[])
     g_test_add_data_func("/test-smp-parse/with_drawers",
                          MACHINE_TYPE_NAME("smp-with-drawers"),
                          test_with_drawers);
+    g_test_add_data_func("/test-smp-parse/with_drawers_books",
+                         MACHINE_TYPE_NAME("smp-with-drawers-books"),
+                         test_with_drawers_books);
 
     g_test_run();
 
-- 
2.41.0

