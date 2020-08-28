Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1694226lfc;
        Fri, 28 Aug 2020 11:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqsTsllVz7wE8r+cBKDQ/LtkJtdzr5Ex6WwoRmxmONnxpofQm4rCDXqWRMNlZScL+92uIw
X-Received: by 2002:a25:d0d6:: with SMTP id h205mr4172191ybg.259.1598640284733;
        Fri, 28 Aug 2020 11:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640284; cv=none;
        d=google.com; s=arc-20160816;
        b=hnUmBCkALvAiNtGHOs0vw97iQGMx5rPJB3o9arpgPkUbzONEeXUrQUcP7qh6ssG5Lu
         /YiooIrj0hZSxNTLEPU9ehWIUy1LStNhVm0kKdO0zODXUysgFMfCQ1PLZrDYw7nsyion
         1dqsmKsnECeOovg68wTFIV1Q2X/sJN7YTgXtIhXvdgIr/FSZ5IR1NIqEaPJ08mXEDUet
         JAtkM7xe+yXDaF4sEu0i62FLJtk+JsGocEtVelv/bor8rZb42i4b0kAAKDyxKEg9LooI
         hFhETN5UPJJOiDmJ6se/Q6lgLtTuIl3i9hQo8PF4KWCdc1yEldMDb53Sx4ET7Ht5e8ot
         KnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fO4bxaTwEV/w3CMo+SSdfW5rxADm6yGqbOxhWupxuUI=;
        b=fOxDTm4QpxnbVVrClW4IBK0+mTNhr6aYGlSZyXZjf/aQNk+3/BZ0d0md1mZYOGZZ9y
         RCsS6gB2ADWVXWoTA6wCQt8hSa8+p2f1VQ/2TdHkKgeovUOZrqLyIn+DtngF+mcnkqo6
         kmP57OxktXmdjp+Cdv/ngTmIPeVdKriDZ5LiqDkwYNKrgluBaI2v11oEpoaSx+1nMiie
         raWEwEBFQQAg6du378sPUz3aDqO+2eYKotCLzy/yQXWKU+es1FlHr2WJuUKfsMn+b+w5
         kU8Bk65RZLrp/RNqA0Bn+8DuC7LMGs+aCsj/mMKJwQsCTYo3eMhI2oIGl1TH4xQQApkv
         cGbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwKlMaUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124si85297yba.247.2020.08.28.11.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwKlMaUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjMi-0002A8-2j
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCm-0002gK-WA
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:29 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCh-00060g-TV
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id x7so70292wro.3
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fO4bxaTwEV/w3CMo+SSdfW5rxADm6yGqbOxhWupxuUI=;
 b=HwKlMaUikwZD9Z9ToLszsuD8jJbM0kk50AybXBAdnMOIH7nPlUSIZe12rLqtmJYcJm
 mBWdQ/F8SOwMXaVoeJAIRUMWSqo2IvLrKGmssQxOBjjXty5zfYx6aG85zi20ypXaa7Yi
 Y5JpvJ6zjXoevwtlPVFs1NBNO85gB4pujpjBQNrlYHDjG/fzmhG8IVyYiPT/VmodR3ID
 Z9xuIUMKxQDGUqZN+CXWCDceQLqvRrdn6ziwxEn9yuCt/B1Bre+aQ2TcB4AHy0pbHDor
 u6ai/Q5KG3dfcoeRreQ+Bp1iY+Yqe912IOgrkjz8OhBk85MZT+IOAdHHb2KySSP7T9ZA
 1Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fO4bxaTwEV/w3CMo+SSdfW5rxADm6yGqbOxhWupxuUI=;
 b=jmeCyALe7l/7v+MYlY+VnxOW426UEuiQn/lPjOeLGEzi+f3TVy1EtYSQkF2jJmquN8
 kiHT0+bu0aMKdiToOrksNxkX3QMy7oIpROKCKQcNGgOdhmAqDpbqS2C8NbEkl+1EtbXd
 vGKa8kl9syr9dmwg45+JDn2DTaXcCy/cmNiHPPvgdX/V0gvdLZa5jKi7vuYjW+/SVVJD
 inGCFOJO9gvw/h6CCkPNWBx8OJNCbL/IoTFvz7jCFcKWGUYjY5lqvlNasl+5gq6Mxi+B
 5OLOMZO0WrO7T+9+zDzKbwMFr/zVleIX1Ziela+xHEAbOKz37WLdDUeB1VA5hTJOGINW
 6V6A==
X-Gm-Message-State: AOAM5320iDzOkVGrYWO/7zIU4gBMQK+sFGToq4XapRRH9VprVDK5YE9W
 Cc/pEBVuw+mQao6//V0GQUAQZ37T59Glz0pw
X-Received: by 2002:a5d:420b:: with SMTP id n11mr259999wrq.11.1598639662059;
 Fri, 28 Aug 2020 11:34:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/45] target/arm: Implement VFP fp16 VMOV between gp and
 halfprec registers
Date: Fri, 28 Aug 2020 19:33:30 +0100
Message-Id: <20200828183354.27913-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KDSc0wYY/8dw

Implement the VFP fp16 variant of VMOV that transfers a 16-bit
value between a general purpose register and a VFP register.

Note that Rt == 15 is UNPREDICTABLE; since this insn is v8 and later
only we have no need to replicate the old "updates CPSR.NZCV"
behaviour that the singleprec version of this insn does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp.decode          |  1 +
 target/arm/translate-vfp.c.inc | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9a79e99f1b0..51f143b4a51 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -74,6 +74,7 @@ VDUP         ---- 1110 1 b:1 q:1 0 .... rt:4 1011 . 0 e:1 1 0000 \
              vn=%vn_dp
 
 VMSR_VMRS    ---- 1110 111 l:1 reg:4 rt:4 1010 0001 0000
+VMOV_half    ---- 1110 000 l:1 .... rt:4 1001 . 001 0000    vn=%vn_sp
 VMOV_single  ---- 1110 000 l:1 .... rt:4 1010 . 001 0000    vn=%vn_sp
 
 VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 ....   vm=%vm_sp
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 4b26156eccc..28e0dba5f14 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -809,6 +809,40 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     return true;
 }
 
+static bool trans_VMOV_half(DisasContext *s, arg_VMOV_single *a)
+{
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (a->rt == 15) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (a->l) {
+        /* VFP to general purpose register */
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vn);
+        tcg_gen_andi_i32(tmp, tmp, 0xffff);
+        store_reg(s, a->rt, tmp);
+    } else {
+        /* general purpose register to VFP */
+        tmp = load_reg(s, a->rt);
+        tcg_gen_andi_i32(tmp, tmp, 0xffff);
+        neon_store_reg32(tmp, a->vn);
+        tcg_temp_free_i32(tmp);
+    }
+
+    return true;
+}
+
 static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
 {
     TCGv_i32 tmp;
-- 
2.20.1

