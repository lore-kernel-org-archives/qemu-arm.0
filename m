Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8069728wrt;
        Tue, 4 Dec 2018 05:30:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/URwUP/7ujbWA2nrPFMj1ex868mrFOgKlGQhHkcOrG2csmaqzjxeMPw4OjApeBBU51z47af
X-Received: by 2002:a37:39cd:: with SMTP id g196mr19279284qka.237.1543930220508;
        Tue, 04 Dec 2018 05:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930220; cv=none;
        d=google.com; s=arc-20160816;
        b=nHyJeci/yfe59OXXtHW+ZCyPIZB8mdPtQLQ446zhOFFBmNltMI2i4HqmPPv6yunGt9
         FoKKrVCylip7Zskkx+tsNjJOgEEbEBY9tQ3KZFIttx9vk/Vr4F5pnnSThOQPmMFkCU2q
         SFNQf7ik9O98i6Hpr3PGnpLyNRlesmNdSbvH+Ek6kYo7WaVCJZ9+LyjAAMvi4uPzf3dL
         LGUrjTYpaPjXXN5DT7uYfIfm4aedS3zT3jBVoY5gXMF5j+1G+Po3mFRpzsCXcX9LodWF
         P9j52R96rUkSVX8iAIkhYouHqm2SdHtgherzESOEJncgR9J85BVdKS2VrbrQCAIcWXMU
         lyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=rIVReNg823ar8HdxJcvX3AabuLeORa3G1b8cQmCuJTw=;
        b=rfeZfYaf43j7IkXbNvu64WgzDj8bImW/gud68gTmGfn7Mh7R0WUhx0HH5ZnU0tI8gF
         8/z0EApYs/epfMBP82LAzW0PB8zzPFH6Nrhvii9P7OzlEZgU5XsWr2RHfwsrLMFs4OKf
         f0ajXGns/dBCNdnjTpYihyzhrp2ymZsq44fr3d4FqENnqy94LVtmoi2hqCeIOl8oTe/8
         sA9b6SxBOZroEkkpUVGGsikyMMarmOp8LpapiqhBBz4azMVGp1IuHmevHza9hncMTXBp
         hKFD5JGIcltAlDNSEMKz22CuHYFQh5V9hK2FlsOgvVKI2P9oyMx9SSQ8s8xe+QnQPakX
         srbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si3057766qvp.159.2018.12.04.05.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:30:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAmJ-0007iv-Sq
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:30:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm5-0007h3-5o
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm4-0000zL-06
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:05 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:53236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gUAm3-0000pO-NJ; Tue, 04 Dec 2018 08:30:03 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gUAlv-0008CX-5B; Tue, 04 Dec 2018 13:29:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 13:29:51 +0000
Message-Id: <20181204132952.2601-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204132952.2601-1-peter.maydell@linaro.org>
References: <20181204132952.2601-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/5] tests/test-arm-mptimer: Don't leak string
 memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2xUh6c8EZD2c

The test-arm-mptimer setup creates a lot of test names using
g_strdup_printf() and never frees them. This is entirely
harmless since it's one-shot test code, but it clutters
up the output from clang's LeakSanitizer. Refactor to
use a helper function so we can free the memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/test-arm-mptimer.c | 153 ++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 84 deletions(-)

diff --git a/tests/test-arm-mptimer.c b/tests/test-arm-mptimer.c
index cb8f2df9141..156a39f50dd 100644
--- a/tests/test-arm-mptimer.c
+++ b/tests/test-arm-mptimer.c
@@ -991,10 +991,25 @@ static void test_timer_zero_load_nonscaled_periodic_to_prescaled_oneshot(void)
     g_assert_cmpuint(timer_get_and_clr_int_sts(), ==, 0);
 }
 
