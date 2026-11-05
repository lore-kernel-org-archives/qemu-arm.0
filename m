Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3853C606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4KdT/hQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WciO54zP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwzV-0004z3-0G; Thu, 05 Nov 2026 07:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyT-0003cd-SM
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyR-0005oI-Nt
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:48 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tJE23684598
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gm6S4+bkjG/JKgOirRV4r8Y3XiPR9owHfvgX1WSZKbM=; b=Z4KdT/hQzcV5992s
 uQzf648nf1giI92jVxX+Hi9arkUKAD1708v45GcMnhU6waInwiNsWhCGKagKeCr7
 fQRTK5xAdlx9zicb7oJV7X0XLgYB1OSftI5QpnuAajhb5dEsDOSnyedM2j15LUwv
 19TL2RacsFWPWuaXyASshUJ59C5xhAzypr3bqO+8S47AUYipakpFgVO+zX8XXBja
 n0ttwbmIQJasZ+AWIhatub6UYc/bgml8Lyuexre2DHvOmMmMtabQDA+cRhjJWAv9
 lJCjlpcPQMaLgFa3l11f1BUm/WrJxJfFPwkicGwKl3IlNUOddyBsKgzBwyCzcLUV
 EKbiMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43j4th-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:53:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93909014c85so397151985a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883211; x=1794488011; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gm6S4+bkjG/JKgOirRV4r8Y3XiPR9owHfvgX1WSZKbM=;
 b=WciO54zPfKmTmzhSMdEEfJcj5cgud8DwQfCKqkDhKzTOHTuZqxiTA3eNyNClJ3sZ7t
 q2ROFh6Rc/2VFPEgS09/EVcpLMRK73qjo/sFAoqBdfgzlv1Li5Ha5sXcYdEj0H7u4UtN
 rmXQ/t21ICcwnc7TvaxrkqgUplzjHvxOapaZbXJzlYvY7iIAVzBJENPHqoWf+RUSXEuE
 1UJCEMyPqxGD3lc0UMud9rrA/piCeo2F45QdcZRJZJqNOQiC8bvQwoWJVIhJtKsQbb1C
 5OaEQmEYWlkRlKNlWEyRZ1UBRNEPOYqki4EKVfbS7Nr+f+PQ7fzzWD2vy61gn6UMN6t1
 cP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883211; x=1794488011;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gm6S4+bkjG/JKgOirRV4r8Y3XiPR9owHfvgX1WSZKbM=;
 b=DmfXsyeYuKvHkhPkFjaGO3R3EO7hg4f0K/u/KJzLQO8HHURYF0TNsU2PXd4yWIk++h
 U8eIjYtPugwobSDfEgpPjF3BgKUotfyBTnurJAL8P4St+lFVUl22bIUotLrxfCk+0D3Q
 Hz471wv4BTvAmKUbN2zhZ3O5a1IiZcuCjGEefrCiPfg2Vy+6ea4ZfIa6HZmMoKAMSHvj
 RwV8Ty5n79kdd5KtHmyYz7wFkyjuILw/A7kRyZnJEqLgL3qUTh/ia3X6i/9FkcGpHeEN
 1h9aavo6fRWwDtmIw3/09T7t+qTpODxxY/XCD8K1AB9PJn8WziQrqEDVJpR/wgOqwhXa
 WNew==
X-Forwarded-Encrypted: i=1;
 AKwUvBx/spE8snpAkWpyJJ6B0PoChSUQhN0I6TRBnNB+ATFTvHhO5LOH/Tj183/vbdIkp8Zj+aSsDjN0fg==@nongnu.org
X-Gm-Message-State: APuU4Z/YvdiBtU3gzcecC+nLA6TW2ZkvREPpDTk/7Bx6SX0aYnHuxD4T
 PBHZ8P6OK1UFJEZySwA4xZBSEEFuJnYa+R5Q3ToHiNYhdyDNMyIPxYyxPQCzcVFL7a278hadJ/h
 VEE56AL8iHrOkTAUU2Ms/VWf1mgwx/qTX4YVWLbhmAfuxKpEuMtm6Nu4=
