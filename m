Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC8F606A31C
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j44EHbUM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNAWT-0000ta-O5; Sat, 31 Oct 2026 10:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xNARK-0008Ps-3H
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 10:52:18 -0400
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xNARD-0006Zx-7W
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 10:52:10 -0400
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-369f33df08eso3320952eec.0
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793458325; x=1794063125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=atE/HO16RK3WcnYxutMxDJZwPnCJN9Q7nCKO2PXk8l4=;
 b=j44EHbUMzXpuj4Z2JDBmATNH/fQr/zBBN8aYf+aOsQCCJddH03yFfdSnaA9ks9JrgT
 Sw5GNdtTUjwjWvuLVXuvZrZmwTV11i87YVX4i2htSltjSfaOEu07oVougsbSYaTmSoR1
 Oz1vyoZVP4Je/bTHUDAvEgAX7qYHMHhrYUIGVKMp6put4JvZxiEV7ofdToRHpGB4A/G7
 EeFt9SL+i8yD4lsEJe/7kpiyWDNV2svrBSuSEBD2WsUP8rZPaC0pYX08OYtP0u2zodtc
 P/D1Zgi/5Fz1Zc2AyYk7sGVluWz6bSBSSR7p0US2DPzdFBTQnZk5y90HKum3kLR7YOnv
 mfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793458325; x=1794063125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=atE/HO16RK3WcnYxutMxDJZwPnCJN9Q7nCKO2PXk8l4=;
 b=Atf/k5UHCskJgKw9DDw0F1t3xfIvphkRM41c6c4R1JtCdCEHkh0+38vxReXHBiP44L
 Pej3ffBuAj+ha6yekj8D9RNuKV42IoVW0u8PbWvmdr07r5OoMJJOvE//5ZeXte6hhARv
 1GickrJQI9H8EDscHRVpNKw59mfFjZZg5dRBeNMFS+7Do5HkRrSMrbs+8el7py4PGiMo
 MjMuv0vweXxC8RtNssbWWTwFn1tcGDH2sEeW3vNtY82SaAZmwRaVmFjpGvbbbyskGFwC
 CSZnRhgXhfTmCRBu9eY/SHEshLNCdYQ0ETFQa6JalMyz4cKlzTwmEKt7WuhW3H10V77I
 N/Rw==
X-Gm-Message-State: AFq9FYLEfwckWQG3AoG6YJUc+kFOT4VoTbWTbsFTm2sBS7g3l4e7BpoD
 uRGm3NFc1Xkvheea5XWnkKWbPx1ih6vadP2beEDXMeBRQpF0Jk+75oHr
X-Gm-Gg: AYBFou3+1P0OYvdFLq2qUk1hFDpeTPEMFjH1sHzbICYGkTyezf4TAwRpEAlL7AM7JPc
 Bx3a+mAV5FIhDTiEC6wLMPthy4j01Q3e27snVF9d/E/XVLy+DR3+7wXT0f8xjHAjXWJMS7bwRWc
 OPL6ogr1Tz9DFlUfi5oPkYKq4rl+mtaTOt+NjNkjjXkAzMuVD0ZIQ1Om9lv/9MY0MVoLpGKs5bw
 Dn9kCKCEidO3FzrWj/T8wLW09DEVAw/Ig9h7Uxm8LO0cw2m82X3YTMHvashPv1smx3MvtJ6fYPC
 s4IO+PAe+N8X2o1Gb9nYU3I78t5qbHRONv5OL81ZcszXS1lTrAmTOhN6SwImM/KeLMzFAIGWbKh
 SuTd+YaZOU/1OKBjPSl2iwR7Hrng42raxEK0OEfVBz5kxtSEYJQ0W64FM6MhKcpwMS8shoQVPm8
 BDtE9IOYnedh/lmT3UD7guiU7VCUnhuZ7+vqpw3S5NyHD3xi+lzPcn8Tb5pwbYUSxQS4zAt2GZv
 hlJb61J8eKVQ4fAd1MteGLrGIdJ3HbdiSIdnjGl4fKUOtI4kyPqtUyQiGx+SMqf8hnhDVRn+D5B
 PMn+6kSPcNpzhGo9c0JLsybMfPbW9rZV
