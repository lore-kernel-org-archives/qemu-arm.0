Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDF4CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWx0a-0001Xg-EG; Tue, 09 Jun 2026 10:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx08-0001Nl-By
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx04-0004L6-Vj
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso46117215e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781013615; x=1781618415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6iBqkCYiyl5D8uBMcKjgcxdyXOp0r9iUyHGqKgmXpw=;
 b=f44przDpdms0csOf9x1FilxwugOfX2aphMSiaT9Xw+LVXTXFogdQCvkrJ//98qQyOd
 8lfkaiYznxJEj5JuOH5d7T+qwvS3l/M3wIz5Geu9UIA5q5LB+ryAk/mhOq1MM4euU8j+
 Z3VD3dn9dA7dvI0G0p0HdLMVxBiwkHKxZM7GfQ7FDprrZ44oSr51Ty9xxGPMp2XjomJ5
 7CDs+e5fmr4UMcZW1UKLbvsOdlP9td1crD+vWLZPicnZoCoboxslvue3l+L4Q0RUw21V
 jcOobiD3MlIjB7puF+JiyyCWbnLxZVQatUezYGcds9srJfajfxFTV+WYDL3sxRxWuxzi
 YVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781013615; x=1781618415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E6iBqkCYiyl5D8uBMcKjgcxdyXOp0r9iUyHGqKgmXpw=;
 b=fOb3BhyG4xXFrSDYMpMGGY53jnqW4fg+0huFuQH8ut33ocgqtglWPwT1qCOfVKhrTw
 VNjXL6vTyPVxbjr0MBXeNCB3VFCWAgkWIUJToBekT6vtGgSFqk4OHS5uYdQ6rT3nzNRM
 d96ESfCqND/2uDlI4HcxA0qqKiCDVRwscaK6TEF+Aj+AEROFGPoNqc79nhG27pNvRURd
 BVRtaXp4V6jV4YM9RQUHXJKRc66lX3G/C/lvJnBY2VahPKqh7Rul4k+qSbZJfFRZj8XP
 ycHG0u5uHkiZtsjWkNNljuuVgIE741wUIjgEXVw562PoPMtBeyT7HP/6p7SVRQjCnj+i
 36jw==
X-Gm-Message-State: AOJu0YwUxobNLhXkB7X6G795E3JxTH75H86d9pfMaaAvDo14YWkqcXrK
 9GqWs+uycecQrphtaVI0qvxgYtaEanWTACGBGtpjYuoZqEYf5ktpkPPj70cjMRvk9xA=
X-Gm-Gg: Acq92OFhvl8jUMt8VL8ORL1rqlWga/ZeCi1OEAeqsq2kgpgwy7XJ0OjAyPXymXTBc4I
 LR3/u659bwc5GPnxSHS9H+j1O+kvWmtzDDPByMDlDiAGXmDBpu2F2lAujugYJzNASZfxDwDMlZn
 L98C/XyQa2C/KUjmHfAw/2dbQoCpySukDkjZsz7S+2tJ1aMvdRc1Fa/JVTtEy9Di5ktxMByX2hz
 uXmFfLIEnWq33J77fGBdFIMpniL34zniRPjlJV+8sWf9SUQKgTVXXm4JTHlPTPUNvExz3Bks9V2
 GNw4IzMcdPmgDZZ636diUizpqsn8QZ0MIvOwmqMQkEUMrYnZjZeeUT0YRyMR8uBHPBOGB6XX+3D
 2sRnx9VRzIZkehJnwRFYv/vwg4TP1F1vyVBWwQuyB7H4ofBdbTWIEr916zWFkcipnbNgmwsvkdq
 w9ohX+wBRIIe4csOVAaYCo0jHIZayqTG7WBA==
X-Received: by 2002:a05:600c:4f53:b0:48a:5565:ec3d with SMTP id
 5b1f17b1804b1-490d7223884mr35413815e9.22.1781013614965; 
 Tue, 09 Jun 2026 07:00:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm66942293f8f.36.2026.06.09.07.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 07:00:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E2F015FD5D;
 Tue, 09 Jun 2026 15:00:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 5/5] docs/system: add FEAT_ECV_POFF to the emulation list
Date: Tue,  9 Jun 2026 15:00:08 +0100
Message-ID: <20260609140008.3206970-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609140008.3206970-1-alex.bennee@linaro.org>
References: <20260609140008.3206970-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

We already had this implemented since 2808d3b38a5 (target/arm:
Implement FEAT_ECV CNTPOFF_EL2 handling) but it has its own feature
name now. Add it to the list.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 18c63559679..3622e3889c7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -60,6 +60,7 @@ the following architecture extensions:
 - FEAT_E2H0 (Programming of HCR_EL2.E2H)
 - FEAT_EBF16 (AArch64 Extended BFloat16 instructions)
 - FEAT_ECV (Enhanced Counter Virtualization)
+- FEAT_ECV_POFF (Enhanced Counter Virtualization Physical Offset)
 - FEAT_EL0 (Support for execution at EL0)
 - FEAT_EL1 (Support for execution at EL1)
 - FEAT_EL2 (Support for execution at EL2)
-- 
2.47.3


