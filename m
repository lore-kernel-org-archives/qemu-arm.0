Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236A606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WjI9q8s+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6/3+bys
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj32-0000I6-5W; Thu, 26 Nov 2026 18:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2b-0006Sr-DR
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:17 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2Z-0000zr-Ds
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:13 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwAu93340049
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7kt79fvDhIa2kukOary4enRgWJaprasUUJIC1+U8yBE=; b=WjI9q8s+dCV3GpmR
 3r8yNAnUL2GajNE4XwQFsQ/TGHlw0pGhrypxmMm+fpNTQBFX3M124l/T+uGRDTCn
 TZzzLQOc5Gu3pTuejeObYKnGAndlofVV5b91KUN6xYiNlp940isTmH8TQtEtdTqv
 RUqHhL1mrZFMFzgHJL3eCv6pSrW1hDP5OPwXWD0HSsfqt8Sw9Q+94YArMi38g0IE
 I0xv4F+k5vkOVYPJpPV9r75qwuj9uZduUEpTyrgjFg2L6p1KiUEJxR6cEdW+f/EO
 KXe29jsZrcgb+X2jXb18jByqEWftIjUE7sAVXPrzm1tQOGcBEXuNTHWVTnkVkR9R
 z1495g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdu0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:37:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f26dd2165so1794332785a.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736279; x=1796341079; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7kt79fvDhIa2kukOary4enRgWJaprasUUJIC1+U8yBE=;
 b=H6/3+bysyNMySqVEHGrX1AnciBVip/bwTtV0EqnP5SkY+wNNfJ3xUIjlI+pZ0Cxhuw
 VF9p8SBgae+n6p9GzhDxlQ9ZoZ8rhsbjmXA3OQ1uuHh36lLJSub/P/aw504BX8uNGCLW
 T6gSZl0R55dNM/OWKIfmspS9XdEcGAPt4haG9SunDNLDxIh7kiMPG+YMvrMqbz8I+EvS
 FcAtdX1W3LZqASNyX8Uf/rNnZwcLF6V7bI2d7mOoO+GpaHKOyGZ1MSaXZLp7CMaT8UAC
 l5AZJzAJFzDWz28Smz0BkNvnoD3e8zbgk51b2cEe2U4CeDZDnWx3/xeXZhe+a0N/xSYt
 ebMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736279; x=1796341079;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7kt79fvDhIa2kukOary4enRgWJaprasUUJIC1+U8yBE=;
 b=bxGS0kjpwQO686ha69BBxgVBIpFmQ1ZiZRKfitk16jJ/FiimJVfYai02Fj6TBQmzGg
 xeaeBpKW1j+xGaqR4/l8bdWPc6cFHAViEI7nAON6cRgpsH2lM4SQ8U29pVXEaZuna4FB
 MyZ1YMoqc1vr6Xlr/Joewvr6rn2ZXdF+E7cT7+weIcDRSzLvUXDmqYx9BM84MdaBkXtM
 OTjJHGKXx2J7YXOdCPdJteoB2B5U5HKe7Q1rFxiX2sGb0x+Mf2LmawOsRq+6LdNEygM5
 Z6mYbK+jEuzFWXW9VCmVOyN7eG1Ay8cDRlz9jNlNnOYZVExyQMblAIni1p+pw/0TiqTQ
 +zqg==
X-Forwarded-Encrypted: i=1;
 AL+hErH8++8j9ZSGttQqd0iDz5JLZzFkC7Kec7TfkPIzjDptTUkSOVy9xVGT+3oNy2IDiuJgWEEXFSnsAA==@nongnu.org
X-Gm-Message-State: APuU4Z9CV5plgzVI9vV4FeRUqiNUiYZ1uYFqZXjA4GuQzbtpzhuWxjNa
 KQ6yLIQxymW4r+JZzPF/LkLSpfJcTfkzHEZEZ+X/e22tzcb9E37yOID5Eecg6Yj8yE9K+YCCvBj
 AYtbcRsqjGHEyhsRetYwIW7JjMq1bF91DiTbs1Eq7Gj1gvpXsxQMncDA=
