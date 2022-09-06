Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2864301ejh;
        Tue, 6 Sep 2022 03:33:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SMPjfdIpaUVVm4/LN801W4pI9wAM7jyaHtgljs2sEovZJu3hAyedmDKMVom9QqdWScpTC
X-Received: by 2002:ac8:598e:0:b0:343:246:a162 with SMTP id e14-20020ac8598e000000b003430246a162mr43962829qte.232.1662460380993;
        Tue, 06 Sep 2022 03:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662460380; cv=none;
        d=google.com; s=arc-20160816;
        b=SB986FTKNvZVmr7vTKJctTRDnF8uxER0uqDMTc2qnQrsV9mbQK3dm6jUXH19o3F4wG
         XjtNqZfC4rfFzWqUNvbgkQsHqvVKWLFTEVk7rGen85qq7/U5oHpLlUpVhMVSpYq7PNEB
         LEuU5vmO9c0vBPTuUNgUFMwQpcSJ/qkWbuC/op/TD0RQZkZulZGzYu/EbzE+OfOE9Kul
         d+KsQA8xs+WmhJEisP3h7/h+ZdPDNASNHQAw+Qxz3n1lque1UY/IcU3+2iYIxXry0gae
         AegqgvgJFs6YybKoXrUiLkBVY9CIcX8QHnfBiwy6kqDdzMISbhwFMi7F9Se8MwGjqSwo
         A1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
        b=LXo+VEYFscfZ8t0RhvZ/xP1FTePSZIXorz9vUUmy5u/O3ATEUQEFLonuG2y5c5wJgO
         Tixb+IpkvLGytm/K1qdVYFilFSANsyQLxdBFGZ48/M11sRwbdMeYAU3gt1b/Kix1sB5M
         n72hRpKEhpV5mxA1dozjpXjF7lF5Dwri74RDK+ifCR7u++qOLzucQMhnHIrPXN4FFN4P
         HYAFk9unVqCixUz5NE/nYEfwbI7UqVh4vWCgXltPu/cd3JDRvsY/k6BWLbp3nt7O50RX
         l/RSUb6QBJm3RrnldF/iMNjj6MpU/hsCmPnBB5zfstxR067GEShCd/DENZtbtk+S+LH2
         /aIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8xUqjBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020a05620a294500b006bc5e44e823si7902943qkp.275.2022.09.06.03.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t8xUqjBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVt3-0001Di-H7
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSm-00048r-Kg
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-000334-01
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bq9so1737892wrb.4
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=t8xUqjBGgFiGNQVZj1/oJMcXTWhsbcc+ZpdZsiQI9coKXNvPHSsdC3HSvyzickOQ9I
 M9tnCeReqBlPmdVjpVkiFguK2JOUbjOLiK9Z+9yZxIBjaRJEPNvuocLKB+J8j+89ryzi
 ggPA8AHtnUSo/sywatTo3FOpp2MROC6u0/gVBwktQjTPRbhJHikRfS8w5apcoKs0zTdO
 ERD4eRFgecqOx4noaKWtdPyCAlIqGc0jleNzn9go8CAU75hUuSVDQQwOL3+hgkgZJj85
 KtH1eTJ/75UxS51AYI88Gq/Y5UVJyhyzXDBY/Q9w1l3R5opXC0BMhsS5cyBDQu4Uo4Zm
 HfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=h3bBk3kuJMykpv8Zn/41N/Z9EhrijgqLMzJNnoxIKpddIIYJaOpX7kWe0GxOWmPOjI
 3Y84Vygv6e5zYFCSsrkL8Zzuve7TxHbY+gacI0qs/xQlYPhVnzKGBXN7ETRsZHAoyONj
 7KxOWitIfANE8VHkA6GBI0Zqqi+62Py6beWhgiAp0keQD7x68whReJgUyuT8rqiI+VF/
 /uP/IzZg2okLkkz7Lyvot7r4zaFYo721iY7GM2MDu+zaX0KDJ1XLROgpf3yrOKFF+mK1
 NbI6mAyTgRGHqk+LQP5+qbZhNWUifuatuRBtfoiJa7rpl+av1NCZ9KsFdDmvALiOtCRn
 zhRg==
X-Gm-Message-State: ACgBeo3ITsxVaUH1F8WoUqfSjcw6vQSiOX3Yrx9UhnvTg65oX7ocNvvL
 rQWG5/C3koVVyNsoSLq/vb52lXPH06FEZHRe
X-Received: by 2002:a5d:6b8a:0:b0:228:d6f5:f83a with SMTP id
 n10-20020a5d6b8a000000b00228d6f5f83amr1697451wrx.381.1662458731680; 
 Tue, 06 Sep 2022 03:05:31 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 1/9] target/arm: Introduce curr_insn_len
Date: Tue,  6 Sep 2022 11:05:20 +0100
Message-Id: <20220906100528.343244-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C4nBYNq/BI21

A simple helper to retrieve the length of the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9474e4b44b..638a051281 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6660,7 +6660,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9825,8 +9825,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1

