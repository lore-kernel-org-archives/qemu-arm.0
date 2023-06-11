Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1372528ejb;
        Sun, 11 Jun 2023 02:04:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UokuoLic4de1n48jaKomw6Rdr2if+92FIkCBlU99QDVkzCBjm3dXEQU7hwx3bPA0G+V2V
X-Received: by 2002:a05:622a:14cf:b0:3f6:beb9:c856 with SMTP id u15-20020a05622a14cf00b003f6beb9c856mr7574294qtx.2.1686474276989;
        Sun, 11 Jun 2023 02:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474276; cv=none;
        d=google.com; s=arc-20160816;
        b=zxiWjO83GT4NZRT/nEGBIv50mkh4031i+hbDUhHjjk6kgNfMc3SNUZ6bj+oCGcm5Vg
         g2jmY4eBiKwDFEbmh5xrKxMrxptea/a5/fSMidmx+MFF49klKtgbpzTM5Giaj05ydH0W
         Zb1TeXNfR4KGIp5KfXu/FORaNQIbR/OX+wW0XDniJz1v4J1v+ZFquzv/fOyoVbBwvIXR
         Xglbl4DFk9zBWu6ayJB1ml4vcNH5/VDe9CKREODnRApQFaKKvy4sg6jEYT0vxFZ9Jy5n
         /yWBjuMVrOxQ+MqeJzAeIaSHnBynb62du2smPCrOKdQKQfb1Zb2dJ9CWBtcKfiWnwwF4
         tcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lhArNuatDNYVRkaFGuTDa+3jxPD4OXoWAoXbKpvzLCo=;
        b=M3+upIso+xKBOD+Dso/IfCTFNxfYgP2lZvyzksD7NJQN5XiNtYn9Jsfr5uYjt92Qgl
         1qIgLF8/sEvoD4dAtWabsALKjBpjiBvHNEZ9fNpI/JosLB/1xfFZhwICZG4K23sSAi7r
         4P6hT4QWlqz7ynp0CU4H2Ka3ZKNUMkXLLRf05589M7F8n8ifC9NOnpWr1BNpEtFT9UI5
         FT+ifTOuCwtVEzQckQX6iwnNHDoXz6qckdm+ywyRBnQMH9vZ8a1VA3P0Xw4gwiiDMlx9
         t+DUz8qqYb/0doCpcA8wnnapZhSkX0Cvpo/UjATYMMbxHRWhNlQ/HlGtBKI6XJfMvsCn
         Y/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMss+rIB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020ac85b8a000000b003f6c609e9edsi4528674qta.367.2023.06.11.02.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMss+rIB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8Guq-000115-1q; Sun, 11 Jun 2023 04:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Guo-00010g-Dm
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gum-0003bG-4U
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f732d37d7cso33009385e9.2
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473951; x=1689065951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhArNuatDNYVRkaFGuTDa+3jxPD4OXoWAoXbKpvzLCo=;
 b=GMss+rIBawtZjCfSBvdNhPQRr07FdGcZx/JPisnEOG0MdtfygHFbKD35Iw0jFmPP0z
 M5MDxh54VshDK0m+QebZeP+dyD9w4Rqi8Qb5BTstaaWFvZVXpjWf2tV/q6cgIRiNb7fQ
 PWO9OJJS/xM6jvdE6M0UEjPI6Hyr1kpV7yMHRxiTO9Mt0ZrX6I/VcoBO4fMRb83ELWdu
 X1DmrRD8Aasu9oLbPICX5H+o07T52QSFLRn64a/k32s/auaOC9g5XuK/6F2YfHiBH/a5
 vXCV1V+Urdp4UtpGCzGxXuL41s2pDA9lM/haNGl9mo/XWfA4/isSxTmkRLjhS9TKAURu
 9yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473951; x=1689065951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lhArNuatDNYVRkaFGuTDa+3jxPD4OXoWAoXbKpvzLCo=;
 b=Y+PSA30+IPR+kUEVvqBDKwgxRlY2S8tx5BQ0LAdu3IT7lXX3+idHTZtpfrAHw4rTdM
 umdhj9TreOBzX0QvUTM31vWVoEz57aYnxeJBqTiEh1q6KKvcMmPv3fOb9tLyKKeo4bdD
 aVLZRN1WHpP6ejHF8dCf0AooAKDLY4Go87KR2VcQQsJ8kcMKpTC7Ar9UM0395zTY87Dj
 V8KQbzjjImuR8jFfQcLBMLg3rGaRUR5E+bVZrgaBGz1DzjOO1LsyxZ5AYMqfOuBFyXV/
 pWiko/unPQ23p+knJvwMBwKaMoDba5QpX7whc9islbUXlC5zcuD6H8TkrrTnr+sKHXP/
 1vcQ==
X-Gm-Message-State: AC+VfDwx6aGMccKtLP7M5UTtbpu3QI9jwYXgfoP8ZpsXs/4WZSaLYgBn
 J5uN9+10Wp60LK45G+64bT0i7Q==
