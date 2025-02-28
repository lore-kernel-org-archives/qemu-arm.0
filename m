Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1161323njb;
        Fri, 28 Feb 2025 11:17:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaCnNd5RaJWR+uN6R8zMh7VPTPOnVs4Tlimhd/7Ffe/llhdiXsB6SI8I3qiv5aBNm7cEf+TmuScZULbA==@linaro.org
X-Google-Smtp-Source: AGHT+IHkJJIC7aYiaO6iBF4B9xUdE+3s05gckNzOV4P0C+mM38B7p1MZ8ngZghOyzO+j+S83+2PU
X-Received: by 2002:a0c:ef45:0:b0:6df:97ba:4f7a with SMTP id 6a1803df08f44-6e8a0d4a8e0mr54356426d6.33.1740770269711;
        Fri, 28 Feb 2025 11:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740770269; cv=none;
        d=google.com; s=arc-20240605;
        b=cgNl3hqtWOBAQxlYwmMldGljqSMe0YTriXMwgrlnmQLHSsDWg1QWNZzsj0osK3nwFe
         1t/2FjePejPWdHzc+IW5spADfo6OS0ICb/aEl4pqcj6NmSiAr1GyOkaHva2wg0xiujzQ
         QzyUsc266tQcvFkM8ZeHfoISWM+Z0I3C6/0xsPDZAUz1oQH3vxmqi+5lH2Q6ETaHOuEt
         5GH7wOdmGYy6Z751zLpF0f6AdVq1gBa9p+09I8HYL3BYBmLJhvQw9BWvzyDkdcyetOqs
         dYBQrsfgAWnJW9CNjKPI+VPv/AovH/O5L50LKpGis6E/TqxtBfDxyCImJK7jGQiVq2pa
         zezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fjU1scoyfl5EIaSm+J9opU/tuOBrWqDEPnsrPZdjWm0=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=S5VtcJ9VVaK3debLkvLpNCnnm5EKFQQb2W/4Dgtn7Mu/n0YP3+phUrpjKEFV/VKR6N
         LpntKE7bTemDjYkTmNAP9YzrZFHrLqhf6SGK8p8wfBQOk9ois9iqC0DBya41+ZV7h903
         jGTdIb6auGzyFclUPyPNWvtV+6OcOZKZ8kFeAPiOdOWuo2NhiItyYBNpSldFAn3Rf3ID
         xLrkhjcLdVgv7H15MD+ypu/Zvak04c8EYC+/9kMcz1HInhedWFjE5yTkdkic0JCQcEBi
         dLi2kg6INM79sCHxRUN/lKDA0VVYk5RPWX5PfJRR860QfRIhLvPsEfvHYIhfd3SVWn+X
         g4wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJXbjtBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8ac69eab6si9453406d6.177.2025.02.28.11.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 11:17:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJXbjtBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1to5rR-00066P-U1; Fri, 28 Feb 2025 14:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to5r6-00064M-4B
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 14:17:04 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to5qz-0003RG-03
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 14:17:03 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390dd362848so1929896f8f.3
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2025 11:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740770214; x=1741375014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fjU1scoyfl5EIaSm+J9opU/tuOBrWqDEPnsrPZdjWm0=;
 b=EJXbjtBQh2mLY5ncNR986r9+bL3awggca5Ucl9ZAK3NOmyCM8wZ2uCkL8/onTtqN4Q
 UbWnzgFmltDVkHxl4EZL9rRClbOxWHymGS1H/CDCFOp41ZsrPXT0tvwmvuZsNcE00xiS
 aHqPGhWue0Q2hJtAozdJgDCQNlreZwSuFxGjogDZYCrumX63sOSuk/RHY8fbVyQlaSq/
 O1jzvP8zgAhBqy59GweyiCkhoFPw3jAiara6QG3L4NP6hZX6QlyjUZ2yWUGBt6YtZmfR
 IecJc7Ke7ZTh0V50//Mut1+r+bpVvdzdfqXXk+VBnvx+IbRHDohwmJTzbQV0yf6KM5b9
 Q8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740770214; x=1741375014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjU1scoyfl5EIaSm+J9opU/tuOBrWqDEPnsrPZdjWm0=;
 b=mMrEo5FTHthxcPj/T6H8QbnK+ByesLzzyXtrmXoCdrecV7lq68FzyOtwzTBvpfQD8m
 wOV1jAbi0qUZOL1FoCtMwCLomvzvnkb6DwgPZBhIVq+T0bAleabXQaNzVNTF36+bnw84
 mXZinPnJtZsQYtlA6Iwz/C96Nbeo9OxmZ567i/YvXd/VA8qt2VtVF7NEX4ic1vWg/KBn
 bWAgdM5sE74duSW0hLtDgFPlWOF1X8aa7C/46HJfXBR9g0ZwRHl8Zj/rudCuqdebruP2
 Q7x2Z9VDerH+U8qxB5bZ2ST83H7NeT5evjSY6KnGsf2gjVRNCFkHQGX8IPy0vozFxWMP
 vOvw==
