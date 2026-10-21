Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A50607154D
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbK2MoVA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqPcjbw8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMrE-0001EU-Ka; Tue, 20 Oct 2026 23:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqE-0007Aq-1A
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:18:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqB-00039l-4H
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:18:13 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F0Vp336596
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31qHRvuCzQ9K6ePd7hfaaxt30CRwnArdLmjIbTE9sdI=; b=YbK2MoVA2iAxu2mI
 i1OcKZIQYiunADMGklvayunO7PIwCg0lhRHxan5EKZNViJPdwn2iv/642CGcxTwJ
 k5t2Xr+o4wAgwpKKLMrzhHX8vyWpYkK0vXT+Om0V5y2M2I2XWwHU/4xpi/jpqj4e
 cuacg3Xr/C/Wr+FA/lEqBV/FouWp6PhDI9divKp/rifnvpANoL/DTxMQGQRIrby8
 EsfGr0Uvf9YaZE47b1u1jigv81HKxGSIzaBWTRkZy852ZbgDuWlOQ4f0O/BXS2rc
 xEysIkQlR20GM3L+lUHPGwU5+ulAMhdOJPin3ak2epIxMGzWsU+/+VkDWbk/1VwQ
 6A93fg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabhrn6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:17:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ce7a85f04so65279085a.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552679; x=1793157479; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=31qHRvuCzQ9K6ePd7hfaaxt30CRwnArdLmjIbTE9sdI=;
 b=KqPcjbw8AXu0r+ugmxG/aP4t/uiaXscTnOIFeBBXo2QWReIYKxXwbc7CJ1ILG8qP/d
 RJJqu6kY6cW4vmoJESRqiwrkCZyjXaKH9/fdkDoi/E4EoSvVkWRdfEWtbtCY7l24TCIc
 fAqbRIt9NcYrnzCyPQJ9sF9r93phcsE9Uj+WuSmj7welyo9gnMQO3fQeU88M99wv1UpL
 KS7/RU+7W0RhaII200pTdGw/RKOMNG1Uitf0pnDEFK9EG8xP4+knT5OcIzYYoJjvbyKD
 3kEzF30gx8PF0f1uxz4SLuqfMaQiVVN5CC2Cr8wvGDLRQ68ud8IE0Gd8LYEeq8WhDily
 I5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552679; x=1793157479;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31qHRvuCzQ9K6ePd7hfaaxt30CRwnArdLmjIbTE9sdI=;
 b=OWEnEVITI/AaET98/o4GSgXBCKbG6Rt5uU3a2uuRGfdz/AJmPzU0zACwn/H7f+iUCV
 cjRzCg7owps62QjiNKp4V353UuOuRKdx/zft8F+vRpR/c3OPQ/7yrJC1YNUHdRYw/C0D
 sgxxnmqRV7bUvxxsmLx19kKvJtGKvnqgKwUTydFwVsMsvrMygd3BC2dn1yTBgHoeFDDV
 CSj9D2Xyhj3UP+j750/WNd4WO4Xzo+GIDVHeeK0eYWp5q3EP/JwDvq0SE2V+iUSuXceB
 gEsSLIdnPe8+rHxv2+NXeZoz6p2KGPRUBm9tHuZ3nLWoJ7OCLKqHu9Ex6wgelPPFiiau
 mPhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8aDD+1KFBEnpAy7HmgGOpnZSiV5gNlwhXN4GgjOQB6NZ8X/5PHIsvwJpV1ZtSOUWQHR6I9idZUw==@nongnu.org
X-Gm-Message-State: AFq9FYKji32moFuOi/Df8hVlLP032f0Z3ybc1+/E2lBsJJ5p/XoKcw3o
 ijpKX0rnwfGdEHRBl0qaCqhQdNVjGi0IOptBKRXKprMM9YZVoI6n/Aj+ukvjg65MNdGNdkf5CSi
 4luxziULScBk6q36TU5N0d64SUiyoexMK8vS4OfkrIm9boNAqaEPhSL0Z//YoCFsfVg==
X-Gm-Gg: AYBFou0hR/hS0HBkIhcbSDNVNVDoxzwSRw+ZyLdF0L47JDYpVo+3kApjWaoZaeIFUyn
 dkPWQ/dnhIbuvKC6EPU+qLBTnyxy/ma47DDWEqF9hnKJWKvft82JWZD8beMjWijeqZlZMKEywiv
 5/ftjYTLk4UgCrvgJjLCW5G+1aV01KuLt9BppmsjJ/nTPF6VxZYwUhh3n1wur8gRQ79b6C1IS7B
 uvb4/mRvckwzjd8ZGlQcQHk6F/+W+3Y2WGuLE/tswB+cm0xiwfcAjRme6IDwP+8QUWnOEV2NKfO
 YYGO02kxJk+fSF+sMxoMqD/v6WZrMmTDG5kLtoW51DPqn7UKcRNB50DB4wxzJG5om211RPjdVlG
 1lpLvY0+cPEEdbO924OOT8H2CbJ7p5WgDZk6scFVe
X-Received: by 2002:a05:620a:2987:b0:93e:95ce:53c7 with SMTP id
 af79cd13be357-93f57f05babmr192785085a.4.1792552678698; 
 Tue, 20 Oct 2026 20:17:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:95ce:53c7 with SMTP id
 af79cd13be357-93f57f05babmr192782885a.4.1792552678191; 
 Tue, 20 Oct 2026 20:17:58 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb864dacsm41027025e9.12.2026.10.20.20.17.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 29/33] target/sh4: Use a static table in
 sh4_exception_name()
