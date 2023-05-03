Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2647473ejm;
        Tue, 2 May 2023 23:57:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O+3TgRbk71BjVVO0GewRsjJhYBncqdMFAufYylLiT6womLiADo19X76MUuVAx2OrFaWnU
X-Received: by 2002:a05:6214:3009:b0:61b:65f9:c1e6 with SMTP id ke9-20020a056214300900b0061b65f9c1e6mr6910649qvb.17.1683097073786;
        Tue, 02 May 2023 23:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097073; cv=none;
        d=google.com; s=arc-20160816;
        b=N7gNaPOIOdxrkKhJa+UpB3ezy1yrvBY9iIu0qmchh9QoqXF1D5RlV4swmLy3Kj9uy/
         rjikoLm6V7D7+2S3UMn0k38amnAbxKoF5SGGbd6t2nbitGYJ8gYfd/YcidBQeU7Jsi+o
         aj7j9nZ4GkUZGnOkysxaiOuv4NOTmQkuNty51xjJnBPXSRY10hGa7Q0idhVeJlHRCB0a
         PHBuhhOKNX6HVVL0FVcHYZEaJ4vo2TMWm/QwItbxJ730C8nRbBKWXY1xgPK6V40pLQKY
         xCj44A7F7oJjV+r9WEzMP6Co9upesdlfCo0BnHaCo/M/u3tcjaadi/N/cagxiaAo9GkV
         ET8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zSj12nfEvRnhBgqE2PJi/TGBu9PPVa2e0rcdWimFZ2s=;
        b=XLnfWnPTry0W82mk/H9eTuGGSVEu93FgKiybIvI5XJWS7ZBodiNbpqzrnYp5gNJpzT
         Eg2xZ/vcFPtaWDbAxuDpt8/19btvjDvyHppbxjgEOnIJBY8HfAniYuYEU+llir9L8do6
         p9cgRvbc+vAak25gLaT8pCx1RPuqDN1ybqGf4jkMJQ7AcdheL+EsBR0KPt5a0nuFIJE6
         sXaYI7HQ6FzpMfXtpiC7h6XoCdcwYeoOEijMf6+rw57IfrrOGRMHTyPUA7YOCiQTAP7P
         gZW+dhqz2j5nLS8O6FUtHM/309ofA0gXlV55+ewoSr+WdVSBEQbBIJzQ87tTlsqj7+qQ
         Jdsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xUK/Xomr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey14-20020a0562140b6e00b005eee4f643ddsi18214730qvb.422.2023.05.02.23.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 23:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xUK/Xomr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6Ql-0007R2-II; Wed, 03 May 2023 02:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qj-0007OS-6C
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:37 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qe-0001el-BO
 for qemu-arm@nongnu.org; Wed, 03 May 2023 02:57:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so30786075e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097051; x=1685689051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSj12nfEvRnhBgqE2PJi/TGBu9PPVa2e0rcdWimFZ2s=;
 b=xUK/XomrqLWoVxTwAx6MyGwPXC4V1pdAo1xOaKIIfuLjL3WSMcuyrUL+tTSVRkHuxJ
 uVlYRMZb3FM+8bfbDNO3qVGSejywql2nEpGFjicXhTax5Z4WQ7WlyXYGHz0+qL5CnhJJ
 jxyedE66ebInCCh3ZXLYzwN/Tvqb+aFn4JgHRLM9V83LJwcpxYjCwxWYp36lpj0wSwbM
 VUlnx/DcEZV529vv74GHEivBurc+HUU6AznAygIdQsTSrygGvhDEAfEv069MOaLW+dSQ
 tboRdXyfIyvMPFMYdCiEiRnRy46R74TaM9c1eu1MEz+lY3GhbPmFsn27di2UyHsKyU80
 mONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097051; x=1685689051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSj12nfEvRnhBgqE2PJi/TGBu9PPVa2e0rcdWimFZ2s=;
 b=QqhG824rasaFNZUf7mQtLx0+KELJxiM4gRfXAA2uXSPODj4Mf7dsKQrZoDgO6xmggW
 YTxcOT90KFSbkHxM26h2t8jJ8kN0XktQFet7RENfVk66/mDaBHpAWksopmaMH+Km14v9
 H0g4zMCWJ4lJIhI4sFnwEtB+ac+k91YIiwb4RmdmCYgjBXtgdK/swVKXqhhKr6HxqjYx
 4mR5hmBKuA1/SqV85Y7zH/acDh40csPmTVkJXHvG07qe4Os0DuV7w46KiQUjzGyqs4o2
 NbOjZCp0u3vvg0yAu/Dr0YtyUkE5ih0TTc0zeeMdSrvX/7vpC3nF0HqztuGmx/Hx4vy+
 xjQg==
