Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC6E606A328
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTj5Dl5z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiXFS/nC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOcN5-0006Ql-9B; Wed, 04 Nov 2026 09:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcN4-0006QG-FY
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:50 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcN3-0003hi-3r
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:50 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4C1R1w1764268
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 14:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=; b=bTj5Dl5zfklk9AKb
 SwjIF1KWOguKR6B/trDpYDYZxX1pjDZci9nesPlZ+MZxZwL/jOVNyIh//BI8GxcQ
 R5ePvLJq7jJwwuVmhswUBOzmgminxLiiTCrCxGMgDeqOkgfBchvh1yD7jxG2Y4O9
 tq+hdAiNtJ+oDI2uB3oCRgyl4Lo9xtdSPucVd3uDr0KQjQrkZrtYyziujmxQ/hgt
 3Qti/rY7g1b2SvfFuZY2pEPdPuKONTF3ZWGUvEOMgYPbBbUt16fiqSCfxK7CePKP
 RGEp42AH64GZcAmyGKwGNS5sJEPJCwjouBsdZbaMG8F2F+b3Ah97bnRXUKezB6HH
 8OrOYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn0n22-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 14:53:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-943e8ff02d0so91598285a.2
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793804028; x=1794408828; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=;
 b=AiXFS/nCR/QfO+JY677WZ1DTmoJNVsj8VtU6sG8R5SCwGv+yWaZpDLWqBwtZXr2IOv
 zKmWnIXFA6a7lFxbmSOc54PzrXUenv78/16ERv7GQ1BtsmGgoan6UtXgQr2dhX4fYVeA
 I+qtJNb+AFHAuL69xx209eJJwS0bNyVdB1B3U0rUKb/maoDciySIMT+bWbzrNqPapBah
 mK2YpMGHHy5HKd2udOYHhhswtKR5TCPRbxaUxvvmH3gyfzELUz3riSYif6jd8zJxi/YP
 9ottxReo+CzzntCyzKE5odZGgtj0D7sazM5729kR4egoJSz6DlE1eAC0Oqm9WhKbEZGg
 7Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793804028; x=1794408828;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8RQFiS3B/Xrb3cheKwttSffUdesHjxQtQjW4IYgw7+I=;
 b=Vf/V9L9DcBOhMAlraHl8POAx0iS1S041AnAqYyHQQnL7RMVyFrMkAWEkxUvgTTgtk8
 NwabLJAheJcCztk35wBxN1ZWerNk6PSXevuDbr28qmN7Oc1mUW8ht4YEShEfrEN5tB7d
 k0U+4J0csoyzmRnTExsX/EJcprrPMbwzWkFwcS6tA49ENLmWYxTbWG117jNt/dvnWOrt
 XKVl4lUgYWyQ8OGpS+C28U6uolfx5UCVKhSRIIaE4nODYELJWiTPtIkI363HIk7cbfr7
 QAqlJz97vqWjT+1NqRBlcYEcv4rb9qWWYAWs3Q71IuH6dO7Owe9oUyqQjQ2XP39olrow
 e+tA==
X-Forwarded-Encrypted: i=1;
 AKwUvBywpoVhR/uTwm6RV1wBZ7L6U90CH5GctqDkD4nefRhXgpk+B3lHZVlJEmLZ3I+zxgkSgWbMir0OHQ==@nongnu.org
X-Gm-Message-State: APuU4Z8LPA/Yi9sOYoLR3MpxZFPhlrcdsHD1Wgpx0uEUpRkw4qqu2WYk
 496UNFdbGYOckq0lc4mAFrInN9JK2jROJIxd+RSL49z9VD4zaLUDRL03tBBCWbYqWHYHVdZYGlM
 /A5nSqeU4XJINFi+MbWOvJaB6zq72XLWXs4vtJ34W3VC5cbezBGFNUns=
