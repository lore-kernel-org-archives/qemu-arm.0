Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1968ECD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:19:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIdv-0005za-5D; Sat, 16 May 2026 13:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIdj-0005Ur-8w
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIdh-0008O6-It
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so6026435e9.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951844; x=1779556644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RNRxHUIKIoHhD2L2k2Kf0WRpvOKC9u30TJYtxRtPNw=;
 b=rchOoRpqownsSUKCcJdNMdYCZCXr/lr06dkqtXPjY8ULjouxGfjiJYo89cULPe5I5l
 34Zv7ogfijOd7zvBg0LLCiDS6NnlOsvIKbVtfXW7lWMcfjbmB5aOUc4cVnuCG13keOld
 +XVoZRN3aQZE/ivu0gDyE3mdsYATXv8SLV6ZEElEcmxf2Ym36N/E+Tr4ezH658t+Pi42
 rpcghLVzOWVZMVVr/7D/6y7Rdhnb88LWdIbbCM+O1UhkQIFz32s9CjqHzPfaAbR0ZB+U
 uh3k6fuE8rkImyt81sI6j5mJnd/TWIRyn+zpRTFvNGoaIsF/JsCvtWcTlGWG2sxnSJLt
 I1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951844; x=1779556644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1RNRxHUIKIoHhD2L2k2Kf0WRpvOKC9u30TJYtxRtPNw=;
 b=jNPvqex2nU8nOoEAzCj+mbl24v06vNoCYjOi6fMyyXBhIkYbibPRBKGTbFjVoFzfcY
 xvZWjqJm823VtqIs+vAI/1G19X3ejd/lTe0VfMcl6iY7bXXaqnsBrgNjdpyWl5bqLybj
 9lutTt+HMntCBAWeIpmCW7MvnscgQKABqRgvEk69A0HBdCkyaCH71sZIZJNMUWB0BA+c
 0jsOfSbiri4HpQM52/b5xEmgQ2oeEVCsUx7p2KuythLUwxCkrzgQaMxkE7EFWcImCiYq
 Z9fek/THvY1RX5smjlX4C7aN3ju/JJ+7BVVeQIQLN1Yjyd0RGb7Lw92TxNimZ/SXxMDF
 mJlg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pMn0LmPnUIkGq/NnPxFv/cWBcZr94abMO95jybd3vc323WskmD0lKLZdTtadoIGwUj+KMmPZ/Xg==@nongnu.org
X-Gm-Message-State: AOJu0Yxn/3oivkMnCkDCX5GIw9KRDfc7xiT+wCsSfdbDuOXWi1B2d2DL
 xYmRGRuY8U4+glHmkbDe8Mnkw9L8xmbj78Z3xM89jCS28N15TH3eNfg84rwlw7S13cA=
X-Gm-Gg: Acq92OHRvY7zYEkKkCzIj0NtZvrjW3CaoS0CdqL0W3qBP48XEFVAh5AGUqKXROYiumt
 6OIyFZdK35aszWb1JiZen5M1k1DoKW554pTzzWZ/2h7xgzh1fRzoXCCka+OtJR+8FvxZHOyUblV
 vjNUhhfxE1Bdmcdp2QWYl120JXWUsOiZnbY3KQBE45XBmWkLlgtFbBFEC05f+pVJ8Mph7f678Dj
 NvuboSjz63GJNdHFmnBug9s6PT2brGUvAH0rfgXGYkaXhnRrNTxeys95SG3BKDdwofg6wnOXAJK
 839HkvJNk/P1ahrqUfb9nOEoYLaoxCbGkoeNBDfsoUzuo7oZH8stZ1JvRT1fOsNbuvOrxM9UH8G
 r9669LPbMjgMPxM6GIfF/Lb+X54YqhxmQNd/jnVZn5J1jezAKswaKZ7q/th1jywmC9uvtYirg8d
 LKoXQUp+yjrirHqTKhIDY/uKrICrG2Lkleha0QD59v0XEJZETH+XT4D+Fh6sBRWf7h3i/SFsVbv
 y8OHaRLT50=
X-Received: by 2002:a05:600c:a405:b0:48a:52ce:a4b1 with SMTP id
 5b1f17b1804b1-48fe60dd5e8mr123054445e9.15.1778951844160; 
 Sat, 16 May 2026 10:17:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53804aesm133414005e9.15.2026.05.16.10.17.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:17:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 16/21] target/arm: Only set %kvm_target when KVM is enabled
Date: Sat, 16 May 2026 19:15:18 +0200
Message-ID: <20260516171524.19184-17-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/cpu64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b38a78aac3f..7b2f09cf8ec 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -701,7 +701,9 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
+    if (kvm_enabled()) {
+        cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
+    }
     cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034070;
-- 
2.53.0


