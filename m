Received: by 10.28.4.212 with SMTP id 203csp1221847wme;
        Wed, 2 May 2018 15:19:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr/6sCZg1o/cuwZOlTiSpZVRbJt8VjzzmCyGD8ESzHMBvdse92J9bsBSBDnmgUl3nIx4smI
X-Received: by 2002:ac8:186f:: with SMTP id n44-v6mr16624908qtk.241.1525299544922;
        Wed, 02 May 2018 15:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299544; cv=none;
        d=google.com; s=arc-20160816;
        b=EGrxT1kItOJHYKWZi2q7swlQPW6P8EdKU7n12HkTXY6YqDY5DkFUndhyEN3vkcsr85
         Vo0w1xXVzf9AbG7WSJ5PSB84OdiUQPIzGlj0MCvRRQ+VwZFjN17RAj8GkwLdHQySWKEE
         D+9dOGE5KnUTZpCrozXZioBLSVbNo91rVIc6i7FYH9F01cMGOgy9xqrLjwZhGFpw2y4+
         LXIsFMM4jc/1FgewgjGM1Z/QJyCB2S/JK5Py1YW0gebq06ZyhZu89FgpuqaPdQRX3nVb
         7LsNS/8PzgEARDIe/gybXDD7MmdjsYuL1aIFmt8LCADm3u4qpiybehFZ6UCRIvEXLEo6
         73sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HhI4bpwSZ0GekzoXGS7KrVmo2AaxCWuHnRf4OdGfNGI=;
        b=wWdY9qMW4OsUAkAN0YMy+nFDuSc9t1WukF2zlrcKq7q/wIJRj8TnpQyzWAEAo61jOb
         UkC+1dsF5wFxdE5pAeoq0qik0rCQR4FVVdoQ9gFHXZbSJbT2Dv3Wq0EpWF6r8xHS7AcS
         id0YJpqj9GCoIP7tBdXBeyWjOG1FX44IZs+BFT+OzaGJtVokT2kP1x+pMkgikYj0ZI39
         LEXlJxqSv3fIRjQMJXVXDeAnHAWNy7y37EdXuY0G9Vyz2ZSyZP1LMjwL6Qwy0Mu8SxpE
         LOQ34eGjnhCHViSi7AohiKyevKwVP+L9mr96r0rKLKHiRZFD9ahXDEj8agUuekLAdi/p
         l2sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aLbn7kyN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w25-v6si6075117qth.172.2018.05.02.15.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 15:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aLbn7kyN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE05Y-0002E4-EQ
	for alex.bennee@linaro.org; Wed, 02 May 2018 18:19:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02c-0000ce-72
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fE02b-0007sK-E5
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:02 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:44364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fE02b-0007rp-6O
	for qemu-devel@nongnu.org; Wed, 02 May 2018 18:16:01 -0400
Received: by mail-pf0-x244.google.com with SMTP id q22so12956834pff.11
	for <qemu-devel@nongnu.org>; Wed, 02 May 2018 15:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HhI4bpwSZ0GekzoXGS7KrVmo2AaxCWuHnRf4OdGfNGI=;
	b=aLbn7kyNaVYO6PcXgcDlLp/AMICfWsnLrkXRzWDxvJP94iSkylV2LbSZFyZbNpE4fW
	YjAxP/tb4gL2/pDTJbTX0dj8CgoL0goLcZiE4HE0r5w8qFCjrkMbQGk2axs8qR/+4Gxx
	burI5cI/MmqTzzBmyzQwiNge+q+HCShadKwHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HhI4bpwSZ0GekzoXGS7KrVmo2AaxCWuHnRf4OdGfNGI=;
	b=cm+TUSWw+QOVWVkEWzQtsjmmjkiXxja0kXxnKE24IztvS6H5bnll13TOULt+KWOIlL
	kLBVqjJOzUXDy3PQnP84EIta80uxh8GMiouX00ASzCl7PmI99GsfzqP7H7ncS4xkYpsQ
	eQEq9CaXE6uyE/H4XdclGmXFSdahwVr3QXaeJN26tEbRDjeCin8cT9MV5j2Yp69VUN5o
	NNjq+utQcDz/LR/8Ttj1mSJjAvS8dFV0mxx2Eo7QULOxR95EPJPZcCYxF91ESvaRaa0b
	ULrT+3H5TyYL4WnSxfLeVxsYXNTrERoT5DvvTGa9mLPmn4BC0ACo2lMqWgozrCEIRv/a
	uMVA==
X-Gm-Message-State: ALQs6tC2XgRReU3mY1iGx7blADzeWNMIQye8M8IjFlM6MJPJdeE14zuj
	ao6HCRdvmlLHBgWvEEo38KtHlXejg1M=
X-Received: by 10.98.72.29 with SMTP id v29mr15252295pfa.57.1525299359937;
	Wed, 02 May 2018 15:15:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	65sm26170145pft.74.2018.05.02.15.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 15:15:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2018 15:15:42 -0700
Message-Id: <20180502221552.3873-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH v2 04/14] target/arm: Clear SVE high bits for
 FMOV
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RIFlh07vc6ve

Use write_fp_dreg and clear_vec_high to zero the bits
that need zeroing for these cases.

Cc: qemu-stable@nongnu.org
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7021a31b89..c64c3ed99d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5444,31 +5444,24 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
 
     if (itof) {
         TCGv_i64 tcg_rn = cpu_reg(s, rn);
+        TCGv_i64 tmp;
 
         switch (type) {
         case 0:
-        {
             /* 32 bit */
-            TCGv_i64 tmp = tcg_temp_new_i64();
+            tmp = tcg_temp_new_i64();
             tcg_gen_ext32u_i64(tmp, tcg_rn);
-            tcg_gen_st_i64(tmp, cpu_env, fp_reg_offset(s, rd, MO_64));
-            tcg_gen_movi_i64(tmp, 0);
-            tcg_gen_st_i64(tmp, cpu_env, fp_reg_hi_offset(s, rd));
+            write_fp_dreg(s, rd, tmp);
             tcg_temp_free_i64(tmp);
             break;
-        }
         case 1:
-        {
             /* 64 bit */
-            TCGv_i64 tmp = tcg_const_i64(0);
-            tcg_gen_st_i64(tcg_rn, cpu_env, fp_reg_offset(s, rd, MO_64));
-            tcg_gen_st_i64(tmp, cpu_env, fp_reg_hi_offset(s, rd));
-            tcg_temp_free_i64(tmp);
+            write_fp_dreg(s, rd, tcg_rn);
             break;
-        }
         case 2:
             /* 64 bit to top half. */
             tcg_gen_st_i64(tcg_rn, cpu_env, fp_reg_hi_offset(s, rd));
+            clear_vec_high(s, true, rd);
             break;
         }
     } else {
-- 
2.14.3