Date: Wed, 21 Oct 2026 05:14:02 +0200
Message-ID: <20261021031407.24862-30-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX89g1ga6XIcOo
 v9fPLD6D1rKPt9w77PpWHAHyp45fHgQ6oeDl2jDCIavSjzzsOtPj0J+mQEnQDqg1gI3UPIJucUZ
 jw5q6U+9NWkwkejE5PKsjviQvWHV8Sg=
X-Proofpoint-ORIG-GUID: c7uXvcOV3_IqCU-DX5JdG2-fXjqHLW4S
X-Proofpoint-GUID: c7uXvcOV3_IqCU-DX5JdG2-fXjqHLW4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9AeuD6hQxCZr
 A1m6zHWNwchYzmRlNBXPlW4lOVDg4mtv46d6HXxuGIIS/qdBwsPPJ3T78W0Vpq3WvAj6VxMcDpa
 mAMEk8lbIWat+vBTAR1kgBGhg/sVxserAxT4YgZvHatEHNzD37kdfdSQD1h8vN8ddFtO4O+jkQ+
 jysbWLZxHz68sOCyuz/tnKTYGRKNtUGZ170E8FagiqWDHrswlwCwKvG4SsVAC942Nefhum+atFK
 1jaIKN4HTSp+u4LCVZrQkjo8JYI5g7fYTet21Nhmnu+tqrx+1GRg2QOIMlS4uF0L6Yma967BIeg
 NwV4nr9MAFCZMqm//rKFsgKjO9Edl9kVyjw9+wg2kFRXnqz0qgHGPrLuT4zpVPmcS9eNwgULT6t
 VRA71DqSD0gG+DVXt3ATY1H072CMN6jFWI4e+0qXez6/KxYSySWYuPYm9y+b/MAYfjFMZLY64ve
 f8XqUIENtNTad3l+FUw==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad82ee7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rdbtYueUxUB_busH31QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the switch statement with a static lookup table.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/sh4/helper.c | 65 +++++++++++++--------------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 5856bab6983..a4f80b10d3c 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -49,54 +49,27 @@
 
 const char *sh4_exception_name(int excp)
 {
-    const char *name;
+    /* Exception codes (EXPEVT) are multiples of 0x20 */
+    static const char * const excp_names[] = {
+        [SH4_EXCP_ADDR_ERROR >> 5]               = "addr_error",
+        [SH4_EXCP_TLB_MISS >> 5]                 = "tlb_miss",
+        [SH4_EXCP_TLB_VIOLATION >> 5]            = "tlb_violation",
+        [SH4_EXCP_ILLEGAL_INSTRUCTION >> 5]      = "illegal_instruction",
+        [SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION >> 5] = "slot_illegal_instruction",
+        [SH4_EXCP_FPU_DISABLE >> 5]              = "fpu_disable",
+        [SH4_EXCP_SLOT_FPU_DISABLE >> 5]         = "slot_fpu",
+        [SH4_EXCP_DATA_WRITE >> 5]               = "data_write",
+        [SH4_EXCP_DTLB_MISS_WRITE >> 5]          = "dtlb_miss_write",
+        [SH4_EXCP_DTLB_VIOLATION_WRITE >> 5]     = "dtlb_violation_write",
+        [SH4_EXCP_FPU >> 5]                      = "fpu_exception",
+        [SH4_EXCP_INITIAL_PAGE_WRITE >> 5]       = "initial_page_write",
+        [SH4_EXCP_TRAPA >> 5]                    = "trapa",
+    };
 
-    switch (excp) {
-    case SH4_EXCP_ADDR_ERROR:
-        name = "addr_error";
-        break;
-    case SH4_EXCP_TLB_MISS:
-        name = "tlb_miss";
-        break;
-    case SH4_EXCP_TLB_VIOLATION:
-        name = "tlb_violation";
-        break;
-    case SH4_EXCP_ILLEGAL_INSTRUCTION:
-        name = "illegal_instruction";
-        break;
-    case SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION:
-        name = "slot_illegal_instruction";
-        break;
-    case SH4_EXCP_FPU_DISABLE:
-        name = "fpu_disable";
-        break;
-    case SH4_EXCP_SLOT_FPU_DISABLE:
-        name = "slot_fpu";
-        break;
-    case SH4_EXCP_DATA_WRITE:
-        name = "data_write";
-        break;
-    case SH4_EXCP_DTLB_MISS_WRITE:
-        name = "dtlb_miss_write";
-        break;
-    case SH4_EXCP_DTLB_VIOLATION_WRITE:
-        name = "dtlb_violation_write";
-        break;
-    case SH4_EXCP_FPU:
-        name = "fpu_exception";
-        break;
-    case SH4_EXCP_INITIAL_PAGE_WRITE:
-        name = "initial_page_write";
-        break;
-    case SH4_EXCP_TRAPA:
-        name = "trapa";
-        break;
-    default:
-        name = "???";
-        break;
+    if (excp & 0x1f) {
+        return "unknown";
     }
-
-    return name;
+    return ARRAY_ELEM_OR_NULL(excp_names, excp >> 5) ?: "unknown";
 }
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.55.0


