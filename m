Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C2606D83C
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dO6ij7Eq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZu/21B2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOx0G-00069x-OP; Thu, 05 Nov 2026 07:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyh-0003p0-4f
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:05 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyd-0005q7-Sc
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:02 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5B3LVZ3193512
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OF1920oRRrnVJwyvR3UnD9uFml4Mh2HOqZa4NKLWuXc=; b=dO6ij7EqxG5Fip7w
 N0X4M5ByjWycqk442isgUBZKyMVkOM5eQLM1QJG2ohGcfhSMuD0jazea+NU2xC6L
 Q/EZvuumAFroAewkNSY+lRP9X6x0xtyvFCoW/x//07F2dsAlvX8uxQuIqMPMZ404
 6PBLy6PEvJC2gqO875k2s7A3fnoH0BzTQEuTYed5L2Zp30/7xShJVdW2c6NAgb3k
 eA8UUbMCQpqg2vH3M7Jrx/jVgaxtlE6KYnmqXQoRXNgONZJ2aQl11Lf5YZwT+2pq
 zWnt522f/v8nzQK8HjGCF3GNvLaFRSiGalaXrjAL8MJb4hV5LMLvIZGTgBdtClm9
 CW3Paw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdretd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:53:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934963b2bc0so354228885a.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883227; x=1794488027; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OF1920oRRrnVJwyvR3UnD9uFml4Mh2HOqZa4NKLWuXc=;
 b=TZu/21B28NV+3E3+G3RK0xX2+8C6Gw8EZOMV5gzGLtasfCJrGjQoriKg8TcmUXY0FN
 lGgak3gkvDMlZVX2p4ZF1RcNQg4OfSG+nZ4LYQ8S3Jnu0hEKWXsrOSienbwYzd8lS3jI
 zBmIztEZv5tLcSTSzSTHeHHyQQlW0aBgCpBMSyZeWSIjXBwSlFNznw6tr7kKBAYQoBGc
 HzVaTi1xf9gfTGI58TQppffNqv9fr/rLLT70RbDEiPuIXoZBkECpOYDHqj2X/0t2WlUH
 FLjc/wWZdhEXBCP0u9zcBf7lgtzru1NZrIX0hVnb8lf2+/QYz66h1CzNFOIlQGLc0qkE
 /iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883227; x=1794488027;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OF1920oRRrnVJwyvR3UnD9uFml4Mh2HOqZa4NKLWuXc=;
 b=Bwu21cmZHhMm7cHoSsOOQWsQP4rZtJWD9NQju8jg7JRg8fIC9RmKOTMhpi2W946g/z
 aiPgbxq8A+r39goGOhw9mX/JAPK5is8n2JKA0JpOX4bDZiaPgyLM9STor+p2SWNqiRtP
 DFpcD1yHqTVaCBwPdiNKhWnffJC1DEoXv7kckboQolXpTzn5w48RjvyveEHe5s2lz5lT
 lG4SEvwSa2smpMKv9VkDpzWUoLZmqFU+69IsLl16k2v0kONz9Dww4t0f1q3IyaTlSLZx
 M1bN3uzeKz68sCZy76eI6t2e4FZkkHqPep8cBRzXbb6zfJk+DQEymQ9mpBP/fUDuDfJZ
 PhdA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz2Re9NLJjpjWX2GnYwFUgkZ06uEZH7axB0hY5UmwMkREq9Ill/Wt27KE6W8wvJ15R3zOyBids3hQ==@nongnu.org
X-Gm-Message-State: APuU4Z/kKO5KXJ/dt0vN6VTZ1CbEI0dYDYClLgLNF+rkg08hD9bNECGK
 QGCG/D8ey0AAi8EIADdUupWDpDMXN2H71nOBwp8oMj+Nor6GBZ/2R1HXsH+S5dc2OmN59rfNW3z
 oYeGOwDrCPAPsmgozCq2+gkiw9IJcds2yNpD1EjIMzPX7uAennkO9uiw=
