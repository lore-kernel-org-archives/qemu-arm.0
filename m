Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp215152wme;
        Wed, 16 May 2018 15:50:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoYxgdNBxAsR40RjrbKCxqTTpayHPzrBY5NvlERbFYBwee7w6Yzq841DyFJXDgrUP5Qq/CO
X-Received: by 2002:a37:1051:: with SMTP id a78-v6mr2897401qkh.441.1526511033543;
        Wed, 16 May 2018 15:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526511033; cv=none;
        d=google.com; s=arc-20160816;
        b=BgmNuUZhw/bgzYnxNxnxzA6OfORThgQRsN2TrkmgKyf7TU7AeyiF0ylfmasIqaUywI
         D1w/RC4cHlell3+poHWuhaBI4mp6Ffrp0NXEnHi20PQYEN7OETXVbQtb+0P5mtbNqEVQ
         U7eOYahBk4Ce4SuZCXVl+/SVCI/1pdHaGzk1yTXED97E4C2BcVxg7PTLmzfL5RyI58xb
         RA/x/AfR43QV7fi2Jwr9P7Q1sn3Yezt4NtOcnNNDITlStTrmV4hY7V3WDkWi+LWY1Kpk
         hRSXyFXV/T/7LFEKItyfZEg32FKPebczz4voQkiwO3JE7GfZPOFVFtXjcdLzXdlcgIZd
         PqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BEjxDmQze6EQ4PzVRaaLNekGTTeM3A4GM6iFc1co+Hs=;
        b=VrPKWstdxdtUgffjMce3lk6Bv11o9DQ0SmT7CCmqTfUqKG3rQhl1U0W1yBL8piwtrz
         45i/13Z4z143R6M440ougGFRvXUrOg90W+pUcVMRHqBJzgvATBPjaUrM3KoumTslccHL
         qkMwmCRd5eo2KU2Zdur7wvQjopuxmEKibj2o2HoaNtyMeclfhWLd000vJge0LhMPGlHV
         Ho4p7sMPY1xF8evehlXNEJto6nJRXWx3AUMNgmmgPdvSBKL9AEWcZq+tJ8vRIdNYBEgs
         KL1s0u2mnWRGg5UdtVBcvqdflqV42PVw20oReClbnsw3TF8eJrgByydnxDOatkpPf7Oy
         QRwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwZdBhIK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14-v6si2567331qtn.116.2018.05.16.15.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwZdBhIK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ5Fh-0006nr-38
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:50:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wX-0007wb-CM
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wW-0007kF-Ac
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:45 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:44469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wW-0007jg-4h
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:44 -0400
Received: by mail-pf0-x241.google.com with SMTP id q22-v6so1047896pff.11
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BEjxDmQze6EQ4PzVRaaLNekGTTeM3A4GM6iFc1co+Hs=;
	b=IwZdBhIKAwcNc90m9pcvEo7DLvIyY0zquTGlijoXyY+8eQaxnumJCduqlW4ZU5sbsQ
	DONu+RG6DSnb1w4P2RvFrQGe7zSnrzwYuKOItwEvkLcyrTZ02FnJphOF0jAoMfZSRc3c
	/337UJZabnUqlKC8i1nk7r4Gvx3buC6+cZvYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BEjxDmQze6EQ4PzVRaaLNekGTTeM3A4GM6iFc1co+Hs=;
	b=t7w+1tMha9NwlkB2wenEOlS5u5a/l1+U+ahGCnqfNDr1gkpKfQHWehr+Kas1utK1tO
	wkkzR3o2jadYHwGEzxiH0SZqBfUWie0JzbfQ3qrbfI8HSyYVQsxnaSDfmDDxF1C0U9Yr
	PEDiNITpA2+QZkl7H/jHvz57dYjLzjYBF3BrUw/WnhiiddPTi88EuldRKJodYDWS+r51
	EKqtjgjz6SIyi6O0R3wgGxLRhCOFtF3nV5Za/b9pREhK8ChHkr3mPaByZWZvI5TM76Jf
	0itvHQ+GRxZqL4EA97nhdXgL94fPlroYAJejSqR0Yf8YXXi6FpZUwg8kcKGGt0/74ULa
	LnBw==