X-Received: by 2002:a7b:cc84:0:b0:3f7:3545:4630 with SMTP id
 p4-20020a7bcc84000000b003f735454630mr5110867wma.20.1686473950205; 
 Sun, 11 Jun 2023 01:59:10 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 gy15-20020a05600c880f00b003f7f475c3bcsm10193970wmb.1.2023.06.11.01.59.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/26] target/arm/tcg: Extract iwMMXt helpers from the
 generic 'helper.h'
Date: Sun, 11 Jun 2023 10:58:25 +0200
Message-Id: <20230611085846.21415-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2zvmjO1Irxep

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h                |  96 +--------------------------
 target/arm/tcg/helper-iwmmxt.h.inc | 103 +++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 95 deletions(-)
 create mode 100644 target/arm/tcg/helper-iwmmxt.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 4218d98b51..c4a321c0ea 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -445,101 +445,6 @@ DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, ptr)
 DEF_HELPER_3(neon_acge_f64, i64, i64, i64, ptr)
 DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, ptr)
 
-/* iwmmxt_helper.c */
-DEF_HELPER_2(iwmmxt_maddsq, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_madduq, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_sadb, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_sadw, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_mulslw, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_mulshw, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_mululw, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_muluhw, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_macsw, i64, i64, i64)
-DEF_HELPER_2(iwmmxt_macuw, i64, i64, i64)
-DEF_HELPER_1(iwmmxt_setpsr_nz, i32, i64)
-
-#define DEF_IWMMXT_HELPER_SIZE_ENV(name) \
-DEF_HELPER_3(iwmmxt_##name##b, i64, env, i64, i64) \
-DEF_HELPER_3(iwmmxt_##name##w, i64, env, i64, i64) \
-DEF_HELPER_3(iwmmxt_##name##l, i64, env, i64, i64) \
-
-DEF_IWMMXT_HELPER_SIZE_ENV(unpackl)
-DEF_IWMMXT_HELPER_SIZE_ENV(unpackh)
-
-DEF_HELPER_2(iwmmxt_unpacklub, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackluw, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpacklul, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackhub, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackhuw, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackhul, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpacklsb, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpacklsw, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpacklsl, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackhsb, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackhsw, i64, env, i64)
-DEF_HELPER_2(iwmmxt_unpackhsl, i64, env, i64)
-
-DEF_IWMMXT_HELPER_SIZE_ENV(cmpeq)
-DEF_IWMMXT_HELPER_SIZE_ENV(cmpgtu)
-DEF_IWMMXT_HELPER_SIZE_ENV(cmpgts)
-
-DEF_IWMMXT_HELPER_SIZE_ENV(mins)
-DEF_IWMMXT_HELPER_SIZE_ENV(minu)
-DEF_IWMMXT_HELPER_SIZE_ENV(maxs)
-DEF_IWMMXT_HELPER_SIZE_ENV(maxu)
-
-DEF_IWMMXT_HELPER_SIZE_ENV(subn)
-DEF_IWMMXT_HELPER_SIZE_ENV(addn)
-DEF_IWMMXT_HELPER_SIZE_ENV(subu)
-DEF_IWMMXT_HELPER_SIZE_ENV(addu)
-DEF_IWMMXT_HELPER_SIZE_ENV(subs)
-DEF_IWMMXT_HELPER_SIZE_ENV(adds)
-
-DEF_HELPER_3(iwmmxt_avgb0, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_avgb1, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_avgw0, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_avgw1, i64, env, i64, i64)
-
-DEF_HELPER_3(iwmmxt_align, i64, i64, i64, i32)
-DEF_HELPER_4(iwmmxt_insr, i64, i64, i32, i32, i32)
-
-DEF_HELPER_1(iwmmxt_bcstb, i64, i32)
-DEF_HELPER_1(iwmmxt_bcstw, i64, i32)
-DEF_HELPER_1(iwmmxt_bcstl, i64, i32)
-
-DEF_HELPER_1(iwmmxt_addcb, i64, i64)
-DEF_HELPER_1(iwmmxt_addcw, i64, i64)
-DEF_HELPER_1(iwmmxt_addcl, i64, i64)
-
-DEF_HELPER_1(iwmmxt_msbb, i32, i64)
-DEF_HELPER_1(iwmmxt_msbw, i32, i64)
-DEF_HELPER_1(iwmmxt_msbl, i32, i64)
-
-DEF_HELPER_3(iwmmxt_srlw, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_srll, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_srlq, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_sllw, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_slll, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_sllq, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_sraw, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_sral, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_sraq, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_rorw, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_rorl, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_rorq, i64, env, i64, i32)
-DEF_HELPER_3(iwmmxt_shufh, i64, env, i64, i32)
-
-DEF_HELPER_3(iwmmxt_packuw, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_packul, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_packuq, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_packsw, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_packsl, i64, env, i64, i64)
-DEF_HELPER_3(iwmmxt_packsq, i64, env, i64, i64)
-
-DEF_HELPER_3(iwmmxt_muladdsl, i64, i64, i32, i32)
-DEF_HELPER_3(iwmmxt_muladdsw, i64, i64, i32, i32)
-DEF_HELPER_3(iwmmxt_muladdswl, i64, i64, i32, i32)
-
 DEF_HELPER_FLAGS_2(neon_unzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
 DEF_HELPER_FLAGS_2(neon_unzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
 DEF_HELPER_FLAGS_2(neon_qunzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
@@ -1044,4 +949,5 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
+#include "tcg/helper-iwmmxt.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-iwmmxt.h.inc b/target/arm/tcg/helper-iwmmxt.h.inc
new file mode 100644
index 0000000000..955ab2365b
--- /dev/null
+++ b/target/arm/tcg/helper-iwmmxt.h.inc
@@ -0,0 +1,103 @@
+/*
+ * XScale iwMMXt specific helper definitions
+ *
+ * Copyright (c) 2007 OpenedHand, Ltd.
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ * Copyright (c) 2008 CodeSourcery
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_2(iwmmxt_maddsq, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_madduq, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_sadb, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_sadw, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_mulslw, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_mulshw, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_mululw, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_muluhw, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_macsw, i64, i64, i64)
+DEF_HELPER_2(iwmmxt_macuw, i64, i64, i64)
+DEF_HELPER_1(iwmmxt_setpsr_nz, i32, i64)
+
+#define DEF_IWMMXT_HELPER_SIZE_ENV(name) \
+DEF_HELPER_3(iwmmxt_##name##b, i64, env, i64, i64) \
+DEF_HELPER_3(iwmmxt_##name##w, i64, env, i64, i64) \
+DEF_HELPER_3(iwmmxt_##name##l, i64, env, i64, i64) \
+
+DEF_IWMMXT_HELPER_SIZE_ENV(unpackl)
+DEF_IWMMXT_HELPER_SIZE_ENV(unpackh)
+
+DEF_HELPER_2(iwmmxt_unpacklub, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackluw, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpacklul, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackhub, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackhuw, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackhul, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpacklsb, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpacklsw, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpacklsl, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackhsb, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackhsw, i64, env, i64)
+DEF_HELPER_2(iwmmxt_unpackhsl, i64, env, i64)
+
+DEF_IWMMXT_HELPER_SIZE_ENV(cmpeq)
+DEF_IWMMXT_HELPER_SIZE_ENV(cmpgtu)
+DEF_IWMMXT_HELPER_SIZE_ENV(cmpgts)
+
+DEF_IWMMXT_HELPER_SIZE_ENV(mins)
+DEF_IWMMXT_HELPER_SIZE_ENV(minu)
+DEF_IWMMXT_HELPER_SIZE_ENV(maxs)
+DEF_IWMMXT_HELPER_SIZE_ENV(maxu)
+
+DEF_IWMMXT_HELPER_SIZE_ENV(subn)
+DEF_IWMMXT_HELPER_SIZE_ENV(addn)
+DEF_IWMMXT_HELPER_SIZE_ENV(subu)
+DEF_IWMMXT_HELPER_SIZE_ENV(addu)
+DEF_IWMMXT_HELPER_SIZE_ENV(subs)
+DEF_IWMMXT_HELPER_SIZE_ENV(adds)
+
+DEF_HELPER_3(iwmmxt_avgb0, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_avgb1, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_avgw0, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_avgw1, i64, env, i64, i64)
+
+DEF_HELPER_3(iwmmxt_align, i64, i64, i64, i32)
+DEF_HELPER_4(iwmmxt_insr, i64, i64, i32, i32, i32)
+
+DEF_HELPER_1(iwmmxt_bcstb, i64, i32)
+DEF_HELPER_1(iwmmxt_bcstw, i64, i32)
+DEF_HELPER_1(iwmmxt_bcstl, i64, i32)
+
+DEF_HELPER_1(iwmmxt_addcb, i64, i64)
+DEF_HELPER_1(iwmmxt_addcw, i64, i64)
+DEF_HELPER_1(iwmmxt_addcl, i64, i64)
+
+DEF_HELPER_1(iwmmxt_msbb, i32, i64)
+DEF_HELPER_1(iwmmxt_msbw, i32, i64)
+DEF_HELPER_1(iwmmxt_msbl, i32, i64)
+
+DEF_HELPER_3(iwmmxt_srlw, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_srll, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_srlq, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_sllw, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_slll, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_sllq, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_sraw, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_sral, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_sraq, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_rorw, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_rorl, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_rorq, i64, env, i64, i32)
+DEF_HELPER_3(iwmmxt_shufh, i64, env, i64, i32)
+
+DEF_HELPER_3(iwmmxt_packuw, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_packul, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_packuq, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_packsw, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_packsl, i64, env, i64, i64)
+DEF_HELPER_3(iwmmxt_packsq, i64, env, i64, i64)
+
+DEF_HELPER_3(iwmmxt_muladdsl, i64, i64, i32, i32)
+DEF_HELPER_3(iwmmxt_muladdsw, i64, i64, i32, i32)
+DEF_HELPER_3(iwmmxt_muladdswl, i64, i64, i32, i32)
-- 
2.38.1

