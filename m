Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp634381lfi;
        Wed, 30 Jun 2021 11:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEM/Az7n7Oijt8BVMTNp9HMlYAxVdnDp/HA35utU1WkhbH8yI3eoan2cSG3b8xMS2ZVEdP
X-Received: by 2002:a25:a543:: with SMTP id h61mr49234562ybi.107.1625078221311;
        Wed, 30 Jun 2021 11:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625078221; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy6gsiEKRm1dn6wA9bFhSMZOaTg19RlbMjLOPCsIWaoeO6ppf1B+j7Dggg6akviDbF
         ZCXMnDudNl92Ze8ZmlEXdvs56HmqH36rDdLMuaQFUCuyhE8aCILpMVJ9cq4pdOvIl6cn
         ySFquz4xQSO0tIZ8XT8L1uvNegyfPz8mbEbT2pO6+kWWzafomNYsS+2TtpMKtoPo1N8I
         xTjOkNOHzkxs7MQW36lqTHINclOLHDjyc/dO6IqEM5qpTgiPs+PDorC7gJml/cVxwNzN
         xolpcSVVZuY15Nyl30ClS7EX/zziZw5JcJVO6N0RjRd8bwCm0wC7Zx4+KGyfD4UGGWDj
         LPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VwYP1FR59CBcY4SbMQQt/obAK3lfRhuxdMKBAeBeX6Y=;
        b=OI8YtRjiKP31aormPWT6m9WDyBtjzQk5KGKVQUfmds+b9+DzUjSfTbo/PniARIxSXD
         zbF1aXXHdnySRFwH2g5MHSHh8J4oJSLSCD5iw2KpkhLTYXQJZD+AgPgncsOsRXmc3+jh
         YlPsGBM1W30+uObcQWnUoANklA5Kag8rQUO9BHcbgAoXjBZXYTc5IEcAOo8+gmrpqbLh
         gOuH9AsERjQLiT1kMY7nTmNGKRj4Da6ozKGswZEeWDdg0OjZK+LhO1mpdshJu2BvfkJX
         kXiUObU71hmIHxrN5Cd3RXXTA7Js0QxWq22xn7uvhECUwx2rRHiYVe65Sg5cKq7urxom
         NRIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQGFsnUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si17907021ybe.95.2021.06.30.11.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jun 2021 11:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQGFsnUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyf52-0002wO-Mr
	for alex.bennee@linaro.org; Wed, 30 Jun 2021 14:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0o-0005D6-9h
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 14:32:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0i-0001zY-Rh
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 14:32:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id c5so3312319pfv.8
 for <qemu-arm@nongnu.org>; Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwYP1FR59CBcY4SbMQQt/obAK3lfRhuxdMKBAeBeX6Y=;
 b=IQGFsnUezhZRccJzGFEYPeseANzTao5sqQZMZMtSRL/Qg+rcwtyOxcS3yNXAMG81Kc
 /ZSOasmj3d7h3DVxO3piWO/DuSnjXT9nJhMId92Gd6MM3fvHXjrU7cfit9QdjZ2Jb3Ju
 NOixqpmhIq6ELWkpWBCBkqy7wMCLla4vssrpdIE/s7zFd/YYeobDxBdODENY77iUi9FL
 bHDNw1E7oilsagI/y83GG612HQcPSM58HZZb79huE69SCPaiWJRIfJ6kYyUBLAV6IEGk
 4lApAil34P82PpiycU+99nnYqpSsClXpDThI4Q2B5BTrxhAzjY/jR8CeDlHg92fwMx8j
 7S7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwYP1FR59CBcY4SbMQQt/obAK3lfRhuxdMKBAeBeX6Y=;
 b=WEyzu8oGBb5SrLhalYLR8Yb5bI1vrZKC6uMqgKV7j6cquQWwzTbEurr2Zd1vAAJjkG
 5BICHR0p4k5eGmvMcxI5gcqoGDh+Bie01risPHomwNyk7jr+UBov1/r1j9GeBM5pEvWZ
 sugvvcwHle/qILyquRHn5y/75jQFngTJ3G1idYORuDHDO5hOgLPWxBswiE4scXO08TNs
 sBFk97wrrctkTGSfcnpUoNDG2u+UdITHt25KRtl9ro1DmmD/vVyvKuSJcYFFVQMn7/Jj
 mTkUZZvtxoM+dp4y0OHGMY7BisRGHYjDLOBd1YanFzATQpgmWSEEYE4kFUanV9+vEGWi
 zhUg==
X-Gm-Message-State: AOAM532A6pBL3B4PZNLDd/udo7zVIvIMlA0kERw/xCW53ihTFluf8W55
 jq/1JaHS0AkpzSPH6KX0KPyNXncXMLY0JA==
X-Received: by 2002:a05:6a00:1496:b029:308:29bc:6d4d with SMTP id
 v22-20020a056a001496b029030829bc6d4dmr34939302pfu.14.1625077951532; 
 Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/28] target/arm: Use translator_use_goto_tb for aarch64
Date: Wed, 30 Jun 2021 11:32:04 -0700
Message-Id: <20210630183226.3290849-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xG512vKxlbb/

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block"),
and gdbstub singlestep is handled by the generic function.

Drop the unused 'n' argument to use_goto_tb.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1a40e49db7..eb1907d049 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -386,35 +386,20 @@ static void gen_step_complete_exception(DisasContext *s)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
+static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    /* No direct tb linking with singlestep (either QEMU's or the ARM
-     * debug architecture kind) or deterministic io
-     */
-    if (s->base.singlestep_enabled || s->ss_active ||
-        (tb_cflags(s->base.tb) & CF_LAST_IO)) {
+    if (s->ss_active) {
         return false;
     }
-
-#ifndef CONFIG_USER_ONLY
-    /* Only link tbs from inside the same guest page */
-    if ((s->base.tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
-        return false;
-    }
-#endif
-
-    return true;
+    return translator_use_goto_tb(&s->base, dest);
 }
 
 static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 {
-    const TranslationBlock *tb;
-
-    tb = s->base.tb;
-    if (use_goto_tb(s, n, dest)) {
+    if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
-        tcg_gen_exit_tb(tb, n);
+        tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         gen_a64_set_pc_im(dest);
-- 
2.25.1

