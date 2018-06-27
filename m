Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5785772wrq;
        Tue, 26 Jun 2018 21:59:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdfkijxIeHQUMQWQ+MFRHEdEQHLqL/WfEN6yIbGb+SjESshE9Ax7oBJZKuI6UCWD8V9FDO3
X-Received: by 2002:a0c:94f1:: with SMTP id k46-v6mr4062343qvk.113.1530075576132;
        Tue, 26 Jun 2018 21:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075576; cv=none;
        d=google.com; s=arc-20160816;
        b=wWngea5QaEi3z5GYFEuy6sbkCrUb+FHqhIL4CoSHELmjcII6vDmz1xTT7BqmTrihde
         f+5G3Dn/VUZMT7o+iTOiUpHqnxQhoHX2wnOzgXn8A+XJaehMI2Suom4DVJGs0QR1iBpG
         l3odRqpXkhuwZq+S9KjW08/MY2DXvZbdJcSoEpX8wpeNc64q3z1PbOk2zYTjqKBgi5wx
         4xHlN+QR9X2q7xUC7cpms9WZkemdFJjb7DltEIZk4YOT3qaVUN4O7k6LLlPQX8iM/+Wn
         Vkuda0uHdepHSDCjJ85ZXS3ABRKq9eM/3+ZOnNBqMXhOOa+kKggZHq08t95BKaScdd1I
         on+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k58LLRl/ubomF3QyWjTfEzFxj0hKy1XlanWjizd0aaM=;
        b=Dy+tKFB0AtjyqMJo6Z9ZzrlhIHis5yp2ygpW35joF+bLVSilx60QiNtyw50+760TMk
         cp8+7hrvXQmsYXHMEGVQauNbB1wkiIL71VDgh9MvlovOtMzhk0SO0tdUNmalf1g0o5MY
         5/5rLckbhIV78hQ091evwQcDmWSPbJrGMhJdHFTNHWU2DAKJ22SAB0VNAsQCUgq0Q7UA
         4ywwCmM2UTdffZ+HZic/knMhDQqiF0xJcefGE8qylv8PZbBDUgSrKcV3V7Av44Iyc4lj
         gk7Ff/i9CL/85MMpqjcdmcLeH908kw7TsJXxt7Ng1qrShFTTW8filI5Zp2554F1WLEfr
         WHPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KDe8YeJP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1-v6si3170636qtj.107.2018.06.26.21.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KDe8YeJP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2YJ-00006x-H4
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:59:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29s-0004iR-DK
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29q-00019P-PL
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:20 -0400
Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c]:34005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29q-00018I-DR
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:18 -0400
Received: by mail-pg0-x22c.google.com with SMTP id y1-v6so370580pgv.1
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k58LLRl/ubomF3QyWjTfEzFxj0hKy1XlanWjizd0aaM=;
	b=KDe8YeJPzp4V6bDofkISoXbfUvSgNaoDKI3JVQPI5vaszV7gbR6dhCKfl/CFHJOCNh
	kdFKhYHOAEBDLJO5AcRZJH1ekwI+EEkZD9ShzFJ89rTGktF80rXk7oMBVuWZSq4gMpoj
	yVHSGbENKGxkH1il+nxLeoPvhbKgGzt+rbGsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k58LLRl/ubomF3QyWjTfEzFxj0hKy1XlanWjizd0aaM=;
	b=S21D4EMImWgRct878mhGO6CMm5kETJLu82HbZrGMesxDeaNsJPmsHXNXxWPS8rv4uW
	K8ly0cgxb/Al5MdSsNb4Aj9aAUeE1iZZgCntYTMFh2zDi3kOIBGzh9TDjSy+K4OXHmFI
	d2avaIDCQlR+9PJTClQVK2N3IlE/VzPQXbWoXyKBPVo5NxLi1jyId2DZTOBhcTfUL73r
	WXX/ent11uIbvsELINW5Bccs3jI1VC0BDc+4Q3QhTZx2RSXseiELtPXN1zkS6A4wr89l
	kpcq1fKLspbdRlFTMN3/5vJbM/5zk1nyJ3deRQ3J0rywgFwWCXuDHvE2F+UDesGV1CE7
	P7jA==
X-Gm-Message-State: APt69E2L9+fwIAfjHUT8whJ0vkJ5ZRB6kZBmUC8n3y9FrtzYy5wbl1mr
	Syt5FGfHba1yiM1QVlDdU+y2Kw==
