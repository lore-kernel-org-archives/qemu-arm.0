Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4356C79FB6
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Sep 2026 14:44:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4JW4-0000G1-PV; Wed, 09 Sep 2026 10:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x4JW4-0000FU-1g
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 10:43:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x4JW2-0005fZ-59
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 10:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788964989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NplcCtalrr4KaNtkMcW82lPswZ8AtudoDtbDep02z7I=;
 b=CWkX8obiat+fS4Hq6WyqLuDWSXry9eEQ6GungKXMqks+SIS8F62fe261bhntPrhFJYN/0G
 HmvMI1dMRAdqPhdBaj6a0NZZ/dYZUPqdCDAUyS3hn4j5n1SOk35z0tEy3k7jl3cC9uRoAD
 MumnBnKZCH4V2W5nwwbiroclNA3dW18=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-KpJ4Ev98PQer9ve-6FfLAA-1; Wed, 09 Sep 2026 10:42:02 -0400
X-MC-Unique: KpJ4Ev98PQer9ve-6FfLAA-1
X-Mimecast-MFC-AGG-ID: KpJ4Ev98PQer9ve-6FfLAA_1788964921
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4843e59c32dso3845078f8f.3
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2026 07:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788964921; x=1789569721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NplcCtalrr4KaNtkMcW82lPswZ8AtudoDtbDep02z7I=;
 b=gTFxl3b9xZHJAHv+wDEjdZiNKhrw6Bhx7nwTjEjIVP0K/F38BGtrFvqOfSwpTQ33RI
 5Na0xMsSwqTKJyKl7oN7aVuNfiUiGT6pzVwEPrB+T7BJrRB3nQFoBtU7b9o+idx3FRz1
 +18SxXa6N2vLMTRQuq6/eT2xZunhbzWd25DHQ6aweiaWODnQIX3LVBMyG6HxLwaFQGUf
 0jdInPSs5l38gMKoeTtTsNCUN3oiy2/xgk4A2/HH2aJfdFWjyYPoMoqmUKRzx+k8WeRI
 RNljUpfcUS7isL0G1Tv+xLYvW5hIl8OyQWJgsTSLs2WipHKpL3/8l/viFgV6b9/IppTQ
 PPXg==
X-Gm-Message-State: AFuF++mv5jC8gwknu2Q6EPBdOeYalGhN6camXJpFjbe0IAw/taDymFO+
 xtmJAje0lymDlSsvACqA06uZ5Wkog0JMa6+eiNCIPCWTddzmiklBJta3lywal9SdSr9nPxfJW6N
 ZblaBO27zowCfibJpDjHMIRRYg4jeJpb5X+eX1td4AVZ47hWmMYk9Vw==
X-Gm-Gg: AYBFou18jNM7eXuMprqdxl+ZCQ/wGt070w9+mfQ/YimnqxdWqrjRTrkz4h9yXPELRlT
 59dagOY6dQnU1TKoREdAg6fo+sfDoxKvLFxpiFJKfwbx+KqbTEBJXIrOVz+xASv+NM2bJBLaTji
 3saNr0KoAjR+9eVs7pvUEYterbGB8Bdhm1a17aJ7qMPPmNipvuqNyaNaa2fGUo2pGlhh7liZUQB
 qO9q9DT3xsnV7f3CeJtdrZ69Pg17+D5nlq4fHshY+5vg3T/Lgx3IQWWCwZxU4TD5S2ywG8ogvYj
 Hyjy/lNtKoNFwBRkNPiA6LUbRjGGd4Okm946+P5ZncclJxIEX6rivdFK5mMDlV4xBMWog2GhRIi
 PxHulm/QXpq2+ixpMV6QLCkq7omN5t5E7uVMWsAjsN+eFBBGmrKOG1f+gP4zqD83N1w==
X-Received: by 2002:a05:6000:985:b0:485:8b95:706f with SMTP id
 ffacd0b85a97d-4858b9570c4mr31588718f8f.13.1788964920895; 
 Wed, 09 Sep 2026 07:42:00 -0700 (PDT)
X-Received: by 2002:a05:6000:985:b0:485:8b95:706f with SMTP id
 ffacd0b85a97d-4858b9570c4mr31588672f8f.13.1788964920455; 
 Wed, 09 Sep 2026 07:42:00 -0700 (PDT)
Received: from rh.redhat.corp
 (p200300f6af0e1b00fa6b14698c8a91c3.dip0.t-ipconnect.de.
 [2003:f6:af0e:1b00:fa6b:1469:8c8a:91c3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485958f1493sm32933395f8f.37.2026.09.09.07.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:41:59 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, khushit.shah@nutanix.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v5 1/3] arm: handle demuxed ID registers
Date: Wed,  9 Sep 2026 16:41:49 +0200
Message-ID: <20260909144151.26803-2-sebott@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909144151.26803-1-sebott@redhat.com>
References: <20260909144151.26803-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FscbOGPmA2mA8jQpFm85t1I418zA8xu611QRUnu4WJo_1788964921
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
index e3f931dba2..9652f8b0bf 100644
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
index 4e8c472530..c11ab2da21 100644
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
2.55.0


