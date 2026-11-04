Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE5606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9cxHJCD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SfwKM6z7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOcNI-0006bA-RT; Wed, 04 Nov 2026 09:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcNH-0006aQ-IY
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:54:03 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcNF-0003j6-Re
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:54:03 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4EI0d13079397
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 14:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vNx0jZscZB8Ug/Xf1qxtPaJJhN0JMyd4yC5ugrqN8LY=; b=W9cxHJCDEBX+cKkL
 l4S61fDSN1kigf/opIo4ws5vKCoSKpuPmHv9URXisVWes51/khb2pu4gD+yQ4tzD
 wHejDdNK+7nKlYfca4Es9qVKXNMITepZljtKo8NOiodAecZypSWzRYWINudWHFAp
 i0X7yXzn6d+bSPwePXA3z+29WTJR3OOZxH9LyzcgBBuyHbKIaUOpeW4vKyja0CET
 gX23zsuUkdHT3IcTNzYzKF84skXaj5dKcPfMsIHZnaH3gJNQaT25+whWM7Q+XlQX
 BNpFd289kd1Ys2zhZfK1mzUTpaEXuXd2b2tdwFExvG9kYJU76IGi4aYbMArYgoYP
 c++CPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bng4e4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 14:54:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso127091185a.2
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793804039; x=1794408839; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vNx0jZscZB8Ug/Xf1qxtPaJJhN0JMyd4yC5ugrqN8LY=;
 b=SfwKM6z7V0e3mZO+fJpglLhzqDqdrximx8tX7D4hte7DQ8O9JZAMbWzZbi4JK6jMqP
 r5jTkpJ3VJT6rRd+RnwlcOAETKVp7S64hFOHX4COoVOJqvG85MjMgrwceM5+B65NIne0
 4PQVDAYVeSX8R9XyYJjpQaj20qtaewR1xJsKBl4IHVJSC5wk4yka2DJoYqURkKN2kfFc
 QWj+zfTviDi/2+PSPkGdPQqEbwPv5a8uyI/j+awkO6ylSbqQDQz9r2MtPNDqjh62PsM3
 9j+/7SNPDbM8mr53Pqj3057lvqMwqOmSKKjqVW9zC5a0SzDYgSQRlxaQdQyFQLPAjOx5
 /WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793804039; x=1794408839;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vNx0jZscZB8Ug/Xf1qxtPaJJhN0JMyd4yC5ugrqN8LY=;
 b=e6ESH6TbUHL1BF+c0ImhFkVAsh0UEhe1XP95AHhH/Y+afJA4T1feDxz3JHfc+9hF+H
 hdjtl1kZsJPRcta3al1Gr+F7xdcEGtLiADNNgd5XKYeYk8Kg/ck/YrvOL6ervYnJYjRW
 Zh0jLPhXR/AtaEqNg3MRjk1Jt9nGe8w95FVzJOKIeYSI+mda5DCJuD++E9WW6lfrODkx
 ffKXh/NLoJn+2bFvu9HB3uSSYpTKkq3Z5fQZeNs0LRNyQqTV7XUIp64TH8LrkZm+wuJh
 nFPA/NXtLuwhowyObnvIx0em82tmXXuFoYokYemkNq26D3usni4D3RJg/LzXfjwapFf0
 XHiA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJmVJCqG12Y/+RY8AXYSLEq0P3TbVV1feHOFsUjL2ZYoUnJVKJ+huEFEGHgfa4ZSmvdAQ2LOPI5g==@nongnu.org
X-Gm-Message-State: APuU4Z9ZrNBtAdE5Yk83yu/iZvQoT2hXop+fRA0TmbnYAyC+D9uT34V0
 D2b/AXFVIWgL2fR5RQLbmKBdx6I7i4Po2vsqgB0GxzEkUUr0wFjcT+0db03cyljmcMvBfqjw2rD
 9031OhxrYHyvn3Iu6K5hkyNwTYWOtnUlEW3oZFc10FRnI5aqZbg5do4w=
