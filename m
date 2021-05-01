Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373711lfg;
        Sat, 1 May 2021 15:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1mgCzLDZmhrkrzxYze9horrSvn3QbYuKCTSGdf3LmOltYfV2KOaf3ctSfSoaK3E+QgHU2
X-Received: by 2002:aa7:d6d9:: with SMTP id x25mr13159369edr.305.1619908624261;
        Sat, 01 May 2021 15:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908624; cv=none;
        d=google.com; s=arc-20160816;
        b=l4ZtNAsav2379xR9jDCHfv6jX/1Cq0ECYyTSrfYnF0/tiPaff170ZD2BN6JseebCNT
         a23iDNp1tFOdLogZYJb9MpMBZCOfLv4sX9dlL8vK3sw6M1mXYro55uh4QvJB31yEphdA
         issRfRPDHN+Xs7l/YNHzphDv1IF2Z/jphlsWzoh6Hp/Mw/yYmGHzwsy92YFlEdyucHk4
         8yG/4GX/8y23MOrxIm1GMjrDeNw6dPzf78gbSlUmDJqINWcfz7k9yk+RwdHApXGAXr7W
         tUq5/GuLct3eBFpGpQRUT5CCJcquk4tTeO31XyQ2+JhFhUf+7oPfzQAfXKvb1BNZv1tx
         PgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=YBWax+qt9zfhiRwGBDujH6wJDpJX0yOXPqGU+4HIkMFDfUJMN/H3rS5B0sCiOeq+rT
         FZGqu8fC7dLS7JM/xCA3XhJZuzb875OwsSwi8F5rTnIOprtMqfZqOkAkVGrl8nAlDaYK
         r5Bs7BxKAezUH5DeNVNJio3uqeC5RAw1OrfukAAwXZYoRC/gRUxdMUDPhf5sCp6otS1u
         Z9qzS26Y4bK2/5nZjeuOv/ICpc02K59I1khM7Mk5nB1u5yUxLSpULYHV6aWCyUCzKeTa
         sTmaKlL7Wd78afLkfrEdieVvkgJP3wVYiQQ00yUdFFnMsukvWgnj29WUbUz++qwj1Apo
         JY9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYuomF3R;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dm12si5237677edb.554.2021.05.01.15.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYuomF3R;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
	b=XYuomF3RVr2ArVkgFPo682BONif8uR+qP5NkayUoAU+thLb/4lBoABmSzq+KCzXctpxvBx
	7qd1y0yJUtc+MVzJRu+AtFrQVDgGjvX/Hlw/aI2jG5EhRzdyuvY+qMpwkEoMaxBjxZ7lLG
	poEW/DnRxZL5pYuPJh+wVN64Edk5q5s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-XrlCyT2BNXKl8ruQHBhRgQ-1; Sat, 01 May 2021 18:37:01 -0400
X-MC-Unique: XrlCyT2BNXKl8ruQHBhRgQ-1
Received: by mail-wr1-f72.google.com with SMTP id 63-20020adf84450000b029010dd0171a96so713435wrf.21
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=hgRyIPHeW+x/n68t5Y0a5qtyuW0f6u9m0Y/0AL/64agTNnbxcjLzB6/Zu+Uh3lkV0R
         sgxn5hsDS5iudJyPUTWpPWGXkw+l/8XxO/y6vP+Cjuih2DOPWE1Yj4YpQ+dgFn0BPR2K
         yPq6VrFXWg+2KyTDDqoqUEaMEgcyaRYPXSXjqN3rshqwnJUFKIoPKjffGLvwd5IBVArq
         X6pGH8YVzQAzcJep46bLrc8gztXLQO8E6pYHTd+SasopIkdoHw9Pyka4v3MykpqC8tMn
         00ZyiKcD5QuwVOuvSw+r/D/9cjrlaCzt3MOL9PaLsPPLEiNCbweIFCYhLHJtvETjeEke
         WQRg==
X-Gm-Message-State: AOAM530qG39cw8TlwMZTuWo7QvYUX0a6BCHwcT4/stEVjOxPzmfXz47E
	nqliDQhZPJmSlwnYgg9VnFTZuVaRKeJLbcj9oFXX5Qc0ajPDmxzW8J1BGs/wlOQnv2OdqUaiwwS
	WLaRlLi21TlAt6shH
X-Received: by 2002:a5d:6402:: with SMTP id z2mr15766583wru.7.1619908620731;
        Sat, 01 May 2021 15:37:00 -0700 (PDT)
X-Received: by 2002:a5d:6402:: with SMTP id z2mr15766570wru.7.1619908620603;
        Sat, 01 May 2021 15:37:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id t206sm6797726wmb.11.2021.05.01.15.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 04/10] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
Date: Sun,  2 May 2021 00:36:32 +0200
Message-Id: <20210501223638.510712-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YKHxTvCGObjY

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