+/*
+ * Add a qtest test that comes in two versions: one with
+ * a timer scaler setting, and one with the timer nonscaled.
+ */
+static void add_scaler_test(const char *str, bool scale,
+                            void (*fn)(const void *))
+{
+    char *name;
+    int *scaler = scale ? &scaled : &nonscaled;
+
+    name = g_strdup_printf("%s=%d", str, *scaler);
+    qtest_add_data_func(name, scaler, fn);
+    g_free(name);
+}
+
 int main(int argc, char **argv)
 {
-    int *scaler = &nonscaled;
     int ret;
+    int scale;
 
     g_test_init(&argc, &argv, NULL);
 
@@ -1012,89 +1027,59 @@ int main(int argc, char **argv)
     qtest_add_func("mptimer/prescaler", test_timer_prescaler);
     qtest_add_func("mptimer/prescaler_on_the_fly", test_timer_prescaler_on_the_fly);
 
-tests_with_prescaler_arg:
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/oneshot scaler=%d", *scaler),
-                        scaler, test_timer_oneshot);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/pause scaler=%d", *scaler),
-                        scaler, test_timer_pause);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/reload scaler=%d", *scaler),
-                        scaler, test_timer_reload);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/periodic scaler=%d", *scaler),
-                        scaler, test_timer_periodic);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/oneshot_to_periodic scaler=%d", *scaler),
-                        scaler, test_timer_oneshot_to_periodic);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/periodic_to_oneshot scaler=%d", *scaler),
-                        scaler, test_timer_periodic_to_oneshot);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_oneshot_counter_to_0 scaler=%d", *scaler),
-                        scaler, test_timer_set_oneshot_counter_to_0);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_periodic_counter_to_0 scaler=%d", *scaler),
-                        scaler, test_timer_set_periodic_counter_to_0);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/noload_oneshot scaler=%d", *scaler),
-                        scaler, test_timer_noload_oneshot);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/noload_periodic scaler=%d", *scaler),
-                        scaler, test_timer_noload_periodic);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/zero_load_oneshot scaler=%d", *scaler),
-                        scaler, test_timer_zero_load_oneshot);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/zero_load_periodic scaler=%d", *scaler),
-                        scaler, test_timer_zero_load_periodic);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/zero_load_oneshot_to_nonzero scaler=%d", *scaler),
-                        scaler, test_timer_zero_load_oneshot_to_nonzero);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/zero_load_periodic_to_nonzero scaler=%d", *scaler),
-                        scaler, test_timer_zero_load_periodic_to_nonzero);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/nonzero_load_oneshot_to_zero scaler=%d", *scaler),
-                        scaler, test_timer_nonzero_load_oneshot_to_zero);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/nonzero_load_periodic_to_zero scaler=%d", *scaler),
-                        scaler, test_timer_nonzero_load_periodic_to_zero);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_periodic_counter_on_the_fly scaler=%d", *scaler),
-                        scaler, test_timer_set_periodic_counter_on_the_fly);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/enable_and_set_counter scaler=%d", *scaler),
-                        scaler, test_timer_enable_and_set_counter);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_counter_and_enable scaler=%d", *scaler),
-                        scaler, test_timer_set_counter_and_enable);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/oneshot_with_counter_0_on_start scaler=%d", *scaler),
-                        scaler, test_timer_oneshot_with_counter_0_on_start);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/periodic_with_counter_0_on_start scaler=%d", *scaler),
-                        scaler, test_timer_periodic_with_counter_0_on_start);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/periodic_counter scaler=%d", *scaler),
-                        scaler, test_periodic_counter);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_counter_periodic_with_zero_load scaler=%d", *scaler),
-                        scaler, test_timer_set_counter_periodic_with_zero_load);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_oneshot_load_to_0 scaler=%d", *scaler),
-                        scaler, test_timer_set_oneshot_load_to_0);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/set_periodic_load_to_0 scaler=%d", *scaler),
-                        scaler, test_timer_set_periodic_load_to_0);
-    qtest_add_data_func(
-        g_strdup_printf("mptimer/zero_load_mode_switch scaler=%d", *scaler),
-                        scaler, test_timer_zero_load_mode_switch);
-
-    if (scaler == &nonscaled) {
-        scaler = &scaled;
-        goto tests_with_prescaler_arg;
+    for (scale = 0; scale < 2; scale++) {
+        add_scaler_test("mptimer/oneshot scaler",
+                        scale, test_timer_oneshot);
+        add_scaler_test("mptimer/pause scaler",
+                        scale, test_timer_pause);
+        add_scaler_test("mptimer/reload scaler",
+                        scale, test_timer_reload);
+        add_scaler_test("mptimer/periodic scaler",
+                        scale, test_timer_periodic);
+        add_scaler_test("mptimer/oneshot_to_periodic scaler",
+                        scale, test_timer_oneshot_to_periodic);
+        add_scaler_test("mptimer/periodic_to_oneshot scaler",
+                        scale, test_timer_periodic_to_oneshot);
+        add_scaler_test("mptimer/set_oneshot_counter_to_0 scaler",
+                        scale, test_timer_set_oneshot_counter_to_0);
+        add_scaler_test("mptimer/set_periodic_counter_to_0 scaler",
+                        scale, test_timer_set_periodic_counter_to_0);
+        add_scaler_test("mptimer/noload_oneshot scaler",
+                        scale, test_timer_noload_oneshot);
+        add_scaler_test("mptimer/noload_periodic scaler",
+                        scale, test_timer_noload_periodic);
+        add_scaler_test("mptimer/zero_load_oneshot scaler",
+                        scale, test_timer_zero_load_oneshot);
+        add_scaler_test("mptimer/zero_load_periodic scaler",
+                        scale, test_timer_zero_load_periodic);
+        add_scaler_test("mptimer/zero_load_oneshot_to_nonzero scaler",
+                        scale, test_timer_zero_load_oneshot_to_nonzero);
+        add_scaler_test("mptimer/zero_load_periodic_to_nonzero scaler",
+                        scale, test_timer_zero_load_periodic_to_nonzero);
+        add_scaler_test("mptimer/nonzero_load_oneshot_to_zero scaler",
+                        scale, test_timer_nonzero_load_oneshot_to_zero);
+        add_scaler_test("mptimer/nonzero_load_periodic_to_zero scaler",
+                        scale, test_timer_nonzero_load_periodic_to_zero);
+        add_scaler_test("mptimer/set_periodic_counter_on_the_fly scaler",
+                        scale, test_timer_set_periodic_counter_on_the_fly);
+        add_scaler_test("mptimer/enable_and_set_counter scaler",
+                        scale, test_timer_enable_and_set_counter);
+        add_scaler_test("mptimer/set_counter_and_enable scaler",
+                        scale, test_timer_set_counter_and_enable);
+        add_scaler_test("mptimer/oneshot_with_counter_0_on_start scaler",
+                        scale, test_timer_oneshot_with_counter_0_on_start);
+        add_scaler_test("mptimer/periodic_with_counter_0_on_start scaler",
+                        scale, test_timer_periodic_with_counter_0_on_start);
+        add_scaler_test("mptimer/periodic_counter scaler",
+                        scale, test_periodic_counter);
+        add_scaler_test("mptimer/set_counter_periodic_with_zero_load scaler",
+                        scale, test_timer_set_counter_periodic_with_zero_load);
+        add_scaler_test("mptimer/set_oneshot_load_to_0 scaler",
+                        scale, test_timer_set_oneshot_load_to_0);
+        add_scaler_test("mptimer/set_periodic_load_to_0 scaler",
+                        scale, test_timer_set_periodic_load_to_0);
+        add_scaler_test("mptimer/zero_load_mode_switch scaler",
+                        scale, test_timer_zero_load_mode_switch);
     }
 
     qtest_start("-machine vexpress-a9");
-- 
2.19.2

