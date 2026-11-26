Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3550606A327
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MR0fktjx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EirbH8kG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWi8c-0007Ih-1w; Thu, 26 Nov 2026 17:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWi8a-0007EV-Fj
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 17:40:20 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWi8Y-0001JE-Q6
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 17:40:20 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw6WE781812
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 22:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f9WDtWtBeo94ep8Aj19VaL1/nZ7SEVEBE2xVCDh3ihA=; b=MR0fktjxl17nfZ+L
 5fv1RDv0aivWSX1FjGAGFOV1tQCG6gv/LrHeWH7rgtE3LZ+NfUHEU5FJlc41UhCK
 IiwPMm/3VlSgDnzbtjkMGUwahVUbl+UoZAoJD8Mp2xRjpAkfd1kSEA+scuf9KKFe
 n52QBkWY7R1PKys3cHP6vyxVliDORhMQvPCUCAQYmK/ajtH90hxC69HSRj923RTP
 3I7op7af6x8JGNViVimjGuYYlD3gxB64YOsZyrOHQQhahqVPZuiVU0yVae5Nz0+G
 a8M+/rSRHMXAUzDkb5XGGvmMjuyTnzbMfjpjRaqaZNGTwTD12+XVNYtbh7PW75QN
 wXRzhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm82hcw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 22:40:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f6f4fe531so1116294585a.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 14:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795732817; x=1796337617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=f9WDtWtBeo94ep8Aj19VaL1/nZ7SEVEBE2xVCDh3ihA=;
 b=EirbH8kGWaeTuAz57Pu8CRfK902/viIVURMKw5dxzwdY3B5CHK0vReXRtYtH7udq6q
 35iTlTQO+hZsqXC2sYgMY5//HVdHbN3cjHh2qh36TdRgCn1PWdjLSyrPibSYYWoLyofU
 VCsckSaRaXkYPToIR7BBAM2HkJsJPPX+Wn3U4iRwPq//jJceDRd/p7SSpi8b5c9nzirD
 CAzR6JnEGu+kvcj5fSXcv02HtQG1//hmdxBL31bKxHDeSFZwc2rfHQiQc8mfKq8CkS9z
 2DdVX7U4z6IRoyPSHEctrTwAk6eZFwnoMEy00g8F5rOkSSm448t3tyz+MBmX1cxCZyze
 KtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795732817; x=1796337617;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=f9WDtWtBeo94ep8Aj19VaL1/nZ7SEVEBE2xVCDh3ihA=;
 b=yWlUNpZRN8HjT/NCip0DzktoM2zQnEKQhD9mwiX5jFpmYBrRPA9qIPGAGA59AGmyCq
 u24tBNgtib9//8f9bzojy/p+4HcjRdhljBNTW7Js1tKYFaMo3mVrpvem2/uOuWLmr3Mw
 SnhPrJEHcNiUUi4BvooVVaXLC3L3pS2kgGSPY7bdK4F/eyLFKfuOsT8TtXaGwh3jp/m5
 JvtIge69OAGIUosJDrw5u2JFYn2UJknOEGsAZUL2L5TRo17Wbi8uxQl6QgzjKo7fUn/2
 e7rF9jS8uZChpDTPbS262ostosCsP54sBVxLcAizr2LcJYKnY80IFh1KAsnEl/QJ2I5r
 BTxg==
X-Forwarded-Encrypted: i=1;
 AL+hErFgT5t7DcM6G51hfXt9mRxmD91V1+qbbBjyItZA3h8yQeLZZwbGIENyDbQsSibC6R7Hp/s4JKZX1A==@nongnu.org
X-Gm-Message-State: APuU4Z8o5uOPyDT/wXCh8G+6XX2GNzTWUyUQh9LaswkGy0ycqt9vZtst
 7k/SDwEbGCWLdqPwuFGcNgx5F7BGKBi4E2IvmpjhM+38efxRJN9ZJ2O07MwfDK4EODD0hH/QX38
 CMh4rXvZSVkf8JCbJgPEMRc84WjWAyh/x3ZUnuDzA8n6OsALhYjyg+N0=
X-Gm-Gg: AZFdTZdNMPoa55vgu7Ok03PYTEtCWW+gsJ06lHrBi/nGJO9cQZOSIE/MlksVNpl0Vch
 dyWsPp++BSCkbVLwfvbRjD2wyeP52Xsei5KxgwcSfrQkxymIyXUYOvpYXxg386NaZxNlOxjXMUF
 VlMTzaxc80bOun0STWTFNRqy+7mFKG9TlSA12UEJu1KWPGi/ZWZcBZusybBFgHtp2J1Kymnuvzw
 Bt8RSS7tGYKXD34c3fuJULQpxC5AB4tDlXd7O3diRQa8IEaKz0Z8iEBOiGR5Kxgi22YLHljzPMw
 mSX94F3a290vYOaNSYnhPkWLp/LiAffn8ingO0efl4I8FfCRHcqPEtTXiEc+dZoQ3Nx+yat5PFH
 PsYwIQU2k+Wv41/4gGr9tEdlGVBJa2Eff87mNpqbH0/Pern5ihb3NHRL/+YZwjez82pLzxF0WI2
 XtfhDj6jlKevi0Rg==
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id
 af79cd13be357-949ba9e882fmr3861743285a.56.1795732817070; 
 Thu, 26 Nov 2026 14:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id
 af79cd13be357-949ba9e882fmr3861740085a.56.1795732816668; 
 Thu, 26 Nov 2026 14:40:16 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm667908685e9.8.2026.11.26.14.40.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 14:40:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 2/2] target/arm: Read generic timer counters without the BQL
