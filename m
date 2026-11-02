Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126A60A2620
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xVCCxEI9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNp7u-0001Uq-MH; Mon, 02 Nov 2026 05:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNp7h-0001TE-Ag
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:18:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNp7c-0005v3-Pe
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:18:40 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so21153595e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793614712; x=1794219512; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7/EbRasFtecU6OLNucc5FQYJM1nWp9yJXQrAU5T2JSg=;
 b=xVCCxEI9dEhsps7nbRZSy9KctoMbOZiiMIySw5PtWuG3otTrW15UrMBv8LFUMxOeQk
 beGThVYfQgdQMcwYFdzVzFQG4W/jcJc+0K7rlDqJIeLDyyAMUXMFvkeGvacoaKiM5mLi
 R1EP2h0MsWFlyJU9SJDJ7gBKcr5YY87poMTcCaC0v8w1e8d2YF3CjbwWa5I4d56KjPqj
 NY8R1vOF/esLwMfUTLw2mLK6Svev5AjPphueDJ79jiBS7KhJ75RMVeL6nnlrgAiVnqIg
 yGpcFRpnQEs709VwdvCqPiUWs5eYPPPDGeuPG9AoHl6Lsg9I6Ya2yhsUe++G++4BNBIG
 HaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793614712; x=1794219512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7/EbRasFtecU6OLNucc5FQYJM1nWp9yJXQrAU5T2JSg=;
 b=coY6djfwFvMjaZtyY/if/NvKIAHVK0GhHMmhiOEmrMVn1+ywxkW1yKwHXFDR4EmSdy
 U/7WJkj2zY4utFHonxfWnyo+nEWtNOjOHo4G5pGu/QpeuxQKy5vzWtoCb9aNMhSVZb3y
 oNd4aWLaSyOHJ9Ir3kFA/T9YtqYoFJm1Hkk4efUnSvWYnNHAyD3S1ijZjxqxEG8LunRQ
 wsOSZZOV5UzApxJsN+Orh3RZcxFdSydW8tK5Dltj7h70CimMiX3ipDw1o266LRIRPQd/
 3wNITsFZSzNCegoP+pAyitW5+aq4VnSF00gijQ++VNI8JYgrYNqZO6uAOcS0x52T5GbB
 M//Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBz7cR6XMl5nRA6wmQx/Lphc01TuQ6lTXd+hUyAtIESvN/5/kY/fW+24ryJpzrLN7uafgjs3UgQjiA==@nongnu.org
X-Gm-Message-State: AFq9FYJ4lm+iJF3nriZY+NHRr+FS3rBSpo+6Xmo/h8i5pIBxG+DmSE0t
 M6QKj/p3OHI+wHMPN43Gtna9cfBOyw8BZq7jDVkxFcd7cNBOD9gjrXG0
X-Gm-Gg: AYBFou2JYJ01bIzk6dcq7OJwLej8P2WK4v83bn76vdKo4+0roYl/LTqsGwxki55/pHb
 Kgg/q6clJO3nt7GLuGKi3pKvrA9XqzMhsKSMgUn+G9h5rw32iXakJgFK4f47YgmiaZvBIm3WP5B
 sBWVd3bgUA4HCrfoL0HhziUgrbtD+lyB8kKu/X3E5EBykw5ax1Np4Rh9DZzFiVk9UlZ8Yq1lFh6
 9oJSqWfFkzcEcJrd38VMi3SbWu9006jCd/hwLaciuxJw6IeKs48DcyHbC9LzjsEu8Am3g74tAge
 FdmAWeV5F5oUcHxKpQvtLqciZKn9KzAYartKemegDkWcoq0qH3FfT6AoLxlc0YbG+DlZY6Oh1Fo
 JkpovCvNHDUWqxNRNSIOixJt80yG9I4+ULsRAP+RiIYfZTs9NRRYM+Emls+lYjejQXK0AvKNoeS
 0bqO7g4NUGZyMi+NTLuwCgDak/cTt3FtwH2DbORN7ltNHjuI5XgPfe/il/gPcgmg01V0S4aR23z
 ULoaNufHU9JwmAOTAuwZM0jiqL0l2Z7OgBLHQyF3syIYQZhGCQerYFV2IJ5LwqsLbbZ4/YLwBMn
 U5Qhb5n2qDgn5vaP/MZG7igrAKaQwi/dDjF/K59HmkzK7I0M/pBmKfCM+K251Orf1+cq19ogrXH
 YzQ==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id
 5b1f17b1804b1-4ac17b2cdc2mr221602475e9.27.1793614712319; 
 Mon, 02 Nov 2026 02:18:32 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09fadb75sm173692795e9.3.2026.11.02.02.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:18:31 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me
