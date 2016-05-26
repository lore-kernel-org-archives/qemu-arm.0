Received: by 10.25.30.65 with SMTP id e62csp549454lfe;
        Thu, 26 May 2016 08:24:42 -0700 (PDT)
X-Received: by 10.55.114.71 with SMTP id n68mr9742235qkc.37.1464276280455;
        Thu, 26 May 2016 08:24:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63si13325211qkh.265.2016.05.26.08.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5x9L-0006Tr-Pc
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9H-0006Pl-72
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9F-0004VZ-JU
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5x9F-0004Uz-AN; Thu, 26 May 2016 11:24:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whK-00045V-F8; Thu, 26 May 2016 15:55:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:20 +0100
Message-Id: <1464274540-19693-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 02/22] bitops.h: Implement half-shuffle and
 half-unshuffle ops
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pat9xyr/WcmX

A half-shuffle operation takes a word with zeros in the high half:
 0000 0000 0000 0000 ABCD EFGH IJKL MNOP
and spreads the bits out so they are in every other bit of the word:
 0A0B 0C0D 0E0F 0G0H 0I0J 0K0L 0M0N 0O0P
A half-unshuffle performs the reverse operation.

Provide functions in bitops.h which implement these operations
for 32-bit and 64-bit inputs, and add tests for them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/bitops.h | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/test-bitops.c   |  68 +++++++++++++++++++++++++++++++
 2 files changed, 176 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 755fdd1..15418a8 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -428,4 +428,112 @@ static inline uint64_t deposit64(uint64_t value, int start, int length,
     return (value & ~mask) | ((fieldval << start) & mask);
 }
 
+/**
+ * half_shuffle32:
+ * @value: 32-bit value (of which only the bottom 16 bits are of interest)
+ *
+ * Given an input value:
+ *  xxxx xxxx xxxx xxxx ABCD EFGH IJKL MNOP
+ * return the value where the bottom 16 bits are spread out into
+ * the odd bits in the word, and the even bits are zeroed:
+ *  0A0B 0C0D 0E0F 0G0H 0I0J 0K0L 0M0N 0O0P
+ *
+ * Any bits set in the top half of the input are ignored.
+ *
+ * Returns: the shuffled bits.
+ */
+static inline uint32_t half_shuffle32(uint32_t x)
+{
+    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
+     * It ignores any bits set in the top half of the input.
+     */
+    x = ((x & 0xFF00) << 8) | (x & 0x00FF);
+    x = ((x << 4) | x) & 0x0F0F0F0F;
+    x = ((x << 2) | x) & 0x33333333;
+    x = ((x << 1) | x) & 0x55555555;
+    return x;
+}
+
+/**
+ * half_shuffle64:
+ * @value: 64-bit value (of which only the bottom 32 bits are of interest)
+ *
+ * Given an input value:
+ *  xxxx xxxx xxxx .... xxxx xxxx ABCD EFGH IJKL MNOP QRST UVWX YZab cdef
+ * return the value where the bottom 32 bits are spread out into
+ * the odd bits in the word, and the even bits are zeroed:
+ *  0A0B 0C0D 0E0F 0G0H 0I0J 0K0L 0M0N .... 0U0V 0W0X 0Y0Z 0a0b 0c0d 0e0f
+ *
+ * Any bits set in the top half of the input are ignored.
+ *
+ * Returns: the shuffled bits.
+ */
+static inline uint64_t half_shuffle64(uint64_t x)
+{
+    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
+     * It ignores any bits set in the top half of the input.
+     */
+    x = ((x & 0xFFFF0000ULL) << 16) | (x & 0xFFFF);
+    x = ((x << 8) | x) & 0x00FF00FF00FF00FFULL;
+    x = ((x << 4) | x) & 0x0F0F0F0F0F0F0F0FULL;
+    x = ((x << 2) | x) & 0x3333333333333333ULL;
+    x = ((x << 1) | x) & 0x5555555555555555ULL;
+    return x;
+}
+
+/**
+ * half_unshuffle32:
+ * @value: 32-bit value (of which only the odd bits are of interest)
+ *
+ * Given an input value:
+ *  xAxB xCxD xExF xGxH xIxJ xKxL xMxN xOxP
+ * return the value where all the odd bits are compressed down
+ * into the low half of the word, and the high half is zeroed:
+ *  0000 0000 0000 0000 ABCD EFGH IJKL MNOP
+ *
+ * Any even bits set in the input are ignored.
+ *
+ * Returns: the unshuffled bits.
+ */
+static inline uint32_t half_unshuffle32(uint32_t x)
+{
+    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
+     * where it is called an inverse half shuffle.
+     */
+    x &= 0x55555555;
+    x = ((x >> 1) | x) & 0x33333333;
+    x = ((x >> 2) | x) & 0x0F0F0F0F;
+    x = ((x >> 4) | x) & 0x00FF00FF;
+    x = ((x >> 8) | x) & 0x0000FFFF;
+    return x;
+}
+
+/**
+ * half_unshuffle64:
+ * @value: 64-bit value (of which only the odd bits are of interest)
+ *
+ * Given an input value:
+ *  xAxB xCxD xExF xGxH xIxJ xKxL xMxN .... xUxV xWxX xYxZ xaxb xcxd xexf
+ * return the value where all the odd bits are compressed down
+ * into the low half of the word, and the high half is zeroed:
+ *  0000 0000 0000 .... 0000 0000 ABCD EFGH IJKL MNOP QRST UVWX YZab cdef
+ *
+ * Any even bits set in the input are ignored.
+ *
+ * Returns: the unshuffled bits.
+ */
+static inline uint64_t half_unshuffle64(uint64_t x)
+{
+    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
+     * where it is called an inverse half shuffle.
+     */
+    x &= 0x5555555555555555ULL;
+    x = ((x >> 1) | x) & 0x3333333333333333ULL;
+    x = ((x >> 2) | x) & 0x0F0F0F0F0F0F0F0FULL;
+    x = ((x >> 4) | x) & 0x00FF00FF00FF00FFULL;
+    x = ((x >> 8) | x) & 0x0000FFFF0000FFFFULL;
+    x = ((x >> 16) | x) & 0x00000000FFFFFFFFULL;
+    return x;
+}
+
 #endif
