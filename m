Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4117969ejc;
        Wed, 11 Jan 2023 08:14:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXusJRSGmtNErfsvdkSKKZYU8MEf429e9Bejo7UqzQI06l/0XtjK5BtUPxqax1cMBkZQkTrv
X-Received: by 2002:ad4:4dc9:0:b0:531:c3b0:49e with SMTP id cw9-20020ad44dc9000000b00531c3b0049emr48910251qvb.20.1673453683079;
        Wed, 11 Jan 2023 08:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673453683; cv=none;
        d=google.com; s=arc-20160816;
        b=P9f851nLUHl4/At1PSBwkQjFQBkLcRmYnkJwTfoMfGixm+VaKWah/7vGp1aXD/JQ/q
         0uZ2L5ydWlGeozCzIEtpe1bEKRTvR9dTuKH/jJYwr02917bEG3r6l/NsuVpbbpl2YxZo
         xK2vRW/93bXn48zubAVQYWKcF4I98V1qMXCbDB8N3VzvFOYwj90QqlkYhyC+66DjCqtC
         szadc3Vr0rt2XCKjeMpTMO5aM6gHj0xxuE79kfF2sRu2emPqJIlyt86odxzAkuqH/e3R
         DdgP0la4hFxRDVJDTi6bw8iG6pKLNN3JaPphGW3g7o+TEXK8wVSN9csv43qMqnPHMSKb
         pKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q7U3BISuSPwAWuMpwLqgxRRbJoso0xAD3vBoILCXk1A=;
        b=Dy0vHwHspppL7ofuW4DC4eZgaoYgrFQfFbQL23hnl7e32V00E4t8rC3w1dZ915AInu
         t/2X71tHXavsRqEo/RU4mNLojPNDtBsEzeg1nrJ6gHYXnnJuzTpCxRnY+5LXOiN6TkDM
         UPZ+8b17pvKboEUIim4ZIMnkNv9uWpTAqWL8SVE3eX7T63AITL2KCR8hGylSvfT3Ob37
         bRH4whPX+QLYO5r3u6xgvuofFEDqbuDbTGP15g1cBYXBtnZxiETOsf5rF2EbZj4Utrjr
         YLNlD+NJ/Edg81DAbARI15poFS65c7DRet10DcqZBFE7rHhG+xRCaZ/gwB8kmi49Lebj
         TTQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dnqNH50Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey5-20020a0562140b6500b0053227970d47si6987328qvb.231.2023.01.11.08.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 08:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dnqNH50Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFdjS-0000nE-Uw; Wed, 11 Jan 2023 11:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pFdjR-0000mI-Kq
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 11:13:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pFdjL-0002x8-Q8
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 11:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673453614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7U3BISuSPwAWuMpwLqgxRRbJoso0xAD3vBoILCXk1A=;
 b=dnqNH50Y8PjwHwe5xP8yHw8s0RXpTbt50KyASCGiIwBU4Qj9//hRpTFpExsdnlpEGLfeof
 5a7SXYdff5+hof3Y7BGZcn3GU2wggCmaAYzNzvEiWBVyDB5SGkgIqDRs41YQqbS5nzoc2f
 LoNm+c6oNq+nsP/k+vUB642vSfEH2xw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-VmhDB6ldPOS3ANR5C0iavw-1; Wed, 11 Jan 2023 11:13:30 -0500
X-MC-Unique: VmhDB6ldPOS3ANR5C0iavw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6D51C08797;
 Wed, 11 Jan 2023 16:13:30 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.195.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E00A52026D68;
 Wed, 11 Jan 2023 16:13:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v4 2/2] qtests/arm: add some mte tests
Date: Wed, 11 Jan 2023 17:13:17 +0100
Message-Id: <20230111161317.52250-3-cohuck@redhat.com>
In-Reply-To: <20230111161317.52250-1-cohuck@redhat.com>
References: <20230111161317.52250-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=cohuck@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: rmOlqcBB9FMN

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 5a145273860c..e264d2178a8b 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -22,6 +22,7 @@
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
 #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_MTE "-machine virt,gic-version=max,mte=on -accel tcg "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -155,6 +156,18 @@ static bool resp_get_feature(QDict *resp, const char *feature)
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
@@ -165,6 +178,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
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
@@ -176,6 +199,16 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     qobject_unref(_resp);                                              \
 })
 
+#define assert_set_feature_str(qts, cpu_type, feature, value, _fmt)    \
+({                                                                     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query(qts, cpu_type, _fmt, feature);                    \
+    g_assert(_resp);                                                   \
+    resp_assert_feature_str(_resp, feature, value);                    \
+    qobject_unref(_resp);                                              \
+})
+
 #define assert_has_feature_enabled(qts, cpu_type, feature)             \
     assert_feature(qts, cpu_type, feature, true)
 
@@ -412,6 +445,24 @@ static void sve_tests_sve_off_kvm(const void *data)
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
@@ -424,6 +475,21 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
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
+    assert_has_feature(qts, cpu_type, "mte");
+
+    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
+    assert_error(qts, cpu_type, "mte=on requires tag memory",
+                 "{ 'mte': 'on' }");
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -473,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
 
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
+        mte_tests_default(qts, "max");
 
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
@@ -516,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         assert_set_feature(qts, "host", "pmu", false);
         assert_set_feature(qts, "host", "pmu", true);
 
+        /*
+         * Unfortunately, there's no easy way to test whether this instance
+         * of KVM supports MTE. So we can only assert that the feature
+         * is present, but not whether it can be toggled.
+         */
+        assert_has_feature(qts, "host", "mte");
+
         /*
          * Some features would be enabled by default, but they're disabled
          * because this instance of KVM doesn't support them. Test that the
@@ -630,6 +704,8 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_off);
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off_kvm);
+        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
+                            NULL, mte_tests_tag_memory_on);
     }
 
     return g_test_run();
-- 
2.39.0

