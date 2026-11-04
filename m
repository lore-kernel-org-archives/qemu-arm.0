Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABDD606A326
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nt8vBelh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8Lw6zG4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOcMg-0006Gd-ML; Wed, 04 Nov 2026 09:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMd-0006G4-Q3
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:23 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMc-0003f7-8s
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:23 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4EHXEu2016666
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 14:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5oC+P1nCpI71y+qROZXo6Q
 FIQD1GCbW6BQEFgt2qWHQ=; b=Nt8vBelhlKPQstPB4zumkiPe50svwGox0f73Xo
 U8QpjVQYIaizjvqtjAVSEVUvr2M0Bk+R8a+xTPAxUfGWjsU/W7DXYe1AypWxj6Zi
 ud9M8erEUnH/YtAcqc5hO8zeUzLGYRJNfGxZle6wrz+RI2PvYngbGrlKcWAKoZvp
 PgBBZXVvRh6NH9CZtw4vYddmv1jX9pIxZgLNZVER5xqvGuoyKGT0kAIElOMD5Dkk
 +cCy2KE3gICv/bmB8R6eXhFmtYhExmWSjwFyvG8J/o1TCegpOy34r1qjt+LnY8Cn
 IgPzqMf7MMujHoRH8WFwVkBLkrfJ5gCt2khU8lJzSvnWuaEw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdr450-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 14:53:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7cc175cb172so637493137.1
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793803999; x=1794408799; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5oC+P1nCpI71y+qROZXo6QFIQD1GCbW6BQEFgt2qWHQ=;
 b=I8Lw6zG4APg95+1XlmKi8Hd+pELYPF4qVi4dvmvs2Zl4sr0Jq15qOWcz5EcGUz9XXL
 hh1vCTiposX4KsqMfsK1jXGD3cJw/HOGXUER8F5Y3SwbLFZbsxjk6s73Z4DIfXtqktAW
 OJKAyetie+TDpBLG4zBjUJfR8CIgRWJSig2hw7ba0PVJ0Zj4TNUsidKOg+UwA9Y8f3Ag
 x4O/LAT4XYC6hP9QWxddASUoI+NO4NfU+iQv8/yOYVpjVhiFinNxYbaTOztwX9jHUdHf
 lNX82MobbrAaDI+SjhV2vOxzhGxmTMejL2fUBFLEyB8kIPRWpvPGyXrco44H8go7gUz9
 VJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793803999; x=1794408799;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5oC+P1nCpI71y+qROZXo6QFIQD1GCbW6BQEFgt2qWHQ=;
 b=12Dl6zW7w6Dm2rHNIAFIH+8ReHqkAN/kjsR6iTmPjw4mptlQzRGsgRONfORiDFByCp
 Qa0etjh0MtneOoGyDT6HHCV7WvpdTp0+ETbWX0z2Do2+aks2i5e2KehdMZI4MnMy02nw
 j0wMJgYx1fP8r4Kcs30iEHcYnjrV7FWRXxywc/45GzFyy+MBaFowdlQWvoWlUjhG3iol
 GrkmEc8dey5Mmck686kvhutxmzeEr2irXZgQN5faY1/zRFNdFtyINFBCyz0mLzvrBxMa
 jb8o+ijBBcposEkMN+DXafLh+wObQrTAk2GqIrQTkNVglkzi4cuKmKBvvSpVJF0rFc44
 s7DA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbwIGfMmMAuHg/Sov4nb/AdwftMc5qUBY68di2LwW3vLyZtyvWU/e7JR+YedCV4sgXms4o3SCvkA==@nongnu.org
X-Gm-Message-State: APuU4Z/9Jm2Dz8p01jQkUUtSODpfqnMYoXNT1R754UuRzYuMsFzfD1vg
 3mxX8ImZ5F44c7AWXQkzI95k9/+n2mJNPXMri4Rfyzzo4iclUEi2iI6CfNpGg1thiNIaZdzsUif
 Ezhc92P61el1BhVOiJroX4hxbMsYOr/c19gXXBeTGhatlLjOxon+RpVs=
