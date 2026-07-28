Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCE9C54F5C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonUG-0005dS-Mi; Tue, 28 Jul 2026 15:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSa-0003cp-0K
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:31 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSX-0001eH-SM
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cf50c6f235so3166745ad.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266844; x=1785871644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LpASq3jOBF00q1EZdBLVp0S8hhXgpRTHfBnK0kI8ssk=;
 b=D8omu9Du/0UkorCtGyhr73TtjY98gEmaL/qXwyorjycBqE/D8xs+aguGR6po/XCZkt
 GMYHvK7LOMWaezsf7tcWoq2J199u7rz4foCJBJDYLS3Gqv46UyO2SLJV0UlW88J/b3CO
 Y7hcL7SKBQOgv7FbP/AyO5PMyHHPkjqdGm+sa9DuCaIf8IK1+cdUzlwjC+8HXwck51YN
 Y1M1BvlHwAxbOEQZAXycyoQcTfIAwL1tIpXEjgkiHiY28yC81z3PayEJs94hYpIxbZnM
 r+Nswyrlr91NyDtSTqWgI0mztzL4bI8FmDpnOarWhE962t/c4iha1wOqCGhoVxr8BoVq
 afkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266844; x=1785871644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LpASq3jOBF00q1EZdBLVp0S8hhXgpRTHfBnK0kI8ssk=;
 b=Ek92WtPEch3x3o89y8kjny9YxFRyzhkCmxjTkzwuM0GB+NwiqxpIrOSGtQ7kkpITc6
 Rsj2rrr2MEagVMIaNIi7DGhKn9Wq38ljE8gflg1IkO9ePMW518t7LURAMA0cDPAuYeVz
 fX6ZWacEOvNXM15OVLdQ0uHzLP4jIKMn5grC1ZzKChisQod92whowRNy+LjuNFHlmBAG
 V+AAztNkqtPqGHyuwBiORqz2kgYjMlkP0DjTSV3GLGDrzowAGuLlP9m1cumdLCrfA+YZ
 P3x1Z5F/Ty5U8oZewOhBiZ/PgdNeMu9XK3RkQW90qXo/GVNRsqffSijAnjRFv+tvm7j8
 sOUw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrShffX/1dGhjIN8OjtCLR2f84D4/+aw+O7Z5pOFWdOcF+w5ZTweaqFeif/TKd87AHRNGxajwJd4Q==@nongnu.org
X-Gm-Message-State: AOJu0YwS/4sOmlcgJmlwTWdFcCeIjWFEHAg1C5nrbckzD9IJS+Q2qoAe
 xIyioC7O04/LLki65hN5LGPtgDuVsSIRMS4tU9EDhwaIyOdSmaGExTcCnNrORCHQQPo=
X-Gm-Gg: AR+sD122SZSKzdd4VganGRlUDlWIXeDO0h1LZcqDbRM+wOnq6hDYE2cucP4faeRLP0Y
 gUYEcB2hdn3eUxKZxZ0YoF37rdPSXEcJ3KhbY3BAIjMl8nnk8VFDQZV0J8UbaUFNmjco7FR2mcE
 bI+hFqNtoPie+7jM1zXai+YHKZQnm0FCJkyC2SBechFCORh0pUwVcY8bdn4EskP1TfMh1I7U1QY
 l/NVH1DQk/0pjvkD4Sx+KfcWryE/kPOAXHFl8dprEK63svfFBP9vFSC7KTMvuDlS9Ipxh3XKxR5
 ySD3W1vU9xu4GQumdv08TuL8iHjkZ3iMehGnDJU//v3hF84uPcSnAT8Qu1adV61CO/m62riF3kY
 6NFNQsxhJFZ0l+b0Z3yYyQzM2V4Mezt3iWj3I9hwzlEm7KedaMxEjFMyKAq4JO3b7fppumgzemF
 WKp3puApl40h66fE6CnPil5fHgF5Pq5LRZM96pT1l3t+aTcaVZ6nWD5MOl3HdMVjZNDLpjcEarI
 w86tq9ZjTgw7OU=
X-Received: by 2002:a17:90b:5864:b0:38e:c7b0:84ad with SMTP id
 98e67ed59e1d1-38f6a1becc7mr3877953a91.0.1785266844304; 
 Tue, 28 Jul 2026 12:27:24 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:27:23 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 23/24] hw/arm/boot: Load DTB as is for confidential VMs
Date: Tue, 28 Jul 2026 13:26:29 -0600
Message-ID: <20260728192630.240375-24-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Load DTB without modifications when provided.  That way it is possible
for a verification entity to reconstruct the Realm's initial measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/boot.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e8efada209f..9b3d3558bcbc 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -477,7 +477,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     g_autoptr(MemoryDeviceInfoList) md_list = NULL;
     Error *err = NULL;
 
-    if (binfo->dtb_filename) {
+    if (binfo->dtb_filename && binfo->confidential) {
+        /*
+         * If the user is providing a DTB for a confidential VM, it is already
+         * tailored to this configuration and measured. Load it as is, without
+         * any modification.
+         */
+        return rom_add_file_fixed_as(binfo->dtb_filename, addr, -1, as);
+    } else if (binfo->dtb_filename) {
         char *filename;
         filename = qemu_find_file(QEMU_FILE_TYPE_DTB, binfo->dtb_filename);
         if (!filename) {
-- 
2.43.0


