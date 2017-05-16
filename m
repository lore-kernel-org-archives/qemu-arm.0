Received: by 10.25.0.6 with SMTP id 6csp2084816lfa;
        Tue, 16 May 2017 16:06:05 -0700 (PDT)
X-Received: by 10.55.156.11 with SMTP id f11mr447528qke.8.1494975965651;
        Tue, 16 May 2017 16:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494975965; cv=none;
        d=google.com; s=arc-20160816;
        b=xuLz9hpSevNL/ebUQD4SjyWEoog4L6N7dOxgLPbSZFcZXHAyhh2YbSUbpPtr57go11
         khJtzD41gzvYuWmyb3ktyZspG350ji+tLStyv0BN1u8tmgETR7ZUlp/8611ZZhzoR8iV
         PSubhRC40e+KhLyhBwEj8BYY7rCLuCYS0GzLAOupQiesMLlNGArZJpyVpE4sxNl+hdpY
         Df0gWQZzD3SoELU78xQfiQJgFaRLPeBNoKbCd0od9CorCV2Xtp/DUuzBW+Kv9LIx4Scx
         GO5VbZml6GvykvBckO2Qwu0lZlStcXoe/CuJBMnLNGR4SgCuC7SxAqxbm2z671Bqgngk
         dMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JwlHWtoa3ozRL+FRj8fx6VfFjhaSXjDiFPiP3DjHZxI=;
        b=xF4HBsDkV6+JRIO7Td041UtW/nPO66xXumOa/Y2kfOnPvLmiir1Itp1SJtVWZZkPNB
         uf2f4FiQ2EwT+bRkqgNF0Ul2c2MVbdrEC10LBp3se8dT1/e2uNFnUGIQTPm7QcJMmJJ1
         OpzpV95mfIS3M7gNDD7PBH5at0oa5BVCFR/22Of1kUjOfi019t71G0OCGtDDq0n0jcnJ
         UaG5W1IZZpcKKciLv/zhym2E3EKdNajGmdDsBFgSWxCU0FsDnbuUt4H6BmhhrzR9J1HH
         gUr34oYPjK0dwSk/+pv2JLbPv6OCYWCKoRH6/i+7Pit/WPA4GfdxEyT7WzsgeX4RWRoS
         Kk4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44si237255qtx.185.2017.05.16.16.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 16:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAlXZ-00029u-3b
	for alex.bennee@linaro.org; Tue, 16 May 2017 19:06:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1dAlTs-00081B-2v
	for qemu-arm@nongnu.org; Tue, 16 May 2017 19:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1dAlTr-0002fd-79
	for qemu-arm@nongnu.org; Tue, 16 May 2017 19:02:16 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:45190)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1dAlTn-0002dA-35; Tue, 16 May 2017 19:02:11 -0400
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dAlTk-00021L-C0; Wed, 17 May 2017 01:02:08 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dAlTj-00022A-Ja; Wed, 17 May 2017 01:02:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: qemu-devel@nongnu.org
Date: Wed, 17 May 2017 01:01:57 +0200
Message-Id: <20170516230159.4195-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170516230159.4195-1-aurelien@aurel32.net>
References: <20170516230159.4195-1-aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: [Qemu-arm] [PATCH 2/4] target/arm: simplify and optimize aarch64
 rev16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CuZvGDdxRVDD

Instead of byteswapping individual 16-bit words one by one, work on the
whole register at the same time using shifts and mask. This is the same
strategy than the aarch32 version of rev16 and is much more efficient
in the case sf=1.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 target/arm/translate-a64.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 24de30d92c..ed15d21655 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4035,24 +4035,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
     TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
 
-    tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
-    tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
-
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
-    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
-    tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
-    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
-
-    if (sf) {
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
-        tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
-
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 48);
-        tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 48, 16);
-    }
+    TCGv mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
+    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
+    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
+    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
+    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
+    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
 
     tcg_temp_free_i64(tcg_tmp);
 }
-- 
2.11.0

