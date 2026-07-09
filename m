Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ACCC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 16:41:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whroe-0003CG-1I; Thu, 09 Jul 2026 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroc-0003BW-B7
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroZ-0003cj-3c
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:33 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669EwhDx2062499
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 16:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6+NumQOKfMH7xgRpkQrLTiQfxEVRG2QlSf2brndq35M=; b=m29ZE4epxMhU/NYt
 fFJ6XqxlovGV+rJBi12DeD0YjMDcX9qZoh5tOI0HmulkBuy74KSWGkI7YBedWpan
 Vg1AoLV08tUWJBPl+dfIfC44IPkG/tpgxX2KBNO1zrIM2TiKcLouLEYJnpcrz91t
 pBywulBYfGgReNmzpB27pN9hcmZRVyN9AE3Gqz/HcazpCLJue4XERzl7DNVwZXL7
 TjBahXOrf5yxlnRNqfji66tNY8Vyp5+UcQ8lIgTJOVIcBEyPm+X+u1b++8d47ffp
 pL7NiwT4X39xh4ptnvWr+h5ISAsq+5A30FMHR5WhKjKXctWI3d+62vR9E8RkP2v3
 KcS4SQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj8jga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 16:41:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f000e221d7so1895546d6.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783615289; x=1784220089; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6+NumQOKfMH7xgRpkQrLTiQfxEVRG2QlSf2brndq35M=;
 b=jv9sB1DBRAa0KnSPyGQLoj5SXmUicPURDO0bsXwqkVKPVlwYm9cXvLKF5yc7NlpozW
 6jmojYh755+I5qHqUk3fB5qyeiWAKlsnf5QTmwBomLx6G+1ojDzxTJShAS3ML+1xpAlu
 F+GPpuqwrYqEg5LNMzOa2Qa5WV38HkCYuEBzbMnrrq1FDwLjqMgZDJTdJE/xklvRy0iq
 tLxzBCth9uSr7EshPCv2MRWLZyq6YUDXBG7C2ipBghDrU9/Nzqzm7ZJH9Q2rzO2tveJx
 h2aDE5VF6XwtyS/cHTFAwIYt+r5grKchMS1ed0bGif0Zy5L/PNvYwAFz7QZw95Gm2aIU
 6uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783615289; x=1784220089;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6+NumQOKfMH7xgRpkQrLTiQfxEVRG2QlSf2brndq35M=;
 b=duAQTIpnGh+blb8MFafrxgt0aFClNrLr5NlCmI7i/XjsWCt9t0vs+rnB4+g78IOJIq
 8IgBKUfF7q1PIhToK+bz1DIBycuxrblqk4Cbb7QXkiPFN/NpYNW8HvMELrPC1uxM6S1l
 mgEYCjvQVSjsrSJbp7uaxInj8QnLh189GO1E7QucRyp+bAjn43iu7hSTgk7Z+YrNjgjn
 E9g3EYXFeCm1KSOm7tv8URf+SmmItbTdVlBvbSE7poPXkknff3nThXyK7u0nSXtsLZ3W
 6EulHiw7w02MVZB/8HebqFALtN2thGk7n/gejBgnfQeaXSvGmOP4F3DeIaSSOfaIxFIt
 Qcdg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrj0Ol3azF+iWnhza1JEHpI99ykSlB+R2BqA3qd/hQF6xFraQi4ibLnVWEtPM41kpDvh0scGEqeeg==@nongnu.org
X-Gm-Message-State: AOJu0YxB7148YCe9Lrn9RJm82NFum1zoI0krxzGWJAFs0aQXz7u2DyeE
 KUvKNCZRoQp4tHRYn+YsF1Gk287icD+IuRsm2CCw4Kx+tAeQFea6e9DS7Ll42mzgL71mS2iGiTe
 FLPjX2ANLwzbWr4RJLJaxXTRJlDJ6uHIzYe0ZYx7xEKuKrwLCjhfsNys=
