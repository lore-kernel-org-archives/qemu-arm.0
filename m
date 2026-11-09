Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA9606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WcYfniqa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuJ-0005ZF-Pq; Mon, 09 Nov 2026 17:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu7-0005Ly-He
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:55 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu4-0003ye-Tk
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:55 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8a9f9473029so1101703b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263512; x=1794868312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5441FuHsTE4+VNAAN9IpQ+nxMvPG4b0Qt/NjzEEnxOI=;
 b=WcYfniqaf/zZP6sGgXNEHm+NJKtu6wux/C0r3qZjwKihxgd1TgQUflzBIPyde0IqsF
 Z8fBb64eCZTG6Pvck/g/1pFQIrSGedsJtS8Ab26ilP781/3MBEvpVF5FBE+OAFm5oL0w
 9s5kpRh4neoWg4wC9upG9zfUeLxvmGOwUuOI/Z0lWY02BT9uAGeUx3nxCtN1ObCtcPKP
 GvGVw8Kf5PwPNVsqMrDYqNu0+W29SQxs4e2fjxIVqahJBEQ6oXB1p+d32O6da7wb4zPU
 rbh+exuFtTr5ybVh1n/88rfxfOKwrusssDTYA9HNtoW+bV5Vy5nEBKaKkCIqDMnbgcC8
 /PTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263512; x=1794868312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5441FuHsTE4+VNAAN9IpQ+nxMvPG4b0Qt/NjzEEnxOI=;
 b=P0FPz5kIgnLEDhfBPXjCN2YjxFTOE6diq4JH5EktX2+vuuSRtenxvtcmoBBfk/QhnT
 GP4SGbC9Cu9k4KZLwacMjD7TOB1kKxrCCHQOuyCdtSKdcUPNQl8WQcP/fd/VRKeCQTQx
 eNUB6FGlVxkPI6P0oNl8XnwR7kN6pA2vjs1sbSwyVZlbLh/lAtV6VFw1TuPMvsKUUOz7
 IDBo923UGuz4n4QaFP8HHVmy+lHHcqT1WpOw3v3FbGi9QmFPOYuLSjJNYzxh2BOSLBZV
 g6CFyiwBnVWAnKuwEHEPTNnjLAYSyvdZbtMNoITio/Fg2T0FkAskRa676hGxPZiorWC1
 U3eQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFhcpBN9v6OMYcANXtz7r0Dbz7Bp2X9b5OzI0OUhIqGKXL/nJQWnoEP9BoJZoGSkyJ6FX4VAPoDnQ==@nongnu.org
X-Gm-Message-State: APuU4Z92h7deqfKl73Sie2VYYsjQlV6js6nl7YnpzKu6Vgv7PpDMLVZs
 giTmZAY2dG+ehZl16yoJWf3AWsuo7WbdkcZj2RqaDa+i22GttHQwR7obTxOD5/jeWkQ=
X-Gm-Gg: AYBFou0zL75BnFudX18qG8+WL6H8E7OZVdjbpco/RMTh7lYyMZvQnRNDZH9Fuqt3G56
 h3BFX/wLGm9HczU34MFlqyTuEnRRhqOp3bFcHT9XuiwU6QScRTrndXT2cljtby98doQGrYMx8lA
 BNcHWwu8ynEjvkw018eb+4yDuPWSfJoE1Z2najxk0xMi3cmRolNTnDubuFssU1X5q1MnEU8ygqU
 yORwZD4jaYjlOP8Mg7zw900qQgXEz8sCJEv+gpu5yCzFqjkdapvnm5F0wMX+sPFBIPAWkK5RWjs
 e3FHU8013QGOknJUeRhB0tO1rm1oSsuTL6ua2GjqRjAqRzubRVe0UdsHVF2ePBwdKB9EfLLNFae
 phkEdu9HJMaPWPIDNP9EoFQ/SlUPIAlZvNCY9WxFtNrTK/27S5JeovDMitjR+JMzuuYHlE54YyW
 vr9dvG6FUjrU7wy+OpISYZPZAiaVU7RlUeYkGGYkCBPjyzMNrR002Tw5wRLhqzAiZbtw+ERqgTd
 DCLJOozJbexm6gp8oxpZCXghdBJeXmuC3mcgSx+ToGVc4USsAskQZN+85oZSOSu7hsXGs8KDsag
 pa6qfF3uRVsk1Eo2gG33fKkpF7h4W+O8sLd2MwPAl6/C059DGzpk2g==
X-Received: by 2002:a05:6a00:2451:b0:8b1:1410:ac5a with SMTP id
 d2e1a72fcca58-8ba860d3665mr1012252b3a.13.1794263511627; 
 Mon, 09 Nov 2026 14:31:51 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:51 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 22/23] hw/arm/boot: Load DTB as is for confidential VMs
Date: Mon,  9 Nov 2026 16:31:09 -0600
Message-ID: <20261109223110.1619504-23-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x434.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.53.0