X-Gm-Gg: AYBFou06IXi2BMe7aypoDuFox27m3pFkesIBRV0Pp7sBpaCsPC6IO37tqVTWkjDremJ
 pUDARWUoWUfBrzI9sYO34wfBvpYXuGLLFbqguWJjwJ0KbTeqj1i6inqUNwpimdkD57TLprIJ6TI
 XroVqf4dB09cNroS7gfN2XqYW1TeacVFeAoFVjr/Ud/c00WOz6vdvrJVWBUXKOSkxgpv5IogYLJ
 FTHUYdiz1Ud6R30YFGW2hi3a0vAcSQdP8JahtfZWtur2j1XlBBu1EMGnI3RNxZk0XJS9uQwx+oJ
 R5PEs7/EWlJNDO/5WJhORVnMPRuEeuwCDRN7npT9snMUygM+OEtFLKw1MA+i4zAigZrqi3RhA8U
 K+GL1ywJp+uAGo11z0X/KdSpNP2n735kuIlggBmqj6emXgFJLLoCF02uccKv0/1VGf4NDGKtmIZ
 txfchTei54ecLDDH3eZB/JNgkwfExE+A==
X-Received: by 2002:a05:620a:1a22:b0:93f:2d10:ea44 with SMTP id
 af79cd13be357-944217ef451mr3142287685a.52.1793883210951; 
 Thu, 05 Nov 2026 04:53:30 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:93f:2d10:ea44 with SMTP id
 af79cd13be357-944217ef451mr3142285085a.52.1793883210406; 
 Thu, 05 Nov 2026 04:53:30 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b5719cd68dsm991882a12.37.2026.11.05.04.53.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alex Williamson <alex@shazbot.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 08/17] hw/vfio/pci: Replace deprecated sprintf() with
 g_strdup_printf()
Date: Thu,  5 Nov 2026 13:51:53 +0100
Message-ID: <20261105125203.40320-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KA211fC5_ULV56GHJgboXIH6jiocovMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX1fpq8APhFjCN
 MGIcZA0gb8hxhYNlru93p3u29bSCOCxiziQCgPIBdXYVuLAErB0mglDYlr0KsKgjz+K88Db8eZG
 8TcUE5QDJxbKuBS8HjHCx4JjoHo4ebWx7bbnZinIDdDYCcL/ZJa7JdYgXqHe7eTieM0J+5DqNtI
 6n6ml5J7z+9RbIk3aXg6yCG3eWq8xWCkZfx+Q2iL71AJvbdu+WPljZncl+3cvx0oB33tOJ8IE48
 XY+N323YqJTruA3ZFzbro996a/GBH711LSW5Xsjd1ZUxaATKqxpHtoLUEoGwOiwzQOUExiEB/Gz
 ilKBYAffm1s32qkqNiTQSdDyK6wa7kqsEYkcueWtqSiudEToftJ+IEgqpHB80CU3fDm6D8Y2qjp
 tRdJebpYNA0IisYjOQqi1kfO3KTtJUkqaBcHBeBxcc2gg9cqoJDKRoYAhrEXBXZZnnQBetaxg6S
 ZbAYlA+yWZh2vxoUHAQ==
X-Proofpoint-GUID: KA211fC5_ULV56GHJgboXIH6jiocovMW
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec7c4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MIjEIQyjxCZpfGQf5MEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX9e7JqTFD8+ja
 rSd/QPeD5Rmw8CQ/iRbkHJbAuUCDLomMPLvtqgAxi3+3tnaeSRGin2ZP2f8TlNe80qX4VI1Z+pw
 zuiz4vnKFTuZd0I3bBtLkhkB+RggkGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
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

Replace sprintf() by safer g_strdup_printf() to format the
host address, silencing -Wdeprecated-declarations produced
by Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/vfio/pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0da2e143b88a..eea96240b7c9 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2857,10 +2857,9 @@ void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 
 bool vfio_pci_host_match(PCIHostDeviceAddress *addr, const char *name)
 {
-    char tmp[36];
-
-    sprintf(tmp, "%04x:%02x:%02x.%1x", addr->domain,
-            addr->bus, addr->slot, addr->function);
+    g_autofree char *tmp = g_strdup_printf("%04x:%02x:%02x.%1x",
+                                           addr->domain, addr->bus, addr->slot,
+                                           addr->function);
 
     return (strcmp(tmp, name) == 0);
 }
-- 
2.55.0


