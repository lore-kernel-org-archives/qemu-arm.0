Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635BAC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LCH-0002dl-0c; Tue, 01 Sep 2026 05:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCF-0002Y6-Di
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCC-0007hc-Mp
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:27 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179QFP2321978
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 38a/DWkUdMCnjY8t6uZkE4/mO5BQpmR3K14Wsfw3xBU=; b=UcQAoGKUfCstH+VG
 ajcnHosqOuyifjRfiXiJQDLjtYG7rckkoPtAZPvH/j7hMQkpsa8pxCxPmN1zutE8
 9q/x+HOWy0GuMBarAT/fl5++0Ik1w+NlVcelf7OGA8nBR3W/FXIt5j1MvNeSzgz0
 /ZXKJyDi1o2D46MPcAbXDX+Sr0niGqdxmujtWd7QxjYxBRqaWC5W3rV8UMIsOM2r
 PK7YS4qUtgF8gNdgN4EPBrypk5uvPPWfq0UahR/GMDAhAjGxKf2seb2O5geogVzg
 p1wknAH9Y4xA/pPUtUzLZztep6+1k9cSSL5BWCJCdKiDiu6BXuMhi0NVD7A9cZ6s
 jLf5+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchban2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93903982af1so1056148885a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256463; x=1788861263; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=38a/DWkUdMCnjY8t6uZkE4/mO5BQpmR3K14Wsfw3xBU=;
 b=Zj6notMRSdTzY9Jxvd5czjFONWs8Y3CSZjR+EwxxAIIVUygstf80wva8FGQo+3t/5p
 rPlyfWXyYoFw4/SxX1F0hFoFAW9GfaxIROIXHl2vWvbt873KdyPA/enD15CJsk9MsBA9
 IwmAZsUWFO5//Ag1RWnLMfq1HvsVepk0qCYfC8Pakt1cmbY0H2HEZCLNTPngRltiGjL9
 zls/Ds2K9bDr9JiWrfUgS5CeSe7QcTUKgtSLMmRkBBNlgQ8ghYRS39y2dDU2AxK8vxqu
 bDfI8k2VBca1c+ItUFZ7adIRwHqim+UyydTwucC+sG5wt/wJhu0UbvJhc/Fg/X0DVJTt
 SQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256463; x=1788861263;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=38a/DWkUdMCnjY8t6uZkE4/mO5BQpmR3K14Wsfw3xBU=;
 b=BQgcrYiRNFikap3vjsiMCB23+vCm58PF/dYFCvoLmR25jmaiESjlmsu4xREcDFlMY5
 XQCj+xWW2NwHoYLqyxTMQcG9OI+JhCUQlRFRkT+m5q1UDzkwSsx3nifGspWJKOz+ipvx
 EW/Y77pQvVi0suaFN0ZuRcI+yLPjICsqF9V075wumK/7jleT8SO9mOUJi19NZdZMMKgi
 AbEu3duu7n5Q0bwNVw1ii/sppwTgGNuDxbm/rD3XB6/VPEUmDPohdWXzCCIA1mAeX3Pz
 NiUqkeI8nGsdnDnhheyDe7UO/bnoWtpNDtDULALWSp5R687IC20xZfD51xgT2CQ7MGJ5
 ZTnw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro1n3bV/lSFdNwuGdmA9VyxJ1Bsxh8cu0+LbAD/uve3jJ2nU8JEuOAMyV1CSO+3AAEmEQA5C6UfHA==@nongnu.org
X-Gm-Message-State: AFuF++n5MkXVOTuxOWbloaH4TY9Sd88m0Lul6snphVv5Yu5itqG4BjB5
 qtcibvxPNnPHOe1kTqzZNCAd76wEy3zdRUhB3Yzj7iaWXZjsds8oUPhtzTMiSgxuj/gJgNQpuzk
 7H7eXAeJ4ZwHSwankybqK8wj3MjNgrDSKPuMMPs/8g8rQA3WuvmVyNlE=
X-Gm-Gg: AR+sD10fETXMP4a5GdFx1lfEudhtkGyItjUD4wtqGtkfK/vnlFdJRAaBUhNb+83FCxT
 V6dsb8vHhxwuNk22a2NKajklN31tCoWsFHBFspVD/+/1YhVF3CYVAZawWydrkRzlEC8JhdGJAxM
 lN9Tw+FG8rttySJ1JU94g424Q7v8On2Xq5Z58S2SEZUDDEhAyHq5iO12syHnDJK/B/Xl3KvOTWq
 py0mkDuvUF5xx/SwuWPjkZY3YOsAyan2iHLvZAKoV/2UjWkOkktGi0VxbuJDHdZIjpn7wyrNir4
 Nvi44NuX7QlxwUHeEHV4KpHZLD0FJAHKvaZpj9kjrcN5o9EOraL8oQgpMFzVzLxhAcWefO8x3lv
 LqTR8iIPmustqkza/k0Suu/+lnV59RGilPnJO+BNg
X-Received: by 2002:a05:620a:6b8b:b0:92e:5d44:73fc with SMTP id
 af79cd13be357-93913807228mr3088886185a.12.1788256462851; 
 Tue, 01 Sep 2026 02:54:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6b8b:b0:92e:5d44:73fc with SMTP id
 af79cd13be357-93913807228mr3088884485a.12.1788256462462; 
 Tue, 01 Sep 2026 02:54:22 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce199aasm58761745e9.11.2026.09.01.02.54.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
Subject: [PATCH v5 15/21] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Tue,  1 Sep 2026 11:52:21 +0200
Message-ID: <20260901095229.72018-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zE7QAM7KwtqgJn_ZfF5NSGwEySFzW6EP
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96a0cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zE7QAM7KwtqgJn_ZfF5NSGwEySFzW6EP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX1hE0H1ZibbnN
 gckVQE+McYBu2+9tsglIxY7f6dUSGUxPWLECL0HdxbrieVikIuMY9aoxQJYdQdrjtQVCiNolH+D
 IZo1dBcSomavwnylzygUOC2YSFwTvjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX/smRAc4pN+Sg
 rl1uoEayWXWOptIbMLdalaYsCpmLEotgKf3ZuUAe91I+1Lkit8FK1+NjzugUocBglOUwE9JbgRx
 jdhu3xt0HLfv941p7YvDnvDYwyAGj9aRaNHadPFHb5Xqh5Tk1IQ0WDgdkb7YhV6JfQI44xxIYty
 IwGu09pBuE+KGy4YdoaL61iwJxrJhbVYpxaije6J/L1dTniVqKXVgF611BtWg2LwcyKTiRE355F
 7tyRAxB4pooAEIhzg7ho1sNPQEnzwAmyuYouewFbsGSHBdCNC7BMDzcGfFpiNuSZR+iu3ebDie2
 6pABBG4BB4TOV2thMSs1o0uUkVuhqeBqTLrT3QME1YW5+G8t5jjV7+70LDG/mgyhv2cFfPApco+
 FVyWpwQhwOll25MI2jW2VrLCFdZ79whjdXvku0bo2IsUiM6d+D8WtNKbZGnPoJT4pgajV0tPZF7
 LCodmknI3+cDSvvXgqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087
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

@iprio[] is an array only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 718b66487a2..b974c2f4b4f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -646,7 +646,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio);
+                             uint64_t pending, const uint8_t *iprio);
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ab68ce65e93..953e598babb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -869,7 +869,7 @@ uint8_t riscv_cpu_default_priority(int irq)
 
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio)
+                             uint64_t pending, const uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.53.0


