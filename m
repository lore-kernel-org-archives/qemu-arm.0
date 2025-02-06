Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777941njb;
        Thu, 6 Feb 2025 11:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXF6pRbuUjMmWistDxy+oRntsK1PKFej8TPDLRQjkUAC9yd+BxQ5aNsXa1KZxRyVQSEjPbARlglls2cSg==@linaro.org
X-Google-Smtp-Source: AGHT+IGz3nA9sxcpvGh1HYZjKrDQyCfzG4ewtvSFQnHgV5x5UnGfsN8nrgrJmI2+Nb7bLixkbhk1
X-Received: by 2002:ad4:5caf:0:b0:6d8:a730:110d with SMTP id 6a1803df08f44-6e445404871mr6325026d6.0.1738871979797;
        Thu, 06 Feb 2025 11:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871979; cv=none;
        d=google.com; s=arc-20240605;
        b=eR80YGCeeVtTAZihINk7NHbKN81oQUtjmH6za+pxlYT8xC/w34DOSCQUu45QBPGlQQ
         PnMNOw7ZE4T7yVlPrF6YAnhO9ov1lew1xdr9KjKu1cb+psAuNtvbvtW4nleqAYm5gQnQ
         TJHaNAZIVYckMI81fynEEF7JT31EixCYqn3YOmy8YTkax847vgqjP+8aIk9TaQZU5cu7
         3PhLm7OsX3etSk9m/YCQ+r3Cn9BdoSDF4bIvRSH5dR74zv4ps7cX5g0V++OrXEJvziJn
         dQA8pr/e8aJ2lFpXBnu8glYTxLyZgveQQetWZoSMqrsh2SYfZKdEjompdtXM5nJv5bAt
         0cSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OABk97XTtm79Sq2NVhMIhHFnnM1fve3UTe1L1EwPjNk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SpP5f46pNLGTaZTPw1Dz/ZGyxz4K0v9+Y9IWbDPs4FSVreE9uO7tXG+A4KwvLWb318
         YIyt/wBaWyiSmA+PvqAa7XOqjIwrO4v3ZjQLAALlPnWmZeSLT9gujqmeOQpsM71nZuPT
         F+nLlJAWHkzc/Hin3WmiU90VtHp0VZPDE8hkLATFCJPMd7lmc1G78NPQmC3yTbZOuCU0
         SLZfsHwaGcWL2loPuWg0qTUK3olxhMnI7vkjgRImtWGPZVAJji4EUP9G545ZAuGK9Zp8
         AIXOoqMBJJBjEDKJ1yKBSRwEqVkHIDCgIH0TvQnbWq9nJXG7Dcl9cVzfxM5NlwY+Et/u
         +IFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q4kVVA6B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bb02353si16473266d6.429.2025.02.06.11.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:59:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q4kVVA6B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg80Y-0007RQ-2L; Thu, 06 Feb 2025 14:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80A-0007CS-Pn
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:30 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg809-0000VD-4U
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:30 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21f50895565so202725ad.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871848; x=1739476648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OABk97XTtm79Sq2NVhMIhHFnnM1fve3UTe1L1EwPjNk=;
 b=q4kVVA6BIOM388scmZgquoDm3Iu6r1RGf8HUhBGQONi09Y+8NYZ8J8paZDuTWCvgDN
 XmtISzOok06vY5rVBtI21PgEJwtteQ/9rivYW+uVSHhDRScMA+nIZzr36WM3oiUnvzh5
 e18qJmnwcl9VfFebvvnQFPNxY4JzrX66nOeFMadXDg+xWu06k3ps3AEWQYd/2a2/Nzg9
 mAmEG0NpfSzVvuEUdOLq586QBFI1YEHc9dnJfDx8Kc4ufrExt7yKOMigM6tWSPM9U3Kt
 sSFsvf+YNFSkzBfde54nm5tK76HOI07v3IlvPEWAAvTYID/VazD7SU2XPWDZb0ISa+cw
 3WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871848; x=1739476648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OABk97XTtm79Sq2NVhMIhHFnnM1fve3UTe1L1EwPjNk=;
 b=mELWkZ05MSJvCqG/CIm/uRRroWLpoFo4OT61VnYPS5m521kpbzOunCGU1fsTUeKabA
 sDW18wrSmT6HZvpAKpuPBWsXIHWSH83JZmIzdz3cM5i419Q15Km9tfM3KTMuVVS2ZhRq
 Vjyz/anRW09sKBPjCPYRT0KQgSzwzNJAB2KZalhu9WTHURTpdDJYfC8SfQ1Kys9d+kjy
 PWiH9i5GdynRq42976DFu2gQOcP4DjEPwUjqwiyfKUWcCSMkCNxDEP9A7ZKz5ce3/09Y
 kIgyg/UvzUKc/P44//AUfkkxwyXReW3ZNU9K2MC3WyvB6ScnFzC2sXaz1feyyeLYiCO5
 7VsQ==
