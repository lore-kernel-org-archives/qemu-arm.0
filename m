Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CC9CD98F2
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 13:56:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbf8n-0002Nr-WB; Mon, 22 Jun 2026 09:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wbf8k-0002Mi-Qf
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 09:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wbf8j-0007vM-0f
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 09:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782136600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkMffPovnZlGeD50GCpbLJdSgQdWfm1vJ5UbJhCKZO0=;
 b=bhwdsQNUO9oeMpGwu3a/s1IFaBfNdGfD+sOtrtxaDLUrm3lWagXrtkKhWKAu/lText3cF4
 ZVQcTbriPc6NZB7zHun0G7tfEkEJ2+Z/btvzX5IyyUQ2teOitNqOm3UXRX8/94FiYEWyA9
 srB4jc2FjLd+J7pukj9z+pOqss5lI+c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-VV0hIHrGPySla6E7sTgg8g-1; Mon, 22 Jun 2026 09:56:39 -0400
X-MC-Unique: VV0hIHrGPySla6E7sTgg8g-1
X-Mimecast-MFC-AGG-ID: VV0hIHrGPySla6E7sTgg8g_1782136598
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-462d8ccf553so2818576f8f.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 06:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782136598; x=1782741398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AkMffPovnZlGeD50GCpbLJdSgQdWfm1vJ5UbJhCKZO0=;
 b=G+WAXsNNbq0qXv9Oqj7dJ/wqRFGXelotxiMeHSK5lgC4Em1XasB/q50FgvXkttQZQu
 h8Iaq/ohbnzOxPzCyFc4A4tAGtYNtDDNN92OHPKEKdD5nE9wDm4ua0ypF9GeSKzwlyPe
 ZmxjQ9ZJopKX5fIYHwgkxsnSzkvjr+q8s/XYIRjJJDSAGg2BwcqWfSFnRVj8rNuLLOfz
 NLZKqJurZs54kkKUu8WizUDmqD5s4Jd7PNxzz9YTi48Td8zzfaZNgY39UqN7TpctGQ5J
 BZ52Gvx64c10lBGnxbW41dYdLut9quo2x10zyAumUEz/ZzKvpzP02apKeX3oD96mqHqQ
 rY4A==
X-Gm-Message-State: AOJu0YyXaPuW4F1rTpq+ZjYIc4HBRc1yVl6jU3G4IjjdVCkDXqNX2Rn5
 l4KnBVA3cbSx4TbYPpMqdDMejFBNYpZysL/lT69/+6MGhNAkbLJUjRvumrYFmsRCyXXU0Gd27P0
 ml38hGdZCaHGTlN2MWuqWqVIvpaM76DsiNKzAnXthaRE7/PI0cCYIoA==
X-Gm-Gg: AfdE7cl/us9YBe97bKmqP65Kz2rlpfH3xgp0auJO0Ks+/xiQZc5+yFZMZNKZD29Jni7
 Dyer2buCi6hT/bstW6xdOJUNve7yazaN9WHCgI9ZE+BT3VLnPiePnYSt0//HaO9A5aV9euQwugF
 rbj6pmvKWMTtdk5WpBHtHGqdkbdAHmWFevByORLg6xjP/L6VDzn4NDmM/Hx9FHNFBE6xZ/yljgU
 ymb2J9BWj+uvwfH5urip3l1Ay7MyBmYP4lj0KnXEFdpT8ImWm9Sc48je6U3TGqkCoSZ29PbHzmg
 +BbtzxNyLkCzTUKB12p5EwdEkS/gozrsJ36nXYKSIK5SmVFMvdVzHc33SUfnL3S+WAzuCasVHed
 leznZQrSWs4N0FSjWCVhXXZWf7tbhKBVg+TkTL0yK+ygfhyFwUhHqVkeq915Br/Qte7iJRY/zRe
 Y=
X-Received: by 2002:a5d:598d:0:b0:46a:45d:2bed with SMTP id
 ffacd0b85a97d-46a045d2c13mr2308447f8f.8.1782136597762; 
 Mon, 22 Jun 2026 06:56:37 -0700 (PDT)
