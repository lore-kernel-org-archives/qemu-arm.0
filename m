Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F94CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:33:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlYm-0006tl-Qc; Wed, 20 May 2026 14:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYl-0006p1-3a
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:23 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYj-0000Tz-25
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36a3aff302aso382765a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301339; x=1779906139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTOHTZtbLNgNOJvES0sHS6aWgPQHY2/QJQuHdbaHCMc=;
 b=UyKSV8O5PR+Lg0uyatCnfv/lpD/iY13KqlcI1t1g7a8BWrxrrJ0M+cKXqU2p8JeuMO
 LIegXqaXvNPB+EPdNiqJGJRacxMlI4xVLvSTxjsaWQSXeIBKfDIWErqXYv2wnB/5FDRz
 rSNoAOAgHIQszgIEln/x+BGhCmx5oRk+OXOnshB8G9nK1pDHKfWGKLA9yR2xFePNrEeR
 HoAgLo7qsC4GT+Jud9GtmTFqEStppBsg7qMTyn5trAp11epCPQ2SINwB4u2grrQYSIFJ
 aVV3NTy445Z81OQI6f+gTALA5nUX8bZqWgjXDGsXAkltWkhFn8uHY74NJ6pWn8nyh8gz
 xWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301339; x=1779906139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VTOHTZtbLNgNOJvES0sHS6aWgPQHY2/QJQuHdbaHCMc=;
 b=O3iBhUnwYX3O6bUyDfHimCBJWJL9yfr0ZtJ2LgeKgfg/x8GSlCkZrjipmdIZGenGvh
 ALIOXt8Umt92HK9xnUWvTzgx6L2GXfbr/QxNFGQnNTbkgGccoWCEKQF41FeQESei/Egm
 mvkOyY3bfeTPxsRxRU6o8TDL1VSdKG+uOPShxCv8xMrj+k5xBPgJDl1O17wOX+Y/OrK0
 2O2To8reMjFqJ41D0L9frEEuRXKsFlVcgfkxD+4usDMOGze+HgpubV5rpSxx6b77laBr
 OU9S7Tn6GgoXJu7lDqZAoAZj9/QnyEhGxBwo/v5q2VrfU1ybS4r8engvKjgdrqT+/f3/
 p37Q==
X-Gm-Message-State: AOJu0YyKQDc8IqLgX1p8swDONBH392ezESxsiEr5hOYB6msONm/hOKug
 CbjF+MaFg9iX3SoIXTeRIn9USZ+YqGO6JrW08MXayYfMzBZdD4KMED8MESYcJUF8HrREsbSL6o/
 oJ54J69Q=
X-Gm-Gg: Acq92OGWSIjErRI70lHrdqk1IFAADZFzSDM5Ug3J67NxR+SwetYrLpfbd5PUOIV24Np
 KrTvLA5h9hO0r8x5UC+VDVJO8jmTo1Y6+qgbRzAX9gfEHq/lejYpDkf6te6dHHbxWbEBR+oPXDx
 1r38NKtDz+KfJnaCMN2gCzoRTd0vtYpf8viS6mn54spJIGVXormb0hAyU9fmv08URQQ9pr0tTka
 logsevFNt5EUw/xNVwDvoLKtuWLsp4vkctyqT8x0E5Zf1u9mfd2gfq+nTdhFTx0bqt0ME01dn2B
 Mhyvx8BTsmHWXzQTIINo+k7eiv0lkpLb/84BlcODjcVFGXJoWgitQ9En+WiqO5ryeiY+F5+j1FS
 reBnAnh6vbEAVYK909So5RkGK0gw+44P+iMlyAj8hLfq5lNHivauFZo+/kUNoWJI5BZwYcysejW
 9r3eKh2mljduHnZBcBaxMBcAIhjhCf
X-Received: by 2002:a17:90b:1344:b0:366:4782:138c with SMTP id
 98e67ed59e1d1-36951b971ccmr26021323a91.17.1779301339380; 
 Wed, 20 May 2026 11:22:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 07/64] target/arm: Update HCRX bits for Arm ARM M.a.a
Date: Wed, 20 May 2026 11:21:16 -0700
Message-ID: <20260520182213.872945-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00830b1724..f02d3c6a71 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -258,7 +258,9 @@ FIELD(VSTCR, SA, 30, 1)
 #define HCRX_TCR2EN   (1ULL << 14)
 #define HCRX_SCTLR2EN (1ULL << 15)
 #define HCRX_GCSEN    (1ULL << 22)
-
+#define HCRX_ENFPM    (1ULL << 23)
+#define HCRX_PACMEN   (1ULL << 24)
+#define HCRX_SRMASKEN (1ULL << 26)
 #define HPFAR_NS      (1ULL << 63)
 
 #define HSTR_TTEE (1 << 16)
-- 
2.43.0


