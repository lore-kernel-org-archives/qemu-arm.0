Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC299C61CE2
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:18:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySgH-0001UK-3U; Mon, 24 Aug 2026 07:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgF-0001Sp-Id
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:17:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgD-00059H-1T
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:17:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99AnZ2900589
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9962qy98qgv78VEwglyReKkX4KojPn8juYKMeNcCxIc=; b=loDqfDzF+qT5np6B
 uv7hRPJK525AtRMk1wD9I19ut8kklyB2D5g6a1mc5daVf0xmSkUgejOtjwQXIT33
 LBVuZTeDnojRjOEUkUVTqoQtn7A6+fvJiAkOrVMfTSLF4mPc5pJCGAEuLwML2XcZ
 pDvdNBmGSsC0QpuR5IwikSKIBzeYKAEzhwDuzCFSDjiUs2oOTyKnYMQiEQVDTW85
 jVkwFdwGNf1jF9oK0NLd74hz2cRz3tAdSQd1CDvQjmEtPZPAAB9ZFDNe0mg3iCJ6
 Lr3t+HhioSE84li4DpQWP9zI/Lg/AdHw07syuQEbrST/jqNU8McnDS3Lh+sFAjrL
 ToMagQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrxv7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:17:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0e702df8so44827871cf.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570247; x=1788175047; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9962qy98qgv78VEwglyReKkX4KojPn8juYKMeNcCxIc=;
 b=awLzf/Orz44M+8FYlVTcin5LjmtxHUNJ3wLRkc9IQLmdO630fj0Es85pMoI8rOWdQX
 413RAM6VK2tSeo0bKOIc9yMYOnCWZ40kZNMZZBG4uOsTvFm0E5FtOUPQX0yjPXfqLuj0
 NkL+pYk2G3GuZLilJZKB+Rvt7uqFoG+j+S44PS6jtZVO0lBHwidgqvo1lO5C7wiouFL1
 aqglgiIOKPxaWLedWN/kszv///C6T5kniVszONZx1RU0Ss+zixj0qmmQzNEVPL61DRR3
 r8EHNUjzRJMoauNcGPrlos2RWjL5iUfTXuMwm8XrHYjJQ96Fml+uuzQwTj1Tv2QLolVK
 DsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570247; x=1788175047;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9962qy98qgv78VEwglyReKkX4KojPn8juYKMeNcCxIc=;
 b=Tu6XG6tuej030z5e5PrifEBIjbnf+sNZWcoIDtPA+aBhcTd7NJ4Wb4dvvBSmHZZY0I
 6n+n4h/X5Ldbl2QVGMnL2YGKFANeQTDJilNTcdONGIrhR4EEB1NsketcsAqTBo1T52x4
 hYvu218EqXdpyTRQBQP0Xhn5QUjvR9wENOilSlML9R9aKJPmkG3K9/kye9RCRHTAAsII
 COhjqxt26RIGLMxy3jAm30/3IL79nu/q7v3CcDdSKXgKIKgVe08BLmFolwqSTF7R1b+A
 UMYaPPgZAUH+Zv9ZoPk1XmvZ92y3o74XaFNlOcYi9kx/APwO2C/BBwr95E0yXwycDs+2
 Wonw==
X-Forwarded-Encrypted: i=1;
 AHgh+RomUFRjF+Xp/aB6GD3ULuj/eFv+BrJUmyTu28AWHfqIjQPYSOZXjaBzVkpJ6vHDKNmJjSo2/54aqw==@nongnu.org
X-Gm-Message-State: AFuF++n9fHoWlHd3RJgms7RaOgIiQf4ziuwQ/rBK+e+9z97EXG1wOEUe
 otnmeOkMz7X/udO+XME0b+yMeTIwNMTSJeAuBBo4SqEdLu9zYvjmKUwZjjjWXgbkeP2yYWYLMwG
 l8hPG5xtIXG/aQhJmuHTZVHCMgznDVqKZVEB+9DRCWfi3qlBesboLNww=
