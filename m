Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981AFCA0EED
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXeG-0003sp-A1; Thu, 14 Aug 2025 09:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdh-00038r-01
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdX-0005Ll-28
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:04 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76e2ea94c7cso876264b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176693; x=1755781493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=219p0B6WHxgpAXzKUyAECcJImn3r2+0sic49ayh7Cg0=;
 b=i9p7wBRM1+NmWgHFCBEHwuLIHbDF5+QXBtl+UrQc6wkS3kt11Xdgcc3th/DJlB8IpL
 PngzD0659KHjDthUNdf4OmkLwA/a/CuQuiZd7Ct4s9OjDzWG42+d9uX5cSb+YAEiXux/
 gV2szy/ghFTJugr0KCgTxtn0wImlWKjyu/4ODmT28fDryMcrZ6r1fz2XsD2jHXt+ysIP
 TIuOMnBCzPWiQetLuhEfBDSITpFApGtvHCCCSRXTcv1f+d7AmjUT09lNC/zuRWdh+h+F
 dHkA0vc7XgtdcjKu2PCZIooG/CJY827dEPa47pB9wSiPPxYccnVRS02lVClXPF+LZGOe
 2MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176693; x=1755781493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=219p0B6WHxgpAXzKUyAECcJImn3r2+0sic49ayh7Cg0=;
 b=RSHJhu5FKyck2vK+4+QpPeImAMTH4sIPZjThxCkgTrR/eOq/ie4uYsZn7QrDG1PtRe
 vB/fRRp9vJ1qv8r3PmKUsNI/3eSeaspSfeE3o67LYdJi78zsrpL1hA3f2jaEN3PVzZj/
 diXCxFsDjtsknPX6yJAfYN31nuA3lJYN7kbpuhbnwiTtL/HcEVlIaoG/p3bQYf6mVrGd
 w+xWXzB5apQ/kBDrmQXlw8BL4+NulLaxrOOYFbxhW4ciyo20RdyVkpSsKebXpRBkJLx1
 4hv3MurmvO878EqeloneWUbh6nxUuNPwUXFd35Vp8nxFr6pw0PsKG7vkqgSG05FD63n7
 xf1w==
X-Gm-Message-State: AOJu0YyNcrOe8YwRrDW67I6TmdCptOrcRk5Mff6CXFndPjvI+OWRHggw
 f6k2ldYQma6MeYmQ9YgI4YWpeQnxRbwiT6oLc6Cyfsg93fcu1pfVKPISwgTe8eNv2QWfuxnLAP2
 43ImATrE=
X-Gm-Gg: ASbGncuuDchQpkSHSvM0s/8VHHeZsF1Ym3Jxt7YmBvLHQJNuYV+Cm2lj9e7gjebSdEv
 AutHIxnyY01jlXOx4E+1zxNFPE8gdCIs2LIuGsli4I3jLTV6g6pWX8cVBWtvxEBmGLXmT6V/y4q
 4IB6y202GV+v1Ir9nBYLehjzpZGfttooC35sNU+Vgh4McwTBrl7Jte4p8YmMQefQ+YUPIQgJPmR
 acd3RaHeRcS+9SEXL96+fGt6ORwfH+7+4+rWlDxZtBtoXh1KqDoyv9Wv6wGxbBFev2vbdWEbN7p
 Ymi5baXYOt61+9gpXFyjiGg+CixgTV3d2kuxstHYkSjw44cpsJhP8RXuRNuF4uQWQia3E9ffKHl
 r72ASKbd2/SVpGFjmOhJHr1qqrJ+fEsMTTK53ALf2fBTrMtvSxHAn22G/XQ==
X-Google-Smtp-Source: AGHT+IEfUT04vfTlRAQMmKNWsT43ee2rkhiFL6I8T+q12t3xL+2eqCnDFr7TmUfSsi3z5bICFbkvTw==
X-Received: by 2002:a05:6a00:8c2:b0:76b:ed13:40f5 with SMTP id
 d2e1a72fcca58-76e2fd91a8amr4531119b3a.18.1755176692912; 
 Thu, 14 Aug 2025 06:04:52 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 70/85] target/arm: Load gcs record for RET with PAuth
Date: Thu, 14 Aug 2025 22:57:37 +1000
Message-ID: <20250814125752.164107-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
 target/arm/tcg/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e4a298d61d..ddcfff9041 100644
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


