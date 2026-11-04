Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2807606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JjMHi8O5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V0WvObPS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOcMn-0006Iv-Qb; Wed, 04 Nov 2026 09:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMl-0006Hs-IY
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:31 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMi-0003ff-Uy
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:30 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4BZlMU739119
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 14:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=; b=JjMHi8O5uzRkXLLy
 iRMhVsN7Lnq1c+vZ4V+vA/kD/f06Ed/VPKuB7HWHeZ/6OIbCVyrhlNul6CEH5u21
 vJH8hIugF6/UrUh1ul+nG3mP3UPxCl18DhztTQti0cD+IUKJ+vK0G1IbRt0Qqc+E
 BC0OAGOH+pSNI+iGQ4SgQWulxq02pmpHEuXt0hVxlhYLAwXl3RjA1cwoPXQ8sfAi
 Pm8M1VkoH7O9xnrsS8Ut+T6QIXwf1IZx9UFM7ZgbzqOicuW5yNqC+oHQZ+6Wb6Ss
 o4DM2DyMlzNUIdDPak+7IPw+JQWxGs3CnCM8Q9wyrIkf2C0NxiE6fKimYLRiXHTA
 vDysog==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hgg9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 14:53:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7cc48fbca26so164929137.3
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793804007; x=1794408807; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=;
 b=V0WvObPS5GLvVmhPb3sFOxRxWoxX2fnU5GbtM+d5wieCJx5Gtnvw+mpZlReqgrSK2b
 x9Rvuh7qNkR/cGaFkPeywCk12+ncpXQf+JlQrjuWAOv6lq/ABXXG1FhtQZSTsPRQ/pWt
 U/w9Zylvz2hRKoQMPbyS6EwYF+mM/gele7DsVSv83Sw/EMctPw7XSuO4Mdv/zplCaW/y
 lpMleVeUH1/r3IuIxLIAgTKfrQ92BJb+185uVk6p2wCfIttaRoQnQIIo6FxWTr34FbgH
 h84UjqNFqquuyebRB1o6gau2zJUhBh78lyRg5CoMZ9h9NFzPttVt9b7gPADwojJ+wjKx
 CJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793804007; x=1794408807;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=;
 b=fUGZSTHkL5p3laOrGxpHaP956kV8K5NedR8o5oSOX1I6uvh79TJCt7df6He87DVdN6
 zaaJAS8GvZ6b4lMTr9fAVlpe86ZOxb27bq8tRudyYLRTSnYLkY/0nji7TKM2pyKnNi6r
 eQ+WNPJUQj5q9Zn8nXnC4GCQ7tCKmg1r6JVgmazEaXC4Xyf0p8pGgYki98GJrssR6oUE
 e5p1Dx8V4bq7rrQoMnHOk+LcibZQ8GH/YWm6WG5hfZw96TxPIQdj1BdMsVGuSepgH9wM
 3x2/E2YzsjxWF9eiW7NjiHHnaYx3IelR32itnwpOuY8FQ+hh0jok8DxcR+zJPRSXkEVz
 VROA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxShSHXuGiqmNbs0KhA50A9yGH5tDGzbyNc02DS2q1HXV2urZKELVx/rifODzPSydrYtJumz5RjTA==@nongnu.org
X-Gm-Message-State: APuU4Z9f226ltrBkTLAHRIKkNcGGFM4LQCYzTOXSP6fE21BMlG9KIOeA
 W8uzNG9K8GVmAv0TPtT4Ff2o8JE6TVdQGX7ySgKTo9JRs3iom9mwhzKgxUjQ9nsvV3zYVRs0vxI
 1E7qeZS1smSVTRLMTQWjtNuTi0JK9vEgIojDoRT/RvbDj4WR6e05ZDpQ=