X-Gm-Gg: AYBFou1pOASggsRj4jcPN7kJIkntAL9oK/8nlj5MzzCks+BG4QiFRZb1iHsycArcGgF
 GuAPHGqjv99J6N9/S29Wd8TeIMZtak+OmDNCxwhaojzevo1WkFEdRII5m7TeLxeks4wYYITWtSs
 liab0hGiDoXWWdEGA0mDgv8ApRFZzIOzVh4v3QGOHqCbmFR/MvBh9tDq8Xi7zjHF1sTLGZG5ohH
 GZnFOXXeqsANV/3PiTCVCIdEo0emJLUB9RrACpVKSMvk0W+IXu1eZ2UOYp0YGqfL2LWizre+mtH
 4S6ntpPQ0kw9fsrb8z1Fa1/XB2u6Cecp2ywwBlzjwvfUskobZHW9IkSRjEf1BGQuSQLUbO0X991
 zWAuo6b7dR+mfruPXdFIwfZTNZW1D1c3VQKSO3JpxBRsjPbhz1oKXBsnM2suAe/Lc7IHmxXLIMa
 s+2OP21FtlMORNhQ==
X-Received: by 2002:a05:6102:3ec5:b0:7c0:cdd9:31c1 with SMTP id
 ada2fe7eead31-7d072615564mr7113444137.12.1793803999172; 
 Wed, 04 Nov 2026 06:53:19 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7c0:cdd9:31c1 with SMTP id
 ada2fe7eead31-7d072615564mr7113432137.12.1793803998666; 
 Wed, 04 Nov 2026 06:53:18 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fedc09675sm4390363f8f.55.2026.11.04.06.53.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:53:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/5] buildsys: Replace some deprecated sprintf()
Date: Wed,  4 Nov 2026 15:53:11 +0100
Message-ID: <20261104145316.18841-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX7HwbUMTF8tvy
 BQTACTdokO5r2P9VQvZtCgom92slB+FBQtMIsbbAHXrIWxiy2rc7GaNGQPrb8UOT+X+qwH+e0Gh
 b+OR+pcmWgb4vRGsHn7lNU/t9/JijU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX35IAgcc84aqd
 RkrLTLtOsQk5vHFq/8Z2wrXEaTKFZdCVGFRVTayDWTczkmTUdLeQowO6I2tdLelTUJJlCThAo9j
 oHCIpxbzm/WrHAEU85aX/cUMnVtwy41PPhHmovBmO+S+mHm07imwu3ozZFJk1RcPo2ZAzF1xRDe
 YeAu888N3pgj5qK5GvcBX/la300ZCzVTDBpb8bYoxzHt3K2HzOZYLgrGAQZ5DHb9QW4FWJMFnqR
 pOh5t71GT1j+tFJIhxcBXen1linjdfcP9Mh3nR97hZzwVIVE51tZR839g+gEUIUyWjl7GH2lGB/
 vrnh+/7dEhpGMXYoUg7/uegGEoa0sNF2nTPTMgD1MQK1A5SNgATMthvDKUyHboqMqV2QRSldnnX
 lJc67GJQOQ93knpAzEvFdAJarI2leLfItVSkCeQTV8Z9cm4qhyVkCWnQgMQ+I5nUBP6Jx54J7bq
 8rIswj3GY2OdJqx6UtA==
X-Proofpoint-ORIG-GUID: vIGFKO1PX1R81fCZhJCFFTY6tv9nJHBv
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb46e0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vRnTLshjCre8FNkmUVQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: vIGFKO1PX1R81fCZhJCFFTY6tv9nJHBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since some time now we get the build output cluttered with
many deprecation warnings, it is becoming hard to notice the
real ones. This series fixes few recurrent use by the
--disable-tcg --enable-hvf build.

(Yes, VOF is not used on HVF x86/ARM64, I haven't
 investigated why it is selected and built).

Philippe Mathieu-Daudé (5):
  tests/qtest: Use qemu_hexdump_to_buffer() in qtest_memwrite()
  tests/qtest/npcm7xx: Replace deprecated sprintf() with snprintf()
  tests/unit: Replace deprecated sprintf() with snprintf()
  hw/ppc/vof: Replace deprecated sprintf() with snprintf()
  hw/usb/hcd-ohci: Replace deprecated sprintf() with snprintf()

 hw/ppc/vof.c                             |  2 +-
 hw/usb/hcd-ohci.c                        |  2 +-
 tests/qtest/libqtest.c                   |  6 +-----
 tests/qtest/npcm7xx_adc-test.c           |  5 +++--
 tests/qtest/npcm7xx_pwm-test.c           |  8 ++++----
 tests/unit/test-qobject-input-visitor.c  |  2 +-
 tests/unit/test-qobject-output-visitor.c |  2 +-
 tests/unit/test-visitor-serialization.c  | 19 +++++++++++--------
 8 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.55.0


