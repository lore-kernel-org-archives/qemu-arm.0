Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5615696lfm;
        Wed, 26 May 2021 10:05:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+ol6r4pEeSxWXtnNnZ8E+568xqAGaa+O1rHTdk0WTge40St8mB66poa+oUrvZM5p+wUdo
X-Received: by 2002:a50:c446:: with SMTP id w6mr38629638edf.62.1622048723839;
        Wed, 26 May 2021 10:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048723; cv=none;
        d=google.com; s=arc-20160816;
        b=J37miJ3vuvfP3cKFCtuA9wxclxvzhf9b38Agzd2J6F257GgEFoHoVoWHIRw102WdHr
         Qwmi15a2uEW2Ni9vAUWf0tGhAPCePVYRX2cWuqvvs24CLyd7urE+voQUvGZF5fkx3+Ne
         0eGydpvHPuVR1DJkFmeSM25c65F/IMt24pdAeZjsxYPTTRv6QBQW1x+2FJhewqg6pc+z
         Ylmf0Cw78Pq7oDh8/m1AJX2hsR98lOepLm7ok3dEfZ5Tm+eVKXg0ZlvTzH09XSqQlDbV
         2ZM/j7INNnqntAcRFqh9vhkK/a0x/OVyGz/gZc8MroTCgCeqfyV0ac/hxfpQc+SJ4Gh6
         E+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=0ceDRuhAEbQaOU9VZQK2JXPWne+jbDYckc9YT0fYsDFgde7aylnYzAZmEfuU3jMl33
         yIsn2IkUi2h06qZHzp4M0r94zaEiKvihZWAcjCCNdF7Iow1FaMmd99/lZHlZ1eSfDyGd
         iIZ4AXkjNQxZPz10UOkzFPyPZKlRfIhYHR7RIWDQx8wxWvxNyiQJDAwbAcj9k10nRivr
         hp5hQYZwBsKUJO7Og4ZFW5w42FJYDPzZ3z8Xye8FSsQRJH1dwtjfcRFuiWJbr/TBZu8a
         rFYlFJh5MwEUjerK8b7AceFShoFEYs7m2HRcy3Uqq+bS3AJL7H8ByToo67nkM9dupD7J
         dDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QkxcxSsY;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r9si18878190ejr.730.2021.05.26.10.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QkxcxSsY;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
	b=QkxcxSsYyDH279qkqgmPRTpEMYbMRc2E10u82BVfj/PIQBCrSNm9ir80MZwP7YDuV4w1yX
	S4ijbq+FFEQ4QVP2/q4GAbdSi3tpfgJiqhGscNeX9Jy//7az5zRtLyZRZHKOKSX3SbAJW1
	mWUW86Yi6mf4WVpbdMLA0nsz4xQLlWc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-TuhI0VgaN5atkai6QCHPZQ-1; Wed, 26 May 2021 13:05:21 -0400
X-MC-Unique: TuhI0VgaN5atkai6QCHPZQ-1
Received: by mail-wr1-f72.google.com with SMTP id q15-20020adfc50f0000b0290111f48b865cso612442wrf.4
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=bGeDK9rLD/MwDAP2eOaLw98SesarPiiabI0CyQf371Fs2eGXFh25mZOd/mn3iEMz+v
         xiNWNceTHjLwROqpz6N15dyV/mqauIJoN+dLI0y9HqzFatX32ncm2cz4Tdn2+upLvIhO
         +s22JbWf+UACvLYeZCzSlVPvVL8bHHwIqAm6XZHqmP/s9wpJX5kVnqIQK9JxFDPzLICQ
         lHxKj/YVc55ga1oXLea+mENnhzxLh0vB+fLV/CIPl4kMYrzkCwhwjYQVVb48UAsxr6X+
         43iQzUs/YiwS3x1yxxpmKGpM0FA33r9zKc2S3Jg7i0sJEVR3Gh2fIjjbDCOIveqXx3ly
         UvQQ==
X-Gm-Message-State: AOAM532bSbaKMgQfUJZUKv5QK2oaHLu1DfyjYFYGaoUtcMrMWFbbdg2L
	Hcj++GWHHtOjJKIEK64HrDJV9gyhEIWEIJXhFMETMaV2ZG+78HNsE6Zku/J5qF/dW+hcUXUv4I/
	5oivIfUzXAF0fyamb
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr35039622wrr.248.1622048720134;
        Wed, 26 May 2021 10:05:20 -0700 (PDT)
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr35039606wrr.248.1622048719923;
        Wed, 26 May 2021 10:05:19 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id y3sm20531104wrh.28.2021.05.26.10.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:05:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 04/12] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
Date: Wed, 26 May 2021 19:04:24 +0200
Message-Id: <20210526170432.343588-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nSbtitcWqjhs

Use the recently added generic qtest_has_accel() method to
check if KVM is available.

Suggested-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
