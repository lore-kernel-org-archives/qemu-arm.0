Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp272304lfg;
        Wed, 5 May 2021 05:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMH8O+pg3ICRykNSMwVVcnTRFSYpYvDVoU+DQySp/xIKve7a+N0yt1+3GVD3pICwuBqCjK
X-Received: by 2002:a17:906:5056:: with SMTP id e22mr27275452ejk.289.1620219512309;
        Wed, 05 May 2021 05:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620219512; cv=none;
        d=google.com; s=arc-20160816;
        b=LgGVnA2ypjGSB/ORRU4nMam2rhi8i5hktMJtxwf/mh5TL2SN0HC54qzzrK4c9CNeaq
         zZeu53G6AQVJZB5yYf1WFqQu3Eg2ucCXudscGpsntqDsHMs0gYPBx0L484LITJaVZRw2
         D2vIZj2H901Wg3wflnmEKxHRc+nxbL7MjPjXB6cRVsFSqF9AGqYHiU8OBPBY1WLx3Hc8
         t5oXie+0oQmKO8rFb2GKOpHd913s8i1nz6/O+n/Mme1/TNul/Fvo4ZWGbDkEjmKiotxK
         703RSoK6PZOJaev5l6JL4AeYqTDHz+PxBfO7rVrzYljXzUo6NbIo8SgPY24yajm+HBfy
         EpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=Bx1IQz1wOflU/iRYPz2MOPaZSHOVEH9x7Ct0XQLqqf2sm0Np+CRy4AYrePaRQ1k5rZ
         7+tfAGXxQefpakY2u5jVlf7mTwyjHUCZ2Jy1OPF5RnUCgvaamNlDlBRypPd6AM8ibf+a
         GLPUWCYDiBU85/bQSAoSoEG7b3L9twYB04Oi/QjQw6ZaVOvRQ1Xrcogns96LE2w5iRlf
         V4QjTDVWbngtwZ48rqVuDJiP9UtmrQbgqG4HMvkcyJHVZcqBcvmvILSLVpDOi1pJsylF
         eq5crV6NBaiOtP26ygt1jO4XBZpQupMOBxGaVOkWIiCbrXni5E8yb3qUKd0mcNuEcwC5
         l9EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRGJxT1Y;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id k3si6396073edi.75.2021.05.05.05.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QRGJxT1Y;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620219511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
	b=QRGJxT1YKT4qs5WAf6002P0bi+07ihYrYiuzSil5a0OGivN4IjR4OOiSr1+TBivtBUBpNQ
	c75Gpkc3ZVRbiubddhzu/8xorLs0z6eGumBluyoCMS3pRA3dlXKmpZwND3ER0q8ZYSFWSL
	PNKUECDAlAT+mc8vU8k6+tKizbx146E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-ycDzwwStNGmvv5rf5MaGcA-1; Wed, 05 May 2021 08:58:28 -0400
X-MC-Unique: ycDzwwStNGmvv5rf5MaGcA-1
Received: by mail-wr1-f70.google.com with SMTP id 93-20020adf80e60000b0290106fab45006so654292wrl.20
        for <alex.bennee@linaro.org>; Wed, 05 May 2021 05:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=FIjJU1Hd8MUaVr3YWivFo32RmJdCh/ndnqYOIJ32fA0w7zsE6J9JHzqLfKsIwQYch7
         znbqbpTNaquXVzQ7um0fPjTzAREFUzmhnMUNfRed0fgBNJz/ptLk4lqU91Q388CoNSZ2
         zlaVMbMKxXPu4DfLpxsP0oNtFxlwxk32OlXFZzl4ukQgzW8t9TGmxY2tGu2bKJOjcsND
         EVXXU1SmdHNPkhlvNjev/TeZBahi0/2iQ5N/weEgdH/jhcJAMmnHF4kh1Usryt9j6o2R
         5jPsB2BamHHa7DV8X5JHYZ9ZV8jVgD0u5vCp49Jm16CRIEmjXEn/Tdrny9dwcBzQz9Uk
         yeuA==
X-Gm-Message-State: AOAM533upeoi6RxltO2ErT1oE/ypXU6ZkWMSMFqIiU4PQdWTqneDHRkN
	WbtLN29v4BCYFzM1KjghfWC4P+lZEipNjX+QdsoNtx9eHe2CqsNpdncrUGAhGRZYL4wDMxKeVe2
	GtW+eDTAMg6j1Oga8
X-Received: by 2002:adf:a116:: with SMTP id o22mr37998936wro.397.1620219507622;
        Wed, 05 May 2021 05:58:27 -0700 (PDT)
X-Received: by 2002:adf:a116:: with SMTP id o22mr37998915wro.397.1620219507504;
        Wed, 05 May 2021 05:58:27 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id s6sm5774653wms.0.2021.05.05.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:58:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v7 04/12] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
Date: Wed,  5 May 2021 14:57:58 +0200
Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uWv1jRt1e7tW

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
