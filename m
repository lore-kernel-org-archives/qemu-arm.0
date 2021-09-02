Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp197806lfb;
        Thu, 2 Sep 2021 05:12:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrHNJWQ4GiV86d0m6+Yu+kMR+yUxqv8rv8nZOn1er6uv3W1erPjENiAxXQDda4iNtaeORH
X-Received: by 2002:adf:c501:: with SMTP id q1mr3337966wrf.150.1630584756256;
        Thu, 02 Sep 2021 05:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630584756; cv=none;
        d=google.com; s=arc-20160816;
        b=GjF1SU1xGgNN+zNZ6YPbZGSni8IH/dtdZ6lCDjnFPKlSad5HOrA28atJb6ZEiixCvk
         hHsCzZqlnxtJ4JV3EVX/nBgG6apvVneOerZNhRXDAigxcNbCa+5XDNrmCbFJf+VxbaS5
         BfDvmQNkD/MyfeL2mG9sgZkZbc77JaTwWaVR3wdGpGhh0UDHW8rxeJAvbU7wCE+IfEFw
         rVhB0zd3kkZBNx3+JmQLLWFtOZzh6D3vWOslUfINQtRkdkOdxBfd+E5SxHs7oLU+F5X6
         ledqyiZzpZih8MYctJdp+TkvpGmS+1hdjz8smCRxrp6OlCzYT+amVRi+sVkITh9T0S0i
         5a6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NStKSH3WqzLw60yYJqSJTS49SPzpMUOJ98Z4W7Z0zw4=;
        b=L6wqDDEUMTIhIK0R4MVLz77rReYPIC80jn8/BQ3w+tAY3BsyD9wJ7eD7Bv+k+pG4uF
         sFdblc0edLNFM39rVNZCQOta8ESzpP0YzTAN35Rs7VVCEXIsjySWMAilHFV2Nf6O0cco
         6H9MYZKUc5Jij4ZzpmVOXTz8HE9PGCnlE4CYReYuBC3aLv0VV6UVHY+Xi7AY565KBHXX
         y61zUmm+FRez/A6s9wMzSRmeizgoL39Jr6e5+l9iko1XffO94IRlo5sSjY9Z/FpaeeQL
         vSvO6u1GwftpUT0snBUbyyYLvLz+35s6ApuXbknXn+ufq+Q0GC8iX2iGtZzWuJFtmGV1
         UfVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7nP4ZFM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si1895816wrb.393.2021.09.02.05.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 05:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7nP4ZFM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLla7-0005s0-Bh
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 08:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0u-0000oA-V4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0t-00051I-Cn
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NStKSH3WqzLw60yYJqSJTS49SPzpMUOJ98Z4W7Z0zw4=;
 b=a7nP4ZFMxcbjIgOsSL8wyDno6hjlXjQvC2YXkjCFy6whJ4yfDVGGu3br66OkgcnRa7GNNx
 +IM0qe7Q2QRby7LIzIUeixISYv13rS6TYhQLjxv6MMDYXKCawR9wOBUkpCAJQWc+cFGdPm
 O7GsCDhFnUSyIbLKaZwrJXFO5zoMT9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-ReaV_znNNIKJaowoNQxSSA-1; Thu, 02 Sep 2021 07:36:09 -0400
X-MC-Unique: ReaV_znNNIKJaowoNQxSSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DACCE1940926;
 Thu,  2 Sep 2021 11:36:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 546C86A8F8;
 Thu,  2 Sep 2021 11:36:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] tests: arm-cpu-features: use qtest_has_kvm() API
Date: Thu,  2 Sep 2021 07:35:49 -0400
Message-Id: <20210902113551.461632-14-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 mst@redhat.com, drjones@redhat.com, eric.auger@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTae97Acmyg3

and drop custom function that were doing the job

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: eric.auger@redhat.com 
CC: thuth@redhat.com
CC: lvivier@redhat.com
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
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

