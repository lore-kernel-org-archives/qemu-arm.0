Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C67C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 13:56:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh6Hl-0003cP-3c; Tue, 07 Jul 2026 09:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Hj-0003bm-VG
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Hi-000082-G2
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:27 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8VCL3741874
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 13:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qJrctU8DFjI8gyRChYhTKt
 AezuSpDY0ofKfq9R/Ymb0=; b=Bqg83lwCTxtD7fJ/S3oDdw1YlBJlOquJAOmYTz
 hSixdahffeXCyNSmmblYjX2srS/qJwPqe02sVu673xfvHR9oSvFb6p4BQtB1lJ02
 1xVIC3ofUbPOa+Gtuw1FwFuvTYmyzBCUz++MQ65FvmKrqgiIIh9Lg/EspIHw76N8
 lIoSf2CTrses70h/8vh8OUuZKvv5b5rK2dDtoetb9OeO7ZIOeLR285JYhlL0w2x/
 mYihtK4nwusJZNscMS6uuatJmiKDtVfOyQuQpLfsSTCoBHc91O01OtlFVHytdSpu
 Ne5Y96EwnejExMP/3i/sU7sRAYEyI1hjusgjGu642J69DcJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0gv2h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 13:56:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bff5c7035so85659531cf.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783432583; x=1784037383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qJrctU8DFjI8gyRChYhTKtAezuSpDY0ofKfq9R/Ymb0=;
 b=HbzZfn8vUeJgeiFmqFGrPfz2gUfK/ksXSFsm9uB5g9asv8Q/qIY6OJBzntjeXzwRCI
 L4rZqpuj+fTrlStPl908i8R9uhwyE5VEYRhRXPR9OeFwEIrB7n8++SkwfnRvIxbFtq+m
 EWk7Vx7Mk5fJOZXbC9e8TSerJEiEnG24Q5u0NiAptdMOP6+t3aMnjh7WfGm8yI9xXOBr
 glM/XvLesg4KG2uDjmhXkEPvbNCciav7AMHMbpIKH8Nnn0u/vCC0CFOBzdwlfHA6l496
 b4ByPnwwXoZKwWt4yY2H9oFOKlm2VRK+28wiaLVM6Lz3sSNNqXwX7IrDgGRBKX106v6V
 twQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783432583; x=1784037383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJrctU8DFjI8gyRChYhTKtAezuSpDY0ofKfq9R/Ymb0=;
 b=AL4k4M2sgIzHDH/XSzBvQKACSqJJDKAXgrZl0hAETB7syC27c1ZkM2CJErK5oYj23H
 z50BPh5ROwKXCOG8qo6a4caFQg0jvt4iKNk7RYxco3ccxRhApH76WWzrcwVyBHOcrn5B
 BVgeAIMmg4MUl8L32md6BT+0iCVawGaEugfl4eQhpJzZBYgytQ9vFDfFkXN//iuvoB/l
 9iPMc6RgmH7FTEoR+v1NrJw3SOcjbvztOcKfmkFzP9u+6PWgajeyb82sM0oW7FHYFvUr
 4XJwSWaPBwUylygeCNYj3K2goy1YJjfE8lOjxzrnRCKq010N7CN6S2+42ykM44Fol4SP
 OrVw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro8itlYxtAa6p0njsl0nHymsM3SNyG/DXjJJA+uvKjnygv0ZAprxegAGhSrJqURavmB6QTjiS0Bew==@nongnu.org
X-Gm-Message-State: AOJu0Yw2H76JxQiPdCMZQKrz3gpnaSv/oW0i/bkBSNttKHAeIjEudbbs
 o2i1oOQlVJh0CzSoqj/ab7Dp/IPnDxNZ+RJ7/2280QpO3zrnJhTEt77o6Llja1uRws0SdodFwfM
 Dt/YTCe17jZNB/BJnVkQ8pznfiruhV7KNubi5NN4ydhHIC2xcl915YPA=
