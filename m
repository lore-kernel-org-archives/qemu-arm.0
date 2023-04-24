Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600560ejm;
        Sun, 23 Apr 2023 22:53:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAEcjJJDlkpmbB3I0tyeA8URSLpP6sLzfigcxNzHutNYsNBxFOzQAyCU/GdroL4MDpLYZm
X-Received: by 2002:ac8:5d87:0:b0:3e7:ec0b:f63c with SMTP id d7-20020ac85d87000000b003e7ec0bf63cmr20850270qtx.33.1682315605521;
        Sun, 23 Apr 2023 22:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315605; cv=none;
        d=google.com; s=arc-20160816;
        b=j3H+WDtoO9Hz4/QEV72QFYrUAVbnI7genlG86KWhSvooRW/ZihqJGaXuIteFZhegPc
         OdHrO9Op32vOaJaU909iktaCOFYRqep1jHfq+KBoHb/ObEcR2cVZ8JuRlA2hD3V62k0Y
         /KuyiH2Kt7qGxQ5ZDBiw8GYTNtQh0SreA9EstDc4DyKaA7vh86GdbRqUYV8IOGHsd6XR
         z7QISuC/0OmAy0F8F86ozmb2sa1y92Dy2+/tCbAf2JArX8jVYpUdiaufYdhg8ya/SDT9
         I96qihfjurs2Vggs6hXA9RrOi3FLFSEMuuo5nVSSFiUkJlE2+v55GpijYtAh3F0zObEA
         uo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1e3+3125R6Ll+hm5X+IbfdxFrIfgl7VB8JipCIcUQ7c=;
        b=qNZ1EaJU/JBST1/ATZ05dkuQTqCaZGrBpqgB6rDcUJKmTzAR23uWFJdHZ7m8yhOc6S
         TrHJsjq1qxzWigAvUaPtu58EzW5Sb3/fFB49QW/8UtKkJLdp3Qwe6vlZhq98zpTOJMfl
         Adm04Fps2FQOwiwVdoq9lzjd5xpHWARdi4L9VX/Cix+quT/PouVirm3KJtWp0/MSsAul
         anaprBlnrT58ZfxL+BUynaWvjlmqZkAYs91/lq4/R4SUMOwzFcoopWK9n7E+CCiGEWoi
         RsW7Ud9orA3TW8hpKjInjeJRQMPAgLWRczsr6aRKYzahENXyAuSqs5B36sxWOliQllgP
         0KIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ikCqUS/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020ac85ace000000b003e3f71d4ce7si6899080qtd.655.2023.04.23.22.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:53:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ikCqUS/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp0G-0005x8-0k; Mon, 24 Apr 2023 01:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxu-00063k-OZ
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox7-0004T3-5n
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f8405b3dc1so2289573f8f.3
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1e3+3125R6Ll+hm5X+IbfdxFrIfgl7VB8JipCIcUQ7c=;
 b=ikCqUS/ewX2b7dhjuRKsfh56WF/nCP5QStoXznFXE0hxBDCdpPoBsRNoNjcIaTdrE+
 Fuvkog7wbtif0V5/Z6/gLGMbaNdErOdnUDZgHgGqiIO0VmKTsFvDLyd7/ggF3Qd1u6nB
 jEB8pAHlYVt3MrKc0fIVlMnCKnuLMkdFPUGF0KVoqr4DY0jqJ9/bVgkBleA2fbCM8UbQ
 H2DzUS59md2n3x2m4XzfR3CImzcDvhQLmbgW7pZh114ZMOJW+pTiN+nB03qutuPy3Kpx
 FkRXCsdkDjiya9s7bpV3SCmeaE2uYyxpk7Bz7wZZAFjsuKJwBGsMAjFb8/xmn2mBvdJv
 VcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1e3+3125R6Ll+hm5X+IbfdxFrIfgl7VB8JipCIcUQ7c=;
 b=eAoG7bNB/L8JaPSljnN3AI3s6wjoiGPUaXkjvG9Djta5qXCuleRJ4/M79K+uyxGtan
 lFa4d/NW0F8kk1xm2h5wH3/piKCh9tQnaIVE5k7sM8jMLOqnbTbCHIT1+aNtmkRo7efz
 R5Dm2XfCnJJWeWaKjGVGVtG/3DvovCbrGIDcIvheQXlgODowqq2LD5on6Z2pXhPLom5X
 8sfhW6VcYndmLXYorMMl5KgzyTtcqWZppquCEfvSxUX1eQEyWeUIMAMhbJhfaTAl6gLE
 dd/DTpZa7pjDGC7TByPNdJYW5JVw8tP8rafjRuMgH7pUUEglcRJVjIH0UWoLmptFZGsX
 v78Q==
X-Gm-Message-State: AAQBX9elIVo0K5wL5KOlC5+8qUiZyOAX7hffnWB2tbDfjE07lCfawfUf
 JCesoG3B26St3FYGUXX0HIGtPg==
X-Received: by 2002:a5d:6182:0:b0:303:2702:6d66 with SMTP id
 j2-20020a5d6182000000b0030327026d66mr7170455wru.63.1682314886134; 
 Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 34/57] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Mon, 24 Apr 2023 06:40:42 +0100
Message-Id: <20230424054105.1579315-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: avRQHcsID3AP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..6f5daaee5f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1