X-Gm-Gg: AYBFou14pm6DZ8lQwcDQigz9FVwoKh1wj5SVZZMtBLiG29gtjbmmiO1TKYo69BbA7or
 69mTmGKwgEqwmLCOhDO+yKRe24OmkVkrBHWqQbkTvj+KeUzNEsSE3JsuLjBEGmmvu/1sdywiWck
 fcc8eI8rCSiuUDv65+YQKC/XdefaGM5qSxU1AymH/aUEOZrNB16kHTRSucK4xkQcfRUXBiVkInX
 dZyDNGmTyIthVysKliLQfTlsP5A7/3RtWNIdMEgAwGKb2nbwdJ6D0E0dJZM8rb78Nc0clAKqUNV
 kntR9PCohj+Xydh7x1k1hjbbBJns1KzTu9eMjEc8L9hBNAZuHD8kooOkTPX018lNQtHiT75vI5c
 zN6emsFZE97ZoC2wbXq9H2xMHIebLBEX5+Q1VqtleVtWdCQRl6DfmHPYUIPfYfgIuRwLpvg/w93
 ldsELU7+CcOiJ0zA==
X-Received: by 2002:a05:620a:a7e1:20b0:945:de54:9c48 with SMTP id
 af79cd13be357-945de549f6amr96317885a.27.1793804034492; 
 Wed, 04 Nov 2026 06:53:54 -0800 (PST)
X-Received: by 2002:a05:620a:a7e1:20b0:945:de54:9c48 with SMTP id
 af79cd13be357-945de549f6amr96314685a.27.1793804033992; 
 Wed, 04 Nov 2026 06:53:53 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b43c17ecdasm86259475e9.5.2026.11.04.06.53.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:53:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 5/5] hw/usb/hcd-ohci: Replace deprecated sprintf() with
 snprintf()
Date: Wed,  4 Nov 2026 15:53:16 +0100
Message-ID: <20261104145316.18841-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104145316.18841-1-philmd@oss.qualcomm.com>
References: <20261104145316.18841-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX8UFTFaAU7WjN
 naowdKJpJhxGaXH3g6WPBcNZk5W+7hRgHs3u9WD/D4GqCt82yvh34PRDvW1GdTTeZle7b5XY0lN
 psaEH71jYqv0LyPusxDL8L33Z1RPct4QtxO1FqN/hVfvmIdi6XXss3sYsKKwo9ZA92JAHmJehIj
 hxd+YPD4jB2QVGgiRjK0Kt3PITN1nD/ijSQlujFNB+T2FI+2JmSrdtmPIqzt2zt74ukcZ/d086U
 tikmkUMcQH9f01+FT13amSirqU2PFIjtcSHOkVgLk2y4XIqLs/x/abkChTsiwCmo70VsVjP9g1C
 ut2mve5Wh8h5uPZYClaXY63DTARUVJwbucL7hfw/ieBHV3VmHLtCEZyEBR5/oQhQzZvHipdBK7G
 b6TVpsxthfXc3I7Dki3hRkXtOLBzqQcls9xcxPHKGK8+7i6Aqivf+3wJqQaslCHDCKq+cSjAcc0
 U92NwwTS17bt2kRJ/eA==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb4708 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gRCD0AujNZxhkLCY9qcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GERFdDwLlKflQZ9BU74ATC25bgNF9M8y
X-Proofpoint-GUID: GERFdDwLlKflQZ9BU74ATC25bgNF9M8y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfXweEgD+KzMsR6
 rQnyLQuVz/eXtkCkoY7YSVY7yUrXoDIfOYHgTp/u1oN7BaVTZ8L9C3bue47zCSvbXXi/p2IwKg9
 QEXsdRRVXEtiqH61SiRfI5WSRGQliO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040059
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

Replace sprintf() by safer snprintf() to avoid when using
Apple clang 17.0.0 on macOS ARM64:

  ../hw/usb/hcd-ohci.c:875:14: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/usb/hcd-ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 4d38150a8458..d9fcee6c0b4b 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -872,7 +872,7 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
             break;
         }
 
-        p += sprintf(p, " %.2x", buf[i]);
+        p += snprintf(p, tmp + sizeof(tmp) - p, " %.2x", buf[i]);
     }
 }
 
-- 
2.55.0


