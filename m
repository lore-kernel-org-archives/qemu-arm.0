Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF2606A328
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 02:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chNKi9th
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP9sc-0006VU-Ox; Thu, 05 Nov 2026 21:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9sH-0006BE-Uy
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 21:40:21 -0500
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9sB-0006Ai-Te
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 21:40:14 -0500
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-1a3c08d6928so389191c88.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 18:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793932805; x=1794537605; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/0hh3Zydje69yihcPOiBJweC3tWFR9Iu3bC83YOJ024=;
 b=chNKi9thHAzlCR01ki+v9fUtvHyJoWy95DOUqlosCqGXx3mwdn+aQwLjobIKnE/xfR
 lklhglTfEHBTLzLYrGgwh47xSbPSl/1s9f2381dzetEmo0w7CotJU/8xs5zMaEmrWUkq
 V81Z1+UiTlOtNDMOsbw7pNbvAObCjsqN86zR9UZiblpBYXXtILrOsgWUzncnEWCVQado
 Ob0DpALgcz6q9Mu8g7b4ZHUxJ/WhqOve3Z/IssVzEHGx6OBhNnkROQahwknQO7cT4XQ1
 a7Kvf29HD5rqUxRvCb/YUleWjM817NDwndPqPx+LjIqex08CAkKu2kbjtOaVvypGTvt9
 PQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793932805; x=1794537605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/0hh3Zydje69yihcPOiBJweC3tWFR9Iu3bC83YOJ024=;
 b=yd8meKlfBemX7ludVFZI3MAYwWB/6Dz0MTi90LVh5l8MtVlnWn8Oci2tYLr+SGt5in
 oThOsW65VWsQdXyCQcOsLoTq1YuIFynhqB33VilI8ytloN8wWqQdjyzkuLTPf5WU5Eju
 vbSXgsigShas1DqXeJ3V2Kfu+vLFWkH6GkyC7xtYhQNylO0pZP5n7VEyDeVBsh0AJ0GL
 2udeEn4zVfmYS/zY/gomqsr89hMtV5cGDoeMdqUYx3h7MAiguIrRLJWKJaKqD4FRKwjh
 1IxGXf0ZahK0ga5NE14EixUYLBQyr0NEcnUzw60r8eAfOrvLHfXn5aBhD/0Otd2ANB+6
 jLag==
X-Forwarded-Encrypted: i=1;
 AKwUvBwthU8deLQp7Zea9s8FxSK8i6oJTasLLo5rO1WFzlrwXjd7U2DTDJ35wj52mZPGAPJZ3A6ykNGvTA==@nongnu.org
X-Gm-Message-State: APuU4Z/8rAmbRENqMw6CA6+7IYQL4JTyvayNJMfa6OqqCsl6ttsGIOt+
 WICcc95cmIOb1PbqIIkptB3gEH0NyrCu+Jnnf8aj0igVlSbVXCi0CND2
X-Gm-Gg: AYBFou14v6+kRXcPMvXDa7qx1ZDrYeJZoBycnNpgd7Mionoym7pj3c6mBNqEH8DOInx
 UQqDTmSPcM00ih0wskwcnexGDUL+6p8gIxWnk6JSWzqB29vVOPRWC/05gnPWHOQGkc/vl0/k4du
 3+3VXw1eauL9fL/W+6duOOVbj2Edb3HtiJeYo3K2+tnlnOyFBnWfqHS2m/nCeQBhZ6GNyU02ct4
 lQ3THdJY3erqjpx7U11M+41pQ/Ua+swAs7VL3bawwUz5ZNDVIsSSwIC7fWbs5VuZr5d158U91gE
 0XpNVBRYYULwhCEBeTJiNfeTP2EwLZWvzy39cAr+9IBmgY4nto3NmmNENSAGR55CbgHj16oj00s
 WDvHxg1EW4TOMQy70sJPip0Rf7KotavZY/PUv4e/nG/toEbP3elPpdooRHjjpI6GRoRgnF3yd0z
 p0+HAmR0jyI9OturFTjzpFdcxiw1bzSPYFANzxTwMztERb65ZdcPkdfMx5/KGcduc6SnHYa2pRt
 6+szvqS71wY3IXepPzSzeVKdWFxHJUktnwddjbVm6q0JvRZrTbu9NMUVvGaUf93Iuu2Sy9rOUlh
 tZ9zwLsjlQcCzUzRXTiJczpOtIbMckYOtVG0AVdQfr+6IzMtzXsFhFBKLHwKgGtUqlSSMg==
X-Received: by 2002:a05:7022:f513:b0:149:1b5b:1f25 with SMTP id
 a92af1059eb24-1b25d31ec18mr1052266c88.15.1793932805118; 
 Thu, 05 Nov 2026 18:40:05 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1b25e4efa6fsm1108318c88.20.2026.11.05.18.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 18:40:04 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5 3/3] Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu
 to riscv targets"
Date: Fri,  6 Nov 2026 10:39:35 +0800
Message-ID: <20261106023936.772-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261106023936.772-1-luoyonggang@gmail.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122c;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122c.google.com
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

This reverts commit ec65e16fd2ba012d57b1bbfcfcd04c31c4111924.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/tcg-cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5834ec1524..3d9c997329 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1755,7 +1755,6 @@ static const TypeInfo riscv_tcg_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = riscv_tcg_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 
-- 
2.55.0.windows.3


