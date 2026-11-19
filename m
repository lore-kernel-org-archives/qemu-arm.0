Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF0606A320
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Nov 2026 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dJdicSar;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j8uqOrkZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUB2n-0000vG-Q9; Thu, 19 Nov 2026 17:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUB2l-0000uo-Rp
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:55:51 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUB2k-0006SW-Eg
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:55:51 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJJ1SOv1671587
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IJDXK74WzH0PQo6U7EdFX4iCvJOcm+jZ3pPLl3lcy/o=; b=dJdicSarTRiHxZG6
 7ZzijuEN1SqC7U3dUj/HGsxmUkAnSIBd/2TBWkWW3ZawG4OdEp/TYc5ODTTjNk2/
 9Ci5qNe9RNgQn9PX8OYqkHGdL6UJuyP/BPp+qzZFLWgj7Zkva08DvwwqPywcQ0lC
 RndJvCYZOmMClhPr4rM4iuQ4AtaxZDHkW7vB3cRK5eR2po6kL0/0jAJYbR+fA86B
 MxVmfpe6zNHPUOunmgu8SgZfFuoK6UqUxyX+FcGTofeKhH9rsXf10+fDs3KL5r7c
 xsm/1NcHin0c5nsyogrtGwMvCAS1/LSFitsQwPUxeicYHsWk9v8Ft3PTUgBKlgU3
 26Gtqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70bvpf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:55:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9495c71055bso71992685a.2
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 14:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795128949; x=1795733749; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IJDXK74WzH0PQo6U7EdFX4iCvJOcm+jZ3pPLl3lcy/o=;
 b=j8uqOrkZDhYd8e6lk2hFTeStBuz3P1ruinCGbKwj1eKgYpoUatwm5u2tuvOJLEScJh
 tFiwrN/5Kb7HtO3k6fKosZbkSzTGdTz+rEh2Icuca8OazX4R1zHJflpuK8vXLR+0jcpL
 fuviybcGLJTMWH0wxXE7FqBA/dNjLzXVLSyANuGNEVtP7MWns8IL4ul78u7/tydpVQsj
 GWhiPDC6/G+nDV3amgjZ3B+NG09zgJysZavOjQxvapQIJalMrwy7l8MoW/G8Ry0ZvOU5
 29rpxoOhNjb2OZsCEz1dpZEGv8/RkNEBHyvjPOa6Gk8W4AS0Jt/Sjq13vY5JJr7YOp2W
 UT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795128949; x=1795733749;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IJDXK74WzH0PQo6U7EdFX4iCvJOcm+jZ3pPLl3lcy/o=;
 b=KDP+IUVbwXMoinWlZxWNWXq2Tr8l6Yr1swPBn1wf/8fwahPumeSssnk12e8d78tpxi
 Kv0xwjfIeddpMlt1alZzg0unSt08l3utxJMnsWlxUxwoYCzrEBbzPtbNq/NwVlAYEHk0
 N0kFM9LcZpmV5Smxdk/Dr7WGw/2aTbTzn6ThzYpFUGVlAydOMCE8KC+csE1R6Xar0KmJ
 JrJlXBbkqIRyiJvM1oqgdQQw1ymw7VxLv1nuSpMZyGQxxVsW1a0JEeq20CG3ge8a/lUj
 ig12oOqREm8DPpuR0cNw4aFFgd57U+IotiPc2kF17X9lboiDwPQMu2TBFCzWbzUZVWXa
 RwNw==
X-Forwarded-Encrypted: i=1;
 AL+hErHyB2SEdkZwnKZFNBmSqm5IDSlKNQ+1uwQYiZSIgKzQiCvMh+E+n2d8AhZic2taelm17WsRbxWCFQ==@nongnu.org
X-Gm-Message-State: APuU4Z9wl9vz00+dXR+3ENdUIwBNHwJh58+GZo2sLXElxNLcGorEHprt
 L/smVcLhJ3f2KMifTrE4qwPkHBrIakmxEkg5fGRJZN4nj2DbHhrBVl/PSpIqZGKSnQJ16vaTktb
 qjuih/N8IWDo1HS3ZXtTx8jY8aO7/9rY/G7ofXKB+ZQ/XQDjI/kHXskY=
