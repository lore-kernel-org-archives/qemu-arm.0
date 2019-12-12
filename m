Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp999951lff;
        Thu, 12 Dec 2019 10:13:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLFNhCA0NtlLprdGFjyAqDhXJFrNFvdps5VMaFheGKG9Dp9znwcUW5x86KLChAJRb4T3nA
X-Received: by 2002:a9d:6b17:: with SMTP id g23mr9191935otp.265.1576174410141;
        Thu, 12 Dec 2019 10:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576174410; cv=none;
        d=google.com; s=arc-20160816;
        b=GnHwGlulpO4UYABZ5sBagTC/RM+hGH9o3r+xdBCE9Fn3FJmn4aSVkj1ESQthESfNAn
         eBLf3F5IgHQ0PRoM8yTRrlrh5woUZ5r60OqxgVRbIx4sP46ME31C+6vG/4JzW51KIndR
         viRPmZduViTSjBDJnB6v6W5im7KiRhzs8/LhiGlE/Nwp8if/ZliBdyWUD7oLoAITT8ZD
         BXQag+Ne263f/MIWzxASRgqYEKbm1UJi9JieZlPJ/77mFewfAqvshltQGqAwmrVmZfWD
         wbdAbv1R3z6X1gDtzig0wPehzvJ/CpX+Qdq5od8o3Ldz0g1t/DY4h9KDoQyhmzXWGg/5
         SSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SPLS5NIhOUYnpOd47+R+TTvsglOjsh+VvePSphXpSOc=;
        b=Fvf0KR3843HOosBfFUptpGIud9wyDiUVHF91InLJHZILDeh0d8BtrqbtoM72QU1jjW
         QUI+TAVEgIgImBGZaNmFiCuP34siZs9+rw8QA50NGL+g/lEZ2XNQSESWP+Eqkk4uLWff
         NL0FXSp1nY5Hi7Cv4Lx6+tk9xnHjQXytE9BI3x3wJf8gRG7EFHx2+B827IfGSOT7wmIy
         0HuXkoVjay8/EnsUz9Zj6j8ExLNkX3QHMfPz7NYjOuDPkDDASB7BpovjWx5bLSBygIX8
         zz1y2s24JiNAL74kWBu+Xg1ZA7SLnkkyBpgkPvc1NytUlC49MzVfLZuyzgSNW2PyOx1J
         58Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wqd8bXgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si3684557otl.214.2019.12.12.10.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 10:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wqd8bXgH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifSxs-0005m7-UM
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 13:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1ifSLV-0002PX-G8
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 12:33:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1ifSLU-000392-5y
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 12:33:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26174
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1ifSLU-00037Q-0A
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 12:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576172027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPLS5NIhOUYnpOd47+R+TTvsglOjsh+VvePSphXpSOc=;
 b=Wqd8bXgHQCpzuMoXYWzedZEkQKnTJrzX+KeEZXow6UW6d9ovY2ohRNNb0w/r5rPiK09FWV
 bQuVahdTCPXtMSKBgaPzhXlWNfzzZVxdtUg5DHhmiHizk5ds5l4a3B8tSgQaQRj2UDBZGs
 sscMnNRogwhgfksdcTVyZEi818hF5SY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-pGsM3uK6M5qBd83KTUfzeQ-1; Thu, 12 Dec 2019 12:33:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13860100550E;
 Thu, 12 Dec 2019 17:33:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84FDC19C4F;
 Thu, 12 Dec 2019 17:33:38 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v2 4/5] tests/arm-cpu-features: Check feature default
 values
Date: Thu, 12 Dec 2019 18:33:19 +0100
Message-Id: <20191212173320.11610-5-drjones@redhat.com>
In-Reply-To: <20191212173320.11610-1-drjones@redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: pGsM3uK6M5qBd83KTUfzeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, Eric Auger <eric.auger@redhat.com>,
 guoheyi@huawei.com, msys.mizuma@gmail.com,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DoQsjVa/HeH5

If we know what the default value should be then we can test for
that as well as the feature existence.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/arm-cpu-features.c | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 6e99aa951e74..06ed05e934e6 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -159,6 +159,32 @@ static bool resp_get_feature(QDict *resp, const char *=
feature)
     qobject_unref(_resp);                                              \
 })
=20
+#define assert_has_feature_enabled(qts, cpu_type, feature)             \
+({                                                                     \
+    QDict *_resp, *_props;                                             \
+                                                                       \
+    _resp =3D do_query_no_props(qts, cpu_type);                          \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props =3D resp_get_props(_resp);                                    \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert(qdict_get_bool(_props, feature));                         \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_feature_disabled(qts, cpu_type, feature)            \
+({                                                                     \
+    QDict *_resp, *_props;                                             \
+                                                                       \
+    _resp =3D do_query_no_props(qts, cpu_type);                          \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    _props =3D resp_get_props(_resp);                                    \
+    g_assert(qdict_get(_props, feature));                              \
+    g_assert(!qdict_get_bool(_props, feature));                        \
+    qobject_unref(_resp);                                              \
+})
+
 static void assert_type_full(QTestState *qts)
 {
     const char *error;
@@ -405,16 +431,16 @@ static void test_query_cpu_model_expansion(const void=
 *data)
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
@@ -451,8 +477,8 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
         QDict *resp;
         char *error;
=20
-        assert_has_feature(qts, "host", "aarch64");
-        assert_has_feature(qts, "host", "pmu");
+        assert_has_feature_enabled(qts, "host", "aarch64");
+        assert_has_feature_enabled(qts, "host", "pmu");
=20
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
--=20
2.21.0

