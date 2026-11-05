Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C355606D804
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llFc74pQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKPXVvAC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwzo-0005cX-Id; Thu, 05 Nov 2026 07:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyf-0003mJ-9T
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:02 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyb-0005qt-4v
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:59 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59thlQ3531963
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JH8DzDeDwo4oYATYdaoLXbb+8y3/Xbwej4F1McXNIIU=; b=llFc74pQAKHjRSoV
 zFLxGkC8Aafae/f8AqHExa0fE8HHlCNgW0hbkqc5BeAS33j/agXtiqyUxQLrS/qk
 CWQ6nWYFWcOFOE7wo7GxiPZ2xHiVwMe40sYlkF2zD2Ar6A6dgYECYEdIo3zzvzw5
 1vEhurQPkjj55M/tFH4byDGb9IBRe66xAwchfKTi3RkiZ6BY++qUGN7Tdbp/tAhb
 gjcwd6OAKeozX+Zpj9w0Y1EZS1hr+ASOkINcZVzFMsbeH5BqgHtaeP3ItkiCQ3Ju
 TZPBUrLXtUQsk09Xn1KCKaGInDEFSy3n9qCOEoeO1hhCunPP/u6wCMH/qbVa0evi
 V5E4cA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9q50-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:53:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934963b2bc0so354247085a.3
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883235; x=1794488035; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JH8DzDeDwo4oYATYdaoLXbb+8y3/Xbwej4F1McXNIIU=;
 b=JKPXVvACGhq73xpDWP08Jwm3C8g4r5Qy9JbmjzxtAoBaFtfpbj9mPJg+gA0GDgVwXI
 dg1LLJrDaESAr7lLh09TX5d4aQN9AIg66LYmD6SZMa9t14NTaOism/N2DPKVMObkdM6E
 PZ2wkNsnC5dIvZbiWVQi9+raXXE8WTgCVlM8YAGBzzngcdTO0ehcPwCA4fhiM+FNgUE/
 T59PJiWhjVeOEsSBooJDaFXS7NRp8ib7gEgWWNBs8HU7nEiZQ6GNXlcip0l+ccSIZKht
 /pwWjI4ZBwU3V3b0QLTIovlOnyveViZ5wOV5pM2r0IUO65KKes9hh1HLI+YhQzFZjc8y
 LZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883235; x=1794488035;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JH8DzDeDwo4oYATYdaoLXbb+8y3/Xbwej4F1McXNIIU=;
 b=luqoKv5QzyB8IN3CENeIcMtQQ2VD8kTqVCqd9RxHZBA0h5LsKNK166pYGaEMWjlz/a
 5nfa1kHDJjdCT0LoYql9iMGiY9th3I6fYgTp8bVzA4P8/LGBe2zU5uK9jhwYrqhQDxsu
 omcx2lRgjtG9/giT8ODIF7DLw9VotX/OcmiwqgRMGdBffHx/E9fdFcx6eurqMYMUyCN0
 2jJOAVTPfkp5G5WYaLDijfK6i3L3XWADn0Pju6eyHwTBdznJBCjGvJo4BJ39l2gefFhz
 0/qKX8627+/mRsrZR+cMAvrJnK1MTZgb+ctz+SAMC01tohaQbxLY/h/05quUVWqyj1jN
 puWA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzAPv5zL7R5M4Upwp2nQQj4QkmTZt49GNydLw2UIuRmkHYRkhnv/F7dtRrAS1sPThzB3BSCS1vRig==@nongnu.org
X-Gm-Message-State: APuU4Z9KG0WyZV9VV6py+Y8zmA8/EltNS2+kDMFuUuckhISrmLmpE8mR
 2q5QXUrChqamoCdwqcWJLPCysGfaUnwt/4ypByvLqARlBbfHgMCHxOBe21vqGLpPKr2cXh56q8B
 kSWnwgQ/bmEnLnRCX+4dSoRMOg0c3o0SvBNabdzLPZOk7kMeBTpar6ASuXTFmUtg=
X-Gm-Gg: AYBFou3QQ1ZhiIrXiht0i9c52aAfmsphLJZuaOZozOmIwJabQ0oaux0cb0ZzkD5x/VO
 0pFyycuppy1VdjhNj9/ghbTBJdGSFZeZ2I95iaSZXM7Mgrd4IhpgOItJvDfgOQj0RB8sht+XWP6
 v/NoqLZt7gRs/vyxMiupEnGsBy+QsoClhZxvZ2ooKa097NCVkQoTVBdAYnHvJnm/XILJuLnQPtH
 gzaGstgDhHvcDc5dTZGIIhZp0C+Jah71iUgOoGGdVvdfoLLEtI57SECGGCfMonj15ocdg9s4/5d
 EyzRK2matxotoZ8E72bwTFu3Udex2WF1hYQWdmQchDkax6dqmFgFGR/TZTBxKPnNfCtDktR81p+
 tYPs1m98FfPXbriqewbF+qptA9bd2nH/c43ElRM58DrqxY6z1YaWgjORREfsGfdTcNRq6OUeXWa
 8WFK7QpTWEvD9iYIF/gSp52cEH/ddnMg==
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-9442171c8a4mr3144907285a.71.1793883235530; 
 Thu, 05 Nov 2026 04:53:55 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-9442171c8a4mr3144905085a.71.1793883235019; 
 Thu, 05 Nov 2026 04:53:55 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4657d0sm168195566b.48.2026.11.05.04.53.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v2 11/17] hw/net/rocker: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:56 +0100
