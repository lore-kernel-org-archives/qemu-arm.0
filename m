Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7234315wrm;
        Wed, 16 Oct 2019 07:35:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6zNg/jeJjssmLIHnjFz1kTWQUmiDp/dmnzY6iilQbwywsTiYrjZ4II3CNzv+w7H2GKfNp
X-Received: by 2002:ac8:1903:: with SMTP id t3mr46487461qtj.344.1571236503903;
        Wed, 16 Oct 2019 07:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571236503; cv=none;
        d=google.com; s=arc-20160816;
        b=HDULnWKwV/7ZIKsGb9MKimviuHdhXIgAkfu2PbacQJPaED/8lMwmmh4Pt6c+nUtiRW
         lqlF9CkHlfPEU6GacnBbFHoY/zb99t44T+uyOLtTusq3R4EzMbpIo6g9Eo68lwCknKle
         sL7g7BElL6l4M2DYFxxX5BtzKh4dcoolcyol6gSUE57NdnzLBKTxzEN/7bgGkwDX/cLq
         e4Uzd7mXh4CvG89Dd/K/ujPEpo5ADay1YOUtJH/wlJm3kb5mFrWfhKulK48Roa3ACZn9
         NiHWKja7Z44bHZ7gv1km6dDubzLogTsw+r6uQ8Z4UlIc06kQ5KHxryLeCUpztNtClXJU
         ns4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BCZxxFCyKetmJFUitjV+FMKS7jLVlIVL1kaYos3Wqfs=;
        b=d/aFCROlOcd3BL7cj/LPhP402buOiylapCq8y531QEcj109gP94m1z75zMQg938jEh
         8KqeOf6jKb91cLoKxn7aY1oJ+khwZmd/ZQEOT8vxYAgyNFQ55M+kv0ASPcl/S79IUlNE
         v3lULNkKKzHF4g1aJpZNbXJEg2t2iSLfck5ym2qMgCn2JGHJTdTVZ7f5qIU1LapjSkIH
         Wt177sIUST3mVDhJqcLGBbgvVKNowWtl/1ap1NQ0w+exj6zlnyEAc39TZul5ZToVkYf6
         oieLuX54q3jrE0/XixcoQOOk9AzPCMA2U4yaafNZpSafK3JRB5oWPpMOUmGJuqiOQ4vf
         hETA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si2125678qka.162.2019.10.16.07.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 07:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43409 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKkOE-0005cc-E6
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 10:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKkNb-00058a-Be
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKkNa-0000jf-2Q
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48796)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKkNZ-0000jE-QZ; Wed, 16 Oct 2019 10:34:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5E41307D96D;
 Wed, 16 Oct 2019 14:34:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D5719C68;
 Wed, 16 Oct 2019 14:34:19 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 4/5] tests/arm-cpu-features: Check feature default values
Date: Wed, 16 Oct 2019 16:34:09 +0200
Message-Id: <20191016143410.5023-5-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-1-drjones@redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 16 Oct 2019 14:34:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ImgTOWo9nWKa

If we know what the default value should be then we can test for
that as well as the feature existence.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/arm-cpu-features.c | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 92668efb8f56..ee444b04010f 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -141,6 +141,32 @@ static bool resp_get_feature(QDict *resp, const char=
 *feature)
     qobject_unref(_resp);                                              \
 })
=20
+#define assert_has_feature_enabled(qts, cpu_type, feature)             \
+({                                                                     \
+    QDict *_resp, *_props;                                             \
+                                                                       \
+    _resp =3D do_query_no_props(qts, cpu_type);                         =
 \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props =3D resp_get_props(_resp);                                   =
 \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert(qdict_get_bool(_props, feature));                         \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_feature_disabled(qts, cpu_type, feature)            \
+({                                                                     \
+    QDict *_resp, *_props;                                             \
+                                                                       \
+    _resp =3D do_query_no_props(qts, cpu_type);                         =
 \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props =3D resp_get_props(_resp);                                   =
 \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert(!qdict_get_bool(_props, feature));                        \
+    qobject_unref(_resp);                                              \
+})
+
 static void assert_type_full(QTestState *qts)
 {
     const char *error;
@@ -387,16 +413,16 @@ static void test_query_cpu_model_expansion(const vo=
id *data)
     assert_error(qts, "host", "The CPU type 'host' requires KVM", NULL);
=20
     /* Test expected feature presence/absence for some cpu types */
-    assert_has_feature(qts, "max", "pmu");
-    assert_has_feature(qts, "cortex-a15", "pmu");
+    assert_has_feature_enabled(qts, "max", "pmu");
+    assert_has_feature_enabled(qts, "cortex-a15", "pmu");
     assert_has_not_feature(qts, "cortex-a15", "aarch64");
=20
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
-        assert_has_feature(qts, "max", "aarch64");
-        assert_has_feature(qts, "max", "sve");
-        assert_has_feature(qts, "max", "sve128");
-        assert_has_feature(qts, "cortex-a57", "pmu");
-        assert_has_feature(qts, "cortex-a57", "aarch64");
+        assert_has_feature_enabled(qts, "max", "aarch64");
+        assert_has_feature_enabled(qts, "max", "sve");
+        assert_has_feature_enabled(qts, "max", "sve128");
+        assert_has_feature_enabled(qts, "cortex-a57", "pmu");
+        assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
=20
         sve_tests_default(qts, "max");
=20
@@ -417,7 +443,7 @@ static void test_query_cpu_model_expansion_kvm(const =
void *data)
=20
     qts =3D qtest_init(MACHINE "-accel kvm -cpu host");
=20
-    assert_has_feature(qts, "host", "pmu");
+    assert_has_feature_enabled(qts, "host", "pmu");
=20
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
@@ -427,7 +453,7 @@ static void test_query_cpu_model_expansion_kvm(const =
void *data)
         QDict *resp;
         char *error;
=20
-        assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature_enabled(qts, "host", "aarch64");
=20
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
--=20
2.21.0

