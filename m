Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp648316lfr;
        Fri, 16 Apr 2021 12:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY/2FajwFHmyUpVbS4TOu58U+fnXTZWqnvrVUm0hf1rsjF617dUXGI6UPwc6OjM5+ZGjTT
X-Received: by 2002:aca:90b:: with SMTP id 11mr7353156oij.77.1618599644965;
        Fri, 16 Apr 2021 12:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618599644; cv=none;
        d=google.com; s=arc-20160816;
        b=u7Ftlo27VC5KspNUf8nVdKwkCdTKvmI2mVvDdfLeDyQIWVXC6ks5OyiRuapdRxbF9R
         wnf7J5ythongC5/qBBPH0GRJrIy2oiOQIUxxMMi76gm1Z6LbVk5kssYofVwwDUtUlc9g
         Nla/LYwPLvnmb0qPk5mdzOPg4hGClsIIKjbb4Eri/VxOZXZrhEBlRCl37ICe2lfjGNi3
         Y42wtXmV9yhrB49ms2aRuPoPf9QAVH2qYhNJgOz6ZQvaD1jA9RjPS8wGs4RFf3iHufMc
         VhTZkDmNmCKQzxw4iwkEfP0MgmQRzP/VVAksb3/b9QrWN4q/8KWhDVj48ewfsSSoF11N
         OS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AAT589pnDxjsejZEwpNb+hvhHMZiaAtFUTqs+quVzLQ=;
        b=FoLCRDbzozIzCZAmNQ2/pMmWmg4pCfnU6rsuwmVALSEHhzbBKAk/Bp9YxMDOlEJxPx
         YoaHAMZz8PbLg96wLMPR5QwJ4xvIQsR5y97+NBdFob5Oulu/PSstt6bO7WHdtonh+Tqq
         YHvhXzmfAXSvQSyTUX0g62QXaEelBz6nB4i8VkXgau1py+SMgx75p0lhM62E6GRYiiHr
         87d5JxAiO5Ogvj3HrKkAP2hR/Uj6VJsBeS3Bp57/pBhzQ8wjK03Q4Sx76XVkj8QYKv+7
         jBoGbO6X1yjqfyxq6ejYuDc1Bi1DjQfGsIJKajvLs1xLeSJdi432WLWuf6/w3W5HaIh8
         Pt/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wV7ePzSd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si3972360oth.63.2021.04.16.12.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:00:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wV7ePzSd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXThr-0003Q2-Tu
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThJ-0003PB-0g
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThE-0004DF-1N
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:08 -0400
Received: by mail-pf1-x436.google.com with SMTP id h11so1297780pfn.0
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAT589pnDxjsejZEwpNb+hvhHMZiaAtFUTqs+quVzLQ=;
 b=wV7ePzSdvnHVQJmO4USWdwfZ9xtnaLJ46EirDvOQ+qx2EOuTiPuDTKWLrDvKXEK2XG
 v4RL8Z+OPeJGMFQOfS4uDYaoJIBytDabgsPZIlfj66uE0BsF3uginvJ9VPFj5YP9bu+o
 5bzUOe4pgOKAK+zryPLNGjSFTEUYZHxDXgPW6mRxjns/ZpYfSui8HTpS+Za5DygE5P6V
 Zn7Ig7/N/jqYX+Cp6qoeJAxW7nKZbAf3YaWU338d5GLF3W4MkAwqx6OHN5Ne6tpCn2ql
 Bw9218ipWDTBm1B1au9NEpyuVbx3C1+gVtjAtvSwEwEyQORtf+3xhdIgBc+WdBE7592b
 +/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAT589pnDxjsejZEwpNb+hvhHMZiaAtFUTqs+quVzLQ=;
 b=j0S2qdg98tQ9EmthGUTSVb2DwKfTIQMFSjF9bHIEfdli+oR26cDqNNpoPbkkidyZkN
 v9oFvF9KaaO9SI9toGYL/zy2UH6sIPPOKQAEftZ67guwZLfTO36n68CrXLODKHW9ggE4
 aa6XiVX0MBjAKb8F3MfDrrCiNpoRzNN/GhJc5BQr/+Mo+ZiO0o6/tRxE2TXG2u6bZSAy
 vyeEqomBTDwkOrZx5lGxFSROO/iSTU80tWrSd+EIlNNb9mgYbWxr6DIw71WzfAKunTVz
 SKqy8HssF22EMfMXA0uSvPFgn/DsLFXyA29bgnMe6aNTuDhdphDUShE767wxYPZ8W7Jo
 42cA==
X-Gm-Message-State: AOAM53390mlDavtOPERHu4Dg22B7V0xFzoCrrjGyPsXt0TBjpjRTa0pw
 otCzxygof6MdJLkaCG5HdzEyz52KRXTzWQ==
X-Received: by 2002:a65:4481:: with SMTP id l1mr494882pgq.42.1618599602664;
 Fri, 16 Apr 2021 12:00:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/30] target/arm: Rename TBFLAG_A32, SCTLR_B
Date: Fri, 16 Apr 2021 11:59:31 -0700
Message-Id: <20210416185959.1520974-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LNuvCFPfafpi

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So SCTLR_B -> SCTLR__B in the 3 uses, and document it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 +-
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7f..304e0a6af3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3423,7 +3423,7 @@ FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
 FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR_B, 15, 1)
+FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
 FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5..556b9d4f0a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13003,7 +13003,7 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
+        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b..9feb572792 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8879,7 +8879,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
         dc->debug_target_el =
             FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
+        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
-- 
2.25.1

