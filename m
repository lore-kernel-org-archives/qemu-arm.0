Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D41C54EFC
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 11:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wofno-0001Wk-Q2; Tue, 28 Jul 2026 07:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnc-0001S9-Hg
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wofnZ-0005do-Me
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 07:16:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso24624955e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785237395; x=1785842195; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+VC5XlZjOD0If4uBQba9NfUJ8lBSE0okGvUEe+SC8+M=;
 b=sQT+3ouVbvuv6tj5giuRpBKDmh+T8Tu5aWeGFzulT3mA7L2kMVh2y2/nipk8ftsMIk
 dSPtr7nmEN8IeiQeDuH2T5E+9TmF4KPIrTFu6AgMJU+6q06TGpkSnYKG/yZK8U2bDobJ
 n0NNgYjsGecf2VwNVKw6b0uJzddHyZxNFlkms+e6yk+guE/tOReNHkFEbhd7dab6AcCN
 n9dLeb8nDohr08r6fS0bt9KMoX/X1TqCw9jzUBdTshnofAMJlEmsZ38Iz3jD5ZzAx4Eu
 QiaUb0zTgUqexqGKMI0zLZbVZ+QZR4SwQ+2jpf/m+uLEsT8OeF+58GqFbp9Rsg711/Ge
 DktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785237395; x=1785842195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+VC5XlZjOD0If4uBQba9NfUJ8lBSE0okGvUEe+SC8+M=;
 b=KtKZxslGuvElZFE4ZoQP1MQMbxsK3+eJXBqAH0uj0uLfhWYFOiBWOxONSmwg6kGd+h
 Rz7zziKdCLZrIYRQMXEKR0VDW11puf0bMR6R8WChJ+LOnDsizSM73CrvOrYJYSedWXgA
 Y4ixr4Ymh5P5edNVe9BxJJzPriOE7fOvIjd5RTU5qTv2+Sw5zacYeBuxxLEFAruCqqkG
 9+yN3gbvrHrh66auIZV/C6+oZOsnvFhi7SC/qcY4bGzbmKBpuiXaTwYx2zoV5XPRjNA2
 NKqrJbOnJbLypof/2dmoQezw9GjHj5A+Ei55A0R8y5KFG85XmkDdmpmXS9pQ2r5znfOm
 8c1Q==
X-Gm-Message-State: AOJu0Yylx2l0D8qZJieYbu+BBLLKB08YCkyqlssNdxMfWDrjoTB9Eabe
 ir45PeT2jsNtOggZeS4vad4TWkTPjXW2NvoJQK7LOIf9suUheizKz97XffF1B9WuE7ZgfS1s+SJ
 vAVWI
X-Gm-Gg: AR+sD131h3i2EzUx++uiXGWw46+VeKBrQkyiLzLxoI4JHkSwi9Oa0+XJtHFWDnZeOZw
 YfeWtTuxuXveCrXtJRnl2GYYM0TJNwbQL+Arn+INAlyQEThUdlnH3sQPjp5XFAH8v5SvoXBxm4R
 cuVvJgIfd5GVItOCFpbCapFEmJKIzi+qj+1tGXs0jJb04nX3/NMfuL3vxuaQGUt4Sa802VLs4nW
 3IlPlmGVxSiZPFN+ITr+eNnnqpXdOmXoHBtaGCFQQoUcDcbRpf+9yHA+gg36CzoiqKSV832rw5+
 EFzlr5Tl7OuRj2aVrlh3LkiHnLsUpCZU3BhAZcv9Y2u1eA5N5GYku4U9SdM0GQxE1/s5B6STbmT
 NvwvuPXaRiFERwuKSe/l2I9Yr64jNvYvVGyXK/+y5GZihClaFrFDjz4XVO4r6A+v40cEHA2tLxc
 Cjh4Mo9lLtkcyND9KupOsI2ORE3Yc6ua9mtH5mDCfysPNplZH+rBtYZyaIVaT16u6tUdy6T0uaR
 FynAbVO/n4=
X-Received: by 2002:a05:600d:844e:20b0:495:5375:2510 with SMTP id
 5b1f17b1804b1-496c6568a37mr15038315e9.24.1785237395488; 
 Tue, 28 Jul 2026 04:16:35 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b5ed646sm284546255e9.0.2026.07.28.04.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 04:16:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-11.1 3/3] target/arm: Remove stale comment about WFE/SEV
 implementation
Date: Tue, 28 Jul 2026 12:16:29 +0100
Message-ID: <20260728111629.1705308-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728111629.1705308-1-peter.maydell@linaro.org>
References: <20260728111629.1705308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

We forgot to remove a comment about WFE/SEV only being implemented
for M-profile when we added the A-profile support for this; delete
the stale text.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 03a30afcbed..c0492c8dfbc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -766,7 +766,6 @@ typedef struct CPUArchState {
     /*
      * The event register is shared by all ARM profiles (A/R/M),
      * so it is stored in the top-level CPU state.
-     * WFE/SEV handling is currently implemented only for M-profile.
      */
     bool event_register;
 
-- 
2.43.0


