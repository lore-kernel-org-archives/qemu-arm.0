Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2199468lfm;
        Thu, 30 Apr 2020 11:16:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypIk7pMdugDHktqygQEI/HE2p4jRrqHMmA5MeW5qKO1MQcafyZfAh6DM2IMB9odfihChcH2O
X-Received: by 2002:a37:c0d:: with SMTP id 13mr4853192qkm.25.1588270594886;
        Thu, 30 Apr 2020 11:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270594; cv=none;
        d=google.com; s=arc-20160816;
        b=vAkS8C5LP4pQvxNPYa3XSOjoTex6ibOPKjO029O9AHKhma5LdOq9zkraNfLYAH76o1
         sRjwjQZslzcsdPQPbDyMPQHv2J6hP9X0fwUx9HJJE8qmvraijGJieQpINGlsdouHy/gh
         LSqM2/OfKVOBl8PSzi6UdJZ3s2+NB/hLcTSbTZJj2cwcCRPduTU0TODezJQ+roz3pIid
         Q9p3k0DWMrERmfMOSzZNFhtPEKtYkVf/s/jFaVkkLGt2j0do8eZS4RjL8vxKlPOwwCbX
         VAeVTbBQgcWGhyHbAIB3wHQBywCNWifQyrl8ixwXDfrdqws457/cEjpjWUq3Lx5xgIRd
         JXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ODnbszWwjBK2kHWFKFvRf6pWCWZZQ+15i6oZRBzn83c=;
        b=ZiMn7ZvUkeCJpCzDzhmhe5azLUM1IMTMrfrLpX6CMkGBZpk5RqubU3NFYUixy/EtKj
         PlbcacQO1cqz0naAx1KpSA7jTtbUrou/9zWaAu8gIBtEown3f5Qp+aKTVisuMxU2x2+L
         FFo8lPWSBD2/ZdVeyD9F0m5cKKMBZl16ytgGw62XD1YGpCbUjHLnfut9ZXSRGA3ccIuZ
         WODbkjgqFSvI635uC0E8yIzdq0nIQ/+ar1OKAMq602PSfd458rphWQUfIaEVknCWXa8M
         Fb4diGK1szthvi1cEo8xISR9e6teOsaD9/zVGz25NzBOiw43MYp4as0U64eu0GGPbAqo
         IYRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6Apjhch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o58si229512qtf.266.2020.04.30.11.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6Apjhch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDje-0002MK-7V
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeG-0001kj-Pd
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdl-0001BI-8v
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:00 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdk-0001AJ-Pi
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id u16so3073103wmc.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ODnbszWwjBK2kHWFKFvRf6pWCWZZQ+15i6oZRBzn83c=;
 b=U6ApjhchLT36+BxwF054Y+zpHtq1Cjamu0kOzKeB5ipZ4ZtX+1Ad6qHRjJ1BzAtay+
 xosuFyh7FLQnyACmxheLNC+UPixDezUmqFFaZv4uFCNhpKR6DZ3Mzd8aP+1VlrYhwDf0
 gKHgSHCJSLwREtR4SXyQqwjpff0nJef+/185s97cnYlJU4JU8Lv3KsC6uKrNbUVRq5It
 B17+BSER9x39PVmm6pcx44smNv5a+KkvH3tA8YF7FUG7fIKN7Nko3ncuKol0l07NHkau
 s1SEg50EEyn28JRNTxorf/9kSGBO7kpbWJpgP9WA3W+c12oZi0riH8evHcnq9ntNGqO5
 6Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODnbszWwjBK2kHWFKFvRf6pWCWZZQ+15i6oZRBzn83c=;
 b=aVX+gwO+WH4gxTnyPTAhmqBR50cmJC6cJIZ1m7hYxRXoOZN+/p9nwm1cpTdPa5IPR+
 KxizFrfhXq02bXBIn8UNvKa282hQKHlZ8gtfn0njr+2MTLq4EKKKNSo66hWqpPBE1Rph
 4GStbC9+HYwol/uYie2JoVSmDcsc9p4yi2XrB6UwoEMQBF4LJBZVQGNJk7c9yd/Z39bk
 kBDNcjmcUbGhXszs6RPohuH9NM9hC1sjvgaj273iideTeiQ7XP9oLqeptSczWZiGFCld
 FvmMhKsZThW+Z0uW8R1Tjy2jlaUBDddePTWwqFOxnMs7fQkyQMeFxLHw5QocVJFnsZTR
 4DvA==
