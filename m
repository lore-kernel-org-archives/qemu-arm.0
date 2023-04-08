Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650300ejb;
        Fri, 7 Apr 2023 19:48:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350YwygqYA71stAkNE80tB1DTlEr/0IEsYTDu8WxpTdnr25SIBHODNvqGAcJUKFrTUT/NXq9K
X-Received: by 2002:a05:6214:2627:b0:5e2:1381:6106 with SMTP id gv7-20020a056214262700b005e213816106mr8571939qvb.15.1680922105024;
        Fri, 07 Apr 2023 19:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922105; cv=none;
        d=google.com; s=arc-20160816;
        b=o9d6JerulotWpHdatohbbK3S22AqRa230hS+zWfi6g06ngOPjKC2SyO1VPTxA/teqO
         Wl04hSwqKBxitDPNIsYjxwF4NdhlsrJNdh08PlswhEOTs+W/7436n2CfgvAbbTfloUUC
         XyIOO9V/R6AG01XLAHGzDblX4hUj27xWtIRd8MiOg9vN3Iigy2GAj4NFZkBjF/wc26PU
         GuYp0SjtYUco+W21W6DWjA9vjXFvN6EuENugfsNXxGBOWyrsfv3Y+Oz8wHbkGdxmaQwA
         t+WmXXrM78d1OvZ8i52rko4ZutKJD9wgrR0RDTvyPh1Fo4TUZEDWe9DPL159RtOpQUSA
         Krnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eotj0MrHKLP1v2S4T/0WUNCjwFrcd26O8tCK+46bnIc=;
        b=DjN3ALqeuLhLvvM0LEMF8YonZ6XhyA8WdGd8miNED+d5jEAzkMLcu04+XUylwAOhQp
         ITWoLt0p4VQYAx81oTO1gYlYP67WnCD1GrtbKkWbLV1FUdpZ4HhnreIW0ixO9sUv/TGj
         zp3dqFLaRg/d73CqCBHv4bf6K7hgw00zXqD1vJf0CWV4kkLQGpSRbyP/iiht1ScBJLpV
         4XMPAkAzvD6jwp9Sx4J5hYMwCLcfGOanr//BY9u6d7FWM3lsRjGvErB+6DjBxdU8Qy35
         fWdMvsfBPw0Daecha7NAxtaM8Ly8FCGClDiaQVk/FEQyrkvYFPRzL+RMdmX/w43dR9w2
         yvCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uojDrGl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a0562140d6600b0056ea3d10d19si3985819qvs.396.2023.04.07.19.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uojDrGl3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYd-0007mQ-BG; Fri, 07 Apr 2023 22:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYb-0007jf-IG
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYC-0005WY-Ql
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id w11so235733pjh.5
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eotj0MrHKLP1v2S4T/0WUNCjwFrcd26O8tCK+46bnIc=;
 b=uojDrGl3eBNqzY5LM9a1aMvyIB1I/hWsByM81JC12eAyd5BoqzrCT5BChoHq7dcm0Y
 uCx6eIiIvNrMi+8kRfadXvogKYZE4luZi9tEhRCt/wAkO435ld0GTwT2EBTHYwIoHmn+
 1hisCidySMHAdRwmjRkdUrz3U3lA3+rx8qlM+Nd2EJFSTBwQ+9mnAHZYUxNJDy5qzVv2
 xXQkGXFeSYVB6z+czETKxlozaWXxs6rsWjWxOfOeD/iWE//tNbZaPNOkKkyl0ZLk//s+
 amg8AEQ6WhtpGGybh5e245WB9UUZiVDo2AzxsDLmNyHxS/+Qp+se6w4TorJ2ZDrvoWS9
 Tymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eotj0MrHKLP1v2S4T/0WUNCjwFrcd26O8tCK+46bnIc=;
 b=rWi/zqsf7UDO/Mb/FYjNb0Q7AoUav+ROT0DlxxcQTHJor3LXmiHCfgyjsNYu/Xpn+6
 h73efdGed3cB6/3Jbg+726ZdBJwgyWTTl33CZRbT7NJktmEG/6tPYw/yRqrrrReku2sE
 uw9ctNtJ86LTsazXtT9N9tkHipkNiX8Nl0PtH61dc3zEJm9DFI/vXipjvTrS0Ix7t+h9
 wu0/+b4jAk4mubN5KSYOyGIlW6ghYbHi0HB2Th0w/VY1FHXDmek6dkV6Z50DOYqaC99J
 1LaerMi6coZDbUuf08goLy1fmfQSeE2RL0KCFh1/7ftdQJrV0p858eiYVAK6y1I/dw2L
 3ajQ==
X-Gm-Message-State: AAQBX9c4a5x1XTulmhwWCn1JMH6j8qxySlgosq6ggT5fYASy9tj5AHrO
 cPojw4xHDTfX97ZuNkYpfrslDw==
X-Received: by 2002:a17:902:f291:b0:19c:d7a9:8be1 with SMTP id
 k17-20020a170902f29100b0019cd7a98be1mr3829634plc.61.1680921815975; 
 Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 22/42] tcg/aarch64: Pass TGType to tcg_out_qemu_st
Date: Fri,  7 Apr 2023 19:42:54 -0700
Message-Id: <20230408024314.3357414-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: qrQhwsu2A9dD

This evens out the interface to match tcg_out_qemu_ld,
and makes the argument to add_qemu_ldst_label less obscure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 40122e1471..f8d3ef4714 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1884,7 +1884,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
@@ -1899,8 +1899,8 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
     tcg_out_qemu_st_direct(s, memop, data_reg,
                            TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
-                        data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
     if (a_bits) {
@@ -2249,7 +2249,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, REG0(0), a1, a2);
+        tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
 
     case INDEX_op_bswap64_i64:
-- 
2.34.1

