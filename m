Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ED5CDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 13:49:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcNoU-0002Ly-Oi; Wed, 24 Jun 2026 09:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnT-0001es-K9
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnS-00016H-3L
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:43 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4624c1409c9so919946f8f.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782308261; x=1782913061; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dbmh3RMHWGextp8wn1iIt5XsGX3XsKMosrBI26uzcks=;
 b=VNeVEvXkaZP6985Otz+EEPnFTKLfdvU3WtAGbpTgsAj0VK/QMMLxejKLiRDIUWko+n
 1y3BX15Xqio43zmNHysqUFiI2V2MjhqP6Xa2DRtrheSC7TYRE0EtKTxKsLENB/WVscgL
 FyZfZ8bjW/P3Cz1uAib0UvdiIpy7A+1EkMsvotYwcMlH8ims9lFiijvNEms5mzaZAdWQ
 RjB7CYkKckkSQaio+GTApngtwDmLr82Dh9VjgptvGGKsZ+KC4eLIn4Fby5Aw0VUV49G1
 x3i7kI5qQicSN/hHNKc2BT3LibSvbwao52fx9+XRxt+PBqY5rIlKzp49CGeQPfx0Oqmi
 uuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782308261; x=1782913061;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dbmh3RMHWGextp8wn1iIt5XsGX3XsKMosrBI26uzcks=;
 b=Os+b3pFk0Y8xOKnU218XhgqGXTkHpKLB1n5MGH27gQPgMSqCwcifh3ZWA0/xXczMJM
 Im6CV0N5ZnOHAg0mvWZc8qqcdGfkdG2wOE/PVKuHK4xcP13WJL/pv8t4deLlaeh4B0tB
 it6ZTlCCVZ59e5FPednAk7pTqvFJafnuXYp/BwgvCvH3PPqOfcqU2QWVI/J1sKL89J3K
 eB9xZXrQ5cj3VpP8fUgj1U9hd1Qmh8FpofsM9xHlHop0twHcmFzCYNaskf1LP/ab7769
 fcus3bjfZLblH94tSPc+s0wH3b2z9GbOCI73dW/bf3kqRROe44iq0x392SdG9Ne6Fk4d
 pBkA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqA8KD1NL9+yuk6wN5uMf+jjy/2X7SOPjMdaY8adpQamXSiIWUGZYmcxS6uWdG0k1zwVxLswQnj0g==@nongnu.org
X-Gm-Message-State: AOJu0Yydn3rOpuEV9MTY0m8fAlpu6W+JbAYzd/v/4WlD5NoPRZiOW5sz
 nNsqVSndWYqwaV2j7GBp714KXDYJEq7sMd5gG8eWXMnmn51a/+iVZ7nFmy2YqG3GKTo=
X-Gm-Gg: AfdE7cmekL3FdFYXnnPq2HgY0ApEZxM3XDSbtOT4AUucfTAe2jMCmuU/Amk8SNt7zjj
 o+Uj8oPSxr0Cogo+FOWiJ6wv5Rqf1DENC4DmkaKEPj2MLW+sqNK0Gp2QXnrANEXon3j4RNwPtaJ
 aNP0kVyVuQOOqHQGBKleClgnR/NpF3ffaZNAcjQyX6OypfA55nhefzGO3SX26R7E5I8EoFfqCaJ
 phUq9K5WlArFrN79nz7F+l/ZmJ5URMlrKDK6aKxWdtk5iNyU12ue8MJ5hjhwlXZmOYqN/2zjPjZ
 iFJOJECEhvN7N9D9uPTtIs6lznGx86sdRBLKGKi4jJ+XHiiL38vVbJ8Ciut3Ougpdq3NrZaPckl
 WdrAPtlLgD44JfATEjVWJ7uq7IBk2EZ7kvgelVgCzrXGkfe/TdvGTLWTx5BVO4CJGOzbgcbVvms
 K3kcs8ujjHu+j/AoVVyBP+0DlUAg==
X-Received: by 2002:a05:6000:2c04:b0:46d:32:3340 with SMTP id
 ffacd0b85a97d-46d0032353dmr966946f8f.36.1782308260654; 
 Wed, 24 Jun 2026 06:37:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:2e21:1ee8:260f:9a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6646334f8f.5.2026.06.24.06.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 06:37:40 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 24 Jun 2026 14:37:28 +0100
Subject: [PATCH v2 4/6] linux-user/aarch64/elfload.c: Add FPRCVT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-jmac-fprcvt-v2-4-dc6cf8e512b6@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
In-Reply-To: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 linux-user/aarch64/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 4887a3a7b7..4487d047bb 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -173,6 +173,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
     GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
     GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
+    GET_FEATURE_ID(aa64_fprcvt, ARM_HWCAP_A64_FPRCVT);
 
     return hwcaps;
 }

-- 
2.43.0


