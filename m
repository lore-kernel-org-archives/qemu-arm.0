Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446E0C61DC6
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:04:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzE5-0005oU-OC; Tue, 25 Aug 2026 18:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDQ-0004Jl-IP
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDP-00021x-3t
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:56 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so380138a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695314; x=1788300114; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pjUwK0GJ0a5oiNGFlwfIXujzN/1nEJAAx2xEhAB3eLA=;
 b=J00HzOkDI41Qtnolo+TgHpsxwXrsU7wm2ZzM7uhew/MdlsIWKreG2US3YZH4uLG19x
 Yc67QsWzugvZgf+BweLbcpQxZpH09C4Ktd45yMvBmb4Q9OE0U7co7XXRddMNw5GHx2+q
 m69P1SsgTE63T8vT8Bo4CpQgVvjgkJbQhUdwAA7g9tRpLy61X34kxVLAKNsaJzgMLJph
 PLrl2AYqWu5LMX3rC07jpIXQDWcxjivFzlItMXor0yLA6uEvivWtxW7RKxXVnaQqOzj3
 bjqT51qI3B8/VCbbre/WbJGdR/S+NOWTYjBc9mbTwzFc3ii7S99d45F4xz0Um7gObbIV
 BB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695314; x=1788300114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pjUwK0GJ0a5oiNGFlwfIXujzN/1nEJAAx2xEhAB3eLA=;
 b=Z5ZEEG626JTm4DGlrVabazvoH0zB6VGEWFN8RpahPb9W5vl+Nlmt8SCcPiiLgfuWTF
 wkqpp9Tvq0D0jcAe3FylGuiQeRi8vuim4FmXO9N5nG581Bup7nw9nN56JYn16PvyT4+u
 pqWy0BHIJj2omV5yJAle+yBkIPV+ho7DYyALndDvvnE0blHH85SAzh0t2yW7ZnI2sQYG
 XUACCjRx4LEnthi9Ef2aoC/ywZQoy6qOJvnlwgd8RGaKG5IoY4jpLcIIxoDMEE7iff6H
 dFiLU217169h7iM5+FWv5ew73MqN5d/mC7o5QlrwkFW+moHmhqrc4BKmeCL8VNMtweBH
 WPMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpaHKIfJ9tdiNoD0YcvJCIU+kCtzRt7IM25IDtOtBoLi2jVmPQgaJtDCyvhdfLHYTbCGXJAQEvWBQ==@nongnu.org
X-Gm-Message-State: AFuF++mqcsRcLDeDNPhIY7m9+hw+NjEZ5CU2TB94wgqMLH8AjeEJ4nPm
 ocFAscoiMznXp36vcBB+aW1Ag4RcJMBmKB8/MszWnKRSQmgwTK8jON1BhpK7253E/e0=
X-Gm-Gg: AR+sD10AFy1PQ7lpM+psa8neWVTgr/e6UcqUhSPzy1gvmruCvSeo8gaUJ60+xV8XJ/M
 FqzA060n9Z6RfS/R9u3LudjksJuOvlc28RVaTODUvlewDW1uW78Y5ekUOFhlRvYG3G8Xm+mj9vd
 dEZdTD1Eo4NuKxdZN1LU6XkYaV4Z7DT6TJcnOtXr1+Sp9aTxfmdTphCUjunn1MvYMGZAmERbtIc
 LedzFAZcGrHSVvfDNd0U3z+1Gvf0tAXS+NeX1riafQvW0KFbIZ1yo5fumxBc+kPqZ/sazPgh8cy
 RkhTf3ycuBUnZj3bERf86E+jLFIjMpaiUKcT3S3/DXiEVWgh3OgoyuNaeWGLIods4B1W0hP24GJ
 w1aQDkCsFKxdEnKYwtbH+GKdoonSESixiDpU/3PVnhnhwo4k+heLd0KNunqD7brscVPSoV9dYR4
 eHrXKMKUSFTxZ5n2QZQ6++5AABfH5l2NTApQPR35Id9ZwklDfDnS68us5MyAkIgClXiq0F0hzRg
 4Lxw8gnisoSeRg=
X-Received: by 2002:a17:90b:380b:b0:366:3517:1aa2 with SMTP id
 98e67ed59e1d1-3966d002fffmr4328291a91.0.1787695313671; 
 Tue, 25 Aug 2026 15:01:53 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:53 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 23/24] hw/arm/boot: Load DTB as is for confidential VMs
Date: Tue, 25 Aug 2026 16:01:00 -0600
Message-ID: <20260825220101.3443954-24-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102d.google.com
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
index 5e85be2bb462..ad588121452a 100644
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


