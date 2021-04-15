Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp693136lfr;
        Thu, 15 Apr 2021 09:40:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7th4oDCBOOvZCPK5EXuiIxuAWf+H1sSz3wZdDtrVA4kIo5dxsMje23rToIVybKFhsG+Yv
X-Received: by 2002:a5e:a515:: with SMTP id 21mr132700iog.164.1618504825263;
        Thu, 15 Apr 2021 09:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618504825; cv=none;
        d=google.com; s=arc-20160816;
        b=pp+vA021cfAf0yi36wd+FQgXC/ObCfkfGT+jshhs1FzogsyaOwJfB6D9FHf4zsiYH8
         wyYBlA9HA2H2v6ceBYmxVPZz7CbNOBLyR6Cw9lN1l8R1sfI6VNZrd9ann4SMLY0UiCuK
         7MWDOneDUW7IZ4EZFsRc16+NfxAjnmGaI7hciKFBgExMh0PuIwdl3Ofmy8LVQRUIb3kG
         0+MXO5ZbZuTLv2nHTkLfcJ0pK7llAsb3o6I5qQDAMHiY7Cx4VDhnh9Q568arpZygIeCq
         /x/ke5wJxLP3LXJFlOD4J+cUV6hKZGLrpJQ7hV8CO9/Okt7bP3GHR48euCx32p+64vaw
         rFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
        b=keO8i8pKX3w8SUFTVCOOAhK8ch+kYU1tvU9pown/T1oOtJ4zQScKHa2o7vojChxMTr
         L8JGwtfWHPP0IWl8DV5LlpSusClh+RGKHRaSrQm3Wsi21SvuT7msSh0yKU8QqORzgBGB
         a+rs3QDdwm0xwJbpfsOs52wc/x/2gUO9pT3jwZYblW72EBbxVyLwg9HfU60dIjR2EOjD
         z0O16ucsuMuOgF/0J9VZ+3aTjLcqS4na3ufRGtps1tH2XIPOFPwFAtwTRgm59379J9hI
         sRBhN38Xr5rDPtCL3k+kRZIhJxxepf3v+uvQDw7nQfAzE6d2yuT4r4KME6PhBGfIah6P
         3vfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vo4iMg6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si3035039ilh.28.2021.04.15.09.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 09:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vo4iMg6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX52W-0007VX-I6
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 12:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vy-0003IG-6O
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vw-0006Bp-A2
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
 b=Vo4iMg6NJU8uetz4dDUge4u0XtPvgiFpk4g1w6ugv++u7i/O8prFjcjJB5Q915vRvYJJoG
 4DOIcKptYQ9bW82N43h7GOnJC9w8jfpDEhZswN2OXd+3lnT+nAA4qe+CLIRxGAae6uA6hT
 +gpRuxFP2LfESlPjDKhEZ5PgHyUAQ84=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-PEyzNz0GP8WL67W1KzB5-A-1; Thu, 15 Apr 2021 12:33:33 -0400
X-MC-Unique: PEyzNz0GP8WL67W1KzB5-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020a5d6a4e0000b029010277dcae0fso2987143wrw.22
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 09:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guk+TFRH4H8npjA92ucehbcfrQY0sqYaSCHgw+fxV9U=;
 b=H7x2UzrtVQi5eVQMsWVpjD2TGed7+SNglueggE1N5HpkMi1MbXr92UDn/WJDya6nuT
 9E83ccx4jAW4HESShe+yO9IRLvh+soERvLfD3m2S2nZ+gCqa3a8rzeaGT6xtxvoNGTW6
 L3s87vhWOFUG0qg9ZpktZ3CD1hkXxxPjQ4/Z6b3gy99vt6BBBv9cp5RqjV1upePdNIgD
 6SGMrQBXs0s+3TvGKAXph78wWF1WB9fIXfQNsDrvUqCvp/1mt+cPZPV+4uc5wYl1d5vu
 aBl4GLOLNyOnw3aVEqCDnlH7ffJPmbfyWSFDYVv5og9vWTUrkPSg5FLzJWwcQTGLFqjL
 kjgw==
X-Gm-Message-State: AOAM530UscBxHoFDpc3s8PnPK+idmUDDfhrGA+3lnid/3LdxbLTL0x5u
 C7nSanxJ9vBSQZrRJ3jnjBLkshfRIgIW6q+5xCds/8+tMD9ezeLWwKh5rh/7qg6uMGzMDSEeqhg
 cGIdjOeO3+okJ
X-Received: by 2002:a05:6000:1371:: with SMTP id
 q17mr4470090wrz.326.1618504412585; 
 Thu, 15 Apr 2021 09:33:32 -0700 (PDT)
X-Received: by 2002:a05:6000:1371:: with SMTP id
 q17mr4470067wrz.326.1618504412456; 
 Thu, 15 Apr 2021 09:33:32 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c16sm4237175wrt.83.2021.04.15.09.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Date: Thu, 15 Apr 2021 18:32:56 +0200
Message-Id: <20210415163304.4120052-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SX/8fgHkYMbX

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