X-Received: by 2002:a62:b02:: with SMTP id t2-v6mr4306504pfi.36.1530074057444; 
	Tue, 26 Jun 2018 21:34:17 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:26 -0700
Message-Id: <20180627043328.11531-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22c
Subject: [Qemu-arm] [PATCH v6 33/35] target/arm: Implement SVE dot product
 (indexed)
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
X-TUID: p5rHxk/BDRAZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Rearrange the loops.  The compiler does well with this form
    and hopefully they are also easier to read.
---
 target/arm/helper.h        |   5 ++
 target/arm/translate-sve.c |  18 ++++++
 target/arm/vec_helper.c    | 124 +++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |   8 ++-
 4 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e23ce7ff19..59e8c3bd1b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -588,6 +588,11 @@ DEF_HELPER_FLAGS_4(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_sdot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_udot_idx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_sdot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_udot_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fcadds, TCG_CALL_NO_RWG,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8a2bd1f8c5..3cff71cae8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3440,6 +3440,24 @@ static bool trans_DOT_zzz(DisasContext *s, arg_DOT_zzz *a, uint32_t insn)
     return true;
 }
 
+static bool trans_DOT_zzx(DisasContext *s, arg_DOT_zzx *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[2][2] = {
+        { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
+        { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
+    };
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->index, fns[a->u][a->sz]);
+    }
+    return true;
+}
+
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index c16a30c3b5..37f338732e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -261,6 +261,130 @@ void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    uint32_t *d = vd;
+    int8_t *n = vn;
+    int8_t *m_indexed = (int8_t *)vm + index * 4;
+
+    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        int8_t m0 = m_indexed[i * 4 + 0];
+        int8_t m1 = m_indexed[i * 4 + 1];
+        int8_t m2 = m_indexed[i * 4 + 2];
+        int8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] += n[i * 4 + 0] * m0
+                  + n[i * 4 + 1] * m1
+                  + n[i * 4 + 2] * m2
+                  + n[i * 4 + 3] * m3;
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    uint32_t *d = vd;
+    uint8_t *n = vn;
+    uint8_t *m_indexed = (uint8_t *)vm + index * 4;
+
+    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        uint8_t m0 = m_indexed[i * 4 + 0];
+        uint8_t m1 = m_indexed[i * 4 + 1];
+        uint8_t m2 = m_indexed[i * 4 + 2];
+        uint8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] += n[i * 4 + 0] * m0
+                  + n[i * 4 + 1] * m1
+                  + n[i * 4 + 2] * m2
+                  + n[i * 4 + 3] * m3;
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
+    intptr_t index = simd_data(desc);
+    uint64_t *d = vd;
+    int16_t *n = vn;
+    int16_t *m_indexed = (int16_t *)vm + index * 4;
+
+    /* This is supported by SVE only, so opr_sz is always a multiple of 16.
+     * Process the entire segment all at once, writing back the results
+     * only after we've consumed all of the inputs.
+     */
+    for (i = 0; i < opr_sz_8 ; i += 2) {
+        uint64_t d0, d1;
+
+        d0  = n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
+        d0 += n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
+        d0 += n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
+        d0 += n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
+        d1  = n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
+        d1 += n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
+        d1 += n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
+        d1 += n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
+
+        d[i + 0] += d0;
+        d[i + 1] += d1;
+    }
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
+    intptr_t index = simd_data(desc);
+    uint64_t *d = vd;
+    uint16_t *n = vn;
+    uint16_t *m_indexed = (uint16_t *)vm + index * 4;
+
+    /* This is supported by SVE only, so opr_sz is always a multiple of 16.
+     * Process the entire segment all at once, writing back the results
+     * only after we've consumed all of the inputs.
+     */
+    for (i = 0; i < opr_sz_8 ; i += 2) {
+        uint64_t d0, d1;
+
+        d0  = n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
+        d0 += n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
+        d0 += n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
+        d0 += n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
+        d1  = n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
+        d1 += n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
+        d1 += n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
+        d1 += n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
+
+        d[i + 0] += d0;
+        d[i + 1] += d1;
+    }
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
                          void *vfpst, uint32_t desc)
 {
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 35415bfb6c..e10b689454 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -726,7 +726,13 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
 MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 
 # SVE integer dot product (unpredicated)
-DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5
+DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5      ra=%reg_movprfx
+
+# SVE integer dot product (indexed)
+DOT_zzx         01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
+                sz=0 ra=%reg_movprfx
+DOT_zzx         01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
+                sz=1 ra=%reg_movprfx
 
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
-- 
2.17.1