X-Gm-Gg: AYBFou2AdNUMDdx9E3Eph3HASJjrryiI9uzPLlPBmE2AScdSuLJG4pWWOWj8LvZ71Av
 G9WtirKbgsFjtnT49adJpfDM4g/hNRU2NEuOKePZXf0T9BR/uMc/0Tf+e1lYOu6V7a7kVDDwGrZ
 71ZFZZrUsSjWrzkIrL0NM2XsD203svKhlnJuJ//inHZofXpv+I+vcrOgB1gEXmfV/pUZKGvlzX7
 MXCVLbqKVmzvF6+xd385LSytGyN1N2nw7p7UCXlltpj+m+mUerAVtWuy3DZxTb7SvFVXDLNI/Jw
 bUTWYZsxAJ4QzV2hdI5fDUEyTdVF3BrTeTODDwuZsmPHvdKG7scqzgPiNSSpNA+FBUOUrm8f7Jq
 H4vEf+XTQnnQK4B6HWPhE4qsyKlUC5XdVKQwY0s13//+eO2Zk2vp+jm19WvpcOpgwNrfYsAsNfn
 EJTMXvjyC8sGzLbg==
X-Received: by 2002:a05:620a:690a:b0:93f:a63:15f8 with SMTP id
 af79cd13be357-94421541a7cmr2874489385a.8.1793804027553; 
 Wed, 04 Nov 2026 06:53:47 -0800 (PST)
X-Received: by 2002:a05:620a:690a:b0:93f:a63:15f8 with SMTP id
 af79cd13be357-94421541a7cmr2874484785a.8.1793804027055; 
 Wed, 04 Nov 2026 06:53:47 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4104d600fsm60180525e9.0.2026.11.04.06.53.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:53:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 4/5] hw/ppc/vof: Replace deprecated sprintf() with snprintf()
Date: Wed,  4 Nov 2026 15:53:15 +0100
Message-ID: <20261104145316.18841-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104145316.18841-1-philmd@oss.qualcomm.com>
References: <20261104145316.18841-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX/55v7i9P9tOk
 iaVj484QyyJkyB4wLgUGOG/Va+WY/w3WxaFn+urT3i/Krfzn1ncC5F2u/lVNkIntHJzuUY87cv5
 u4MpAHKerD9dZY0YNlUPHJQTWfrITVXcbPyGLY5j7/lCFGq879UH7Gf62zuHK6Gk6r/XM0eFx/N
 tiGs/hdmrurcD4BDv40Kwu/X7bFLgtqWXvJ9et5BM1q4QzwY6Ka9IpSqFQhQnqgfGHyVzY0i6G+
 AjOR9/gFa+MwOd3cTcLi+nmhVXYq3M4C0B5DJ5J5Q+AdOmnu4a6DYwSCLMxvzdRYMfVj9hOea/x
 qINJCqLi8AL/E8SJtAXgMyn564sJwv1iVbJXiqJHoFK4ZAtxM2BeqXoAFrdU+lAyFo0zM7KWXse
 mTk05AqW3NyA7DuMwOoR6wBXTY1Hcity7ijTVrqW70ggGRflZgB8KNWCN2orJHqR0GAMER+wPnb
 BqdOo2jF2IcwCh/1jkg==
X-Proofpoint-GUID: O_D_OkSRmw9bCRQcqML9Jx-TqhVkpu7T
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb46fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IZgCprETnBKUNf_ylIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfXzWUGgadP2FLY
 iXr4LBw8EowQuH5lm3kXANpFH+0MsZL+FVKNQQyN/MIwppxFTUEQ4OHZOltV+451aJ0HYfJjwJi
 2WM49yrmnmks/7uAPOzdZ8wP3xF3Zyw=
X-Proofpoint-ORIG-GUID: O_D_OkSRmw9bCRQcqML9Jx-TqhVkpu7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040059
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to avoid when using
Apple clang 17.0.0 on macOS ARM64:

  ../hw/ppc/vof.c:104:14: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/ppc/vof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 873e967f1e4d..ef89b71f7336 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -101,7 +101,7 @@ static void prop_format(char *tval, int tlen, const void *prop, int len)
             strcat(t, " ");
             ++t;
         }
-        t += sprintf(t, "%02X", *c & 0xFF);
+        t += snprintf(t, tval + tlen - t, "%02X", *c & 0xFF);
     }
 }
 
-- 
2.55.0


