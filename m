Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2657598ejm;
        Wed, 3 May 2023 00:19:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s58bXOHdXws8DHV3kwgaZaj06g6AUnaIf15dNo2qqEXiyk37TTNSQTHTnMki9ILVozhXM
X-Received: by 2002:ac8:5c89:0:b0:3ef:6432:ac3f with SMTP id r9-20020ac85c89000000b003ef6432ac3fmr28373949qta.34.1683098395629;
        Wed, 03 May 2023 00:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098395; cv=none;
        d=google.com; s=arc-20160816;
        b=SI0D4OT91wGyjFErSHgjzFcTwpjr/Ez19/KUfuIxg51T29pTQDI/0d/J1pDUJfjxuT
         AIOkIpHmsXLyhFeB1Fv6YLeep5J9iEy+gyHTWvg5URt4tyqStVhkZsq5TAkgYDcTgf/h
         A9D/XadkYjtsNAFY6/r3mCDSIdQIBNXANIWoqYAuKUAVMZgyv4JGB0aT0LKVIgClR5dI
         1CxwN7cciXV6xo370AXrfPFLtx+w/vjjC3FTXMVMVLa8Odgh0Lo0FicDqEcW3AsPucwB
         aKy/KV6HIjbVGIs9vdyS+IshdvcqgiHS6w6hQji/8nhN8266poVF4sghVbaEXjt0HUc+
         8GtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
        b=VrNp883sG5UxV1sgD7AdjBKaUVMCvKITLh5GnW3f+L9gB7+nmEIGhdFReoXnBFzckC
         wwr4FPOZLXB5HYZVK8k5eWTh9MS1RwpCPLhhEmKOyGbQv7OdMfGUsVKoNi7d4TH5OjMl
         HVsTF7nBAyg16i8z6Tpf0zOl2uDFsncmIryG06n/souEzlXyzcJQV1eXs3bGHNq3AF3r
         Rgfn3rvOH8S5Y1X+gFItHb8g/QVLBmI5XbWAneXnvc4nNXrEUYhrtoSiGsjB4S+8DPGg
         nNF1UoOuBi55eT3AzTn9KkyjMEJz3r+50WH2X+ltukIiKeD1dfNcOyKxTwDM9TuZyyjf
         xyog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5w3fu43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020ac85c0c000000b003ef686d4f10si14887476qti.795.2023.05.03.00.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5w3fu43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6b5-0000fS-Ht; Wed, 03 May 2023 03:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aQ-0006aL-SR
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a1-0005iQ-0s
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so46174575e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097631; x=1685689631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=d5w3fu43/7Y/xej5/yLGS9lqNFyES0yCbEZrxvHIvzXTvmZ2QDreN6B8/U7YQvyPfT
 D2xRNs5/JJjWUgA7IukBGjv2tyFUHX2gyTqNm5HtbxEFm0k4WDrMSMA3pO+fZZ+6DMzb
 GMDNFlOLfTJ+UrazNaKA+Uw4FcJK9GJa1tJnPa4MAzXV//tfxyXUvDqxzmOGKIL3hpv5
 qf4xt9GzqluXra+3KD2Kr752xoafJFVcZFl9dmi/kIMVI/vx/cpV8UAXXdCGacWf6CqJ
 j0Dcts6kz9npVtk3Xx3FnFNryel4T9Fqcn+42/5AB/1OKLSeUZ7Q9Nraaa+hm8Xg000u
 ky4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097631; x=1685689631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=QPR16ZqGJmKlLUJfqryRykDjqTeLwu7xmGvTIDWJJi83k7MxTofDbF3apjToWNBNGW
 BcWb2s5GQrA1PLhFHm93xk4zFADC3/nb22f27okkhJMh+QFzYODxvO6nKL/c3AB72OOe
 3d2U3V8hKA5pFaOWcF9L/eT2ycwK3qWspT2k8JvExpv83h6kaXnPPHzBeTHeCZFI/ujo
 56wDeUGuLlVQb8m/Qjpfo/7baa4jjFlM6oLBxpE5ojdqsQtmhDLatzDmcHa+mnKNaP4x
 qwI1PuNwhapkOHQDbk3pJzFlRynPUvZ95frGCs8Zz6pj0yF2uRExp79l57jZC9MpHqVb
 HBsQ==
X-Gm-Message-State: AC+VfDwwJO7G6fc4ozg0vtJ2eQRpRHI1P2xY5H31J47/BNO5MNSNOYOh
 nITDs6l30ReZV1uO0mhGR+S73w==
X-Received: by 2002:a7b:ce07:0:b0:3f3:fed1:5a45 with SMTP id
 m7-20020a7bce07000000b003f3fed15a45mr193544wmc.38.1683097631393; 
 Wed, 03 May 2023 00:07:11 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 18/57] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Wed,  3 May 2023 08:06:17 +0100
Message-Id: <20230503070656.1746170-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: r2HDzUh1gC2F

These features are present for Apple M1.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fc551a3d10..3adc5fd3a3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2903,6 +2906,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which
+     * should be 'int'.  So we shouln't see ENOMEM (val too small),
+     * or any of the other more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2910,6 +2934,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1

