Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5029001wre;
        Wed, 30 May 2018 11:11:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJxLOY9W+2jzKveikuUp52it+Flkc3cQfZSt7xVRs1kSpiUYycZa0z1P7c9Jtt/KsOWQUYs
X-Received: by 2002:a37:ae47:: with SMTP id x68-v6mr1860848qke.315.1527703897750;
        Wed, 30 May 2018 11:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703897; cv=none;
        d=google.com; s=arc-20160816;
        b=rxbTx5VoHANqGTpRK6QPVe78IpegISGFhUrr0dFlByx28qugfYjJg8lt48Xv69xsb/
         DL2wIvi2APFVxtIhAs2itvd+8qEwMBmSa5O3tEPkhFrC3mb2vVCwA7mzvAQWI0hH971M
         bYxggrG9E8yFMz8xn15AN+85mEzYDk9P3TtVdQ+oboY+NLcPe8bEp+4lSSRVpMV9S3N1
         nYFvX9wLYoC4mybJojody8GnLDITHPggi/gNjTcqUPs4ZCHgDbMVocZb5J4devnRqpWy
         0NNHEHOJQ9LWWJuoZR8gNO0/S7JrJYPIRVO/+BuHZf5qMe7XZSjVj8XDYjcCUzXwDN2L
         27Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TxLQPQ03rX5hBDGAZo1RxOuWce7FbsjPjTcpn7mZN/Q=;
        b=pD7BeS2XBKJ4/Yy+YOs4iS9Wg4J3Jhaj4NYZ1OTpZEaxqNJLv2a0I17Lb+NrNRA5Ak
         D1pXqWzaIS4MgXMJ7f2f8DruiqCm5AcIaFCBRi0LuKzBSNflX5koFcVApefxUliLrrui
         /w9WcpGaJfKjrBdpeJbtIsHyNaFCXrzJzpuCRsipIQmzCu5F53CbB/frf93ruMMfZwzS
         lEwq9P/qsfiKyALGsLUVeRYvDKljEbXa6pM2It1NFGHwhVhJkhaWqbJQbhK104ANlwSS
         XC+1sqclv3hwYR//Az5qm0kAs5rPQAu5BfGAQiMxMonx152H+NLPo8iVmGyuFq06Ymz3
         l9IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e5ZE+7rV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o39-v6si6630492qkh.179.2018.05.30.11.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e5ZE+7rV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5ZR-000144-6U
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pk-0001tl-CL
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pj-0004Wo-6O
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:36 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:41817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pj-0004WJ-1K
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:35 -0400
Received: by mail-pf0-x235.google.com with SMTP id v63-v6so9403242pfk.8
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TxLQPQ03rX5hBDGAZo1RxOuWce7FbsjPjTcpn7mZN/Q=;
	b=e5ZE+7rVlzrzBoalokZTuW7woB0WZWyUnpifqFOmTwXn1WhXLZiPCyBpev0rv4/rzz
	Y6BFrbTwH3qcLb7zS7jCprhWtbkWA7wUVSXcPgg6GigV2WHl82LQw7hSVtNjWrT40lwq
	R40VLpq0jRdfBCdvOqHWTj7m5QImy91XQ/pu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TxLQPQ03rX5hBDGAZo1RxOuWce7FbsjPjTcpn7mZN/Q=;
	b=EkW0VvkLbO17ai/j6R/zHsjNp4r7JPHIGEQcTvSTPeodts32WVSsaD0wQs4KSLdQIx
	pCqNpyD2zSH09FSAcmmGtkD6TECmJGrLrOJzTxRTl/EJhUR3/MmZITgDD+nVPOBa/Bjc
	lrQHJNPWVzTz5sa+EXZ4z8AufG9TREDWgazr7XG84x4KD8hiMhAQJ0jwzwZmh/gKszVI
	+QtKCKG2ZdC9pncXTF6iu1YsvsomVu8REO7E/bPQuRvEdkcjiZ3n/KwBS67T9VWX6IG2
	0MjaXp6CsDaneSU4+2n7pKkpVUUyloqSuBFplghAFatYqMvbI/euBcIUluJkX61DVubk
	NH1A==
X-Gm-Message-State: ALKqPwcrvQVSnZQA7i46/6hS8h6YxTvJ8EIXtLlaiVRSx4XWFjLtVu9Q
	+/NHzHBBQGrSjdQhbMfxWxn2pwS/Ju0=
X-Received: by 2002:a65:5546:: with SMTP id
	t6-v6mr2981260pgr.363.1527703293484; 
	Wed, 30 May 2018 11:01:33 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:09 -0700
Message-Id: <20180530180120.13355-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: [Qemu-devel] [PATCH v3b 07/18] target/arm: Implement SVE copy to
 vector (predicated)
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
X-TUID: Yl519yujY3OO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 target/arm/sve.decode      |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index edcef277f8..a6f85de358 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2614,6 +2614,25 @@ static bool trans_LASTB_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     return do_last_general(s, a, true);
 }
 
+static bool trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, cpu_reg_sp(s, a->rn));
+    }
+    return true;
+}
+
+static bool trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    if (sve_access_check(s)) {
+        int ofs = vec_reg_offset(s, a->rn, 0, a->esz);
+        TCGv_i64 t = load_esz(cpu_env, ofs, a->esz);
+        do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, t);
+        tcg_temp_free_i64(t);
+    }
+    return true;
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1226867f69..519139f684 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -450,6 +450,12 @@ LASTB_v         00000101 .. 10001 1 100 ... ..... .....         @rd_pg_rn
 LASTA_r         00000101 .. 10000 0 101 ... ..... .....         @rd_pg_rn
 LASTB_r         00000101 .. 10000 1 101 ... ..... .....         @rd_pg_rn
 
+# SVE copy element from SIMD&FP scalar register
+CPY_m_v         00000101 .. 100000 100 ... ..... .....          @rd_pg_rn
+
+# SVE copy element from general register to vector (predicated)
+CPY_m_r         00000101 .. 101000 101 ... ..... .....          @rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

