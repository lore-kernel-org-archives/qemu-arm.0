Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02650606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQyrLS29
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA4j-00057q-Vd; Wed, 28 Oct 2026 16:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4W-0004zm-5M
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:34 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4U-0002EJ-Mo
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:16:31 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-3514b90bb89so2664340eec.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218588; x=1793823388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1Kd/JJ+ki+GBlJjMkI5tJ6UFoV7UjonthLRTOxTkDpk=;
 b=DQyrLS293RsXpHhnQuyPIh6C/0j6sFzjVsCLCGVi/Hf3ggWDAxRZeX2ABKOY0ntizj
 +BddzRs1Z5/6/yU6+pZBRAUDoQPTiM+mxr7O7egW7+n3YRSFVikT03GI/hekz+RY2SiP
 0Pchrzi00AK52Ko9e2KCtClkPAAddGHN+JoQ5usEjRZEmR7e2OUnWAGfEv9XD9mRa9B2
 M8GFESgvGGNtMGAWiK6tczCneRO+9vkQNr0GTZVqrh5JDSJmG3XhMhOJZmoyM9hoEk2z
 rRtZbv4GLTmGENObTraOJixjwpRGHwfQ3M0hkC+8MDtMq1t5d5EMRXxRad+/BQbRIY2I
 o3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218588; x=1793823388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1Kd/JJ+ki+GBlJjMkI5tJ6UFoV7UjonthLRTOxTkDpk=;
 b=toRXCR7vloyDPctAARsxtwShwJp+rhDRoX80NlqHimAI6KyT/g/JnfkUU4hgGq2V6k
 IL0w0tDEPN3ncB7QPWPNotDfQdHrFx9IMQ0DaGDRSSqj3HZfLFJC8EYLe1OVvbGrtcIH
 rUM9H2heGFamR1NUiyPOYLtIP7mEJwCG3mFxl1uF3+OV6Z4VDk0sgrbhOOhkTrrPRIa4
 pIJxjUWMlPCNwHxdaXlHwyKJX05TiipiShFq0HpF/2B02V8O9EVZX7D91DeYBLa69SYS
 EgqndEOtP2PV9gWtbM0xnuHYmKpgtnO5WqnQby5+aI8Qn3Xq5ACAKSYy9RMl5E4DuDY0
 jBBg==
X-Forwarded-Encrypted: i=1;
 AKwUvByX/RhKkGmtEoJHUf68OYZBYx08VQoZh5uenufRphSY2ZABgqFhN5tb/+/NpbGEB7S4qHOumao2jQ==@nongnu.org
X-Gm-Message-State: AFq9FYINc3eFHQJc6OuKLoO3n/MYduJTftYYJbyFq7v7ZIhaPTJD3Vfz
 QQJ3UKm1hZx96SIUOkmtmQOw48sJD7VzwF7HbW2Ta3eDrw7tZVR6xoxF
X-Gm-Gg: AYBFou16cHtROB5U/KyHThZCqJVKdIDwqngLUFcxNzJIIesxBofj7iJQzv7gy9ZprNc
 KYBSjzKeXHWv1Qre1jWrKg3FqH4LQniyVr4q8t0ZHPHpOvhDYI9MV7wJkLHnWfDCCEUhJTWrX09
 y5SFj9YJVAy7MUYiHHRDSLu5F1vKTvaN4FHC1R03HCRz3H4NAhdkvfMsZmCY3YkNKxXwpMS9N/1
 mTNQ1y+d8lC52nfycQMC5jsU5NZ1XpZzg1UoJSupSmgJjkK4slsSPsbhqGPBkiRNYboCHI2+erN
 mrBNyUfauJ+sXPYP4CBuAa4PgRgWTMy5JCXkI/HAxam1BQS7rAG8TdbHB4DHlGdYgkXmrUDmXf2
 nZO2t5pTZQQoJXw4RcXXy7Uj4Kfdc7UDDO5XYA/zg5vM0PEAZmT5RhE/9tXl+EiunmWjPs0T9An
 SqLYxRNkjw/GNlkRH4Lj9qVpm5GiZ2D1B5IykouwfeQ1dKNRBNmf2sYAF0OuR/QO6JbPR5ah/sk
 koSuXPIks0VSZ3Hl7QsemC4bZ4EjOUfm884xuu9quPS8nzfx+MWrIkIM1yihXPfRImy7Yqa+g/A
 ifFo94XlmEJd12ha14Jw0aSclnzeKQ3VfeZuuAyy76eSsmHT
X-Received: by 2002:a05:7300:c88:b0:36a:1044:e805 with SMTP id
 5a478bee46e88-36a2008a23dmr6939278eec.23.1793218587575; 
 Wed, 28 Oct 2026 13:16:27 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:26 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/12] target-info: add target_xtensa()
Date: Thu, 29 Oct 2026 04:15:47 +0800
Message-ID: <20261028201557.2688-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132b.google.com
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

Report whether the selected target architecture is Xtensa.

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


