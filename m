Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1586265lfg;
        Fri, 19 Mar 2021 12:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK5CFuNCz3cuEwXGgdFA6jnrWu2EJLstKp/CfGQQg5nwECu2gD4Kqm2bXmhNiaQDa2PoWK
X-Received: by 2002:a92:cd0c:: with SMTP id z12mr3985877iln.109.1616183476912;
        Fri, 19 Mar 2021 12:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616183476; cv=none;
        d=google.com; s=arc-20160816;
        b=FIAtEkUesu4ScKxHrPr8lKizX/OWzKBAluMGp0TCAaN0prL0iOESC/lhHagN4UTvqu
         FtWi5eOyXepwaxGvE5V8FipM/rcIg3nRjPHnjEfb06B76Eq08B5vB42ujb+McRAP8ANe
         WDJ86pv6L2PauAzSVvPqwkR/h/HQx8gP+Npa2PSK2YSi7fKkoFnBQLMvqXkTAK+1ByVB
         EYri1WULYkm1zRZo0fnGwRxgkq3zIW2TTHiUC1X8WY+pY/anTl2KPekYw405VzyfYvWQ
         6TqpnvkqxoQIF6GGf4zuh1TOEg0kzuJGQIQFLzGvuhQCSGp3leddHyAhGNMOItbTEovS
         XiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=j46CI3Og4hVkDDNrH53Wwik7HYlH8KkukwySRapqCWU=;
        b=w3hSRIAnzxuU16qLOBVk7pN1+LjiRNXjY4INN3YLiy/JjpU1frcOXsmSeNmUKNYCNo
         RH1rA4PZ7SDhsp7kMwlvMC5Sml9JfMM5AX7eNg3yDg1560N2RAZtgnX8p52LBwyAu5Ck
         3gSbs6HhDbNUCaqooLd3NvfA1JGK+OBEqi3erPQn9srZWeL2WhC7MKw4OB/vMPKvuKWK
         4aPiQQhUnll/BE7gXIHZLUYvZqI7fKzykPZU9HP5m7zWKv2dmLVRM8UPuXoczDcF0YyO
         gah9jVVBh4wpdrAt6kGcsa7EPPLYe6r6jW4B7QX8puJcuqzvejg7AtliBYm4urhBXZrc
         Q4Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GYj7hsz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si4380710ion.78.2021.03.19.12.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 12:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GYj7hsz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNL9Q-0004jU-7J
	for alex.bennee@linaro.org; Fri, 19 Mar 2021 15:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pABVYAMKCAMgmhjrrjoh.frpthpx-dupqrqjqx.ruj@flex--dje.bounces.google.com>)
 id 1lNL9G-0004hx-Nm
 for qemu-arm@nongnu.org; Fri, 19 Mar 2021 15:51:06 -0400
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49]:47431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pABVYAMKCAMgmhjrrjoh.frpthpx-dupqrqjqx.ruj@flex--dje.bounces.google.com>)
 id 1lNL9C-0007J7-OY
 for qemu-arm@nongnu.org; Fri, 19 Mar 2021 15:51:06 -0400
Received: by mail-vk1-xa49.google.com with SMTP id o128so4295639vkc.14
 for <qemu-arm@nongnu.org>; Fri, 19 Mar 2021 12:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=j46CI3Og4hVkDDNrH53Wwik7HYlH8KkukwySRapqCWU=;
 b=GYj7hsz0MkYuOu42/ryzsO7gctCRvx5eRxK58FVdd+1vbOGi4nIXcyQ8s18Gs+mtvq
 dXcpIlzj979Q/Jw9YFs9y66jF3+Lu27r8H0egEjuJHmDesIt0osR87PetYIaNfnN+6An
 wzy+TC46WtJaL1NQbM6aSR93OdFsME4hCPxlDhI42DX9XF4o4ZxTy1QSH58pwlRwqB7x
 dnYU0/+vyZQT4cajSZf/J2CqJanXF6V+rwk5SfQS+gaWSa0sUWSiHDacMrXBCpGw2yRj
 72RB1M0hRH2amRWio72xE2gmzEFwvonnV/GD94/jyPbPeauv4QhwiwGQGe8cb/28//1Y
 Q2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=j46CI3Og4hVkDDNrH53Wwik7HYlH8KkukwySRapqCWU=;
 b=PLHrsXj4QHykNsOaBgdZUXn7QXsfmdPyaucSRXr+N+PH2BORDLFA7j6SQ4p1Z7IxDY
 X5pSPLnj3CgeRTfzy2B5J/uIDkFyQAJ0CBHOyNj5qSdAeDEhJ9qeQLsTrrvlh5SDKdOT
 AbfDed4COHtliJvQZLIWjOR2zo+1wJTKvAL+4PbRZmo217e+DqDZXE6z1dg15FjoC1mR
 zqm0/il/Nnj2fw1j3S+Nx+ohPS5XnEUOOiDqlbthdKm0SlWsHaVVOV7fINjTCv3joeXc
 lyAO/ogu+c3df8TXbbCHYFT+Fa54VQoDPWPFemtlnjJQv0t8t5mrXeN+mXMpbnKBcePE
 qfyQ==
