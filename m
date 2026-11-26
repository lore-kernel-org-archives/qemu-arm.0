Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A60606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR0KHfLo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xqifyzo/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj0o-0003nn-E4; Thu, 26 Nov 2026 18:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj0m-0003mr-Ub
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:36:21 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj0j-0003me-O1
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:36:20 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwGsE3340213
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D7XKEWDLW+ifXRRVmGZj4PQhDJgWMVe/UWJ+OSD0TXw=; b=kR0KHfLoz2Hv7Af9
 67j9D43sGxyaBFd2Py2PoF4fkGrQNsvwn96aJ4dioNdzjRiwimEHAkwltsEY68SU
 E0PTE1UuTTcQrnyOETehcCeHuWZf6mRflPGlIvw00QReKBgdrrVmofaR2JoE9XFu
 sJyjiustPs2zbqiL8ly4ehBi0na9R8Fatb+JYsS+qxOcnBm/MGkUN9wy3/tCJMXE
 f14zMvLw0qQ7SR5OriWDPfBN/2hcrqfqi99BOH9iFtdK2M+sFvc7iitClYcHtHSq
 MGjLy+QV5iiyBkyG1A9lWz1a6/jiY9Qws/tkKFdRhYK0cJEx4DvRARkqVqQo8a8Q
 YVVdDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdq7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-944138ed63fso615760885a.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736175; x=1796340975; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D7XKEWDLW+ifXRRVmGZj4PQhDJgWMVe/UWJ+OSD0TXw=;
 b=Xqifyzo/GOdUR0wdMM6YOR5xUfA2RazP52gQ7Rog8q84ZUZsMK09wgoWu/9doyRAgP
 eHPD8eul3aMvJB4J2z8Gu364xPvrohuMqNUbFt6wuiOaVNwRpLlocIQTCuK0APW2oZpG
 Q8omoXONLL5ZFeWzD8LScQ9vmVnVp7YWXlVRsQbf3VhVRTsxRoXjdJcN6oxH+Lh/TXdO
 xE6WpYAdvItPfceC62kyawnoCGsZKr9obDi0Mw5khC+i+A2K25K2LVHa9LZlWyKcq9o5
 KWh+3cEh5SB9J9VUo6gZVZP/VIqhaMwl5UAPUoaPsxEeMek55DJ3afiA6dOJFcAg2WGk
 YvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736175; x=1796340975;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D7XKEWDLW+ifXRRVmGZj4PQhDJgWMVe/UWJ+OSD0TXw=;
 b=L5VDGALtclvBGmOdZI2NEJxJFmAet2drxahk9uaQ18lbvzboQ6V3fmy8LdimFfNS7z
 UWSUmDXUFrO1/3NkUSZ/RqNgo4L2bAX0WDOzgqPmLMTTA02p9l40DSD7iCk6nQCYGAif
 wM/EwN+cu/t09XPGXYITtaf1yHfoDsgBFOyS1dmxySTRYhT4V5xzgNU8+0iujgK2qjsP
 fxWsbTg8gxSErsfV/7aVVzen7oInwgNGWo9h5a1gOvo7UfghF3OtkZmWCyxd+91yuF4b
 qxyLG72cHewCO/AK+F4maedLq6UYifzQeQFOHqvfyyhi4Ik9XTlaAobOuZ+JrLSb0S4s
 E8JA==
X-Forwarded-Encrypted: i=1;
 AL+hErH/Up9S/qRoZTEPrGBcoE3vmy+uWr/UxWuj9BPzHY/0H/X56F1LB5PV9cwoFU2lJM32lt227bCGkA==@nongnu.org
X-Gm-Message-State: APuU4Z91Qm4r+vDYF3pXDnayKYe0SZN2P4BW1R5PHHjSM9cCi+d7I8Q6
 xcBzfakPYAM+f0vLaUCR2/Qle4EFFYRQAA/Z+CW8SgU6FpCJje0ATQU1Un5Fkc3xm2ucS/7ahaS
 6rwOxMM95TxcHMwLSOV0fxAxOg7NzNDAiYewCjPcZM61jWuweUoDWj94=
X-Gm-Gg: AZFdTZfmTvYNq5UJTXXTY5tiJSZuhXvfCUZa4cF8pgxoRdBYJF60uXen4wcRYkT7zIr
 dWN4oiWd/BWMrv4JtdvJUFSaKG9PJzXlDHs0qbZk6ZUpvnRVVguC3jp1bD6FcxsH78mE3A19QYQ
 CJW68LV5D36qvbPSWgeHvhhV9UBfbTkTC7nSpBpqW9JgM7qRr8m2PGaPdD/ehi/dRR+ZFby/8jO
 X9FRw1wSkv9sZ/JP7n1vGnXzByz1qp+ns28lG3L9M96qbqxAYJ4F+TcKIzODRmfwCuwtO+EW0YX
 9Pu5ySmGVJM9z3wGf7sZCm3yu4APV885MApVM28/VwZoOTCnh2MhF+IAhcJlZ1RiDVES3VgkV+8
 VwkERt2YuYmKqtRQPcRYTj3MXeWiKVlAPA5jCprLk49AkZToJhcOOXPT0kIxpMirI7JvliO6l6k
 +So3LdlW8uEtBiDA==
