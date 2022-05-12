Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp403578lfj;
        Thu, 12 May 2022 06:12:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1wLoIbDS+SXtiUJcIOI0pA/YGBSpbd8HXV+sfUaeBb0GjOeEcYNdqusabcYS5/JGu8mbp
X-Received: by 2002:a05:6402:90e:b0:425:a4bc:db86 with SMTP id g14-20020a056402090e00b00425a4bcdb86mr34930923edz.98.1652361139489;
        Thu, 12 May 2022 06:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652361139; cv=none;
        d=google.com; s=arc-20160816;
        b=u2mXz0IdQtGcChMPu8gAebe08uFG9wH/Bij/6ydQZzuUuOLt6PkLEsvwOvT1cXFT6L
         6duTHBEBKAQHLkZZnwC5D3NEXBW/tP9o7bi4EqTQsKhy7Jgm+7F1yKj7fATk6bV9DDu6
         YknNSkEP58qQbYQWDUobVRc34yXceKmJ5Yfuuf62ZxzPhxEgwyy3xJYE9zotW0+hWTJ7
         dHtJHWRFnWZj5e/5Mb6Q16KhXnCNgCgcSQGGDw5At5wIKXuy15QDrYxEsEn5/B3TPUM1
         2Rm0Vbg37aIfuS1swcMzerzy/B8k8y67qE7ixbP4C7nXHnT+Mhd+obK+WglZ1T8KOO2T
         o1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=AB0PU4I+UYiZ9aacszyhe3Z6+GgBrCigqQkND5ZGRww=;
        b=bJwDmVPShdcNNHSo2iXDS83K8BQvsPTeS73MfJ0QjnsLp2t3ptvppMc0UhlY8zLJwv
         E8fT/M9LwXZwAZKHxKJsNozp0tcdKM4T9s1BXl6FqPo5Xz33Mv5DqjCUnmdhy5vUv+2g
         y2qBpRWjOFfU6I0m7yNqkUc9Ptwae6QlfXO4oKE06mCgAx/54nMIEhhLsM73KDi7sQBN
         lTP95AuAALp5KAEh8NdlAhFi8hH2JmTjxnUo2W3y+lC0+EGgL2tepdYWtkdTX2/49YZe
         SVZZQMAQQeZjczHawYYyRCpshpzDssoR/lNhDR6MPDJga9w6eH0WU6F3yoHVYmQChH+J
         Xm6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zfye5o07;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id cm15-20020a0564020c8f00b00425cd11d846si5679560edb.112.2022.05.12.06.12.19;
        Thu, 12 May 2022 06:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zfye5o07;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354213AbiELNMR (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 12 May 2022 09:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354251AbiELNMK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 12 May 2022 09:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E7021F68D5
        for <kvm@vger.kernel.org>; Thu, 12 May 2022 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652361122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AB0PU4I+UYiZ9aacszyhe3Z6+GgBrCigqQkND5ZGRww=;
        b=Zfye5o07gKy32ndDGQGQqF3s4TratYkAksYKSiQA8ziHKQjpP9NH0ZuzUdBk5xZGga+RjL
        5JQwbTH8TKBBIllmYC9qMFXiY8+lAFkKT28m5d+DDOP+SGw0yG3OKwnY5tK9sphEhYG9Z3
        CncKvEifZ9USGOl9ldm6Vz1/Ly2qSZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-NUT9pbrqM9uKwt01D8fMHw-1; Thu, 12 May 2022 09:11:58 -0400
X-MC-Unique: NUT9pbrqM9uKwt01D8fMHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8174E2A59546;
        Thu, 12 May 2022 13:11:58 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.157])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 797887AE3;
        Thu, 12 May 2022 13:11:55 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC 2/2] qtests/arm: add some mte tests
Date:   Thu, 12 May 2022 15:11:46 +0200
Message-Id: <20220512131146.78457-3-cohuck@redhat.com>
In-Reply-To: <20220512131146.78457-1-cohuck@redhat.com>
References: <20220512131146.78457-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZNmsIiOL3Zce

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 5a145273860c..c0be645b1fb0 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -22,6 +22,7 @@
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -412,6 +413,17 @@ static void sve_tests_sve_off_kvm(const void *data)
     qtest_quit(qts);
 }
 
+static void mte_tests_tag_memory_on(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_MTE "-cpu max");
+
+    assert_has_feature(qts, "max", "mte");
+
+    qtest_quit(qts);
+}
+
 static void pauth_tests_default(QTestState *qts, const char *cpu_type)
 {
     assert_has_feature_enabled(qts, cpu_type, "pauth");
@@ -424,6 +436,14 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
                  "{ 'pauth': false, 'pauth-impdef': true }");
 }
 
+static void mte_tests_default(QTestState *qts, const char *cpu_type)
+{
+    assert_has_feature(qts, cpu_type, "mte");
+
+    /* without tag memory, mte will be off under tcg */
+    assert_has_feature_disabled(qts, cpu_type, "mte");
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -473,6 +493,7 @@ static void test_query_cpu_model_expansion(const void *data)
 
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
+        mte_tests_default(qts, "max");
 
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
@@ -499,6 +520,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_steal_time;
         bool kvm_supports_sve;
+        bool kvm_supports_mte;
         char max_name[8], name[8];
         uint32_t max_vq, vq;
         uint64_t vls;
@@ -523,10 +545,12 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
          */
         assert_has_feature(qts, "host", "kvm-steal-time");
         assert_has_feature(qts, "host", "sve");
+        assert_has_feature(qts, "host", "mte");
 
         resp = do_query_no_props(qts, "host");
         kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
         kvm_supports_sve = resp_get_feature(resp, "sve");
+        kvm_supports_mte = resp_get_feature(resp, "mte");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
 
@@ -592,6 +616,11 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         } else {
             g_assert(vls == 0);
         }
+        if (kvm_supports_mte) {
+            /* If we have mte then we should be able to toggle it. */
+            assert_set_feature(qts, "host", "mte", false);
+            assert_set_feature(qts, "host", "mte", true);
+        }
     } else {
         assert_has_not_feature(qts, "host", "aarch64");
         assert_has_not_feature(qts, "host", "pmu");
@@ -630,6 +659,8 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off);
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off_kvm);
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
+                            NULL, mte_tests_tag_memory_on);
     }
 
     return g_test_run();
-- 
2.34.3
