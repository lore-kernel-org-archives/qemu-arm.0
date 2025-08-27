Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48278CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:10:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dw-0000x0-69; Tue, 26 Aug 2025 21:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4ds-0000fD-6N
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:08:00 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4dh-0007dL-6j
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-76e2e88c6a6so5566327b3a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256861; x=1756861661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zq68Nh6Pb9LNdIJ5Ri5el2wLAJJswXT0LQtr5jRjjiE=;
 b=krK38b9UlJStO10cV3kpW9zYtIXeXbmPoK6we4icMmNAae1H29sV7BIuioYqDOK/GS
 EzIz4SFovfUkxkaccjv5yzpx6oqA86dQDVwEwmxPPNXDe/Zb+rJHRiuhdHuaKmwjQVCr
 qH3uRfElKSNCyNfQDgGvY4t3+L/JMpDu+FIwAsUnzQ78NABenxYU/69snpnb0PO294xl
 oPDF5TmnEhvYbP17Kv8hPZvuSUopoRaGipQJckjBsAH2AH6M4yqYbDB3yN9AsvcqIrWy
 IOEmq9lh4DgbrSKXeCZ1e74J/rexY+mkOoMvc2TDfPQl+qEmmhEx+AEkcGadCt2JzTz7
 GDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256861; x=1756861661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zq68Nh6Pb9LNdIJ5Ri5el2wLAJJswXT0LQtr5jRjjiE=;
 b=W2Anf4fogs+64Aygbts+d259VjSSv7QJkfiWWbpTnr7ftN7Atj1Swdcv9Nt2RafLYM
 Ckd9NlGOoXj1jFmJ9r1OSSFttQWXngw2V2tAT/qJvKvp42It6O91M/AUNAPpNOUJE5N2
 83sRiSZVcUYC3loCOQuuY1Ojd8KDrSm+HtgSue++6PL16OASig4cjGl/bO8eurmtpnSo
 YW850fLYBvulgJa+BtDi/3Am6ijIKU9xsntGOAuw2KMxE/yfWLPMV4fSmCh9JQhE9pd0
 +mA+Mm0LUHErBVbJ6enXEqUG/Z1P5gfWnZhHCuyuFt3GzjqpPOVkKrBtDYBJggy6z4Uz
 KMrQ==
X-Gm-Message-State: AOJu0Yze3Hjhla/vxCKpzUP8VmUEEw35vdMuZ4UhYdenOMYJo7NeYku4
 rYQWy0oY4CVJKFqf61L1koOTYri2xzXv9IDgBq5epozfs8xmn0UwNxvi70P0TbvZdL4=
X-Gm-Gg: ASbGncvp+BJJESykEiKtM5q7C4gAMDdNuN5zgblweIX1nftMLDhovT8/7LZGJH4WO6M
 U0cEdOosilQJjhPJTgdiOa7djxzwM+wEWmCSEu6UAJMUZCVH3g3Ffqi1xRx9nwwmTCq7+ur4AgU
 F6Aqh180EJ6rWgmqVO/W0qh20WaFTYDU4BjNQTu7hd5DQYloneduWdKEpSB4fkkKFwoWwSKWDac
 7AX7rCL4dg1M5CQluTH1vPgP9LAWc0eqIhJW9YeoyL7MsqaFSIBi7o7uNm8/9rgm4399Vmp2OAa
 Pg4nYmRD8EQ06rozEw1fBaq/0068etPiqOB89x2wLK8/NfHGhe/nLbZZ9pYfcQVjYgwldo+ms3X
 pYklRBfbrsj+zKY2k+6asdmIMPrnnvBiXAWj6
X-Google-Smtp-Source: AGHT+IEZ5FLXvtTe6GUIXzOW3rp/Ki481RPdi1xKwncHmK03L23IVd8caPQcdOcACqIyqkfW8nWfAg==
X-Received: by 2002:a05:6a00:a03:b0:76e:885a:c32b with SMTP id
 d2e1a72fcca58-7702fc47b79mr20834702b3a.25.1756256861098; 
 Tue, 26 Aug 2025 18:07:41 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:07:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/61] target/arm: Move endianness fixup for 32-bit registers
Date: Wed, 27 Aug 2025 11:04:21 +1000
Message-ID: <20250827010453.4059782-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Move the test outside of the banked register block,
and repeat the AA32 test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66e70abc76..d0ccc23811 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7339,14 +7339,21 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, ARMCPRegInfo *r,
                  */
                 r->type |= ARM_CP_ALIAS;
             }
-
-            if (HOST_BIG_ENDIAN &&
-                r->state == ARM_CP_STATE_BOTH && r->fieldoffset) {
-                r->fieldoffset += sizeof(uint32_t);
-            }
         }
     }
 
+    /*
+     * For 32-bit AArch32 regs shared with 64-bit AArch64 regs,
+     * adjust the field offset for endianness.  This had to be
+     * delayed until banked registers were resolved.
+     */
+    if (HOST_BIG_ENDIAN &&
+        state == ARM_CP_STATE_AA32 &&
+        r->state == ARM_CP_STATE_BOTH &&
+        r->fieldoffset) {
+        r->fieldoffset += sizeof(uint32_t);
+    }
+
     /*
      * Special registers (ie NOP/WFI) are never migratable and
      * are not even raw-accessible.
-- 
2.43.0


