Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEECC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 16:41:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whroG-000375-A1; Thu, 09 Jul 2026 12:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroE-00036o-Po
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whroC-0003ac-Tu
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 12:41:10 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669Dw3ef1970663
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 16:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=d68sAPE0898RZmjfUVKpgI
 vwwr5NxY3/xzv49IdhG58=; b=lRWqkqzfGMo8AO5p8fANiB5Wwg+66583oL3sMK
 aoM7XBhaea1Kz6SR6QFr0JzI4IG0aI1NxXI1aZTJvgeOHpNjffGq+qxIRgSylXYs
 x84dOo5QFQ0AXqPZzZHf/9d7VPnUrfzoEsPpoCn9A8YoW2eJSuQMcscq0e8pgVr2
 gX6yh3FQzFzKkvWNLEx/3DnR0ek9K0n3sMZAYEJqu6eOPhphqSS0JGjQEBATqg0e
 C75Kw22lQfkHWloYSNBRCZIfTWLFUIeSq1mZW9wfchq5TzLuQ6TvGHx4FCxbhXLt
 2bW/Nj5Ql5KDUFH2rJPYj/rgmbxySvXeb1TYAhcRHLnYY42w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpgwx4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 16:41:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c110a3b6aso30074801cf.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 09:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783615266; x=1784220066; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=d68sAPE0898RZmjfUVKpgIvwwr5NxY3/xzv49IdhG58=;
 b=ds1lrjAl9t56Wb82yFCP4/O8kuDKhtGBuy8vcu4N++LQjx5WkRMvPA8kmxBcNgI48i
 1oHNc6pdD/9Nx0n/pHkMP+WKDL/Zrgnh1VgP4KVkXBlof1e+Sp+ydX65z/5eD9uMhzge
 eMClmf3z7UyQwoWIm76eHgz7rUwcbHz4tzzVJgcs+uUV+mSGftmxAH3sONf7zEkGv0gO
 75vEaphh8MAmAYSZ3Vp38PnfcanU1dqRWjDX0QNnQY4tnzELtTTq2mP96RbDmRFdhsmS
 fw5R9IF/2ewMpHSUsUj/vKNhwNZFQwAWlV+k7BV+iuMIj8CpMksSQnLCU5cHzrPGYBB2
 2T3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783615266; x=1784220066;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=d68sAPE0898RZmjfUVKpgIvwwr5NxY3/xzv49IdhG58=;
 b=hj6+8GZxce/jDwAc+/sKxfIkpVPWOlgbE7uP22fYoPp8BQ/1bDdFoLL+z9r7sQ34xg
 20gWbHoctQC8zjxMqWPh+Z6kZOWSOtx80zfHFu2TBDleHZsC1lyDYcRkxci5Kye6v+VA
 RMrTzMgzxeG+i/8kd0mkhDe9dwuFCxfSXkTFVzOcl25s9rw2DXrpxIPkBJ/aQWksOOmO
 VkipNK8W5fnvmx5oNbJexMR8BBqX6fX7Md9zOpEpRlO2C+JKvhc0n4dVBGq6mWKun2nE
 9ErFZGtmy77DB270Rkfn37YEFUCk4TZq8II3ipaZ3maz1CaKU9eskB/pGk8oUakLRqDE
 K5ZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoB9F2GGmzzrWxTqvXxH3rVBN6DZQgb+WwcRl0fvt+3PkNwIvI79+rmBQ4+mG/rZx/+CVGn8kjE6A==@nongnu.org
X-Gm-Message-State: AOJu0YzrqmT2Q/yQ3rOm0JWHCZGChXmzUiPViP14DHRyGqYbE5RWPnue
 BAlsdFDjREM4OjZjh4UwKh7Jojgfv2OKqMq1XPqtorA9rhWAxASaOq5SFUeXlfbuUZJIpRHS8UH
 V1A6P0qAYFB3/+zxptMQkjBsH4CCp0evGSfalSXsYVDeTWCyv9eN1j/I=
