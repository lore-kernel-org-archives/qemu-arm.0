Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1423369lfj;
        Mon, 10 Jan 2022 22:37:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcWFXWMlA4khmrqVKl0328RvKUz7T1mVPzb4LyZNVMQLxQKbTUItgvfi8o29PyYJklL4F3
X-Received: by 2002:a05:6902:3c1:: with SMTP id g1mr4129774ybs.408.1641883037374;
        Mon, 10 Jan 2022 22:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641883037; cv=none;
        d=google.com; s=arc-20160816;
        b=BOuH3C232GLB3ghMrUYKIX9gPL+wxxW18O5Ck3IcHhjKPv00HshnRdhxP13WsIUT2Y
         SMTTJTIhmEaDDhoaJwDtVz14ec6tLPxsgOpdo12JYV82n+kHOgtivGwqZP+DzvfyAYkG
         QJi0eEMm6Kqkrv6lkfSCeh+qJCDIwMfDaJSZD+adkFehdP8su+X19X1uz4h4pFvnOSGg
         fHdBP2P3HVx4sG3OXGzkt0EJrKOdPlGq3LPXesT5Gn7r6sjhQ3Cmv5Q6LNTS6k5ZtPuO
         /apz14/Z9LXaa84rzJOwBWfNAc8NFNDZeeH0qWJWI2SfAzXqxYPtP61mdRFsdJ+WcxxM
         NVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f5XODHX6PXtuCGAoiXWE/M18oXtWzKLNRFhGyUTFh/w=;
        b=cgSQgUoF/ayhCBvrqphRyH0BGFnCloaoJ9l3SUgCDxIYsD2F2Rg6v5yMWDsVkH43/i
         uzmRiIpl/EhIJ8iKOun9noJeJWysj4iEGbVRUqITkkgmojFQAv0VNUeYpzjvmzHVeiAv
         f3jXsaZjTUytGhcWAYooNRhqNkyCzrBHCWGDg1rpUdOLgH4DP7+MalTCKKfO4R570tn/
         sKMsqveF3SSI3WxoDsg5cpXSt+y4i0Q52BTglMVl5CSrZfVN6pXjN+q4SkqsSXlkXNoV
         Udv87lTWUdcYta9bgbV0qwzxdzrAiO2gHhAln2f3TBo44xF7ZP5L9GAoehsOZgEVsyAT
         eolQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SzWcaZxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si6514411ybs.615.2022.01.10.22.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 22:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SzWcaZxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7AmS-0004DK-MS
	for alex.bennee@linaro.org; Tue, 11 Jan 2022 01:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1n7AlL-0004BF-Bq
 for qemu-arm@nongnu.org; Tue, 11 Jan 2022 01:36:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1n7AlG-00032z-Ga
 for qemu-arm@nongnu.org; Tue, 11 Jan 2022 01:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641882960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5XODHX6PXtuCGAoiXWE/M18oXtWzKLNRFhGyUTFh/w=;
 b=SzWcaZxhbJsyYHZqGdTRBxu7j6kiigxGw6PsYm96qpoOC1mMH8waNJJc683LI+0fa4wJ2x
 VH498LXadBmz3qFeAJQURyn+jsWIxLAM0kYTILZzhy7k3lvTT2a3cnKLPH+PnQzPV3Wswj
 dWx8a9SyllsNkM22AzbP0qn9DpHG9uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-H5aEKkDiM5an1Xkkb4iGdA-1; Tue, 11 Jan 2022 01:34:29 -0500
X-MC-Unique: H5aEKkDiM5an1Xkkb4iGdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56A4B1853020;
 Tue, 11 Jan 2022 06:34:28 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-60.bne.redhat.com [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39FCF7B034;
 Tue, 11 Jan 2022 06:34:05 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 1/2] virtio-mem: Correct default THP size for ARM64
Date: Tue, 11 Jan 2022 14:33:28 +0800
Message-Id: <20220111063329.74447-2-gshan@redhat.com>
In-Reply-To: <20220111063329.74447-1-gshan@redhat.com>
References: <20220111063329.74447-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shan.gavin@gmail.com, Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 49NfrEtPpgza

The default block size is same as to the THP size, which is either
retrieved from "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
or hardcoded to 2MB. There are flaws in both mechanisms and this
intends to fix them up.

  * When "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size" is
    used to getting the THP size, 32MB and 512MB are valid values
    when we have 16KB and 64KB page size on ARM64.

  * When the hardcoded THP size is used, 2MB, 32MB and 512MB are
    valid values when we have 4KB, 16KB and 64KB page sizes on
    ARM64.

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 04c223b0c9..1ca45336dc 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -46,14 +46,25 @@
  */
 #define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
 
-#if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
-    defined(__powerpc64__)
-#define VIRTIO_MEM_DEFAULT_THP_SIZE ((uint32_t)(2 * MiB))
-#else
-        /* fallback to 1 MiB (e.g., the THP size on s390x) */
-#define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
+static uint32_t virtio_mem_default_thp_size(void)
+{
+    uint32_t default_thp_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
+
+#if defined(__x86_64__) || defined(__arm__) || defined(__powerpc64__)
+    default_thp_size = 2 * MiB;
+#elif defined(__aarch64__)
+    if (qemu_real_host_page_size == 4 * KiB) {
+        default_thp_size = 2 * MiB;
+    } else if (qemu_real_host_page_size == 16 * KiB) {
+        default_thp_size = 32 * MiB;
+    } else if (qemu_real_host_page_size == 64 * KiB) {
+        default_thp_size = 512 * MiB;
+    }
 #endif
 
+    return default_thp_size;
+}
+
 /*
  * We want to have a reasonable default block size such that
  * 1. We avoid splitting THPs when unplugging memory, which degrades
@@ -86,11 +97,8 @@ static uint32_t virtio_mem_thp_size(void)
     if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
         !qemu_strtou64(content, &endptr, 0, &tmp) &&
         (!endptr || *endptr == '\n')) {
-        /*
-         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
-         * pages) or weird, fallback to something smaller.
-         */
-        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
+        /* Sanity-check the value and fallback to something reasonable. */
+        if (!tmp || !is_power_of_2(tmp)) {
             warn_report("Read unsupported THP size: %" PRIx64, tmp);
         } else {
             thp_size = tmp;
@@ -98,7 +106,7 @@ static uint32_t virtio_mem_thp_size(void)
     }
 
     if (!thp_size) {
-        thp_size = VIRTIO_MEM_DEFAULT_THP_SIZE;
+        thp_size = virtio_mem_default_thp_size();
         warn_report("Could not detect THP size, falling back to %" PRIx64
                     "  MiB.", thp_size / MiB);
     }
-- 
2.23.0

