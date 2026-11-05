Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C1606D813
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jUPSJO8O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OoSWPQLS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwxC-0002mz-NY; Thu, 05 Nov 2026 07:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwx9-0002lD-IH
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:52:28 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwx6-0005ga-PV
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:52:27 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5A1QUl1416462
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=; b=jUPSJO8O1y0C8NHF
 EtCQNNbeWuqp8zXBnVjoH8e0htP6EKxRyy5Bk5sWH/F6xdgBUMXAUam0/O0t8TQF
 F8Hipbz9XVSFOhT4s4J/1/60tyxL434sGq+/CnEiLJmu+IN5Bv1bd7VCYjR39s71
 pZSjOLRHBGWY0GRTOZAWiAbBuj4s0ZabQr1RX4QUc7I7QOl9DlMA12B/BZv+fzCQ
 Lre1/oAybApC2rtlwWwSz48bWKZWff0snjQ2MassDrm7yNorp9XQc5P5lkvP7HFH
 PJyXVdjVT1S6yLhTpVYYrCrg4FEntWLjiHfbzHrTIQ3TbPH1/p87oGKozPqNsR7H
 fThk4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0p9g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:52:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93caf6c528aso321554285a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883142; x=1794487942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=;
 b=OoSWPQLSvULiMO8C5Y0y42yTqlrVEiqw/eJFod7aL35I7pcrg05toydullfZqtlyVg
 lnrS0XifiWcc+M6UD+7bqiI278Lqk2+nHGlSeIpbef4GVbAVH10AgOwzQnb0xF+a3j2g
 9uRvU9AAPwJ43KcfOpPTOxov7ffU2nOktckSoKOi+1uJEtkKA7PvbZo4EaNubyx3uc4k
 Wv8/kShPaswuuNALfxaCrJ892rUZAA7xabOUjTsbz8IohfTHV0cymU8AHFcpb7wFQixe
 kWZ0cp2wtoZ2I74dtJVlTWr3koutEOd3LZ/HxiJ+B6qAAarQv78uD9THVK1INQSeard6
 dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883142; x=1794487942;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dAnyPv0Lgq8cf7gE/G7eR+Fs0DmNpStWwyx7er6AIoY=;
 b=2ymK8I63i+e/co+lF3/zOajXJlFsCufoKcfYn6Qy3souUzMaSZzigJqsyWTYbPL1+w
 8s94h44GPpZ/GKyl1pnUqMwjSKyXCVIrGie/zDXqsl1rLo0S0zXH4sGQvfJdatvRDY80
 2w7QqFDojLodWfU2jB8eR4HGUwRPuF6xSXlJtLGgzw+v26/3RYXB0MJtg7/7yZFF7Rx1
 aealQc7FZns/o4IvFdoQ1Q4PnffWQqwlWlm/5XIZMnrnTNxT3d46mvhcLKPhfG+s/Jjp
 45ncVub8HTiU9cNTIxTmajOQYPn5BqiO+ZI8u2vFSN5uuvw2SNTmzJi4FM5f/y7vbBNa
 NQjw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhwnBTXEGwzthih7HSw/YvtsWxHHTaBSE0yn2BvswedHWdjoeUxYCj+LygWsLHYoZCFJTobWd3vg==@nongnu.org
X-Gm-Message-State: APuU4Z8KQ2hamjllKA4Wo4eOkDy6dg9GkBXGZU/dZdK948XChIsHq+4H
 P+f86yGfEhk+e7n4k2xNb8xoGw3Eun63YPfsw8RAq95gZMS++jilVeIB4TKjmUlJkUSgYyVxm3u
 YL89mqZpWoVLQ5LFm8lQrTywgB5IWHCXB1W2N3wQqq322MMaUbCltXWU=
X-Gm-Gg: AYBFou0l3PtQ9K+cBUnNJvxuvIsSQ2dSwA+38ZvgissVTE8aeQ4FLCNcZq8GbkSPSr0
 xGLiZRBL8OaWQahHQGWu4K1MaEt3EFwH8ILp11Now/a9nQpDvSMA8XWFnnCWKWeSWMc1MdCR6Dc
 nzdeBqs4MLxLg0ucvjmudIXuEKfAxFyU2Zw8kAA+vqSjjARrqeNurpxSwwK2KU746nxIw7kFjDY
 pthIWpAU75umQUASj5UJszVCOiJJKngH9C2iO5rA0T6KzVtF0gEqU21xh3SyzDaXg2Cssd4m7oT
 qscYxBaxUBkhiu5mVdhnXMNcqYgaaImyRtGgTCnPXeeiJAmQJupRQmYDIu34l3BBPLEOacncbS0
 CRmGHlWxxUO+w7dQLGxNXCb2Y2KBvZVztzXWxEVrO2yiEUPJXNtlh7wjRRGMilDWIH4bAigL+G6
 RAk05tbvHDppYPHfwQLck6BriTtKSAJA==
X-Received: by 2002:a05:620a:414f:b0:93f:1e3c:4a3d with SMTP id
 af79cd13be357-944216ea174mr3173723585a.46.1793883142209; 
 Thu, 05 Nov 2026 04:52:22 -0800 (PST)
X-Received: by 2002:a05:620a:414f:b0:93f:1e3c:4a3d with SMTP id
 af79cd13be357-944216ea174mr3173721285a.46.1793883141780; 
 Thu, 05 Nov 2026 04:52:21 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e42479dsm172396066b.17.2026.11.05.04.52.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:52:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/17] tests/qtest: Use qemu_hexdump_to_buffer() in
 qtest_memwrite()
Date: Thu,  5 Nov 2026 13:51:46 +0100
Message-ID: <20261105125203.40320-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX2Twzv+yFrSUp
 041mWNuXbDj3kZEukMLrti6iqMvWUKGFCluKs50VQnV97taSScDpbosR61nUOLZ5X9nwaFHTv5/
 xPOIPV9aVOU3qK3P9PRgNAc8Hm7qFlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0VwMKACeGj9f
 qlqKU3PoeBw3Ag4UiQL8UuHzZaMOvojVmJA3Mh/xXzzxKma0wrJVA+CxSEdIWuseyeWFiUy+RdU
 +5K3cbfwM0KIzIjZ6L9bpNYsIbS4fC7YId/fzsS4BL0mPXCXGsbs6fYqu06u5kmDnjM/lpfhDAn
 f1PEv21PBKN5hURzMhE5mQHgzDKryIOpAbcY2nfjq8VRhBYs+fNe/Y0snmCzodyi9iV9Th7BJxv
 55suszLjpCA70NmRInDT2KtmLRx1On2NVA9tle75MOtn7fm0H+6BR6JqKpMPHdybL/drU0/J1YH
 7PoP2tZ3XO2Bd9Uxp4MNS65vOvL9c4wf/27v9ePfSQTm9ofj90njwjfe1v4QND5B+xPGxSiPbXB
 tXR/AHpoNqmKuqPCJqNloHAJvJMYtDM0jsKxvBVI4sSytQlM7rxoYmAy7DhFt099BFfkKZ32iQl
 Du0yu2jTcOUCNxMHn/A==
X-Proofpoint-ORIG-GUID: SeW2YGqMVNNNQNGEFPo1omhT_-J8A88P
X-Proofpoint-GUID: SeW2YGqMVNNNQNGEFPo1omhT_-J8A88P
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec7c07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=k_a3swXMNwr4Ts-8P3MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
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


