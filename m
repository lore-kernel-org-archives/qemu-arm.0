Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B7A606A320
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Nov 2026 22:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbUXQZ/o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aNJnebXb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUANm-00063C-1D; Thu, 19 Nov 2026 17:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUANk-00062K-8c
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:13:28 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUANi-0006vI-GG
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:13:28 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJJ1OsP3814575
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=7vTf0EdFSHNu35rC/vRh1h
 LTVxrNw0yeljN5TDsRsYA=; b=DbUXQZ/otyKpiQcds2YGmd4HGjPvXznM1UrptZ
 D0ZGuxG1I/SieJ77tU/Xt9ZAIiXRTbAzRCqbqd2PrIwAN2OqnPdjq/zzpVZUH+8i
 kCEJ2Ujc14ESH6zLacHr+0rXyE6BH5mgLNF3Sf16tv/tY8ETBnzTwRJX7RiKMc5a
 e482+1wXNRdlfc4ZSi7Fo6RBhBynaJ+3Gby9tTeMJi1WSWXrOzEmtgXz9Gciwcim
 0u7wgpkmRuAcced75RQWmA/+HVFl2SOA2PD34S37qUlc93pgbPxdzHwtj7YLXUag
 //5qYbANq/GBFFvgY0cS6Tr26KwgFFgn1gsyIVnvBRmakC0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6ukmr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:13:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-94961511b61so53678985a.3
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 14:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795126404; x=1795731204; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7vTf0EdFSHNu35rC/vRh1hLTVxrNw0yeljN5TDsRsYA=;
 b=aNJnebXbaMYA6ZeKQQGC1rXK1PfXvEr/CEk2EGB90lr1g1pmBBh7QMUV08Lw7LMNuU
 dOQ61p27K1TlatM33vKwaikiT1YXt1vd31ehTpht/2owFP/ituJO/MPG/yh7wBhX4BII
 rmz9rWdvbvUZIW7Cj/BSTFlaJUFQLVdaxMRpzN592zpWAcjIRtfTgpSZOti+yi7dvhin
 VY/CTv7YZyLlstvRur4K53gXp+MSTZbPw6h5fdDIYaYLulH+KZeg6EGb4V6NX1aoJj7m
 XADtrvYXWO3b5wsAzHHedAubflUTMTN3sYEtPPIhKr8yaA4cgNvEBNSRS0U4PUlU7Amk
 VYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795126404; x=1795731204;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7vTf0EdFSHNu35rC/vRh1hLTVxrNw0yeljN5TDsRsYA=;
 b=nDudySxxdsDCQqU5zV8zbcE/8udy8UrN06CqDkPhArcPNgNWumhI+AncHQEACFAMe+
 8VAEzCdaXQlPq9eiygRUX4jCQynOTXALcUJCkt7eqxhL2W6K9CprJCWrG6a+uTuyrDQm
 lw4CB25PH1m/kmFGhb6kOjIvpuWgV28QrjbPbYqzhvndWbyQxlsQkUdFGpQ3eDNqyhYn
 VzPIhicR5xoQ4E3Ge6/s4Kto82hwyhsS4XfR8x4mAIdGlk1MFnqSoJXgfsijYfrsskSF
 PGvIx9WjKzuaMXD/XSQJUW7LFbxjfWf+8rjoXyDg0mwLl8WM/SBky09hWyDeJyGddGsh
 PKAw==
X-Forwarded-Encrypted: i=1;
 AL+hErEJ1wvA2pV9bXGPQ8l/icL87hZFVSw/zqWzKe2/UYmNSidEIVdUWmM1yJDnzwuDkZsQ5qJl+MN30Q==@nongnu.org
X-Gm-Message-State: APuU4Z+AxLDbGI6K+3PqZiIsF7+Rn0vFT3TrUvRj89CBdyna2o5LFzt4
 Zr2g4RZmZcapRUCfGE1zV9Fmw8SOgh1AWzHmehh2ar5rRxfwN0AgRk8W8Xha4+fvHN6g3CRcOFk
 7aaxDIFUbD4kMeNRdVZUcD7c/67KENJXzwj3/4e9qgViisF4MR6V0qhSovgvZkfEDcQ==
