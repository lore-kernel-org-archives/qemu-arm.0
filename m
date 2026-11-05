Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CD606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 18:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKGJCJV8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP2IO-0005Mp-BM; Thu, 05 Nov 2026 13:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2HP-00058Q-6k
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 13:33:43 -0500
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2HI-0007fA-LH
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 13:33:39 -0500
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-353804b591eso4184069eec.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 10:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793903613; x=1794508413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oy5DoHzhJBLmB2vbo8S3/BszoXn1nmgmNWYhTGzcVGU=;
 b=IKGJCJV8zd+BOmOCz69DYR+QHYWdddqGkCMgBr/Nx6i9wwcBml1vTplPqtZuVE40lJ
 qdfTx5R5uW/G2fLo4Nbo6tq0Xbd4iqy/fU581IbmkxLye06wReA4Ab/f8KEJQDXiscb7
 pIe4ygS4D7VfeSc6saBN7sfpDrnGF2az+4HTN4BCV4j4YU5ZgJTRldIE4+CrCYYF5Lm1
 mudTrbeySyguBr/Rv89aelo20y9fA/YzDKamzmZMLRFnyk04VBl+1uyawuQPMfzqbzL0
 1DRDbrGw1Bcebhsu07184N3GF+2LR8/OJr5k/YPQYqsuFzXyYZR9ZyvQ4zA50yUd3S64
 aNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793903613; x=1794508413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oy5DoHzhJBLmB2vbo8S3/BszoXn1nmgmNWYhTGzcVGU=;
 b=1520vATWv/6Gu/liMknUjkh6MV+eY18GcfY0xFfctSWb3wQXKCfNo8yOG/4Y7zPKce
 5a8YyMbA/4ZMtv9vI2M51VvGbiAMMOpu9XbgToiG13qIA6ueGYgN1MhbBm+WIyxN6LVV
 vPp6gUpqZH2aRNQ4n6PPmUXzXf1tAvK74oPjWQk4lUf6tNIZN1nxIJ0zW1+n6BdqQnsn
 oHPYdSSadRm5JGXHpKDNKcK5GKaSnEqPdySgqYwj+rHgEXSajqQ7yMbgrPO0jxq1B8rb
 Ii2mfcjIIkICV8K+G/0nFVfbc081aM5JT049g7OfWVgnQ+JDhaUh+l3MVNaXstMopfdy
 tMiw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxBeSZ35GpWAs46ljZ9hcQhM2Rziubw2uCu8fKXDOO/aDOFstGDg6HWw/5E63HjWXBr3FglnR4thQ==@nongnu.org
X-Gm-Message-State: APuU4Z9V7MabnlEpD6iX7UrkFb2HlHH0p4sS3U0cATSb8EdZTlLY0q0Q
 pTElhE+sz1+GMdaH0+uOYCo1rk78eRhmRYaMZNOzk+KmurAJroGEEpB/
X-Gm-Gg: AYBFou3TkKekehSr+ktNARCvTeHjYzSBA3aeqH+Gmxfnb9yXhh+0xcyk1Z4cixP2T72
 0RS0dJtv6lWo2GM9NvXW5HaRRo7Q6OlXGjEpyxbKVrPmZSYEdXVrh9lqVIOgGfp02ZiABDvD+Wo
 SqvDd7BIPQ0YE6u4/c0fGzMa8cD4xhUWG4Z60hjWV37lELZ9kraSpAMMynrZguscUmDUC3wOLHA
 1i+F7RY/1NdjpzgLXGRcG0Ek5YJrHLu+8ZGX3PR3LHpZq3QJ36SAYrF3hFeFQqTk8JO1I82+KZf
 NpAtk6XohJ9TZTq/erk5wSanmSMoJ/mCUaRZQtyxGGJYN3zoX5LivrFjO7v4L2DDsw/HTAzAI0g
 y2eVVIuuOU7AvDIVS5XL+YAMwXgUhbpGL/drS2JwKrPZsqtnvHx76CvNJeR54xIQo0poqqLt1V9
 6qf1cbRFoJLvo463rkKCKqSkra4INvb7QTPD8OI91TXMWJmA0yP4y+jbeTL2RLf5uq8Dy/JVwYZ
 F4Tc6hHpO4O6W4c4amI2WXSAcWD1pMe317cmVRIKY0GzdjAntcp4xa6mrbMQIGBT5YSA1SK5jc+
 NZm8kFCOY6Nrj4iCXGxImJtKjuUC/Ui516OXK/P4qL3sR0ltvVyrjeGSymj0VHmNOoCeHA==
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id
 5a478bee46e88-36a423fae73mr27075385eec.30.1793903613090; 
 Thu, 05 Nov 2026 10:33:33 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36f66086a4asm277795eec.0.2026.11.05.10.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 10:33:31 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 2/3] Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu
 to riscv targets"
Date: Fri,  6 Nov 2026 02:33:08 +0800
Message-ID: <20261105183310.1614-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261105183310.1614-1-luoyonggang@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1332.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is redundant now as all accel-$cpu_type parent is already registered.

This reverts commit 2d3e6b4003d5380c245ce8ffac4b8866f6d10a33.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5beb602338..aa28098e10 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -27,7 +27,6 @@
 #include "qapi/qapi-builtin-type-infos.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
-#include "qemu/target-info.h"
 #include "qapi/visitor.h"
 #include "system/system.h"
 #include "system/kvm.h"
@@ -2241,7 +2240,6 @@ static const TypeInfo kvm_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 static void kvm_cpu_accel_register_types(void)
-- 
2.55.0.windows.3


