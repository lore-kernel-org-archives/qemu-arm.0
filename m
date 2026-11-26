Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A0A606A321
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ow55cTZO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aAdux/G+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWi8U-000788-06; Thu, 26 Nov 2026 17:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWi8R-00077a-AY
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 17:40:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWi8O-0000z2-24
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 17:40:10 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwDrj3864425
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 22:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=/fFedCrrCwJbyj+OP+1c8W
 OyGB2E7lX4qHbUf67s/G0=; b=ow55cTZObcSIhnA5z8jzoeima8GJiiJKNt2ki1
 norN3ohFmwm8ZnBUtW2zN1ekpy3BFbYQrFojk1W0el0MQuxs/cuOpYpzGD/XSv4d
 tVgG6/5wTYSDm7gFE5XKsDHtXm40K1m38Cdc0Gl6DhBgb9bR5obL1J/TuzF6fIIg
 My6jsU/DBDZGo2JdVigEAGGlfDj12GNPBSzN2DXcXoCS69lpOq7bqoSuzDmzf5jF
 9GngOpMoPd+EoQhRx4/l/3wJ8F3FYLXQ89CKLQwdNsSW4KoEktrCPsgQrYMQCQBg
 5wZiojJgEqBXo4B49o1GsQ/AnMkSvqRJu14uzFXnYNpuwHRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55rcur-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 22:40:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-94967c6d4f4so835540085a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 14:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795732803; x=1796337603; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/fFedCrrCwJbyj+OP+1c8WOyGB2E7lX4qHbUf67s/G0=;
 b=aAdux/G+Otly/zC2fUrTGOZBa+8ulTpcQl7tj7V0jei0cJeqcDIYwPuHTllA/Ig6Hn
 ofFjfaIOfjA+kGYLibV7wWXcIaHKLk+yIk7d/hbxTfSeTttguNzrblIv1ciPtit9Qbx3
 rCmpP53pcdv6IpwxDmsBBmg9OoIQWT8ysq6EmMhRJLs5Ayg5vqROiMlbfrz63X5pZXiV
 iL5uVe+3ugWQAXAWEluyCxhKUMv4V95ze/FToz0Z17xt1lpmTMr/okYOyh1VEY9M7n1y
 Wakxg8sFxUGHYHCZupOhVJMRaytMLScDqwygkMrYcUSSwNNZttY6qK6MaY4ddJJuMr4w
 fV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795732803; x=1796337603;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/fFedCrrCwJbyj+OP+1c8WOyGB2E7lX4qHbUf67s/G0=;
 b=Xb3+izNlf8boYNuksnf/WnwgXwG2vcpTxjHVvv3pfr1H3FXdLSV03ZfJiXBsIJ48Q0
 dW39aOr6ORqwuidyVF/GQgdFu4H07EBIrOEPGL0wXON/Xze/tMq+zw9ZEuNge48el6mi
 zICbF8STwzMxvCMZKaZL9Eck+LV7mkpIg58DtHlOydkeRaQit5IxKos2/QCPrq7yYg5Q
 T+V+hzkROvPF9va0FMrJkszS5zfQC6BI1UZF1rLiunevx6PXc1FKupWlxF4tbZMLucdA
 kesUbUnUhYvaH7OtxnzuXn7BjOt3euP59Me6PkzXkGWVTFJLRbgVKY8nzUpJsHtOOr4+
 OLeQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGKxDE5Hhp3hJnLxB5FshLgoEJGiKtB0BYDyULQjoxu0ixFoBDDwY54+gqJ/5UK9nT0N/6Je8nJzw==@nongnu.org
X-Gm-Message-State: APuU4Z/yyjb2cFHEhshr3MRGaBEcXM80vRQ178VXeK75MZq6YiNIo47z
 IRAMS/eyzaTfSOy+NTqme6FAYokEt/7uIa4lrbMeXQhjkQDSc12ap5dYcuLj28ObsDK4YXS5eoq
 075NyuzuxoVNbN6xbMSqsl+OePSMs7Zr+OCA/riPzLTRNGcxgeyqEdWY=
X-Gm-Gg: AZFdTZf/eF4W8rPHDcamKlgTEvAnNNPPBVS/DOVq3FwIW+2Nvfr1e7T8+EFT0SVdjkc
 6jZvjEqAQS3nLvpVHbQogbVcAwM5GTdPAtZwbsWg0AV6pxe7Mj6huWMy6QAVQOEuL2Oc19mn1pI
 hPoZiNmB97exYx+4WxkIqFMukev8Pu9kiuRxpSLiYJ9VieqZyiG2zP6b//3DzAO5OwYKEqbq+Q/
 I3shtfGKAePJmsuCoY087jBeDS3ePLdn6Vy+BercNqiyshArOF4A+xijhfQFQZjb5n7AJoViCC+
 ujD00alIAi3BzYIODcMGyl0w1wn/nLJFhR4BL0A1/CwRpoMmZTgaZC1cpVImlLe1qt8pBertUbU
 UbV8Mrhy+2MXVhdUMSVu9S89/oaI+Iyyt6NDdr23oN+ZENywpIr1UrfRvMEWhmSaPHGqVXdrJYC
 6m8Qh4qVjEnlo80A==
