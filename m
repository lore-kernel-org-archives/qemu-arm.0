Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6436221wrt;
        Wed, 3 Oct 2018 08:13:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62iUOEtNF4+XP5WqFQQy7zBwlmeTfXZxNrf3vXA0zjYLdxef7hB96e40aFglItiURk2ohqn
X-Received: by 2002:aed:2b22:: with SMTP id p31-v6mr1623849qtd.118.1538579582260;
        Wed, 03 Oct 2018 08:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579582; cv=none;
        d=google.com; s=arc-20160816;
        b=Epgzi7n+KafudkJUsK5G9hjBTKXrJJdeX1Y1QWkKPFXChyXfS3OtetJMJi3Wt8nU71
         x5LG8UGioEr9pWbrgFU/QVtQQDnUFaxJ0bLFA6kw26aoot8At65iokgb41k0oSkEzQno
         js5LMt7hiz+vI+98HdZpmatIzL2P+cR629BlbFupfDbrU6lO2y5KKXckGeQQXTawsq0v
         NE4+OjShkNaFMRrhYf82UK2l1GykF0ZXRqRSM1omRVbVIHbwsGVc2yBm3kh7AvUDf590
         GTdvnC3RtqZZCOFdZPZ+hbpsGquyYBy5y/5yVx+7h+ms49+scfj2TH9DzW6sAixoaWjp
         0A0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=r4kf8UbnjKlRkJt58m/EBp7ToDI72R3sGIgya8tVMG4=;
        b=ZrM+J3k5IXUWNiV6Iajm3hPbSnsDVTViG6ZX2EMZhKLHygBB0IMYqneXtSZVM6jKf+
         wXg2b1cOn8fxp7NK+V/+rhz7MwM6Dltwd8BH4zIHg02bP763u6oVZbBEC73tDBnqm76E
         9/Fh56ZWMpKdK+Fem2j+2Hvz2nl5fisT5tL3qWX6I7wVy90x9uAwlHMQHaE367TZFupC
         dWqJE7OcMhs+5a3TpqPDzgakpl5cTIXxVNiqBy4qtCqvImNsDChV/uOVjDcMqy4zgMY1
         2q/Ot75YW38SjluPBG9kiknuMS0Yk69MRCP05+eiXYp+8IFloHnLcj8TDjePmiHqa4Jv
         nIiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WyC2dQF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n12-v6si1070158qta.256.2018.10.03.08.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WyC2dQF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7iph-0001Z5-JN
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:13:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ip8-0000P5-TC
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:12:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ip7-00068X-1J
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:12:26 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7ip1-00066C-QA; Wed, 03 Oct 2018 11:12:19 -0400
Received: by mail-pf1-x443.google.com with SMTP id r64-v6so1818119pfb.13;
	Wed, 03 Oct 2018 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r4kf8UbnjKlRkJt58m/EBp7ToDI72R3sGIgya8tVMG4=;
	b=WyC2dQF1QqctYp/1V4iFb3bmRAwyjViffRlpNKcLFXBEohO6IvxUsFjoj3fViqXIwT
	JF1HITYvGFld7bTiexL2O5u4qI4iVP98JZJjekXZ4YTHaHoyaU9O6WTnoGLuDjpiHxcE
	+nn6EhW7GOuEr9ILm0qS29a4Ml7YOmPN3hRPJRDLVcEeobK+seEnw54IC/V8RsiSbyQ7
	IcTCWMiPdUx2qHMVhqYxD+n/iAHP+RKBz5ZiHXi9KVvbDgE57fRl/PuTQ3aFC541bN4r
	Rc9gakAAaqXTpkTt3K8DBfIn8z20k6qw/lifCOE7UguKKAete/uR31z1z+I1QRJcd7wu
	QlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r4kf8UbnjKlRkJt58m/EBp7ToDI72R3sGIgya8tVMG4=;
	b=faXH2ccFHHZxDGiDhh3Jm3Fs2ApmllJBppiBjwgJcBQCMO8QFKvYJe3qnsg85JChUS
	vy5EcHxlqm6Z5kHKzQKpENFaC5lIQTOPlbq8zrcscxIazxgjbaqIy4K1aOUGjtykQhFd
	3OHjGttxF4F+E3lduCHIFUELQPGE9BpEO/Fxo0XNVrznqnfyPQsmeehDVkNTVVLoa/AI
	vCqJSGW56xDBg1lblliNsgL5ckjtNgJr8tkQbZyA0pXkleI7NABFXK65Ht7deCrE34iS
	J0Q/o0ZRAJSt0Nmij4IgX8oxHzKwnsA7mpDLpxBaVk0NXXM+uVsXnaPO59TdUwuvHU+f
	mWKQ==
