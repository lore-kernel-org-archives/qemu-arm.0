Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70308C624D7
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:40:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DF5-0001lN-6P; Thu, 03 Sep 2026 15:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DF3-0001k2-BZ
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:57 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DF1-0004Qu-Rh
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:57 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3964e480f76so227502a91.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464214; x=1789069014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LpASq3jOBF00q1EZdBLVp0S8hhXgpRTHfBnK0kI8ssk=;
 b=e9B39ZiJlE15iLXKIgZO9g16ASDPuCVTCmvoN2w1UzrId+Z6RhYyzg7i6EjJV3HEQQ
 FkCzNg2NgeilqSC5hGqSpywgeYDwVkb329lLVrJQIwfWfeHyGw+j+Q1zAy00sjnpgYQi
 IgzsemKY0s68LLnGgfXNW8+UtnDLw0PQg2ntawNNrAzM7QMqsYuMtWChP82Ik+tZOlrS
 UwivBYriORxspuIekCQCO1c954pEgo7TXclgfEjx+j4YQamJ6p2SyvOhMCf1BnEH+BCB
 f1OisI9uF7vUjq9hZkMqfIdvWSfplJ4chK+wcbHUpASLaTC2Qbfwd00fHBIAqE6Ys9nY
 +xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464214; x=1789069014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LpASq3jOBF00q1EZdBLVp0S8hhXgpRTHfBnK0kI8ssk=;
 b=n/hpBXeETrG/rcDJQh25oyH2heD9VVCx/UgpsLULwXrKQGn8edHYnBzIX7cjkFFn/7
 biLFEsBkGGhEn/5YSS88eGJy6dH+ZH0PKIVlFGdc1YSA+ZbYF951z8MItGsbjXN9z6cN
 mApQ9EfNAsnz0QetTtVP/QSIFjbmMEj5dF1IrmnQfFHKXaNlxb0IO7cU1UGC3rWoFYAI
 C3YjyFehMSoKiqpnMz57u2MZgVZYQYUhvlhW69KPS3nSnObunnY/qkqhRajlCZhaoGrZ
 ZyDzgj3YHqwX7x29jIZznERtlTNHH+9oqvr2kY9P0qZBHueZnHT6xem8KOWwaD+Sz+Te
 hhXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz34r1wJPGHByI8kk4KA0CQF5hCVYzAoH6lJ2MmPx2QriXWPIVnGcCKB02F2Oj5pXyB7vWMxyt7qQ==@nongnu.org
X-Gm-Message-State: AFuF++kf23TOD9i6+X+VfSDTI+0KvzGgMoAaG/rA4k5Ju+hg6gqCLoxE
 bKGFYhpro8vbGoMDsZGH7CQuUfAN2pWxCGJppogCYssYjrpMTMoV9ZA/Swf23pl0meo=
X-Gm-Gg: AYBFou36B33QSym2/Oc9DJmf/QrXMKrR7FCfimm4JcAZN8JAhhyzhEmSxsQXQVo48oP
 DN44mWDAHsrzHL7VuKlyZQB4oYZ8t0+5zGdtvAu6ayMWpOP7sE1KTxqYnsWSaR4IfnuOnhKhm3a
 D5pPzZ8V2xHt6qG7l80uTaw2LqeBjZFGshjHEFZc16O94FP4bkszjiV2O5KiW02iMBUkI8HRdzJ
 3UBA55a45bYtMzDwsf12N/UfHe6YBEDPpQPDNCarfFWD5ugw73WHesbLRJF12/XB9LjAQ3eb+cw
 M8bvqYPiuA5ycRTG0zr1zQ720+2bvG5DC6vRG4BA4N9e8Qd9Rrnmpy6IV2G4+34Jc6PvyjPadF0
 hj/xqxIVuq7agJPI/o32bqJn2bLPltMoFe1RplsTKYN7M0CzhSj3+D+Oc4AHQmDj+R3jSbCHJdP
 k9R+CuePE+dIXK22IrKC5Yjz0zo2W6ewOOZ0vepWbIoIgkwRMybMdkpbe41TVHo+IMEe1FqA7TK
 HfvE210Itl+S2I=
X-Received: by 2002:a17:90b:4fd2:b0:398:9be5:b416 with SMTP id
 98e67ed59e1d1-39b2621e4edmr1288438a91.17.1788464214324; 
 Thu, 03 Sep 2026 12:36:54 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:53 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 23/24] hw/arm/boot: Load DTB as is for confidential VMs
Date: Thu,  3 Sep 2026 13:36:10 -0600
Message-ID: <20260903193611.1058589-24-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1030.google.com
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