X-Received: by 2002:a05:620a:4453:b0:947:7691:731c with SMTP id
 af79cd13be357-949bab47e86mr3886674885a.65.1795736175080; 
 Thu, 26 Nov 2026 15:36:15 -0800 (PST)
X-Received: by 2002:a05:620a:4453:b0:947:7691:731c with SMTP id
 af79cd13be357-949bab47e86mr3886672585a.65.1795736174615; 
 Thu, 26 Nov 2026 15:36:14 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d55sm43222277f8f.5.2026.11.26.15.36.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/24] target/arm: Widen CPUARMTBFlags::flags to 64 bits
Date: Fri, 27 Nov 2026 00:35:39 +0100
Message-ID: <20261126233604.67722-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D8d-IBDdNuw-m8h4EzdrHfowXAVzIVN2
X-Proofpoint-ORIG-GUID: D8d-IBDdNuw-m8h4EzdrHfowXAVzIVN2
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c270 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yHur-PbuXrsg72ao36wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXzOUprILLHfgg
 k5ZcFofW17YLG3IVLYlJT0eicpk3KDKJ/xhkiW/idS/OWLrPypqUoRqoKn9CNXAVR2tJLb8AKeZ
 yXh0qZxvjYleK8/CVg6KaxMvsKv8m4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX1VgXTr1H8z/5
 Ec7Qx5C0l8QpGQ0/Z+aLc4MuW+wP3lPtJ4QyJXp0Hey6CtCWjrEtLSsZEbuv+HCpuiRnfCyW7/R
 dd2pP5GH5Q5EHkrYOF5ZLwT3rqNqK6JhKm9CIupEPQwOm1YQFqHaYnxRoTZwCdKuSOE3MCoobFd
 VCLrNQj+Nl6w3K+B/UbOZ8jY5X5omBtHkGVLUOLoafyp5PrHoRjQMPUfB6wxI9b6JicSSLi/+Xg
 vylarGsv3vrAg/yrC9+/ZPHkgS69vqHL9QfAUZR9HsKzFJAcuKsCF8lZuW9kKDATpgo5smDjcgi
 cgMxktEsAZ7rOkUkd39yMFfzETaNrBU0emHoyKZBd5St8c3SgCuNqcqVCX7HqeDf/Cl+VDluX3w
 ROLKeCdLljXFKrWM3MwoPW2xelCPcQ9fcQ2HkIOZkzPKPrrUY+a28Ft9npM4je7KadpkhlCay0f
 WjW0L5xO/rp+O8iQwfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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

Use the 64-bit field accessors for TBFLAG_ANY and print the value
with PRIx64. Prepare for TranslationBlock::flags becoming 64-bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpu.h        | 12 ++++++------
 target/arm/tcg/hflags.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b2f393f50184..5ee9ebf352fb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -150,7 +150,7 @@ typedef struct ARMPACKey {
 
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
-    uint32_t flags;
+    uint64_t flags;
     uint64_t flags2;
 } CPUARMTBFlags;
 
@@ -2614,12 +2614,12 @@ FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 48, 1)
 FIELD(TBFLAG_A64, MTX, 49, 2)
 
 /*
- * Helpers for using the above. Note that only the A64 accessors use
- * FIELD_DP64() and FIELD_EX64(), because in the other cases the flags
- * word either is or might be 32 bits only.
+ * Helpers for using the above. Note that only the ANY and A64 accessors
+ * use FIELD_DP64() and FIELD_EX64(), because the A32, M32 and AM32
+ * fields all fit in 32 bits.
  */
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
-    ((DST).flags = FIELD_DP32((DST).flags, TBFLAG_ANY, WHICH, VAL))
+    ((DST).flags = FIELD_DP64((DST).flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
     ((DST).flags2 = FIELD_DP64((DST).flags2, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
@@ -2629,7 +2629,7 @@ FIELD(TBFLAG_A64, MTX, 49, 2)
 #define DP_TBFLAG_AM32(DST, WHICH, VAL) \
     ((DST).flags2 = FIELD_DP32((DST).flags2, TBFLAG_AM32, WHICH, VAL))
 
-#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32((IN).flags, TBFLAG_ANY, WHICH)
+#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX64((IN).flags, TBFLAG_ANY, WHICH)
 #define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX64((IN).flags2, TBFLAG_A64, WHICH)
 #define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32((IN).flags2, TBFLAG_A32, WHICH)
 #define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32((IN).flags2, TBFLAG_M32, WHICH)
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index c0b47f484e65..7dbc5759d718 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -753,8 +753,8 @@ static void assert_hflags_rebuild_correctly(CPUARMState *env)
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
         fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x%016" PRIx64 ")"
-                        " rebuilt:(0x%08x,0x%016" PRIx64 ")\n",
+                        "(current:(0x%016" PRIx64 ",0x%016" PRIx64 ")"
+                        " rebuilt:(0x%016" PRIx64 ",0x%016" PRIx64 ")\n",
                 c.flags, c.flags2, r.flags, r.flags2);
         abort();
     }
-- 
2.55.0