X-Received: by 2002:a5d:598d:0:b0:46a:45d:2bed with SMTP id
 ffacd0b85a97d-46a045d2c13mr2308400f8f.8.1782136597308; 
 Mon, 22 Jun 2026 06:56:37 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e9esm25162303f8f.1.2026.06.22.06.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 06:56:37 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 1/3] arm: handle demuxed ID registers
Date: Mon, 22 Jun 2026 15:56:25 +0200
Message-ID: <20260622135627.40573-2-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622135627.40573-1-sebott@redhat.com>
References: <20260622135627.40573-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6N4NS7idIRrfkXFhv2SVDosK6WOdHGUsp3lnQnb9t3M_1782136598
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Cornelia Huck <cohuck@redhat.com>

For some registers, we do not have a single ID register, but actually
an array of values (e.g. CCSIDR_EL1, where the actual value is
determined by whatever CSSELR_EL1 points to.) If we want to avoid
using a different way to handle registers like that for every
instance, we should provide some kind of infrastructure. Therefore,
add accessors {GET,SET}_IDREG_DEMUX that are similar to the accessors
we already use for regular ID registers.

Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/cpu-sysregs.h |  9 +++++++++
 target/arm/cpu.h         | 12 ++++++++++++
 target/arm/cpu64.c       |  8 ++++++++
 3 files changed, 29 insertions(+)

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
index 7877a3b06a..a4b9621a7e 100644
--- a/target/arm/cpu-sysregs.h
+++ b/target/arm/cpu-sysregs.h
@@ -20,20 +20,29 @@
 
 #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) NAME##_IDX,
 
+#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
+    NAME##_IDX,                                         \
+    NAME##_IDX_LAST = NAME##_IDX + NUM - 1,
+
 typedef enum ARMIDRegisterIdx {
 #include "cpu-sysregs.h.inc"
     NUM_ID_IDX,
 } ARMIDRegisterIdx;
 
 #undef DEF
+#undef DEF_MUX
 #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
     SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),
 
+#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
+    DEF(NAME, OP0, OP1, CRN, CRM, OP2)
+
 typedef enum ARMSysRegs {
 #include "cpu-sysregs.h.inc"
 } ARMSysRegs;
 
 #undef DEF
+#undef DEF_MUX
 
 extern const uint32_t id_register_sysreg[NUM_ID_IDX];
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31a5567c95..fe0046b02e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -919,6 +919,18 @@ typedef struct {
         i_->idregs[REG ## _EL1_IDX];                                    \
     })
 
+#define SET_IDREG_DEMUX(ISAR, REG, INDEX, VALUE)                        \
+    ({                                                                  \
+        ARMISARegisters *i_ = (ISAR);                                   \
+        i_->idregs[REG ## _IDX + INDEX] = VALUE;                        \
+    })
+
+#define GET_IDREG_DEMUX(ISAR, REG, INDEX)                               \
+    ({                                                                  \
+        ARMISARegisters *i_ = (ISAR);                                   \
+        i_->idregs[REG ## _IDX + INDEX];                                \
+    })
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2816735577..48a0421674 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -42,14 +42,21 @@
 #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
     [NAME##_IDX] = SYS_##NAME,
 
+#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
+    DEF(NAME, OP0, OP1, CRN, CRM, OP2)
+
 const uint32_t id_register_sysreg[NUM_ID_IDX] = {
 #include "cpu-sysregs.h.inc"
 };
 
 #undef DEF
+#undef DEF_MUX
 #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
     case SYS_##NAME: return NAME##_IDX;
 
+#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
+    DEF(NAME, OP0, OP1, CRN, CRM, OP2)
+
 int get_sysreg_idx(ARMSysRegs sysreg)
 {
     switch (sysreg) {
@@ -59,6 +66,7 @@ int get_sysreg_idx(ARMSysRegs sysreg)
 }
 
 #undef DEF
+#undef DEF_MUX
 
 void aarch64_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
-- 
2.54.0


