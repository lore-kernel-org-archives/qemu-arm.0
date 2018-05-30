Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5023522wre;
        Wed, 30 May 2018 11:05:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJxChaYWhvo3iNvLuGJWHQjMtQ2lw430tLNnFkDa7iTmR2yQjsjj1Gd9zD+hBwayCiujojU
X-Received: by 2002:ac8:5191:: with SMTP id c17-v6mr3736719qtn.35.1527703555115;
        Wed, 30 May 2018 11:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703555; cv=none;
        d=google.com; s=arc-20160816;
        b=mlwpE77ZFoHIBJu599xdYWjvo68mGEuHU7+l3AMJnVMZdkeAL40n5/SAG2P5Iw8Z32
         iOixgpKy3E4WQTTapz11G8hUlf3w8kfWEXcLVXB3yl47UuR3rYZWbOfFHhnbCOTMgfsQ
         cH0iCgMHaPSCdYqJ/E683Vx9d75t80EFRnxNgcnxmgTZC2CV3hImPOz3Rexjmz/BlMaL
         odyaQixyN9W9EGI0CzvQteVehpwZ3FlN6g6dXvxr8bz2ua21LzEyZ3AkoZnPbZjw/yZj
         nPDe2iASn88lGlC/B1/r0R9Ib0Z9H6T5UoPtIuq531f0Bjs9j6nCTophg6z6oELKWF2t
         CH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PDpmyfb4bOVCnOHan4I6CC+vGr/XXSD5EaKpHePia6k=;
        b=b33rNP4JE+KUl6t90RAh6jlT6xo9+GWgarbZloqKa1zB+Ogg562F8pq8+gXWfTXm7w
         3jhi1wqV65EzKLFc+Zy03U4SKdI/8rk/71sa4uz453pWiayM4rVJoWMtiqKCx4HbdOoo
         tVhKbQZVliNy7qJjOZuMs1/DaGoMwSc0Egym5dM+q1JzHuHbdqMbbGKF7loYaPPLnL4T
         VkOMlFRrEych1nldyPIb/w7m/MLt08i4N80eRHhcJ56q5RS0+Zm0sK7aq6Zlma1ZvsF/
         aXrr7xXSSSwX5DwYCQaZyt8VPu5kLfej7obP5MknPYp81VGrdpxn5LlXbwfC5csobTft
         DWjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2rP/jr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f8-v6si9165833qvo.2.2018.05.30.11.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2rP/jr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5Tu-0004jK-HH
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:05:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pj-0001sS-1Z
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pg-0004U2-El
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:35 -0400
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:39944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pg-0004SZ-6X
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:32 -0400
Received: by mail-pf0-x22c.google.com with SMTP id f189-v6so9413967pfa.7
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PDpmyfb4bOVCnOHan4I6CC+vGr/XXSD5EaKpHePia6k=;
	b=T2rP/jr9pMBVLTBhLlIzTy4Hz93hEpBngAC11ZoOnBYVocQbYox1ygyFiacP5HdKOO
	Zx3HAwg8A/Kna/RSVsO/87t9zEKJYZGV6Fnsk/pI0CCMRo5JPz/2A8fV7W5vwGXHTAhT
	oN41BvewirQW5PekPLVit2OpQJwlKFGPY7orE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PDpmyfb4bOVCnOHan4I6CC+vGr/XXSD5EaKpHePia6k=;
	b=oAgI8XpiJaGtSe0k8NJgT8w7Iz3bTZmLjsXD3TpyYP1pHVwdLO33v+/3pb4MXNHwJF
	9V+zDDijLNr5FxWGmwjMU6WHA4BXp7V/HjQ/Kpf+vJo/UvdmkpxYFNZJysQfvb8G/0AG
	4V0zRUmUzh+4lr5L/Zd7YQJoWDqIjuMdPrFy0su5V00vJPUb5B/IhV2lBMe1xxZKQtfc
	8Y8PtTA7RengRJOPi5bJ4HhMOO/62g86570vc2znNWWzB32aaHSFcTOp88cHAb16zRTl
	vll7O/ma3qOgyZ4ZajkeuYboN1g1ndP0EkDcaVUgKXIBy84eAX0d/JQQef6cnTY1ZRCj
	jirw==
X-Gm-Message-State: ALKqPwcY3KAKP9pyZtEX/sTpNcyLA/OcI8WsoXw5DCbUxSTdT0jog5Wg
	lU6gnfPXKckZpi2BcTjd/XAqQUiKI9M=
X-Received: by 2002:a62:930c:: with SMTP id
	b12-v6mr3680072pfe.193.1527703290385; 
	Wed, 30 May 2018 11:01:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:07 -0700
Message-Id: <20180530180120.13355-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22c
Subject: [Qemu-devel] [PATCH v3b 05/18] target/arm: Implement SVE compress
 active elements
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXn4hWOraDmf

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  3 +++
 target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 12 ++++++++++++
 target/arm/sve.decode      |  6 ++++++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index bab20345c6..d977aea00d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -460,6 +460,9 @@ DEF_HELPER_FLAGS_4(sve_trn_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f114e9ab63..ed3c6d4ca9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2036,3 +2036,37 @@ DO_TRN(sve_trn_d, uint64_t, )
 #undef DO_ZIP
 #undef DO_UZP
 #undef DO_TRN
+
+void HELPER(sve_compact_s)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = j = 0; i < opr_sz; i++) {
+        if (pg[H1(i / 2)] & (i & 1 ? 0x10 : 0x01)) {
+            d[H4(j)] = n[H4(i)];
+            j++;
+        }
+    }
+    for (; j < opr_sz; j++) {
+        d[H4(j)] = 0;
+    }
+}
+
+void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = j = 0; i < opr_sz; i++) {
+        if (pg[H1(i)] & 1) {
+            d[j] = n[i];
+            j++;
+        }
+    }
+    for (; j < opr_sz; j++) {
+        d[j] = 0;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 21319518d7..ed0f48a927 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2284,6 +2284,18 @@ static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
     return do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
 }
 
+/*
+ *** SVE Permute Vector - Predicated Group
+ */
+
+static bool trans_COMPACT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index df2b94dc0a..9da6566d32 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -424,6 +424,12 @@ UZP2_z          00000101 .. 1 ..... 011 011 ..... .....         @rd_rn_rm
 TRN1_z          00000101 .. 1 ..... 011 100 ..... .....         @rd_rn_rm
 TRN2_z          00000101 .. 1 ..... 011 101 ..... .....         @rd_rn_rm
 
+### SVE Permute - Predicated Group
+
+# SVE compress active elements
+# Note esz >= 2
+COMPACT         00000101 .. 100001 100 ... ..... .....          @rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