X-Gm-Message-State: AOAM531M8fBsDcx8f0NGY3zqYyzyyQNjnia89ZYSoInDIHUq77A2nHhf
 erNejaPb7pNwvh2QnFL3pQ0eGZGhgfN+oNPvAWSicrqi9d3Wk98znPD16vXwE9OPR3cvJD1VUgd
 xqk7ArrYCAUm2LN9/7OVuKBZreQVjZqJ+S7WMA8K9k3JCvDMxbA==
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:e514:6b57:7d74:59ea])
 (user=dje job=sendgmr) by 2002:ab0:2b06:: with SMTP id
 e6mr163139uar.43.1616183460527; 
 Fri, 19 Mar 2021 12:51:00 -0700 (PDT)
Date: Fri, 19 Mar 2021 12:50:44 -0700
Message-Id: <20210319195044.741821-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] net/npcm7xx_emc.c: Fix handling of receiving packets when
 RSDR not set
From: Doug Evans <dje@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Jason Wang <jasowang@redhat.com>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3pABVYAMKCAMgmhjrrjoh.frpthpx-dupqrqjqx.ruj@flex--dje.bounces.google.com;
 helo=mail-vk1-xa49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9bfGhD3ppGZA

Turning REG_MCMDR_RXON is enough to start receiving packets.

Signed-off-by: Doug Evans <dje@google.com>
---
 hw/net/npcm7xx_emc.c           |  4 +++-
 tests/qtest/npcm7xx_emc-test.c | 30 +++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index 714a742ba7..7c892f820f 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -702,7 +702,9 @@ static void npcm7xx_emc_write(void *opaque, hwaddr offset,
                    !(value & REG_MCMDR_RXON)) {
             emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
         }
-        if (!(value & REG_MCMDR_RXON)) {
+        if (value & REG_MCMDR_RXON) {
+            emc->rx_active = true;
+        } else {
             emc_halt_rx(emc, 0);
         }
         break;
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index 7a28173195..9eec71d87c 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -492,9 +492,6 @@ static void enable_tx(QTestState *qts, const EMCModule *mod,
         mcmdr |= REG_MCMDR_TXON;
         emc_write(qts, mod, REG_MCMDR, mcmdr);
     }
-
-    /* Prod the device to send the packet. */
-    emc_write(qts, mod, REG_TSDR, 1);
 }
 
 static void emc_send_verify1(QTestState *qts, const EMCModule *mod, int fd,
@@ -558,6 +555,9 @@ static void emc_send_verify(QTestState *qts, const EMCModule *mod, int fd,
     enable_tx(qts, mod, &desc[0], NUM_TX_DESCRIPTORS, desc_addr,
               with_irq ? REG_MIEN_ENTXINTR : 0);
 
+    /* Prod the device to send the packet. */
+    emc_write(qts, mod, REG_TSDR, 1);
+
     /*
      * It's problematic to observe the interrupt for each packet.
      * Instead just wait until all the packets go out.
@@ -643,13 +643,10 @@ static void enable_rx(QTestState *qts, const EMCModule *mod,
         mcmdr |= REG_MCMDR_RXON | mcmdr_flags;
         emc_write(qts, mod, REG_MCMDR, mcmdr);
     }
-
-    /* Prod the device to accept a packet. */
-    emc_write(qts, mod, REG_RSDR, 1);
 }
 
 static void emc_recv_verify(QTestState *qts, const EMCModule *mod, int fd,
-                            bool with_irq)
+                            bool with_irq, bool pump_rsdr)
 {
     NPCM7xxEMCRxDesc desc[NUM_RX_DESCRIPTORS];
     uint32_t desc_addr = DESC_ADDR;
@@ -679,6 +676,15 @@ static void emc_recv_verify(QTestState *qts, const EMCModule *mod, int fd,
     enable_rx(qts, mod, &desc[0], NUM_RX_DESCRIPTORS, desc_addr,
               with_irq ? REG_MIEN_ENRXINTR : 0, 0);
 
+    /*
+     * If requested, prod the device to accept a packet.
+     * This isn't necessary, the linux driver doesn't do this.
+     * Test doing/not-doing this for robustness.
+     */
+    if (pump_rsdr) {
+        emc_write(qts, mod, REG_RSDR, 1);
+    }
+
     /* Send test packet to device's socket. */
     ret = iov_send(fd, iov, 2, 0, sizeof(len) + sizeof(test));
     g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
@@ -826,8 +832,14 @@ static void test_rx(gconstpointer test_data)
 
     qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
 
-    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false);
-    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false,
+                    /*pump_rsdr=*/false);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false,
+                    /*pump_rsdr=*/true);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true,
+                    /*pump_rsdr=*/false);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true,
+                    /*pump_rsdr=*/true);
     emc_test_ptle(qts, td->module, test_sockets[0]);
 
     qtest_quit(qts);
-- 
2.31.0.rc2.261.g7f71774620-goog

