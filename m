Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6433914wrt;
        Wed, 3 Oct 2018 08:11:06 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63IM6WYen94pJKCNkzY1hTFwmFlfK05ORObzb+nZrasYeXxt+nq7chv5blwzyiLLU9hw03t
X-Received: by 2002:a37:4a96:: with SMTP id x144-v6mr1538518qka.112.1538579466096;
        Wed, 03 Oct 2018 08:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579466; cv=none;
        d=google.com; s=arc-20160816;
        b=VP/FmJzj7qqtPK7igdUHJ6l2sUZKxmhfzoUR6ZkL4SwTh7SO8gxmN2EUmriQaq9flm
         Ug81Oj7RX82OpSI3kWP5lHvSKKBy9Tkm9znS5VEYlJqfL0LfWZCZ3dIcxWdPR2sbq9H5
         hzt75HTy5N75sQSIU0AjNKiU7sL6ejv0OTkiqAtU6P/J1y1jqcMnK4b+2fAUi6ylhQQq
         n7aBSm4h1M12XVe1DCAF7UBweVoINYp/QrpH5UQZgLZ5ei+PbFYcHPqxgkfe669JGUfq
         c35T0Ui5E0pxxuPj5QDS016WHEFPfXBknkG9cgF/aVJnr94bFmR5IgIwfZSCHLRVm5kP
         5KTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YDD93BkvlhktRMuNmt6kFqzFq9lqnMzaZQtTkxxOD/Y=;
        b=KUJkMUDps5qZ4sclGufyfDGK6+LBWx99hsePQ7k6Jj9clkzaIKvgS1KX80MMBMCvrf
         C50khYk51+P65Jq5oZKTbBaHNDjimgWj5kJ/kRzX7+kYVYo0m47v7W+UjXDW7+GBKbCZ
         m4UcrB5GY40GbmQFsJKQiaOfeBSNZnYAj66qf8SoSc49pV+VdYFr2pMvykOUN0p/qTTv
         4R6fn/lgWnnCJvPA3Xsufr6U0vYLn8TVDaF3wpLim/bOWEtWMXWnqL1YX8qSo9liPvOD
         JXPWQ+DNujlQ4xW8UPaa5hAsXuYdwWi93sUE8AUdJHzEooTte/KcpD4qNu0LggpErk3S
         ftfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTGLOiOG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z3-v6si1009619qth.129.2018.10.03.08.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTGLOiOG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7inp-0005nu-CJ
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:11:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7imt-0005kF-EW
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 11:10:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ims-0004bW-Ec
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 11:10:07 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7imq-0004b3-EE; Wed, 03 Oct 2018 11:10:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id i4-v6so1700367pgq.9;
	Wed, 03 Oct 2018 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YDD93BkvlhktRMuNmt6kFqzFq9lqnMzaZQtTkxxOD/Y=;
	b=tTGLOiOG3+1QrERUQyxExkb02UPvnBTjdQBHtOE2YlyjvpQe/leijG592WK6RcaHGu
	02BlECPnbNEfLXGQ+XYWZcwioz+SOhvZ+pcXjEZY2AqCx3iNs5NKDLR7DZbSF+JF7N3D
	3xEbpKFx9kfBTcDgFZNZIsANvzZJb9YoYHfzjl31U/DRLJXFSM0vkiQetx+t6dEYIQ1Y
	zPQ/TssperZo0CMoBYFESFHg4CwPC1KjEZGe5w5Q09Uv8f/IECmo29YG+xXMHbgL2xo3
	6dgLR5SJ6UiNWK7sVLwmC3HFC8M6Cv8lyp24zuK3G0Ji8bp5rArO0GpKzhB392eMpm0I
	paug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YDD93BkvlhktRMuNmt6kFqzFq9lqnMzaZQtTkxxOD/Y=;
	b=eFiyALyaaTRw2eKv/1UbKxf0H/DLQw+6/iFBCKJM3cnMzZCnuAA6d1egI86Lt52ezO
	YD2XDH/FTrDREebU4v1U85Pz85btSKZzb6n746/ic8uNaVdA2pX3DEUaUiCq7pxqjGN8
	m4SJPa3MlsoLpR9ZUKQpqnXnMdGha1RDjSkguTeh/SCUlBaxMlr9i/T3YWrs3kEmUWOe
	q2lqNgJn07bARXNXRGlPk3E0BMho9EIfhjiJNrvkuCa6dSEV0n/Sw8yKNkwcKJOCi6LM
	IwqKvI7hQiembFnAgbsMrHkX5eG5vOpbk6+C2M8glzb60P+TKp1BO9wj6NL3vlQmSuuC
	gbWw==
X-Gm-Message-State: ABuFfog1v71vGcGY0Uy01t4jof3MJjHKVgUBGHyR441DQtU3eLcho/rg
	CFWdJzehBKOX8KD38t8J170jP+do4sM=
X-Received: by 2002:a63:a362:: with SMTP id
	v34-v6mr1796402pgn.261.1538579402985; 
	Wed, 03 Oct 2018 08:10:02 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	p13-v6sm6387049pfd.65.2018.10.03.08.10.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:10:01 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:37 +0700
Message-Id: <1538579266-8389-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: [Qemu-devel] [PATCH v1 03/12] net: cadence_gem: Use uint32_t for
 32bit descriptor words
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7CwGuEfqUdg

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use uint32_t instead of unsigned to describe 32bit descriptor words.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 42 +++++++++++++++++++++---------------------
 include/hw/net/cadence_gem.h |  2 +-
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 901c173..31f3fe0 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -302,42 +302,42 @@
 
 #define GEM_MODID_VALUE 0x00020118
 