X-Gm-Message-State: ALKqPweaRbS4qC5vxJvRemBhJRm73JRud35jVvUggDDmPoqg4GlQehlS
	YHBCjmerpwPnJkY6l8ig0/xQ9dmHOgs=
X-Received: by 2002:a65:47c8:: with SMTP id
	f8-v6mr2152625pgs.430.1526509842802; 
	Wed, 16 May 2018 15:30:42 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:30:03 -0700
Message-Id: <20180516223007.10256-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH v3-a 23/27] target/arm: Implement SVE Bitwise
 Immediate Group
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
X-TUID: zt26kQYuMcl9

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 17 +++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2a0bf6b47c..9d7c18c48d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1785,6 +1785,55 @@ static bool trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a,
     return true;
 }
 
+/*
+ *** SVE Bitwise Immediate Group
+ */
+
+static bool do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
+{
+    uint64_t imm;
+    if (!logic_imm_decode_wmask(&imm, extract32(a->dbm, 12, 1),
+                                extract32(a->dbm, 0, 6),
+                                extract32(a->dbm, 6, 6))) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(MO_64, vec_full_reg_offset(s, a->rd),
+                vec_full_reg_offset(s, a->rn), imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_AND_zzi(DisasContext *s, arg_rr_dbm *a, uint32_t insn)
+{
+    return do_zz_dbm(s, a, tcg_gen_gvec_andi);
+}
+
+static bool trans_ORR_zzi(DisasContext *s, arg_rr_dbm *a, uint32_t insn)
+{
+    return do_zz_dbm(s, a, tcg_gen_gvec_ori);
+}
+
+static bool trans_EOR_zzi(DisasContext *s, arg_rr_dbm *a, uint32_t insn)
+{
+    return do_zz_dbm(s, a, tcg_gen_gvec_xori);
+}
+
+static bool trans_DUPM(DisasContext *s, arg_DUPM *a, uint32_t insn)
+{
+    uint64_t imm;
+    if (!logic_imm_decode_wmask(&imm, extract32(a->dbm, 12, 1),
+                                extract32(a->dbm, 0, 6),
+                                extract32(a->dbm, 6, 6))) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        do_dupi_z(s, a->rd, imm);
+    }
+    return true;
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b6890d0410..a3277a0d21 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -49,6 +49,7 @@
 
 &rr_esz         rd rn esz
 &rri            rd rn imm
+&rr_dbm         rd rn dbm
 &rrri           rd rn rm imm
 &rri_esz        rd rn imm esz
 &rrr_esz        rd rn rm esz
@@ -111,6 +112,10 @@
 @rd_rn_tszimm   ........ .. ... ... ...... rn:5 rd:5 \
                 &rri_esz esz=%tszimm16_esz
 
+# Two register operand, one encoded bitmask.
+@rdn_dbm        ........ .. .... dbm:13 rd:5 \
+                &rr_dbm rn=%reg_movprfx
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9       ........ ........ ...... rn:5 . rd:4    \
                 &rri imm=%imm9_16_10
@@ -330,6 +335,18 @@ INCDEC_v        00000100 .. 1 1 .... 1100 0 d:1 ..... .....    @incdec2_cnt u=1
 # Note these require esz != 0.
 SINCDEC_v       00000100 .. 1 0 .... 1100 d:1 u:1 ..... .....   @incdec2_cnt
 
+### SVE Bitwise Immediate Group
+
+# SVE bitwise logical with immediate (unpredicated)
+ORR_zzi         00000101 00 0000 ............. .....            @rdn_dbm
+EOR_zzi         00000101 01 0000 ............. .....            @rdn_dbm
+AND_zzi         00000101 10 0000 ............. .....            @rdn_dbm
+
+# SVE broadcast bitmask immediate
+DUPM            00000101 11 0000 dbm:13 rd:5
+
+### SVE Predicate Logical Operations Group
+
 # SVE predicate logical operations
 AND_pppp        00100101 0. 00 .... 01 .... 0 .... 0 ....       @pd_pg_pn_pm_s
 BIC_pppp        00100101 0. 00 .... 01 .... 0 .... 1 ....       @pd_pg_pn_pm_s
-- 
2.17.0

