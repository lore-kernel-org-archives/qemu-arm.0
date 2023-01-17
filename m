Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp22265ejc;
        Tue, 17 Jan 2023 15:25:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu5ozT32zNo0YmvuObPxSYTTfyUInqodtGpmpR3tmbEO0886ns7q5y8Hj8Y9Em2HtuDET97
X-Received: by 2002:ac8:41d7:0:b0:3b6:301a:5747 with SMTP id o23-20020ac841d7000000b003b6301a5747mr13040173qtm.46.1673997927068;
        Tue, 17 Jan 2023 15:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673997927; cv=none;
        d=google.com; s=arc-20160816;
        b=YX5qfvU89lXtQDtLiAw8K3XpuQ1qVpnfUim9WQGG4rzj8VnAMqm93xceoHijxKsgoq
         7lYgH4Pkm2NOWmUSBzbPDaMo5ZTohBLKxPR7QFjiBXXzqr5zNA9N60RCQBEF1q/IyoyA
         zNdtuQzyi9ZT6eWNCp9H+yD1pEvFUcxLuF7Pn9kgEIAKuk2mhDUu9g0AYznkNI8VNbN0
         Q6L45Ee/sgD69er9EQeQ9YE0OMGWkFHU0yex4T23Qt5Q5xJ++EHw/k1lvgR1/OBvqu4Y
         bhsUuVDG+tsxXOqkvlFKG+6ewhGdCd6ARWH+FgA/ArBpFt0FItgSjAm3btTpObZ78IIb
         4AQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=cCeOwvKefjF8ECs0zlkP8SCX+hkhTPxzfHumDwCvOes=;
        b=SW/pp+SUmaKBcuJArbiAY8m2v0waaaQp6pE+oj8ezkW8xCUV0iashXwVQd9z5eWGOh
         brQsWV2wYHNgijLFodWXN/KkkR0JDG3cD8XxayZWlGZ4EOojtfSUUdvVN/s0MQlmPYbW
         mP8y2IYrf939ZFa9POd3aJ/YU1Vrhew3JlREvdlqdc7CQ+WgOQzAk0HgDB9K9jHNdXJX
         FL8my8Sj+KEls7SGPW2XfYQSW++5ujr6V7aKuVTiH1N11j4Wd70aSFnrgulqFvuI5kUC
         9Gy2X2cvNESJ5kTmyW+GVr6RCmpPfml93/U5v2nuqlY5VKpyMXxJg1tDZdMjWT6fhAIY
         M3oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=bxuJmS9+;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=cu3oNOO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc26-20020a05622a411a00b003a7eb78866asi20119850qtb.88.2023.01.17.15.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 15:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=bxuJmS9+;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=cu3oNOO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHvJz-00021E-Rr; Tue, 17 Jan 2023 18:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJy-000200-NC; Tue, 17 Jan 2023 18:24:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJu-0003KL-3t; Tue, 17 Jan 2023 18:24:47 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D1DA5C0191;
 Tue, 17 Jan 2023 18:24:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 18:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673997881; x=1674084281; bh=cC
 eOwvKefjF8ECs0zlkP8SCX+hkhTPxzfHumDwCvOes=; b=bxuJmS9+bcO3LDsJvc
 AyurIIDcfBCDta/oqs1WCMXwC0L1Hchdf803eb7nu4BhN0xX8+JIGN7d/ap6f/P5
 3HsdJY7lsn9ZEWOD2TRAqD3KXTEuCdp39uZsaqYHP/NNQaabHezz0IvjyIR7MIW7
 dVTTZfy/hPrqcnfqMJRDyPJr2FqZoFqu+OV1QwbVAnwaN0gWviaxpuop/zsjxIF4
 AFOwViolhJ2qiSDqNjcYqSlYePPrZVtmWI/3QIxj4KgF1woaRf0JVMukwZZWPH1p
 2qWU1tlo3JX29ccasWphLxa24SY1RNgUGEJIfu8uSqDQ7eslkHGzBDI8qpyMqUc+
 eY4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673997881; x=1674084281; bh=cCeOwvKefjF8E
 Cs0zlkP8SCX+hkhTPxzfHumDwCvOes=; b=cu3oNOO6ng1vmBrtMteALRysRSrdS
 Rah4K/PtcRtcdwGkNJezxZ2nebso9DZooVQMH8i+kQePxKcDF4MaxbDMgjLypJH7
 spFirj0YGqJUjefP3xm56qlpsjyywT4trrWTlOj6LtiGxtj4rAE4yBl9gD06DRZ8
 h9nVHTVwR7gnt0jAccahqlpQz43xwFCjPB8E+mjYduZH1/AMxthQCTXU/z6RBQVg
 QV450Hce8BmhHxUD63Mg3S7CytZDuZN+kqSBgqB3Mc6oOApWz5bGPh5BYxvZ4Vj1
 ZXC7W418N10Vp7hW/n2uzvcvFEAZxp2Qz3xbfbQA9h7EG9ega/6SLC3jw==
X-ME-Sender: <xms:OS7HY9tzHryKzErmhkqkRfKf072WX2mcj_3NfBp8WqP-Nxk46TjFOg>
 <xme:OS7HY2cy6HSrr5KAR2wvY079WhMMVF0M_OVaihix8awCollvGyw40o8vBggUsSNq6
 OEA1od0E2xZpHJSWd8>
X-ME-Received: <xmr:OS7HYwxYeiQEjeFX1SSfydqCpRE-ZomT3qt8xpxQJfH4nk5BSjmkLebSYOPMSkpTIBhS6ytH5UUOIE5qOKWWL1trYLQXX9FQgZ_SBZwSFbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:OS7HY0OxJUvi3YaQCAjNxy4vhGvnwdaTtSb_J23WFWrfyQk9HDMkyA>
 <xmx:OS7HY99vVpwVEDf__fyH1AiqpEm0Fk61BkQQ0mfoLCOOhIXj7C-9vg>
 <xmx:OS7HY0WYyj0V3pB71ZO_0SLvJcX_RMIxxVydgxdy_LSkLvZ017OyBA>
 <xmx:OS7HY5Rb39RvpbEgzzjSGQIyDofX5hC8Xjaph15PwQM6XhNgmarLPQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:39 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 5/5] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Tue, 17 Jan 2023 15:24:27 -0800
Message-Id: <20230117232427.74496-6-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117232427.74496-1-peter@pjd.dev>
References: <20230117232427.74496-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /Imnp43RfYaw

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index f8d751fa278d..5074776bff04 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->init_rom) {
@@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.0

