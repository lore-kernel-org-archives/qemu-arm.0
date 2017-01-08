Received: by 10.25.205.13 with SMTP id d13csp11030550lfg;
        Sun, 8 Jan 2017 00:39:36 -0800 (PST)
X-Received: by 10.200.50.209 with SMTP id a17mr3177204qtb.288.1483864776325;
        Sun, 08 Jan 2017 00:39:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y187si33444529qka.67.2017.01.08.00.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Jan 2017 00:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQ90n-0004kY-N3
	for alex.bennee@linaro.org; Sun, 08 Jan 2017 03:39:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90P-0004ZD-Gl
	for qemu-arm@nongnu.org; Sun, 08 Jan 2017 03:39:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90O-0000OT-I2
	for qemu-arm@nongnu.org; Sun, 08 Jan 2017 03:39:09 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cQ90L-0000Nc-1j; Sun, 08 Jan 2017 03:39:05 -0500
Received: by mail-lf0-x244.google.com with SMTP id v186so3083826lfa.2;
	Sun, 08 Jan 2017 00:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WZrkTaLxfQnZPhMLmKEJfj6Ws77x/mDGW446gLbNY6I=;
	b=EWJ/PUv9zHmRM/Ps7H4UXXPth5Pf8A0oGNBFFFhvCsiia4eSndnh9D/4HP3U+rcglS
	L8aIl5RxCnV788Vy0x7teaCwD3ZU46JxNCkBK/sgxEEbVSb+gre9kbs0z+/OkXWcFxSj
	tmEPVyFNlcpbBZ2b3l7UnMxyxyTht5mDI5rjmr95M8la1ZVSHQdOEnEYjoKWGgHD8iEV
	5+Djb19w1ePl43D/V8evy7blkuBKt/C1FxPM1kHAEqMp/ail4dT2F9FFf9rCDZOguS78
	9tx85Ysr1q+Mo1v3wJkP+dcH3rk55SqcIW+X7IBqZoamRXIlYyzjFWK0/326wXVaXJTv
	lM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WZrkTaLxfQnZPhMLmKEJfj6Ws77x/mDGW446gLbNY6I=;
	b=Uo8+fsisKOZ0JnWclJYrbODD9xyoLahCEyTl6oynWkDqDqcROvmESv97HcVYu/+lg3
	N6DBh5Jwn80d7aLI32fIiUQE9xRRFiq7s/RezjxwGq73A4JvtzmNxc1SOLYUdXgjwiuA
	U7dsQKoowaSGgzx9q54IjhXYwqNvs2WiSbi0NTWo6X2Ldt+6VzTJoNltKvhX0Tv3xQHu
	Q9+IYw8si6p9/xOwW9DhNah17SovQEyE4Z/FZwZLEflCOL3f/wVSxwvjJbMVFnnLx9Db
	s4mvLexdFG2qo3WJ6awpBN00D0KJPcXjGW9ZJ4j89SNHD/t0NOJR2JHi+UF0o9D8jHi/
	Zv0w==
X-Gm-Message-State: AIkVDXJy/BZFwGVaNTqDBCz9XBdxYQ4eBLYFxl+X0PJ8aBsmQ24X243K+vFGKpggeYOCaA==
X-Received: by 10.25.127.2 with SMTP id a2mr6949657lfd.68.1483864743627;
	Sun, 08 Jan 2017 00:39:03 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50])
	by smtp.gmail.com with ESMTPSA id 1sm18532752ljv.40.2017.01.08.00.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jan 2017 00:39:03 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Sun,  8 Jan 2017 09:38:52 +0100
Message-Id: <20170108083854.5006-2-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170108083854.5006-1-mar.krzeminski@gmail.com>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v3 1/3] block: m25p80: Add Quad Page Program 4byte
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
	mar.krzeminski@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ji4I7FbGHeUN

Some flash chips have additional page program opcode that
takes only 4 byte address. This commit adds support
for such command in Qemu.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index e3c1166..6dff81b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -326,6 +326,7 @@ typedef enum {
     PP4_4 = 0x3e,
     DPP = 0xa2,
     QPP = 0x32,
+    QPP_4 = 0x34,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -574,6 +575,7 @@ static inline int get_addr_length(Flash *s)
    switch (s->cmd_in_progress) {
    case PP4:
    case PP4_4:
+   case QPP_4:
    case READ4:
    case QIOR4:
    case ERASE4_4K:
@@ -607,6 +609,7 @@ static void complete_collecting_data(Flash *s)
     switch (s->cmd_in_progress) {
     case DPP:
     case QPP:
+    case QPP_4:
     case PP:
     case PP4:
     case PP4_4:
@@ -874,6 +877,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case READ4:
     case DPP:
     case QPP:
+    case QPP_4:
     case PP:
     case PP4:
     case PP4_4:
-- 
2.9.3

