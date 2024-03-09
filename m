Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369639ejc;
        Sat, 9 Mar 2024 11:28:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfVC7rCs65vBbKOVKfmOBiSLkmZ3vwAHROjhOBlSw0DvSMQhmLxiIHFowjSHm9SH3HxXDpxmU0hjk4lshVmfi1gJKz6/Tp
X-Google-Smtp-Source: AGHT+IF6AjLRCD+3qrw+vmiwi2vH+V9gmrg8ms5QfxrVPIEgVdetfoGOWK18qmru2paoTI0H/D9p
X-Received: by 2002:a05:6358:7516:b0:17c:2ce0:f76 with SMTP id k22-20020a056358751600b0017c2ce00f76mr3126803rwg.20.1710012532836;
        Sat, 09 Mar 2024 11:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012532; cv=none;
        d=google.com; s=arc-20160816;
        b=d7G+I7ghODchvJ9La62ep51Rj8mwhHVI0UpiIklzyc1lb/3AgvRfCgo/OFg7/Mwv6Z
         KmSyca32gqxOP/tuVD+z9qhqKH6Oomh7W3/v7j1JRR3sAXbf4S9f1cgSxmBiIiKYP55V
         INE/PSX1aDqM9JKCkccqJyqF+wjGHUD/7OYuvnV0HdDsTjJhs2YO2KKomlwHQLEG16D8
         SIhidPvUU256a+y9ohJkCDE/CgposNgEJFAQErMqnTwmz3oudTzO1eWLfd/4/1j2WoxQ
         UMJ8PjhYTNA0/LcECRPjvo9twkY/5F3GfN22b/kQlFH8Gkw3rkihglycKKfEBp6ltrFA
         sZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O8i9QPEOlWhmU7xWF5BCURrysJXNiI85mOLr+pl+Sq0=;
        fh=7uCOmBpaHB02g6r4kvgZK79MuK5RtSJ7DjlH+2uRFFY=;
        b=XGy05r6tx70T38ZAjHDdBHcqwd0wm16t3rym/P/c0UDBvVgQWmVcaryK4w0k6xmBeV
         XwFzmdT72SlGkzE2WaayIKLsSTfYFdBNxYUbnYCtQRB2zjnv4QaSld38/4KDHtvk1Q1N
         zgjkm87kbN4VqeUDU3WDHMPsqPEa0HBD9ho1hd1bsZgPgNfHVvIx2nrLrc7Pr7ohmdcF
         umq5oe/S0W1wuEWy4Hp3zSzgFaje4D3IlDRaZl1uXlHFVphkx0B307KO4aMpLF8T8QAS
         er2GfSgnek4xDapXBSjZahJxuuf/SE0/lzGlRHM78CLtJUmJRDpEFfbjn6CT27QRoKhC
         fToQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4zrCr6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a044f00b0042ef58238f7si2196587qtx.34.2024.03.09.11.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4zrCr6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Lg-0000pF-4g; Sat, 09 Mar 2024 14:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KV-0007SF-B2
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:26:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2KP-0003OP-Hq
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:56 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so409095666b.1
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012351; x=1710617151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8i9QPEOlWhmU7xWF5BCURrysJXNiI85mOLr+pl+Sq0=;
 b=y4zrCr6NEJnj7wLuGdTWAvRnxx1fixFoDxypupMViHonccW3SwDnTGeJdGvu3+mzPk
 Kzf5h7ottiBT01ztt/V8/cXhSXfxjZ/be5eoNh3MZRBTrwqpr0jGGJhwZjd57wlyQcMq
 3n+XEHhxy9/3K/zLEP8PbS1X4El+1X/KEUzT2viklt02T0nlDXerB283M/aQhplOgsS3
 bF69AaDWEvKc+QL3uX4eU5PKqlw33hbnxRG4lRV0MGmZWR4YtE5beW76cI6FhhVvIZq4
 3zXoUPXQuJwhFPXGrNiLZNiqD2heIUzXML7VqInfDn5Z7BTpQEt9MZ9rzzRZgMer+wIj
 k9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012351; x=1710617151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O8i9QPEOlWhmU7xWF5BCURrysJXNiI85mOLr+pl+Sq0=;
 b=Rh1vOjMczzhsz3bGKKOjCJXoVwzYUyje2SVTrnIDfxpB4tJ12NPVHV5h9hLRrHyrBV
 +tA8xbZkD4Ku00eTmmTC2XfavufDmG2FIHqYk18WvOdhIRM8o8t6N43jy9Vi8VFNlCL5
 LaYDZDBE/a1yh6+jRxyYTY+jl8Zi0I5/vuFsyzI9Bm9I+jkbNBQaCwt0kY62nFotqwYg
 AXnk0hpTsTazhkfXE7rmtZ8W3sG7k31jCMjrJEW12yh+BbOqxdCioAcneL6PR4kl9A/D
 j6E+UK3HQ7kUX4OQPKPby2s8bu4TjIIhLAumxYFeTLP5ef5g5q7067H+MvytTxq29exD
 HvBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU952yoLsKoYYcPYAduU2yWEwlqx4K4hiW1RfTdDAy/bSCY0esNMWHlSZCRVighx2EFqIG+BknJKAlVgVK/+hrKtDxl
