Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5020047wre;
        Wed, 30 May 2018 11:02:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIwi1G5RX+QJ31I06fdaqjKogLwBYlgI2DFujvWQKXE1p4KrLMfL41RG4PUAM4e5hg9ld9v
X-Received: by 2002:ac8:2ac2:: with SMTP id c2-v6mr3722043qta.147.1527703340183;
        Wed, 30 May 2018 11:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703340; cv=none;
        d=google.com; s=arc-20160816;
        b=WxtB9AzQx6yDRa20Rk40HqucXNF+tRNvrHVtcAOmXTh8WUgYolP9s7LwLm/HWyA1Ok
         xFId0MTQzn/rduZ+d77TZA7Na19i1qiLuQx0L8Q77yBELNnFLgj/tfaLws0/YsYhiket
         DlAvg4omfPMOaPb4nTbmzHt5Lf81712/roebZd5bmeXXT+f2SJ6V9qpGc6oYsVhCuVo+
         qr9apd/V4k5ut0so1jt/R8YcfRRVGRCP1ODa8P7rFf99Hv6WvIwMGg6YeWaEjwQHAlbu
         yCgfYje+LMDViuS006fjhwHAnCH+nkH18zUdNgugSDk4bAJLJR92DmkPYqnnzT+TNPId
         o9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Kp4DBikk3yZbQpa3m9qbcNB6Ol8v1TI2EZIhxI1zmKk=;
        b=UX4z7HhHSTw/VPl9HotwopRCj7BP4JSX4ingcfIdESX6N84BNo8uxHePHmXlaRL7Bt
         +G2vVIFdVi+5BCjBS7r7EVuB1/zenNlmQVfIbwOzgGYX5KALeyBiqKyB6wy5MrnyJFrQ
         Qn+uBBGZGiSDAs4WNIqV9xqxhOKi3mSEawxvspXXOiVXtvorKTbLloslvQvF3B0UA+Jr
         wVVnC8pNajvWK9NjqifZT86QrErI6JdUEaUjmVFUcbfWIWEFNxBkZFLRIT5E8PnvLw+G
         Ecf9SsJPpJzyKfbR1xrtrkgx8ypim04EbMdHwX1/UahI/L6PEFtbRShk8GFjxaHW6kUe
         YeNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OusqQE83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v129-v6si2666092qka.94.2018.05.30.11.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OusqQE83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5QR-0002LB-Lu
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pq-0001yT-37
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Po-0004cv-1O
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:42 -0400
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:45788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pn-0004bq-O5
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:39 -0400
Received: by mail-pf0-x22f.google.com with SMTP id c10-v6so9398167pfi.12
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kp4DBikk3yZbQpa3m9qbcNB6Ol8v1TI2EZIhxI1zmKk=;
	b=OusqQE83iOZ44zYWr9iocXZ9i4npimEyaxFui/Z1NQvBbdtBFeYTlRuPicI1yVGstz
	o2AxjdBsYXJcqB9C25MneZQHdPdfMxWnE1lA5Guf1evyDCB9IKKFewSrpaG9dJZ1fB4Y
	BWb0SNd51KEyzDTWhp1kIsGFTisSax7eVjDlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kp4DBikk3yZbQpa3m9qbcNB6Ol8v1TI2EZIhxI1zmKk=;
	b=Zi+C0KNNlWufaAvoMzesd5DqRpkN1g+vvAjY+KwV7kP6f3zWp1FhW3P+m9TWGxmtwq
	Gt3WPQ5zyvntJS2LK/mVS9lVmTts3KY9IBL/NsEsB2E4+rlwEv6EA2jima6QH3bCApyD
	1+TcJNsnUIFGyh6CQnDGskwU3xK3KeDGwO7LNEoReaBVRFXqHDaWimDxNpA6sFtO5PRz
	W/mA1p3T6ms3li3R0VCKCHEPIF0zg21kRdC6iJGcf9FksQwgymGwmv7IfTtmQYU/G/AJ
	cNv/wUMLYQUMD29E8ETARrcGSS0y3dcOtcKMgDJTHNUilO2oIyEPgbs03YWXVnUkOwkR
	u/eQ==
X-Gm-Message-State: ALKqPwcRp2oRWbwFn1i8wW2j+j/FWKs3c/NG5/Wmp4tOL31gZyjW0ynC
	EOQyTK0wDxro5dWrmwj1C1n/uQ==
X-Received: by 2002:a62:3a59:: with SMTP id
	h86-v6mr3693245pfa.209.1527703298450; 
	Wed, 30 May 2018 11:01:38 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:12 -0700
Message-Id: <20180530180120.13355-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22f
Subject: [Qemu-arm] [PATCH v3b 10/18] target/arm: Implement SVE Select
 Vectors Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nkZtpLo0Liqb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  9 +++++++
 target/arm/sve_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 target/arm/sve.decode      |  6 +++++
 4 files changed, 72 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c3f8a2b502..0f57f64895 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -195,6 +195,15 @@ DEF_HELPER_FLAGS_5(sve_lsl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_lsl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f6d4b2139a..51cf9c47d9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2145,3 +2145,58 @@ void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
     }
     swap_memmove(vd + len, vm, opr_sz * 8 - len);
 }
+
+void HELPER(sve_sel_zpzz_b)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        uint64_t pp = expand_pred_b(pg[H1(i)]);
+        d[i] = (nn & pp) | (mm & ~pp);
+    }
+}
+
+void HELPER(sve_sel_zpzz_h)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        uint64_t pp = expand_pred_h(pg[H1(i)]);
+        d[i] = (nn & pp) | (mm & ~pp);
+    }
+}
+
+void HELPER(sve_sel_zpzz_s)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        uint64_t pp = expand_pred_s(pg[H1(i)]);
+        d[i] = (nn & pp) | (mm & ~pp);
+    }
+}
+
+void HELPER(sve_sel_zpzz_d)(void *vd, void *vn, void *vm,
+                            void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i], mm = m[i];
+        d[i] = (pg[H1(i)] & 1 ? nn : mm);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cf3624b439..53b86af94d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -373,6 +373,8 @@ static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
     return do_zpzz_ool(s, a, fns[a->esz]);
 }
 
+DO_ZPZZ(SEL, sel)
+
 #undef DO_ZPZZ
 
 /*
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a9fa631252..91522d8e13 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -98,6 +98,7 @@
                 &rprr_esz rn=%reg_movprfx
 @rdm_pg_rn      ........ esz:2 ... ... ... pg:3 rn:5 rd:5 \
                 &rprr_esz rm=%reg_movprfx
+@rd_pg4_rn_rm   ........ esz:2 . rm:5  .. pg:4  rn:5 rd:5       &rprr_esz
 
 # Three register operand, with governing predicate, vector element size
 @rda_pg_rn_rm   ........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
@@ -466,6 +467,11 @@ RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
 # SVE vector splice (predicated)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 
+### SVE Select Vectors Group
+
+# SVE select vector elements (predicated)
+SEL_zpzz        00000101 .. 1 ..... 11 .... ..... .....         @rd_pg4_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