X-Gm-Message-State: AOJu0YxewohPOm4T6/dNEWNUVPRcfrbmIi2DuDHQUnaaD4ZAngHm0EMp
 MhvYFmY/Ksb5IfegMqvKri9kxkmctw5r6Br+QXWBugQjJ+HAENwuvuqga2+3f1NfLEZyoF9/fzY
 A
X-Gm-Gg: ASbGnctVTx8+GlZzZA9y+DXzM34IPGojKxPbzbTzG+HLgkrlc/YwDB8SQGj8nV4lFFa
 WN4toF4WYKRr6uizEzyBGtGMtVcURM4mRjlpySRlhLJtqDCIgF/+vMQ66dGHOtynihe7J9Gfrk0
 J+bE6lq2YhSjdnqWvKloCN+BnUaOaes0buHe40eKInvrll/Olcyytdfq8oFL0RNKB/CvrgN4y4Z
 OcFurwKMG53VJ1RzkVW8lk5GNGNnHfKUJhmwTk181QmSYxEYlmG1swiClk6vpBLUqeXsjq22JFF
 UDPG2omZnlzTqcbCUAJ902WON1DzX26l
X-Received: by 2002:a05:6000:2cd:b0:38f:2a32:abbb with SMTP id
 ffacd0b85a97d-390ec7cd373mr3282103f8f.4.1740770214273; 
 Fri, 28 Feb 2025 11:16:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485d6cdsm5980928f8f.84.2025.02.28.11.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 11:16:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] hw/net/smc91c111: Don't allow data register access to overrun
 buffer
Date: Fri, 28 Feb 2025 19:16:51 +0000
Message-ID: <20250228191652.1957208-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q6yG3eRVzTdI

For accesses to the 91c111 data register, the address within the
packet's data frame is determined by a combination of the pointer
register and the offset used to access the data register, so that you
can access data at effectively wider than byte width.  The pointer
register's pointer field is 11 bits wide, which is exactly the size
to index a 2048-byte data frame.

We weren't quite getting the logic right for ensuring that we end up
with a pointer value to use in the s->data[][] array that isn't out
of bounds:

 * we correctly mask when getting the initial pointer value
 * for the "autoincrement the pointer register" case, we
   correctly mask after adding 1 so that the pointer register
   wraps back around at the 2048 byte mark
 * but for the non-autoincrement case where we have to add the
   low 2 bits of the data register offset, we don't account
   for the possibility that the pointer register is 0x7ff
   and the addition should wrap

Fix this bug by factoring out the "get the p value to use as an array
index" into a function, making it use FIELD macro names rather than
hard-coded constants, and having a utility function that does "add a
value and wrap it" that we can use both for the "autoincrement" and
"add the offset bits" codepaths.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2758
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 20250228174802.1945417-1-peter.maydell@linaro.org
("hw/net/smc91c111: Fix potential array overflows")

I'd only just sent the other smc91c111 patchset when I found
another fuzzer bug for it in the bug tracker :-)

