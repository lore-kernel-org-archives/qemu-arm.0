Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1325648ejc;
        Sat, 7 Jan 2023 18:38:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt+bPU652UoAWsiZ5xV9VCLh5tzQoVXX6F+S++F98UCNzgWO0LST42tHWCipfPpscELo3pk
X-Received: by 2002:a05:6214:390c:b0:530:7822:200 with SMTP id nh12-20020a056214390c00b0053078220200mr75921953qvb.17.1673145526252;
        Sat, 07 Jan 2023 18:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145526; cv=none;
        d=google.com; s=arc-20160816;
        b=BgJChgpswJw0U8baj43xq/8SW5QPbRy3gTlMRsGrAsb9n6tRQV9+rFcCRzb1QCSC5r
         0iyRIisdYK2VHgmGj3j71Qmp8QW+fChI0vcQ5C16f4MkQaWbGStWfjjc8MN+yzSzDG1X
         K0qeaAj1/ZuqOfHd5FEeK+ekRa8iRIXwma77TSh1GXhUvfB++cwuzvFWnoM8Lygw6gNi
         WkkOO07h7BArK2Ug2waw2kmHQOWkSpBN8Wz2hkuMAT07wyxuEKRDph0pFSY+QcFBlBNu
         9nMs0YXD3Q4YslOJBKI7zTkIUMty/ZpjIzFzRRLPSvU+tNn9RBsIMXSnoltqtWNnudKN
         nGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
        b=Je+YEQznzGm4vrK8yPObCKehLyeGcXgyK52jtBsfIGCAFOG7J12OJyIwgsqYGTpPuW
         PAxcxWtI7In2Y4hBFtr47eYfcLlT7abJMbI3JHIUfEQ3hcAtzFAlM9LyT+j6+eKNGM7A
         9T9cBwcbBCHSXpnGN0K+qFsX59JW3HgIDipoZFM5d52JRbBw267s0wEbVN9hVS+Vbbdw
         cuQ7xalkMM7zsWy7JQ39yuCgMHgZADa3qpQNrOeJs8PlmspZhTq5FY/fCS/bloZ4PRyZ
         Ahe3wAeM+XQZXz9aKVAvOS9ffyCStbIk3Xlwqbw1JLPUCYH1HyQEG4DOUnyIqB+yDD1n
         1yMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zfcdQM4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw17-20020a05620a601100b00705b31b71adsi272024qkb.735.2023.01.07.18.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zfcdQM4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELZL-0004td-5R; Sat, 07 Jan 2023 21:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZJ-0004sp-LL
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:37:53 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYy-0004Uq-PE
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:37:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so9263362pjk.3
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
 b=zfcdQM4/5q2ta7iuqZJrCCSzlJEXqS0WhwPx4k2uaLccpH7A3ev/saSPpc+LYwyd0J
 AgrpsdRZIn2LzaDQb7iloaUOiQHpAtZA2+Yx5ujE8QjfSECJA1y8Ul7Fuftx36LL4UDr
 1nPYjlb50GAEO+JSU1QP4LOjqH7F+b0yu0EEiekrmaMZOX+R46lczBguI9VnwXd3hpxC
 BEzpB8Y+jHE650tRX9R7SqkvtIbUXLhh9TGPgCDk3VbExPINozRY927zKsmZc2y2DGvm
 695kj/+z4hboxGHIU6LzH/UrqmsVrfqqX3QDNCn4pa/AH59Y9M62pU1cgXtpKf4gNOv8
 chow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
 b=jvzWYn0/nb20SbI7+vgxG2gDqK7E41Tb3SOP1cbqOQXFQwj7Xt1S3TIBhPy+JAc9sg
 iZMO/3YRXQn0KH67yQr6qUuJ0UVbXJFuK/1fZryQWinOX5nFp3dhWbhDscy/u5CWEzWl
 WrpdF4GEuH6BkCHspRjBpANwDv8w7NybSfevFzc5JSMqKwJvQuJ6eMvBmsj2qanQ10SW
 8wiyqHbdwaa/d+zUNaxNqGEccL5YC0WDIqSDpMHxrZEvxLaZa3cB+vwERP/oIWlT3E8q
 AV9rorBHrYSMMox028SW5xkvxZpv3UjZCBBamz28NpEpJX27LG/DB4UUynacQm6kTNWU
 t6MA==
X-Gm-Message-State: AFqh2kouIPyr3FYhPMIcflEom3Vds3F/f2+Wk/gZu7/DIAkBSJKUAIDt
 +YJ+ssIGJsVqpMAZ8/IHjus1Iw==
X-Received: by 2002:a17:903:451:b0:192:820d:d1 with SMTP id
 iw17-20020a170903045100b00192820d00d1mr51051507plb.25.1673145452040; 
 Sat, 07 Jan 2023 18:37:32 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 10/36] tcg/tci: Fix big-endian return register ordering
Date: Sat,  7 Jan 2023 18:36:53 -0800
Message-Id: <20230108023719.2466341-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hOBzWp3euBy/

We expect the backend to require register pairs in
host-endian ordering, thus for big-endian the first
register of a pair contains the high part.
We were forcing R0 to contain the low part for calls.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 05a24163d3..eeccdde8bc 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -520,27 +520,28 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 ffi_call(pptr[1], pptr[0], stack, call_slots);
             }
 
-            /* Any result winds up "left-aligned" in the stack[0] slot. */
             switch (len) {
             case 0: /* void */
                 break;
             case 1: /* uint32_t */
                 /*
+                 * The result winds up "left-aligned" in the stack[0] slot.
                  * Note that libffi has an odd special case in that it will
                  * always widen an integral result to ffi_arg.
                  */
-                if (sizeof(ffi_arg) == 4) {
-                    regs[TCG_REG_R0] = *(uint32_t *)stack;
-                    break;
-                }
-                /* fall through */
-            case 2: /* uint64_t */
-                if (TCG_TARGET_REG_BITS == 32) {
-                    tci_write_reg64(regs, TCG_REG_R1, TCG_REG_R0, stack[0]);
+                if (sizeof(ffi_arg) == 8) {
+                    regs[TCG_REG_R0] = (uint32_t)stack[0];
                 } else {
-                    regs[TCG_REG_R0] = stack[0];
+                    regs[TCG_REG_R0] = *(uint32_t *)stack;
                 }
                 break;
+            case 2: /* uint64_t */
+                /*
+                 * For TCG_TARGET_REG_BITS == 32, the register pair
+                 * must stay in host memory order.
+                 */
+                memcpy(&regs[TCG_REG_R0], stack, 8);
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.34.1

