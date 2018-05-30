Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5022554wre;
        Wed, 30 May 2018 11:04:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLGiME8xXvTF3HTkqHlNehoT3YGGvItNfLab0+asAjA+oSFUYbX30hrpabkgI1p0Nu/Ji5u
X-Received: by 2002:ac8:2888:: with SMTP id i8-v6mr2133748qti.275.1527703493930;
        Wed, 30 May 2018 11:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703493; cv=none;
        d=google.com; s=arc-20160816;
        b=ilUKy9VhQ7XaDK0DDECIcoXH/3r73zAIcMJJJ1L7KhaI4PJD6EgbOIxwc/4tO+8gJg
         6YSc38gYnHpyXvOQuWm6Vk3H/C0SM8dAuDfgYiflvLqJDByuMl8tJN2a3NVI9bx5htkn
         HZzKfCRichAloElcwHRVPFnHkyLmSfvHmpEUOFPvYHP29p46XJQxwFbB/EgWY7bpAG91
         0/rOH6PB2zzRykBGo/IKU5rRPVsDvpJZ5cepHJekyzYfIrYcPyLp/D+bScG4LBcwP0iJ
         s/0VcFnTIcMtMRDtwLlX17wnF2GFxcAf6Tvh1FbP1aNoiVvgtUw2bTxF4eCU1TvG+UBA
         ueMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=n4+8RuZr2vOITB8cmfVyUiCIxF+yQylQx7PTF/yIixM=;
        b=omjBLXeRcX/GjQBcRLwWyXshHtWSOowfIj1J+PfGkl9HidkszqkUMycsLolaeyoQgl
         HDV4A6lUDgsc1VCF7Zx5jAm1pp68YBm483xLPjcBRbVm/8HqpVTw3Yu4jzYeNefnZkeb
         VZCOBUvwE2yWcFqOcYFPaulFdscPIDQQuyBibWx6w28kWD32L3d9ywfZ2F/f9d2gYLsw
         VVyGczv/9AxNxPuQsgrp3ln/H21fVfHSsNH1pV2C9EaatFzE05eTDwWmmbmmwHPAPhlr
         XzabImbpZE8E3R6P5zA7uZEh466zCQAJg+cOF27fOioQPpsYF6VRd7d59Bpv16w17s2P
         4FZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dl5Y5W4D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r29-v6si15113881qtk.79.2018.05.30.11.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dl5Y5W4D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5Sv-0003eV-El
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:04:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pp-0001xd-9D
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pn-0004cJ-FE
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:41 -0400
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:44389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pn-0004bT-6i
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:39 -0400
Received: by mail-pl0-x236.google.com with SMTP id z9-v6so8206977plk.11
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n4+8RuZr2vOITB8cmfVyUiCIxF+yQylQx7PTF/yIixM=;
	b=Dl5Y5W4DHJgZqkXnw+IqhcCknC/CFQSYMHTdosnJwOfDzIymQPTunAiyApmPDMuuiW
	kldJ+zEslXfkuPJ7LIoVjd5EsWdzTab+wpDBsFgnOt0Ky5TnpriczwGZ2uOEQNl6tJ9R
	8v43liJ1U8ka4JXlez0Bb7+Z5NUuRoYgt2oZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n4+8RuZr2vOITB8cmfVyUiCIxF+yQylQx7PTF/yIixM=;
	b=Uyi0NvV/r126q5nNk/jI9UBJ1twx/StxHgiogwGuxI2U9REcZ+czpMjLcvLkz3KGQb
	5oATw4dmSRp+YMJhV+NCyvp9nkrdWl+dQqmUmg4bIrafpr4QCIbatmHhgTFNwVk3STaf
	2IZzPq/IsTePFvBExH+74gb4/CpFmgSl7LsMhSddFzETo9UhM3pBvSsU1Ap0JYJTt5Wo
	kcTsqoSkS27mapHc9j2h57kwfFzZ/q/5P9y0DbtyCU4R4m4onRERF2lOpLJqY6oBHPtb
	enzvxlhCfKXx6fS/IGaq9Y8BQKPbi7MlB/9qaUYwmgQJwI7p4yoDZVUjNTuWp5MYJuak
	Zj0g==
X-Gm-Message-State: ALKqPwdmeSzk66XbCfIM02WKeLdjST/Vaysuv5QK0pmh5wsrlAhGQpy8
	D014A+Yj3d8WOIJ+/65zFjw/1ttgSvc=
X-Received: by 2002:a17:902:74c8:: with SMTP id
	f8-v6mr3832181plt.317.1527703297024; 
	Wed, 30 May 2018 11:01:37 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:11 -0700
Message-Id: <20180530180120.13355-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: [Qemu-devel] [PATCH v3b 09/18] target/arm: Implement SVE vector
 splice (predicated)
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
X-TUID: qhB3vfTrH94l

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 13 +++++++++++++
 target/arm/sve.decode      |  3 +++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3b7c54905d..c3f8a2b502 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -479,6 +479,8 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f8579a25e3..f6d4b2139a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2108,3 +2108,40 @@ int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 
     return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
 }
+
+void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc) / 8;
+    int esz = simd_data(desc);
+    uint64_t pg, first_g, last_g, len, mask = pred_esz_masks[esz];
+    intptr_t i, first_i, last_i;
+    ARMVectorReg tmp;
+
+    first_i = last_i = 0;
+    first_g = last_g = 0;
+
+    /* Find the extent of the active elements within VG.  */
+    for (i = QEMU_ALIGN_UP(opr_sz, 8) - 8; i >= 0; i -= 8) {
+        pg = *(uint64_t *)(vg + i) & mask;
+        if (pg) {
+            if (last_g == 0) {
+                last_g = pg;
+                last_i = i;
+            }
+            first_g = pg;
+            first_i = i;
+        }
+    }
+
+    len = 0;
+    if (first_g != 0) {
+        first_i = first_i * 8 + ctz64(first_g);
+        last_i = last_i * 8 + 63 - clz64(last_g);
+        len = last_i - first_i + (1 << esz);
+        if (vd == vm) {
+            vm = memcpy(&tmp, vm, opr_sz * 8);
+        }
+        swap_memmove(vd, vn + first_i, len);
+    }
+    swap_memmove(vd + len, vm, opr_sz * 8 - len);
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 90561a8b50..cf3624b439 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2671,6 +2671,19 @@ static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     return do_zpz_ool(s, a, fns[a->esz]);
 }
 
+static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           pred_full_reg_offset(s, a->pg),
+                           vsz, vsz, a->esz, gen_helper_sve_splice);
+    }
+    return true;
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 95eb4968a9..a9fa631252 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -463,6 +463,9 @@ REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
 
+# SVE vector splice (predicated)
+SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

