Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp307769lfc;
        Tue, 19 Oct 2021 04:33:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHi23/hBxYTa9xer7KlsajZ8S6zQxGCoGKi7bSS4pUjwsBO2gKKdM6/Tg3TKPDEg5UvdBl
X-Received: by 2002:a4a:3bc8:: with SMTP id s191mr4308075oos.88.1634643202751;
        Tue, 19 Oct 2021 04:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634643202; cv=none;
        d=google.com; s=arc-20160816;
        b=RDWczJjLsv5k4P9HilWdlTnqZtLqAgrnRX9TDFWn6vxXU/zZzfkW8CiPugSP36lf9i
         eoHrrmczP7JbNQ9Bzjh0GPXHlXiPX2PxQ1trdHOUtEF0NbV1WrRD7CwPkZadAJl2uXVk
         fCoKIaEZH6jpDL7TZ15rZcIyLoQ+hkgoNhLfzT3H+8t+vFukLCjDtcCPfhiPIU72g7oH
         tHrdJrCvlmBTjJ5py4H4xgS55+AjEljyxz9TujQFkgmIJ6WgziXYtNQAq22nbDVJ5t0J
         fO9S6PpelErvZMsi+T5n+7XvzCJx+QcKqi4o39510UQsgXZEp0e7cEkNtCF3LOh3StFT
         BruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
        b=DkIw3folyO7zT6k4QUZp7WiSCmh8GalrTEIy8uJBOxQc/a10Pli28RbuXOEvWfPSTN
         LVvt08s02pQzDzT02b/mAFEYPb6pHvwff9YZjQW9SuwYwOF6ckpUcIMfhBcL6HDrsGuJ
         hr+VkxgSS+rs9xBPxr5LH5fMRAPq5uqgjm6DohUE8m7CQmM/vAuBSov0pJ9YJQ7CdpaT
         GcJDUC/I5ua3FtW2URmufDCs4oDEv8xQcyeRwlbqT9gv7ifHAIuD2qYq/eZ+LMSGzvcl
         r8ulPmXZOM7fapzah3AfWhHmcsXxulYUkE+Lfcw4AKNrJMVBOVLmVH0HlzXiG3IDgHHR
         92oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hXQgUmYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si17844077oig.46.2021.10.19.04.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 04:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hXQgUmYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcnMv-00047j-N5
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 07:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAY-0000Ct-BL
 for qemu-arm@nongnu.org; Tue, 19 Oct 2021 07:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAP-0002Cm-4W
 for qemu-arm@nongnu.org; Tue, 19 Oct 2021 07:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
 b=hXQgUmYKWtKoCxwc733IQKbAXnTDb7PP1TrATfTlfkLcbbMG6IWPTtMb+NRk3tM+kmMU01
 U1WHm9swRtqk5W0EMx8pbDqFCkVs49IJ2DL/GGeuPwVoR5a9qeaX7FPnIXylrh2Dg/dfW8
 9zAimxKL/wFkj/LWKfqM3hEoHDCRSbk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-8Hsyy8gVMnmlBg2ExZ-c7A-1; Tue, 19 Oct 2021 07:20:21 -0400
X-MC-Unique: 8Hsyy8gVMnmlBg2ExZ-c7A-1
Received: by mail-ed1-f72.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so17278449edv.10
 for <qemu-arm@nongnu.org>; Tue, 19 Oct 2021 04:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
 b=kuKcmveE/U5hYFdmweWU0QFCxYG4QPmvcIKY9TOXXhJ8o+3U83CJTpYe5W0pwOv3v5
 gHDCHhPTtJWzJ1LxtHZScZAlNG+5t8BBeZ6d9BpR6ZAljdBBEBrw+H/SMBx3RdqLpqbU
 B+CAlBvJaVKE6SHeR8YjM6DdlXrfDErREUg1xEiVo15oMfGeVM8ijRDwDG2K5ffU5rsU
 UwjiaWf3QuvSRapcqrkLs0gzjdpUjLxOfuh0r0RMP9Dmqyt8cXRB4j3whlw2hZRqLp16
 aGU+lYb55xuohT68bt8BtPb63PwXejTHseP61L3/H+0KycNA8K64eUEx12mpFBiiAWJW
 nQPg==
X-Gm-Message-State: AOAM531WKZ4EhUH+/WX4iVdkfjITMjL1Kr23O0O5dQ3+m0XemwQFGKYS
 WlXbD0ReZpSFFZHI8hEumtyQEGqpxZ7KtbE84VFO4nd49XpXBdESxrERXUgaew63feRpx3LXekw
 hhHcPhkPlyynQ
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr52043846edc.227.1634642419893; 
 Tue, 19 Oct 2021 04:20:19 -0700 (PDT)
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr52043824edc.227.1634642419679; 
 Tue, 19 Oct 2021 04:20:19 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id p13sm7328179ejn.12.2021.10.19.04.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:19 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] tests: arm-cpu-features: use qtest_has_kvm() API
Message-ID: <20211019111923.679826-14-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+LI9++KcWGB

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