X-Gm-Gg: AfdE7cnJRMLl+iHHnllpzcX/mVZW26iYOICRIdWWauMwKW1grkoxFWg/NfqOz6ZkLIU
 B1hyp5uk6BE2JWKRRNtlAsgHvwoETWlncb/ufqxdViPx7iWA4tsD32EWSOUirbZt1R/zYQ7U4HU
 H4Rt3bHDVbGXzQo+upUmhOBSuBoi+wcTbxB5WhnwEIvLs5bzET9SzilhpIdM7Uxu5GtCkyt04ol
 TtzpUNvcfGc1fULriifxoVI5btfu02tlQT60GELn0iz0ooBTiAqZTzZj0CHD4eXBsTUPpWUPuzd
 +8wia9rS+m68ply53J9Kf61PFYOrJq8dQvINTWwdlmLmd7evfKd55fhEkwPeKnuQixPGALPVUfM
 /cctYBSfAza+6EPyL7K0t4oDctOWJo3MZGAWzxRxOxuc/2gtEG8PExq990LfLDv5yfOuy
X-Received: by 2002:ac8:6107:0:b0:51c:1811:6eae with SMTP id
 d75a77b69052e-51c748790ffmr54534761cf.47.1783432581905; 
 Tue, 07 Jul 2026 06:56:21 -0700 (PDT)
X-Received: by 2002:ac8:6107:0:b0:51c:1811:6eae with SMTP id
 d75a77b69052e-51c748790ffmr54534431cf.47.1783432581424; 
 Tue, 07 Jul 2026 06:56:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960634sm35510933f8f.26.2026.07.07.06.56.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jul 2026 06:56:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/4] buildsys: Few WHPX improvements
Date: Tue,  7 Jul 2026 15:56:14 +0200
Message-ID: <20260707135618.53561-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2drUybF7Wtlx-DcKaT54zxHsKifg68Wv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX3zNZuzq086RH
 MnLY4Xk0ho3UCNYJqbcDu9BvD3ZNBaUTmagFsmj/KNFrxLbG90nvuyVZWs9giCWbhy6ECd4+8Te
 6aJ0SHeDhF9zATPXw5D7htkndlvUjr8=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d0588 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=FPyRuVExgD2tslUSo8AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2drUybF7Wtlx-DcKaT54zxHsKifg68Wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX1XT2QHwKh+Eq
 oFk3dbzYgIu5H4jBWoRK5oEj+aL4thby5F1zEeVBoMiq1xdPnAlDiOx21f3734gjyCiB835qM36
 pyOIJMiJs5PGM5acv/iOEwzqiJkEbbpZtmEr8OJAw0YC4Zp9dJyYGrMqMe6iz15/0HamdDLNLcn
 ikqJ1pc1V4lqyYXd68SKjfr93gqAZ1HWeYZkDF6RSEsIf7qVUmQZ0eoy0IFrU38k8+jxSTjb40U
 OGlyZjXcc6GrV4mrRigiToMwvHHYNXUYOG4tiJ/S4KvkswMZ4/z4KSn5NZqt5AS04KFr3f+PxIL
 5iVy6eYwz4QHUpNXGL5/QCWsT4XdckLGztyYoTmAS0jlSRPzZjnRNm5LxV/TJcN+zIUSt6sK/fz
 nCPvuAdAd2ItoPUoN6L8Q8232clhQGsqdKK43LMFnRdTCyUo+5Nb6ufAEQHElo8y3/GeikbfhbU
 XK8oPjUDVrur/abO6Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070136
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Few issues noticed when starting to develop on WHPX:

- WHPX not automatically selected as accelerator
- ARM Virt machine not selected by default
- mkvenv.py failing
- PYTHONPATH broken due to invalid PATH separator

Philippe Mathieu-Daudé (4):
  system: Select WHPX by default when no other accelerator is available
  hw/arm: Allow using Virt on a WHPX-only binary
  meson: Simplify calling mkvenv.py
  meson: Do not assume PATH separator is ':'

 configure                    | 1 -
 system/vl.c                  | 3 +++
 hw/arm/Kconfig               | 2 +-
 pyvenv/meson.build           | 7 +++----
 tests/functional/meson.build | 6 ++----
 5 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.53.0


