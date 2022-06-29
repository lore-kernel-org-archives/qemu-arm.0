Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp135440lft;
        Tue, 28 Jun 2022 20:39:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sNTnJUAo/tc2Ih+oVcwUX/NKPulQQG+p4dnVqAHmcLmunXNhDwys/rszwKOhGPC5QRoMm6
X-Received: by 2002:ac8:5aca:0:b0:31b:f267:6176 with SMTP id d10-20020ac85aca000000b0031bf2676176mr888782qtd.471.1656473965400;
        Tue, 28 Jun 2022 20:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656473965; cv=none;
        d=google.com; s=arc-20160816;
        b=0PhoLbkB1KJjlQ3DOQ9DFkTMOB2qpZC6AJppPsLjrloCfJwjYDSSNWiPhwBL5Uxxkv
         4oDgBV7BP+YM6+CIZ3kq1m5jkSp6i2k0+GUqX5VGxSSrMfn1AVY0L6kOPJb5tHOJ/Kda
         L924ENebd+p1Vb0qC+wWwwy82/LdmcMDPAwiAmJGQVRxtFX7NZDD7ENTJhGDLlYPmugV
         1lD/20vFJt/0h0zILNpUdbU+Xf6s4Uwjsv+5s+DAvQBnRWgsrDdy4JPEa9B4DUWlbGa4
         7DwPxEn8uelnH6VRJ2UeEQgmbxSgIEvVJ8XupAPi4KGsy3xsZlCTTtDjTPGaGRJkDA76
         ZHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bxxCeDZQXcCNEHkjubN8AwS0BfANRLIXqhbPQWkeSQg=;
        b=KzG30dFOHtbYvsT7Mp/UlUp5bH9pqGHR+dtZJp79aN7AYWiwuJ0aR4Ytmj8tNiS0Lw
         cAy/FbG2TjyDkQqv1HPd2tRh18wF21/nEU2s3d5MAw9DhzqWJKaMjxYrdGd5UIjmhj04
         CZfcmSR050OD+H50x5ECNosXj/KyU65PNEtBfO5bCw1wraL0OpjWGd9T7vjJErGVRS9X
         ADd2MhjDLw7zp5soUnSwc6Sfb8oSLM+Si5SIW6cNy/Qm5uVHoRN5LscZZ2z7fdMYy9+U
         Zq3m9bhJtTFIuiFrMehhpbcoYU/Q5SW2AUMWHigDzdZNkAZPi/SfzbyDz44E032JUIua
         TP9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cJfeKB9X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o203-20020a3741d4000000b006a7ee6fb818si7720214qka.332.2022.06.28.20.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 20:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cJfeKB9X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6OY0-0002tX-MW
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 23:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVN-0007SI-14; Tue, 28 Jun 2022 23:36:41 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVL-0006gt-AF; Tue, 28 Jun 2022 23:36:40 -0400
Received: by mail-pg1-x532.google.com with SMTP id d129so14050499pgc.9;
 Tue, 28 Jun 2022 20:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxxCeDZQXcCNEHkjubN8AwS0BfANRLIXqhbPQWkeSQg=;
 b=cJfeKB9XaCHOfpI5LYPAXhJ7G+7lkXZXLOoq/QoY9rzcPy+UnPZt9HRdsv80JWJWGC
 VlnurHDPXx6JY5+iS/Zo8Cl4IEZmKrmP6Mlg+xfh6gadDHNJDpDV305r+81nZiGjtG9G
 mBdqMmijK/t3UbNvrme9aBcwEta88hjiTRo3Jj2DfM1jhW9qhI/2hck6RcKudf0En1Pn
 UHcHn7EcgKJfWlnH7jNpj7DHb1DB+qiYtgcCC7+R36rvLTDRlI5psMT0CLAr6qr1msc0
 av1hpjoyROkdTtGZ+JSg/LvSnL0spe0bqgCB0Pry6vwwrQ4hbH1KGJiYnDI1J9wc3ysu
 x/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxxCeDZQXcCNEHkjubN8AwS0BfANRLIXqhbPQWkeSQg=;
 b=s6jx9l8LgisqSBm4BybYgXopS+t6e5SzT57atre80xTUkC1y66jKZTAd1Ird+QaPYE
 2FQhFFuIKt7EPSxIMTwOnqsZCJk4rDx9YMtaIAblhM4kD7Ga3NDNZTyS01AraxiqMEe7
 ultHoWHzwWrEHcdkcvpOENqqFmTy2FSatz6eb7t9uXVESItVn02F38Nf9NtmXFOunu5M
 elwJSmD18Bourbvsh+cs3aEBmM5lBw/01aMlRLFLObBN6x/qvY2NiUnO3jgpvgDzqesy
 a++Nf+TtBPjVXrX59/IxnJMKXZ1CpeNUBn/LBLX+bziHhHQ9j0RYJnEZ/dAG4ohT2m06
 ZvTA==
X-Gm-Message-State: AJIora8EzhfswJm0aHZdyJzzSNvDKlcJJIBSvb92wRJudaVrPk/1JbzY
 UkpuqHlaUoLxkOLihyFqSC8=
X-Received: by 2002:a63:82c3:0:b0:40d:3b63:a806 with SMTP id
 w186-20020a6382c3000000b0040d3b63a806mr1157852pgd.75.1656473797499; 
 Tue, 28 Jun 2022 20:36:37 -0700 (PDT)
Received: from localhost (fwdproxy-prn-021.fbsv.net.
 [2a03:2880:ff:15::face:b00c]) by smtp.gmail.com with ESMTPSA id
 a13-20020a63e40d000000b0040d48cf046csm10083686pgi.55.2022.06.28.20.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:37 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 02/13] hw/i2c/aspeed: Fix DMA len write-enable bit handling
Date: Tue, 28 Jun 2022 20:36:23 -0700
Message-Id: <20220629033634.3850922-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GVjwjLS4QWCJ

I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
seems to be because the Zephyr i2c driver sets the RX DMA len with the
RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]

/* 0x1C : I2CM Master DMA Transfer Length Register   */

I think we should be checking the write-enable bits on the incoming
value, not checking the register array. I'm not sure we're even writing
the write-enable bits to the register array, actually.

[1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148

Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index ff33571954..cbaa7c96fc 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                                                      RX_BUF_LEN) + 1;
         break;
     case A_I2CM_DMA_LEN:
-        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
-                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
+        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
+              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
         /* If none of the w1t bits are set, just write to the reg as normal. */
         if (!w1t) {
             bus->regs[R_I2CM_DMA_LEN] = value;
             break;
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
         }
-- 
2.30.2

