Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1609FE7FDF2
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 22:27:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn2Ls-0008Bg-Np; Mon, 02 Feb 2026 17:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2Lq-0008A5-NN
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vn2Lp-0005ik-BD
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 17:24:58 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso42485085e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770071096; x=1770675896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ZgFsj41R73USHfnfxx9xHJU0fzw4Fgplcv6IOSKNfw=;
 b=pEhSDHraZuPV4N4cpIzVPCVpVoMaCsY8xHiwKgORCnCpxehDD7BSDIaQtU9CgUor7c
 RngIHjkj1RV1O7CK+SqoNyyeYGP/HOJN7i62h5WglFnXKxr0YLigdFpDg5MFPqdWKcGL
 1TZqXiEwNBnQ4yskIf4OmH2HU8Lw1sAMYwsGcA6oroAlufaekpbKNMEDLcTe3iY7i+SX
 bXb+eDsx++vn3sGAT1K0HWfRqbvyCl2qX2V+mFXCe8AZyi4ajycOV58s3sICuMbRmWpX
 N//tA880fqR8wFI5Ihx/3FLZPNd0sfrRPcBlSB/WGSj5lvf+iiBWNJjmS127vggzwHIi
 1ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770071096; x=1770675896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ZgFsj41R73USHfnfxx9xHJU0fzw4Fgplcv6IOSKNfw=;
 b=ffQjtKDzNuv+LRz6sNQ0qEBZV783zAPV/iiRThHpXT1fE9MZBca+Hy3N+b1uPqjPh0
 J5tBP9CWUkLeQiUUP93zRE+esnAGus9TLzq5dX/znzCLIRRhNLooRZ6P5nLhbeot5nuR
 7uf3mRjQHCHgbl5yX63VeKfVitW6F4U0UPiWNN/jT1PyfP12hkZipO+zHqOcebxgu41e
 OWPdr9aiF20o70dEWORvjBUHO10cWNduZbDcJLVyaCgLixgoTKy1jNzH/BD6KBMW+6uk
 q7K22ADeCPzjDMezhDffYM+Ts9cR8Aw9iYteQbDcH+tLbbGa6n4mIgGNTLxfCTFVag4b
 6TIQ==
X-Gm-Message-State: AOJu0YzBwHtoJi2KlR78veARShyQ1qjd5npy2gW7344MRUCPnMSAJ10k
 2FEXNb0vCMl83nVBL2L1btDomJioVOIgow5yd1sswqvWFSCK+thUD4WMnQku6qws3zw=
X-Gm-Gg: AZuq6aK8tgTPaFdql3nDQC04VPFX73/PTtYPDRd0ZHDf1VTUoIwl/y/GqYzv6WKURws
 eU0MWN3EuuKaq2WLG627/vrPPP7F+AEssChvYKYliF8yVxeZCRyiw6OBdf8Bb2UJykQ3yW+2JW3
 aqR75Flkp/3gcD6UnA6+ANvSjGycrU5+XcdPug6JjL4aI5ZzvlwnGK8MmScJcFmNCcB7K5d5poZ
 zPP52X2KVAjcNoyakxjnCkjoA/aZ/AMaqV/p5+LWH4X+7pZVY+ghmEVzbtuC/WdSTx3M/H9bTwf
 TYo2t662RH25RRbKQ3Lp1Nat4j6JnM1fsUUZAJ5rBF5g6tnsoTf7W9hySJsC/qoWFbo6nnsBcJL
 FHABbSlKOdjqB8Q1LohGdctMA2HfBGdavXh0/S5hl8HFvdFyCi8yDPYnPqTMWNz3JCYdFslqDlG
 o38n3jJWl47WnfclJEOvgYwzbZKSPij9uF9RqYvMjC0CMxxk4pZ/0U+EB6PiKK64m3QztHsNw=
X-Received: by 2002:a05:600c:818f:b0:47b:deb9:f8a with SMTP id
 5b1f17b1804b1-482db491bfbmr174416925e9.30.1770071095951; 
 Mon, 02 Feb 2026 14:24:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbcf9684sm119990765e9.5.2026.02.02.14.24.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 14:24:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/7] disas: Make disassemble_info::target_info field const
Date: Mon,  2 Feb 2026 23:24:11 +0100
Message-ID: <20260202222412.24923-7-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
References: <20260202222412.24923-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x342.google.com
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

Disassemblers shouldn't need writeable context, so make the
disassemble_info::target_info field const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/disas/dis-asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 3b50ecfb540..911352703ea 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -397,7 +397,7 @@ typedef struct disassemble_info {
   bool show_opcodes;
 
   /* Field intended to be used by targets in any way they deem suitable.  */
-  void *target_info;
+  const void *target_info;
 
   /* Options for Capstone disassembly.  */
   int cap_arch;
-- 
2.52.0


