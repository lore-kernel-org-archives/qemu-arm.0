Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CDC5DF74
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 00:27:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww7fI-0002Nu-VQ; Mon, 17 Aug 2026 20:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7f8-0002KW-Re
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:42 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7f7-0004Im-0C
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:42 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-44cb057311bso2657892fac.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787012800; x=1787617600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pGsJ55D7oCaxHGChmflsrSfJqDyjOVB7e8WxHFWVoOE=;
 b=EIE5hoI2YXCHaOUqhkxXCBJyYQE3zblbEtkG+7zkLwUzbY77HRJEaqZVbXlBjAr2yN
 fTJ6SZTyI9wpG2ZpauL5Ucicmy76SfMTuXjuL3HGZjMnqhn9HALLEPMhWXB9+4q2nuQg
 UgyMvgIGxkihspjCyiOqvDK5Vy2S5Jdwvwu7RvXFupHQGwgQa5k7noGGaawzLUqR2J2A
 VUMCnRaLQ88rHWPpzcApLvN8w3v3falnqeuDGTAC7Gm6y597e3bpzeIMBWbaMdipuUA8
 pFhwHNubJn/j1vAoH+28NINIfPySwwOir+VInW6M4/5KzsYPEf76HvSAX6j1YYjggctr
 ihaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787012800; x=1787617600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pGsJ55D7oCaxHGChmflsrSfJqDyjOVB7e8WxHFWVoOE=;
 b=Nc769eVDylYr7j8J3DMN28/nlr/s9+fXxlw3GbSfujQZFDo0R7AeGzD/98zgQVJxT7
 vNy6x9f539F7i3PwWEeXdpLuxIso75sGYqNfZCGPm25aX3T2c3JoE51Ajb8Re+fmjwht
 WDwlNkFzSAMj6YTXwX03aHm0447Yvguy4gPomzKRnwDDjI9DFYU5+AMipXQIvQbTGEeh
 OS04KedUA1f1yf3tMPx1E4bSaEKd98Tmtw3ins6zd8kQESQ59l9jHexyWp1ZYZKhy9z6
 pKMiUTP5h6brmsCAMjECbHaIPAHVOymKayHk28Ueu57IyPduTdjLhRcqQpbUmKapQqBm
 pXAg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcL23bu9Hl0g5gUvgVjmn1q1rhMm6ha054iQZMWsE0uJIe0tS+/2o/Ye1EKNTqpd8T6WTUlJVf/Q==@nongnu.org
X-Gm-Message-State: AOJu0YyfwUpUjDDjurTm/okmb/yciqXi5MqmT+/+2YoubU9VQdCNJGGn
 I4jrEs2FElRs6Yquyf6WWv/auZHNMtT347ujdLd/wPUCPFxA2L2gR9ij
X-Gm-Gg: AR+sD11tU2wzAflTk4/KvNxBCVeQGRViKPEiGsajm+Pu9bbBa2OTLnsw4FasivzxP8r
 457gOcn79EWo2oRyt7XXs7eEJKaQlZWKeCpTpyJyAScL70IvI1OhKPBP+sVsrv8NK/+iL/sZPSP
 cJAmmkHxXZw78Z2H6RJIKml3R60X3f324//DIZ8y0UyPhOs5HrAHAttOeP+j7DljTcjeEGnWQWb
 VxhHxLkuqCnbl5z3bSINho2YOikTi0wovo/fcObE3PBaysVfl/pH40IlBM0lmg/vbMFMuQLJ6Zh
 8l7rZ9KeGytsglnCc86O/V0o32tDtlg8uzx0XBJ0qd6R5OwJkFJ+fm81HGkPKXWDEtJmx4xP9r/
 IXVc6cFkJTAsXDjewlFIIcDf9RondWykxPBOhgRxRm/HdEevXS1YJFMUbxtc3fIgLHYACsS/Udh
 LKlbHwwIni/2KyVlJVJD+/P7giDzticAkTS2/MBFCNuaef99HW9rKsEAuu3piHA9Nu7FRqqTSMm
 h1Ne06hJk7aaFhmtAY6n4k=
X-Received: by 2002:a05:6808:1787:b0:489:352c:5153 with SMTP id
 5614622812f47-4b297757c6cmr4726594b6e.21.1787012799644; 
 Mon, 17 Aug 2026 17:26:39 -0700 (PDT)
