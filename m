Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E5606A31A
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1w4bjvC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNC8I-0002AN-VZ; Sat, 31 Oct 2026 12:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8H-00029X-R8
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:41 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNC8G-0007i0-1Q
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 12:40:41 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-36a1947498bso2086851eec.1
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793464838; x=1794069638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qcrxXSpZ7+EATZXmWVXLT0bY2U1TVj09coNkKWtg15Y=;
 b=r1w4bjvC1ilbQw8B4ySOAc1JM2wZ5ZIXTlbvLzBqfOT5dhleVTTTcCMEg8WD8ApQmW
 3pZNKfblbKyvBIz9Cc0XnHTHkREGGq4ulV6hNosTnD2gYgKqCwMfHcZiNKQ+r92Mld7D
 tbJ9QxB2mLujzWr9yRD3TNAPLW+QEOvc3xQrIRlIbE15wXpfDdcNY3DubpHcOHoQQTWT
 U8KkXZsFk7l2dOYrgWn7kTGRaqlI6ONmyh+z5Qr6NW3KnlWEVkr26ScdSwDcXKCqJ0CS
 3JA8+2UjgVSgDq33lHhj7RerqC8BmTVrY+UrhKTlYXTMbWGpfTU3lDsHqsViv2RK2tya
 rtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793464838; x=1794069638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qcrxXSpZ7+EATZXmWVXLT0bY2U1TVj09coNkKWtg15Y=;
 b=tjaBS1jnfnkMnjhxWfof50IYLEbPrbPRpvmBcD9PwRC36L197q2tXZifuIJG6h/PGj
 7/AvGl5MhnOQEKYsCwmaTlq1qdY0+nKeb9hd91tXgYCXZSdWXJobiCPDrEDODVGNwp/v
 wKR7r/NHOKT1h7mbH3equsCQn9v3w/hYRIcCIKMZTHLm479sQeDssXJRsSBUR+jzF/BX
 YMq5KEiKljWimJjFRPBXcLb8vSqCJamX3H7EsNHMOoZ2TJIKqtvYLGEmT3TOjFAgnTF0
 2bxus5Hdh1Ml1DDlI3CA/xGQXQ5VYNhumStk7pzfFc+S63Q5VFuFAhY9/3A2doIm0hFI
 1FDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpz4udEu5JHs/DAmOGkNb7f4/uoyQq5X+KdraH2Oj0ZlbYgxKiRZ7XoLafF9SW33oGNPni5qkVLA==@nongnu.org
X-Gm-Message-State: AFq9FYI7Pl9mmm3N8Vy5dTPBegJwcEY/Aimk3vnfD85rU9oi1rFV//wR
 S3qXXZ4BXWDUvtJv6S1jp46fsGafAxoQOyF2t7kosyrIJjKKgXgSmwCk
X-Gm-Gg: AYBFou0q2wQxAKQSf97qrYJQIMbLFmwZuWi3EpYRzCyZy6Xq/tTJVRm51Vkj+bqzqtA
 p3eJ8S+72xC7Gg911nMc89KXsV6nMd6pgqNlWmp5fRUNQSV4eVHbSNayhWYD+HlfZtaHrs/5ab3
 tUC8i1pxV5X5TCwsRjr/IYLKkZ/sOHkc+DeqRJ9h98h41/bewG7t3l5hlRbXHP1qitZt/gonDWb
 0GLhjU8NOw8a4gGM1esWc65jeHjBdfDQTVrmkyLKb2mNiwPKqJVutdGnaMzgDAGRsB8JdaMPyi1
 gXXnmS/naO/kU8Mkxg4MdFtEIsLaS1vlAbPQ5JT7W1twUlP/0e9neoUgB6HDitg1CKrbN5SueiI
 WTq7yI/DDLSr3uNyLfDs9jS4hk/8U5hyewcok88/f3zMf73JOp93mU3y3vrqr8WXC9RWr3imJYe
 oeffeSG2QeQ2sPTeue22zPBHGJ4nPVxitAmW3YRhB0L9QzTyojc6UCNl9Ol4RFdrzx8mRfpQaPT
 9VTuIWmNNYVWRkPwRmtyo4x3b/9uFBkJR1MF1YmRBVnetH6i+e7TMvz6xyheDaP9d4D5AJ2W9IE
 TR+7RLxu8GoQdSgtSlkIQzQkJu7yECknV5sNIT5sLRjd4sC1jx5OQBVtFOwddMDrA0tGFcw=
X-Received: by 2002:a05:701b:2806:b0:190:b2de:1549 with SMTP id
 a92af1059eb24-1ac557770c0mr7072782c88.1.1793464838194; 
 Sat, 31 Oct 2026 09:40:38 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac193b8179sm19574572c88.11.2026.10.31.09.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 09:40:37 -0700 (PDT)
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
Subject: [PATCH v2 03/12] target-info: add target_xtensa()
Date: Sun,  1 Nov 2026 00:39:58 +0800
Message-ID: <20261031164009.2048-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031164009.2048-1-luoyonggang@gmail.com>
References: <20261031164009.2048-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Report whether the selected target architecture is Xtensa.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h |  7 +++++++
 target-info.c              | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 6c4e2809ad3..1d6c6f4472c 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -99,6 +99,13 @@ bool target_or1k(void);
  */
 bool target_loongarch(void);
 
+/**
+ * target_xtensa:
+ *
+ * Returns whether the target architecture is Xtensa.
+ */
+bool target_xtensa(void);
+
 /**
  * target_base_ppc:
  *
diff --git a/target-info.c b/target-info.c
index b6d9cd8d97c..07dc88fd366 100644
--- a/target-info.c
+++ b/target-info.c
@@ -89,6 +89,17 @@ bool target_loongarch(void)
     return target_arch() == SYS_EMU_TARGET_LOONGARCH64;
 }
 
+bool target_xtensa(void)
+{
+    switch (target_arch()) {
+    case SYS_EMU_TARGET_XTENSA:
+    case SYS_EMU_TARGET_XTENSAEB:
+        return true;
+    default:
+        return false;
+    }
+}
+
 bool target_base_ppc(void)
 {
     switch (target_arch()) {
-- 
2.55.0.windows.3


