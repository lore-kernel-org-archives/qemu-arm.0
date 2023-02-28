Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5845600ejc;
        Tue, 28 Feb 2023 07:03:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/0AgsP8h3lB/qtIHx1RiiG9VaSzSgVSxFNMBRiG0BQzQPHXEhxDmAkJS3lkn0OsNwR5vJG
X-Received: by 2002:a17:906:b7da:b0:8b1:7a86:b06f with SMTP id fy26-20020a170906b7da00b008b17a86b06fmr2401152ejb.63.1677596615614;
        Tue, 28 Feb 2023 07:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677596615; cv=none;
        d=google.com; s=arc-20160816;
        b=YorWj0ebmsQ/oopfi39Z8e7XksBwxj/RIv/zJrtrU/PKHW5BSQVnlKDIHtMf5rmnla
         I9aU6GhvHUlDSAn8+Acogvhf7Ywzvksx356xOz9izVDwsnDsEqlrDVNR6U9DkwU3kksD
         6lZIVNlpiTUvR7eQnNQBFvsxfPvJzPudMaA2hiVCG6VLxTWjMRfqoGLnZ0WC716qcCoz
         s1iVrk94KoEpRbzr90Ca5btOWUaCunuiPshWmQHcXZ4+d5UtLxvQgs7qX/DYS335Xtbj
         3fPPqyA3hcy0OYxbWIdhvz/uyyVCwRHbbB6b1x/Oi+wieza8mGZcYAcAR1oYwNVVWp+I
         9S2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=rIsd2AR6rBy3LvtthCKr/JKSUa9znVYdiWORb5ehAkA=;
        b=upvpSm0PqE1CdDYT+rAMym3n3qVnXLFIuO8zKyJLa2e7Blp9owQ3sMtt7I2LgVAGMH
         2h58YDCK6/sR6fAK4n7mNnqtX/vjFox9g2UQ2CWI3JsDy1FFdGH6v0+tO7W7Rignms4C
         hHkkds8aFGVxpT+pUsUakSFLbVyy0SlqWio4KeXSBhqmzwOSb68/i8m7MLyq3s1Aa1Cq
         mk+EP75SYAruaPM2xXtxslEUiFsjmIRTZkS7kZcwuJ6jkinCfG0F1Dv+0fhm4R76rY7V
         nyMnE5K6Az1OvtsnDcdiztiJLRIyijkIg+oemUGg/8HS1j7es8HoSmHhxYS3j4lOtk8T
         Az1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bVSnEFUH;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id p9-20020a1709060e8900b008c35025ce35si11392704ejf.57.2023.02.28.07.03.35;
        Tue, 28 Feb 2023 07:03:35 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bVSnEFUH;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjB1PDe (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Tue, 28 Feb 2023 10:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjB1PDd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 Feb 2023 10:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFCC2BEF8
        for <kvm@vger.kernel.org>; Tue, 28 Feb 2023 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677596564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rIsd2AR6rBy3LvtthCKr/JKSUa9znVYdiWORb5ehAkA=;
        b=bVSnEFUH3o2GtsVnGqPdJbCjUcDK8q4XkCJwcVY36VqngOqJfw+xm5y7HCgtfxNFRU05le
        3DTuC9NAroy7NtYMlncRg/5KdmZVH4qKErKCYVSP+9RQ7ATdVnL/M0BhmSWlZxhcrsPrGq
        AwFEy9Q7DPPrmbLZrxHgiR/Pbb7xCrg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-gAnLldRtOpO0CBL4B9-sug-1; Tue, 28 Feb 2023 10:02:41 -0500
X-MC-Unique: gAnLldRtOpO0CBL4B9-sug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCBAB1C06903;
        Tue, 28 Feb 2023 15:02:37 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0016F492B0E;
        Tue, 28 Feb 2023 15:02:35 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 2/2] qtests/arm: add some mte tests
Date:   Tue, 28 Feb 2023 16:02:16 +0100
Message-Id: <20230228150216.77912-3-cohuck@redhat.com>
In-Reply-To: <20230228150216.77912-1-cohuck@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ahOYxfmCZ/Dy

With TCG, verify the interaction of the 'mte' cpu feature with virt
machine tag memory.

