Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E16CCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:27:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyu-0006pr-Da; Sat, 30 Aug 2025 11:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERW-0007X8-Mw
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:48:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERV-000528-5m
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:48:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-249406d5878so3318105ad.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532878; x=1757137678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52VfTzYDSgjyTkCxi2KMOJnfbsQ5A6/k4xx3za3L80c=;
 b=tjNQZVlCyQGg8QTCkYcy0sFfMPV9VQx6uW2F2cdtzrHudhAzYJ0KxHUxkhd0zJY+vd
 gXmsvdEHh9aiOJy6nBI+jVWgdq8GNtogPWl8YeQBmD53s2n7iRSFfZVz65ifh9F/qvG3
 tWXAz1PeA0+V2+WVXzc/bx/M0c8CkTTDYHcuVmnV7hM71Ph2Sc8sse823Wkr9HLwm7o+
 d7wjtD3k8O+sv/jY9dvlPqBl50PMevkEi2uOesWeY8olJ4HxZw0QUZ5paHoETwvjSrM0
 yaD9/6upDVDnOdbuSUUH6EPk9AuyNG2B9vpoGTRLXm5xb8hJvrHbYMutaKQUARNNnBZF
 QIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532878; x=1757137678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52VfTzYDSgjyTkCxi2KMOJnfbsQ5A6/k4xx3za3L80c=;
 b=SB7AAc1O/isWKLuqQCN1tTzGxVMiU1eu5JUqq+ZQJuRjjqHISwjgSr0rttiD1yGPIn
 WZrwpMawYmykNUjU+c1mSJgPPD/6qkMWP9dxu7e8RjpAyc0k5NV8MPlNXmGt6qR4tpvX
 TWNoUW1fauVcaiuqzmgPa3MCbV6m/7sd8+EKtU8aEn408j/18yUtiY3b5xQmfLwKDizH
 wEwkoDZ7XewI4iImVFxAVcCBMqwvC7Jd9h5L0EAYv8bjAglikv1Xq860I1UtU6OZTbH0
 9s5ErvKpT0755TTyafFXBlIzH/2ok+pm3+ann6akixjWA07KdabPV6SFyJWssS3dB2wm
 uIOQ==
X-Gm-Message-State: AOJu0Yxd9YU5fM7soUewd/5JHbgVO6G9r1EiD4YLtLs3EeKjpCmDxDU1
 HsqqBgJHicjnv7vF09vOaXXyWtIiusfmFSUp+aV/FDTlwkzBUAqOb0TuEblSPbhGvyc=
X-Gm-Gg: ASbGncuMgRDBqwUILmz46mqwzf2J4foLq04xsB/eXox6khPs2IDCWPU3wzu6KWFE8Vr
 XIJWMoYV2VSuxHW9P11wFVuP/04KiKwY8cDxXyd20DGm785ZS/io7opdP2QlkbFRSfKU75r/Qyz
 8dXXGWx/2IsZ+3mrEHxUe2+RjDany7/qbkCZmUChPAls6QJZKJSkYYJFfzCpqsUdMVkl0ZTnEYV
 FsMgwRcLr+aIZkxQBVfiM1ZfuZoYu0SnK0wTBFDUEsuJojOBUW/KIsOjrcY0gA8LSgvCqlM3GbW
 6i6+FJgZeGpplQMXbKnMEDBrkbd1rGXGoR9vfBIlj+itxQuAjOgbdfyuTfMhy3cAins7l58hE4B
 tctw/G4I87f04iNdQVzn7zEUOEgY5gPM/oro3Fsb/6yID4U12N6vTx/I/jiiPQPkLonkltdmWIA
 ==
X-Google-Smtp-Source: AGHT+IEqJCtImH2Oz22eyTM4pkOhpINTH+uBWpwKAXITS6N4dUZazzhGQABM2eNAavdWhfck3ZKzUQ==
X-Received: by 2002:a17:902:cf4a:b0:246:644f:5b81 with SMTP id
 d9443c01a7336-24944a9bab4mr12851355ad.32.1756532878248; 
 Fri, 29 Aug 2025 22:47:58 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 72/84] target/arm: Implement EXLOCK check during exception
 return
Date: Sat, 30 Aug 2025 15:41:16 +1000
Message-ID: <20250830054128.448363-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index f61adf1f80..7ab7ddf7c4 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -694,6 +694,17 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         goto illegal_return;
     }
 
+    /*
+     * If GetCurrentEXLOCKEN, the exception return path must use GCSPOPCX,
+     * which will set PSTATE.EXLOCK.  We need not explicitly check FEAT_GCS,
+     * because GCSCR_ELx cannot be set without it.
+     */
+    if (new_el == cur_el &&
+        (env->cp15.gcscr_el[cur_el] & GCSCR_EXLOCKEN) &&
+        !(env->pstate & PSTATE_EXLOCK)) {
+        goto illegal_return;
+    }
+
     bql_lock();
     arm_call_pre_el_change_hook(cpu);
     bql_unlock();
-- 
2.43.0