Subject: [PATCH 2/5] hw/i2c/bcm2835_i2c: update the interrupt when the status
 is cleared
Date: Mon,  2 Nov 2026 11:18:30 +0100
Message-ID: <9c983d1ee9590f2dc2d373a4a035f1b3c1a04801.1793613972.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Writing 1 to DONE, ERR or CLKT in the S register clears the bit, but
bcm2835_i2c_write() did not recompute the interrupt, so with INTD set
the DONE interrupt stayed raised after the guest acknowledged it.
Linux i2c-bcm2835 clears C before it clears S and so lowers the line
anyway; a driver that clears DONE in S and keeps INTD set took the
interrupt again and again.

Update the interrupt after the write, as the C and FIFO writes do.

Test that clearing DONE lowers the interrupt.

Fixes: 9cf3bc65afdb ("hw/i2c: Implement Broadcom Serial Controller (BSC)")
Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
---
 hw/i2c/bcm2835_i2c.c           |  1 +
 tests/qtest/bcm2835-i2c-test.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c
index 5f6093087d..60f9d953c4 100644
--- a/hw/i2c/bcm2835_i2c.c
+++ b/hw/i2c/bcm2835_i2c.c
@@ -166,6 +166,7 @@ static void bcm2835_i2c_write(void *opaque, hwaddr addr,
         /* Clear DONE, CLKT and ERR by writing 1 */
         s->s &= ~(writeval & (BCM2835_I2C_S_DONE |
                   BCM2835_I2C_S_ERR | BCM2835_I2C_S_CLKT));
+        bcm2835_i2c_update_interrupt(s);
         break;
     case BCM2835_I2C_DLEN:
         s->dlen = writeval;
diff --git a/tests/qtest/bcm2835-i2c-test.c b/tests/qtest/bcm2835-i2c-test.c
index 1599194926..12c6ebdbcf 100644
--- a/tests/qtest/bcm2835-i2c-test.c
+++ b/tests/qtest/bcm2835-i2c-test.c
@@ -89,6 +89,29 @@ static void test_i2c_read_write(gconstpointer data)
 
 }
 
+/* Clearing DONE in the status register lowers the DONE interrupt */
+static void test_i2c_irq(void)
+{
+    uint32_t base_addr = bsc_base_addrs[0];
+
+    qtest_irq_intercept_out_named(global_qtest,
+                                  "/machine/soc/peripherals/bcm2835-i2c0",
+                                  "sysbus-irq");
+
+    writel(base_addr + BCM2835_I2C_A, 0x50);
+    writel(base_addr + BCM2835_I2C_DLEN, 1);
+    writel(base_addr + BCM2835_I2C_C, BCM2835_I2C_C_I2CEN |
+           BCM2835_I2C_C_INTD | BCM2835_I2C_C_ST | BCM2835_I2C_C_CLEAR);
+    writel(base_addr + BCM2835_I2C_FIFO, TMP105_REG_T_HIGH);
+    g_assert_cmphex(readl(base_addr + BCM2835_I2C_S) & BCM2835_I2C_S_DONE,
+                    ==, BCM2835_I2C_S_DONE);
+    g_assert_true(get_irq(0));
+
+    writel(base_addr + BCM2835_I2C_S, BCM2835_I2C_S_DONE);
+    g_assert_false(get_irq(0));
+    writel(base_addr + BCM2835_I2C_C, 0);
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -102,6 +125,7 @@ int main(int argc, char **argv)
         qtest_add_data_func(test_name, (void *)(intptr_t) i,
                             test_i2c_read_write);
     }
+    qtest_add_func("/bcm2835/bcm2835-i2c0/irq", test_i2c_irq);
 
     /* Run I2C tests with TMP105 slaves on all three buses */
     qtest_start("-M raspi3b "
-- 
2.56.0