Received: from LAPTOP-86EU4LQA.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b2960dfc9bsm1715165b6e.14.2026.08.17.17.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 17:26:38 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>, Owen Giles <owen.giles@hpe.com>,
 Robert Elliott <elliott@hpe.com>
Subject: [PATCH v3 6/9] hw/misc/iotkit-secctl.c: use GNU C case ranges
Date: Mon, 17 Aug 2026 19:26:26 -0500
Message-ID: <20260818002629.172827-7-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818002629.172827-1-simonxhy0404@gmail.com>
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Replace case fall throughs with case ranges when register addresses
are continous.

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20260805153005.9989-7-simonxhy0404@gmail.com>
---
 hw/misc/iotkit-secctl.c | 112 ++++++----------------------------------
 1 file changed, 16 insertions(+), 96 deletions(-)

diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 9f6fb81088..2d06d6f80f 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -187,36 +187,24 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_BRGINTEN:
         r = s->brginten;
         break;
-    case A_AHBNSPPCEXP0:
-    case A_AHBNSPPCEXP1:
-    case A_AHBNSPPCEXP2:
-    case A_AHBNSPPCEXP3:
+    case A_AHBNSPPCEXP0 ... A_AHBNSPPCEXP3:
         r = s->ahbexp[offset_to_ppc_idx(offset)].ns;
         break;
     case A_APBNSPPC0:
     case A_APBNSPPC1:
         r = s->apb[offset_to_ppc_idx(offset)].ns;
         break;
-    case A_APBNSPPCEXP0:
-    case A_APBNSPPCEXP1:
-    case A_APBNSPPCEXP2:
-    case A_APBNSPPCEXP3:
+    case A_APBNSPPCEXP0 ... A_APBNSPPCEXP3:
         r = s->apbexp[offset_to_ppc_idx(offset)].ns;
         break;
-    case A_AHBSPPPCEXP0:
-    case A_AHBSPPPCEXP1:
-    case A_AHBSPPPCEXP2:
-    case A_AHBSPPPCEXP3:
+    case A_AHBSPPPCEXP0 ... A_AHBSPPPCEXP3:
         r = s->ahbexp[offset_to_ppc_idx(offset)].sp;
         break;
     case A_APBSPPPC0:
     case A_APBSPPPC1:
         r = s->apb[offset_to_ppc_idx(offset)].sp;
         break;
-    case A_APBSPPPCEXP0:
-    case A_APBSPPPCEXP1:
-    case A_APBSPPPCEXP2:
-    case A_APBSPPPCEXP3:
+    case A_APBSPPPCEXP0 ... A_APBSPPPCEXP3:
         r = s->apbexp[offset_to_ppc_idx(offset)].sp;
         break;
     case A_SECMSCINTSTAT:
@@ -228,18 +216,7 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_NSMSCEXP:
         r = s->nsmscexp;
         break;
