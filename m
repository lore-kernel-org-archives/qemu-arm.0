Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E42C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:16:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QZr-0000oF-NA; Wed, 23 Sep 2026 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXP-0006KM-G9
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXM-0001KS-GP
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:43 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTeZb595980
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l6Mgb7WSMEr3uGW/YJJ4fDEAGk+u6GelQD4cQHsXAfU=; b=f/UcJ4hef17o7Ihs
 dCb0N/0GNCEFQIvNfubVnDhE0AuPP3nceLIaIRUmnNDlKXcJ32PKasJGI5JulpdS
 F8pIJHerFwDy88dsVfJBlZrzw99siJMpKHZUFwFIrkNyirAX7EM1Q/WGIr/dNshp
 jxyW5lRASX9vuavAxq4uj+JFl7roeSotW1HSV9IzRGPoA7EvJDctCX8g1TF2GKGt
 gVUwPJE1/aX/x06s5XKUmrUl397OwmFl2SsZZXoT9XtpH1YyNFj5++rOHPws7da/
 hR/CMFOzcPv+6K+CouNK7oVmLyqQ+sXxArpMGXdKokUNMSLdpzT4zrc/utYX3n+z
 ZfNcBQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3nc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-78fa7ff1a44so408765137.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183608; x=1790788408; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=l6Mgb7WSMEr3uGW/YJJ4fDEAGk+u6GelQD4cQHsXAfU=;
 b=JI0scpYtv3BhzjeqZwM4LjF4MeayDckZnkpiI85B/rqNYAdiSk/oLz3OR8+NE6brp+
 Xuyrekgx8Zd993UI4yh9xCPcGQMDij25vZAoO5XRXXou4nc4lnr8VHAEbSNdzkf1rZIA
 B5socl/UXk9FWKwh+4osHBYVdT9AqpVt5A1odIt1R/4rciPbIGfVjHJ6dmmq1HJthwcq
 ISKvOensuDseAPnPBEf6WvB8psiWIvhL0kQXiI8sMpg3Ra0hSxqXhgwRTtcw4pXbFYZ2
 c1cxJ9yrx6iFAbKWwBOzVNveLeHKnsk31OY6KugcWt8dZRUj2z5ovvSPJ3l/AkGaF8eG
 zcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183608; x=1790788408;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=l6Mgb7WSMEr3uGW/YJJ4fDEAGk+u6GelQD4cQHsXAfU=;
 b=PljcOPPiKmtQXk3l1frspkrgqpngKTQ+IPvstMuqcB8vx7FSrQZ6dNugo7CzgTuXZN
 mvGiikC3XPijL4hNwDfeMYyNbfvB6rIkoy0hP2zOl/FixFz1rm11Z54pf/v01LPWCzr2
 R4Wpu2z8TjKMVUgVOZJ3bAAAs28lcKDAbHG9fzVsGmOLr4EhzCSwqxtLV7z8SHmpx/b+
 WEZsR977Okib7x03Lxqp/dZEpNYzaToTQDamLrGYIb9dlHQI8SMW98gjSBddBSf58sTM
 MXK9lSdwODHsoFdPB8/F2W87u0PP3BZU5WwsoEIXLcEkeoy4g5O1k6GnlRtZo9LPaxkL
 ockA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWAm3LmjulAV+Tfo+tlA8w+ya4zMeZ/tCIyKLzmaeYaWsSYwauapY5jdZ49tkZG1BlKOHovl5NKw==@nongnu.org
X-Gm-Message-State: AFuF++k8nOA3GjfxC5m6fg+nu68MiFybJNC24WUUMZvB2a7000tz1gwu
 v4IgIcIum3bUCYFyIFpVLobZII0qV2Q1nglnOosDs49znbtf0I3E2Ar3wJRUxoh05x0en8OE1kq
 haNtg2qwtDMch6U+RTmNWsujFZyGzpRixxl3KCLLtYHH2wdZIh+k33BQ=
