Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2FE606D812
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YMg7iCK2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gj7ks2E0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwx3-0002kr-QN; Thu, 05 Nov 2026 07:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwwx-0002kD-QG
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:52:17 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwwu-0005fI-EH
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:52:14 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5AhuCh1582933
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=C4wyhq0QCfy+i3u8v5T5DX
 pWAtc9llSmeEyL5gk7RJs=; b=YMg7iCK2dQuIT4T18+Am8zHmo/7wVPG7DVPGUe
 x7/Ik9xQWwwY47tVZAjvh3PRqvztI6dBi8d55i+TMcSm6qwbNlCe7gkU6RYfimT7
 9k93ueSwgcBsX7bbxRC/UcF2cwfJFX6o79ToTwEig3YIJK4MQ8GhThdDt92KLQMq
 +9lOMdcWp62JMZiU1yzCw9op1RqdMNVnWaU0bf2kg5WYcUFvA05vidnkKE8uuuhY
 n/EqynFP/jIvmJSEVulpfWpLPZKTOT9mHackjO3YgRpmcrEeAq+KR3CaSPNNB1Ha
 wsPCretCErsbKkJGlqU/yO7/SXZ4dPJW1v32wH1WPkowZ1aQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraargn4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:52:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f33438950so387253385a.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883129; x=1794487929; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=C4wyhq0QCfy+i3u8v5T5DXpWAtc9llSmeEyL5gk7RJs=;
 b=Gj7ks2E0Xu0ISXIzkk7X54evZD2glXfSWM0Dva7qf7+E3Yn1jW6NDTiFu9ItCYhWDj
 65H0wZhEAV5HrVxFLhxuk1Dy7uSvcYx+yg7/Oe/NHq3+WEF/xM/qooo6JfRvzgUB3juw
 3dx2kYKV//E4cpqXUMUVRVXLmB1VcNgdW4hw/iY4wGzCwI+OmzrTIUvX/HsfrDPNJWXD
 AOq+Tk0GVLZsN8pxyYpUAat+Ti36QCtXt0HP48lw4xVRAs7FbLAEZawjJw3nJwbtXYzr
 oBJvm+DMWeFG1DGa/GsNlBWW2XoMMqxLR4LybR7LdIdBw34jFvclHU+mg25XlrWYgcUJ
 RrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883129; x=1794487929;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C4wyhq0QCfy+i3u8v5T5DXpWAtc9llSmeEyL5gk7RJs=;
 b=qZoo5rSbma66CLDXM2fpukQZbFy1e6R4I6jbHXGFNa8u0gyAu2fiJSp3Gnh4dCkOWU
 3chDg2ElUipUc8yB6Q8DdvPdNMvj1lvhTLBs2i6uQWqj+cEBQNuSxYKbIXwf5aG+IWqH
 wo0jiB+/5fEsSYQRPv1ZWhjjIuOxTlzUmj1+95Wc7QlSouiEdJ4IuJoQRKENqRxfwUpE
 LxQUKX5gxwke466C4I6iVeh30NfBq7e56MYBWm/AAOtvCzLhy7Xe0GPbSC3hqA9LMb7Z
 2Yiih8vQy7wx0hg1eC8V395tKTOAdA8SXHZiZ4DYSnlsMULg3RWhNGWknqqCUtTMVR4M
 sGbQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwn+x+RyiRCyGbljztHJ0B4+RJ3rzjECv9Yywxn+YWFiDwKDojihY85q3gyC7lpDshqGA/eKSIeEA==@nongnu.org
X-Gm-Message-State: APuU4Z+rJ2zDB1nCJkx+FAfexiN0cYRiG4HCv+AG2wmgI6PuxmJv9VLA
 kBoLoyjTyAGl7ZEO001NzpNFA2gl1Y8ZkVGFLKTtB2xZNSasuoTIcTrf8i4rMEpCM0UNB9WDBq5
 0uhXgSoFk8yVPC5cC24ry8EcxQwuUz6xPQ7qH//Ui5o/xQ+F5z7SjRPc=
X-Gm-Gg: AYBFou1TFtyKygu1qMB7FpMekHAOjU0/JlRFihtCzko1O1G61c2x3i/q320kMg5xkbz
 i1mxfBnjva+6A4MOPbcFNPi9LsEC5jqo6V/d2wY+QQSXHR8tZS1DmJzhpR7duHrlHYk76Qah8gR
 TkF06rhbFaok0X+tqrUB85PyFL47W02IPf4oLPvwby6OgkEflSgoioN5j4ah0X2vI7PXMqLjkBs
 nwlOqTnl6MS07/ZqOR1vl48UAsXlSclbNI3oltGDh/WV6sP/ic+oqcQ92ZKM4cfG8orkqg67Vgo
 HbQh0sOIor/NaF4P6M6qeLeUzXsh3zxNXcqnqYGFkrpxWp4i4oC4Y5l8PwnNLSGqBhKGEm16YJ4
 MASn50ATzT3nHrlVFEvkOaIno7P2Wd3YhvfHBD1ZcaCBcLolda7IrJkwPdOAQYsp4b17i/BLbqH
 rbay1gYuRzjw1sGhSnRPZqhzmZuPeQcQ==
X-Received: by 2002:a05:620a:2614:b0:93e:920c:bfcd with SMTP id
 af79cd13be357-944217b0ae7mr3278777085a.57.1793883128954; 
 Thu, 05 Nov 2026 04:52:08 -0800 (PST)