-static inline unsigned tx_desc_get_buffer(unsigned *desc)
+static inline unsigned tx_desc_get_buffer(uint32_t *desc)
 {
     return desc[0];
 }
 
-static inline unsigned tx_desc_get_used(unsigned *desc)
+static inline unsigned tx_desc_get_used(uint32_t *desc)
 {
     return (desc[1] & DESC_1_USED) ? 1 : 0;
 }
 
-static inline void tx_desc_set_used(unsigned *desc)
+static inline void tx_desc_set_used(uint32_t *desc)
 {
     desc[1] |= DESC_1_USED;
 }
 
-static inline unsigned tx_desc_get_wrap(unsigned *desc)
+static inline unsigned tx_desc_get_wrap(uint32_t *desc)
 {
     return (desc[1] & DESC_1_TX_WRAP) ? 1 : 0;
 }
 
-static inline unsigned tx_desc_get_last(unsigned *desc)
+static inline unsigned tx_desc_get_last(uint32_t *desc)
 {
     return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
 }
 
-static inline void tx_desc_set_last(unsigned *desc)
+static inline void tx_desc_set_last(uint32_t *desc)
 {
     desc[1] |= DESC_1_TX_LAST;
 }
 
-static inline unsigned tx_desc_get_length(unsigned *desc)
+static inline unsigned tx_desc_get_length(uint32_t *desc)
 {
     return desc[1] & DESC_1_LENGTH;
 }
 
-static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
+static inline void print_gem_tx_desc(uint32_t *desc, uint8_t queue)
 {
     DB_PRINT("TXDESC (queue %" PRId8 "):\n", queue);
     DB_PRINT("bufaddr: 0x%08x\n", *desc);
@@ -347,58 +347,58 @@ static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
     DB_PRINT("length:  %d\n", tx_desc_get_length(desc));
 }
 
-static inline unsigned rx_desc_get_buffer(unsigned *desc)
+static inline unsigned rx_desc_get_buffer(uint32_t *desc)
 {
     return desc[0] & ~0x3UL;
 }
 
-static inline unsigned rx_desc_get_wrap(unsigned *desc)
+static inline unsigned rx_desc_get_wrap(uint32_t *desc)
 {
     return desc[0] & DESC_0_RX_WRAP ? 1 : 0;
 }
 
-static inline unsigned rx_desc_get_ownership(unsigned *desc)
+static inline unsigned rx_desc_get_ownership(uint32_t *desc)
 {
     return desc[0] & DESC_0_RX_OWNERSHIP ? 1 : 0;
 }
 
-static inline void rx_desc_set_ownership(unsigned *desc)
+static inline void rx_desc_set_ownership(uint32_t *desc)
 {
     desc[0] |= DESC_0_RX_OWNERSHIP;
 }
 
-static inline void rx_desc_set_sof(unsigned *desc)
+static inline void rx_desc_set_sof(uint32_t *desc)
 {
     desc[1] |= DESC_1_RX_SOF;
 }
 
-static inline void rx_desc_set_eof(unsigned *desc)
+static inline void rx_desc_set_eof(uint32_t *desc)
 {
     desc[1] |= DESC_1_RX_EOF;
 }
 
-static inline void rx_desc_set_length(unsigned *desc, unsigned len)
+static inline void rx_desc_set_length(uint32_t *desc, unsigned len)
 {
     desc[1] &= ~DESC_1_LENGTH;
     desc[1] |= len;
 }
 
-static inline void rx_desc_set_broadcast(unsigned *desc)
+static inline void rx_desc_set_broadcast(uint32_t *desc)
 {
     desc[1] |= R_DESC_1_RX_BROADCAST;
 }
 
-static inline void rx_desc_set_unicast_hash(unsigned *desc)
+static inline void rx_desc_set_unicast_hash(uint32_t *desc)
 {
     desc[1] |= R_DESC_1_RX_UNICAST_HASH;
 }
 
-static inline void rx_desc_set_multicast_hash(unsigned *desc)
+static inline void rx_desc_set_multicast_hash(uint32_t *desc)
 {
     desc[1] |= R_DESC_1_RX_MULTICAST_HASH;
 }
 
-static inline void rx_desc_set_sar(unsigned *desc, int sar_idx)
+static inline void rx_desc_set_sar(uint32_t *desc, int sar_idx)
 {
     desc[1] = deposit32(desc[1], R_DESC_1_RX_SAR_SHIFT, R_DESC_1_RX_SAR_LENGTH,
                         sar_idx);
@@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
  */
 static void gem_transmit(CadenceGEMState *s)
 {
-    unsigned    desc[2];
+    uint32_t desc[2];
     hwaddr packet_desc_addr;
     uint8_t     tx_packet[2048];
     uint8_t     *p;
@@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
 
             /* Last descriptor for this packet; hand the whole thing off */
             if (tx_desc_get_last(desc)) {
-                unsigned    desc_first[2];
+                uint32_t desc_first[2];
 
                 /* Modify the 1st descriptor of this packet to be owned by
                  * the processor.
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 35de622..633d564 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -74,7 +74,7 @@ typedef struct CadenceGEMState {
 
     uint8_t can_rx_state; /* Debug only */
 
-    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
+    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.7.4