Message-ID: <20261105125203.40320-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX18LpI9UcC8tv
 A4sqOWaqjE21H7vZplRcnUdJJokJe8D7s66tTGNizqtZvzrYuprwL8UcN5eTNThkk5aPTuGK19I
 n7G7m2OV0C7p0XC7Vonp+i3MW7gXxhLvc4FHMaNAY93BQucPMIqB+Wk3anpCm8xKG7zvVDmT+NQ
 qU3VOasjfKOdNtRbor3xopomAVZYSeAINU1rs3uGYcYT1H1wBy7LYZjFpU4xqleRoPdJ/xYOY52
 cW2mK3dtpXEbW3Ue8ykUCWDtSRq2uHiOkH5JNIylUW3tn91OtJVFsXHsp6SdEroFPaWizARxVTx
 4p9xvZ69tx3yfnkZQ+SUQ9MnLhol7PfJiIUHEasKUxT0Z2fkXYeaYe5KX7lxQgw4XrWptgrfDIU
 DnhOhJ6c9EDb5tZjYAu8tsvWjVvl/A+4vnA8ndSiiODFIzRSklaWfL4CY/81obV/qPEl7h6tXwe
 HGP+9lDOaxLFZ8CV6qA==
X-Proofpoint-ORIG-GUID: aBp3ZpAtTi0-zB8TwQuY3Zg9Marwb0zw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX+oyxx9kJjQ7k
 AIIAjHy+HxvR7qPWUa93o+QeG6iZSoEuKcjl6Wkcr8zPXVBygd4o0fLhCTZ6Dlg0PKkKM12k+zR
 Lon6xAp1DKKiZfazduhgsuN5ZRfvhuw=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec7c64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=f-zRNqtaeIehAayABMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: aBp3ZpAtTi0-zB8TwQuY3Zg9Marwb0zw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
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

Replace sprintf() by safer snprintf() to format debug
register, silencing -Wdeprecated-declarations produced
by Apple clang 17.0.0.

Use pstrcpy() when no formatting is needed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/net/rocker/rocker.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 910dce901b67..aaf447641c86 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -910,40 +910,40 @@ static const char *rocker_reg_name(void *opaque, hwaddr addr)
 
         switch (index) {
         case 0:
-            sprintf(ring_name, "cmd");
+            pstrcpy(ring_name, sizeof(ring_name), "cmd");
             break;
         case 1:
-            sprintf(ring_name, "event");
+            pstrcpy(ring_name, sizeof(ring_name), "event");
             break;
         default:
-            sprintf(ring_name, "%s-%d", index % 2 ? "rx" : "tx",
-                    (index - 2) / 2);
+            snprintf(ring_name, sizeof(ring_name), "%s-%d",
+                     index % 2 ? "rx" : "tx", (index - 2) / 2);
         }
 
         switch (offset) {
         case ROCKER_DMA_DESC_ADDR_OFFSET:
-            sprintf(buf, "Ring[%s] ADDR", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] ADDR", ring_name);
             return buf;
         case ROCKER_DMA_DESC_ADDR_OFFSET+4:
-            sprintf(buf, "Ring[%s] ADDR+4", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] ADDR+4", ring_name);
             return buf;
         case ROCKER_DMA_DESC_SIZE_OFFSET:
-            sprintf(buf, "Ring[%s] SIZE", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] SIZE", ring_name);
             return buf;
         case ROCKER_DMA_DESC_HEAD_OFFSET:
-            sprintf(buf, "Ring[%s] HEAD", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] HEAD", ring_name);
             return buf;
         case ROCKER_DMA_DESC_TAIL_OFFSET:
-            sprintf(buf, "Ring[%s] TAIL", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] TAIL", ring_name);
             return buf;
         case ROCKER_DMA_DESC_CTRL_OFFSET:
-            sprintf(buf, "Ring[%s] CTRL", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] CTRL", ring_name);
             return buf;
         case ROCKER_DMA_DESC_CREDITS_OFFSET:
-            sprintf(buf, "Ring[%s] CREDITS", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] CREDITS", ring_name);
             return buf;
         default:
-            sprintf(buf, "Ring[%s] ???", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] ???", ring_name);
             return buf;
         }
     } else {
-- 
2.55.0


