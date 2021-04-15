Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp499587lfr;
        Thu, 15 Apr 2021 05:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb4UBkdcrTUqTOJSQwhtP5v7HRRw6Y+8AAJ25wfJi2GlmNTdJkKEyM77nsp/91EcPwz3QQ
X-Received: by 2002:a5e:c102:: with SMTP id v2mr2442213iol.137.1618491497348;
        Thu, 15 Apr 2021 05:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618491497; cv=none;
        d=google.com; s=arc-20160816;
        b=sF4wgGudNX9yfmhOtnVKCY8dj3H6s01GQ+flXlyeM5cjrxYtkP5GDAWGhvk3zubIyi
         Do+eOY+wXArn5TajdjEAMXb3BvWWBM5GPg/SxNT/JmvjE3K+UpsQxKScc7qDX9i66Ddr
         stynhyv7yTkAGUzHEYqJ5iXPCioPxQDisiURWOueHdVXwaf1xw2b6qhW/c+k8EjBwicr
         ryl8qHI1A22mRpffSM8rEzqFd62hLwsfIvyif5gPrfY66uPAr/aRBys2z89dpkS3oKyF
         p0QZTZbWcph2SGw1pW5+1mkXqlUcXNqpJnuZy0AV2TvQbbGoDLtRyFv5ohEV3n5ntNwt
         aGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
        b=1BrHNT7vpl5RGlaruEi3pabcmxoSIYMym06W7lAU+KtRjbzGuXkm5YaIK5T0qGttJw
         rCpoxE44L0CMOkXI1y81RLYmSWfhZ+qOkwkIr2xDyKy7K/rNaw6S+V/SUrxBT2cpwxpu
         aG6x0J4+4QMVU+TaxeZNsYKgtaWOaQPrIu9sy1ZciQSqo106GpTr5uNtAjGy6M2OfLx7
         PQOCp4Ry0xEqvBVAkJ4kgiScTE3ICsOtVlZgi3Tc40Ygq+Wop+Nyf8cYcaOsr8lCEZxq
         E/JBPANDL+cRHbfi6O0aaJLiiYCnWH/binouKNabC29F9wQ/JRcMyIYCAnB7oUaIp805
         kD0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NrK8NlQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si2691956jak.24.2021.04.15.05.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NrK8NlQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX1ZY-0003BK-Hv
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Z4-00038n-5M
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Z1-0006MS-JG
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618491462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
 b=NrK8NlQKgj6HXInW/itDPqlSljwvbqduijbZ4i/MosYYWdPElubMwjt35z8g3AwckwE2C3
 kuhjRCPOHJ+Gp2ZDV0/Ke1HcsDm346MGI6oraaA2p0PaI7YzIsFkqb6uRG3JZtbY+37j9h
 sik/G4PCTZy8Aj78GIBfM7fHutQqU7M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-K5IP8f6YMaGN5GufRO0_zw-1; Thu, 15 Apr 2021 08:57:41 -0400
X-MC-Unique: K5IP8f6YMaGN5GufRO0_zw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m16-20020a0560000250b02900ffde35c102so2718711wrz.20
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 05:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
 b=XXPtiRywYSuRowymkOc5GhHTFsxGJTU4aLZ2wAlnyolAtExRNjTicK1Dcau9E7sGzs
 wkJwGY7BA+9qpZ/PdTStVrhhxGt4T7yaB/dzargjWr8C5QRrvzCT0WmOhiafMHghDlUZ
 Syyt1Aa1XEAWJ/19bKqi9bo5Wwi09x8uzh8Yq6zxVieTEtInrmcWL622mqyVuqfVunK1
 yqAb34XyVB6xcq9KVVfZZaSYP7m+4t/Wsr493cgzmmAqvO2wJxi01dh9A9D4Kj74lozk
 RB9knLe1+XIZVtTTHat7yEioQz6pQtMYQ6xqLqfiVnISyTLdJZan7B/HZEL2dO5dHqUs
 kgNg==
X-Gm-Message-State: AOAM533287m2FQOGmV1crx/HsPF8I+o2BDZmNAXXVEue/sV/4NVMoDiG
 idQQktnJDwYrQvQP4JK8VAJqZq2zuazB0lUhgQmeK2rsgaCKz5dLCfY0kBrfxF1tsvGJi0pN8wH
 4PTksh69wsPNF
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr3014247wmh.151.1618491459963; 
 Thu, 15 Apr 2021 05:57:39 -0700 (PDT)
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr3014231wmh.151.1618491459807; 
 Thu, 15 Apr 2021 05:57:39 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 24sm3016453wmk.18.2021.04.15.05.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:57:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/6] qtest/arm-cpu-features: Use generic qtest_has_accel()
 to check for KVM
Date: Thu, 15 Apr 2021 14:57:37 +0200
Message-Id: <20210415125737.4064646-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9BxPc0stcYr

Use the recently added generic qtest_has_accel() method to
check if KVM is available.

Suggested-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb85..7f4b2521277 100644
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
@@ -624,7 +601,7 @@ int main(int argc, char **argv)
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
     }
-- 
2.26.3

