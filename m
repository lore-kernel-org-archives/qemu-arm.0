Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp213452wme;
        Wed, 16 May 2018 15:48:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo49MTXUNyVmVGPPlCimagZ1gYZqqxexxxTZ24j/kyDFS0+8r0JdJMUr84hggxlcL03mxN3
X-Received: by 2002:a37:ac13:: with SMTP id e19-v6mr2891961qkm.289.1526510886416;
        Wed, 16 May 2018 15:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510886; cv=none;
        d=google.com; s=arc-20160816;
        b=f+3uVgx6OUNTGvTaonzSstixoD3AVkMRCtOhFJ2dKbOv/HutQWn5iEgjE9Tccr4NNF
         m5a9yOwF4idfQYPmjnl3+6sNkiEX3dtdjCU+KvlHD2XUD8jB5DghwkllAHIDVOKDTw3h
         8nZ0sE47j20lWjbeJLpmQNjG1wJcfvX7Au24xjKVAlPUPq6e2sug6bEHs//8Qt6vuNtV
         0WngLf8Leaoo63YuqTwNFhpqzVcvsp8FuMAuU/R2dgwqFTsKGzN517+rbAk+ey99h+Yw
         rcPbb4qj41F1kgJdepmfrNUL3c5PBa/2A3/wg7lwJxN4McgcAz8V2jeMpBj9vBcWoZYn
         SONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aEw+icNHDVvyjfO6zFShh6ZmP/DNMAOE4EL6agkNtMo=;
        b=sXsniovXwPpFB6VzDC2ffqu7KC1w6rrvSeTwcxEWWCagl8pbBPES0zeF6V/IVm6YUV
         1AwKH+LbHUsKJUnFn+1CMQ3zzfahEDhsaZrqMlAf9PfvdFFmNTobPUjVv0ks02fFA5vS
         sPGLyyzAHFHXQwsImTkPGy2NfdjZzjmX4K8SKpmw3b5Uagx/iu5kOb7zlMCYzWRDhz7F
         lzP9BeDIVRQhQpHrylFSULoMFm16xe2698r9yQ3id6PCqdj5P9t5nsgKF3Ym/i2/9HNm
         7QahT2Iaapo5/1IwVu+Jb1trpRi/Y8B6L9DAL1uEvmadAWciJFDjHwKAfNLO8EJJ+StD
         MqxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WCkNwAl+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21-v6si3869545qte.118.2018.05.16.15.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WCkNwAl+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ5DJ-0004Pj-L6
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:48:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wL-0007kO-TL
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wK-0007Wk-Sa
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:33 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:40157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wK-0007W7-HN
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:32 -0400
Received: by mail-pl0-x241.google.com with SMTP id t12-v6so1244645plo.7
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aEw+icNHDVvyjfO6zFShh6ZmP/DNMAOE4EL6agkNtMo=;
	b=WCkNwAl+4oo1DRZ7cbZ+3ss+BBw1DSNNjctGX9npqcFZKhN3Z+e/9+4cFyfV1TOmBv
	DH4m1HGFbtjLjKeCdROGe/R4QsjFShf/WK03VTzhqnrZovOjWXJ7VBYdXsAEqv1H1lvS
	ITc2evKEnlk8bG9Lhw0uxKmAAgtsCY0+fR1Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aEw+icNHDVvyjfO6zFShh6ZmP/DNMAOE4EL6agkNtMo=;
	b=tjOCyHIchm7DVEj6/SvsLHfk2tZsRgWhTUZukZqFniURCk8ryufaYSJKnQEkrL9rrC
	D6fEetE9AvPU/xcl8O/RwfhsSibgF9vHVkDTOGO4mkIxfysJJRcCyOxzqbcEljp+O0w+
	F1qG+CWuQd3arenJ/aIF7z1Iub5QvcZVRIt7g5k0y262ohBowKaxnl19iaRlGiCc3dJZ
	BxzbzgfSRJXKBPuZyFL1lxOq/o9Rde4jGjkOwd+DaD63EEk9J51ka2tbhaOeKWbQkocP
	xU2Ml2M+zAeRt1W9moIMZu++jQ1W16G83Tn4OJe/zuckR8EkxpBbq9+TnO2CYuY8WqTg
	J4UQ==
X-Gm-Message-State: ALKqPwe1+0s3S7l02y3m9KApj92IS30dy92mJp7+D+rPkqq7qbxH+D/D
	KCJeCe0li7gyxteCxcP4VUyPVw/PTKc=
X-Received: by 2002:a17:902:710f:: with SMTP id
	a15-v6mr2758561pll.171.1526509831287; 
	Wed, 16 May 2018 15:30:31 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:55 -0700
Message-Id: <20180516223007.10256-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH v3-a 15/27] target/arm: Implement SVE Integer
 Arithmetic - Unpredicated Group
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
X-TUID: 5LJ3cgmfFWsV

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 13 +++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f14bb2196a..d9c4118d46 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -251,6 +251,40 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
     return do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
 }
 
+/*
+ *** SVE Integer Arithmetic - Unpredicated Group
+ */
+
+static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_add, a->esz, a->rd, a->rn, a->rm);
+}
+
+static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_sub, a->esz, a->rd, a->rn, a->rm);
+}
+
+static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_ssadd, a->esz, a->rd, a->rn, a->rm);
+}
+
+static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_sssub, a->esz, a->rd, a->rn, a->rm);
+}
+
+static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_usadd, a->esz, a->rd, a->rn, a->rm);
+}
+
+static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    return do_vector3_z(s, tcg_gen_gvec_ussub, a->esz, a->rd, a->rn, a->rm);
+}
+
 /*
  *** SVE Integer Arithmetic - Binary Predicated Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5e4335b2ae..58d59c7b77 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -66,6 +66,9 @@
 # Three predicate operand, with governing predicate, flag setting
 @pd_pg_pn_pm_s  ........ . s:1 .. rm:4 .. pg:4 . rn:4 . rd:4    &rprr_s
 
+# Three operand, vector element size
+@rd_rn_rm       ........ esz:2 . rm:5 ... ... rn:5 rd:5         &rrr_esz
+
 # Two register operand, with governing predicate, vector element size
 @rdn_pg_rm      ........ esz:2 ... ... ... pg:3 rm:5 rd:5 \
                 &rprr_esz rn=%reg_movprfx
@@ -203,6 +206,16 @@ MLS             00000100 .. 0 ..... 011 ... ..... .....   @rda_pg_rn_rm
 MLA             00000100 .. 0 ..... 110 ... ..... .....   @rdn_pg_ra_rm # MAD
 MLS             00000100 .. 0 ..... 111 ... ..... .....   @rdn_pg_ra_rm # MSB
 
+### SVE Integer Arithmetic - Unpredicated Group
+
+# SVE integer add/subtract vectors (unpredicated)
+ADD_zzz         00000100 .. 1 ..... 000 000 ..... .....         @rd_rn_rm
+SUB_zzz         00000100 .. 1 ..... 000 001 ..... .....         @rd_rn_rm
+SQADD_zzz       00000100 .. 1 ..... 000 100 ..... .....         @rd_rn_rm
+UQADD_zzz       00000100 .. 1 ..... 000 101 ..... .....         @rd_rn_rm
+SQSUB_zzz       00000100 .. 1 ..... 000 110 ..... .....         @rd_rn_rm
+UQSUB_zzz       00000100 .. 1 ..... 000 111 ..... .....         @rd_rn_rm
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.17.0