X-Gm-Message-State: ABuFfogyEIGutnMWT6LP8X6Idjei05WWngAsbMcXYNDVTsbq97HIwmhf
	6H+JvBYUD3rXBs9remmqS+RiQsB8j/c=
X-Received: by 2002:a65:42c2:: with SMTP id
	l2-v6mr1719343pgp.139.1538579538339; 
	Wed, 03 Oct 2018 08:12:18 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	20-v6sm1901286pge.77.2018.10.03.08.12.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:12:17 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:41 +0700
Message-Id: <1538579266-8389-8-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v1 07/12] net: cadence_gem: Implement support for
 64bit descriptor addresses
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SaqKYDTpYaUT

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Implement support for 64bit descriptor addresses.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 47 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index ab02515..f93cd8e 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -153,6 +153,9 @@
 #define GEM_RECEIVE_Q1_PTR              (0x00000480 / 4)
 #define GEM_RECEIVE_Q7_PTR              (GEM_RECEIVE_Q1_PTR + 6)
 
+#define GEM_TBQPH                       (0x000004C8 / 4)
+#define GEM_RBQPH                       (0x000004D4 / 4)
+
 #define GEM_INT_Q1_ENABLE               (0x00000600 / 4)
 #define GEM_INT_Q7_ENABLE               (GEM_INT_Q1_ENABLE + 6)
 
@@ -832,18 +835,42 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
     return 0;
 }
 
+static hwaddr gem_get_desc_addr(CadenceGEMState *s, bool tx, int q)
+{
+    hwaddr desc_addr = 0;
+
+    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+        desc_addr = s->regs[tx ? GEM_TBQPH : GEM_RBQPH];
+    }
+    desc_addr <<= 32;
+    desc_addr |= tx ? s->tx_desc_addr[q] : s->rx_desc_addr[q];
+    return desc_addr;
+}
+
+static hwaddr gem_get_tx_desc_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_desc_addr(s, true, q);
+}
+
+static hwaddr gem_get_rx_desc_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_desc_addr(s, false, q);
+}
+
 static void gem_get_rx_desc(CadenceGEMState *s, int q)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
+    hwaddr desc_addr = gem_get_rx_desc_addr(s, q);
+
+    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", desc_addr);
+
     /* read current descriptor */
-    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
+    address_space_read(s->dma_as, desc_addr, MEMTXATTRS_UNSPECIFIED,
                        (uint8_t *)s->rx_desc[q],
                        sizeof(uint32_t) * gem_get_desc_len(s, true));
 
     /* Descriptor owned by software ? */
     if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
-        DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr[q]);
+        DB_PRINT("descriptor 0x%" HWADDR_PRIx " owned by sw.\n", desc_addr);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -947,6 +974,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
     q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
 
     while (bytes_to_copy) {
+        hwaddr desc_addr;
+
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
             assert(!first_desc);
@@ -994,7 +1023,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         /* Descriptor write-back.  */
-        address_space_write(s->dma_as, s->rx_desc_addr[q],
+        desc_addr = gem_get_rx_desc_addr(s, q);
+        address_space_write(s->dma_as, desc_addr,
                             MEMTXATTRS_UNSPECIFIED,
                             (uint8_t *)s->rx_desc[q],
                             sizeof(uint32_t) * gem_get_desc_len(s, true));
@@ -1098,7 +1128,7 @@ static void gem_transmit(CadenceGEMState *s)
 
     for (q = s->num_priority_queues - 1; q >= 0; q--) {
         /* read current descriptor */
-        packet_desc_addr = s->tx_desc_addr[q];
+        packet_desc_addr = gem_get_tx_desc_addr(s, q);
 
         DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         address_space_read(s->dma_as, packet_desc_addr,
@@ -1144,16 +1174,17 @@ static void gem_transmit(CadenceGEMState *s)
             /* Last descriptor for this packet; hand the whole thing off */
             if (tx_desc_get_last(desc)) {
                 uint32_t desc_first[DESC_MAX_NUM_WORDS];
+                hwaddr desc_addr = gem_get_tx_desc_addr(s, q);
 
                 /* Modify the 1st descriptor of this packet to be owned by
                  * the processor.
                  */
-                address_space_read(s->dma_as, s->tx_desc_addr[q],
+                address_space_read(s->dma_as, desc_addr,
                                    MEMTXATTRS_UNSPECIFIED,
                                    (uint8_t *)desc_first,
                                    sizeof(desc_first));
                 tx_desc_set_used(desc_first);
-                address_space_write(s->dma_as, s->tx_desc_addr[q],
+                address_space_write(s->dma_as, desc_addr,
                                   MEMTXATTRS_UNSPECIFIED,
                                   (uint8_t *)desc_first,
                                    sizeof(desc_first));
-- 
2.7.4

