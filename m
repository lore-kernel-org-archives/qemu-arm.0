Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183614ejc;
        Mon, 10 Apr 2023 18:07:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350aAycmbJ4zTNdwJMBDVhuBmTJbhL/A99AwqU0h6Qi8gpSBRiXTQhO2iSMYPCGphrA3AZjv3
X-Received: by 2002:a05:622a:211:b0:3b8:6ae9:b10d with SMTP id b17-20020a05622a021100b003b86ae9b10dmr20098055qtx.2.1681175270815;
        Mon, 10 Apr 2023 18:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175270; cv=none;
        d=google.com; s=arc-20160816;
        b=gzwLKrSZAbuedC7ABZQ5n1lohbM2FvP7apd9Eak9QH1VXRwVjOHIEt5/J26cIkLcH+
         Jgab4OA+i6e0F5BbZwkojazXLHIcQtwO9X5qreSW2hgXxEd1DXFirOsyOqu5bDZpYlSq
         1NqDwdXjmsUmrXsfUvknhK8Pl8fEuj3Z1vz0LaYVXMjLnbPq9CsXfxotZlz3yjd3ZSMb
         IiVEZQCWCEgPOebh6DV+tOZw+S2OLhguKjqi2+DoB1Au6tuyLBT2D3zNWN5hNlTdZeVZ
         sjOLnvdc8K0sCAC/t7k1FOoJDcVTTMlsmUPAoSlttfrGwDw1FqQF1uiRkMEexv0I2yO5
         bhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wBraNCXMNPQDFnAbumlMKWK8ry0vOaeywT8gEg7w4f0=;
        b=QGY0z6qprnz8TKiPMeV+ZugwwoVVzoT0pAKRs8qITRmtxtDPEgfHrvzg1uVevkObz6
         9kNtmj/ycawyzC3lFJWFkJGmNoRE499ssTesxae+eOtOH95ef8oPkyGOUNEqC3yF7Aiz
         8zRODUfb4gKkXwwcHNK6PVe0ymrfMHCb7n5XfwoGJaQ9oA9oNB9CBik5M3S7vrkTn0u3
         C8yeq5Erj4W1FNHgdf49lXsEXyU3+a+9sVk7cjYCRZ5hPB6YXoP81EgREhgHveCHbHvM
         8sXaU/4IQtMi2mbFLTohfx5zE8KBVeA/+5sNlCSirmEIfHx8ioJWMbqgFtriZa7SbGBg
         1s1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N2ZG14QO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05622a134400b003de4de9a081si8109619qtk.584.2023.04.10.18.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N2ZG14QO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2TF-0006je-1h; Mon, 10 Apr 2023 21:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T5-0005xk-Jx
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:43 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T2-0000y7-F4
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id ke16so6198284plb.6
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBraNCXMNPQDFnAbumlMKWK8ry0vOaeywT8gEg7w4f0=;
 b=N2ZG14QOuOgwZHv+K/gORu7NCp/i5bGDwf86PQHiZ3wlddEopYRNVu4uwSailBLaiq
 WdTN3u9HjUFHuIkTgmQfSI4jx+jxjxK8TH2pLBA87+AYAgcG+IA1iogj/B5CzZW/oSRK
 LbXyM/MWgYrSaNqvZv1vXqyEyfJ4vhpQaA0rPWpBgMIhM0pN5ZneK4BE0DMkTyNq61x+
 iCcIMw76J+vcueqRbcaO0Ka5RIGtWY+/yj6uQA41VYJNt/IffTHtJ0DGkEcEJ2HlNBLo
 Cjo/LP///QGBSsjajwbPydalrzs+dqH5BSxlnlocBYE5sczO0U6juzIJFGcNiqgMkTDC
 eTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBraNCXMNPQDFnAbumlMKWK8ry0vOaeywT8gEg7w4f0=;
 b=7dPbpvO4lrchwWhfslwaPj7S5m5MAyvcc7NogNb5pqAcOdq4OUfj5/NkOT9/H6kJQr
 c/QfQjSONooZGMVB9tHPFVI5tnGl1YAYAL08RsGjl2LGZkboT2CkulhDtPEm+FhCSO3t
 rDV2AuYba2t4hNWiJKyxXcNidtIFqUvWfi3LBhG2oKZRJmw7IAQhIrTsPTTriLdZgDCS
 tCl+m1HL9dlK8OZ0xNRs+5Fzs0PG+v06chu4etMcyNYRNDAjKeqXPWKFHXdJ5+sChRP5
 xhQW/sAjGVB5adlTz7hR88KLqXHEbcJu5K2Ds79ayDJQlLzO3U9nfnf1MQj9Ws0gqDTb
 QbAA==
X-Gm-Message-State: AAQBX9dt2ZqV+9PaEdj/juq/G9uY0OOSw2lMamdMHwfN0WkUU1gnRGcv
 S2fgh6LgDh+HjApskPfP9x+OLg==
X-Received: by 2002:a05:6a20:6d09:b0:da:5084:2764 with SMTP id
 fv9-20020a056a206d0900b000da50842764mr11823300pzb.24.1681175199152; 
 Mon, 10 Apr 2023 18:06:39 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 30/54] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:48 -0700
Message-Id: <20230411010512.5375-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: Vs+o1Zxb6yHf

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f3e5e856d6..7e6466d3b6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1324,7 +1324,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1351,8 +1351,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
     tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_O2, is64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   memop & MO_SIZE, data);
+                   TCG_REG_O2, data_type, memop & MO_SIZE, data);
 
     func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
     tcg_debug_assert(func != NULL);
@@ -1637,16 +1636,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, a0, a1, a2, false);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, a0, a1, a2, true);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld32s_i64:
-- 
2.34.1

