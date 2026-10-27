Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09844606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSFBGH7K
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLiDR-00086X-5s; Tue, 27 Oct 2026 10:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCa-0007Jf-RU
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:31:05 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xLiCW-00059k-Cz
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 10:30:58 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-91c79a9a739so3069946d6.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793111455; x=1793716255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WRkaK7EPSULjBJdzew27sq5KHOCEJgvYv+1a4xq91YA=;
 b=zSFBGH7K8ek+kja19v/Z6owv8Zw/zQ6UsJtFRBos5eqo8z+2HbzAsGiT/efWmEKrL1
 xbbhsgH2X7nU+xTqEBkCkvKauSvJV7QuHfUorK8gAw2ppGAV5sdC8IUuKfGpOixAPwUX
 V5RqYqAdg1l/3VKJGK/2Rh5o48Tswn1T+i4jGJVEkijnXvvpXrkWHUof+HqLQz3evgG0
 Z9cbsM1csbPJ6wpLlNUNNKukwkBa2Zkmo3TQdvbGLK+Pi2kadmkO2YkKz1RgsWvNv6qg
 iu/cOzefIscUoZNlDQxHkb4MgJDzG/WPLps7Z1a//+H0jN2MOzKWER50+O2z+5YIZjqd
 dFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111455; x=1793716255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WRkaK7EPSULjBJdzew27sq5KHOCEJgvYv+1a4xq91YA=;
 b=Xq7b9RmOK1G01PjURRNl937cJxKyHRn9rtvRPFbcYkX9zKIarUfcjNY7NK+UU7Qdmq
 yrDT0t8wM1cH/jPe0XW4zDDQCnFBsOqCeppbJ/xbNnTqWSreqOmNulQTpBd9goezgmTV
 +Tv93UKBE1cHfgc3FBGytMrNOhkB4vXGHJ74dEFyaWuGWRssZb5C3v5D1jIj6G8YnTd5
 O0+pUv5HJZES8GnCj9UPe1xsKTTRuRvgPIg0fYRjKWE5Lpk1FK2uMQhZibzMONw/cSjK
 WIaifqRd+EHSbgsAqIlPAKVixK/hJ+egHebd69ePrUW5fqsorvsnajvJPfhCGtDF3xbl
 YD/g==
X-Gm-Message-State: AFq9FYLawXHv7kPOp/ld7k4FtUBEheGJKCPhUeHJV4o103zuwj4Rz1ks
 vmtJHyt2KS6f5wW/tDUED3liCccuCv0mRNbxLu31mP7fqmUEjojIPjgA
X-Gm-Gg: AYBFou2Y7skcgCFQKcvqSxWW+mQusfCOpz7znw1g1qE+eOYRM3b6dRZZBgGoyrkbtD+
 IlrCdPZjp6hna8/+5wTq6RORNtrs5O1CDtUfFwwewEphUscN/eKtc84P0GbncUnqWOyDVUSNXna
 wv0+/2RIyHNC1Fpw7V6O0RhWYVdWhuI+Yi0PsSM5J1PaYi8FlROScp8/w/MSrm5AL15utC/5B09
 U04FLgKh6NlgAtfm8DHdjXgFJER3GZ9PEtMHhqEXCBrcfO2c5mIQSUdSXKSffbmyW4zsYucJXSt
 gBUwQebRhk0wTDkrrBv+yMkccRbUuDZ6QIkq/f5b3kH3L5a4AgEASeoGHjz5Io/6mi67fLIWKoJ
 gzYtKPPGm/lPeCAYhuE0nyA5YC3j8Mq+5WxoVUOv+Z0ewJspCXl+fmCnOU4zDYQraZQsw0gWDhK
 eFiBN4bSOhvNCQZvY4Jv3RcIK6zVEqJTPMOIM2UZqxKKqHqu5iowpZOw2cesGlD/hZBtLgNRiy7
 5Mm2SmUNrttBtZfs7IoAq0UQNeVxJgHNHpGLB3lGB3ErJnwplDajFR/Egbzq0HExmmcCjef1Zfi
 4rI9vpbFp6jv6oORrN9NvQXV7J0BgIKWrgCYJ30uyZYePmXcU54=
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id
 af79cd13be357-940ef7aad70mr1563267985a.3.1793111454663; 
 Tue, 27 Oct 2026 07:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:9872:3600:589:5f3a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f0a78c06sm986400885a.35.2026.10.27.07.30.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Oct 2026 07:30:53 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v6 09/17] hw/net/bcm2838_genet: add GENET register access
 macros
Date: Tue, 27 Oct 2026 10:30:28 -0400
Message-ID: <20261027143036.44973-10-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027143036.44973-1-marcelomanzo@gmail.com>
References: <20261027143036.44973-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergey Kambalin <serg.oker@gmail.com>

