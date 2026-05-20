Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B294CCD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:35:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZI-0007j8-Er; Wed, 20 May 2026 14:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYu-00079L-4u
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYr-0000Y7-Cc
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:31 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-366139223e4so3011878a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301347; x=1779906147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wl6+4I26v8HYA+JJlHEMinIiz3qcncuhnbxRtIcqZ1g=;
 b=W1uZUOFJFROZ46IbwGuWrQh39Qw/0/jmjhRpokmH1qVe/rlceXGmf87JMWBqmanj1u
 Fep3q4coJAhtNrDGmx8790GdCHNzraqjZ1x6+CedJYiEB0HxpH16tX/no7CTIhiaRrc3
 /zWcF5084lwgIPiilDo0frl7kBN3p/Nyuvq52ocKHlMNA+yt6br20G1nhnY/uJG83ERV
 JX0cif4vKZ9/SKqy6F0RPWWi8uB2mIF7HN9Q1j5O89j1XTYxiCs5OO/uzl99CcV7+y06
 oUzYpCcWjTCdpux2NzBHKVxFqo9USKYqebkMhSO11zuMf4KCcCCVlbQP24LFIiXqSLXf
 hw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301347; x=1779906147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wl6+4I26v8HYA+JJlHEMinIiz3qcncuhnbxRtIcqZ1g=;
 b=Lv/tR1cMjBtXjBaCD9v9zv9EOTSGu+WNFI8LXHe4roX5H62l2w8JhgM0wSn5ony7jr
 +AsyrzNruCZQbKn/wJupWXhOs7nmMemu2+EFvLE820R+5aFiYTwvBiThSNUm9P2V6lW0
 2N8M9jp6MW6bAvMiOhpsfDkLYJcMc8p4TUWdVxbOLBs0SvcqIfPG2KrXseg37KUAY58f
 fymry0pFyJRqXflm0IEtq+67wLd+AE1/J3IwfrdrPY3ZfoO8k4ZV1ogzV7+tL2jNdPkP
 +NCw+iTYCXums8Qp5PviQSksw7BmoGMWYvM4zpLECvj7YT99LokLtgJidPnAloRQmtna
 PEDg==
X-Gm-Message-State: AOJu0Yx+0IYX2tgL4VzECIRtes4en1Mag3POPZcH3QotBuFHZMPyC27y
 VWmBJOhyeTmeGdkpx8jJu0RwRX3HyElPPNrFbtPBV7ffgIr2vkDEDxmHz2MJlKcQQtZtaVN8E6N
 uIC/uhD8=
X-Gm-Gg: Acq92OE2qV/G94sRLeYbm2sgjVF/fZe5KXgnDuXjnkkTd6LU33yUpPhT4yArxRcoGEw
 zmBcBuUkNIaZ2DnJGb6GXoENR7kOOuOuc9uSK4jZ4RbIMxG8IDJAxw8sUPqva2Hv5pgPIxSbOKk
 Sjp1WTiBNteVfEzhyvQ60Pqws3Fz+axQ40vKG0ixU/PDFASLspzpCSl5OK4mJuAyRml1PJ+fqJ3
 5df5jzragDS9GQgRulemlMUvMZJ/LQvDo07ZHd9lCfJv1ax/a4KMFPgskvLZYvEdzbwla5d+oYN
 SSED/3SQrok04zcu9rWrpHlt35eRp0AHrTubVHGVPJKXRVNpGjukEOB9MgNr4mrGa0kd9mNJPGz
 qeT8oaBQJ1WXzL3snBdPZx+uw0dvgVsEy9SctGYgoDgJhLrZjaHJSdml5gtQDbV4ZQ1a1QWqESf
 GH6AB2XmLLsbbyi/UcrL63XvX4sZBj
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id
 98e67ed59e1d1-36951ca51ecmr24257243a91.19.1779301346957; 
 Wed, 20 May 2026 11:22:26 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 18/64] target/arm: Add isar_feature_aa64_f8cvt
Date: Wed, 20 May 2026 11:21:27 -0700
Message-ID: <20260520182213.872945-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 1bb77d78da..1fde3e9231 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1569,6 +1569,11 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
 }
 
+static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
-- 
2.43.0


