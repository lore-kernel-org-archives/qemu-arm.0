Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CCCCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4hN-0000xi-Au; Tue, 26 Aug 2025 21:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hG-0000an-VO
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:31 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4h5-0008V8-FH
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:30 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76e2e6038cfso7073828b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257072; x=1756861872; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWXxySCaWO9RB9p0qC7RXW2uKnf/vMpCtWd3L9+6QNU=;
 b=VzYiffNBM6Bd1kJHNOrnWuXi650dX8UfhLr5trDIJ1DtDBIQjlSWOU1Tw9xzxVXAJE
 j+fD2bytxiqspX1DDdJ86xQrH4X++KDs/vVHqf5kUyDb4xTHjzo9DDfrZQMTO6JprajL
 x8x44rZUXqMcGz+l54q0M+rHTRRvriWwgkXYihJBr8jlO71abhC3jVpTPwMAilBJ25AA
 OzzFsfxVBWwxT0RY3PXdEylS+y0dTwC/xmPfGdu8nBFFPSmyJ76uEsErNLLKffapjspw
 K1w5oNcKXO4SvlZ8ZML7i3hgEnHyAmwPiI16M4k99HWtNX8RAZXKiUoXj588wn4UXxa1
 vtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257072; x=1756861872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UWXxySCaWO9RB9p0qC7RXW2uKnf/vMpCtWd3L9+6QNU=;
 b=FM0UWRo8Uj0q4gbNX0nITTi/oeSWEd/PgV4WzpX9iNKv7DIva9yZRc5OrcTZAboC6T
 jUJUedXJHpJ0QbXsD050zpaWAuNhlQ8UtdLSHgD1Y2YhSSSfuZ1vfeIHWxuOZsmfT/b3
 GjhK0FDHOtRjCQqFWllYALSNsNvIgulj2MmV4rIbsrTEgb0iAK039zFW59sWtC+du2wl
 4jrRvgj/8rxnwhelEjEKT4g0p/N9oNtrPXr3mPqB5YyyNTZhe2qtxjqUJcUSgsJ2UZlX
 X9LPyBdBQ5yhicE0BbkJNhWww4H7vn5hdzkvVq3kmAD3hc8H43A4YonAMJXqKu3sP8wD
 SaWw==
X-Gm-Message-State: AOJu0YyQHUsAFTGj9W7k9kd5NiC5CPSfdb2SWvWkRHmJIG+d8YwWL8an
 fYML4d8/esW/vaQJ6PjZJLE3l2qZKSWZWNFdaI3hjFc/L3gBKWs/mnNzYLSjakprBbtUDBMje0R
 JBldKAUM=
X-Gm-Gg: ASbGncvyXSe8ZO5yyljlP2o9E0viwIGRUOP9PvMF8NO70LQw7/1xj+KTVZKzZ8nfyUm
 ybhCwa9JwuASwRik9AMiniWfHvmDu5LRZOdewPEcHksCSu3mUChDWKcaV+vLUc/3po0Bc6TanVl
 uXolb4aMEh1dbSWDLNqMBllsf2IkmxkvsswPdW4/vKfuAdhdh/BEpFyU9z6ihk5cRHgaHt3VYBc
 UnMY+4JW/pzTXnnlfBrv3c79LmNETlCZkiUgjYw35EOGm+6kbVZEHb+rfiUBda45YD3yMq3YeJP
 cPr+3q8fBM0AELAWuTD+ViP3W1paWMAFwNpIcJoUGhk38Jjc+drRxspIsLo6V99CquC37vgwQc/
 LkaRnm3nCIpXCDQ3SMVJBm3Fcuw==
X-Google-Smtp-Source: AGHT+IHQAmWka4Z+TG8sCOr9qVs6iCryeuT9nZUqKusycp7HdUuh6pWWx9EJIsukT22hOukl7Qis7A==
X-Received: by 2002:a05:6a00:759a:b0:771:fdd9:efa0 with SMTP id
 d2e1a72fcca58-771fdd9fa11mr3668764b3a.15.1756257072293; 
 Tue, 26 Aug 2025 18:11:12 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 40/61] target/arm: Assert ARM_CP_128BIT only with
 ARM_CP_STATE_AA64
Date: Wed, 27 Aug 2025 11:04:31 +1000
Message-ID: <20250827010453.4059782-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 64a987d143..3b765408f2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7353,6 +7353,11 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
     assert(r->state == ARM_CP_STATE_AA32 || !(r->type & ARM_CP_64BIT));
     /* AArch32 64-bit registers have only CRm and Opc1 fields. */
     assert(!(r->type & ARM_CP_64BIT) || !(r->opc2 || r->crn));
+    /*
+     * Only AArch64 regs are 128-bit.  There is usually an AArch32 64-bit
+     * alias, but must be defined separately due to encoding conflicts above.
+     */
+    assert(r->state == ARM_CP_STATE_AA64 || !(r->type & ARM_CP_128BIT));
     /* op0 only exists in the AArch64 encodings */
     assert(r->state != ARM_CP_STATE_AA32 || r->opc0 == 0);
 
-- 
2.43.0