With KVM, only verify the existence of the cpu feature, as we cannot
probe or enable the feature.

Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 80 ++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 1cb08138ad1c..9533646f0dc5 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -22,6 +22,7 @@
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
+#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -156,6 +157,18 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
 })
 
+#define resp_assert_feature_str(resp, feature, expected_value)         \
+({                                                                     \
+    QDict *_props;                                                     \
+                                                                       \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props = resp_get_props(_resp);                                    \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert_cmpstr(qdict_get_try_str(_props, feature), ==,            \
+                    expected_value);                                   \
+})
+
 #define assert_feature(qts, cpu_type, feature, expected_value)         \
 ({                                                                     \
     QDict *_resp;                                                      \
@@ -166,6 +179,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     qobject_unref(_resp);                                              \
 })
 
+#define assert_feature_str(qts, cpu_type, feature, expected_value)     \
+({                                                                     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query_no_props(qts, cpu_type);                          \
+    g_assert(_resp);                                                   \
+    resp_assert_feature_str(_resp, feature, expected_value);           \
+    qobject_unref(_resp);                                              \
+})
+
 #define assert_set_feature(qts, cpu_type, feature, value)              \
 ({                                                                     \
     const char *_fmt = (value) ? "{ %s: true }" : "{ %s: false }";     \
@@ -177,6 +200,17 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     qobject_unref(_resp);                                              \
 })
 
+#define assert_set_feature_str(qts, cpu_type, feature, value, _fmt)    \
+({                                                                     \
+    const char *__fmt = _fmt;                                          \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query(qts, cpu_type, __fmt, feature);                   \
+    g_assert(_resp);                                                   \
+    resp_assert_feature_str(_resp, feature, value);                    \
+    qobject_unref(_resp);                                              \
+})
+
 #define assert_has_feature_enabled(qts, cpu_type, feature)             \
     assert_feature(qts, cpu_type, feature, true)
 
@@ -413,6 +447,24 @@ static void sve_tests_sve_off_kvm(const void *data)
     qtest_quit(qts);
 }
 
+static void mte_tests_tag_memory_on(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE_MTE "-cpu max");
+
+    /*
+     * With tag memory, "mte" should default to on, and explicitly specifying
+     * either on or off should be fine.
+     */
+    assert_has_feature(qts, "max", "mte");
+
+    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
+    assert_set_feature_str(qts, "max", "mte", "on", "{ 'mte': 'on' }");
+
+    qtest_quit(qts);
+}
+
 static void pauth_tests_default(QTestState *qts, const char *cpu_type)
 {
     assert_has_feature_enabled(qts, cpu_type, "pauth");
@@ -425,6 +477,19 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
                  "{ 'pauth': false, 'pauth-impdef': true }");
 }
 
+static void mte_tests_default(QTestState *qts, const char *cpu_type)
+{
+    assert_has_feature(qts, cpu_type, "mte");
+
+    /*
+     * Without tag memory, mte will be off under tcg.
+     * Explicitly enabling it yields an error.
+     */
+    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
+    assert_error(qts, cpu_type, "mte=on requires tag memory",
+                 "{ 'mte': 'on' }");
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -474,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
 
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
+        mte_tests_default(qts, "max");
 
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
@@ -517,6 +583,18 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         assert_set_feature(qts, "host", "pmu", false);
         assert_set_feature(qts, "host", "pmu", true);
 
+        /*
+         * Unfortunately, there's no easy way to test whether this instance
+         * of KVM supports MTE: the cpu model expansion will return "auto" for
+         * the mte prop, regardless whether the host/KVM supports MTE or not.
+         * Even if we got around that hurdle somehow, we would need to setup
+         * proper memory mappings in order to enable MTE, which is not feasible
+         * with qtest.
+         * So we can only assert that the feature is present, but not whether it
+         * can be toggled.
+         */
+        assert_has_feature(qts, "host", "mte");
+
         /*
          * Some features would be enabled by default, but they're disabled
          * because this instance of KVM doesn't support them. Test that the
@@ -631,6 +709,8 @@ int main(int argc, char **argv)
 
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off_kvm);
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
+                            NULL, mte_tests_tag_memory_on);
     }
 
     if (qtest_has_accel("tcg")) {
-- 
2.39.2
