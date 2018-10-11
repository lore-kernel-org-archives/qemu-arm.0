Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1809576wrt;
        Wed, 10 Oct 2018 19:20:22 -0700 (PDT)
X-Google-Smtp-Source: ACcGV633JmgvaEXpBv2Sm/dLh1x5HUBO3MewX5N4oHqetKifYoqCh6QrBH1aSH8yMvx/vVeGTfh1
X-Received: by 2002:a0c:ade7:: with SMTP id x36-v6mr29659501qvc.174.1539224422389;
        Wed, 10 Oct 2018 19:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224422; cv=none;
        d=google.com; s=arc-20160816;
        b=RAS4Weih59eaYPs2bEtyKQ3YrrMmE+J4mhp9vA/d0ifBxHyD9YGksHB43+mM1eYCHT
         zIOANeL9rYdF5w+FItxVYiV0DJTI4PSYGVw/qExvuTm+XMWVIrwHr/jKP+eg95/4Kri3
         kuqyatW4gdLeEyvmf+vW4z+hQJfAw7tSwBXcaOIXjQ5FbXPxLEmsVVsSJ1pHyorWkkEX
         5gQxwJKVlchKSHuZFcOcvdWrQzAB8EfOxCPXJV86Eu7vLR/XKx7JPEPWm4GBH9l+f38p
         N5qM7DB6lukTEyieY1KFa8vxF+cRX/UkOJmrPo7YKqtvcC49IqXReAZEGKTmJnC5xvOr
         FGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=vsY/YGStYWnKsuaxfI9g/7633WhYN35j6JsiY5OvQfI=;
        b=YTyfFO45DUnr4WeHehuhTZtaQA1jsig3VgA/zxy9LOQCJfaY1szz7rJgNeAKPUzzhI
         Trjp9V4HAHhYboasDZHR0Im01GSzMp3VeGCyLjODS9Ot7vlZvHsg+x3MbhmAT5iR2Kot
         UYQ0LGFnktVmaiVxDXQQQ3ORthyctXJCl55ZCGRxOOmCG1k0kysPzeMLIzLMa9iaZ3Nm
         wp3HPRHOjdaA3iYCjB6wjrNr8f2s6tmSe/l1TxCUXVo0nomIy9TBbKFEJs7qP6mt7RQ9
         dhtT+nOAbp5JN0WUm17ILlbW4dVps4Dpn9gyFkxi4VbCYHD9ai9Bao+rexey3ZwUe3oO
         60sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aBsB3frC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e4-v6si2153577qtb.52.2018.10.10.19.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aBsB3frC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQaL-0002Vh-Qt
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:20:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZi-00029W-J2
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZh-0004MP-I2
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 22:19:42 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:35597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZf-0004KR-6D; Wed, 10 Oct 2018 22:19:39 -0400
Received: by mail-lj1-x22d.google.com with SMTP id o14-v6so6747720ljj.2;
	Wed, 10 Oct 2018 19:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vsY/YGStYWnKsuaxfI9g/7633WhYN35j6JsiY5OvQfI=;
	b=aBsB3frCt6plzIQgSADgnWXRE3PLtF6d3+GbL/pPwNPZEos+D76YHbtFHkHkgSYTWP
	kLjiGXHpOGZLxSlP1YIRjhnjhsXyCanDRdkcadAxJbzl/3x7FS8EJckfFpq7CA9lWLQ5
	jFXQZMizdZEmP0aAXwsH6W9TCMgBfDuAcPvGQu0RI57ADgcUAi6uyLohhNMYINpH5GRC
	/PH40y2Eswc0N3+K06bIgyIIz00qVcKEAKgg61i3CWLSOtABv6DxLgDwTL/VvKqPoN5g
	KqqvSRzFYGUu01Vx0ww/l+vszyQEAnCE1vbvzpNG3aVgWSggmxD+Wx/Z5CoDmXw7fsw7
	q/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vsY/YGStYWnKsuaxfI9g/7633WhYN35j6JsiY5OvQfI=;
	b=F2eaKI6YG5kUAmui6ZMFK4X1tqr4fIGeRqeTDOkUiC4Ju5Jc/SOj/KitM+wZJ6dWuz
	U1YFs37vGBa7vTKEuBDdG1TR+/7fuzcrGmNshvM+AXxf4nMo6jPSKIMVQpJISMvjulRu
	qKkXmdqrTSJ4kAQt7kHXzgZzaDr4KQuZp482kQNOx9Mk/uXbQps0SSuxy4O/7gRjEUqE
	b+FhQ72LWV9haBKc3u5GmUItRnBDz/O187l7XIy7jUK09GiTf5k9qogSBFFUB16RHN5Z
	HqbfD2vEJ/vWEdzQJKZJFyVni5LJ2irFOxR6wtBMpzxNrWs5u6rE20DWELfZNVmc1osH
	e3Pw==
X-Gm-Message-State: ABuFfogj4wT5uLEhyqidyWQf74Oy5vaYBtW/3Ezpaltfl8m4AyKkxeQe
	dprAN0m4UQBEWRvJ6X56AmjEPQzhzo4=
X-Received: by 2002:a2e:7a19:: with SMTP id
	v25-v6mr23781415ljc.147.1539224377596; 
	Wed, 10 Oct 2018 19:19:37 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	j5-v6sm5321053lfb.62.2018.10.10.19.19.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:36 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:22 +0200
Message-Id: <20181011021931.4249-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::22d
Subject: [Qemu-arm] [PATCH v2 03/12] net: cadence_gem: Use uint32_t for
 32bit descriptor words
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DjYBJlHVaWTp

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use uint32_t instead of unsigned to describe 32bit descriptor words.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c         | 42 ++++++++++++++++++------------------
 include/hw/net/cadence_gem.h |  2 +-
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 901c173970..31f3fe0e81 100644
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
index 35de622063..633d564dc3 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -74,7 +74,7 @@ typedef struct CadenceGEMState {
 
     uint8_t can_rx_state; /* Debug only */
 
-    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
+    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.17.1