X-Gm-Message-State: AC+VfDzyp0QEK95zxgh7MsuDn92PmofhbupzBoe1GN/+EYhewsD57lR+
 rYvpnTOj6GuxWxIn9pj2kLF9KA==
X-Received: by 2002:a1c:7718:0:b0:3f1:8430:523 with SMTP id
 t24-20020a1c7718000000b003f184300523mr14381752wmi.14.1683097051006; 
 Tue, 02 May 2023 23:57:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 01/54] tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
Date: Wed,  3 May 2023 07:56:36 +0100
Message-Id: <20230503065729.1745843-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: sX3E2U3DhzR0

Interpret the variable argument placement in the caller.  Pass data_type
instead of is64 -- there are several places where we already convert back
from bool to type.  Clean things up by using type throughout.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 111 +++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 61 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index caf91a3151..cfa2349b03 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1884,8 +1884,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
-                                MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
                                 tcg_insn_unit *raddr,
@@ -1895,7 +1895,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
 
     label->is_ld = is_ld;
     label->oi = oi;
-    label->type = is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -2152,11 +2152,10 @@ static inline int setup_guest_base_seg(void)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, bool is64, MemOp memop)
+                                   int seg, TCGType type, MemOp memop)
 {
-    TCGType type = is64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     bool use_movbe = false;
-    int rexw = is64 * P_REXW;
+    int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
     int movop = OPC_MOVL_GvEv;
 
     /* Do big-endian loads with movbe.  */
@@ -2246,50 +2245,34 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-/* XXX: qemu_ld and qemu_st could be modified to clobber only EDX and
-   EAX. It will be useful once fixed registers globals are less
-   common. */
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
+
 #if defined(CONFIG_SOFTMMU)
-    int mem_index;
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1,
+                           -1, 0, 0, data_type, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
     }
 
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           is64, opc);
+                           data_type, opc);
 #endif
 }
 
@@ -2345,40 +2328,26 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                            TCGReg addrlo, TCGReg addrhi,
+                            MemOpIdx oi, TCGType data_type)
 {
-    TCGReg datalo, datahi, addrlo;
-    TCGReg addrhi __attribute__((unused));
-    MemOpIdx oi;
-    MemOp opc;
+    MemOp opc = get_memop(oi);
+
 #if defined(CONFIG_SOFTMMU)
-    int mem_index;
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits;
-#endif
 
-    datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
-    addrlo = *args++;
-    addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
-    oi = *args++;
-    opc = get_memop(oi);
-
-#if defined(CONFIG_SOFTMMU)
-    mem_index = get_mmuidx(oi);
-
-    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
+    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
                      label_ptr, offsetof(CPUTLBEntry, addr_write));
 
     /* TLB Hit.  */
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
+                        addrlo, addrhi, s->code_ptr, label_ptr);
 #else
-    a_bits = get_alignment_bits(opc);
+    unsigned a_bits = get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
     }
@@ -2673,17 +2642,37 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
-        tcg_out_qemu_st(s, args, 0);
+        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
+        } else {
+            tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
+        }
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
+        } else if (TARGET_LONG_BITS == 32) {
+            tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
+        } else {
+            tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
+        }
         break;
 
     OP_32_64(mulu2):
-- 
2.34.1

