Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86923C61CE2
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySj3-0000XB-Bc; Mon, 24 Aug 2026 07:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySj1-0000Pc-2x
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:20:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiy-0006Sk-EU
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:20:22 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O98w893109812
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=Tm4ho5i5yqP0R+rn
 CxIy7K+Lk3SHSHsiZBt8R3FHrJqioeVsToOHCZjhGlhm8a5ziQZ5wvxOhVyxpoo6
 g0jXoHQkcIDbUMhWzDBgC1957+eIc5m9f5TNMk5YkYNyydSP7Ld/rjpqunjbEDlx
 eqIuocC0Nz0NeQlhegVQUC12ziFkqRrYSUXKAy1Rgw1PkFjxjiVnBLrY+VvxTQvf
 SbRt5Jtx+9OKqxJbgi42yyuVZYunJKJQ0BvZ3nU/DDVBamGsrtKTq4sm4YNxnwav
 tpXsWYmefewSJXgSukqiaDce4es20wyEn9KRweN9OFAYRwtZ/Nci3C1tAdbIfnF0
 OPn3KQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk0qu3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:20:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-739a588fadcso406975137.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570408; x=1788175208; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=TYosCrY56WaZYBuk7DUxO9c6LPpvhCJb3Q+hE9bw+Id8R4n1cjyics95H38r6f8mcr
 angrSAB5+oP2fi2UPo0bKWS15NwIkKLdURN0/hKE/FwAurLKpRLFTHFGb7nzRR5QKZ9E
 zmlScsLCgL6Hqb6aJyOGiDliAJ9bI9lNlcmBkflvLotOaC7hBFtWGKz7psKSokzM/5xr
 SL8SdMBRSSPhh8oCEdH359pvXM78zD2WsFsV9i6nT2iLhzXVNAseqP4Z1cKYlbNjZQUP
 xe8CGRlqRWwBVWMfzlRZI+RqEHFMaYFkOG9Col/DgnNr3ydwulbdfM9SlFx4uu9nHUbk
 tGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570408; x=1788175208;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=S2qZkS/gUWQMWVdjjVr6t7YupHCZu9TN+ADCnYJ9QqpebV66eM/1ko6ZNqRgGkvs0/
 NuWgprv3Qu5OK73r0ACLrTVTY5irQcBVHWJ157ra/kcBpNrJdEgvXyFcCx5A2RgKJ4L5
 gLAUIdHq0LXtNleIU8nYSBXo4nsp4bmDMBsppJASGNdem0v+DveLIOHzSg8MeYR0XOLj
 JDv/APMJpFMFA+x7kGU/sMK195b19P2i76fz8ctNEALcM/O4j0O/USekgqh0S6KgA+jz
 8Mz5KlP7LO0mG6BYYPbDp5CJ1DVGlq8dKdOoSxjz51i6pgnJzVwVe1s9CHGaeome5zcY
 4/4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpS1+5jKuT8238BFJhJ8RDmlSlVJwIS+zXiEypmr6gUkCQDE7hE7HKPUYwy04RnPAT8UHChqHCrA==@nongnu.org
X-Gm-Message-State: AFuF++lKYm1eXB7ESuFoS9w+JGKESonstmpY8MrT7ZKVY8DYaC0t0Nxs
 o+wuthFpZMD8whpo8nb6MBp5avMHDvxPvdzIRt0WQIrYimgl4gYVDghu6ogKSlyQ7wVeNoZPPLC
 0bf1Gvh/ZJNdRGrckJqsJV1Z8efcaZUq1fntpntRxue2SahdhvEHtQo8=
X-Gm-Gg: AR+sD111sqtqTRlagxkLPhlalpJiwSKoRuRa/kgmr9N0LgqSNwdjvZtv1fG4nGsAzn7
 XGHAk4xo2kek9OfO3BrR5BIKEgF/nF74oj2ObGE3wMea7m0N+zJ50/v6MAUA+Yne3EApaC/KvP3
 cDcrLCpygaLrAhza0U4b593KoYzFt/YOF0F1WXn8CabIR72FoZDoEQAj97VsBtqDyQf+h0Z9Q9k
 +GXp/cCjsqCUxoBR/P4EdsXyjpJbN7DGei+wLN5g2xNp5wPk+vWDZdCaobPClhp7kwsnaYQQnV3
 fg1J+dgruq5wd7csdubaUkgI4n9P0UdXK2y0oJRWk8WyHCZqdSweu6KPPQ3bx88ombBPGBPVyCm
 ZPgxRL/gI+I+Pfx1BhQUw9Jsr7x4gICTMutuV/Fzh6DzxhLft9A==
X-Received: by 2002:a05:6102:3bec:b0:77c:dbae:f9d2 with SMTP id
 ada2fe7eead31-77cdbaf06e0mr2820079137.9.1787570407800; 
 Mon, 24 Aug 2026 04:20:07 -0700 (PDT)
X-Received: by 2002:a05:6102:3bec:b0:77c:dbae:f9d2 with SMTP id
 ada2fe7eead31-77cdbaf06e0mr2820068137.9.1787570407398; 
 Mon, 24 Aug 2026 04:20:07 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5ba19e053sm1697032a12.12.2026.08.24.04.20.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:20:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v4 16/20] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Mon, 24 Aug 2026 13:17:05 +0200
Message-ID: <20260824111711.26297-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YzcDqAMH17fsCfUJgdPreq2q49on7wgs
X-Proofpoint-GUID: YzcDqAMH17fsCfUJgdPreq2q49on7wgs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX2j+0v7Wyy6cW
 g9BG0ZnLg3JtfcvhOhLt7aKp4jIFsUDbNFEQVp6LnLaa03fsfd1f9kg1DvK/RaYFTgKYdZIJsxR
 Jyqb4aU2C/dvmcNsY57YlPejMOJ/SwM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXxUQA7kb+IlpH
 AlBOHdDY6H/VHuNq+9qGx2Uj/QR7i4uB4UPPTS/jta/m/+Sqq6tk4iXFl5jXq2ehF0wSD/Z4dwm
 e5+zC5LQxzUU9o9xHAUWUSn+0qGDbzOU/IQFDCjQBZtQk+A1PUn7qG2AkGA7L37R80iYIIQQjHi
 jkv0YVTNKB/Ed8XmQw/Hth8gpMQ7oSb3eMkjd8JmXtWEdxS6+jZxCKUbbtU0hiI8WuYwIxUnZ2p
 fH5ojqaxn3e+kVBWTPSYulmqPeQuzxOPwXYeqK3yVkxfhRSlJEvwSf8/y7qrjuCpSlAi8+bYbLN
 4GbFQ2LsNoAbAmoMtsq5ljhU1BlJjn0JoXoOQEHnUIrM/NPwC1N7hTG5rKjTpz4XMP2qZRSt0NY
 wAw5Iq+XUfjR1Gilil0cQwimlYC7XfNFH1jcJ2GhNkv2yrQw0n1Ezjo6wSpLRaW6u8ZCO49mud2
 pksDMtVolycd0wY//+w==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c28e8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


