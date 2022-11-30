Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1211810ejx;
        Wed, 30 Nov 2022 05:28:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Fi9+2YzsffAJwTh4WApPY9KbDZ/kV+I1kEoT/Ke/wB4Na7DNU2jghFPJGyj3BFxujHSVx
X-Received: by 2002:a05:6214:5584:b0:4c6:f62c:acd0 with SMTP id mi4-20020a056214558400b004c6f62cacd0mr17969873qvb.90.1669814897664;
        Wed, 30 Nov 2022 05:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669814897; cv=none;
        d=google.com; s=arc-20160816;
        b=yXfkdjDXv4tqeFbSmokpjDNW+Ihd1y5SFqER+CO08qFrbBKgIJiKkWjKmJO9/9Zlpj
         yp7ZNIXUIDOHGL6pT4OfSr1AnbaoBck//Y2cibDBmEGJP0Lb7R9Uo7htXCZmw50sKZg2
         24mXeB+VF5S0Zqe3K3u1x3g3XrQvf2Ojc7djmrHdVhUv8PzWfCR+/eyY7WrTGaNhbrXU
         WL2o5A4V3agXylr9hlFu8660gNIQWCU5wGG5uFBDctaHsDAOzKzJE96gMxjfvr98emOP
         vmUhkmk1vrjE5T3sG0FnTjQhjMZVvK9Xz8QOQZYMsNml75JFecGO5/XgP/VALsfI3OT4
         OnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q0hlyySKVnySixpBBftSUOW0ckS2cMlLLOX+y+Pz+0E=;
        b=J52yaQSkpSwbd7o/iHV2/DH5ZcK9xVSiJ3LWDG125CJh4yotsmNuyaUv8Ujkgf7Rt+
         y5eHeq/OxVYSlue190SsIIZTU0d4RGUqVjr1/PiYVYfTiZ5ScHx8B3xCd0pTovaVBrFI
         EIxWRHdAdRwgHp88BHBbO3ux7Tan6XVDvZDz9atjcwR/M/xtuD5XpVSc6VLITBu8nxs6
         iuHHNrBiPv7gEKwhiDTmb1z98bftJ8NTKsZ/LeES/d+REFmiJEPEkppVi0Edp/6Y0uRw
         bRkMpz4qzJZ4VytocRm6fRgP8p2vdjEhOC+l0zM8KYfEG6O+vjmLScCXSXARMMrPC0A5
         uaww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wUQ5/JV2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a05620a240500b006fa8299b281si173535qkn.241.2022.11.30.05.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 05:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wUQ5/JV2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0N7C-0003EX-UE; Wed, 30 Nov 2022 08:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N7B-0003Be-Hq
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 08:27:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N79-0006JW-Cp
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 08:27:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay27-20020a05600c1e1b00b003d070f4060bso1389313wmb.2
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 05:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0hlyySKVnySixpBBftSUOW0ckS2cMlLLOX+y+Pz+0E=;
 b=wUQ5/JV2Gfwkdh1f8GFbe3QP0HCQpR8Ul+V2CXYDP1W69q2HbZMBg+DFywPnHKowsW
 JYLwbtxxk/OaRU/KntXUlCmvti/XVsb+8ABJkox24MyBI2m862dCLGTksjvCYI5vRKEP
 7FmROlj7DXp0a24v2J5kDuGSDtfbgUgODD9KJvlWu6Xb7zSkAwN8VFF50TEg0j31IPX8
 cITZ+42P2xHpvFr3ZOQsu0q/OxybY6OqgKSum1HbNNspgtNeTmbmtCExKzee4faczGrT
 ckv7m9HR1CvxNRj7bUgYiZchvI4Cp/U9f574soQMKAzwL3Z8SykEcOVBEN5IX0vrpsHz
 HoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q0hlyySKVnySixpBBftSUOW0ckS2cMlLLOX+y+Pz+0E=;
 b=RTRJLmZkc1MlHT1zUzPKP7Q/l0bKt5F1d/faKQmnXmd+SeoeDO3eFJ0PoR7jP3Oxqw
 MBJXmpRCvIVyE30defhquurpBW23NrzSPl9NTt0IwOJYCDsnpRHkLIPrey51jNFuJvlz
 9kQ0+IxcXDfTjV05ABZgRCmPiP4yEDVe07JUvqqgzICej4rg/e1kav8rjxCZpfjVcfLX
 GanH90SRzaeeZ0fSIiZWiVEXBOxfz4YtoqT5TWq8wnAvNZNJ6lROnPjDtnSkKFHlhj7q
 Ipyt0d7ktdQvxe14u3cH9iagrPVdlP2UdftrOoE+0y2xo8FqkhNSlAG8ZqFVgGl/4bjk
 uoXA==
X-Gm-Message-State: ANoB5plcBQrgQ81AtF46mImEVvSmppHeazLeorwGMTZFbixbrMBw6vIw
 jDDpu7P03V9mqtvVtdgsWvhKPA==
X-Received: by 2002:a7b:c3d5:0:b0:3d0:306c:f7a3 with SMTP id
 t21-20020a7bc3d5000000b003d0306cf7a3mr28008677wmj.128.1669814821888; 
 Wed, 30 Nov 2022 05:27:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adfe8cc000000b00241b5af8697sm1610416wrn.85.2022.11.30.05.27.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:27:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, WANG Xuerui <git@xen0n.name>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: [PATCH-for-8.0 1/3] tcg/s390x: Fix coding style
Date: Wed, 30 Nov 2022 14:26:52 +0100
Message-Id: <20221130132654.76369-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130132654.76369-1-philmd@linaro.org>
References: <20221130132654.76369-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zu625CQU8E2C

We are going to modify this code, so fix its style first to avoid:

  ERROR: spaces required around that '*' (ctx:VxV)
  #281: FILE: tcg/s390x/tcg-target.c.inc:1224:
  +        uintptr_t mask = ~(0xffffull << i*16);
                                            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 33becd7694..f1d3907cd8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -802,9 +802,9 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
     }
 
     for (i = 0; i < 4; i++) {
-        tcg_target_long mask = 0xffffull << i*16;
+        tcg_target_long mask = 0xffffull << i * 16;
         if ((uval & mask) == uval) {
-            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i*16);
+            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i * 16);
             return true;
         }
     }
@@ -1221,9 +1221,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = ~(0xffffull << i*16);
+        tcg_target_ulong mask = ~(0xffffull << i * 16);
         if (((val | ~valid) & mask) == mask) {
-            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1231,9 +1231,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i*32);
+            tcg_target_ulong mask = ~(0xffffffffull << i * 32);
             if (((val | ~valid) & mask) == mask) {
-                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
@@ -1279,9 +1279,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = (0xffffull << i*16);
+        tcg_target_ulong mask = (0xffffull << i * 16);
         if ((val & mask) != 0 && (val & ~mask) == 0) {
-            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1289,9 +1289,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i*32);
+            tcg_target_ulong mask = (0xffffffffull << i * 32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
-                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
-- 
2.38.1

