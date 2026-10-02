Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C5ECA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:21:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkn-0007e4-Fs; Fri, 02 Oct 2026 16:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkl-0007c1-6p
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:11 -0400
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkj-0005rK-7A
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:10 -0400
Received: by mail-pz2-x2b.google.com with SMTP id
 41be03b00d2f7-cc78dd54610so3016063a12.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972468; x=1791577268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LpASq3jOBF00q1EZdBLVp0S8hhXgpRTHfBnK0kI8ssk=;
 b=fMQ+wvZsDZehH2h9ejK45wu7VvCodeTrD92LiZWSwqCzhr9cMCRRAjFUBZLrLr+YCa
 eqEzh0GzFrPOtHWrQ74BzqDpnJF7I3vghhfd0azggkExbWq8DSHpdzSLVbYTibEXZ0HE
 8ApcKrMT4FM8yog5xXZBvtTXb+mnyfJsfaUUSi1e4VT3kJcMDuEgYK7PdFI+fWMzw1kp
 sY9FfCWRHyF3G4YueC2JvIN3OMhESsBZSiZQA3BD4fwhfo/k3Eils9o8ZIZEFeAAC5xS
 8BlPulicDISbyJNxtNqVYIwi18MJ13WrcWjfUUCIu8qFKSiz1mnQQBXAoi2WDoleSPgm
 Y4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972468; x=1791577268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LpASq3jOBF00q1EZdBLVp0S8hhXgpRTHfBnK0kI8ssk=;
 b=WVjmA86/ictu1MsGjp/T0L1c+d70ZtyfH7cTM2wVk4qyUNb5E4g3TL0LlEfybctFoK
 Yaoz+09jQZWhhqwShZX45UeuKZpzVeWiZuwt4hiPtLsgoy7Ajvul5Ixsa85xDKMiHLf5
 IENWcqzkqkNvedvaSZiiBRDgE30NXh1a3WbmFu6NliT5fhBpMgzAAARiIUM/okYU32se
 6rZ/Al+kIZWOcThpTZUpQy+TRsdIVfG4Wq8uR+cy+isModdsnRRd4ThsfPUWD9PjbtUF
 E66HN9nxz/VRfCL6UsyF5yCZ2ggRjhiKDhNmTwwa5fdyQQ6hMj52t/2alyodQdG1ppaZ
 tbEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5In/2wSqmhhHHHFbGY8qbUYIJav0I4acoyZv5m2JjOBn6+u8t6X4NLhi+K0ENk05gHs5mjVV87g==@nongnu.org
X-Gm-Message-State: AFq9FYIiIOlaCDk2QdTitIgxPGbzQCDNnAoUKBVue7KM+ANobm6Q5RYU
 dBEo8z4IpcRM6UIxMK1qk7WXae95Q15RDd7DOcocMMWiy1Us7Q/Ib0Q5hS1QI1myx0s=
X-Gm-Gg: AYBFou2uhY7iPNvbv/AXOwV60paTc0hQwiu+yif0CIhrpV0jf57zfq1Xhe5/qHQrU5b
 jihLJWYZwQC4Nx8+TWCOW3gn6higXvi3XVu7JWWtU9zVjLw5Ivyf3IzTavOw6MiZbX32ROClAsA
 fMks9srCQb5keBICCq/RRDU06OjOI13Tww/b23NfmC9m7QBuK+5klrfLft3IWLEl9BtbiM5Oj/q
 WPgIzYGSZMiZ0fDC6rPsdBafbaDFYmj9hKe798xxhmgA0juh6C9d6G0XwJo3+cyyQ8exhSeb97Y
 n2j1MHsBbZB0l3264gkwPMpkSroGt2RWGCOemQyHqnimlKgrZ7f+YUEIRu7g0K0LBU0A+E9SW8G
 7dMpzfFN+9prQiGtndRzjl2w/TZusTIfScANJLBTLcm2Es78LoDwZsWAQ21ygH/lDR0V0WI6auP
 FFvsaa5MHyfN20wNen7b6U5t37W9l3t/wkSoZrIBbi5BAKL0MWFOtKW2sfdF3Tis3itdg0cxH7+
 GdvSH1wtpwuZGrh957rF/5/Zg==
X-Received: by 2002:a17:903:1a2c:b0:2e5:3451:56f with SMTP id
 d9443c01a7336-2e5345107c4mr705995ad.47.1790972467740; 
 Fri, 02 Oct 2026 13:21:07 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:21:07 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 21/22] hw/arm/boot: Load DTB as is for confidential VMs
Date: Fri,  2 Oct 2026 14:20:25 -0600
Message-ID: <20261002202026.1204110-22-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::2b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pz2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