X-Received: by 2002:a05:7301:438e:b0:36a:3767:ede0 with SMTP id
 5a478bee46e88-36a4240176emr7447663eec.26.1793458324905; 
 Sat, 31 Oct 2026 07:52:04 -0700 (PDT)
Received: from ubuntu.lan ([2405:4802:913e:86f0:fc32:76b2:b6d6:a3f6])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428c17bdsm17541006eec.6.2026.10.31.07.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:52:04 -0700 (PDT)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH 4/5] hw/misc/allwinner-sid: Support configurable eFuse
 capacity up to 512 bytes
Date: Sat, 31 Oct 2026 21:51:46 +0700
Message-ID: <20261031145147.32683-5-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031145147.32683-1-dovankhai97@gmail.com>
References: <20261031145147.32683-1-dovankhai97@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x1329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 31 Oct 2026 10:57:32 -0400
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allwinner SoCs provide different eFuse capacities: older SoCs have
16 to 256 bytes, while newer 64-bit SoCs (e.g. H618) provide up to 512
bytes of eFuse storage.

Add a "size" property (defaulting to 16 bytes for backward compatibility)
and an internal storage buffer up to 512 bytes (AW_SID_SIZE_MAX).

Signed-off-by: Khai Do <dovankhai97@gmail.com>
---
 hw/misc/allwinner-sid.c         | 8 +++++++-
 include/hw/misc/allwinner-sid.h | 8 ++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/misc/allwinner-sid.c b/hw/misc/allwinner-sid.c
index b5f827d4bd..0068b07eee 100644
--- a/hw/misc/allwinner-sid.c
+++ b/hw/misc/allwinner-sid.c
@@ -83,6 +83,9 @@ static void allwinner_sid_write(void *opaque, hwaddr offset,
 
             if (id <= sizeof(QemuUUID) - sizeof(s->rdkey)) {
                 s->rdkey = ldl_be_p(&s->identifier.data[id]);
+            } else if (s->size >= sizeof(s->rdkey) &&
+                       id <= s->size - sizeof(s->rdkey)) {
+                s->rdkey = ldl_be_p(&s->storage[id]);
             }
         }
         s->control &= ~REG_PRCTL_WRITE;
@@ -129,16 +132,19 @@ static void allwinner_sid_init(Object *obj)
 
 static const Property allwinner_sid_properties[] = {
     DEFINE_PROP_UUID_NODEFAULT("identifier", AwSidState, identifier),
+    DEFINE_PROP_UINT32("size", AwSidState, size, sizeof(QemuUUID)),
 };
 
 static const VMStateDescription allwinner_sid_vmstate = {
     .name = "allwinner-sid",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(control, AwSidState),
         VMSTATE_UINT32(rdkey, AwSidState),
         VMSTATE_UINT8_ARRAY_V(identifier.data, AwSidState, sizeof(QemuUUID), 1),
+        VMSTATE_UINT32_V(size, AwSidState, 2),
+        VMSTATE_UINT8_ARRAY_V(storage, AwSidState, AW_SID_SIZE_MAX, 2),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/misc/allwinner-sid.h b/include/hw/misc/allwinner-sid.h
index cfa22a4d7f..da8c235c5d 100644
--- a/include/hw/misc/allwinner-sid.h
+++ b/include/hw/misc/allwinner-sid.h
@@ -24,6 +24,9 @@
 #include "hw/core/sysbus.h"
 #include "qemu/uuid.h"
 
+/** Maximum eFuse storage size supported */
+#define AW_SID_SIZE_MAX (512)
+
 /**
  * Object model
  * @{
@@ -54,6 +57,11 @@ struct AwSidState {
     /** Stores the emulated device identifier */
     QemuUUID identifier;
 
+    /** Size of eFuse storage */
+    uint32_t size;
+
+    /** eFuse storage buffer */
+    uint8_t storage[AW_SID_SIZE_MAX];
 };
 
 #endif /* HW_MISC_ALLWINNER_SID_H */
-- 
2.43.0


