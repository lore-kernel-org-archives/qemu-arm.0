Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1335587lfg;
        Fri, 25 Jun 2021 02:33:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPF7SZJV1w1ChFb7HkmCZYkDs/xwqTN1UHqeMTl92folKSLzbBO0pel6Wq6kO3hX1aOI5L
X-Received: by 2002:a0c:f98f:: with SMTP id t15mr10087135qvn.19.1624613603626;
        Fri, 25 Jun 2021 02:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624613603; cv=none;
        d=google.com; s=arc-20160816;
        b=PlIF7rrJGpVooTYtHceQIKmifyqoYKzJ1msDI8GrWyHtlsITcmWfpVfSIbi3lKQWAM
         qNJQ1KT7MiPx6xVjBapK89cM98MmEc+hhjPSnzC/YgY3r7gtY/LpQarNiDHbGksVsxZB
         BZv/Fxe/tAdRSHbd/b4cQhvuTT1yilc8f8UrL2F7VNWcRL4UC4lQzbdHOePnmFzLkqbc
         DUXkYz4sZG8ooEsvcOdIXJzT0BX3k2gcPJDd2fgT5upcXk7ty1M/HwsQ2mElA7QTx+57
         FlywnA+Sl1FIViI76ZvzReWH0A5wUSeEzdCIE7YAwcdkvqvEXP/jMoGxD6tqPj4lmpS0
         ZSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VE8BAlMVMSGmq5BOBJ+NBV/hGAAFETciS40lKBklWqg=;
        b=syJjW3p9bqyd+eJ3AZ+nfJuAujXCmWC+zHEGkjmO3eygXuZWrR9WrPrsnE4dbnXkEO
         tvbZJW6CLRynKMt6G2LGya6pH3lf3VnJHhGfMEpBGCt2/ijf0qL021PKez4bDLlC3FMH
         GuczfSPaszSjJF8+hqbqzhBPM3IcQ2j14CoLoRfaxb0BXBvnY+OA6TGZP6V4GWmAp4De
         CCQJ7HAu47o4dCDj3q/LgnzT1eUaSSxardLciv+jf+YRUCMTck9FKW1QfiHv4rOSf9ji
         pOZgO2b4pcN8UXkuAJHNKK8n/GuzMfvKo+tMR6z5PcR6mluLZAGgEtfrt2aaes0gahcV
         O6xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tkr4DZzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w128si4126748qkd.21.2021.06.25.02.33.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 02:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tkr4DZzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwiDC-0007z3-Vv
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 05:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzO-0002Mf-Mh
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzF-0006jH-Vb
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 05:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VE8BAlMVMSGmq5BOBJ+NBV/hGAAFETciS40lKBklWqg=;
 b=Tkr4DZzRnA44UnlD8jXhLsOmrOQfvOqe8zjzeJArZKXDnVteoa6t2DeBRSyAXla4Zi65BI
 p2HobWjrvtk9ZmvJqW8EmrC37+XJZZX0Hsr/tfTRiYzn7z0E6QdJff6ZjRwOg7eQ1IshEo
 OsdhxF/EDWJt5dAWhQ8F0rAcett6QOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-VIShfA-5NhC4OMNpkh86sQ-1; Fri, 25 Jun 2021 05:18:55 -0400
X-MC-Unique: VIShfA-5NhC4OMNpkh86sQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70A84100CF6E;
 Fri, 25 Jun 2021 09:18:54 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D968660C05;
 Fri, 25 Jun 2021 09:18:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/53] tests: arm-cpu-features: use qtest_has_kvm() API
Date: Fri, 25 Jun 2021 05:17:41 -0400
Message-Id: <20210625091818.1047980-18-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 mst@redhat.com, drjones@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0dSm0Ffd5l/i

and drop custom function that were doing the job

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: thuth@redhat.com
CC: lvivier@redhat.com
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: pbonzini@redhat.com
CC: qemu-arm@nongnu.org
---
 tests/qtest/arm-cpu-features.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..dbeaf59076 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -26,21 +26,6 @@
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
 
-static bool kvm_enabled(QTestState *qts)
-{
-    QDict *resp, *qdict;
-    bool enabled;
-
-    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
-    g_assert(qdict_haskey(resp, "return"));
-    qdict = qdict_get_qdict(resp, "return");
-    g_assert(qdict_haskey(qdict, "enabled"));
-    enabled = qdict_get_bool(qdict, "enabled");
-    qobject_unref(resp);
-
-    return enabled;
-}
-
 static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
 {
     return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
@@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     qts = qtest_init(MACHINE_KVM "-cpu max");
 
-    /*
-     * These tests target the 'host' CPU type, so KVM must be enabled.
-     */
-    if (!kvm_enabled(qts)) {
-        qtest_quit(qts);
-        return;
-    }
-
     /* Enabling and disabling kvm-no-adjvtime should always work. */
     assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
     assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
@@ -624,7 +601,11 @@ int main(int argc, char **argv)
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
+        /*
+         * This tests target the 'host' CPU type, so register it only if
+         * KVM is available.
+         */
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
     }
-- 
2.27.0