X-Received: by 2002:a05:620a:460e:b0:93d:f7ac:4706 with SMTP id
 af79cd13be357-949ba8260cfmr3682198785a.9.1795732803090; 
 Thu, 26 Nov 2026 14:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:93d:f7ac:4706 with SMTP id
 af79cd13be357-949ba8260cfmr3682195585a.9.1795732802651; 
 Thu, 26 Nov 2026 14:40:02 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c340df4sm49423534f8f.55.2026.11.26.14.40.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 14:40:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/2] target/arm: Read generic timer counters without the BQL
Date: Thu, 26 Nov 2026 23:39:57 +0100
Message-ID: <20261126223959.62899-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4OSBTYWx0ZWRfX6ZKRuRm3H4ds
 o4Y54I/Ajpkq7IfDwhzybV6rvBBz4v5rS7xfh5zkhkR8TwKOmgM86cLUm257WXocp0XE6jmKDDz
 tGn8Sw8cNqkOILTz8wHmxtdITHUiyH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4OSBTYWx0ZWRfX6TbB1xtTrW0o
 OrG3sbtGzQuEHNPVmaljGm8iwhzUwYEUpz54MsPZGj7oHBUc67DVgLLSN+zmKpjlORiui+8nfyu
 E96CS9l6/6rJXSB4UNjbzrNtP3ddXH+hOGb2/rn+UqJmdxjlSwECrXiqKlhgQEYJS/xJdOX9zcP
 e19bUivPKSyJAdlEKs1z5GKFbxghxpa4vUbdgFUGr3A3YHzYWlYcCngCoqQlHRA0Y22ACrggNuN
 nqzL6uo+L/g6cv4bBQPfu9SdL093WymmQdspHHXBZ6gE/h6zGs19ZhrgMD+iKfeo+z91Vc1hFeL
 LLIOP95601QvwXKfoY+o05WbsRmIsBmt2UBNZTbIWPU0uATVvtzP6AdkRp5Ox3Xmz40uFCETQPa
 Y2cZw8/nTcOlqbZV5uMobZaU2L4ZO/Btqs/9lOiL3VB4s9lOF7mv4GXWTDo/VNZnZobhfxgFJZi
 RsBcETwHUFVj9Mm49ug==
X-Proofpoint-ORIG-GUID: RbLAz8IAmAYYbj2UTHasDWzIrpL8jECA
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08b545 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0at1Q4f4uHMGvLL1maQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RbLAz8IAmAYYbj2UTHasDWzIrpL8jECA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260089
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

ARM_CP_IO both ends the TB and takes the BQL around the hooks.

Split it into ARM_CP_IO_ENDTB and ARM_CP_IO_BQL (ARM_CP_IO is
their union, so existing registers are unchanged), then mark
CNTPCT/CNTVCT and their SS variants ENDTB only: they are
read-only and only use per-CPU state and QEMU_CLOCK_VIRTUAL,
read through the timers_state seqlock.

Under MTTCG, counter reads are no longer serialized on the
BQL; with icount this relies on the qemu_icount series
based-on below.

Note, RISC-V cycle and instret CSR reads reach icount_get()
and icount_get_raw() without holding the BQL. Call path:

  helper_csrr()
    riscv_csrr()
      read_hpmcounter()
        riscv_pmu_ctr_get_fixed_counters_val()
          cycle = icount_get()
          instret = icount_get_raw()

Based-on: <20261126222530.62175-1-philmd@oss.qualcomm.com>
"accel/tcg: Do not write qemu_icount from seqlock readers"

Philippe Mathieu-Daudé (2):
  target/arm: Split ARM_CP_IO as ARM_CP_IO_ENDTB + ARM_CP_IO_BQL
  target/arm: Read generic timer counters without the BQL

 docs/devel/multi-thread-tcg.rst |  8 +++++---
 target/arm/cpregs.h             | 11 ++++++++++-
 target/arm/helper.c             | 24 ++++++++++++------------
 target/arm/tcg/op_helper.c      |  8 ++++----
 target/arm/tcg/translate-a64.c  |  2 +-
 target/arm/tcg/translate.c      |  2 +-
 6 files changed, 33 insertions(+), 22 deletions(-)

-- 
2.55.0