X-Gm-Gg: AZFdTZfxF9Aeor3FtsZnlLd/uhxaFbhIfWnA9uz4BexeMVXnZdR8IQo11H+/HMWXU8H
 ujX9qqUiACjd74JXtQbkoTvxtq8cPT+AIi8PJR0EzZTXsl6THd06lE3foQLf9xNmqHOgLJMxJLq
 6jG6bft71TK2UEXqpcIxnU/McH/aV0senXt6qWHxp2LqEhnFUmdKsBNRADFEAKAkQsNTfbgbRFw
 BOvAA3aJMkIaJi650Q/J63CC0UjEuNQsNTi89viA2vOQfvut8PIKwRlw4tOO8XMIMyXC7W4MOXn
 9tIMJmom+JULhIcvCMMbNVx0+izpOYC8Q/LIUVZcyavyUAZLV9J+7Xy7CHr9seOcQvQPKrHU8O1
 y3fEgHVmB6PXN5S4AM439KgrGZi1uHM/adqHv5O82J89Pyw0QwZyX99+SrDX7Vt5cWgt50RQ/e1
 y8rLJfsCl7bzLbBQ==
X-Received: by 2002:a05:620a:6f02:b0:93b:bc51:b40 with SMTP id
 af79cd13be357-949ba84ac50mr3784225985a.2.1795736278980; 
 Thu, 26 Nov 2026 15:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:6f02:b0:93b:bc51:b40 with SMTP id
 af79cd13be357-949ba84ac50mr3784223885a.2.1795736278558; 
 Thu, 26 Nov 2026 15:37:58 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b9add26sm43951183f8f.44.2026.11.26.15.37.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 14/24] target/or1k: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:52 +0100
Message-ID: <20261126233604.67722-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uGMEB1sxbCacT-KniJPz3SNFmoBm1SB0
X-Proofpoint-ORIG-GUID: uGMEB1sxbCacT-KniJPz3SNFmoBm1SB0
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c2d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M-hA8jIEZbjr0ZWk8n8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX6+eI3hllNpzC
 Zjav25BJ3nutWn1dSU8pKHByITZDaRjcdI1u6dY/GBwn9LZx06LyuIpE2LHF8zwtC6rEwXJpf9w
 duXM9wMXLGv3uU0PESSJEZfnCuNCo0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXxKpIz5YMbQrY
 8uBbJqygfaAEgd1Mkb1ng4xxOYO38NosrtftNfzQhaleGs2K47Rc2IKeemagK07hDcmAnk9SXUk
 Jba8cZmtfzqe76yOgdpVVYAr+1y7riPLeIcg3HiCSSfT9+UipkS4ZZtMmiVAv7IMXGt/1O+0vtP
 d2+zzjPjuFcVR8f1yOrcgPKi6WKeQmNTHrycAxbWqAjv86VxVtwEFoQxM0ID/mW/Dvz7xiqKJhz
 tsLtauNcsa0l9+4Z6wbQDvN+pm1BGD6/+2zhuR6460ppQm1hjjdPQChVaqsW6kyrVF2OsPK5dwu
 su2NdbszjO6eKwZAfVb2QFOLNgjtblKKkVsFTks7HgdDycDCgfYdPEqpMSQ0mjaH504ABqsRxOW
 EewZnQ/PsbTSXu7OZX3hm9/0A5sx7h7cPmo7DIlSjroJnFu5F/hYzY6yEi36BF3chHTXmUWRScJ
 sACjSLzo8v/e0SWYUrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/or1k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/or1k/translate.c b/target/or1k/translate.c
index e00ef45b9b76..e656301642d8 100644
--- a/target/or1k/translate.c
+++ b/target/or1k/translate.c
@@ -45,7 +45,7 @@
 typedef struct DisasContext {
     DisasContextBase base;
     uint32_t mem_idx;
-    uint32_t tb_flags;
+    uint64_t tb_flags;
     uint32_t delayed_branch;
     uint32_t cpucfgr;
     uint32_t avr;
-- 
2.55.0