X-Gm-Message-State: AOJu0YzKH4C0IeU526EbUVsdgMTx4lSl5/EYWo2ewmkgStA+J5VL3agB
 Eju0No/cLohpJoB5hCCBT2VXC2FN9MGCcaZoG11MIaQv3O1gdbrvMHboXkXGqCU=
X-Received: by 2002:a17:906:390:b0:a45:9347:e3d6 with SMTP id
 b16-20020a170906039000b00a459347e3d6mr1362000eja.66.1710012351548; 
 Sat, 09 Mar 2024 11:25:51 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 lr1-20020a170906fb8100b00a442e2940fdsm1186112ejb.179.2024.03.09.11.25.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:25:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoling Song <xiaoling.song@intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 36/43] tests/unit/test-smp-parse: Make test cases aware of the
 book/drawer
Date: Sat,  9 Mar 2024 20:22:03 +0100
Message-ID: <20240309192213.23420-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
X-TUID: SP3IV6jQKLiy

From: Zhao Liu <zhao1.liu@intel.com>

Currently, -smp supports 2 more new levels: book and drawer.

It is necessary to consider the effects of book and drawer in the test
cases to ensure that the calculations are correct. This is also the
preparation to add new book and drawer test cases.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Xiaoling Song <xiaoling.song@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240308160148.3130837-8-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-smp-parse.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 2eb9533bc5..f656bbb6da 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -384,6 +384,8 @@ static char *smp_config_to_string(const SMPConfiguration *config)
     return g_strdup_printf(
         "(SMPConfiguration) {\n"
         "    .has_cpus     = %5s, cpus     = %" PRId64 ",\n"
+        "    .has_drawers  = %5s, drawers  = %" PRId64 ",\n"
+        "    .has_books    = %5s, books    = %" PRId64 ",\n"
         "    .has_sockets  = %5s, sockets  = %" PRId64 ",\n"
         "    .has_dies     = %5s, dies     = %" PRId64 ",\n"
         "    .has_clusters = %5s, clusters = %" PRId64 ",\n"
@@ -392,6 +394,8 @@ static char *smp_config_to_string(const SMPConfiguration *config)
         "    .has_maxcpus  = %5s, maxcpus  = %" PRId64 ",\n"
         "}",
         config->has_cpus ? "true" : "false", config->cpus,
+        config->has_drawers ? "true" : "false", config->drawers,
+        config->has_books ? "true" : "false", config->books,
         config->has_sockets ? "true" : "false", config->sockets,
         config->has_dies ? "true" : "false", config->dies,
         config->has_clusters ? "true" : "false", config->clusters,
@@ -404,10 +408,10 @@ static char *smp_config_to_string(const SMPConfiguration *config)
 static unsigned int cpu_topology_get_threads_per_socket(const CpuTopology *topo)
 {
     /* Check the divisor to avoid invalid topology examples causing SIGFPE. */
-    if (!topo->sockets) {
+    if (!topo->drawers || !topo->books || !topo->sockets) {
         return 0;
     } else {
-        return topo->max_cpus / topo->sockets;
+        return topo->max_cpus / topo->drawers / topo->books / topo->sockets;
     }
 }
 
@@ -429,6 +433,8 @@ static char *cpu_topology_to_string(const CpuTopology *topo,
     return g_strdup_printf(
         "(CpuTopology) {\n"
         "    .cpus               = %u,\n"
+        "    .drawers            = %u,\n"
+        "    .books              = %u,\n"
         "    .sockets            = %u,\n"
         "    .dies               = %u,\n"
         "    .clusters           = %u,\n"
@@ -438,7 +444,8 @@ static char *cpu_topology_to_string(const CpuTopology *topo,
         "    .threads_per_socket = %u,\n"
         "    .cores_per_socket   = %u,\n"
         "}",
-        topo->cpus, topo->sockets, topo->dies, topo->clusters,
+        topo->cpus, topo->drawers, topo->books,
+        topo->sockets, topo->dies, topo->clusters,
         topo->cores, topo->threads, topo->max_cpus,
         threads_per_socket, cores_per_socket);
 }
@@ -473,6 +480,8 @@ static void check_parse(MachineState *ms, const SMPConfiguration *config,
     if (is_valid) {
         if ((err == NULL) &&
             (ms->smp.cpus == expect_topo->cpus) &&
+            (ms->smp.drawers == expect_topo->drawers) &&
+            (ms->smp.books == expect_topo->books) &&
             (ms->smp.sockets == expect_topo->sockets) &&
             (ms->smp.dies == expect_topo->dies) &&
             (ms->smp.clusters == expect_topo->clusters) &&
@@ -564,6 +573,16 @@ static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
         data->expect_prefer_sockets.clusters = 1;
         data->expect_prefer_cores.clusters = 1;
     }
+
+    if (!mc->smp_props.books_supported) {
+        data->expect_prefer_sockets.books = 1;
+        data->expect_prefer_cores.books = 1;
+    }
+
+    if (!mc->smp_props.drawers_supported) {
+        data->expect_prefer_sockets.drawers = 1;
+        data->expect_prefer_cores.drawers = 1;
+    }
 }
 
 static void machine_base_class_init(ObjectClass *oc, void *data)
-- 
2.41.0