Add offsetof()-based byte-offset macros for the register block
layouts added in the previous patches (INTRL0/1, UMAC, TDMA/RDMA
and their per-ring registers, HFB filters), used by the MMIO
read/write dispatch implemented in the following patches.

Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
networking series (patchwork series 829638, posted to qemu-devel in
2024, never merged). Carried forward and completed by Marcelo Manzo.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/net/bcm2838_genet.h | 78 ++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index 2c3c62a9dd..e0add41aab 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -22,9 +22,87 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_DMA_RING_CNT      17
 #define BCM2838_GENET_DMA_RING_DEFAULT  (BCM2838_GENET_DMA_RING_CNT - 1)
 
+#define BCM2838_GENET_HFB_FILTER_REGS     offsetof(BCM2838GenetRegs, hfb)
+#define BCM2838_GENET_HFB_FILTER_REG(reg) (BCM2838_GENET_HFB_FILTER_REGS \
+                                           + offsetof(BCM2838GenetRegsHfb, reg))
 #define BCM2838_GENET_HFB_FILTER_CNT      48
 #define BCM2838_GENET_HFB_FILTER_SIZE     128
 
+#define BCM2838_GENET_INTRL0_REG(reg)   (offsetof(BCM2838GenetRegs, intrl0) \
+                                        + offsetof(BCM2838GenetRegsIntrl0, reg))
+#define BCM2838_GENET_INTRL0_SET        BCM2838_GENET_INTRL0_REG(set)
+#define BCM2838_GENET_INTRL0_CLEAR      BCM2838_GENET_INTRL0_REG(clear)
+#define BCM2838_GENET_INTRL0_MASK_SET   BCM2838_GENET_INTRL0_REG(mask_set)
+#define BCM2838_GENET_INTRL0_MASK_CLEAR BCM2838_GENET_INTRL0_REG(mask_clear)
+
+#define BCM2838_GENET_INTRL1_REG(reg)   (offsetof(BCM2838GenetRegs, intrl1) \
+                                        + offsetof(BCM2838GenetRegsIntrl1, reg))
+#define BCM2838_GENET_INTRL1_SET        BCM2838_GENET_INTRL1_REG(set)
+#define BCM2838_GENET_INTRL1_CLEAR      BCM2838_GENET_INTRL1_REG(clear)
+#define BCM2838_GENET_INTRL1_MASK_SET   BCM2838_GENET_INTRL1_REG(mask_set)
+#define BCM2838_GENET_INTRL1_MASK_CLEAR BCM2838_GENET_INTRL1_REG(mask_clear)
+
+#define BCM2838_GENET_UMAC_REG(reg)     (offsetof(BCM2838GenetRegs, umac) \
+                                         + offsetof(BCM2838GenetRegsUmac, reg))
+#define BCM2838_GENET_UMAC_CMD          BCM2838_GENET_UMAC_REG(cmd)
+#define BCM2838_GENET_UMAC_MAC0         BCM2838_GENET_UMAC_REG(mac0)
+#define BCM2838_GENET_UMAC_MAC1         BCM2838_GENET_UMAC_REG(mac1)
+#define BCM2838_GENET_UMAC_MDIO_CMD     BCM2838_GENET_UMAC_REG(mdio_cmd)
+
+#define BCM2838_GENET_TDMA_REGS         offsetof(BCM2838GenetRegs, tdma)
+#define BCM2838_GENET_TDMA_REG(reg)     (BCM2838_GENET_TDMA_REGS \
+                                         + offsetof(BCM2838GenetRegsTdma, reg))
+#define BCM2838_GENET_TDMA_RINGS        BCM2838_GENET_TDMA_REG(rings)
+#define BCM2838_GENET_TDMA_RING_CFG     BCM2838_GENET_TDMA_REG(ring_cfg)
+#define BCM2838_GENET_TDMA_CTRL         BCM2838_GENET_TDMA_REG(ctrl)
+#define BCM2838_GENET_TDMA_STATUS       BCM2838_GENET_TDMA_REG(status)
+
+#define BCM2838_GENET_RDMA_REGS         offsetof(BCM2838GenetRegs, rdma)
+#define BCM2838_GENET_RDMA_REG(reg)     (BCM2838_GENET_RDMA_REGS \
+                                         + offsetof(BCM2838GenetRegsRdma, reg))
+#define BCM2838_GENET_RDMA_RINGS        BCM2838_GENET_RDMA_REG(rings)
+#define BCM2838_GENET_RDMA_RING_CFG     BCM2838_GENET_RDMA_REG(ring_cfg)
+#define BCM2838_GENET_RDMA_CTRL         BCM2838_GENET_RDMA_REG(ctrl)
+#define BCM2838_GENET_RDMA_STATUS       BCM2838_GENET_RDMA_REG(status)
+
+#define BCM2838_GENET_TRING_REG(reg)    offsetof(BCM2838GenetTdmaRing, reg)
+#define BCM2838_GENET_TRING_WRITE_PTR BCM2838_GENET_TRING_REG(write_ptr)
+#define BCM2838_GENET_TRING_WRITE_PTR_HI BCM2838_GENET_TRING_REG(write_ptr_hi)
+#define BCM2838_GENET_TRING_PROD_INDEX BCM2838_GENET_TRING_REG(prod_index)
+#define BCM2838_GENET_TRING_CONS_INDEX BCM2838_GENET_TRING_REG(cons_index)
+#define BCM2838_GENET_TRING_RING_BUF_SIZE BCM2838_GENET_TRING_REG(ring_buf_size)
+#define BCM2838_GENET_TRING_RING_START_ADDR BCM2838_GENET_TRING_REG(start_addr)
+#define BCM2838_GENET_TRING_RING_START_ADDR_HI BCM2838_GENET_TRING_REG(start_addr_hi)
+#define BCM2838_GENET_TRING_RING_END_ADDR BCM2838_GENET_TRING_REG(end_addr)
+#define BCM2838_GENET_TRING_RING_END_ADDR_HI BCM2838_GENET_TRING_REG(end_addr_hi)
+#define BCM2838_GENET_TRING_RING_MBUF_DONE_TRESH BCM2838_GENET_TRING_REG(mbuf_done_tresh)
+#define BCM2838_GENET_TRING_RING_FLOW_PERIOD BCM2838_GENET_TRING_REG(flow_period)
+#define BCM2838_GENET_TRING_RING_READ_PTR BCM2838_GENET_TRING_REG(read_ptr)
+#define BCM2838_GENET_TRING_RING_READ_PTR_HI BCM2838_GENET_TRING_REG(read_ptr_hi)
+
+#define BCM2838_GENET_RRING_REG(reg)    offsetof(BCM2838GenetRdmaRing, reg)
+#define BCM2838_GENET_RRING_WRITE_PTR BCM2838_GENET_RRING_REG(write_ptr)
+#define BCM2838_GENET_RRING_WRITE_PTR_HI BCM2838_GENET_RRING_REG(write_ptr_hi)
+#define BCM2838_GENET_RRING_PROD_INDEX BCM2838_GENET_RRING_REG(prod_index)
+#define BCM2838_GENET_RRING_CONS_INDEX BCM2838_GENET_RRING_REG(cons_index)
+#define BCM2838_GENET_RRING_RING_BUF_SIZE BCM2838_GENET_RRING_REG(ring_buf_size)
+#define BCM2838_GENET_RRING_RING_START_ADDR BCM2838_GENET_RRING_REG(start_addr)
+#define BCM2838_GENET_RRING_RING_START_ADDR_HI BCM2838_GENET_RRING_REG(start_addr_hi)
+#define BCM2838_GENET_RRING_RING_END_ADDR BCM2838_GENET_RRING_REG(end_addr)
+#define BCM2838_GENET_RRING_RING_END_ADDR_HI BCM2838_GENET_RRING_REG(end_addr_hi)
+#define BCM2838_GENET_RRING_RING_MBUF_DONE_TRESH BCM2838_GENET_RRING_REG(mbuf_done_tresh)
+#define BCM2838_GENET_RRING_RING_XON_XOFF_TRESH BCM2838_GENET_RRING_REG(xon_xoff_tresh)
+#define BCM2838_GENET_RRING_RING_READ_PTR BCM2838_GENET_RRING_REG(read_ptr)
+#define BCM2838_GENET_RRING_RING_READ_PTR_HI BCM2838_GENET_RRING_REG(read_ptr_hi)
+
+
+#define BCM2838_GENET_PHY_REG(reg)      (offsetof(BCM2838GenetPhyRegs, reg) / 2)
+#define BCM2838_GENET_PHY_BMCR          BCM2838_GENET_PHY_REG(bmcr)
+#define BCM2838_GENET_PHY_AUX_CTL       BCM2838_GENET_PHY_REG(aux_ctl)
+#define BCM2838_GENET_PHY_SHD           BCM2838_GENET_PHY_REG(shd)
+#define BCM2838_GENET_EXP_DATA          BCM2838_GENET_PHY_REG(exp_data)
+#define BCM2838_GENET_EXP_SEL           BCM2838_GENET_PHY_REG(exp_ctrl)
+
 #define BCM2838_GENET_PHY_AUX_CTL_MISC  0x7
 #define BCM2838_GENET_PHY_AUX_CTL_REGS_SIZE 8
 
-- 
2.55.0