X-Gm-Gg: AYBFou1GeKfhJgnF/2kPpvySHQgTOMk9Nu2bLqnh3r+oxhZjsomo/GZeB9qowKmM8F5
 UIfZ+tiRahmKE9D4TfrV3FFRJQfZ/B75B37BDxQtAQNtLYU20Fa09PUGBF9QAHuGXSdM9dpBgqG
 T6gkcS5lTfHp244nCsRIkFn5WJIAMVUzXTY5qG127Wo74IggkB2cqprShWMhxl5j87dxBnraPCb
 anpHa/6mBApAbnxlQW94pDLAaKpTFAJctlsq1198fcHGSX+EFeBut3+GOGSQTg/TtL+qRsLitQ2
 mCTVXgmerpg87nXdBhoa8F1qyw2QcJPuWKpYQqUF6SdQ3nl2wylqCZiwFeVUEqeIoAUbfev98ON
 XGrGCuGLZlq2Zo80avbcIyEMtihn78jOAVYMU/Erg
X-Received: by 2002:a05:6102:512c:b0:7a9:1f19:2d40 with SMTP id
 ada2fe7eead31-7ac1e6594c7mr3146552137.32.1790183608086; 
 Wed, 23 Sep 2026 10:13:28 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:7a9:1f19:2d40 with SMTP id
 ada2fe7eead31-7ac1e6594c7mr3146521137.32.1790183607545; 
 Wed, 23 Sep 2026 10:13:27 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886876c119sm8895703f8f.15.2026.09.23.10.13.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 17/21] target/i386: Use an acquire load for
 interrupt_request
Date: Wed, 23 Sep 2026 19:11:11 +0200
Message-ID: <20260923171116.31276-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LNA9w6hOOI4OTIb0B2WiHvCX-0537Lqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX7RvQANXhotNG
 T1XjBqf7rAeqWkTbLIUSF+xg2IUp1j9V20y4W3wI0FplPplMNd7Og2romAemdoJBZxWqH/j3Rqk
 qBgsiahWUREB17J9CTQd92WTfGjKQnZHRkYRXEq02CKg+e4Q+odBcaHK94Y6B4sl/Qy/B/peW+N
 kJwHYLszDgc5PaRQxJ9TzGf/KLuvcrgJeKraZh+LEtgrwXdAC3ELmQwWrfo3FMf6hTThBqC7qGL
 4JR/s605ERb2qsK+t6V5uzHdA3MHdVlvT3CvlGUVg7SpaAgWi4DQR2KMsVG7b1YJQi3CL+bWrCb
 nsARYe/GsjprxlbHHq7ebKwP7XOSmjkJe7HosZXAb/lXbYeZba1re7umUDcfdSHp+9a1wFpzXaZ
 7sq7Neu1AvZKJrtdacDw54v/L8WEPGMQKHwpc644hdU//QMckOLJ6zr031Q+/kKYMYBgjXVJKke
 f+ba5PS1/o0OLTIkEBw==
X-Proofpoint-GUID: LNA9w6hOOI4OTIb0B2WiHvCX-0537Lqa
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab408b9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=8gObA4T9cFbzhFTk6d4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX1guBf3Qo4UCY
 5sQEpCd6iZPeORYT3GrELKf3m6omHzyBoW0iIH38uQNezgj8jDWt4gVE9Q0anL1Irlnhm6/1HqV
 g832lIksQOXsfft1P6//Ygv28CdYeXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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

x86_cpu_has_work() may run without the BQL, but currently reads
CPUState::interrupt_request directly. Other threads update this
field with qatomic_or() in cpu_set_interrupt(), so the direct
read races with an atomic access.

Load the interrupt request with qatomic_load_acquire(), matching
cpu_test_interrupt(). This provides the acquire ordering required
before x86_cpu_pending_interrupt() inspects the CPU state.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b97f144aea5..ee1aa3a5a70 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10640,7 +10640,10 @@ int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 
 static bool x86_cpu_has_work(CPUState *cs)
 {
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+    uint32_t pending_interrupts;
+
+    pending_interrupts = qatomic_load_acquire(&cs->interrupt_request);
+    return x86_cpu_pending_interrupt(cs, pending_interrupts) != 0;
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.53.0


