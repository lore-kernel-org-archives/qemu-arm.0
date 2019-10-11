Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp864264wrm;
        Fri, 11 Oct 2019 06:51:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypWShv+MzhNdHThUpdSzHdz29uiZs8o3bngsr7pGCQUs4DO31DGvZ8g1tebcjCv1auLm89
X-Received: by 2002:a17:906:7f04:: with SMTP id d4mr14219376ejr.178.1570801886335;
        Fri, 11 Oct 2019 06:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570801886; cv=none;
        d=google.com; s=arc-20160816;
        b=HS4+hYyz8sBD5rtRh4lETnc+wGAD89/kjTMIfWroTkXJz9YvDI4GYw9gaUjcI2zLNK
         /aM7lm/89pABYPTr8pBtLiP9HqrurptumkpSxVLoUU0ChooX+/qB04xkjfkFpwZjYlG9
         QpZBgxb3dPOc0Nx6/XLW5u332zdoeIJp85NkXLDECPGM0/lIIdW89lsIKwfi16ACKoue
         aT4NB5lxsr8F2r7SqZxXmEa+YYZ8++JN+iy537iOu7d1vNHqzqUCXjWRkYA1I5tu4+Xo
         X05+zyPcfBb1f3kBToNwvPfka+JV4Ki5V+0vaNC2XergmhFaF6a6NCfiGMhMAYVAZgSH
         pxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=o8+XY/UcseGCyRDxlQOhrRq4L82DVUKd4GlR/wFLdGQ=;
        b=Ouhj6asY6HFhD11Aen/bzQqFISXjsyfbjhjJ9XNiBg5F1rkTuEFKWlPlE1to4aRbrQ
         kuScr7XatPkpWyStSlRSpOG97D8IARiozhJi8VSCMoE7qW7B9ylZP7Cy9wId8oOgw4Mj
         aRPTyjI5CL3jpj2ivwJcldoh16Nge4HFhKrxMfQcjKxFCZuZ5IEiQKFpj9qZ119Tia08
         Vc5AyIPc2SRGO7kWCOHX1RVQpjiVKI5iGIVOpOmsPuMoksfLYXJgWWPasoDvVqvjb8zo
         oafAjIsTnQkI78QTuezz5S6E9wqtMtctR2eYAd5QgtPrarWcI0A3gZJAAi0+450WcpLy
         mN9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XxMkP3cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si5671027eda.285.2019.10.11.06.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:51:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XxMkP3cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvKG-0006ou-TN
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvIz-0005Qo-OM
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvIy-0003q1-Gb
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:05 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:46793)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvIy-0003pr-CA
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:04 -0400
Received: by mail-yw1-xc42.google.com with SMTP id l64so3371948ywe.13
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o8+XY/UcseGCyRDxlQOhrRq4L82DVUKd4GlR/wFLdGQ=;
 b=XxMkP3cuC45PymTfi2IKBDZt8J4WXEa/gzYz/z/Au1ZuaM/U+Wh2+/Z6pXS41OU/Bu
 yWa539MQMIWZrGmU10sEDGYBRQ1KQ8l/vADphQ+MWVVeeEh0CJaUngIckbrX0HkJLI+p
 0VhWb5Puue2V10/LNoEfVIjOhgIe38THpT51yu0iUH+saSuLZJsNT9hHC5AThQZP4sL8
 Y8BNI5sPGcXAiFy2pQsjOrHoQAajSpaGoRYnJodvF2mIVval+f1rvyDfy7xZqStgE9/Q
 4O5GzKPSepeAPP/MxobLIKi5vnAfLdSgOyM/tGQOFOVXiVt8ustM9ZHEfg9rMFwihxi4
 Q/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o8+XY/UcseGCyRDxlQOhrRq4L82DVUKd4GlR/wFLdGQ=;
 b=Ak7nAoicwpqfMFJRn86ymTipsKMHu5Oh5dIdTlGpaURvGLxINyER7CW/LLb5drlP8y
 hTvnO/v2ZmiqZhB6I/qKwvrPZDMoNEGtwz3GRaAeG2wVilZN/o9WF12oNjqrgTH8eiBk
 PlzJQHHG9om3O/C/uyP9yIS8+bcGeI9bx3Wn/mAjNEZ4ck1nuRpniRi/JElD/6sd0j7o
 hEnZgq9/MiIEzOTzL4/Wx+gwrnsnRt4xFWq7nMYrUMEuaqgYY+gyZJLmqs3dDFZN+5HM
 A9AX1cJL+gF/ep4sgco7TyvXDVsAsjGrqaoEUA4ebHiy3O/H5lggZ2D/i1fabVEjlkUV
 n6xg==
X-Gm-Message-State: APjAAAUsolDvXuYjwAj+upuZMhfAcvkmRfraDL0eElYBUwxkh8cfVjaJ
 J22sv+dP+TjTMCcy1x1PumdJ0bRrjGk=
X-Received: by 2002:a81:c8c:: with SMTP id 134mr2583852ywm.205.1570801803665; 
 Fri, 11 Oct 2019 06:50:03 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/22] target/arm: Implement the GMI instruction
Date: Fri, 11 Oct 2019 09:47:30 -0400
Message-Id: <20191011134744.2477-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDeYkyCE/zmM

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    | 1 +
 target/arm/mte_helper.c    | 6 ++++++
 target/arm/translate-a64.c | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 268c114b79..31f848ca03 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -109,3 +109,4 @@ DEF_HELPER_FLAGS_3(mte_check3, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
 DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
+DEF_HELPER_FLAGS_2(gmi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c3edc51bba..251dfff1e1 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -254,3 +254,9 @@ uint64_t HELPER(subg)(CPUARMState *env, uint64_t ptr,
 
     return address_with_allocation_tag(ptr - offset, rtag);
 }
+
+uint64_t HELPER(gmi)(uint64_t ptr, uint64_t mask)
+{
+    int tag = allocation_tag_from_addr(ptr);
+    return mask | (1ULL << tag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 26aee0c1c9..4184d65d97 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5188,6 +5188,12 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
                        cpu_reg_sp(s, rn), cpu_reg(s, rm));
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        gen_helper_gmi(cpu_reg(s, rd), cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.17.1