X-Gm-Gg: AYBFou2hQqodsEkRow3FnNHOuVUH85ZKbSfcOuBkXsYriseWzvhPpVOzVWjYd0tp+YW
 z0/JvU5OpVMq2zISuEBAE+i+zNN5Sdgbqa4lwAuIbhuQJQI2KF6//zdLL2OHZ1SDzfXE224pAnC
 Wc9b1LWF4Ys/fEB+6fDilLpEbOXltbzRt1AOGAk1xF7abUR+jugSIxtF3a1OaYrbqxhK9B6X36z
 FT+Ugtwrkw9F+Nt64JLP5VRp1ebMIU6qqyqv6HzQ6cvkCoZJAOwgaq7QW8oXhsNeUZ9fGfLFKmB
 mCeDsEnncg+CpONQI7y4s0AAF3KIP7FeUbZ8kGblj3U0tnWTwwR1mQeHv/2G5HUVOJMn7RtG+5Y
 hEgFo3ydqbMLTeBKB17gfnCqdyasgqMxkpLWk/UaRTEFPat/9jV50t6FCr3qXdAixbGifDqKYgo
 s=
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id
 af79cd13be357-949bab1dadamr217863885a.43.1795128948713; 
 Thu, 19 Nov 2026 14:55:48 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id
 af79cd13be357-949bab1dadamr217860485a.43.1795128948264; 
 Thu, 19 Nov 2026 14:55:48 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d55sm1960685f8f.5.2026.11.19.14.55.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Nov 2026 14:55:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ashish Anand <ashish.a6@samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 4/4] target/arm: Kick other vCPUs on SEV under TCG
 round-robin
Date: Thu, 19 Nov 2026 23:55:14 +0100
Message-ID: <20261119225514.4080-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119225514.4080-1-philmd@oss.qualcomm.com>
References: <20261119225514.4080-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _zl--0L-GVxwbD0q3QVDOf2BuoOJFCHn
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff7e75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J0BsVto9XRD7R-49C68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5MiBTYWx0ZWRfX9AYeGfpNfVcu
 jYRyS4of1MaMEPkIXKJ7MiV+q2sv9YiM3BpTrNFDjEy1tjAtaMEJIS35H2DW2Q7+vVt6kF+EYzt
 CuUlUT0YCeKfM7bR1WNNBGO35LF2Oxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5MiBTYWx0ZWRfX3n8eRxsizx8b
 1SPQ+b9xucGYxeGFPS/fouHLQKvZhLdnDDWcQFVsoTfV3cIfVEhrezvBeQQOqOZt4lTxjdgqoxV
 PzKfVzrwjbL/XwrWhVBQQtSpShTKHFU7MLTh03/8KbgjRDgxbjDt7Gi40NW7TSKKoV0BX1bOFUx
 /SFpsU1uFk7he8iS83hADmnyEObzOOHkiKJ5kFCnhGG68Qv0M7CXY6bBJZP1rTtXCfWgTan9Bk3
 UxGtYqmRWU7/L45SvfEMJjZNaBuzl9RV8LDPdIZ//wx2NocQc6j2zqj2DMkqu3442hgqZiPVD13
 AL5rLVFGnoHb+gpt6RrgJODhdMcKduGOlLEuKo9wSytz5kkzRGBGMXPhrOoqSBGzptW+0UdkoCV
 vHWFk6KftbKDO+XPoMwnb599yg+WMCbcYOrPkCahq4XAdZCwZP37bIfX51o5fXuiIO/UUTaOG1Z
 KvcfY5eM0909UgFDUOA==
X-Proofpoint-GUID: _zl--0L-GVxwbD0q3QVDOf2BuoOJFCHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190092
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In round-robin (single-thread) TCG, all vCPUs share one
host thread, so qemu_cpu_is_self() is true for every vCPU.

The SEV helper used it to skip the kick of the issuing vCPU,
and so skipped it for every other vCPU too: a vCPU sleeping
in WFE is only woken when the RR kick timer fires.

Compare against the issuing vCPU instead.

Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/tcg/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index a862b9eb02da..c2fdad7411db 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -470,14 +470,14 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
 
 void HELPER(sev)(CPUARMState *env)
 {
-    CPUState *cs;
+    CPUState *self = env_cpu(env), *cs;
 
     BQL_LOCK_GUARD();
 
     CPU_FOREACH(cs) {
         ARMCPU *target_cpu = ARM_CPU(cs);
         target_cpu->env.event_register = true;
-        if (!qemu_cpu_is_self(cs)) {
+        if (cs != self) {
             qemu_cpu_kick(cs);
         }
     }
-- 
2.55.0