X-Received: by 2002:a05:620a:2614:b0:93e:920c:bfcd with SMTP id
 af79cd13be357-944217b0ae7mr3278772785a.57.1793883128276; 
 Thu, 05 Nov 2026 04:52:08 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac57b9csm1738357a12.15.2026.11.05.04.52.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:52:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 00/17] buildsys: Replace some deprecated sprintf()
Date: Thu,  5 Nov 2026 13:51:45 +0100
Message-ID: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX8gF5ddk5bXFj
 CulPg2QjSQBx/QlBqdPBmBkrCcpv9m71450VwTDutZJyaxOysQTE+Z1WBztz3+Qpn5UuVHRhGop
 Aw5snfk6SvCs/qDSKL44ReUTHIame0Y=
X-Proofpoint-ORIG-GUID: BFL6rcV6jSvproxrk5XfAqLsBUstBX2r
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec7bfa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ym21472aoLdQ4Bz9H1MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX4pTs3ifMULQx
 OUE90cVAVO0JT1Hj6V3+Eh1tDb/2Sl9DsO0gS8TXpP2NyGHywJH4i1jRBCBoMlyMVh+JgSQiRMy
 FH4fChOcEvka2NTVrwLbrKfjDiURrrdZ62VeyMTPcLuzPiVkEotFLkbTAXJH6pYu0Gch2/XtVyL
 o/xjTKEkg5cCcRLA0YlEaUfaijzni7B48XUjcEaUrTl2Mg769n5+cNgtIbwURahXrwVWYCeniYv
 y8rhj5JXuh95loOYmlWJi80zC6lqmH2Tt+Hz22e39NVD/PQvs5m59p9BqaV83UnLMeGuL9YjS28
 8Z9iyziBg/VrTwJ8eA/XMpIq6iDimYMr4+q+amRE0GkRDm08DS+o/9dDcQiAMxNXZTj/+wtNq1D
 6qTruBk67yDjcf4flLzL3kr4rdbOEvDHHPTyUxhxh+kbywgaaxlEGKvAaZ3If3hkBxUR/zxw4r7
 8OuyfISZa4v+Vb7mqmA==
X-Proofpoint-GUID: BFL6rcV6jSvproxrk5XfAqLsBUstBX2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v2:
- Use g_strdup_printf (pm215)
- More replacements

Since some time now we get the build output cluttered with
many deprecation warnings, it is becoming hard to notice the
real ones. This series fixes few recurrent use by the
--disable-tcg --enable-hvf build.

(Yes, VOF is not used on HVF x86/ARM64, I haven't
 investigated why it is selected and built).

Philippe Mathieu-Daudé (17):
  tests/qtest: Use qemu_hexdump_to_buffer() in qtest_memwrite()
  tests/qtest/npcm7xx: Replace deprecated sprintf() with
    g_strdup_printf()
  tests/unit/qobject: Replace deprecated sprintf() with
    g_strdup_printf()
  tests/unit/visitor: Replace deprecated sprintf() with snprintf()
  hw/ppc/vof: Replace deprecated sprintf() with snprintf()
  hw/usb/hcd-ohci: Replace deprecated sprintf() with snprintf()
  hw/riscv/platform-ref: Replace deprecated sprintf with g_strdup_printf
  hw/vfio/pci: Replace deprecated sprintf() with g_strdup_printf()
  hw/ppc/spapr: Replace deprecated sprintf() with g_strdup_printf()
  hw/net/eepro100: Replace deprecated sprintf() with snprintf()
  hw/net/rocker: Replace deprecated sprintf() with snprintf()
  hw/scsi: Replace deprecated sprintf() with snprintf()
  target/xtensa: Replace deprecated sprintf() with snprintf()
  target/m68k: Replace deprecated sprintf() with snprintf()
  target/rx: Replace deprecated sprintf() with snprintf()
  libdecnumber: Replace deprecated sprintf() with snprintf()
  qga/vss-win32: Replace deprecated sprintf() by StrCatBuffA()

 hw/net/eepro100.c                        |  2 +-
 hw/net/rocker/rocker.c                   | 24 ++++++------
 hw/ppc/spapr.c                           |  3 +-
 hw/ppc/vof.c                             |  2 +-
 hw/riscv/server_platform_ref.c           | 11 +++---
 hw/scsi/scsi-generic.c                   |  2 +-
 hw/usb/hcd-ohci.c                        |  2 +-
 hw/vfio/pci.c                            |  7 ++--
 libdecnumber/dpd/decimal128.c            |  4 +-
 libdecnumber/dpd/decimal32.c             |  4 +-
 libdecnumber/dpd/decimal64.c             |  4 +-
 target/m68k/translate.c                  |  6 +--
 target/rx/disas.c                        |  2 +-
 target/xtensa/xtensa-isa.c               | 50 +++++++++++++++---------
 tests/qtest/libqtest.c                   |  6 +--
 tests/qtest/npcm7xx_adc-test.c           |  8 ++--
 tests/qtest/npcm7xx_pwm-test.c           | 14 ++-----
 tests/unit/test-qobject-input-visitor.c  |  4 +-
 tests/unit/test-qobject-output-visitor.c |  3 +-
 tests/unit/test-visitor-serialization.c  | 21 ++++++----
 qga/vss-win32/install.cpp                | 17 +++++---
 21 files changed, 102 insertions(+), 94 deletions(-)

-- 
2.55.0