Date: Thu, 26 Nov 2026 23:39:59 +0100
Message-ID: <20261126223959.62899-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126223959.62899-1-philmd@oss.qualcomm.com>
References: <20261126223959.62899-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Md73Itx4qTmeykSATJHb7usITcExpSeV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4OSBTYWx0ZWRfX5959GTrac73l
 bRk9WQf6CTr6XhHmzLFMb9x9xVoPomFwyht3nZObAAE8FCOMdtcG00EbUIqxPja9YOzXiNh4DdO
 ENLNhkd5r0cqagEKYBen2CKXh9kvhj4=
X-Proofpoint-GUID: Md73Itx4qTmeykSATJHb7usITcExpSeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4OSBTYWx0ZWRfXwauKOo1hY1Xo
 b81ISMemBcVgQbxanZ5KU6GWii20D8v6lIGTaqK8p05Rf4BXqbNH2JbV+QHNdc8NKFgSx8JLJ7C
 FzaCNIMZo6/NmqNwBqcp5QOm+kuhNtwO8KqVsEK6Y59IqlFO5SFhGZrOjLMGQE4Jl5YMWN5QsvV
 REI6nizfv8ZBw8ZZVJyr2+mI7G+W+vbHF2jn8qy9vQIJxsPH5ievqwl+wsQIpG0JEhBwjn0t2Xs
 3XxVQoSOGAEciQovLVfAcuh3u7OdYcsUewNqeYgvG9DSK5Y4vKqFg3ZiD/rjoTwnSFJSEwvFMOw
 ZwQVhqPLuC1LViVC/jTU2FabcxXmbQzr30UMTO8+qXNtgVKUxzOrnZ4GNkiN2Apm3S7+QbRwZyW
 B3c8FbJhfJBVdUAkRHKFs3hTDIYezL4QE+b9x5vGoTky2WiCxTsv4H2PFRznf/9bSHWd/fYQaX/
 VmXafZUK2SbZud+v/7A==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08b551 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h59-2o0vKUX5x5sfU90A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260089
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CNTPCT, CNTVCT and their self-synchronized variants are read-only;
their readfn uses per-CPU state and QEMU_CLOCK_VIRTUAL, which reads
through the timers_state seqlock (cpu_get_clock() or icount_get()).
Mark them ARM_CP_IO_ENDTB only, so MTTCG vCPUs reading the counter
do not contend on the BQL.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 198ffc69aeac..cdac27858feb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2333,23 +2333,23 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     /* The counter itself */
     { .name = "CNTPCT", .cp = 15, .crm = 14, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_pct_access,
       .readfn = gt_cnt_read,
     },
     { .name = "CNTPCT_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 1,
-      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_pct_access, .readfn = gt_cnt_read,
     },
     { .name = "CNTVCT", .cp = 15, .crm = 14, .opc1 = 1,
-      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_vct_access,
       .readfn = gt_virt_cnt_read,
     },
     { .name = "CNTVCT_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 2,
-      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_vct_access, .readfn = gt_virt_cnt_read,
     },
     /* Comparison value, indicating when the timer goes off */
@@ -2434,23 +2434,23 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
  */
 static const ARMCPRegInfo gen_timer_ecv_cp_reginfo[] = {
     { .name = "CNTVCTSS", .cp = 15, .crm = 14, .opc1 = 9,
-      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_vct_access,
       .readfn = gt_virt_cnt_read,
     },
     { .name = "CNTVCTSS_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 6,
-      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_vct_access, .readfn = gt_virt_cnt_read,
     },
     { .name = "CNTPCTSS", .cp = 15, .crm = 14, .opc1 = 8,
-      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_64BIT | ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_pct_access,
       .readfn = gt_cnt_read,
     },
     { .name = "CNTPCTSS_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 5,
-      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .accessfn = gt_pct_access, .readfn = gt_cnt_read,
     },
 };
@@ -2512,7 +2512,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
     { .name = "CNTVCT_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 2,
-      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .readfn = gt_virt_cnt_read,
     },
 };
@@ -2524,7 +2524,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
 static const ARMCPRegInfo gen_timer_ecv_cp_reginfo[] = {
     { .name = "CNTVCTSS_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 6,
-      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO_ENDTB,
       .readfn = gt_virt_cnt_read,
     },
 };
-- 
2.55.0


