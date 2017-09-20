Received: by 10.223.172.38 with SMTP id v35csp121117wrc;
        Tue, 19 Sep 2017 17:49:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC/LlzVd+v8cEyDKFN00OSW8WUNZUwksUyMCI5WNMeWD7zdcLq5SQjgNqnBG5sQEXnlOerj
X-Received: by 10.200.6.144 with SMTP id f16mr4864997qth.32.1505868551575;
        Tue, 19 Sep 2017 17:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505868551; cv=none;
        d=google.com; s=arc-20160816;
        b=dJz3+tWt4zp3s3g8fy1jXG3I+10hA4ko7sneq954ubwm43fIITh3I042S2gV9cdN1F
         U0w580KtRDL8po+mRrcaDPMSN0bkdSiVEKfzOrfytnH1dbNWTWJGNJyajBdHaZ7ExTQv
         9qM1okZr8Qu7az8jqpXuxtXV5R0I0uhsJK2zyvIQpCljqktM4BKK+ZnqBk2Sk+Ew2p5d
         XwFSsGfy6LwQjCUkJsQ5xR3/6D77lzXO7nLE7ESDMfVJ2YvfxXLmx5HWDiwxT4QvZzfa
         ZMh1iqKaZ+r4kHcO84QumEUAD2SqojfELsOo/v8hlAYY5pJRarGzMh9hRRNaWgBmJHcW
         SkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:references
         :in-reply-to:date:to:from:arc-authentication-results;
        bh=4uU4qHK9ro1AQAGAMzKwt+IrJDca5NhS3dzs6x0n0zs=;
        b=Gs1BIbspbxNXfm4iSCMGQM9QWAKcPdnOfajDsVk0pyT9dysAzJZCSFo4ciLk8fYTBj
         HVbcUJMFgpHkeXlXw/cJu6gp1Q7qpn9jN9yvkd+hecr4ffYM77osnWS908lhNmfzcLnE
         bVGWlvwAQs30t9dbTvCzwh4lgVUiUUb+v9TOoma1LEpaPJAlQ7YvYVKw/1zhXSDGVovZ
         M83BsucbjKaj3dk4kKq+nhEphU/cIf4zVLdfqIIq73eA4brGCysFPDk0UjyAtrMKTnec
         901sPOTWIsNf1ZE/A8NB9wBWnCLY4I+fUoqc5J6Vzgx1Y/5jLwhnlaV2CrtJMh/67XGt
         hJUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j64si625647qtb.334.2017.09.19.17.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 17:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:46033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duTCP-0006Op-7p
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 20:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1duT9Y-0004R8-2T
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 20:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1duT9O-0005dm-FL
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 20:46:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55284
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1duT9O-0005d4-1Y
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 20:46:02 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8K0hblp139549
	for <qemu-devel@nongnu.org>; Tue, 19 Sep 2017 20:46:01 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2d39xyvars-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 19 Sep 2017 20:46:01 -0400
Received: from localhost
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Tue, 19 Sep 2017 18:46:00 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 19 Sep 2017 18:45:58 -0600
Received: from b03ledav005.gho.boulder.ibm.com
	(b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v8K0jvFA63438930; Tue, 19 Sep 2017 17:45:57 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85960BE039;
	Tue, 19 Sep 2017 18:45:57 -0600 (MDT)
Received: from localhost (unknown [9.80.107.19])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 4A68BBE038; 
	Tue, 19 Sep 2017 18:45:57 -0600 (MDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 19 Sep 2017 19:45:12 -0500
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170920004521.9417-1-mdroth@linux.vnet.ibm.com>
References: <20170920004521.9417-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17092000-0004-0000-0000-000012F283D4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007765; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000230; SDB=6.00919510; UDB=6.00461960;
	IPR=6.00699736; 
	BA=6.00005598; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017216;
	XFM=3.00000015; UTC=2017-09-20 00:45:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092000-0005-0000-0000-00008428A8EC
Message-Id: <20170920004521.9417-4-mdroth@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=3
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1709200008
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 03/12] target/arm: Fix aa64 ldp register
 writeback
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u+3E5g1mSYrB

From: Richard Henderson <richard.henderson@linaro.org>

For "ldp x0, x1, [x0]", if the second load is on a second page and
the second page is unmapped, the exception would be raised with x0
already modified.  This means the instruction couldn't be restarted.

Cc: qemu-arm@nongnu.org
Cc: qemu-stable@nongnu.org
Reported-by: Andrew <andrew@fubar.geek.nz>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20170825224833.4463-1-richard.henderson@linaro.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1713066
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMM: tweaked comment format]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

(cherry picked from commit 3e4d91b94ce400326fae0850578d9e9f30a71adb)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/arm/translate-a64.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2200e25be0..cb44632d16 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2217,29 +2217,34 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         } else {
             do_fp_st(s, rt, tcg_addr, size);
         }
-    } else {
-        TCGv_i64 tcg_rt = cpu_reg(s, rt);
-        if (is_load) {
-            do_gpr_ld(s, tcg_rt, tcg_addr, size, is_signed, false,
-                      false, 0, false, false);
-        } else {
-            do_gpr_st(s, tcg_rt, tcg_addr, size,
-                      false, 0, false, false);
-        }
-    }
-    tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
-    if (is_vector) {
+        tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
         if (is_load) {
             do_fp_ld(s, rt2, tcg_addr, size);
         } else {
             do_fp_st(s, rt2, tcg_addr, size);
         }
     } else {
+        TCGv_i64 tcg_rt = cpu_reg(s, rt);
         TCGv_i64 tcg_rt2 = cpu_reg(s, rt2);
+
         if (is_load) {
+            TCGv_i64 tmp = tcg_temp_new_i64();
+
+            /* Do not modify tcg_rt before recognizing any exception
+             * from the second load.
+             */
+            do_gpr_ld(s, tmp, tcg_addr, size, is_signed, false,
+                      false, 0, false, false);
+            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
             do_gpr_ld(s, tcg_rt2, tcg_addr, size, is_signed, false,
                       false, 0, false, false);
+
+            tcg_gen_mov_i64(tcg_rt, tmp);
+            tcg_temp_free_i64(tmp);
         } else {
+            do_gpr_st(s, tcg_rt, tcg_addr, size,
+                      false, 0, false, false);
+            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
             do_gpr_st(s, tcg_rt2, tcg_addr, size,
                       false, 0, false, false);
         }
-- 
2.11.0

