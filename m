Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100BF606A320
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Nov 2026 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaVQSW1m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T78TMAWD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUB2M-0000oZ-7z; Thu, 19 Nov 2026 17:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUB2K-0000oB-KO
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:55:24 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUB2I-0006Q0-6T
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:55:24 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJJ1EHj373282
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=+OWBaK6wRxlY2ksFvNcJEy
 NqUaSB/hWBK4PpcQTxx1g=; b=PaVQSW1m8BhURItNLrR29c7wq3ia+/uoTUhoz8
 0aN6Ocp+jF99sjNdntTcTDMUi23+7MaImTPo179FjTEK/EsVA+MwPbXO7nb/Uxea
 uB5n9FZtn3knCxgXAh6QHLrtljudBimaBIHbxxkKbg/Dt83mIVzoi/FcByFE5EtS
 MOZbfVoTc15SLdoUS6lRJn3u0MsCLFKMCSv4ZM7xrSDgHTNOGJxKoOCWPHJUqFEI
 xXwDic2fiMLVxqf5XwlDt+XZx7oeMwjJYQgKuMjdMiaPqpBp9rYZmT7TX/agmVHT
 qSgII/xT0bPJ3C0NhzBHOVxaq7qBOAu3O5vofEgrTlqHS46Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymkfyu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:55:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so72377885a.2
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 14:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795128919; x=1795733719; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+OWBaK6wRxlY2ksFvNcJEyNqUaSB/hWBK4PpcQTxx1g=;
 b=T78TMAWDXOEZKIWZfXDTjMaO/RYP4E8VLt1TPcRJu2vvfT5fM9qUvDzmuZsiKuXTQF
 nIwaSqu1P0RVhvM46t48Zkkk1fnDvFjl9FA9M8ICc7HXuS1LUGxu4Botxdm3dEt3SOIW
 E/5FVM+Mq740gu9z32VywVPxKdR84eXQtn9a2zIgSsCs1hMmwlxOkpcvFppgP9elcNrJ
 I2WfF9i0PJ58Vrr6ojmmFtu0aAyshm6R0WCYrgSXjAFuu8HmFqd4uCudogp2AXkXrnpc
 qUQdwK29b05znZ2b84IxOBNk9jSlXGCQOVxtj71au8o+bkFnwSvaRVCAvGh/NBnmHjyJ
 5bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795128919; x=1795733719;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+OWBaK6wRxlY2ksFvNcJEyNqUaSB/hWBK4PpcQTxx1g=;
 b=Lxie2kpnVhgINUqHwMLy/SxF3UsyxcwJa/3fmKrgv4l33oT+oQ83pYgSIlO5BSNLz4
 o6hKt/zB96ZkrCCi+gtX5VcILu85sQAQgN+jg9z38WQlWER/EUB7Ulj7WqWYYC8Ci3Fe
 UW0flUXdpIKrYzC6PnN7deS1AD9Oqj2cpCWN67XGh4vT7JlClV0CvJr2XeNicuMVA0mI
 1iMBmBTxD+MgLI6AiM0rWprifPRK/P5W+1Lxz1WDrRzjaCJUyc9jZy72/MnaSVH/mjmS
 D2lkjwfUOxO9vYssoxYvWQX1eGvfrM+M3XYmHiJAp4kDL/JddseOqNn0g3Syz698nIYz
 Ktkg==
X-Forwarded-Encrypted: i=1;
 AL+hErHO8B4wW6+M0azFFChzIBrhTFpYp54wiiYpYuEfN47Eq7MbIwvu84Dmsd54iCErd0AlQIIDhKxqng==@nongnu.org
X-Gm-Message-State: APuU4Z+Rf3/ngDTtNEOvbX+wVz5wGItdZBxW1LNLhYqPt0SoCPetidRu
 cis7jQGTiOnwA8Zf812YJOiKrxAFCiObkvtdCcM2gINwHoEqHYWd2DQCJFKfgRwk2/EewNkkxrX
 tUgRPYWoMpzg9B+NG5N9v6nx4wqAaNpX+oqsjIK+FLLZ+pez6LgtEgJ8=
