Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227C9C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySjA-0000mY-RN; Mon, 24 Aug 2026 07:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySj9-0000jV-5q
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:20:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySj7-0006UK-Aa
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:20:30 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O98u2H3109544
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=; b=E5+xTKN2yuAoWHRX
 Y1JYTo0NFKYslrAa/Oc+I5r0oCNBZpfYwCbTRhMl7TknPRBnDQbamuWoPAZ3eCXw
 BMlRogW6lWwmVdYJM5KisTwL4xGY0e6+DF8S6CvKbCk2MUZhDxqxoKGvsPh4q6gw
 TOr+ZMXCmbM+HeJUjq0cOiJ01/9RHLND7nzc3hxwn5hKtj4M3I0+4sFpLYO+EEUe
 yukezxNXGOVU5sj02YdZt27R+S5XXCGdTJkAHmI/1H63ahDArmjL1i87BmXUXKkE
 7o8+sY3QiZqO7Sr6l2W4I75cfwoz6RI0E+bIES64Oekx5rXTWesYp+HwQxsHlaAW
 WrAAPQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk0qum-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:20:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so64714786d6.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570417; x=1788175217; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=OtQZ2g1jPNHXWHC+PKcfc7xR+OxcUphby+kOwNhsFmJ2Olkz5jxVkoJxXGoi8MNKwG
 wOHn9CnTq9/VabAFDYFZridzd5Z+dagHcLCV387gbtLF3xZIALpYJWCVLqIM0oMbZ7p6
 O8ne1hjmGKSg3VNA0kHYytl1BBEm5KN+MZ9ZeC1Sb2W0x93g5W4uUr1BynxQUMeM+CAH
 vXAyUJn9nogclOjd2o+weXes81I6SK8gXf+m4Aqnk070zlnzdnv7wXUBKxw918+0cyDs
 poxQmVVAvBRtGVD7xeDiDDiBS5wa0H66nLgP74tWxlVnmRsUA8z3quj8WaDlpCRJCsWD
 f4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570417; x=1788175217;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=Iad1TId4/Io0wiXB7w5ffJVttMSvF19X3I4U9EEjsJgJIJhat03Fb8PhbkA47d2Ny7
 80WGhyLmzsRmfOhRpwkzZEmeFqjhKX5vgOso/sdfdZqN3+1HJtrl4qFBJCjnACAk5XRQ
 gsI43TUFoRI3qB6zPKVXWI09xt4jVWAtCkZppdGKzahn73bXnjP8LiG/AtSaSvq1Rek9
 Uo1juIzlHDEIG8CzIJJRb2F8g+QPx0BoU7byKzQWvJthpjFsORzVaI//b0CEYbfF8oRt
 7kauCxmQ29izDmKKz0bFnLuqNxwbT7eXO/J8yBmtRZWRZZ/K59weQWI5TzFmadWstx0m
 Y+Ew==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKqeFvCPYqdOLW1ubWPAyDqJdsZ6Ys+LvmBPBrG4g2xSml5I7JptPQ0kk/5cO85k4sxSX/ESFL6w==@nongnu.org
X-Gm-Message-State: AFuF++mzDxAp4E08wJmYcEeu71vDIk1o8sJyjifv1w385kXhZMxbd1f+
 iRQQJRQuH+cd+031rQmolSN2S9Z1gR9SlmJ9e884JauiVCdeSDIQOmE86f4MPkA0jpKcMChcERG
 ZTB95S25Pn8l7kKyKCXCIzKEy3zY0UQNBY+nWrZP1zU/SuVuYDjmvsJg=
X-Gm-Gg: AR+sD105KsSMpiW1VCLv52iDFrtrWldQK8InbIMvdY1PU0x/KparLE5DTzIMrHNZaC0
 WOHsdOixYEj62KY6vV/C7s+G7Uyl4aDDh2mq6d1ZwED7cbi6CE+SUfytAfp4bPy0lHyawxKCRwY
 /XVtv4WN1mevGMPkCGrIw3K+7NAWyWMDr4Fbv6KDTyM0YCpuAKf9+rJLHQTdc48qVKMHDd2Kq/7
 scZUf39blmXHFf+2c6/wEvwDuXdxmqHr04FsIEmKSnGZLO9+yExTzrOd1FXs6XkpXBFBa4fQ36O
 LIL6iiKChi/y4gXJm4fBR9I0mD4TK4d8kjQtLDNoaLPVs7Hu62y/3vsQnNFF6CkCqoees2sJp/j
 Mr17hVudIriT5DiqLwLA0l9kOXBfo7sz/09UbUIIZ0EtRgjVdXA==
X-Received: by 2002:ac8:7e8f:0:b0:52d:a151:10f5 with SMTP id
 d75a77b69052e-52e09ca57e5mr169643651cf.22.1787570416886; 
 Mon, 24 Aug 2026 04:20:16 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52d:a151:10f5 with SMTP id
 d75a77b69052e-52e09ca57e5mr169643111cf.22.1787570416416; 
 Mon, 24 Aug 2026 04:20:16 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b208sm1135772366b.10.2026.08.24.04.20.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:20:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 17/20] target/tricore: Document architectural interrupts as
 not implemented
Date: Mon, 24 Aug 2026 13:17:06 +0200
Message-ID: <20260824111711.26297-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9zGq-tm5pJ1KQorN6DwW813SJlvWWRTY
X-Proofpoint-GUID: 9zGq-tm5pJ1KQorN6DwW813SJlvWWRTY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX/D+VYECp3yaE
 sdv3kGN2EG7BILRwM/EejFnFIwq7OCduvn2WDEJT8CsEygh2y4aaYpET9ubixRGlSZXfV6jCnCU
 p8vXr/kRA1gXlKADXwVBnxXsamMpnrg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX0yCV2iqol2wf
 9M1cleg01Ug5oDiuBDcVDkuRkJ7Nou4uDtjXJCj1sQ3y9IEVPdAi1vYy4g0WjNL0/lNtwxv9s6q
 ly808R2tEOcx859NLHTG11INL9jmvhYhr+WNcyMyshZIDNnsA6fLPz/BpjIKc94p0plFjNSyIzz
 kuEMROzdrg1HDHVqUH8LqW5QWlKS1u7HSEJcdMbNjZXyWFXhfg+nHQGpp96ZGeW+VWTgvjBbI9y
 3M0D0sTW6a5R8uBr/4GVhazDx9DOZLvASQMhGlPvuhfAADcyYLymErbqCJMR70lBQtqTTySTxVO
 aCZmw2p8mubx4UzeIW19rAoaNBTVQbvlEa3NUba3F/E1+1p3OUR/Mm10QoP78cT2YiNOkChqLLi
 QBsKXqvS2adHMDXPm20sBLBSwhM35/zwV6xbY9opyLSQBU4w8Ww7xXMIrDPzwMmVE/bTxWGPJrb
 SmS1WWy/C1/ACh0DWXQ==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c28f1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Cu_OB6cER5A0ZMY7a4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
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

As mentioned in commit de680286b52 ("accel/tcg: Make
cpu_exec_interrupt hook mandatory"):

 > Tricore doesn't currently implement the architectural
 > interrupt handling.

Add a comment to help understanding why this SysemuCPUOps
has_work() handler is simply always returning %true.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 6d448727005..82b56c3cd56 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -113,6 +113,7 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
 
 static bool tricore_cpu_has_work(CPUState *cs)
 {
+    /* Interrupts are not implemented */
     return true;
 }
 
-- 
2.53.0