X-Gm-Gg: AfdE7ckpz/rr09qnCUoB8TuvheSxqoqxamk6bICvvFLMntdAicjC5DfAH1TxbwXVZLO
 Y3nnCtxy8MvhVc7RxSocZq2LzR55VZfn9s6lmLZD7l7roemKutMq4uUIfVdAhIQYJxETlVyDIDQ
 x7aM+M9q8bIx4yGOf9lTwCfeh7VR2k1jKWUuAjwmnFBxLklxowtmnjs+q9Acs/Jg6R5i0kKcJ3h
 T5Sw37dGvgBxJQGDZjfDubTbyLaN+8Ec+XSSPfH+2n3Fdpa4XnU1NrS+LKy6vt7OVSfpJaJtF8x
 nVMSGk8QYSZokXR4ycxsBtvOkOn9NcgTIGFOldCqL42usFFTSqKx73f9Dj9JCjeJLC5pjFj9v5V
 z9ci+bMjq4USdfGzWQ1TCaVUaRXgoI2QZRBWQiOlHccHfmpq6zut6pYyldzWzbCjArhGr
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id
 d75a77b69052e-51c8b398cf4mr98935781cf.14.1783615266258; 
 Thu, 09 Jul 2026 09:41:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id
 d75a77b69052e-51c8b398cf4mr98935361cf.14.1783615265853; 
 Thu, 09 Jul 2026 09:41:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm118786835e9.2.2026.07.09.09.41.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Jul 2026 09:41:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kane Chen <kane_chen@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/3] hw/arm/aspeed: Various Kconfig fixes
Date: Thu,  9 Jul 2026 18:40:59 +0200
Message-ID: <20260709164103.37614-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX4qbmsL5pZjB2
 mSgReBMsV3xKahWf40O4q7huZD/UJV95b9A2jcRC8BuYqOpssPnMAQ9hqhf7dimMeyABWsACtR/
 O7eNiKP9zWk/gVDuqYe8KQlmTv4zRbkks8gKw5/jVjI2h/8UEogWpe3AJ8ysdBuTLuBVSxb43tw
 HOF7jD7K5exFGcDLQhNMUuhdskPYPVNxw0/STvy3eWU93wJeOXPHmDiTMLXvEzmnMNo4affEYDF
 Qi7yntvIzbrp2R7Q5InLAtLibYsFGtJgfUK34noFdbF5zGOPW/cZg6fUFV7Lw/uMfOXS1pnGnRX
 Xep9vKdobALUFkhRulXM6H3vYFqjdsLJ57VNJjSV6fUGBtKHlE6952dnb25TXXHaZRTql7tKPTx
 7ZIzfH4dheePhKVR6xJ+xazn6Tqg4gFuUJ78l23kBC6P3e/RLb59m9dqjAXOy7dW660vYOuF2Qp
 pro/gj0GFQcg1aDH1Eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MyBTYWx0ZWRfX+4k/9u7G5QS7
 7hw3XICZ7FUgWdsYNouxX16fUjuMGyrzPRHhtbEtviKzWoAGVk/nIl0i5cknvLY7NENmRIAb5Me
 KEt+5aLTp61OLpUPgxipl/rW7OzC2+4=
X-Proofpoint-GUID: kC9jGHlFRb3U98zDFCcAOlhh5SUGvYXK
X-Proofpoint-ORIG-GUID: kC9jGHlFRb3U98zDFCcAOlhh5SUGvYXK
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fcf22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gbvC6g8y90-K_Dm3SbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090163
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Trivial fixes for binaries configured with:

  $ echo CONFIG_ASPEED_SOC=y > configs/devices/aarch64-softmmu/aspeed.mak
  $ ./configure --with-devices-aarch64=aspeed --without-default-devices

Philippe Mathieu-Daudé (3):
  hw/arm/aspeed: Add missing PCI_EXPRESS -> PCIE_PORT Kconfig dependency
  hw/arm/aspeed: Add missing Kconfig dependencies on required components
  hw/arm/aspeed: Add missing Kconfig dependencies on optional components

 hw/arm/Kconfig      | 6 +++++-
 hw/pci-host/Kconfig | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.53.0


