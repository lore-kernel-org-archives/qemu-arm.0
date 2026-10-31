Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11241606A31A
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O4jIaxxt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNC99-0002kX-LA; Sat, 31 Oct 2026 12:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8y-0002bv-Sy
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:41:25 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8w-0007mT-LI
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:41:24 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-14394530ec6so2227992c88.1
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793464881; x=1794069681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F4BZlHQ4uuWh3AcM0lAUJwiu4sRioxBd7xwErjYLxjk=;
 b=O4jIaxxtb6Ih1uoqJWOKOaTWBdm2KZQPfsu71kkUYDnrNmqUHFj99inGb9RVSOvjtc
 NgOpWkIMUW0i+Djy2fmaq9IuvsAc1evDVKjUjaCylbJsFlawUfxQZ5LGWjZ2f815rALy
 kU4I+oP0xMEBXIDRjiSC580oMh/u7yj507+V3r8kjrPyVrCdn+a0Zt2kS6fDAyA9f7b7
 vE0WpHaFS7AgtHjebawKG1Cf2k5nIAMTUAHV9vItibL2tw6DwN84cEZk0LgREssbGG9G
 eA6zmBzZ5bvtIrbykv6RBP+3EiHm+40Djdyc00QDmQ2OWobFgy8gctte00u0teOLKJxN
 Pgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793464881; x=1794069681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=F4BZlHQ4uuWh3AcM0lAUJwiu4sRioxBd7xwErjYLxjk=;
 b=Nt1TqePEg7rO+E4KgMNbSrdSdOMDfDra6BoL7yLZJOhXuPHajTrzvjsBmF7MB893ip
 29lMTPKTp1WdOnZbfVIHZYwvffGDBqiz2ewO8EWN4C5ATBnWY1CIvN6r7XK7HmzAG1yK
 ZBHyQkG8kg0BTPs/dMcXQtDhcUHHpfIsrakh//q9Ox05HhFtvLZA6osysJ/p0637zuaB
 cyMXVUEopR2t1W9Az6OtOKNXPFNA/SH52+aNagWt3ehzAqDmsucj6y5l0DqNE6b9ojMl
 gT/vQc2XeK1bzpVYjd3A3AjCOti1QROqbeXWNBot9Pi+dV91Pdp+hy07us1Heo8I52kw
 eoCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxF4XaWCdIQ72xRUKa5NCCuVnVWjPMoJGLYX0eAPgAxWcMST2gt6HYLEAVZ2gXWrYzwpIizVpx0qQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ8N9F2xcqZ6Y+yPXcX7EgV0J7qF7h3K326mMTyfdszDEzVWeTP
 kgt8rWL3Pn0PA3+VRIgxR6DpDWfdnzF1YdbK/8S5rs/XfOiSkDf+S+FV
X-Gm-Gg: AYBFou0dy6yKHDdRD5ljr4e5/Qi/ZXlyFPDod/+kYG2Szg1ZG/+It7rmFlyJfWctwxA
 2hhSe+91PWYqE4GX+qYydZru3wZngW+knu8uy7P/a/SEYJgxVkldp2cUa+j6YGnFe454H4UHMRs
 7H/nJGlN5Zf15fCUycTI4DRNb4ynVFG9UozGjluG0xNs4rVCkvRgKUDqi8EFPEBEuB4IM/7wHqd
 Wx3dxbdKD3oT9gosaJQpqHP5yN02f3NCkEGDsblUtXkmK9B3U2S5vNdXxtvJY46UU4LAjJaLh3d
 11CUOryYVUvbx3WOSLbI15e5RvvgaV5DWr3x4J8wAvz/eTV9FU0nJiKRsQ2ZR/STayUVUvF6pLs
 lLHQR8M3G6qs3dNuNx9QSN1BGV4SXNkyK96Cv8rY3iu1QpMNNq0I1Tt/hjmRqfO6sN3ifmJyken
 eUbCO9pWD4iQUXucYicchD1WfKMbuJpYTfhvMJR0PbEWyHAQm+p46bWK+LRxNvyBAeRYA6tMAfB
 TaL5Fa9Xvc47yPxPWW0+HVbuTFbpFlQlhVnGDJe8BX0JmDulHWeNR41P75cMuf06rN78HZ3EjSx
 IGlKQVgUpxEJFGdTcyz4eyztjWp1s2PY16GCdSus4c6gEVYa
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id
 a92af1059eb24-1ac56d95448mr8838301c88.3.1793464881306; 
 Sat, 31 Oct 2026 09:41:21 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac193b8179sm19574572c88.11.2026.10.31.09.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 09:41:20 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 10/12] target-info: add target_base_i386()
Date: Sun,  1 Nov 2026 00:40:05 +0800
Message-ID: <20261031164009.2048-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031164009.2048-1-luoyonggang@gmail.com>
References: <20261031164009.2048-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

target_base_arm(), target_base_ppc() and target_base_riscv() report
whether the selected target belongs to a CPU family. Add the same
predicate for i386 and x86_64.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h |  7 +++++++
 target-info.c              | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 1d6c6f4472c..beb7980ca87 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -57,6 +57,13 @@ bool target_heterogeneous(void);
  */
 bool target_base_arm(void);
 
+/**
+ * target_base_i386:
+ *
+ * Returns whether the target architecture is i386 or x86_64.
+ */
+bool target_base_i386(void);
+
 /**
  * target_arm:
  *
diff --git a/target-info.c b/target-info.c
index 07dc88fd366..d8cd2209018 100644
--- a/target-info.c
+++ b/target-info.c
@@ -59,6 +59,17 @@ bool target_base_arm(void)
     }
 }
 
+bool target_base_i386(void)
+{
+    switch (target_arch()) {
+    case SYS_EMU_TARGET_I386:
+    case SYS_EMU_TARGET_X86_64:
+        return true;
+    default:
+        return false;
+    }
+}
+
 bool target_arm(void)
 {
     return target_arch() == SYS_EMU_TARGET_ARM;
-- 
2.55.0.windows.3


