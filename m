Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914FEC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 23:30:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhzCF-0004zd-Kh; Fri, 01 Aug 2025 19:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8w-0007VK-Hx
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:31 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8s-0005xa-2D
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-31c4a546cc2so1351935a91.2
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 16:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090784; x=1754695584; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjQRkF3T2e1TLC4uRUvYI8Of7xM4pUkpWBxjX1/U+Cs=;
 b=yWSM7QOabctrvyX59t5uENmnS8rF3qGvxGTCH3VjnobHpRo4Jmx1MZuLK89wy5ZO/Q
 osHuQJQvXP88O+03OMhqkGi9jC7o8FzskxCNuL57jw1bam4rYRbQbdgr1DssUsgSnlQo
 QUVVUCrzRLD4v+0GTi4+lwnsyQhMPY1apSKZNye4+Up98PmbF0NiPzttC+NjX7Gr1shh
 9/kWhv4v7vX/4OdjVjtaQ/GV/lCHTfl/JeZ2Or5C9PjRGLlt8AxOm6mqHThaB5P2GcW4
 8TF3Wdc4vncdGDN6LfniH1suUdDQCY4NTNl4j/810gKA2cUsVjCYERSKci09bnKZ6uy8
 HgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090784; x=1754695584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjQRkF3T2e1TLC4uRUvYI8Of7xM4pUkpWBxjX1/U+Cs=;
 b=O1CAjDoZEQmy59r80w148NQ2BrCoj34mLdttAF6BZbBm/ChKoK0eo4fy5FsGkpU8u1
 6C/uzwuNjI1IFI6flI81+a4KAuiQlxp15ZYztdj16Y92u+faCzMfBIBjYKkL3MDe5rx9
 15wHIjtiRVOl9yRcUwcP2eyX+80KReUVAc4Ga+TNNXEcR1K6Id5Z7M4E3JMksSUo/QuY
 LNjCuSzBX3Q3N9t9Sf0uBzBY5IuMpRbuZfmi7JshJXZycU3qZtdsudkWCXtPXNYjo2fK
 SUUFwvf+d3zJPMrWqcenmLfzlqeOnDfsqfZNmL5lEBx1olMjkUxaGa9iQS/KN2dQjXp8
 f/EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVitB82qFcYksmmli7Jkkm6bAiEGJJ/6IPXCbnwrlhX7BPvMsY14FAlO1WigeEzWZ3kZNjutxn+/w==@nongnu.org
X-Gm-Message-State: AOJu0Yy3/+G84NiBqDKSESz60+w1InCfvOfBJT54ols1FENgJz6zHyS2
 Jwo+ekeGOdjW7BMGirFCkajAfsCVq2oMkOdyDSuORtHxmPauPSsG1kBaUGtxWuSdBDI=
X-Gm-Gg: ASbGncvpYlrwTcGs8y9PT7QzrH4XsiKLiv5Fx5EMevnlXZwmWQ00/ZpoAkSZRaHu09k
 rk4+AUI1t09vMD+DRP+Yql8sKedKCeZ31+OzV9cQXFUJFkf3C0nSa5/KxykpCkauJFLp7tpbr7y
 Ctqy0M/kpRs2+HZjMVeBKPRiRim4juJ5uOWx/ogVX7+4WYOSnLwsh7KS6djnCbEUBXOCQqe66Rh
 spRSZzwCseILRB95+CpDOZaDhU6R54+GSw1JDIXapdU8SpEm8ZpvLmitVeCdmzCi0fjqMn8s61M
 5dXF7lhnI+JZsDC9MWirkjbmF4GgEuTQA5+8c0kUXdZigKtMtiQBw+oCsJV0L88VdtQl0lnyjtf
 f3pVm6BRCVPVhjWw8fx22Zg==
X-Google-Smtp-Source: AGHT+IGB0AcTzr6B4F26dGXej77A/yeTKgm5nnIegOXWvsK2bVPvbV/VC1rPwyiZ3A8RMZd45FLWiQ==
X-Received: by 2002:a17:90b:4b83:b0:31e:4492:af48 with SMTP id
 98e67ed59e1d1-321162d3205mr1860771a91.28.1754090784640; 
 Fri, 01 Aug 2025 16:26:24 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/11] semihosting/arm-compat-semi: replace target_long
 with int64_t
Date: Fri,  1 Aug 2025 16:26:07 -0700
Message-ID: <20250801232609.2744557-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 23319552a31..550c8f3589a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -501,10 +501,13 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_ISERROR:
+    {
         GET_ARG(0);
-        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        bool ret = is_64bit_semihosting(env) ?
+                   (int64_t)arg0 < 0 : (int32_t)arg0 < 0;
+        common_semi_set_ret(cs, ret);
         break;
-
+    }
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
         semihost_sys_isatty(cs, common_semi_istty_cb, arg0);
-- 
2.47.2


