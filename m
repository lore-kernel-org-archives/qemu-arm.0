Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6B0C98302
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Qax-0002vP-Og; Wed, 23 Sep 2026 13:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXl-0006g3-Iy
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:14:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXi-0001OL-BC
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:14:05 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTsSh3665862
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=; b=X8CfVDa6uMDQ/2jq
 TFs5twY5EcHA+4Ngete2R3F+/zNXqH/rJ1r880J9xud5fc7AZbZBWEYfniZLatc2
 1QJak11Q6AmdbUe4kySQg76ygT4tPN0IM7RYGsZCTRQanpkNOSnBNIASyTX4i8JB
 qbH5wPZSbbx+UzDqtYrWevXlFBrZvm8JX8BHCzKHUZ6/RdGlpcObZkBk2GZz7NTV
 QuCJiahkD7irE5pJSLwAIbaHZ4fD5T1FzWAum/v799ZstZNXGBy3Iia6C8gF3ezm
 i/0JGfAkF+bSsxi9L5E37CwC9roAS/sShrS+KbdZv9ya8/7CeLrN/qXknnr38ZLc
 VW2SXQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwat1k8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97cb8d1b032so255094241.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183630; x=1790788430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=;
 b=b5eCe3asfUCsbeQmQKlPCd7eVBSVvkI2I3uSIAfqAdCxDeYkVlLw8UfmQ/xLQe76o0
 omtcMHvEBEj4LH/UraPhNMIIiIE3t2Uk8DydR9XcbP9sfpquqJgCjjWI+7/jkZ4J8IFT
 +hAJKGVP+ajBxHIJx0YHDq3O/U1eupmZUAUj6aBKqH4LHLJjwn7vlxJCh41qmDKOpaI7
 k3Ze3UQ6JyozsgFS2aaxOy9gmFCV4pV5jX3e5l9fjza+XtbqEVL7Tpmz5uBvr3+pFuF/
 yjzfH6+SQHrXpdtQlKC2NbPMLmIOp2yshXtW6lXTdR876PHoRiVtrAtcgbyKmvph70Vn
 ePdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183630; x=1790788430;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=;
 b=SfC+I4Cseeppie0zyCD2sJM1y68ujOMqUc6jp7MxD7T+44ic8q2WACQvK10ST7pjIX
 toGtKICrORW5bw5vhYtcPkLIZOePVnjE3ltKHDC2aCEHfRe6EmoXXGB/4iP+Tm256S/B
 iP7WZlyjbWR1iS6/OBoJ+mQtOpgEfdg3wnVgYUUp0rPaeox6xYLlYshodTpjeTy6DwRt
 S0eYl0fkwI/BHxdGTB05F71kOUyFQcPZhHhmq+caDPSLv42rxc26yuuiixyhEFqQlYqd
 QlKw1eBYgPgL2odhdOnXlXl7xDbNC1A4Yi/v8hrmtgAjIvVAImr7m18Jmhadmoy1K+nm
 Kdig==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWBz9OB7ymvRMQDF03ZM49/4TePxeAXzKS3EnZv4p9eAsBBdz48p51u2BzV+rGzP3RBuHwX/jPkw==@nongnu.org
X-Gm-Message-State: AFuF++mniqQQOkJnm5IWLb52d3oNt4hmKY8T/RMKzeYpuc9km/U+t4FS
 IZRTRDWXIxixixnrjgq1KjAsrkUR2uzOx4J6DvXymQuxKncYZZnmcK433PfVBh1m2WIDEwcYmeC
 Y4FzZZ6NPrAmGiYuGrwxycd2edPAabV6agJt+I8NkUZzkKW25QJL4VYc=
X-Gm-Gg: AYBFou075XgvNuMMGoopKmFsb3V646eIA4eZZ5PT1BptS/DfTgGksR91zQy4ibKgA5P
 Av8V81gIXNkPZOubaKcJIu5APQ4ihGaXk4jSefbrfnxERizXeh8WmpdXoLDLhkIN8bxzTZ87CQD
 g/Ow74XetsQZ9L9JT09VFGQJwSVccnwb87TY2k+26VHOKz0kPujJ9sTdZdR3jwYdrvMqeZ0zztH
 czKQrjS6aOMQJnu3Icy/dTVIlqyUmX9KdHosNuKPWlGL7To9mtnup7T8eCK8kBchHCy0YIwoUe1
 QGZm3jmXE745+lHuVCjhvFsI5jc8NP/KkjtcxJqwI42O+0D3x4jKtEem44QOcQ/dyjLk4xuLzkJ
 xbn99MmCch0t8M4IaP8a9uWoawxv/r2gpYz8L/U6L
