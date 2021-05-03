Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006727lfg;
        Mon, 3 May 2021 14:10:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw8OeaKYd+3D95UtexF5J/0zmGKHqtnIAVhQa79U2WdyHCsOAyUlOOr6gqYSVcIVPN/UB5
X-Received: by 2002:a05:6402:34c7:: with SMTP id w7mr12020212edc.42.1620076247163;
        Mon, 03 May 2021 14:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076247; cv=none;
        d=google.com; s=arc-20160816;
        b=PNSS/yu1i63qgfABkJb/1QWWbBnb7i1q78t4ZHz/xALghLmlIiOAt6NkA59Y7hsonW
         YpP9btX0LYJJfxJep2auWT+kaUe6PLCotVSB5P8m2+isATR02ji3Hxef8G3Jh+5dAbYo
         CCFY4bsATOqbRSPrAqNZ+xfdZdBdfoB5hp08OA6qtSI92CgDKSCTaRSRQUAA1/8QogXa
         P6ibUjp5d8LYlPK8NkqVBsxyNQF86skB64ZBSFYPtAtQbSNFXuc9JNMlBbvjPOnaLI/f
         6DNOKUrjVeiMmg3gzA3c246jIgIACqaT8z2CSRxPcsG/dMjsp6gWhvr+p2frY8QkKHjn
         PJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=YYkYNElV3dZtiDpEN5byW+F4TYxBvqPgyPMehK5AlCsMJl2CIf7wFWygnmbEwrwi6l
         YVjIikyeAAWuTXBKJj+dQ/UnbsyGpetQnc1CfNTpspgOrPck6RPUGuRRSFsQo2cnLQbY
         y/k7/PJPUsskmzPj5h75/FIxwUkniFrGmXiN0oghZtEYQR9f+GZSOMkz/6Nrw0kkJ0o+
         +W4Dzmppr0vBYOhUbFc1PPwR147VwjxJMq41YT0S2+u60mAr499Cv7ApSKtjDPIddycF
         FGQZF2Y1ZZe5hS30uMF3T/Na/1Nd8ZEE3FgVCgWqDcRlhBCmmWKv005p9sy4IBmE9qxM
         BC2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VFTdd9Jf;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u16si1113841eje.499.2021.05.03.14.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VFTdd9Jf;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
	b=VFTdd9Jfbiilco3BtLdysJVjZx1cBKi5PE+OeGUV3GDXfwHz59edbkhnxX6id56bJcPo+k
	jLNk4seteNbnjVUkQRrC0Reh6cYDBBEvIbWk9iPSpGDB7z4BBXfHs+ENgf7WCcpBTjqtmM
	7hA9d+N+e2EID3EjG0jQlsAgPmGQJe0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-rNWTOepHN1eWyH6Hg9nTIA-1; Mon, 03 May 2021 17:10:44 -0400
X-MC-Unique: rNWTOepHN1eWyH6Hg9nTIA-1
Received: by mail-wr1-f69.google.com with SMTP id v2-20020a0560001622b0290106e28f8af8so4625847wrb.9
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
        b=dzl0G9VVBjW4ETtOQVX1JbADh0qmtferXvaTX4bm8tbY+gJbPyX1BDNqWP/P7jbqHC
         poKOFcIlnlE63LKXugvr03E5GY9IAUc1yaOlVP7bubUSv1aMRmbWBnN9UWjxgNo3MOeR
         eRgiJ9RGNsu9SZzRwWPA75BORYiZMFmYDycyMjXDHUdvuVHPNR7uRLJVvg/niuqQOqYC
         X2MWEmUgQqdHIq5jmUii1p4T1vDQEbyNrc8t6YPtwZZfZigMVCiZILXk6eQ8Xo2p7H3/
         W7gtWo5ELKCBK/P9523RsZB5DRm+/XLr1vAlSF9hKkIolkdp/H6I7ISwiEx8W7Zl3jop
         jv2g==
X-Gm-Message-State: AOAM530zJIIB2I2Ict3nJpfafOInPwU1TAqs3dKAbAhe+RAjn1cNjsSM
	czkQ0MN1lS1mZBXyfOnP1bTC9bwFz4ofRfjWfHNXoDYg9I1bpvwxAOZMb3dv/t/hKwywOuDHiS+
	5XTj8d+XGE1UO7JbC
X-Received: by 2002:a1c:f313:: with SMTP id q19mr23187063wmq.142.1620076243708;
        Mon, 03 May 2021 14:10:43 -0700 (PDT)
X-Received: by 2002:a1c:f313:: with SMTP id q19mr23187054wmq.142.1620076243591;
        Mon, 03 May 2021 14:10:43 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id q10sm729846wmc.31.2021.05.03.14.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 04/12] qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
Date: Mon,  3 May 2021 23:10:12 +0200
Message-Id: <20210503211020.894589-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0CVI0+rlZdIi

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