X-Gm-Gg: AYBFou2hRmGahrW5h3D69lmf+FNRzaHDIp8svG1Y8hN5NAs7hbSRmnesHPzm3/NploP
 Jc9xufNqmBeSrmRvbAA+CVu2KEWnaV7e110BsX085I+quYJn2yaafnnZkDbQ+/U5Hg5ar3mndwT
 WDsTeEm8DCfJIwypMRQpbpixx58JDO9pO3chA/bsFb0qQeuNurCEkjL08mT1Lv8CZvwvwFW0dOC
 xQP2OoNkOuY4nIhEOMqhhfksOXhpEhGZppuxd6s1BE1/I4La49sWhyOsCtFhYqLetbfpCcG9aYp
 tM1lp6pX1HmxpAbXXd9F96QyyoliGMIRsVDHV//IXaOZ4tcn3nUATh9BWwmZALxhMc/KApw5Fbj
 FsS9d48nGNom3VKOe1UwSA7O4a9O2cx1y+4KumNW32WuKFk/TBTxnUDICp7XZPz4/Yn1TcqxkEo
 SHyPavLFKPhELAPg==
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7d0725ceb28mr5287385137.12.1793804006620; 
 Wed, 04 Nov 2026 06:53:26 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7d0725ceb28mr5287371137.12.1793804005717; 
 Wed, 04 Nov 2026 06:53:25 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a9faff90sm164016535e9.5.2026.11.04.06.53.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:53:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/5] tests/qtest: Use qemu_hexdump_to_buffer() in
 qtest_memwrite()
Date: Wed,  4 Nov 2026 15:53:12 +0100
Message-ID: <20261104145316.18841-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104145316.18841-1-philmd@oss.qualcomm.com>
References: <20261104145316.18841-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nDjmLvcY0uI0EfHPubMN8j7YBlNQFP_o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX9lbndv0eqHqS
 rLd08wJhrDusWaUgcRxfrn7pk2DmP4kdUzPdYFvK/Xsu8adOUo4Pn1eIl5y7NQBhV+Kz4VR5uYW
 kaSdpuXkQJfJLm8Famho64ccc+plNOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX2MXV++x6hM/X
 +/olXPzhs9+9UKKG9KeYu1/zfty+MBU76ezvO0rQI/VgERcq93cgyd5TL8i9a07Hjt/MZKLf5JE
 1K3icB0EfYrtQV8g9U08O7b6YFR+hmuphavOZeWYrTPSwAfYpoCFt3AR6FfdaOTIfzcKLA/miOa
 Hn1o1WeLxtsuvXjdFRndIrmTbU0auHCq85YzAyaBFx3NKnNPTH5dOVpWDJec47ebfXKyHqxsHnv
 +1Bzlwxa3Gwk0fHHwSX66KKxGFYtspjl3mE2FakI/zUENno+hUDQ1ZzgQqtIKIYurZS/axmAZVV
 OTI2kkD5cO+rYMRBUWqDeB09zLqNFT+FiyNCPG3Y0nTEEcy3yciv/OI3mHetTKC+Lx/xy2OqEvy
 M6qpwfm093v8s3gV8sgWuzl0Pv3ESBG63JUXLavg8RHerSpREEfK5c+YvJZchwjymlKHI3po7n5
 B049Pcnf02K2EnItQDA==
X-Proofpoint-GUID: nDjmLvcY0uI0EfHPubMN8j7YBlNQFP_o
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb46e7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=k_a3swXMNwr4Ts-8P3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040059
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Replace sprintf("%02x) by equivalent qemu_hexdump_to_buffer()
helper and silent when using Apple clang 17.0.0:

  ../tests/qtest/libqtest.c:1522:9: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/qtest/libqtest.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7f66c1bbb3b6..b6b9f8fe161d 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1509,7 +1509,6 @@ void qtest_bufread(QTestState *s, uint64_t addr, void *data, size_t size)
 void qtest_memwrite(QTestState *s, uint64_t addr, const void *data, size_t size)
 {
     const uint8_t *ptr = data;
-    size_t i;
     char *enc;
 
     if (!size) {
@@ -1517,10 +1516,7 @@ void qtest_memwrite(QTestState *s, uint64_t addr, const void *data, size_t size)
     }
 
     enc = g_malloc(2 * size + 1);
-
-    for (i = 0; i < size; i++) {
-        sprintf(&enc[i * 2], "%02x", ptr[i]);
-    }
+    qemu_hexdump_to_buffer(enc, 2 * size + 1, ptr, size);
 
     qtest_sendf(s, "write 0x%" PRIx64 " 0x%zx 0x%s\n", addr, size, enc);
     qtest_rsp(s);
-- 
2.55.0