X-Gm-Gg: AfdE7ckBjAEiy+of2ZUe6LRiTgo7p91lYvhfA61DmQ/sGaCkiQlnBelN6voMx8Dd5fC
 0SewiIgeRGzTOGKOg5BnLe73U8k4PFj0uJ4yq+XYj6VmebeMG5nIEkW+Y3ZZEX9GjKOSoCIINV4
 xtAbWBj1QGHcNg6Z/t+UtC70joJs8AM+uBmUh1jRXmAZ1x85uA4rB2E6cytAG6VA6folFS5L1q/
 y5uCkkMTZykZsRXg6SRVv3XWb4WMxdrLurzRLo4gp5wHTOCsOUeyQeSYHOfuFs6L0kb+d27SQIz
 ydzi3t3Fhh8IRORNX18EL0KfX6oRnqqauJ/NU0ZyikigBT3NLxjpzFk1xgmIuQBeM+Tvc6f9wNc
 48cYl/kpa5W9Pwt4oBqxXjldPmQc1TMtndwNWXmYLlNLFzKXE0kdxMOOUNtkEPo4zNctj
X-Received: by 2002:a05:622a:1352:b0:51a:8c9b:6496 with SMTP id
 d75a77b69052e-51c8b40fd3cmr83837081cf.58.1783615289148; 
 Thu, 09 Jul 2026 09:41:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1352:b0:51a:8c9b:6496 with SMTP id
 d75a77b69052e-51c8b40fd3cmr83836691cf.58.1783615288706; 
 Thu, 09 Jul 2026 09:41:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f214d2sm51352319f8f.33.2026.07.09.09.41.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Jul 2026 09:41:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kane Chen <kane_chen@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 3/3] hw/arm/aspeed: Add missing Kconfig dependencies on
 optional components
Date: Thu,  9 Jul 2026 18:41:02 +0200
Message-ID: <20260709164103.37614-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709164103.37614-1-philmd@oss.qualcomm.com>
References: <20260709164103.37614-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX5saOTXTr+xvv
 dDCw377hB6F10VnJp1v3z5BUFNiuCAD4tEWwOcPGQlIWjJ40ti4lWS7gr1FZoU12aSikM1YKPIF
 UmefhSZbKvaUkBXLPmnTStjI4ig7aHzrk9lC62VawrETZPYsZebEypWPkZS09Lvaz3vYOZeviNI
 SnNksOa04N7GDRoq5YYEa7nBJuHtVo/g6p+eYpEuu/fG3cCJ+KXegrtdRMuyTHN1Q89juQxpxs+
 lvlDftlQaEnNQf9hqla7ficV70Y+M3v2ZttceaImXaltqnmChMLxApKV2PAJcj44KDTsZGeqjY1
 L/RRvOCCOL8kEhiSgK5TLJmZgnr/02IwB1ecufh6tBckqIiOybT/9pf6nnMfEfDBPs+f39VUZr/
 m22Tn5oUgtc5WqFoSt3z38ShpdDXDZ873+VOKoDgdPyVuwsA95Swmg7bD2HtNnZVIDMb2DqFv26
 nqBkK6x4V61OZHsxakA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4fcf39 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=44yfr59QGiQIZl82vZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cEzwiVeYLWXUiZm9FdPvg4BtuV8ojQ_I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX3xfjAXlwAHgI
 Fs5qIF6BdW0HtFrBZEFj0pKuHLTjb/XGs4Z3+sf8xpdUduPophvLe9BPWD0XGP3JbKnPWInwUgf
 hjnJngVZx7uaSXxvaZ6sXP+/iDoxJBc=
X-Proofpoint-ORIG-GUID: cEzwiVeYLWXUiZm9FdPvg4BtuV8ojQ_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090163
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

Add missing Kconfig optional dependencies to avoid the
following runtime error:

  qemu-system-aarch64: -device loader,force-raw=on,addr=0x400000000,file=./u-boot.bin: 'loader' is not a valid device model name
  qemu-system-aarch64: -device e1000e,netdev=net1,bus=pcie.2: 'e1000e' is not a valid device model name

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6f5b2add66e..5869f0f9e89 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -533,7 +533,9 @@ config ASPEED_SOC
     bool
     default y
     depends on TCG && ARM
+    imply GENERIC_LOADER
     imply PCI_DEVICES
+    imply E1000E_PCI_EXPRESS
     select DS1338
     select FTGMAC100
     select I2C
-- 
2.53.0