X-Gm-Gg: AYBFou0WDOjepGcFJqhAA7nlk4uoZWZ4OwxkIivrewgw7pxaho0y1MS0cplPvKM8w+0
 T1K8AZ/BgqN98yQXtStxMCEeb0CJvKC91t3sqRx1aspJgJYMFgQGCiZubn+Wl5/8DaNKn55CpwZ
 itR/98K977Vey9T/6tRhof4GvkvRhpc7scflr6RtLuaVVnEE28nOSOBJ8YQ0KmyBCv7lcHjim/6
 SRpW76HodObi56qVpk4baO9ultmZfFS4ftvWrATr7pkxH0ovHyyowl3GMm9dYEvfizJGpgJPL1x
 d7MKf2iSdUS9dko1B2tZwNrYYqw/z7moyPUw56yWCggWP+TIn9xkv124Y4IFOIiJiMGyOQbHxPN
 4vLRdnrTI1UjZgTy2rDvrrTzFFwCTVZ4vGd1b7WZ23Fe+Avf8hYQUBhdqU6LPfbUGPcbJbXHPwN
 Poa4/aa0UXWfi0yA==
X-Received: by 2002:a05:620a:3715:b0:949:a139:2f2a with SMTP id
 af79cd13be357-949ba7ccbe4mr186709185a.9.1795126403955; 
 Thu, 19 Nov 2026 14:13:23 -0800 (PST)
X-Received: by 2002:a05:620a:3715:b0:949:a139:2f2a with SMTP id
 af79cd13be357-949ba7ccbe4mr186705785a.9.1795126403529; 
 Thu, 19 Nov 2026 14:13:23 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm67830285e9.8.2026.11.19.14.13.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Nov 2026 14:13:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH] target/arm: Include the overflowing event in PMU timer delays
Date: Thu, 19 Nov 2026 23:13:21 +0100
Message-ID: <20261119221321.62258-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aff7484 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dubOzblNFW-RsgxzQYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA4OSBTYWx0ZWRfXwwWVd9RjwQ/W
 1xbvqKbsErH1a30IzI7AYi3R+16N7j5i0DKOgA1JfPm+bqk7rwFgQY34tK5niCFPrpALC8Uu+6l
 R2TVxkSuahKVxbqhXN0bNSoAFT0OvpSM++6vj9CJresKYGMYWPLx9cHihu6N2CTp9+mJT7xHDcG
 6KWK3Y0ucRu+U93M21p5I0clHsMx2UtYLTQrm3mLb9vLzOcrJYkao830tEzQEEWk69iYiy4P0rG
 CjA1kT+EVpPJD8OnwMw0asey/b36t/6/oFfyUegY4YuJaG1YUuLrUs9LnAWFNa78H21F7kWVgk7
 TxphuOkunavJfwGC+W6YZd9UKhMaa7dVmIs3znn4xQ9AFXLmzUZKd5l2n+lSIiNOPpV1lV9byum
 skgK9uHc7b1zZ+nQ1Q/7nrSCKAjeRZJ/YZX3SKtB31mluBM6TYMu9zG72MDO+txpzf5Q7SaFTIS
 x2sKgbHCtdohTgh5jKw==
X-Proofpoint-ORIG-GUID: on5KbyNgILXUHMbCJjNIExIhb6TqoSrO
X-Proofpoint-GUID: on5KbyNgILXUHMbCJjNIExIhb6TqoSrO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA4OSBTYWx0ZWRfX/oSkejeUyPLY
 607EIh15i+gSxuFgX4RguoRSc2iAPjHkTUuogLUBqeD0ZSTGyBIzC5YjvM24wa11D13e3jgAziD
 509R9DlIuGajlX3tfJRxEHLV06e5pOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190089
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pmevcntr_op_finish() passes the number of events remaining minus
one. When it reaches zero, the instruction event converts that to
a zero delay and no timer is armed. Add the overflowing event to
avoid the last event leaving the PMU interrupt pending forever.

Fixes: 4e7beb0cc0f3 ("target/arm: Add a timer to predict PMU counter overflow")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpregs-pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpregs-pmu.c b/target/arm/cpregs-pmu.c
index 46df6597b1ab..9e27c38f855f 100644
--- a/target/arm/cpregs-pmu.c
+++ b/target/arm/cpregs-pmu.c
@@ -106,7 +106,12 @@ static uint64_t instructions_get_count(CPUARMState *env)
 static int64_t instructions_ns_per(uint64_t icount)
 {
     assert(icount_enabled() == ICOUNT_PRECISE);
-    return icount_to_ns((int64_t)icount);
+    /*
+     * The caller passes the events left minus one, and a zero result is
+     * not armed: with a timer due exactly when the count is reached, the
+     * last event would raise no interrupt.  Wait for the overflowing one.
+     */
+    return icount_to_ns((int64_t)(icount + (icount != UINT64_MAX)));
 }
 #endif
 
-- 
2.55.0


