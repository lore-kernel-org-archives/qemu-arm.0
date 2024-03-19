Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1383371ejb;
        Tue, 19 Mar 2024 08:45:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7ozkjKSgBP1nI8VtEmUEZcbjB4HguyW/po/wmSKZAMme8EeDdE7Dp/UlZ3itIHUQiQGJ5S/zhwNYY6aNKiaRk/AX19K/2
X-Google-Smtp-Source: AGHT+IE3fzrk5wC+bE/i0bLgJoDnykV7xYfh53JrOMnvXNAf0hzBpOuJDpWOIbQmlmbOkUnEbfQE
X-Received: by 2002:a05:620a:199f:b0:78a:17b3:eaa4 with SMTP id bm31-20020a05620a199f00b0078a17b3eaa4mr1711358qkb.60.1710863154428;
        Tue, 19 Mar 2024 08:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863154; cv=none;
        d=google.com; s=arc-20160816;
        b=ctkrqx2PvLVngoinZt7U0hT30fPUFAOY1DPb2w90vn3X6zWdrPIM7GtTr8HpPYZ5+q
         8xcCy3rL4cm2tWD4Z2gH4DjOM2VKD5ZOmHLPaJN1P8ETsFqLpSl6CmAZERkUx+/GOS9w
         xrgdaJGDU8tgfn4anjEORsgCBB6c1fhjL6qx8nxU7NA7cuIFmDR/BiUR1lE4Dh97+i/3
         Xi4z6OIB9WU3B43VgQeROeotRj5ptou04cbSZ8g+0qHy6f9KtBfZ3KHJ02/xKJIZPQZi
         ovRujE9WLHSDxPHIv23CCFX55JvuShwDQAfiW/dWHZbtoAa2hUw2YUbiKrSEV1hEmxDh
         bc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hwhHMygx0mLENqv0dOkZHirx9fre16Z9mIHYSdz8fsE=;
        fh=a5KqUYU04j3jfUpPQpZMcMonFUfR07pCBK8oEsx1OA8=;
        b=gp7IigIxA0QWD/F2NIho67pwsGBwKtDQeqTU0x17enbvXNNdUwZDgj2OYXDW1CSY2W
         bK48ry5fywahf6NgttP/Asba+fwYfblj4sauZNZNu5vZhjTATTFMM+hNXofKK3KjdKcM
         DqAACNe2wCAQSrgklOzdaox3yeQS9mvtWFA+gBObM1853/9DjyYhwOSDYDKPEOzuVPi4
         M3GHCzOeics+aeRk2rQZnTqgsBNEkAMiRgc10DBc9TUUHP8u9V+31YQXYHs0x/0tldwR
         t1bD8njY4EVkf7gj5FyriC6H2UiMvCbBL/BvdQOs2gyAPczL9mXU7mKOqb82TmvwntJC
         FeKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVbjAZg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a440300b0078a17ce3582si933139qkp.630.2024.03.19.08.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZVbjAZg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbeJ-0000sY-Ti; Tue, 19 Mar 2024 11:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbe9-0008N8-RW
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:01 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbe5-0005R6-Oh
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33edbc5932bso2162417f8f.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863096; x=1711467896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwhHMygx0mLENqv0dOkZHirx9fre16Z9mIHYSdz8fsE=;
 b=ZVbjAZg3IT4dLTFQEn9z+KNAMhyeL1YMm274oUPff629OaFDbtEqUAdXzB/O4ggtLq
 KkLzetDMwZIoqio5Y0qCvrfKziorPTkyLP1kjfpVRIR3qmxUGP4sp7hmIEAC+QSxfNKc
 B2BD1gfhPLRszkSseY/Ww5YGMBmrX+RKl4GLEuhi+QkNfBT2dIIiXvp750kzBYDyXDzv
 gSyjOeeo6nWK5aL7c1do6/612hsEtmisVSVsEaYP55/4HlMSS3YO/fdH9ZBuA2iWFpM0
 otZgzCTPAxWlxvE82dUhqD09ZbkWdlq8Hgqe1BNwyUWK2b2yPmUyJ89mNDlBgZ2JuCfi
 kbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863096; x=1711467896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwhHMygx0mLENqv0dOkZHirx9fre16Z9mIHYSdz8fsE=;
 b=X3mnKnJVzScC+KoqU+u2VwLyjqiNCbgFOhKjltVse6ejWqzKwhuKPc2eQq3ixjLGMx
 eRSxoi3qvmrQ+XG1VzV4H+X0umK3NvwmQX/NboGANFquF0CReeH7BjKvO06a0gtKQQeo
 vVxor0q/M/XF1I3Xp1fXsNMZVsa37F2Y5ptzYsXlZKZjgspEg4zaNtG8z+2zVTAPatZK
 NwX1dHkiCK4nDOMQf7J0nZsLJfblWh96FkWnd+iHtN0yWb2OTFSj4R3DHIdIWVq5uuiA
 JPvNG1r9z//o8DBOxS3LY3vJdHfPOjusz3sSS9rIo84j0AeGqpJPMFojzGo3vOo7rONK
 OuoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ8BikhAPEXqLB4jte4ECe5FuY8ynPcWIZ5CmqTcGsZI7nFtz8vicJhS7E4LpC+uGu8i2p0OTzi2rLCxxz/HkiIGUY
X-Gm-Message-State: AOJu0YxUsVjFnUGAzGPhVwl7GwXt0ZO6UruSxzSw7Zl1mgTMEGu/d5t6
 2PYx4KsGUM0pGOpqTiPuOdWKhy/DsQQlBA396eA00eGvxFW3N36h4cIkvnaFBXo=
X-Received: by 2002:adf:ed4f:0:b0:33d:c217:e8a4 with SMTP id
 u15-20020adfed4f000000b0033dc217e8a4mr11113184wro.14.1710863096299; 
 Tue, 19 Mar 2024 08:44:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 i18-20020adffc12000000b0033e786abf84sm12655011wrr.54.2024.03.19.08.44.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:44:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH-for-9.1 20/27] target/rx: Convert to TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:49 +0100
Message-ID: <20240319154258.71206-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8s5KXojmcjkk

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.h | 11 -----------
 target/rx/cpu.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 996f121bcd..dcda762212 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -149,17 +149,6 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
 #define RX_CPU_IRQ 0
 #define RX_CPU_FIR 1
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPURXState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
-    *flags = FIELD_DP32(*flags, PSW, U, env->psw_u);
-}
-
 static inline uint32_t rx_cpu_pack_psw(CPURXState *env)
 {
     uint32_t psw = 0;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index da673a595d..3b55b09e64 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -58,6 +58,15 @@ static void rx_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+static void rx_get_cpu_state(CPURXState *env, vaddr *pc,
+                             uint64_t *cs_base, uint32_t *flags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+    *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
+    *flags = FIELD_DP32(*flags, PSW, U, env->psw_u);
+}
+
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
@@ -187,6 +196,7 @@ static const TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
     .restore_state_to_opc = rx_restore_state_to_opc,
+    .get_cpu_state = rx_get_cpu_state,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0