-    case A_PID4:
-    case A_PID5:
-    case A_PID6:
-    case A_PID7:
-    case A_PID0:
-    case A_PID1:
-    case A_PID2:
-    case A_PID3:
-    case A_CID0:
-    case A_CID1:
-    case A_CID2:
-    case A_CID3:
+    case A_PID4 ... A_CID3:
         switch (s->sse_version) {
         case ARMSSE_SSE300:
             r = iotkit_secctl_s_sse300_idregs[(offset - A_PID4) / 4];
@@ -389,10 +366,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
     case A_BRGINTEN:
         s->brginten = value & 0xffff0000;
         break;
-    case A_AHBNSPPCEXP0:
-    case A_AHBNSPPCEXP1:
-    case A_AHBNSPPCEXP2:
-    case A_AHBNSPPCEXP3:
+    case A_AHBNSPPCEXP0 ... A_AHBNSPPCEXP3:
         ppc = &s->ahbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_ns_write(ppc, value);
         break;
@@ -401,17 +375,11 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         ppc = &s->apb[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_ns_write(ppc, value);
         break;
-    case A_APBNSPPCEXP0:
-    case A_APBNSPPCEXP1:
-    case A_APBNSPPCEXP2:
-    case A_APBNSPPCEXP3:
+    case A_APBNSPPCEXP0 ... A_APBNSPPCEXP3:
         ppc = &s->apbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_ns_write(ppc, value);
         break;
-    case A_AHBSPPPCEXP0:
-    case A_AHBSPPPCEXP1:
-    case A_AHBSPPPCEXP2:
-    case A_AHBSPPPCEXP3:
+    case A_AHBSPPPCEXP0 ... A_AHBSPPPCEXP3:
         ppc = &s->ahbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_sp_write(ppc, value);
         break;
@@ -420,10 +388,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         ppc = &s->apb[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_sp_write(ppc, value);
         break;
-    case A_APBSPPPCEXP0:
-    case A_APBSPPPCEXP1:
-    case A_APBSPPPCEXP2:
-    case A_APBSPPPCEXP3:
+    case A_APBSPPPCEXP0 ... A_APBSPPPCEXP3:
         ppc = &s->apbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_sp_write(ppc, value);
         break;
@@ -444,18 +409,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
     case A_BRGINTSTAT:
     case A_AHBNSPPC0:
     case A_AHBSPPPC0:
-    case A_PID4:
-    case A_PID5:
-    case A_PID6:
-    case A_PID7:
-    case A_PID0:
-    case A_PID1:
-    case A_PID2:
-    case A_PID3:
-    case A_CID0:
-    case A_CID1:
-    case A_CID2:
-    case A_CID3:
+    case A_PID4 ... A_CID3:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SecCtl S block write: "
                       "read-only offset 0x%x\n", offset);
@@ -482,34 +436,17 @@ static MemTxResult iotkit_secctl_ns_read(void *opaque, hwaddr addr,
     case A_AHBNSPPPC0:
         r = 0;
         break;
-    case A_AHBNSPPPCEXP0:
-    case A_AHBNSPPPCEXP1:
-    case A_AHBNSPPPCEXP2:
-    case A_AHBNSPPPCEXP3:
+    case A_AHBNSPPPCEXP0 ... A_AHBNSPPPCEXP3:
         r = s->ahbexp[offset_to_ppc_idx(offset)].nsp;
         break;
     case A_APBNSPPPC0:
     case A_APBNSPPPC1:
         r = s->apb[offset_to_ppc_idx(offset)].nsp;
         break;
-    case A_APBNSPPPCEXP0:
-    case A_APBNSPPPCEXP1:
-    case A_APBNSPPPCEXP2:
-    case A_APBNSPPPCEXP3:
+    case A_APBNSPPPCEXP0 ... A_APBNSPPPCEXP3:
         r = s->apbexp[offset_to_ppc_idx(offset)].nsp;
         break;
-    case A_PID4:
-    case A_PID5:
-    case A_PID6:
-    case A_PID7:
-    case A_PID0:
-    case A_PID1:
-    case A_PID2:
-    case A_PID3:
-    case A_CID0:
-    case A_CID1:
-    case A_CID2:
-    case A_CID3:
+    case A_PID4 ... A_CID3:
         switch (s->sse_version) {
         case ARMSSE_SSE300:
             r = iotkit_secctl_ns_sse300_idregs[(offset - A_PID4) / 4];
@@ -560,10 +497,7 @@ static MemTxResult iotkit_secctl_ns_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
-    case A_AHBNSPPPCEXP0:
-    case A_AHBNSPPPCEXP1:
-    case A_AHBNSPPPCEXP2:
-    case A_AHBNSPPPCEXP3:
+    case A_AHBNSPPPCEXP0 ... A_AHBNSPPPCEXP3:
         ppc = &s->ahbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_nsp_write(ppc, value);
         break;
@@ -572,26 +506,12 @@ static MemTxResult iotkit_secctl_ns_write(void *opaque, hwaddr addr,
         ppc = &s->apb[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_nsp_write(ppc, value);
         break;
-    case A_APBNSPPPCEXP0:
-    case A_APBNSPPPCEXP1:
-    case A_APBNSPPPCEXP2:
-    case A_APBNSPPPCEXP3:
+    case A_APBNSPPPCEXP0 ... A_APBNSPPPCEXP3:
         ppc = &s->apbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_nsp_write(ppc, value);
         break;
     case A_AHBNSPPPC0:
-    case A_PID4:
-    case A_PID5:
-    case A_PID6:
-    case A_PID7:
-    case A_PID0:
-    case A_PID1:
-    case A_PID2:
-    case A_PID3:
-    case A_CID0:
-    case A_CID1:
-    case A_CID2:
-    case A_CID3:
+    case A_PID4 ... A_CID3:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SecCtl NS block write: "
                       "read-only offset 0x%x\n", offset);
-- 
2.53.0