X-Gm-Message-State: AOJu0Yw0iuLDaH73c/l5N6/CqjFL6wRxnWfTAW1K7IUE4o5s0VD2Zjv7
 WyXzY5OwLo2anONd6W0ypIEwwTCyYyReJAe8HX7g3KeuoWLoy7ditrMyF0+HtuhvlailFejVofs
 T
X-Gm-Gg: ASbGncvMn5GtMrbxU2e72k0caTsd583g2OD+D7BBWJ72QXjisyk6OdhGjajd3kGNxLa
 IpfwXD3lodo2+F6I3Fpl2mwy2mvVMkvmdR1hy4Ne3c+hVETwYu0rdyI/Ki3FGjaDJH5cTlCB/lA
 Hw+tglLesjeaK4OZnLMlfrQ/wX4MnjlTth9LZdfSDbb7Ecfae2iYk3BRJ01inBOE5NGk0s2+TWU
 wtOkAx52bS8T6lM87t760wh9+In+KJW4GBeMa9nKiMHB8hFhMj1JdVTOuYeDElOeqsgkuSmFiNz
 GKEi2gCyAScoQxSsgdZmj/kPsGU94d+IrX/RMKXdHHWF2dY=
X-Received: by 2002:a05:6a00:22ce:b0:730:4c55:4fdf with SMTP id
 d2e1a72fcca58-7305d44c8bamr966427b3a.7.1738871847741; 
 Thu, 06 Feb 2025 11:57:27 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/61] target/arm: Implement SME2 ZERO ZT0
Date: Thu,  6 Feb 2025 11:56:29 -0800
Message-ID: <20250206195715.2150758-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9d5N8d7PDH8k

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h          |  1 +
 target/arm/tcg/translate-sme.c | 26 ++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      |  1 +
 3 files changed, 28 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 3244e0740d..c48d3b8587 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -80,6 +80,7 @@ typedef enum {
     SME_ET_Streaming,
     SME_ET_NotStreaming,
     SME_ET_InactiveZA,
+    SME_ET_InaccessibleZT0,
 } SMEExceptionType;
 
 #define ARM_EL_EC_LENGTH 6
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e8b3578174..37f4d341f0 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -27,6 +27,19 @@
 
 #include "decode-sme.c.inc"
 
+static bool sme2_zt0_enabled_check(DisasContext *s)
+{
+    if (!sme_za_enabled_check(s)) {
+        return false;
+    }
+    if (s->zt0_excp_el) {
+        gen_exception_insn_el(s, 0, EXCP_UDEF,
+                              syn_smetrap(SME_ET_InaccessibleZT0, false),
+                              s->zt0_excp_el);
+        return false;
+    }
+    return true;
+}
 
 /*
  * Resolve tile.size[index] to a host pointer, where tile and index
@@ -130,6 +143,19 @@ static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
     return true;
 }
 
+static bool trans_ZERO_zt0(DisasContext *s, arg_ZERO_zt0 *a)
+{
+    if (!dc_isar_feature(aa64_sme2, s)) {
+        return false;
+    }
+    if (sme2_zt0_enabled_check(s)) {
+        tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUARMState, za_state.zt0),
+                             sizeof_field(CPUARMState, za_state.zt0),
+                             sizeof_field(CPUARMState, za_state.zt0), 0);
+    }
+    return true;
+}
+
 static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
 {
     static gen_helper_gvec_4 * const h_fns[5] = {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 628804e37a..dd1f983941 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -22,6 +22,7 @@
 ### SME Misc
 
 ZERO            11000000 00 001 00000000000 imm:8
+ZERO_zt0        11000000 01 001 00000000000 00000001
 
 ### SME Move into/from Array
 
-- 
2.43.0

