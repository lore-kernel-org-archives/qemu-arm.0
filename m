Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F768C982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 12:27:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8d7T-0003a6-9F; Mon, 21 Sep 2026 08:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwhitakera@gmail.com>)
 id 1x8WI6-0000sM-38
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 01:10:10 -0400
Received: from mail-pz2-x1b.google.com ([2607:f8b0:4864:3b::1b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jwhitakera@gmail.com>)
 id 1x8WI4-0007w4-FT
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 01:10:09 -0400
Received: by mail-pz2-x1b.google.com with SMTP id
 41be03b00d2f7-cc5256c2a4bso1676207a12.1
 for <qemu-arm@nongnu.org>; Sun, 20 Sep 2026 22:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789967407; x=1790572207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I4wjmqFESw16ZRfgVBKpX32/Ry6HBE5C3JIoH5S39pE=;
 b=sWfW+CcW7j2BJmVLnIG2pOs/LmH8YgWGqLIJSJCVC5DznbbBun3kUatlBZU/UthIur
 zvBIiyafn5zMiy6OrQajtkM85uIBalvbwN6QM7vZIZJDSrOm6v4+NUhZCNM2tD+mkTqH
 hLfnkpoxxx0jDmt7U18GMIeFLqNMQB8JUVyHzg7pRJDgQ6zEug9z16mHVfnybkbtqHu4
 ofDoZPMQoMOAeAURAX84zNMI+pj2GxK40RxzdSzsdG9m/om5KNTU0vr/2fzia5OPnzBY
 qkXgGR98xkSvM6yfFXDWTvHMFjXii+PQnXzYWuaPbmVGHKPDsfpgVApw+Gwqq/wTKKIH
 pWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789967407; x=1790572207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I4wjmqFESw16ZRfgVBKpX32/Ry6HBE5C3JIoH5S39pE=;
 b=cdVX/EWFSciDgRzWWgqyMt7Ih7X/P+qbNpej0C89bjlaEffHPlfrpGOO8TW0EErYzo
 LUX97N+rCH1bxMoMfiwfxWz1Kap1pwM79MOLyeXsPvl8xI685nOYgsOySnOREimz9BgC
 pgWEqXxzvJIG2zpcwpCDMOpv0lVfCp98G89/Bt7iJwr3FsbhWzflLTFM9FUQtfI+fnVR
 Nz3KWvgdTTdSVZrMMy5V6n3W8KIRrahUODM/l44buOEpx2JxbbGskTNaUyK3ulM7hYWd
 sr8/TqRWW7ct+DVXaffk1L7zFuSrK6luVF+y9XhTVi+srW4+frmA0zqgCrlhSXKIwFnO
 vWvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxK6atDyDuGUdKtOOX3KQPDxuN6s3ATSiK5uoXUvtONeUePsJNU2proCqrkp3G2ME60LG4rdOkD0w==@nongnu.org
X-Gm-Message-State: AFuF++nrpbqS8o+AbJEtd8PpxW9E8m1ZVGX5MWADInJ133iXdI189L3p
 F4dtnlF28PWvsVGl26l3Y57qih9QPdqPQrcrhBFrfYjWtYsny3lB6/uX
X-Gm-Gg: AYBFou3hjxcaPhfmEJzyF9g7IiNYnCi1agKY3Z6cmUgbX3rG9TVirH9zdEdZa03hcoy
 vgweonZIRWmvlShzlT+SIxy9FwX0LyQ/5Hkg6QIMkC2GzOtJ9Gzmp1xyyM/g5p2vlecIrzGTP/R
 ju+qTWVF3WHvG4R4UsOqZx9p4cvaUkuexH1AKczR+dIp5cywHLTWAUpqD6sUn/GZ9tBGdki78Ru
 Pf8kuAWWJwtTjuv+wdsgfEFhodII//xK3sWr+MlcYL+yEHcc5ihEPbhap1B1NAUCLRMyXGk/4Z+
 Qt5tVMK5lxQuLspDWeVlkydefnD8yO+FRILC+D8qu+jFghTZnQiNd9yqATSkTqZndVe0EsGVrY5
 jPXcWlfBeNjsnvJQ8JPmSTRvYFfL8R8Bz5FRu5SyKQfKr49V3M4pWClE4ZtKyqvvYcAKjOZpYc9
 uwSJLftvHRPct23vRXA26jHRbAvS9AAq2ovGnQKCLeelURppEjhoFnN1eptJf9xrOibx2d1cBue
 gKRxfgi+S92InDDyA==
X-Received: by 2002:a05:6a20:6a20:b0:3d3:adbf:7777 with SMTP id
 adf61e73a8af0-3dd8c49f29dmr16052707637.19.1789967406541; 
 Sun, 20 Sep 2026 22:10:06 -0700 (PDT)
Received: from jacob-pop23u.lan ([2600:1700:88b2:a50:a9ca:268c:17b3:ded])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144d54af4d5sm16625516c88.2.2026.09.20.22.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 22:10:06 -0700 (PDT)
From: Jacob Whitaker Abrams <jwhitakera@gmail.com>
X-Google-Original-From: Jacob Whitaker Abrams <satur9nine@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Jacob Whitaker Abrams <satur9nine@gmail.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org (open list:STM32L4x5 SoC Family)
Subject: [PATCH v2] hw/char/stm32l4x5_usart.c: Support 16-bit writes
Date: Sun, 20 Sep 2026 22:09:59 -0700
Message-ID: <20260921050959.1876719-1-satur9nine@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::1b;
 envelope-from=jwhitakera@gmail.com; helo=mail-pz2-x1b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Sep 2026 08:27:34 -0400
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

Official STM32CubeL4 drivers use and require support for 16-bit writes to
UART registers for proper function despite datasheet claims.

Signed-off-by: Jacob Whitaker Abrams <satur9nine@gmail.com>
---
v2:
 - Remove all changes other than supporting 16-bit writes UART regs

 hw/char/stm32l4x5_usart.c          |  4 ++--
 tests/qtest/stm32l4x5_usart-test.c | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index dd1b099195..3b9883bb23 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -521,12 +521,12 @@ static const MemoryRegionOps stm32l4x5_usart_base_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .max_access_size = 4,
-        .min_access_size = 4,
+        .min_access_size = 2,
         .unaligned = false
     },
     .impl = {
         .max_access_size = 4,
-        .min_access_size = 4,
+        .min_access_size = 2,
         .unaligned = false
     },
 };
diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_usart-test.c
index a72c5a685d..3c6437e75d 100644
--- a/tests/qtest/stm32l4x5_usart-test.c
+++ b/tests/qtest/stm32l4x5_usart-test.c
@@ -332,6 +332,26 @@ static void test_ack(void)
     qtest_quit(qts);
 }
 
+static void test_16bit_access(void)
+{
+    QTestState *qts = qtest_init("-M b-l475e-iot01a");
+
+    /* GTPR is declared uint16_t in the official STM driver. */
+    qtest_writew(qts, USART1_BASE_ADDR + A_GTPR, 0xABCD);
+    uint16_t gtpr16 = qtest_readw(qts, USART1_BASE_ADDR + A_GTPR);
+    g_assert_cmpuint(gtpr16, ==, 0xABCD);
+
+    /* TDR is uint16_t and r/w, register is 9-bits */
+    qtest_writew(qts, USART1_BASE_ADDR + A_TDR, 0x01CD);
+    uint16_t tdr16 = qtest_readw(qts, USART1_BASE_ADDR + A_TDR);
+    g_assert_cmpuint(tdr16, ==, 0x01CD);
+
+    /* RDR is uint16_t and read only, register is 9-bits */
+    qtest_writew(qts, USART1_BASE_ADDR + A_RDR, 0x01FA);
+
+    qtest_quit(qts);
+}
+
 static void check_clock(QTestState *qts, const char *path, uint32_t rcc_reg,
                         uint32_t reg_offset)
 {
@@ -370,6 +390,6 @@ int main(int argc, char **argv)
     qtest_add_func("stm32l4x5/usart/send_str", test_send_str);
     qtest_add_func("stm32l4x5/usart/ack", test_ack);
     qtest_add_func("stm32l4x5/usart/clock_enable", test_clock_enable);
+    qtest_add_func("stm32l4x5/usart/16bit_access", test_16bit_access);
     return g_test_run();
 }
-
-- 
2.43.0