The "modernisation" of the code seemed clearer to me than
doing a minimal in-place fix (which would look something
like "p = (p + (offset & 3) & 0x7ff;" in both read and write
functions). But it does make the actual bugfix a little less
obvious.

---
 hw/net/smc91c111.c | 65 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 4a8f867d96e..f8012cb3681 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -13,6 +13,7 @@
 #include "net/net.h"
 #include "hw/irq.h"
 #include "hw/net/smc91c111.h"
+#include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
@@ -126,6 +127,13 @@ static const VMStateDescription vmstate_smc91c111 = {
 #define RS_TOOSHORT     0x0400
 #define RS_MULTICAST    0x0001
 
+FIELD(PTR, PTR, 0, 11)
+FIELD(PTR, NOT_EMPTY, 11, 1)
+FIELD(PTR, RESERVED, 12, 1)
+FIELD(PTR, READ, 13, 1)
+FIELD(PTR, AUTOINCR, 14, 1)
+FIELD(PTR, RCV, 15, 1)
+
 static inline bool packetnum_valid(int packet_num)
 {
     return packet_num >= 0 && packet_num < NUM_PACKETS;
@@ -372,6 +380,49 @@ static void smc91c111_reset(DeviceState *dev)
 #define SET_LOW(name, val) s->name = (s->name & 0xff00) | val
 #define SET_HIGH(name, val) s->name = (s->name & 0xff) | (val << 8)
 
+/*
+ * The pointer register's pointer is an 11 bit value (so it exactly
+ * indexes a 2048-byte data frame). Add the specified offset to it,
+ * wrapping around at the 2048 byte mark, and return the resulting
+ * wrapped value. There are flag bits in the top part of the register,
+ * but we can ignore them here as the mask will mask them out.
+ */
+static int ptr_reg_add(smc91c111_state *s, int offset)
+{
+    return (s->ptr + offset) & R_PTR_PTR_MASK;
+}
+
+/*
+ * For an access to the Data Register at @offset, return the
+ * required offset into the packet's data frame. This will
+ * perform the pointer register autoincrement if required, and
+ * guarantees to return an in-bounds offset.
+ */
+static int data_reg_ptr(smc91c111_state *s, int offset)
+{
+    int p;
+
+    if (s->ptr & R_PTR_AUTOINCR_MASK) {
+        /*
+         * Autoincrement: use the current pointer value, and
+         * increment the pointer register's pointer field.
+         */
+        p = FIELD_EX32(s->ptr, PTR, PTR);
+        s->ptr = FIELD_DP32(s->ptr, PTR, PTR, ptr_reg_add(s, 1));
+    } else {
+        /*
+         * No autoincrement: register offset determines which
+         * byte we're addressing. Setting the pointer to the top
+         * of the data buffer and then using the pointer wrapping
+         * to read the bottom byte of the buffer is not something
+         * sensible guest software will do, but the datasheet
+         * doesn't say what the behaviour is, so we don't forbid it.
+         */
+        p = ptr_reg_add(s, offset & 3);
+    }
+    return p;
+}
+
 static void smc91c111_writeb(void *opaque, hwaddr offset,
                              uint32_t value)
 {
@@ -518,12 +569,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
                                   n);
                     return;
                 }
-                p = s->ptr & 0x07ff;
-                if (s->ptr & 0x4000) {
-                    s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x7ff);
-                } else {
-                    p += (offset & 3);
-                }
+                p = data_reg_ptr(s, offset);
                 s->data[n][p] = value;
             }
             return;
@@ -673,12 +719,7 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
                                   n);
                     return 0;
                 }
-                p = s->ptr & 0x07ff;
-                if (s->ptr & 0x4000) {
-                    s->ptr = (s->ptr & 0xf800) | ((s->ptr + 1) & 0x07ff);
-                } else {
-                    p += (offset & 3);
-                }
+                p = data_reg_ptr(s, offset);
                 return s->data[n][p];
             }
         case 12: /* Interrupt status.  */
-- 
2.43.0