diff --git a/tests/test-bitops.c b/tests/test-bitops.c
index 5050950..353fc98 100644
--- a/tests/test-bitops.c
+++ b/tests/test-bitops.c
@@ -66,10 +66,78 @@ static void test_sextract64(void)
     }
 }
 
+typedef struct {
+    uint32_t unshuffled;
+    uint32_t shuffled;
+} Shuffle32Test;
+
+typedef struct {
+    uint64_t unshuffled;
+    uint64_t shuffled;
+} Shuffle64Test;
+
+static const Shuffle32Test test_shuffle32_data[] = {
+    { 0x0000FFFF, 0x55555555 },
+    { 0x000081C5, 0x40015011 },
+};
+
+static const Shuffle64Test test_shuffle64_data[] = {
+    { 0x00000000FFFFFFFFULL, 0x5555555555555555ULL },
+    { 0x00000000493AB02CULL, 0x1041054445000450ULL },
+};
+
+static void test_half_shuffle32(void)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(test_shuffle32_data); i++) {
+        const Shuffle32Test *test = &test_shuffle32_data[i];
+        uint32_t r = half_shuffle32(test->unshuffled);
+
+        g_assert_cmpint(r, ==, test->shuffled);
+    }
+}
+
+static void test_half_shuffle64(void)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(test_shuffle64_data); i++) {
+        const Shuffle64Test *test = &test_shuffle64_data[i];
+        uint64_t r = half_shuffle64(test->unshuffled);
+
+        g_assert_cmpint(r, ==, test->shuffled);
+    }
+}
+
+static void test_half_unshuffle32(void)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(test_shuffle32_data); i++) {
+        const Shuffle32Test *test = &test_shuffle32_data[i];
+        uint32_t r = half_unshuffle32(test->shuffled);
+
+        g_assert_cmpint(r, ==, test->unshuffled);
+    }
+}
+
+static void test_half_unshuffle64(void)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(test_shuffle64_data); i++) {
+        const Shuffle64Test *test = &test_shuffle64_data[i];
+        uint64_t r = half_unshuffle64(test->shuffled);
+
+        g_assert_cmpint(r, ==, test->unshuffled);
+    }
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
     g_test_add_func("/bitops/sextract32", test_sextract32);
     g_test_add_func("/bitops/sextract64", test_sextract64);
+    g_test_add_func("/bitops/half_shuffle32", test_half_shuffle32);
+    g_test_add_func("/bitops/half_shuffle64", test_half_shuffle64);
+    g_test_add_func("/bitops/half_unshuffle32", test_half_unshuffle32);
+    g_test_add_func("/bitops/half_unshuffle64", test_half_unshuffle64);
     return g_test_run();
 }
-- 
1.9.1

