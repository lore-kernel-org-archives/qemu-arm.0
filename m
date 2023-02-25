Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2636079ejc;
        Sat, 25 Feb 2023 01:18:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9NsjeB3mBtaSNs1RxaNxVPyB5JlBNrVF6rXb0UBwlXf8ard/KUwfK69T31hEL3D9CKCemr
X-Received: by 2002:a05:622a:4a:b0:3bf:c6ec:e97b with SMTP id y10-20020a05622a004a00b003bfc6ece97bmr1888447qtw.38.1677316712053;
        Sat, 25 Feb 2023 01:18:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316712; cv=none;
        d=google.com; s=arc-20160816;
        b=ciV816qtkrXqMRdg/X3Q4DlrraOtVPq7fHYAOzgfXZzqdQ2Vwb+Qjl5w2uamLxlc/3
         naejjfWTOTmDynEtWzo5utqUdEsaF0S8gysADVmvrjayjLDsXsCsY18IFcM7loM3nY59
         VudLEOzp/RriAhLbD2cKCrpDIhJNIu0FOLyLXVDXy6lBmnF5IMdTJTl+BI914B5Jum5E
         DP1cu+MCH+d6zM975ql3AQXMmB5g8jk4QMjZ7TBxi/xzq/jjvbAs1wHzIqQkDBGSp2be
         lyUeVAcgGYhk6wO9mW9gHMHsC5E38NWeWsw1Q6wgHs0ROJVw2CXhRq937+CfQYSsjss8
         9k3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=71aFye+WP3h6iEWEabrVi+cTpkdhpONrYK9bA8dUw1w=;
        b=N82Bum/3C4/elt1CW1RQs4MXt7QYP/kWDQAs9kXa6MUyScQUk6FGkl/J9jz0Abqy5W
         QTWdoQzmBcGtAYKFmJSuY03B7/D7ChoQB/edkpghZMparWgCpFE3CHtVK4CaPVPbtiFH
         956xC3B4Tnzj/lOUtpLXX4po5WzBclRoNxmvxZBCrSfK0xNK21aWq/6beO9wpV0oJcfB
         nVbJ3FDDamyX1gsRbck0rQnxtJCq4PN3HlFalKI4suEXvAI9v35HErOG8k9w7K1oXXh8
         xdPIeIKTBqnFlS9DcqPG5mC3dY93g6DmdA97cW5HZLPt1rOsY76PLdrPM1pgX5bgtekM
         g35A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vws1r4HR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020a05620a2a0400b007427f7717eesi1658357qkp.161.2023.02.25.01.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:18:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vws1r4HR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqew-0006pL-G2; Sat, 25 Feb 2023 04:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqef-00064i-AK
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:46 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeb-0002Ap-My
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:44 -0500
Received: by mail-pl1-x641.google.com with SMTP id ky4so1899411plb.3
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71aFye+WP3h6iEWEabrVi+cTpkdhpONrYK9bA8dUw1w=;
 b=vws1r4HRhdBDY/IWpq0PK8yg3MjqyaUzmFMEl29WgnWbKK+Jonw+0CAGKBhRMPT/V5
 es7lC+yDaxrspzBeh0zex4W7t9O2XcC2L12V3osWZ24ifXrcIF2CYFNsg/zW9WXyQcAj
 9zRqyEaHk4qNRChlqjkRheAdNAFOEYCb6r1H8aWnc61AWLYCMijOPFqJm6OlBde6022c
 9eyhHrQClyMCs+hlIunge0toD5+Kd8Qd9H4U6tBJC9/Rov0FVx0JvcsjORWe/kqFgG+x
 8xtEBndA1uri+5Xk5zinldgb1z4WG58uD4jvvLW6mD+X+u3sXRhxofLcLxhqsCIeIoZL
 nAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71aFye+WP3h6iEWEabrVi+cTpkdhpONrYK9bA8dUw1w=;
 b=SDG+frKXBUWvEMfv9HGS7A3v2dDtP0Op1Jrr+A2hRDK/EBxwiOoyKmF6K0E+Wfh2b6
 wtcFC/Z0ihH4UalEXXh8oCPWCUzuV2GupyJsWNgx0IsH5qnsUeFm+5m1lTut3KqGxiOa
 /7dRlAiFa5LSIoWRtbJCF7KfmmnR+fs+QvOky/LYubGE6QFXxHYh2+4v5HjXAFQYfON/
 WqaBxrBqz9FRQtaOMk3PZ91H9IIBjqM6QTqUWcAdBbBEyuR0CBZd6wxhjsNBJTLWBiun
 PQW/1qO69Jsvy7jKq5T9aJiGcTevLPwWqMKZiAGqMfQseil1/0806A7qE09gCpCruN6s
 RvbQ==