X-Gm-Gg: AYBFou1KwDItMlZ3Z3gi7Nc/F3lvc7nxjLvWPhlRjAvngTnZpIlkPK3q4cHd753/2M/
 YCKh8mDpRZkSda+/o24NGZNPsp+y9FwZ0ApsljMwL6KU7+g7j8cuWf9bSmr2iqQZpahEQVOVi6x
 ZMh1eRMYWiCELD7pHaxkiULKuvDMVV5QUxTpodAF9tkUeeuaCgtHmq26jEOl7s+it8KEq8zlPCf
 tpOQrxjuBU1Xzc9G7X/Y+HoXRhh8hOCHWhL0/6UQRpM/L2gbW/x8l1VFo6RfLA/3RZN38kamMHz
 Ype1I4oRPxNbHr5xiha7VNSHvy/m4qgY+1qCAy4wXoGQDvKvxfxsIqI71MIUQ2/DqGi6jcs5UqV
 FwsDpb7XSNOOy83KoiU4Fcl1ITJBe6FEItTnYk9JQUZI8RrnvltZFvnDjcvlu3W8gajsj+sUj6N
 tT/IxKjUbv3Kvevo/DT+LWJYcIVdCrKQ==
X-Received: by 2002:a05:620a:471e:b0:93e:3824:4123 with SMTP id
 af79cd13be357-944216fef10mr3362081685a.65.1793883227520; 
 Thu, 05 Nov 2026 04:53:47 -0800 (PST)
X-Received: by 2002:a05:620a:471e:b0:93e:3824:4123 with SMTP id
 af79cd13be357-944216fef10mr3362078785a.65.1793883226954; 
 Thu, 05 Nov 2026 04:53:46 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0ddcfa78sm172214766b.0.2026.11.05.04.53.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v2 10/17] hw/net/eepro100: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:55 +0100
Message-ID: <20261105125203.40320-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec7c5c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3I_bySaw9zVCgE-qlKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Gkh-BY64Ygd2fZOprnLFxFYNGmbwC428
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX3c6LiEF4HAhI
 J7IkYatRE1xBL3fXFbCW9tpUQav9UlSis5HHVpwHOVWq4z8GZ/MnPmT5LMIWzayZmF3xGG+dA58
 HR6+FfUwcCtG8BJkBiHGoR4sh+lg2x4=
X-Proofpoint-GUID: Gkh-BY64Ygd2fZOprnLFxFYNGmbwC428
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX6n9Rfq/nqZqT
 xPIF0Mi0EYhiYgq5x6h8nnaP4eQROxDV1lxRQug+D4R0I68yCrN/YKh8Q0AIeRjg6OD/bX1oazy
 kYF0MNP6QdEJmWWCrB3XGRV/ce5JgTg4pj25crLeL4QTmDyO/ruPYQdNrTw8gBbXr+CgO6KKWIt
 M29M1+tLjVZDcOtFTgQUAKSgLeV4L1vfPGL/CMGgDUNH3vD+CRWGYYlGPi+XcLJ8gEXg6WSTRgK
 HcoyzZ5avQIygWS0F1Jgtr89oDZqy6r6ZIpc3YMi2SKnypL6ibivcI2AbricoTKgVYKMdDipIQ8
 75hKI0gjh9N4RYWt2MUJL5MtM9VH41Na3KY6lDzX1na3CKIEc/VllYKOb61aJATY/W159XtqGjI
 OM9XDsXnVHwaqQWd3hH5626ck81mMpTLxnjtogkhbv1/Wqlh4yxA34xn8UDNiEXBopfRm18l5x3
 8SFqqmCZpl+fj0JQCfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to format debug dump
silencing -Wdeprecated-declarations produced by Apple clang
17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/net/eepro100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index aaa3eb60f8ab..44eff5fd3ad8 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -369,7 +369,7 @@ static const char *nic_dump(const uint8_t * buf, unsigned size)
         size = 16;
     }
     while (size-- > 0) {
-        p += sprintf(p, " %02x", *buf++);
+        p += snprintf(p, sizeof(dump) - (p - dump), " %02x", *buf++);
     }
     return dump;
 }
-- 
2.55.0


