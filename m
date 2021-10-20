Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1431753lfc;
        Wed, 20 Oct 2021 03:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy8wHoXM48Uk8wZrOrE8AlYqbmSQctGNvqEqqt9xygTxQA6QnX54pkpS8nmb9SoCaaXm6Q
X-Received: by 2002:a05:6830:19e6:: with SMTP id t6mr10113441ott.79.1634726238021;
        Wed, 20 Oct 2021 03:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634726238; cv=none;
        d=google.com; s=arc-20160816;
        b=qmp16S3tjd758n3Z4l9ZeYYOAVQIV5UBqrKS8pgiXCP2k5kl8CPryShndQ7Ffb7PDP
         NTG5UVoTNBb4LIrvL/BwJBlJxSZ3twjTmYDyXjTGyDMBqDBHGmpAahKzsEsvDCxIq0Yi
         GROtVu81ZopMk6IGh3Tw77GO8MpuvE7vrA9/+QR0k1w/zu6XTv+tGkdbj8NjcSW8N19S
         MDaiOpdtqA1CDvpzZ393HL5TGfrGgJaH688NLmz4Z38ILdMUK9GN9/0QdE0AwAp0wFpW
         zKGzCtYAt46yH0BVj2stY49utu0Ia5CEkUA9pGySBSiFA1c7i6zRN23elNs+FwF5MOMU
         2ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
        b=RPUk8O+SHULgQ3WAr4CO3EpAnLTYUwdmb6ZHQeKxAlPaeTeUA2SUTMUOxlCx20xCxO
         NzSjs57ttyZrYQkDzG/E6AXLAo848fGg/fOumyE2ujqL5v9JwDT+ceDDt7NIZ2PVBcu5
         vtgltjy6rGNawsxCwElKFrCMazlvX1dP9YLeRqA31wZdE7shAtqD1Go8hHdTEPFakp5s
         nn2uCkRLn03IwlJvLOTGpK8QaQEdRYsdnFzFcLLL1Xk+ic24SXVWs+0kSliTG1sODtI9
         C6pd9sxuuoif6icVB8jjWzpShq7PpjFN3mEWB9dHDpg//QAzDUuxre2YtKV2Jwu5M/3P
         Jldg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VuiAuZE2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i28si1881955ota.131.2021.10.20.03.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 03:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VuiAuZE2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md8yD-00005D-6p
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 06:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hT-0003xf-CF
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hO-00035N-AF
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
 b=VuiAuZE23Qq0Bs7mehDBwuIXIpXguuShGDCDQnT9cwWvJgSwx0rpxM2wWZhPS+lv2u5WgI
 GUTfMpdKlaqE05DrQxAlnhqdF1u+s3RD5/mOLjzn8pRojidItA/qx9/VSYzbgTBDvw2BNd
 5rfkoDFLlQeuHoQZsUqScT2+5ed5ORk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-mizFOYSVPFiG-_2GQagF4w-1; Wed, 20 Oct 2021 06:19:52 -0400
X-MC-Unique: mizFOYSVPFiG-_2GQagF4w-1
Received: by mail-ed1-f71.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso20617375edv.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
 b=XZKywCbw+Gua8adkjID3sMVNTdMVU2Uv4KVb60eN91T2EoUsYdkmFZlN7uDdefyrGT
 r3Kgt4pkeY3LWm//Otqnrit6csAzdbYIF8GqAV7vpmqSg/xkDX9VLgEXRQB1ZnPeHw9j
 31vRKWpvRN9f+RfaqlGjYNSe29vaN7UE+GDtBkwx+SJoofGc54yQaIgA7Mrr7jARdtGX
 U38NWpa/J2iqSXMPdkGaBPGv2h0wneOdatQpk9mQ2g/7WlC6EyO94/GH9DqsTrke5ca0
 QFRSsqcJB75vEgwTJVeIhDIDEKp/uyO9mt11gCjjzVLhXlyflbz14ENYKfIB026YHknn
 ChOA==
X-Gm-Message-State: AOAM5319Q4sML3teCGlo6w5QRjxLXXL4n7I8YhP9qcRn1mrbtA3DD7c9
 6nK3WyyxGZQBFBURVkRQ6+nqhhf6wf4fanUY6y3fm1M9usoigLT9j8RDpmfsbURgz+JWpYFPaj4
 lVJiUpJ5+kW2+XcG1q05Q3UzT9WYYulFBFLG0TyYvN4WUm3l0thLX2ZAZp1o3
X-Received: by 2002:a05:6402:40cf:: with SMTP id
 z15mr60491463edb.138.1634725190803; 
 Wed, 20 Oct 2021 03:19:50 -0700 (PDT)
X-Received: by 2002:a05:6402:40cf:: with SMTP id
 z15mr60491439edb.138.1634725190590; 
 Wed, 20 Oct 2021 03:19:50 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id h10sm930692edf.85.2021.10.20.03.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:50 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/44] tests: arm-cpu-features: use qtest_has_kvm() API
Message-ID: <20211020101844.988480-14-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C77Te0JaVY06

From: Igor Mammedov <imammedo@redhat.com>

and drop custom function that were doing the job

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 90a87f0ea9..f76652143a 100644
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
@@ -506,14 +491,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
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
@@ -637,7 +614,11 @@ int main(int argc, char **argv)
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
MST

