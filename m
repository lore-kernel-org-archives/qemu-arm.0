Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B4606E84A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHkOgYMR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q08HFRoD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMqK-0007RF-4Y; Tue, 20 Oct 2026 23:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMp4-0004kx-VD
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMp1-0002xl-HX
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:17:01 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FUrb1957044
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PdLK6u7tq/yz0P0iF7Doi4UM43eIYN0OLasV3GDT2vU=; b=fHkOgYMRTnjiV+5N
 +PrplU2M2RGa3jxm/6r74ILatDMZADVf+VuVgRQRglzpWgWkH4pLkWO2WSReI6Bn
 /3amvW4o6cnxxwHUSieCiG/6ZvQa67DmuLCZf2GRfRETnp45PR7GhxagpFcGU79f
 etQTbCmZdmn7m/v8XmI0LuYtimgSFfDMwOgl9wPqiqYzaSjkqt2U5msaEQB/rYjE
 GI9+4CHrMvk0EBD76eDXmnjQzAkFuxovQ2uIJiFU9iBffy8PoGZWogev6CNnmXkI
 dMI66Pedr2RHl8hwxTJEVCYArZWvNoM5KyFqQqrNHlGBiCPiQ1Ja1gPyZDy1joph
 +KdFAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvb6rv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cb71b1443so59478885a.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552607; x=1793157407; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PdLK6u7tq/yz0P0iF7Doi4UM43eIYN0OLasV3GDT2vU=;
 b=Q08HFRoDN/jgLJ14h3duL4FC39ODPgGI0qFBwDtuxycpCjBIbhQwz71+JzbdN3v0en
 n3Y07r55w4ZysVhkFE3zTgpmS0R1xS729hs3g8IhmbfzsF/vvzTLqG1KvkI2TWLOayTr
 /zFRjxzo4JyGEEpbyKDfjVbpE8hu7yv2zROaGVJk2SIOn+taCIfYsvVmpdyzAlRW2Uxf
 DE/RDYhFpOzQWfDp04ivcfxE2bZOljczIkTLffcf9Gx1BkilBcxqvsHBnUmme7rHNMWV
 xtCJTvM1wh+6IM3OFD5fzBWdVNE7CWA8pCHz8v658tTmvKXXt1sZQPMB4goZ+Cc1tMi4
 KC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552607; x=1793157407;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PdLK6u7tq/yz0P0iF7Doi4UM43eIYN0OLasV3GDT2vU=;
 b=mCPaOCNfYsAkVbd0qW1B3bnR7sHIdX2XRT4S7NNrG9LZEmxJkdLkUs3hQWuOvXej33
 Z6MXzhuYhWxP+L5WP5B5aAvCbDlZ5rks2ZiLXQy12phEuuaWTc9SIsFIMEKJh/YcQi+V
 bIH6gqv5FHSuHL9a2VgCYWRElvyGB/oOgiLUKf3Xeo2oOmU7fsbTxJkLfp9RfqPG7GC1
 L3Tm9hwGqBZDa17MDthHS+gDpKB2s9nz6qfS2jc7jUbTNBBD/s3qRz+1KEKhpP4TtA7J
 E9JONRRFJ3UjW4jbXzopjEaQ6r00HW9I1Krkw5LsyzsxYMD7orSVpG0/RQZko3GpaQ6n
 yVXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxmfB0WLC7ZchgfuKseMY4O9KV+2FeiqR37DR09hh7/b1W1A2JCzpSHe0HGXuhabh1gAo5kvlOBNA==@nongnu.org
X-Gm-Message-State: AFq9FYJaZDQwboceLB1wVJJdSwPMufX48APbIxpx66Nhbc7pQbngIFI6
 zwVZW1ORlzHfqEw1TYFLxkPrjeKKRzBk32Sx21nBfEurfz6s9YULnYwYeUD0B7OEcoCSNy3rgEU
 1Vo1yzz33wlrz8UW/GnXS6Gu+RH/FjDhcxNrUxJgg7mS8o1OaX0I9Zhnhzka7kmD+mQ==