X-Gm-Message-State: AGi0PubodsDRyydZh4FPVZjhEshMkFKhpXATGtagm1Ln2a7ZS+b7S/sa
 ck8uBttnbz+jouKE4mX73iVYnanI6E+96A==
X-Received: by 2002:a05:600c:2dcf:: with SMTP id
 e15mr4498414wmh.171.1588270227132; 
 Thu, 30 Apr 2020 11:10:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/36] target/arm: Convert Neon 3-reg-same VMAX/VMIN to
 decodetree
Date: Thu, 30 Apr 2020 19:09:43 +0100
Message-Id: <20200430181003.21682-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WXMTpo8G1oTh

Convert the Neon 3-reg-same VMAX and VMIN insns to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 14 ++++++++++++++
 target/arm/translate.c          | 21 ++-------------------
 target/arm/neon-dp.decode       |  5 +++++
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 507f0abe801..ab1740201c4 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -617,3 +617,17 @@ DO_3SAME(VEOR, tcg_gen_gvec_xor)
 DO_3SAME_BITSEL(VBSL, rd_ofs, rn_ofs, rm_ofs)
 DO_3SAME_BITSEL(VBIT, rm_ofs, rn_ofs, rd_ofs)
 DO_3SAME_BITSEL(VBIF, rm_ofs, rd_ofs, rn_ofs)
+
+#define DO_3SAME_NO_SZ_3(INSN, FUNC)                                    \
+    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
+    {                                                                   \
+        if (a->size == 3) {                                             \
+            return false;                                               \
+        }                                                               \
+        return do_3same(s, a, FUNC);                                    \
+    }
+
+DO_3SAME_NO_SZ_3(VMAX_S, tcg_gen_gvec_smax)
+DO_3SAME_NO_SZ_3(VMAX_U, tcg_gen_gvec_umax)
+DO_3SAME_NO_SZ_3(VMIN_S, tcg_gen_gvec_smin)
+DO_3SAME_NO_SZ_3(VMIN_U, tcg_gen_gvec_umin)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a3eaf9a82b7..a22aee802a5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4899,25 +4899,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                              rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size);
             return 0;
 
-        case NEON_3R_VMAX:
-            if (u) {
-                tcg_gen_gvec_umax(size, rd_ofs, rn_ofs, rm_ofs,
-                                  vec_size, vec_size);
-            } else {
-                tcg_gen_gvec_smax(size, rd_ofs, rn_ofs, rm_ofs,
-                                  vec_size, vec_size);
-            }
-            return 0;
-        case NEON_3R_VMIN:
-            if (u) {
-                tcg_gen_gvec_umin(size, rd_ofs, rn_ofs, rm_ofs,
-                                  vec_size, vec_size);
-            } else {
-                tcg_gen_gvec_smin(size, rd_ofs, rn_ofs, rm_ofs,
-                                  vec_size, vec_size);
-            }
-            return 0;
-
         case NEON_3R_VSHL:
             /* Note the operation is vshl vd,vm,vn */
             tcg_gen_gvec_3(rd_ofs, rm_ofs, rn_ofs, vec_size, vec_size,
@@ -4926,6 +4907,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
 
         case NEON_3R_VADD_VSUB:
         case NEON_3R_LOGIC:
+        case NEON_3R_VMAX:
+        case NEON_3R_VMIN:
             /* Already handled by decodetree */
             return 1;
         }
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index f62dbaa72d5..b721d39c7ba 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -54,5 +54,10 @@ VBSL_3s          1111 001 1 0 . 01 .... .... 0001 ... 1 .... @3same_logic
 VBIT_3s          1111 001 1 0 . 10 .... .... 0001 ... 1 .... @3same_logic
 VBIF_3s          1111 001 1 0 . 11 .... .... 0001 ... 1 .... @3same_logic
 
+VMAX_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 0 .... @3same
+VMAX_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 0 .... @3same
+VMIN_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 1 .... @3same
+VMIN_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 1 .... @3same
+
 VADD_3s          1111 001 0 0 . .. .... .... 1000 . . . 0 .... @3same
 VSUB_3s          1111 001 1 0 . .. .... .... 1000 . . . 0 .... @3same
-- 
2.20.1

