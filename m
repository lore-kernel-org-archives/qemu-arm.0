Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53043FD8FE8
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 17:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvfad-0001DM-QB; Thu, 26 Feb 2026 12:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvfac-0001CR-7L
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 12:55:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvfaa-00016Y-Ik
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 12:55:53 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4398dd671daso1257324f8f.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 09:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772128551; x=1772733351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z+x9GYorM5G7Ev1ETF6SyHFY+h48DhPDf57BTit2zdo=;
 b=vV5vVkrRToW/MimEP76iHHjqWHAlVw5x4/AscJ/cpEpD50nXp/GEA5S/0XmsTz4aPR
 kGQ0sz+/5r+IOPHeTAbeAhL6JMBdGRaMdgowKSxzEfuONZAzLoS5UrN95f5hPx+ZuyE/
 JLo0FZ9PZjgPe+etUXx3WUDZXWGxhxCzNac5+oDX53du+21B4sRbUply17qjLC5burMR
 EbXJP1vLOVRSrMj3Py32Q4AZ+zbPk8izP7lRpikC2N0HCPFMEpiPQu1kqBABx+PSGSld
 Co70+asaSjtQtn6JHkLFYqXIcohIdW8rGTX68Tjgw8/svde8pfJaiO5zCObewzlXfKKx
 DupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772128551; x=1772733351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+x9GYorM5G7Ev1ETF6SyHFY+h48DhPDf57BTit2zdo=;
 b=m8adKPtbCedb2zXVRRs0gq9MST5P5OrlW5DNcrfzWUfbB4LbZxbKBcYFnnAaetb1An
 ogIIUIC8+tpHxRy8XEchvaF8KZUqEpPmBU268u+AJ0YyHgUptEFtr4HPir7HrarRnndZ
 9ByULBeZqEGgRIrOJhAaxFb57cVmGHjxS5mahoigivKAylwKPvm0RYoDzhaf/hdOE9Zd
 hi1TczDrqmZZaX8SR8XR7Yxed+U5n5MAqMqZSL5rskVmEHpos7PnmaDa2skXbEX2A5M9
 Qu3RnEZUDywrWa8IoAz56I4Uxwy/gtx2WuJ6/RGRAjYVz9lhefP/QWJkCbHd1/x2IcO5
 215w==
X-Gm-Message-State: AOJu0Yyb1s01y3/mxscRk+T1CSZUT06COlAZeecdIqOFnWzMYsWx6hdF
 4a1QHtYQ6mBURSI7+58TsXXhiEh++ta1963nQaPkJD6ef+hyi0/AntLiWoOVADrhrxlX0M3JU3i
 Rm7B6
X-Gm-Gg: ATEYQzy2ksEqetE/JC2LEwpvMSNiTa03jHJzH9c+0wItTWhhwJd+VbWu/Le2VG0LhFQ
 wN7y0VsOXdqWDzJ83YR8UeLtOJuSYfnap3FuJtw1Mlo6C9O5e3r7+u/3NcbRVkBocYFxWmBOd3r
 ZcomWnoL5cEMUDkPZgDrraQzYs3CkA45XKS/6u9f0XPq20FHUDQDF4JrIs5A6gEVeXryJP9xBQP
 e7k8ejLlIpkf2ci/eybzS+oN0VtN/Kb0TodMYB54s26Gk/Je6ccZHSEojh9UUB0IA/eA0Ii6Q96
 sPmJkcoPPcfws0ifW/d6Gbdp7rTWDB3VEgE5Aw68MJqpza7Tt7b/FDPM+97ipV3Fhpue/IUNzel
 yp+rqaD0VydKa11pnYLJIqFbr63q4UevHjTTO4pNBW+UqN/MFTbiGG65LDhZ6fPV3lS6h7PXblk
 k6nNL48yWSEwPklwhxcYov/GZ9ptBeaedWTexY8lvuwfzxXMiyBrFlxFFvVysqZChwb+/q4TGaQ
 Kw9kXbyUcl6lCnPiZxpqkAwd9Hmmng=
X-Received: by 2002:a05:6000:400a:b0:436:3732:cfa6 with SMTP id
 ffacd0b85a97d-43997f46206mr6733906f8f.53.1772128550671; 
 Thu, 26 Feb 2026 09:55:50 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75b19esm843372f8f.25.2026.02.26.09.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 09:55:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net/smc91c111: Don't allow negative-length packets
Date: Thu, 26 Feb 2026 17:55:49 +0000
Message-ID: <20260226175549.1319476-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The smc91c111 data frame format in memory (figure 8-1 in the
datasheet) includes a "byte count" field which is intended to be the
total size of the data frame, including not just the packet data but
also the leading and trailing information like the status word and
the byte count field itself.  It is therefore possible for the guest
to set this to a value so small that the leading and trailing fields
won't fit and the packet has effectively a negative area.

We weren't checking for this, with the result that when we subtract 6
from the length to get the length of the packet proper we end up with
a negative length, which is then inconsistently handled in the
qemu_send_packet() code such that we can try to transmit a very large
amount of data and read off the end of the device's data array.

Treat excessively small length values the same way we do excessively
large values.  As with the oversized case, the datasheet does not
describe what happens for this software error case, and there is no
relevant tx error condition for this, so we just log and drop the
packet.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3304
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/smc91c111.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 3420d8e28e..3b526524fb 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -30,6 +30,12 @@
  * LAN91C111 datasheet).
  */
 #define MAX_PACKET_SIZE 2048
+/*
+ * Size of the non-data fields in a data frame: status word,
+ * byte count, control byte, and last data byte; this defines
+ * the smallest value the byte count in the frame can validly be.
+ */
+#define MIN_PACKET_SIZE 6
 
 #define TYPE_SMC91C111 "smc91c111"
 OBJECT_DECLARE_SIMPLE_TYPE(smc91c111_state, SMC91C111)
@@ -289,7 +295,7 @@ static void smc91c111_do_tx(smc91c111_state *s)
         *(p++) = 0x40;
         len = *(p++);
         len |= ((int)*(p++)) << 8;
-        if (len > MAX_PACKET_SIZE) {
+        if (len < MIN_PACKET_SIZE || len > MAX_PACKET_SIZE) {
             /*
              * Datasheet doesn't say what to do here, and there is no
              * relevant tx error condition listed. Log, and drop the packet.
@@ -300,7 +306,13 @@ static void smc91c111_do_tx(smc91c111_state *s)
             smc91c111_complete_tx_packet(s, packetnum);
             continue;
         }
-        len -= 6;
+        /*
+         * Convert from size of the data frame to number of bytes of
+         * actual packet data. Whether the "last data byte" field is
+         * included in the packet depends on the ODD bit in the control
+         * byte at the end of the frame.
+         */
+        len -= MIN_PACKET_SIZE;
         control = p[len + 1];
         if (control & 0x20)
             len++;
-- 
2.43.0


