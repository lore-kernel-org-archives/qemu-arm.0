Received: by 10.28.71.27 with SMTP id u27csp2091401wma;
        Sat, 17 Feb 2018 10:55:00 -0800 (PST)
X-Google-Smtp-Source: AH8x224n9GXLeMAxdGY7VecxRfzIUsWBMfZcyQjfc86bk5ZozuH/lh9eR4+cUboDuJGJAtvX86Ei
X-Received: by 10.37.107.15 with SMTP id g15mr7180644ybc.222.1518893700578;
        Sat, 17 Feb 2018 10:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893700; cv=none;
        d=google.com; s=arc-20160816;
        b=Us5VUn1gCJNZHtyxVqZnyxe9T8Q74WKPRPx72uzFpmVFcGpfsswkzvwaejotGY5wq8
         bDhLx2ePbav9j8/bHesDdSAS5CmIAiMLH6Ik0OA3VvYzQH3803DmeHqUIxy1iTEhDari
         L8TmhyMw5Nu1l+HiVi3SUt4iEsAiOPVJEIeHFTYJlHEr1ilg+dEd/dF60hMk/SuIC7P0
         vlUUTl7Y0LiYYW7UYSUUTeRuLiQF5LrM2kzhXONJiYeVhoAZhAZ3PNdTLf37wx9oZ7h4
         EmbATVWR4M5O1z/PW7F9sHpBKkqolgRt8c3tj1jQR8byultw9Bzt+dAfkAsjwQW8u8Yw
         euKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=lsu/bLU80Lg0ZG5Cn3SeZNiZJAF3AUwvFClFldUX54I=;
        b=Lshvj66WqyUqE6YZ1hLFBIeQZFlS6Pdv/wuHb5nQHPNIw7vJuh8DV8cEMQAMnou4MG
         NcIszd+z7M/RaUX1Sile/tVCB+AygBAl0R01P2oUPI8TSRHH65kCctMR9SfvbsRKDZyg
         fkzZZaQf9YUTHxnTuTn3MZ07JYfFt0vEMo2I+UwU5PwsyPg4deRgD3/PPcTwioQ9bd1t
         WKPT04861SgCQAitc68JtWrcYSb9NKJURjRF5NqqTG81+FM0Mp6lveXxhwSjqVg/7Xt5
         TQtYx7WiCR9cd75DED7Kr8ln+YOB3EmNIYZSAx24xVny58NkmNcrzFpwF19sDayL5A5c
         HvnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g0g6bM3l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si105345ywt.803.2018.02.17.10.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g0g6bM3l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7dT-0000xl-TW
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:54:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79n-0000xj-M2
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79m-0001sG-Sp
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:19 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:35793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79m-0001s4-Mp
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:18 -0500
Received: by mail-pl0-x244.google.com with SMTP id bb3so3441070plb.2
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lsu/bLU80Lg0ZG5Cn3SeZNiZJAF3AUwvFClFldUX54I=;
	b=g0g6bM3lHcjVoeB/+79v/FLkgRaH1ZusoThyBV9eDk1WHnqLvR6fUDtpOzV6tZL1Fg
	gt7Sw0rZRd7SnRgB9h6ckJwb3xKxdMrgx/UdqopyLzKi75ly1GMPAw+Cy4DC0p19bUdg
	nyIacCpNNIJcQNheGh+u6jxP3E/yh5m2FEmbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lsu/bLU80Lg0ZG5Cn3SeZNiZJAF3AUwvFClFldUX54I=;
	b=flci0jJfwIm9WavWL61Ob6QHlqxI76cvM3oPHv993Tg1+cwb3eV4G18yy016gNZpyS
	6v8/ivk0W9u+zs5hW+IMh77teEkY3aDJFgsBvAGHY2D2tH3vhoxxIJjJJytUjGlK8q4a
	/O0k4XhSMJYG0cZZ7l9CEyeo00/38mGFyZSCbUs2BvDk2KKd8vZTG5Q5sxmwHomHnEzc
	jpKx22rKoNfBk3E6aEAQs/wIN5NAiL5AWt+i7aiZ7kWpZbPRS7v4mDjVYHgqHFa+YACq
	1CnqTBJc2JYGfVgWK8Yw8GA2YMdBhv2FMK4HAeWqHkgZaw/k2vf9Syxeb4ys8/ZsDv6S
	4jnw==
X-Gm-Message-State: APf1xPAs4UaOuH6Z7c3q8SmLVr9QyWyHoBBKXGmxgvCOQU5w8CpGMN03
	gm9WUa5qBdBc+0qpnQyQjMh7VTHafQY=
X-Received: by 2002:a17:902:9893:: with SMTP id
	s19-v6mr9286801plp.101.1518891857879; 
	Sat, 17 Feb 2018 10:24:17 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:48 -0800
Message-Id: <20180217182323.25885-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 32/67] target/arm: Implement SVE copy to
 vector (predicated)
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4sRUUNY8a9JX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 13 +++++++++++++
 target/arm/sve.decode      |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 207a22a0bc..fc2a295ab7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2422,6 +2422,19 @@ static void trans_LASTB_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     do_last_general(s, a, true);
 }
 
+static void trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, cpu_reg_sp(s, a->rn));
+}
+
+static void trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    int ofs = vec_reg_offset(s, a->rn, 0, a->esz);
+    TCGv_i64 t = load_esz(cpu_env, ofs, a->esz);
+    do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, t);
+    tcg_temp_free_i64(t);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1370802c12..5e127de88c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -451,6 +451,12 @@ LASTB_v		00000101 .. 10001 1 100 ... ..... .....		@rd_pg_rn
 LASTA_r		00000101 .. 10000 0 101 ... ..... .....		@rd_pg_rn
 LASTB_r		00000101 .. 10000 1 101 ... ..... .....		@rd_pg_rn
 
+# SVE copy element from SIMD&FP scalar register
+CPY_m_v		00000101 .. 100000 100 ... ..... .....		@rd_pg_rn
+
+# SVE copy element from general register to vector (predicated)
+CPY_m_r		00000101 .. 101000 101 ... ..... .....		@rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