X-Gm-Message-State: AO0yUKUQnjfafQxFXq2jPGDkpvjywgxILJtvToOoguXrKj2hzxRtpjF2
 tDu66Ass+zlzaiL2fRB4DfyYpQ==
X-Received: by 2002:a17:903:5d0:b0:19c:d5f9:337f with SMTP id
 kf16-20020a17090305d000b0019cd5f9337fmr3882237plb.5.1677316540398; 
 Sat, 25 Feb 2023 01:15:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 26/76] target/cris: Drop tcg_temp_free from gen_tcg_funcs.py
Date: Fri, 24 Feb 2023 23:13:37 -1000
Message-Id: <20230225091427.1817156-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qBRtn2OlnexY

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
 1 file changed, 1 insertion(+), 78 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index dfc90712fb..02cb52c21e 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -26,10 +26,7 @@
 ## Helpers for gen_tcg_func
 ##
 def gen_decl_ea_tcg(f, tag):
-    f.write("    TCGv EA = tcg_temp_new();\n")
-
-def gen_free_ea_tcg(f):
-    f.write("    tcg_temp_free(EA);\n")
+    f.write("    TCGv EA G_GNUC_UNUSED = tcg_temp_new();\n")
 
 def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
@@ -269,73 +266,6 @@ def genptr_decl_imm(f,immlett):
     f.write("    int %s = insn->immed[%d];\n" % \
         (hex_common.imm_name(immlett), i))
 
-def genptr_free(f, tag, regtype, regid, regno):
-    if (regtype == "R"):
-        if (regid in {"dd", "ss", "tt", "xx", "yy"}):
-            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
-        elif (regid in {"d", "e", "x", "y"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        elif (regid not in {"s", "t", "u", "v"}):
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "P"):
-        if (regid in {"d", "e", "x"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        elif (regid not in {"s", "t", "u", "v"}):
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "C"):
-        if (regid in {"dd", "ss"}):
-            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
-        elif (regid in {"d", "s"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        else:
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "M"):
-        if (regid != "u"):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "V"):
-        if (regid in {"dd", "uu", "vv", "xx", \
-                      "d", "s", "u", "v", "w", "x", "y"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_temp_free_ptr(%s%sV);\n" % \
-                    (regtype, regid))
-        else:
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid in {"d", "e", "s", "t", "u", "v", "x"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_temp_free_ptr(%s%sV);\n" % \
-                    (regtype, regid))
-        else:
-            print("Bad register parse: ", regtype, regid)
-    else:
-        print("Bad register parse: ", regtype, regid)
-
-def genptr_free_new(f, tag, regtype, regid, regno):
-    if (regtype == "N"):
-        if (regid not in {"s", "t"}):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid not in {"t", "u", "v"}):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "O"):
-        if (regid != "s"):
-            print("Bad register parse: ", regtype, regid)
-    else:
-        print("Bad register parse: ", regtype, regid)
-
-def genptr_free_opn(f,regtype,regid,i,tag):
-    if (hex_common.is_pair(regid)):
-        genptr_free(f, tag, regtype, regid, i)
-    elif (hex_common.is_single(regid)):
-        if hex_common.is_old_val(regtype, regid, tag):
-            genptr_free(f, tag, regtype, regid, i)
-        elif hex_common.is_new_val(regtype, regid, tag):
-            genptr_free_new(f, tag, regtype, regid, i)
-        else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
-    else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
-
 def genptr_src_read(f, tag, regtype, regid):
     if (regtype == "R"):
         if (regid in {"ss", "tt", "xx", "yy"}):
@@ -578,7 +508,6 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
 ##           <GEN>
 ##           gen_log_reg_write(RdN, RdV);
 ##           ctx_log_reg_write(ctx, RdN);
-##           tcg_temp_free(RdV);
 ##       }
 ##
 ##       where <GEN> depends on hex_common.skip_qemu_helper(tag)
@@ -692,12 +621,6 @@ def gen_tcg_func(f, tag, regs, imms):
         if (hex_common.is_written(regid)):
             genptr_dst_write_opn(f,regtype, regid, tag)
 
-    ## Free all the operands (regs and immediates)
-    if hex_common.need_ea(tag): gen_free_ea_tcg(f)
-    for regtype,regid,toss,numregs in regs:
-        genptr_free_opn(f,regtype,regid,i,tag)
-        i += 1
-
     f.write("}\n\n")
 
 def gen_def_tcg_func(f, tag, tagregs, tagimms):
-- 
2.34.1

