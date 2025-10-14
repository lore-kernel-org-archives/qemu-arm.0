Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E8ECCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:20:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJy-0002ec-L8; Tue, 14 Oct 2025 16:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJi-0002Lx-DB
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:18 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ5-0005MW-Cd
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:17 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b57bf560703so3750923a12.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472451; x=1761077251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ml8IrqFS6Bp/u7C5UDkNEfubshsEhfFYuVLQAR5MCA=;
 b=ZJpfN1GmimFihjUFMNTEmOzopYz0+6uogVTbLiI63l797ifdX8Fq3y5g0W7T+YdOwO
 8ULPNHzn+6jkQF9PWTIbwiFJa3jPO0RrU54RJIQmaEe2KtVFxGxoFsDIHbEL6P3NVJxH
 xAe2mphyanTXJ+sd4FAcqnFvoPL6ermznM7qPOD/xqtA+rNWmGfxRuUig7T6SSzrRhdP
 fIjVDoHoK/GtmaeFlBjHRA0UHr1co/IsbXdsExUrFtXgXSbjjqhSxKtz+/J5bJi5NrNH
 tM/bF7aGvN4aG+k1yNLFDX1yULdp3RZ06eWAhiB4feFFVic7JlHi1621e0Y9YUusTTE/
 OPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472451; x=1761077251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ml8IrqFS6Bp/u7C5UDkNEfubshsEhfFYuVLQAR5MCA=;
 b=P2cZpocMnOISLCGgGd6XJYIgOHSnhhF91Cb6K+Ln5YVnaxiyojVWkH/49a7Ena0T1O
 mQ+mhFfQ4ioJ8God1Bei9IZce9E3/wJhqEt5b9OGnM84hcgHuHkAJf9R/Sy0Q6Ia8ies
 4nPG/nfoE802bDte5Ju37NBpKCRC1OL4Uctr9HsxqLHvpUcJHai0hdyubtNm5WMFuJNr
 +e+q/YxL75kK7vdxUBwQCUdv453YlbgD4gSCgveLQLHbNTHejRV8hFLfusDQeeNZ5B3W
 otepRFqt2wl4nN4NcKpplN5xPe91cY31/OWRJu5blqfwl5qq6U72IOuG+xruRpWv1Dbo
 gCWQ==
X-Gm-Message-State: AOJu0YydeWO0O6auvEOXhR03Pp/y65EyDZk6gzzGp1JmvSByRO4Xnk6o
 HvjoNsZyfXVpaepg6pXEQ1FdeQaXnnVZLEowzMfms6IkEK79Kb1d0SIC4hgwBkeH5Uo=
X-Gm-Gg: ASbGncs2CjndhkzELrhuKhW3uYZz45MfZNdl6ia8RkgiyHE/soEJ3+1zY9r1qNkQJkt
 hhYzTPNN4MGuBFO5Ue6u8loJTNjG73x77kq6tVUZHEm3iIV049SFkf7uKg+U5V2vuAVJEdfTJ/U
 ToOLnh6f6RcGymESHyytispp+AFU4OdKxA8KE/1jNeKrYqGBYaffc00LHfHoxNhRONcq2cTH0Xs
 0ul8K8nzMhzA67EVEjakmNSPyOC9P3/Hn/5Ze0fKINes0qH6SQ4skNj+iitmFmkpebeeqOn3i8l
 C2XIk9QPhA5ad4X2TYpSjl+PF9GvbkYr/yRugBt4ldrGHSf3GQWmiwQJNTf/AAEugzYMOdy6ukT
 IgpCvorZfftrah3EehudCGVsF0aUHw/L4RiGI0EwjpI7w3BQNbLyOBcnRZv4gAA==
X-Google-Smtp-Source: AGHT+IGddwtrEJT9yctbOJQ5fnpwgPSu7nfi3Kncqa2YkkR8NuSG8e7a/PuiFQHaBD/FSYpAeAsUEA==
X-Received: by 2002:a17:903:2349:b0:290:56e7:8ca9 with SMTP id
 d9443c01a7336-29056e79048mr149323765ad.52.1760472451587; 
 Tue, 14 Oct 2025 13:07:31 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 17/37] target/arm: Add syn_aa64_sysreg128trap
Date: Tue, 14 Oct 2025 13:06:58 -0700
Message-ID: <20251014200718.422022-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

System register access with MRRS/MSRR use a different
exception class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index bff61f052c..2c7dc53507 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -45,6 +45,7 @@ enum arm_exception_class {
     EC_AA32_SVC               = 0x11,
     EC_AA32_HVC               = 0x12,
     EC_AA32_SMC               = 0x13,
+    EC_SYSTEMREGISTER128TRAP  = 0x14,
     EC_AA64_SVC               = 0x15,
     EC_AA64_HVC               = 0x16,
     EC_AA64_SMC               = 0x17,
@@ -187,6 +188,15 @@ static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
         | (crm << 1) | isread;
 }
 
+static inline uint32_t syn_aa64_sysreg128trap(int op0, int op1, int op2,
+                                              int crn, int crm, int rt,
+                                              int isread)
+{
+    return (EC_SYSTEMREGISTER128TRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL
+        | (op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (rt << 5)
+        | (crm << 1) | isread;
+}
+
 static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
                                         int crn, int crm, int rt, int isread,
                                         bool is_16bit)
-- 
2.43.0


