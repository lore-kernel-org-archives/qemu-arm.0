Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E9EC110E
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:32:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZnV-0004ka-GP; Mon, 23 Feb 2026 12:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZnT-0004jB-8p
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:32:39 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZnQ-0006z4-J1
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:32:39 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so36776425e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771867954; x=1772472754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=5T7sRVsjsc0vAswkiMt0T0Tfylq5nMVM08uSQ21feNs=;
 b=ZXmbh9y3DFDSSbMq1rFdD5RZjsXoaqGLdHSVMrhyPUL5Fo30CBQgREA52f9YcP4U69
 6eAGccQkG1m56S6njEc5rO4Rh4jqssQaSF+PGY9Cnd2RTRYRoZSJM3I9RSSXddVq4iQj
 vjiUZLa0voMm89atvkYwqUuADfG+LQuY8gd3sAhedKVmyIemOEvV1tQWWy6oCDc4AXeN
 cs8orHt/j9xEMCkU/N0DvDPo2hXsF7qd7MFhgjN2jWaY76AneJUeMuRJRyUeS6yme3M9
 8mvxObrBRSiEc856juHWTLSapqzrnf5zVnPwYC1n/NMpPK1i5TY6BNciMlP1hWLQj7Rq
 7XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771867954; x=1772472754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5T7sRVsjsc0vAswkiMt0T0Tfylq5nMVM08uSQ21feNs=;
 b=jktjyyeO/r6Gtn/dxlGIWhcjNcuj5XcdN0GGqjOYlqQbV6iKLaxSllwDg9A8w9aPCA
 MHmfV+4BHmxv1axB3+Z/PSKlMqiKrXhRkDSguMv5wdHEp4OVytht1ve8ICKHfQP9ktpJ
 4sStuETNC/1ng5KXmOSniRKHIv5ckGnxs/mxu364ul6HWbv9cfrItEMAvuF/XAYWbLbD
 UKYuRs+2RVS3vAFMasK6cA0coL6tx6ayIZ0oyltDf+je0F8wHF4KQcTaEiy4KqJO7etI
 mwtPxj1Te9+/PWxzl78elZa6xcqCx3bh/vy6FB4v9MFVe04VkHmat8ZomHP145m2rGWJ
 P61Q==
X-Gm-Message-State: AOJu0Yxlw5UBm+ZvnOn2EMEssB+vJ5Rbp+CCtDOvjWU5jgZyxwxmHybJ
 TD3LpnRuOQ/jDmoPcQKjwafl7AVUtgcU/aE4B9o+jAaaqN58zEEjSLDeEXURznYrRMDgp1a9pBR
 fEpkf
X-Gm-Gg: AZuq6aIiDbMGFt7AHBDO8AJiBCqPoyu0mLd07GlUuVkKGKholtc6Ljkhatnx5rsAV76
 1NUj7/FDWbJH5O2svy9Fa6blfba6SJLGd5yws23VFqJH2dLptDlWg+FBwKCoXI6l+R6aB4di50p
 FgAPCES5AdMHUA61bxnHn4mUzkR6nIMxOMpd4VWEvc8zQrsRV2q0ROPhiWqMi2I9UIrBJRosqox
 WHYm+RL5wQ3e4fbBAYOCG66RMMNqj+fyZ5y5yj2s4eG+xu+cdSelkoIEQvJWJ7jLqKCaF9I2l3T
 qEGcHkV33esk6xYAbvuUSiAlPcQJLq7x0FXr7KwsqNicWYcrzI9HHjBkALOaVw+VES4SMk+AIMP
 cbv7tBFRydcmzBl5CQMXFRI/RscFhB21E+kGd2GNX86fEzEBw7PjwaxxhgrwzTQTK7dChdGypNK
 LlYKLZe++978kQmCtZ0j/5FOUZ4UYGXaAfGJ4jG7tfYrwA9Mp+y/GYtJicsmMTRhHNCPF+UK3Gl
 /wWjpN9R2pzxuRLUhpJnfumgD5v5+nsJnVjUcLRYw==
X-Received: by 2002:a05:600c:3e11:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-483a9492398mr157257695e9.4.1771867954184; 
 Mon, 23 Feb 2026 09:32:34 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b823842esm725145e9.10.2026.02.23.09.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:32:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/kvm: Don't free migration-blocker reason on failure
Date: Mon, 23 Feb 2026 17:32:32 +0000
Message-ID: <20260223173232.453165-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The migrate_add_blocker() function documents that if it fails it will
free the Error it is passed via its reasonp argument and set reasonp
to NULL.  That means that in kvm_arm_enable_mte() we don't need to
call error_free(mte_migration_blocker) in the failure codepath.
Doing so is harmless because error_free(NULL) is permitted and does
nothing, but we can remove the unnecessary code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This seems to be the only caller of migrate_add_blocker() that
was doing this.
---
 target/arm/kvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ded582e0da..388766c846 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2540,7 +2540,6 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
         error_setg(&mte_migration_blocker,
                    "Live migration disabled due to MTE enabled");
         if (migrate_add_blocker(&mte_migration_blocker, errp)) {
-            error_free(mte_migration_blocker);
             return;
         }
 
-- 
2.43.0