X-Received: by 2002:a05:6102:f97:b0:7a1:f7d2:e832 with SMTP id
 ada2fe7eead31-7ac1d4ed253mr2983812137.18.1790183630349; 
 Wed, 23 Sep 2026 10:13:50 -0700 (PDT)
X-Received: by 2002:a05:6102:f97:b0:7a1:f7d2:e832 with SMTP id
 ada2fe7eead31-7ac1d4ed253mr2983785137.18.1790183629496; 
 Wed, 23 Sep 2026 10:13:49 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868886e45sm8590301f8f.31.2026.09.23.10.13.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 20/21] target/i386: Use generic halt transition handlers
Date: Wed, 23 Sep 2026 19:11:14 +0200
Message-ID: <20260923171116.31276-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXzniSpb1g2pWT
 Ou22tpwFRNYdbqzWhYp0Xcga/31acEP4puM3+i7VyZxfrGmhc7Tw5FkmCPnK5IyMI4FYHWjsXgC
 u44E6NzFWuBELs9qp75JoiyqKfIR1MTa1NCRXNevmRVa971RFIgwaKzHetZyCBB8dihx7XPMkGR
 t/MYl3bselZh9fzfh1/vNou/JmbadfAlRDbeOB4Z6yFwZOft8wkf9kW2HuwUGLllO2eoGvskL9r
 xrWR8npq+5TLUdsGoSnLcfqe5HuUR9VsS6Wde9MM7ZSabo1sSZJKRcRtgUBPTU3cgNDL7lPgun4
 thoJq7C/Z11Y8dFqSbKvodYgUQrROkocpKnjNMVJvV3aGg0GOohFBnJFSJ/e5OXAFgvljLozp9u
 faFZbWoAx7YQFFe2WdbTGn5bnCdQs9VsknGyn/ogIsYNmYOvrlaBnmn1RT5lEBhlpgDUGyHlhbC
 iLStBBdUDExhuVwEVaw==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab408cf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nd3ZySRasPe6uQyUdIl5ozw2aO-uJE6a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXy67ztFt08nfr
 QLDzyJ7smDPGo8vEjN166HG/Qn4Ah6V6vu5Tnw1GoRpPUR1va6UAoFpcF8w1q6pjElMRonjyJnp
 u6hII7I5sWg/xBZG7kYUxQblbiCoRkU=
X-Proofpoint-ORIG-GUID: nd3ZySRasPe6uQyUdIl5ozw2aO-uJE6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Register x86_cpu_poll_during_halt() and x86_cpu_leaving_halt()
with the generic TCG halt flow. Remove the target-specific
x86_cpu_exec_halt() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 -
 target/i386/tcg/system/seg_helper.c | 11 -----------
 target/i386/tcg/tcg-cpu.c           |  3 ++-
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 96accb30a80..4d543556a9f 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -38,7 +38,6 @@
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
 void x86_cpu_poll_during_halt(CPUState *cpu);
-bool x86_cpu_exec_halt(CPUState *cpu);
 void x86_cpu_leaving_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 566b3d4d80c..e24d01000ad 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -157,17 +157,6 @@ void x86_cpu_leaving_halt(CPUState *cpu)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
-{
-    if (!cpu_has_work(cpu)) {
-        return false;
-    }
-
-    x86_cpu_leaving_halt(cpu);
-
-    return true;
-}
-
 bool x86_need_replay_interrupt(int interrupt_request)
 {
     /*
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6f5dc06b3b9..2fde412394f 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -180,7 +180,8 @@ const TCGCPUOps x86_tcg_ops = {
     .tlb_fill = x86_cpu_tlb_fill,
     .pointer_wrap = x86_pointer_wrap,
     .do_interrupt = x86_cpu_do_interrupt,
-    .cpu_exec_halt = x86_cpu_exec_halt,
+    .poll_during_halt = x86_cpu_poll_during_halt,
+    .leaving_halt = x86_cpu_leaving_halt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .cpu_exec_reset = x86_cpu_exec_reset,
     .do_unaligned_access = x86_cpu_do_unaligned_access,
-- 
2.53.0


