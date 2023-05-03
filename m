Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2647625ejm;
        Tue, 2 May 2023 23:58:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5XVYMk1Py9HqK/grDeEfGY+hVCl7HS7+GOgMbYClouiuZ8XCTaOx3vZ40Fgf00sJXYemSr
X-Received: by 2002:a05:6214:2525:b0:61b:6872:1471 with SMTP id gg5-20020a056214252500b0061b68721471mr6360002qvb.12.1683097100082;
        Tue, 02 May 2023 23:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097100; cv=none;
        d=google.com; s=arc-20160816;
        b=wi6vWuxw7B7IB61+hLSOOIQxajrBQZrlUUvqjJ9cFVRaZFJaGL44cYbYxb3gzEAoFl
         H1n5rYqPmgFxWOHhiPrXy2wubkAHlp006VxOZa/3mMLsVNNGRcifLBLI+IBLqNGJC8e5
         lZLrw/V/hsnbmESkVE0UKrCHhHFp9y0LT9Qf+JkrbHXMn6+0epXJ2H/QunT8W6Y/huMt
         AjWTQp88DMsHwUdjNUap6WswOzn+rQygg8lweqOPqUKaGl4poeBy289ohrGErH+N5fYN
         lrfCmFX5p7yoPZOEXATrFzC6xqyHUhYGFfzV0F0RaqZJWb3DlNBNxbFzB+3aGVLUy9jb
         D/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
        b=TIATjszzZVMedbKZYzSsdkVue8B3nWm2c+kZvqR9d5cfVx3bUhr3/g5NT52PUyS/N3
         ij7Rmmg+o51cQ7LCM6OQO85oKnChiSddRHpIWvFXKOVRCry3p0DV+wXgFDttDCHSKcjr
         L6DikKb8FrJWmqhl3X3Ed3Jf45BOu1iSD7+Z2FdVuqVPx+Xa5ZbJaeoCtoQ+rqrajzCn
         6aDsYMH9i22muoyUNCppFQmcDWMahfZTU7jPmVGhNFx+qx9bGgFnsvBKb5IdCSDUTFKt
         41tObMlSiNrM8DSsZCZVldIdanGmQCeMY8AtybMLo6Ls/sONWpBQ2bQciplTE8m2tQPT
         Dpjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYH75eiN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a0562141bc800b005f468dbfef4si18723361qvc.111.2023.05.02.23.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 23:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zYH75eiN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6Qs-0007XH-A7; Wed, 03 May 2023 02:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qq-0007Uw-6w
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qh-0001gG-Bo
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso4718082f8f.2
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097054; x=1685689054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=zYH75eiNuH+AiV7xV48mbTHPZV7JvMjteYsyM2Q2x5IasI+DeWTxwbWXoa+/sNbkJ2
 ySOX+AjGqEmZwY7penQ9Cl+KZIxL9CmzRNj5nSJJL2q/SrV2PIPxu/0srq89Iod9y4T4
 EaQMWv71+0KuBYjHMlCJVSopMO+awE+wm66t4GdyWOft+tR9L3sAPPlVaNFQXITnwwft
 A5ykygpevGcHtZXiz2rCsGiyRJUAHuOQOwAq3WtUUPUMGC04YxzXQYUPbvFm/QSSa7Se
 nwFEcOF5E7e7AfkaUr81E9g2g0HFcmQJxxNH7B4r82NSoh7PO18rBpyTBB493nuu6aI8
 eSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097054; x=1685689054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=Z8T0qVy+zBRYdlMuahPWDEOUQE8AU2OnM1otVNzbE4Pujv/NtAsORV/Q6VfYHzo3rr
 RT4Fzoi0GHfllWLVlO3Ds4muJ0CMkl4qBFTz3UVcVWLETJV1n/r+q9UmSwV1ds1fYfWU
 e/Gk5+g7nrHwU9vOQRIfWrM4RiNq6YC1g0BU36OV7ddWGAdTMNW6Kot+S9aoKb7D5LQ+
 rJvJeX/1fodttlyaxX6Jr9xMZLg6qirc9iksJfQfUM0q5uR3UrhtTeY6dshXuMBkegyv
 w+rbjyHCjo35KeOh//XnC3E8N0QKam4VzZ/FmmzcDc52PCobqbLs6m+0emQmijJGrhEs
 +nTg==
X-Gm-Message-State: AC+VfDwOIizln/LGh2mkTjfb3ful5rOZ94Ekz2lZtKlm2nDPa1OZznVE
 xelSgb1TpYqmzktOy0cUj6VlBw==
X-Received: by 2002:adf:fbca:0:b0:306:43a4:86b with SMTP id
 d10-20020adffbca000000b0030643a4086bmr507000wrs.4.1683097053812; 
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 05/54] tcg/i386: Introduce tcg_out_testi
Date: Wed,  3 May 2023 07:56:40 +0100
Message-Id: <20230503065729.1745843-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: x+DzAs43NQ39

Split out a helper for choosing testb vs testl.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 78160f453b..aae698121a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1751,6 +1751,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
+/* Test register R vs immediate bits I, setting Z flag for EQ/NE. */
+static void __attribute__((unused))
+tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
+{
+    /*
+     * This is used for testing alignment, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (i <= 0xff && (TCG_TARGET_REG_BITS == 64 || r < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, r);
+        tcg_out8(s, i);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, r);
+        tcg_out32(s, i);
+    }
+}
+
 typedef struct {
     TCGReg base;
     int index;
@@ -2051,18 +2068,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
     unsigned a_mask = (1 << a_bits) - 1;
     TCGLabelQemuLdst *label;
 
-    /*
-     * We are expecting a_bits to max out at 7, so we can usually use testb.
-     * For i686, we have to use testl for %esi/%edi.
-     */
-    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
-        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
-        tcg_out8(s, a_mask);
-    } else {
-        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
-        tcg_out32(s, a_mask);
-    }
-
+    tcg_out_testi(s, addrlo, a_mask);
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
 
-- 
2.34.1

