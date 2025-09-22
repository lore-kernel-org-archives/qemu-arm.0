Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB5CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:10:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lj6-00025Z-Sb; Mon, 22 Sep 2025 14:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lg5-0005DX-Nc
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfP-00050s-Jn
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:21 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-77f2c7ba550so1518929b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567214; x=1759172014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2QV3v6q0puRhrfNpRSWoo8b8YYN0t1SOeYhVDpb47A=;
 b=wrf91L7iei04UENZYm3qBdu6cr9+JV4Z9Anqgj7nq9abdhrxLdyPTxcvbqReaAslho
 u7r01ikXqbtpRugYH4uppMWLLkr52rMhd+lNWUAVsIG7NOefZ1CsYF4Pi8OsfjUb4DYN
 sVvRw7QfByUHDlfVZQPNHN2MTPRKKmNAjSskoPccyMSvxKYZyDDGla3AOIubnwABmK6t
 xDktBo9+DFN58RzajCoMwjNL6p2SDST/c0zigyfN1c1On1OIHrKia+wyiT2kydHI/KVq
 05GKAAkrgZ+Llv6DNYJps6aUYnuj8QyY0RPHMX94ufRH6Kd/317b36VFfm6d9NyEzP4u
 sM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567214; x=1759172014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2QV3v6q0puRhrfNpRSWoo8b8YYN0t1SOeYhVDpb47A=;
 b=FQC9LNv9LuVV2KlkhP7txpZSHaTrMVzDx0xcfV1jBdTYUBIgNo+v/Ohx3azR+MoTug
 uywV2l4GCft0KctfUC/ppm6FafXiCfS0KoU3VtKJZDJ911/4yZU8A3wtdL4e9Nml5YwA
 lcBTJ3xmF3GzGU5cymFoItOfbk4P2bY2zOi/pa6BEMfiK52GKolRYVKjCjLrhljm8CMd
 A5/mseidpThQ5QrvlIYEbkExzqUnkfOCaBNKb+22mcshT2mQJjlAl/s6PCSjNZCmQmSJ
 Nvu4OnvfwVwWx2gLk5e0aYdbK54h6AfotgenFxEw7ZWCCwfQKE5It9RyPSw8MH45jQUy
 OJ4A==
X-Gm-Message-State: AOJu0YyDbvN1U1fTi6t50f/8UUKf14h4lMxMIkh+h8aPuDSVG32eRySY
 oUWjblSPRjqjIsFVHtV75TN24k5rKmKq64ieC8+iSqivRObYprlm9+K/1y0g1B1SWLI=
X-Gm-Gg: ASbGnct194ubeenO8XTamjeKxQrFynWRiu5++5VcNU4vckPuKeCH/eHAMFRdKxvulwl
 IrrFI1TyIUom4ze1DndCU676LJdoL/6rlBUEk1ZgjTCV4Twye1brIB/bx0J43E88elBvq65zSmC
 b4S++8FkAey6ELkgsDVkxt2q+8PzMBLnDmFCfVsfUAtcRF9iGZIWDCz+Mtu7MnT8mk5z9GqnGLf
 ZUoDYVz6+Dvf6boErBAdtyV0000A+20LYK33kpmuvQU4O5DztWxkkgqNkpyr3QJWxR7UrZXnHav
 SwaeLOFj58j4IxvYEKdDSfJ5QlTb5gZKzcv13ll+n9vVWzSpDmcjse6iJdj3AU6ZIJmrv7nZOUf
 ZOvFaLpWm+ID+nXjADzeeAnoOyBM8
X-Google-Smtp-Source: AGHT+IFPpkLSx8g3Nm3wtO7Vhs22L+fME+iXuR9KOlLYaezmKLhwkiSEg+Pcv/gcm7tCEEDmbIuCSg==
X-Received: by 2002:a17:903:2289:b0:26c:5c03:678a with SMTP id
 d9443c01a7336-26c5c036965mr135609065ad.9.1758567213893; 
 Mon, 22 Sep 2025 11:53:33 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 62/76] target/arm: Load gcs record for RET with PAuth
Date: Mon, 22 Sep 2025 11:49:10 -0700
Message-ID: <20250922184924.2754205-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 462c61032b..aae6dcd548 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1898,7 +1898,12 @@ static bool trans_RETA(DisasContext *s, arg_reta *a)
     }
 
     dst = auth_branch_target(s, cpu_reg(s, 30), cpu_X[31], !a->m);
-    gen_a64_set_pc(s, dst);
+    if (s->gcs_en) {
+        GCSInstructionType it = a->m ? GCS_IT_RET_PauthB : GCS_IT_RET_PauthA;
+        gen_load_check_gcs_record(s, dst, it, 30);
+    } else {
+        gen_a64_set_pc(s, dst);
+    }
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
-- 
2.43.0


