Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F95C9830E
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QWe-0004nX-15; Wed, 23 Sep 2026 13:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWV-0004Xy-0M
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:12:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWT-0001BL-JE
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:12:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTaTx3798561
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kRgYgQN0I68E441Z6FdMRIvgm0ZT03zmfUCw+g3PTWg=; b=JlLKVw0ElzDUVHJK
 Ni43HEFvUiXP2AWV7nFngcMz22cFMlCnfoc3+t0Cwia4Y9+WP8ij4NnrPRsf5WlQ
 d2fP/W9B95TUiZZm4kkY/mgZU0FXrw316l2h1GQ2uWh9GKrluD8Efb039ttAcQvR
 qlyXktrk17DqEQmKjS6IWJOD/vACBotomCV5U3TctWS9WtsvuM09ce+4fRkWGgpC
 2ObVsdFGIDUgsVd5No8Sc+lBFERhXKFM8x/g2kBYLaep+IvCfhqpghNlq9Jl+WOa
 a0PL2SbXfeqG+A4qIDdVhN+5zMmsM0CdKerhtZ0069dlQVaRdpHeCweCk9UTfvbi
 td8HwQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb0bwd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:12:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7915a83539fso1053746137.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183553; x=1790788353; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kRgYgQN0I68E441Z6FdMRIvgm0ZT03zmfUCw+g3PTWg=;
 b=d6mDxwgaJeZOCENJsn+KJ0BsyBNyb0L21h+xIVq4OuoVzu/rYeQJneCGAmQAA/Vs8m
 jfT7JdgpG6K2N78mTcMKVOxC/MtjcTHsYO7vrFWvxoTsNn/IQyRHARrAfobRxFs9zMjF
 3LcP7hNQh1s8mzQ/40Jyk9KwAM89Zxz8wmy7iqgpo5iPQNPkJz0DIp3l7JL4MWbvZf4m
 RTcpmcjGtgEE6DJ3rox07badJkHG5Uc4ITyXjpvQCk+ajD3NJkhzSedbc8Nd8jDEmn/k
 aaBrUQg4zM6d9kYZ2yUJXoCP3tyhPSxCoV30geYQFC8Irgq1xxgDrwA2/CMX8U5QX0uT
 vmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183553; x=1790788353;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kRgYgQN0I68E441Z6FdMRIvgm0ZT03zmfUCw+g3PTWg=;
 b=VqoQcwmaTM99tzataMojSE620+6Ou/Ua1IY0j2MAkJu2SszTmL4vTVHjAYbk6reRdk
 B0ciKF5zh9eX2SXgZx9tuieeSTRhzraUgDyXVg7PR4notpiCL4o0a1FjtX/mmx9Cny/p
 mH1Fuf2Vh4sfIEDTfnKYZl1Aycio2PH1wpIGivCEWvGMSeYTJSiHDkQeKK/BwQRXYT1G
 oGd9UDRz12izM57tvorFp1mbf2FZA5RdjaHrp90WgBydFvwMi8MhFph7jcySCLBgS30o
 rS1cQfRlVKnISAWYdENVJz9bMtOTnHFASxa5d/aksoNYbM7bx/LhFrMgWYD83ibTZE+P
 i2/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwiBD0ag9z+WQztSHQtQLDfVuqF5N/wl8EMW6j3Nn/ZcTBiqdM/3XehTpNs/eRdykAuqgOusAr9WA==@nongnu.org
X-Gm-Message-State: AFuF++lZmZuEW37B16n9KnHlHlK45B4bVy/uatxUA5r9E5pNQileRHUh
 pEMqE0q41pChv8m5NfQQYQVYh+YK7TQkky9XcZHAvhfe6vNKL+o+BuxwlCyaJqtniCqk6ei8kt6
 TCBE0jCO8MrPLmaHItYP99NbZKERjBH37J4OcLwnA0TqPlqPHMGwgUtiudYl44Tj3GA==
X-Gm-Gg: AYBFou3OpNTZa13UFOi/7GUMDR0e7uVcbbgenr7qUyvSNvpv9whK/cxz4SYcYBq1cb+
 ZjbT9uf5fblCKwn0KsfLoMNOaDYhEebHqe3Pr24/MR4oPfrFR+e31Xg822sNw04jD4C1Yqz+eYe
 1XlqUsnowZEPMaCL/UtAXKwU9RzrkqJgpG5aRfPxOzokBFpfqKHocX1NDMpmGxK+inbGmxH4D9n
 SKnydGtqAtSgysNSzscEC53Ruov622Mm9lEqVOfv3LS3WzPKupsYtnyazYb5ds//3Pm/AuJjg5Q
 mbXlcWi/AeCwJOe4OdZxH7rBDvaYeTaThs7axY40M33Ock26J+uJivHmuiKdwp2ryLVbv6t/NDc
 uXBeL2YHqb7Lpw5y1GczpejUbzoXLxxbBVppY4YFC
X-Received: by 2002:a05:6102:6886:b0:7a1:f951:664c with SMTP id
 ada2fe7eead31-7ac1c78da3amr2579079137.19.1790183553480; 
 Wed, 23 Sep 2026 10:12:33 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:7a1:f951:664c with SMTP id
 ada2fe7eead31-7ac1c78da3amr2579062137.19.1790183553101; 
 Wed, 23 Sep 2026 10:12:33 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886848646dsm7548518f8f.10.2026.09.23.10.12.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 10/21] target/riscv: Skip empty MIP updates
Date: Wed, 23 Sep 2026 19:11:04 +0200
Message-ID: <20260923171116.31276-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tycuKnoXsyr3NoDNb4V5459YScupqTr9
X-Proofpoint-ORIG-GUID: tycuKnoXsyr3NoDNb4V5459YScupqTr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX96hs0clL5tsE
 g3KdLJ+ngjqZS/0pyi3XrUbvpAbMHZzXSjLHhhOrM7qOOuj074GQwvtS09g0rjZ/F2zLxV/Ro10
 ow+2dow7E4MgdcGOXg/bJ8sdxqV3qqHQKKa7zeWDkjYBUtsGyBQmIzXAeVRAmMgt9BmgkTrjhYb
 3E21TkphP8EsiG+7kkscWDGhH9tBkeQYFIHcwyLSgOu7m4rkXY6nfDdKM6brVtb6s8jEc9wImuV
 dnnB2D38eXbqkWxYlH1/ap/1ziSVaQiSSO6XnH9G+7Da+qFJ3PZsKqp39y1mO2ERVgCNvNRxamT
 kDTBk4H9dc2/nf128XFqMe5YSKyClDds9JYVrNwm1O2jZ4wo/5/XU8DLu7yxXlzC6BnTByIMkFA
 dFTSY9JjBGb1iucEPsQyg/YU+9r6+Y8z9TrvQtKK0OFZtKERb2govxBquXAl27pkl/h1quHawLw
 hlOukzVpN/romU/YOgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX6q/LuA8yDCfT
 /Afw//HDBkYcvO5jmU4y769gkETelQRGqJ9rP8cceECzxXWxs3n8RYOQy8dFi6HYyO8xTbC60J7
 n6CzBeqVeJWDNGWU/eJMmtVGx1Lk/dU=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab40882 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EurB-bMe9Chw_IDMuCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Return early when the effective mask is zero. This avoids taking
the BQL and processing interrupts when riscv_cpu_update_mip()
cannot change env->mip.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/tcg/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d92226527..be64f9ee8f2 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -580,6 +580,9 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 
     /* No need to update mip for VSTIP */
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    if (!mask) {
+        return old;
+    }
 
     BQL_LOCK_GUARD();
 
-- 
2.53.0