X-Gm-Gg: AYBFou0NKzVaLFRRfxUIbsbAbFK65h8SR1wA1PFPTY7PHI6c2RDhUHXN6Uqa9SB0JtC
 OaDGt1viRO0v4ZkpvZtp3uLaH/yVm0mU9kYjaFClW5axDKHyFcEouCy19Yki3mGeUtG3+T3j+zh
 HR3bahwocCZm7DJXO7rM7MBZt6Q7X50PqBfbyqzNMVFh4QcaGoLGDFgHZesUard4G0iTG8IutyU
 BeGtpeM/cO5JzLCRseiOY9gLOr6g+Fm5y/CxEn3eZqxcOxPYmdmjpOrQGcLSbnyEw9vyW5n6728
 3wxweVmG25u4azFoSAtF53QoGSr1VGJQ3ix3cEVRFlClWUG3AFgf73AxKKG4BX7Uvx+MBae/ck0
 dQxLF6lkSJ4uXeOYKvvVIejJf2/ZVzkXg3nO/98Cj
X-Received: by 2002:a05:620a:258b:b0:93c:8544:6ad8 with SMTP id
 af79cd13be357-93f57f70fbfmr194777185a.28.1792552607160; 
 Tue, 20 Oct 2026 20:16:47 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:93c:8544:6ad8 with SMTP id
 af79cd13be357-93f57f70fbfmr194774885a.28.1792552606590; 
 Tue, 20 Oct 2026 20:16:46 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb80f05bsm41137525e9.3.2026.10.20.20.16.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 20/33] target/ppc: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:53 +0200
Message-ID: <20261021031407.24862-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX7quFxkZb25gN
 WsTfYzn+a5SQhJEUZTGUMgOimcbPPKtaIu2rjlvMk7ozyZKp7jrDxewi+EQLfhjATqJ2cML21lY
 Xhq6DODesLi25UrO0GsZj5sOmWobO68OuWQpugjk17mhNKD1IuY8yj3MrBLMcAwq6Zh335hDnb9
 mJ/NxvzmKzRX46PihLThS22lREw7BkBObkNWpUooHGgtCe4YZHDTJGo4B/of36GVkBgaCkWBEvq
 1/8y7Kq0zDjx5dAhICyIXpTHWMa1xQV0wt5HMJFetSaz1clbHUWZ2oGJCliz/LdcG8BogOKWzJi
 dPIrH/OCmLznmfZcDon/sorOINZ0UsMu0tg7cK76VxdaAS5BuEEOtgUgVTOX5CNqdVDQFcJiOOo
 vNXiZRJmm86pb6OmmbLaWI6HHInPjD65t9pKtW8Ld3Ru2J4hzwSrcDja1dA0CqJhlcLEG3XwM67
 U0t1cLyxbneAop72zLg==
X-Proofpoint-ORIG-GUID: 6sg-tOwRLlbjxFrPhAB9S5oWMjWoDqh0
X-Proofpoint-GUID: 6sg-tOwRLlbjxFrPhAB9S5oWMjWoDqh0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXwmtsJnlLoECy
 VaVe46tSDykYMIMLcXKoS6/siYZplTI8pm3TVfHs0HoE+4Iy0wjr1FMpqlAWFj0qDbW8Qn49aFP
 OZLcj5PNoC+zFZP8LgH9DnOzuySjfjs=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad82ea0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GQJXTKmK7mRzDcunaLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Expose powerpc_excp_name() prototype and register it
as the CPUClass::exception_name() handler, so the common
exception logging can resolve PPC exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/ppc/cpu.h         | 2 ++
 target/ppc/cpu_init.c    | 1 +
 target/ppc/excp_helper.c | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3fb51bbeb82..4eb7db3d727 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -153,6 +153,8 @@ enum {
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
 };
 
+const char *powerpc_excp_name(int excp);
+
 /* Exceptions error codes                                                    */
 enum {
     /* Exception subtypes for POWERPC_EXCP_ALIGN                             */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b711f9c0a85..d5f9ac28020 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7529,6 +7529,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, const void *data)
                                        &pcc->parent_phases);
 
     cc->class_by_name = ppc_cpu_class_by_name;
+    cc->exception_name = powerpc_excp_name;
     cc->list_cpus = ppc_cpu_list;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 895127fb2e6..66675f1fdb4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -33,9 +33,8 @@
 
 /*****************************************************************************/
 /* Exception processing */
-#ifndef CONFIG_USER_ONLY
 
-static const char *powerpc_excp_name(int excp)
+const char *powerpc_excp_name(int excp)
 {
     switch (excp) {
     case POWERPC_EXCP_CRITICAL: return "CRITICAL";
@@ -107,6 +106,8 @@ static const char *powerpc_excp_name(int excp)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
-- 
2.55.0


