Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45768C44501
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 10:48:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmId-0007dY-Ds; Thu, 09 Jul 2026 06:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmIb-0007bQ-76
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 06:48:09 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmIZ-0002kO-Ih
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 06:48:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47dec32798aso618993f8f.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783594084; x=1784198884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=opvFLLf6H/WX2lBzUeG9w4tupmTnctUuF+VIkiQ5Kz8=;
 b=hvHZDGp1lrB3/5eLeoAqlSwkBBMPQbp9/ZMgkXUFbTSncrRJpDEb2GHoez636/d967
 oibIC1hdd9iTYhaVfal1kSpFtoqMOHrBHZWJGGEoFu9gRiTKkndauTob9Sm4Z3rj8hIj
 8yeT66PXoHzyGOoxAyRgvBxzStDdjYOysLws7Qv7vaf+8pdMedWM1xQ2d+zBOKmdl8AY
 8P0H9R8C3vvxmWxInA4SClFPhJ5teWMsnaIxIOs7HS8qCFJCZXbbf7Xq9hlRnhb38deV
 c3nXoysXKG6bDMyFK1i0O6jvge+j/r9ewR3D9S/e/qg4BYu/SXqYCFGrs3JzbIPaHbFW
 2Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783594084; x=1784198884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=opvFLLf6H/WX2lBzUeG9w4tupmTnctUuF+VIkiQ5Kz8=;
 b=NzcH/nHfNwraR7n1ikvEJEYV0cmbIC5lLJvoGeZgmGAveNdaRijTtuGtfYV+9tE6MT
 HEuYs5pIB+rxMf7LKR24NwEgeu861fV+2OUAgSBTlqp4B6/UxI5SBcuVZ/faYeKTCWgS
 isNVDfvZbwVmZVnfEUDfsMN6w5u1bMpVQaVhb4essDAeLIneytLO8NFjogZqQDhr/UbX
 y9h7sRD0/mJj8RwHPhA5pU2cQMZ24hnCZMI3eomG9b8oH7st84T+lho6luoCe43j/CVh
 Vf5+/zGCkQE9o7LD9DuS0jUFwAY9VaUxWaKxYUTPys+vXtMTKPJYoFBvCKlR1JsIJG2e
 w7MA==
X-Gm-Message-State: AOJu0YxmxmccfSDE/f7vu19UlscDwWXXq+t6BxoETLFTq8K2+qp4VHnT
 lCotHvPX2zxMTsa/8OJNqXrlx/A36DMGlwNKJP5mE6kVygel47Mv68Icccc5bwDehwoL021s0yX
 jpktw2PxjqA==
X-Gm-Gg: AfdE7ckcT3CPxb4Oxwzulc88InZYdbtEcJqCLSJhlREIGIOX+MlhBjAd32yMTQ8WQ/V
 +i4hFXwWcEltN4J+6Z70RKPa/V4BiqXIq366oBeN/OiXi6cfaNViGuuCIHsKrewy2vXbaIkGfNH
 oRcuJAyADpw8ROM6w9194OdSBx0i7wbLLmB9snltTiyoXys2Gw20DuNz0JfJQHwYNBNT5jVX2Lc
 Zmu6pDT/zDbqRm+QYDKCJiyvMU6GfuyiHD7/v2pcFLIdxR0oYf20VV8Tai/Coc8WIAG84A3k42+
 OJnfFB/D3kcGXONlnA4HCj3yZX9Y0dHDMKdBTCwzAjUKGLIi3wBkXQ3E84aliD7FdmwCDc1p3wR
 H68AX9I6+Fyr3Te3314ngRq+b6YQm3wE3eVm/wGnQvhaKgYu2HXUh0wSc032kkqSWyjdoN5AN1K
 pRgyMj7S/su4Crsb3kvaHa09JU6ZLWBAJbx06s/1vCpJxT7t/IKMOoNp0ofkeu/V4kKTs59/CqF
 BPvPNOKh6ZcOLkgJ/ngfA==
X-Received: by 2002:a05:6000:2209:b0:45e:f8d0:d22c with SMTP id
 ffacd0b85a97d-47df076518emr7106340f8f.25.1783594084238; 
 Thu, 09 Jul 2026 03:48:04 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e736sm54110243f8f.7.2026.07.09.03.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 03:48:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH] hw/misc/allwinner-r40-ccu.c: Correct handling of out of range
 accesses
Date: Thu,  9 Jul 2026 11:48:02 +0100
Message-ID: <20260709104802.1989086-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

In allwinner_r40_ccu_write() we handle writes to a MemoryRegion of
size AW_R40_CCU_IOSIZE, and the register array is sized accordingly
at (AW_R40_CCU_IOSIZE / sizeof(uint32_t)).  However, one of the cases
in the switch is a range up to AW_R40_CCU_IOSIZE, which makes
Coverity think we might index off the end of the array. We also
have a similar case in the read function, but since that returns
early it doesn't have the same issue.

Adjust the handling of out of range accesses:
 - use AW_R40_CCU_IOSIZE - 4 as the upper bound, as this is the
   largest value we will actually see
 - return early in the write case, as we do in the read case

Coverity CID: 1663687
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/allwinner-r40-ccu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/allwinner-r40-ccu.c b/hw/misc/allwinner-r40-ccu.c
index 8ba4e7aa42..00840e9850 100644
--- a/hw/misc/allwinner-r40-ccu.c
+++ b/hw/misc/allwinner-r40-ccu.c
@@ -71,7 +71,7 @@ static uint64_t allwinner_r40_ccu_read(void *opaque, hwaddr offset,
     const uint32_t idx = REG_INDEX(offset);
 
     switch (offset) {
-    case 0x324 ... AW_R40_CCU_IOSIZE:
+    case 0x324 ... AW_R40_CCU_IOSIZE - 4:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
                       __func__, (uint32_t)offset);
         return 0;
@@ -113,10 +113,10 @@ static void allwinner_r40_ccu_write(void *opaque, hwaddr offset,
             val |= REG_PLL_LOCK;
         }
         break;
-    case 0x324 ... AW_R40_CCU_IOSIZE:
+    case 0x324 ... AW_R40_CCU_IOSIZE - 4:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
                       __func__, (uint32_t)offset);
-        break;
+        return;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: unimplemented write offset 0x%04x\n",
                       __func__, (uint32_t)offset);
-- 
2.43.0


