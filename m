Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724CCCA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:08:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTIo-0003mK-JZ; Fri, 22 Aug 2025 11:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGx-0001v7-KE
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:02:02 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGY-00050o-Sz
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b47475cf8ecso1558570a12.0
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874875; x=1756479675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=A7j4GvhCplGcL21yr5pbVeAdLmTc5Jprqb5cKkr7NkFoE6q7aEw284+thhUZg9FHUL
 aDvhfQ6EM+TEGCmzjLryff2wP+Gl44A9U7sR0KaLxZ04I4WEM9wfaJ53BMwouUezGhfa
 pkH/jVczOnWdHoU+BK8OVszUPdMvsAlAEOjDlBfvYnWo2q9/CkNgpc+Kn82f5rW7FJgT
 zwFqv1FzNJBNMU3VIBlFzRPovKxw3aFA4pYKP+wuERayxw/xMDtEP7kx0ichQRvCzn3g
 KW3jZHI3AGFMVCPpB/gF3L/iUHxlfIEApgoYYRy95ihCxmg/iYEwwegY9HSgvbvDMobt
 +d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874875; x=1756479675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=P62VEUiCjqDab/zRinYcdtw+LkcB9xDTQ6YDuHEpLZtXA+fkDLHF09QgUbtErdu7F8
 c2SWFn/onE7/xKr7vrNPJTFGMVqfxBjQH35xPqrXd2oC16BJWv/NXokaDBnCbE4spSSB
 WgzTqIDL6gvAf7l3tLmegZl35VjjBKb4PRIGaXPw9FapOg95AHf8E0V5dmIdRm9NXvO3
 OwXzvncEWJC0aFXy+dFmcKy1RAu7L/3BStm1lPfCuTvrUDqwW4Ty8iPxXJ3tQuxhmljQ
 k7CqnhQyRptcjCdHYB9QSCa1rGGnypD+hMhidIYLJYRv+Fmnj5DriLdXhOVJM6WXTsmH
 DyWQ==
X-Gm-Message-State: AOJu0YymBCGRSGSekk2vFTkbKpNTKBc6KX7jqK9Ab28+Mu5MfEq8eeDJ
 kNgL9QS2ItLZO2DTp9zrAYZ+gnlnqXefk1FQu9tkRSTCAbk3tXdd9QssiV6WFZFRJ8sSeqpBw4Y
 yS2BLKr6NIw==
X-Gm-Gg: ASbGncvGNfJoavpCj/KNb8SxigVy4nMf1FRVq+lmseR7gCSMOVAkmwaeoNJI1kjO787
 +cIuMZqWnpuTc1lc20KfwjFfxYKAiqiwXiHjPWjbr0EW4RFUAFCUXaSrlUKpGKHuAsThK8WRMyM
 x+W+bH5g+Nuz5d3DS+OV986qqtH9ETIDD6gRdfW307WfFSueZPVEC7zksS03XB3YLx9vX0oMvM1
 wz8BBKxGB/pPFJrCTBr1jzhL+Q+fIoBCYR8IHSIv/D0qz+rcAOw5CW+SBAYqs7zO4MukORjmz5j
 ZcZSbiPNs+4OscHRyLjZW2CMHmdqtXAsQSH//IowEOM+FP11HIjrek++Zj25hwDPLwCLSYHmPuC
 a918Zimmx74spQQcNaQoDM2FLLY/rdLSvavQ6+7odThM=
X-Google-Smtp-Source: AGHT+IF7q0bRwpOzZzwRXFmYsbSxbpUMKDnD/N7VrfpdmIkl8MTLY6Pl7H/TaevBXbXYHJV8Vgkeng==
X-Received: by 2002:a17:902:d592:b0:240:3f3d:fd37 with SMTP id
 d9443c01a7336-2462ee80b64mr41071155ad.27.1755874874553; 
 Fri, 22 Aug 2025 08:01:14 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 08/12] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
Date: Fri, 22 Aug 2025 08:00:54 -0700
Message-ID: <20250822150058.18692-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x531.google.com
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

No semantic change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5877214c47d..c03096b253d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -786,7 +786,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
-        if (sizeof(target_ulong) == 8) {
+        if (is_64bit_semihosting(env)) {
             if (SET_ARG(0, elapsed)) {
                 goto do_fault;
             }
-- 
2.47.2