X-Gm-Gg: AYBFou0HI/Nhw+5SDjogDBZ5lAh4ukcUdDBYi/tE87vZnOXA/22uoKfPxo9NoAxHLD9
 q5EgC4Hx/tke6E8t8BtODNW0B+Y0wrbczGpd83w5ED0/EzGbXDNFDS50ioU51bTyqMh3sW424xw
 sPGNbessd4qaX9Z++97grnpPrEk0ui7BfNmaV4L7jc46uvMpEUa5uNdE805++JhZTTPzBo+1Rh5
 jSiZ+c4adWrDqHAuY+jq0aWaVMAanJ2Z6JgEzWVGiqpfSMOwDLQqlY9A9CwCQ21REaKiQqPoDDc
 Kp2OHoEo4ykV6EAGZcXVfg8dDpOEqV4RkVHON93uAPAWaGovWEQPh0z5jo9LPgGMe5ilH2Aqeou
 MdGqB8MqruAtMXxIAkfEaPbqoyZDSp7pGSXaVRF+hcQRxZV/oim0Q2SqFyMI9cbLsfdPc+szXAZ
 Z0b67zr9Vj6T/Olw==
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id
 af79cd13be357-949ba95dfc3mr191354485a.22.1795128918891; 
 Thu, 19 Nov 2026 14:55:18 -0800 (PST)
X-Received: by 2002:a05:620a:8396:b0:944:192:85ef with SMTP id
 af79cd13be357-949ba95dfc3mr191351085a.22.1795128918456; 
 Thu, 19 Nov 2026 14:55:18 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fec7sm1916130f8f.26.2026.11.19.14.55.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Nov 2026 14:55:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ashish Anand <ashish.a6@samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/4] accel/tcg: Yield round-robin execution when another
 vCPU wakes
Date: Thu, 19 Nov 2026 23:55:10 +0100
Message-ID: <20261119225514.4080-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5MiBTYWx0ZWRfX4JzumN2r8ubp
 XYnGWyEUKt2g4YuWA+wqeZwB+BMJjJQ4Nzep/paTZ0mSYu5K+TWV3XfTgZ9XhFMUkolqkY9YkYi
 Vsnt3Zn1XGkwRBHyjGjdFjiHPWyfrw0=
X-Proofpoint-GUID: 8HJRnV6rIC7nmMoT5nR7qAHVBfcJ0hfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5MiBTYWx0ZWRfX/NPiErPNFkBx
 eTA4EWDQrjDKqmbbT3ySI9rHDZwJ3EpuJ8dHkgXnSgT/w2RAc5ANMVUQQjeY5wLwvJStGSzwuxT
 dTjx9yz2V2u/+tdLmtmk436F7NFfv4m0ErjbuzMfvWR5DPtC5T7CnChe70d1xM3ftrNsOsWRKyH
 wuw9J3YH+HkP+t+wEbCGBiVoiUt3hhN9+6rc9NuRmE7YuAdD8ukaUjqjM+IV63tvt8yxiIHbf7Z
 56gN0gqhT+TdXk8eC8YI3SKRMASb9VYkvLvNtB4hTltuQxazV8JyMONtdvlKgblZkTXhp7yr2d/
 28s8ANMgmdbYMm60wz/Knkj5r4bFGoaISZqEucsCRe4eHDZWqIqPH4Qu24KXtFS6YhsKgHpWtEz
 NFRqXGfx8YcywxiRuJAAv9wtkYLn5aZbZDbqqzn8u1RXdzh10IJZnbybUNSIXzjAvYsPkFKpyCE
 abjE7k/1D8oHDvmfR9Q==
X-Proofpoint-ORIG-GUID: 8HJRnV6rIC7nmMoT5nR7qAHVBfcJ0hfy
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6aff7e58 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bx8ltnTHI9QTFQl5oWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190092
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

v2:
- revert c5ec1bfad103 (Peter)
- cover icount_handle_interrupt (Alex)

Philippe Mathieu-Daudé (4):
  accel/tcg: Yield round-robin execution when another vCPU wakes
  accel/tcg: Check current CPU in icount interrupt handler
  Revert "target/arm: don't pass env to the sev helper"
  target/arm: Kick other vCPUs on SEV under TCG round-robin

 target/arm/tcg/helper-defs.h     | 2 +-
 accel/tcg/tcg-accel-ops-icount.c | 2 +-
 accel/tcg/tcg-accel-ops.c        | 3 +++
 cpu-common.c                     | 3 +++
 target/arm/tcg/op_helper.c       | 6 +++---
 target/arm/tcg/translate-a64.c   | 2 +-
 target/arm/tcg/translate.c       | 2 +-
 7 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.55.0