X-Gm-Gg: AR+sD10GyD0hYzQtXxeOd3TsBAEECD4AcJe6anp9LtH2ivYtlc4mpa6q7P2f/YJWyoS
 iGPHYSatg5efDbiNKKRKmixmfZi3gBvyxs8prNB7Nn6zwhGNzoWil8zCdOUtojvlAaQBRs0FBs8
 YRZN7D9ikO1XKDb6iamIOnHlCsZ+Om6bTgMtNKKlf69zFfsdBSnHTNXqFeTpzntOTtGyCFaXmQa
 Z/VjIkh/46VN2krZfFBB9JWUrFzXmSUIKeJZrop8O4oc9BfGcHWF7patWViLvBWXPz7P44OKtjW
 QrTNEHmF+upjgqjc99FpNDlBCFJAJtZE2zxy8F6YDo8s2vzAJOabNj8p3ktBb418sr2Y8yjKblr
 qFSD9Xs6zMAwQx+iAEXSTAwY3TN/DiSYS46pzsl6ZE76u7odqYQ==
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id
 d75a77b69052e-52df5a09808mr283860481cf.27.1787570247477; 
 Mon, 24 Aug 2026 04:17:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id
 d75a77b69052e-52df5a09808mr283859341cf.27.1787570246700; 
 Mon, 24 Aug 2026 04:17:26 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f9cbcsm1353929266b.29.2026.08.24.04.17.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 01/20] target/i386: Remove const qualifier in ptw_setl*()
Date: Mon, 24 Aug 2026 13:16:50 +0200
Message-ID: <20260824111711.26297-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXySpjcIWBB+Qk
 PJEIscLSi6Z+ldGaA3+57dZg5Mke7NFKQ+hEn39wfqifdEvtYxc1jNHuHrLs6Vu6As5MqJis3py
 1FYLHPx2dKlJUgOyusv8D25H5dZlvA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX7wxxNbw5MT9D
 OOLi4lHFVGfuVZHMTeCDWPACXOgQsGKCwP5lNmnNzf+KL+jJh0Is+wbnqbSszgXlOy7C1KCSWdN
 upOkKTyy6LPIRWvOFukhV8Z8XSvEmrDfVpHUY2+Wy2+gVKY2nfFKbi+1cq27Ak4F2RBntfvLc+4
 jtAwVouirPS+VHMn5Gb/W3cOi2EmpGcKCSUAoAw0hy9vkL3WcEfiI3wyNogiSDBUgsG83nyn6Y6
 mXfPJJnQ8P18wplvFUbL7WAY0AqW0lyF7DcVGSeyCFd9hil6gkbBexkB0BkkkCFVzw+77T1hSeV
 BqQyDpFbNXCs4i6RjP/0BMNJHuSTyuPxl1bnGMCQ2YyREhyYc1kLYKZJyXq2HYBqgzu+YRr3JAW
 O1wOVUsUUH36PZ7L+Ks1yv23+oys8HDWBakqxE0B+luWLdfc5/4VmnIS1URKZNmTJTggGyvtp8j
 3H4G7FjY9JDmgi+68Gg==
X-Proofpoint-ORIG-GUID: WlzzggpkriJ-FcKExdq20zZCcbgo-J1a
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c2848 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6zyGMrF3NIoAil_mprYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WlzzggpkriJ-FcKExdq20zZCcbgo-J1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
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

Both cpu_exec_start() and cpu_exec_end() take a non-const CPUState
argument, however here we get that argument via PTETranslate::env
so @in->env can not be const. Remove the const qualifier.

Fixes: 4a1e9d4d11c ("target/i386: Use atomic ops for pte updates")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/tcg/system/excp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/system/excp_helper.c b/target/i386/tcg/system/excp_helper.c
index d7ea77c8558..44be98a3c92 100644
--- a/target/i386/tcg/system/excp_helper.c
+++ b/target/i386/tcg/system/excp_helper.c
@@ -106,7 +106,7 @@ static inline uint64_t ptw_ldq(const PTETranslate *in, uint64_t ra)
  * even 64-bit ones, because PG_PRESENT_MASK, PG_ACCESSED_MASK and
  * PG_DIRTY_MASK are all in the low 32 bits.
  */
-static bool ptw_setl_slow(const PTETranslate *in, uint32_t old, uint32_t new)
+static bool ptw_setl_slow(PTETranslate *in, uint32_t old, uint32_t new)
 {
     uint32_t cmp;
 
@@ -125,7 +125,7 @@ static bool ptw_setl_slow(const PTETranslate *in, uint32_t old, uint32_t new)
     return cmp == old;
 }
 
-static inline bool ptw_setl(const PTETranslate *in, uint32_t old, uint32_t set)
+static inline bool ptw_setl(PTETranslate *in, uint32_t old, uint32_t set)
 {
     if (set & ~old) {
         uint32_t new = old | set;
-- 
2.53.0


