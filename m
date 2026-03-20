Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E11098782
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:09:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYU-0002uA-C9; Fri, 20 Mar 2026 09:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYR-0002rQ-Rc
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:19 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYP-00060g-RE
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-660a58841d4so718012a12.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011975; x=1774616775; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gZF+bbO9K4Nyw/s2cHUG02dtJK9FnQPhbnaHyWdihg=;
 b=zzN6wJpQEMUGKo0pVtofPPYP0VhSe9KPV/mJlqRALbmEmS/WLMu8T7Mr6s5fCaQUFm
 Bg4E6jONbknGn0RDcabMYmueGbYAvkrGNJwM3OLKaMQZAoKmpr9WgdG8Y5+zjHu7ddyl
 knNKd50yMW0vtZF5ip38EKxuA130Vf9IlSi/l7dJOQtyzvoUNzdPMnESjok0MrAbsPGI
 4cW/5Jf/q/P58O79s56+UrriUnPFhbCfEJXCQCT63ghvBRKv2iZYqNeL9Zxd1+6PTx7J
 sBbIHMiH9WmuiZxrUfpzIWapURyrOT0n0mriNevHPCGc+XTbo2OlcqvROSH9/NmSbUxc
 +Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011975; x=1774616775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5gZF+bbO9K4Nyw/s2cHUG02dtJK9FnQPhbnaHyWdihg=;
 b=fwaSyyO4S+vkAEpKUAx6azE1UOLXD5l+k2DZp12jqWh0p6zDmsTVvpXGluTz5ATLHx
 mjjzYY5LyQWY7cRAn+HFsTEnlZHqNpEEg/FmBBdna2jnWrwNDUvNCd55SOmLtENiYeRg
 sl2/Md7EzakziArJIFZZdcUUfXfsBsnYIUcA10WFclls69u43loCpn73CaK0ZK24wNJ0
 gei8Bj0F8uuN3wsiPy1eKjQRiuqdt0Kqg18WEiJ37eVhB7orKKBt3re1OvTAxtWFFT63
 4k7ZGDSy7dUWgTjrB8Pm4S7ICcNSSz3N1r+MbPlycwjiqVRCN+WBAnMeI1iuSihLSQ5H
 DYYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2mzmLEk0jI2+SSiPISpgUD911PWp9oV6dgdiuBrwtG9ZaGRI6MJkGOAVjQRa3zdQ1PYAVCViCLQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz7iotCgdQ0cNF+eEBjcALdwzhF2SqjJGAXUBaYfgEpUiZDaEJy
 xwQvvLdNjUe5JgaNtYR5nZnP3sFo2nt4tSx9Xv8ecl9a77g92Oteov5oWEEgz0OP6aAZz5QTTUU
 rJRBuCnc=
X-Gm-Gg: ATEYQzwdFYH4MJwjKAlO7UECiVhQWne3YGoxttHJYORhmVqBH6JvOKOCGrbi/RXaDzK
 DcbjJMJsgI+xSTWkZuU8oDeQcyr0S+9Ex1Kru4BABV5j/b4qA0sRzptO0EcQLWLOSScVx06HLRq
 j03JRicOBWg8beJFmGG/I8bVUl2vJooa1+v+rdDyw1W4T8bGT0fsR8lA0XQ3Fi/VM7COw1NQS5e
 s/zgiFgsKWoZEGAg9sugTVgOoxl90xBd1axbDt0vNrLRyGJDF8rUe1qCY4z0OIRjkQMK+EubBDV
 46VH9G+2UnOinGT8VL1sVAl03V2Jxt4dJV4P3ieUeTzZujQ1xUVqfycfONXvM0d/gKgR/htXDyE
 5LEL2PhWXWbctW2k/s0mqNDjfWBNbvlY/mNrIdcivBqDor3225Artr7RhEqqTEWlnKW3a0dq4Xo
 o7fCZQLcUvh7qAYDuMbmqUll3YQjwUwLO4fw==
X-Received: by 2002:a17:906:8a77:b0:b96:dec7:5209 with SMTP id
 a640c23a62f3a-b982f242bf4mr137318566b.17.1774011974772; 
 Fri, 20 Mar 2026 06:06:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b983387103asm156572266b.57.2026.03.20.06.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 463675F94A;
 Fri, 20 Mar 2026 13:06:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 09/35] target/arm: migrate Granule Protection traps to
 registerfields
Date: Fri, 20 Mar 2026 13:05:40 +0000
Message-ID: <20260320130607.2071996-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index fb86e7bf6a8..3fd82f5b565 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -462,12 +462,36 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
     return res;
 }
 
+/*
+ * ISS encoding for a Granule Protection Check exception
+ *
+ * These are only reported to EL3
+ */
+FIELD(GPC_ISS, xFSC, 0, 6)
+FIELD(GPC_ISS, WnR, 6, 1) /* Write not Read */
+FIELD(GPC_ISS, S1PTW, 7, 1)
+FIELD(GPC_ISS, CM, 8, 1)
+FIELD(GPC_ISS, VNCR, 13, 1)
+FIELD(GPC_ISS, GPCSC, 14, 6)
+FIELD(GPC_ISS, InD, 20, 1) /* Instruction not Data access */
+FIELD(GPC_ISS, S2PTW, 21, 1)
+
 static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc, int vncr,
                                int cm, int s1ptw, int wnr, int fsc)
 {
-    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
-        | (ind << 20) | (gpcsc << 14) | (vncr << 13) | (cm << 8)
-        | (s1ptw << 7) | (wnr << 6) | fsc;
+    uint32_t res = syn_set_ec(0, EC_GPC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GPC_ISS, S2PTW, s2ptw);
+    res = FIELD_DP32(res, GPC_ISS, InD, ind);
+    res = FIELD_DP32(res, GPC_ISS, GPCSC, gpcsc);
+    res = FIELD_DP32(res, GPC_ISS, VNCR, vncr);
+    res = FIELD_DP32(res, GPC_ISS, CM, cm);
+    res = FIELD_DP32(res, GPC_ISS, S1PTW, s1ptw);
+    res = FIELD_DP32(res, GPC_ISS, WnR, wnr);
+    res = FIELD_DP32(res, GPC_ISS, xFSC, fsc);
+
+    return res;
 }
 
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
-- 
2.47.3


