Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2930859lfq;
        Mon, 11 Jan 2021 11:20:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwj+jW2YDLddpy25BFahCZZ4a18v5HvQJ/J6XKedJxtTR4+Iy1eyCXRY2OiV+D6HabY7gv0
X-Received: by 2002:a25:7452:: with SMTP id p79mr1700572ybc.23.1610392850398;
        Mon, 11 Jan 2021 11:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392850; cv=none;
        d=google.com; s=arc-20160816;
        b=v6S+oanB2YEaiVucUfJAJil/lebX8Ya9IhPCzn7wCFyHeWz9LEWbo8nK/Gylxf3fWo
         63pdM5P7aEJQhxgZqv5NvzN0yjVL0MDr5DVxVDiqvR0r4Om3CE7KNdPJ2kW9TzivuByw
         +OLtlq9cvhu4kTLuXSsrNMwqw5Hn7HPtS0wi4o/XiSO1qtkn07+/jqKkXxtUtO4OfyKM
         qs6xfGMyR1aN6KKRPMShQBXmQ4KtqX185Zl33g0kOXFQDJRZzXpgc1kI4C3/gxX3mvUQ
         1na2VYAePJh5n09YDIzCP0QFRXSaFZRe1Ox7VYRiyqQZ1EfxULNQLBK4Fpm7h1zrbfaM
         frPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
        b=DGkT2Pi5yk+R62tWvOvgx2fhEOomch0FRDu4bTdxz+ZKSSueh0O2ZYvID5gftj3JG0
         WzXL5+dorja7zA5u9OCgkSZW5Ijj/hIC1dmrA2OGV7MzUYng5ac3eEwDpBQFs21PRayT
         uakCEQeywarXn19WCN7Fr9oQd1V0MpUqPVJhMZciM6XB0/YGBpOBUOcYJD4mndXImUog
         ZjlanlFh3bWzveXFBtHk3p94b4sgaE5PCAdKSyOtvZdlyYb8FFwMIZn7Be3Z39jsANUZ
         CBPeoM4ntvmbokt5JJ45CTOrlYRQAvG97OOX3yBYgSZY2VXxJ/TzgBKsScCAyfy9a+q1
         3umA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Af/yt7aO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si586612ybo.105.2021.01.11.11.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Af/yt7aO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2kD-0004YC-OQ
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S0-0006Fr-9l
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:00 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ru-0006Tk-4E
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:59 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s15so328515plr.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=Af/yt7aOh80R0ljmOd1nmmSMt8RtMzJGPWVWjWDA6SV//mmQz2SgHJtIlHKSjMRe5Q
 4SCol3dGSSx0Nw6xt42JjEX3yCBv8D8yxD83MlYqNVfNF+nMY1x4/d9eoWfdcpIGpA+K
 Bfk5k0o8woMl+ysgkQivcHcTuzN0QUzEOGUn7t8r1VC1NMFXrCn5wJ4O/BF2NpHeo7nL
 uezUtSxA251o2WAnN3cvRhQ3y++PAQYP5BEGN+zrF5TEasjlxcNXXRCPWhufNRUs+w4m
 cVj9QfVO16zqYXiE35UjtRKQORiXNyubRL3y1mM0TmMRXNPf2cVMMBjO6ouyb40EJhiu
 kMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=DydGfmK7soPW5NhI8gkyuIZEwLXPTCKtllm99XaLeYLrqudo5O6G8cqbHBed1tZeJf
 b/jXNtobVpxmIH8MIkLXDGzEJGACkzxQS85HHX8950+ph3KW9sk8JFNdmphaWXuzzrlg
 AkX4WKTaa48z0qPuQCUeyuwuqz1oqANThO5gpOKe3c+ZFTIaA05WIvaaXuXrcOW+lPer
 wbn/Tkq36rXNtH0Mn1HpG1hUb0atZjDDyZkkRt1saejsQ2urL+h4I9X2QrRfiyPSblbN
 UpfPeaVo3UTaKixnVL492JuIZTET4kAEfv6BsvQU4sAEWeinGmTpkTBju3yRzzdPb9sw
 jRkQ==
X-Gm-Message-State: AOAM531PtY73Sya/+oCeWbAVpZhdsEKCDNYiadbpdkCZVkEjmb8VJKSV
 /1M9rwMzS/5WHi8ULfPBJk2YKNRRcJxQ9w==
X-Received: by 2002:a17:90b:3698:: with SMTP id
 mj24mr257716pjb.149.1610391711361; 
 Mon, 11 Jan 2021 11:01:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/30] target/arm: Enforce alignment for VLDR/VSTR
Date: Mon, 11 Jan 2021 09:01:03 -1000
Message-Id: <20210111190113.303726-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V6h9TLDZPEmh

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f50afb23e7..e20d9c7ba6 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1364,11 +1364,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1398,11 +1398,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1439,11 +1439,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1

