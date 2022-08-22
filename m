Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1042660ejc;
        Mon, 22 Aug 2022 10:29:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4EsIwxu/rumTgHipAC5iYXtmIdZ5J8+ihN4L2LmAIAdlmZOVP7+qi0xY0pOFOGoceUdnJz
X-Received: by 2002:a05:620a:450f:b0:6bb:a982:de82 with SMTP id t15-20020a05620a450f00b006bba982de82mr13431552qkp.352.1661189366752;
        Mon, 22 Aug 2022 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661189366; cv=none;
        d=google.com; s=arc-20160816;
        b=fpcGOAlbVKvWx2tyf9OhcXIiX1u4kot8v5vOU+PtSnq2tmPSM5qU/1PIlX7tCF/2Mm
         RF6mHk1mKzt6K8ClDXMGZVp4rNSV4YzZW6ERjAMaRz5yYm+ViK3dMwAxND+cpVWUTiJq
         z4dcwztY2t4n1j3DNW/nsUICc7Gwu4ZDlmXMGv2+FdZBq7YhkJIhTmdADx0dCYN8lbDt
         MjNCXE7qkxQ3NojISVWlXLA+LKjeC2qWvfmrohREkCyYcttl1V3f79gij40Z5keSfsOx
         Ac16I4Md1HIIktifGTaGxXXnqEeGdR4ykmn7bBlJayaMudZ+lfMF3/wGyEQNLyYzVCxM
         yuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=717fzziULIfrv0GZaFcKnjtRk3XAFj/8qM7MoF3/+do=;
        b=JpJVhzmlkU9f5kY49SVp3/tAkPSDsulmGTWeZB0Jp7hheu/7N6dtcOBk3tm5OFE7S3
         cXagKdI/qA2OHCyR59gS322RDQ/FleMzG5+V9DOFA83CAi0KQvd7IU/N7siDpghgNd0k
         mbKBCm3osxZzWY3ujO5JkAvNByaO+xBDCssOVfUm53cT7a8HN+L1iTxipOAsX0TVaZ/c
         glMjdvoGzrHwGJeTkL46ei4OCcb/T9Vs4XEuInNAryeHkb0sIlIh+5heAp8H/voXgJFe
         nMhCM9+12hoveymW8V/p+H9emAHJCjasjI7vnUFZJnDA3LoOhZq0QNfhhLvfLdKz4lH6
         kdkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="omKxley/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ac87eef000000b003435dc57ba1si4271280qtc.453.2022.08.22.10.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="omKxley/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQBEs-0001a1-6V
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P7-0004rg-RL
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:53 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0001i9-6S
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e19so10147034pju.1
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=717fzziULIfrv0GZaFcKnjtRk3XAFj/8qM7MoF3/+do=;
 b=omKxley/3yr+rIUu3wY3+x6pT4C8/r5M8W9+CWcEKcyyHXLzXQ/sldfdbDwZNMIK0w
 21GK5i3RpQAoIsW48nVITOfAV8KvybMdcEGAeQ2GBQwjcGA40AzYISbGZH0DAHuqzjKQ
 VrgPM6e/p+Q/5liy6TalDUYfR6x/0lbK3bC2eNP/8mmdClT3CN54PWbxrFIXxtsIMhF+
 IjmoDmnC20FKc7pC0LzGTzbFMgqMhHkXQee5tNcEgXBNkKDw1BkySmX16hdgYQXCLfQA
 PaMT7iDNqsZK7439Diu8NBAa6KUISJPiHjsUipvMABPh9B5JrmcwfaDpEze87FXwaYtf
 aqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=717fzziULIfrv0GZaFcKnjtRk3XAFj/8qM7MoF3/+do=;
 b=VyBmEaqSgALj9om2W8/QlY5w5g+PMhkTG6lAU0S2es8hHlXB8xXRASFTv9lTw5rXJh
 xg6mCYwTKwL9ncYVL1xKOiLI8CccPzJ4XkRMhwQk0bN2jdNhtB0UuJ22bXfG1KKplwXK
 HGfAa62+6WYId+wawTogYrzs8Oxbw8mlcRX5qhi5U3qgCH5X123UgQo00GUGkmE+CuPQ
 I3CnZM7S5HwaSgtL3TT5SQhnQBZMUKvgVybM1jgRQ5BsbWMWAZYZNAtan1hWM4CfRPY1
 el5UamucE7fQw0Ucmn0UoIXU0Hbok8Cagtgeka+w11ZXh+YM1zZGPKrC5RJCTnR/U/zR
 WA7Q==
X-Gm-Message-State: ACgBeo1/EyjnuCeyHLinPxz+9i+MbL9St6KE6L0PYjL+8A6N8hIpi9iB
 nhIDu37W0hurF1UQo7NEX4+M/FxbQfE9Jg==
X-Received: by 2002:a17:90a:f88:b0:1fa:da0f:5e6 with SMTP id
 8-20020a17090a0f8800b001fada0f05e6mr20236534pjz.102.1661182298340; 
 Mon, 22 Aug 2022 08:31:38 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 65/66] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:27:40 -0700
Message-Id: <20220822152741.1617527-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l5Np3PYYX6rv

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 068ff2025a..c38c7d2a65 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1029,7 +1029,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     S1TranslateResult s1;
     uint64_t descriptor;
     bool nstable;
@@ -1291,7 +1290,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1299,7 +1298,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1352,7 +1350,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1

