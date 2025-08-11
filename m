Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62F5CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 19:38:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulYKr-0007Fo-KZ; Mon, 11 Aug 2025 15:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKj-0007E0-2X
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKQ-0003qK-FB
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:24 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BBVOYc005641
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=jV4BqCQ7axPxM9PQmtQ6+XFZCzvC2QnQ974
 UJb/pmeY=; b=VR/7EjrxIL0d0sH6pXkoHEwLVj1CCfI/4eLnTFYooDH3DFmuPQg
 LUPmyuzLuhXJN+pTcbuHZwnZCu1vgkxciGu5iRWXV13M2xyNx0k0T/caU3ZJ2Hcn
 98HDN30yzudvOc7wZMXmI29QxHmVX2L+0vrSXpdF5jHDE/NqetkcBNjBu3o8mcuw
 JGPXaSfG48300WLZYhln3Gwk6L9q2Hsh5RHyzTv/VNir7uHZnmPiW8xLuUAVQjul
 OukbC5jUZSw7Ie0t+K+Gc67F1YEFfsnOR3ERZRu496a6Swl48Yz4QseUXbeRZVlx
 weojy5r7MNMRTIQnxGgKcTGNlX6tK/AtA6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6hetr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:36:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76c2ef87618so9232058b3a.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 12:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754941017; x=1755545817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jV4BqCQ7axPxM9PQmtQ6+XFZCzvC2QnQ974UJb/pmeY=;
 b=EQVrDYZZOXJ5GYTrh1MWsamduv2Bdw8KMQbh3Cf7S+lP6oGyjejLrAJ0O5OkGF89Ys
 h7AWIyUuI0Xp+L+zqV4HeGNOL9iuEt9L4sVxPwOcrzzyq8vuIVeKrZoc6/QC/GUB95d2
 j9ueZPOUQW5PwyccyJRP+Q22+DU1Z4PTX3hTFgJM/3Vl8YICMT1vsL5WoD/hBlcXgbqy
 k4YkwxitOtGWabqyCwEJCxoE0ZCjlLqqJ1vqS/ThR3ZPToqmcl38eyGIcmw/a/+Sdco6
 FASKgkvy8Q64Sw0x5R98z++MpJZqEUktizoWyETweEGsP6a/44huao2SK6Zy54tf8/LC
 rOvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEUpgxeoSc+3tbTDni5kQD4ORnvq+NwbcoNJz1kKHLnFlNESEESRmx+0p8d12UIscJGVV7SshX6A==@nongnu.org
X-Gm-Message-State: AOJu0YzzdSlukHhygn+l6qrTxk00CL139Onj1w2hbhbYo1z1SezsiEtj
 GlyFV5HLCz6XsDURoXF3AH/8iFnh7fuowQww9LnHa3oJX394IWq6wOOFrm0vMN64sjZeGNgfYsi
 tUKNIpPpvCrGnnf6R89dUONSPuGkMebovyKDWK4nCKw5gMAGJFhDh/uE=
X-Gm-Gg: ASbGnctFUVeRg6XkNYqGpnIjKOazESj2r8o0VLW8hLxIEh5n6KJMHltkWHp2FU8/t9+
 pbCZta0BjWiX5eF++rbxMO796p2EhALnMZgT7bxIWDa7h5gVivCkHFpoW/hlann2Gy06O3a3cvO
 hJjfbugpsc/R4u4F7qPgq/04qipn65FzTUheBtDDRq3ineI1LN02JrDVyOlm97UJk22zJNz14K1
 /hTBjZ6Ulk6WNYwoSjyTkpR889UT4AJ0G6AONTMcCrTTvo85jIrns4mufGnFuLLcApPe4A10hZp
 N/ALd31V66FKm1LlqVndVlANs5MXmmYTIYlPtz+Sh65uhqLT/CZGP58MrShKw4hd0qbw2XelI5h
 nBYRBh8/Dqfs0FPY=
X-Received: by 2002:a05:6a20:7352:b0:240:2234:6835 with SMTP id
 adf61e73a8af0-2409a93f02amr936982637.27.1754941017166; 
 Mon, 11 Aug 2025 12:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/uEetUZkcvNCUymebqCVTA5QqeYuof4YKQ3DNb7d9uHBfZcQqoilbkx83g57dKhVhlxvWQg==
X-Received: by 2002:a05:6a20:7352:b0:240:2234:6835 with SMTP id
 adf61e73a8af0-2409a93f02amr936948637.27.1754941016711; 
 Mon, 11 Aug 2025 12:36:56 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbcef6sm27677171b3a.85.2025.08.11.12.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 12:36:56 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v5 0/4] target/arm: Added support for SME register exposure to
 GDB
Date: Mon, 11 Aug 2025 19:36:50 +0000
Message-Id: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX2LfPe7unrbxN
 c1hBJZ/s7NPA7nzfNL27tn1lt5v6S48G2oauQcvgxqzvuqJtZBrl+CdTMxxc2diJYqgyR1mjtiN
 54v/N8wO1GSl0Qv+uIwbbxtEZZrlg3qqt9+q8GirxdaBQvetkbo70ht9gGI+FDyuksYB/+k49Dg
 dsSq5laVGlrrfi7h+XPiy/RM37qErmzgOl6lSkL1q4qJJfQknZrEs00cOHjVnOQAnWGv4DhQib5
 Hah7fUYR2IeAGtZI0+GC6rNXmIwzDWxvhl9WtMgbj+tkO0V3T32GEmmYTWci10/FMizG/6k4Hc6
 +CtoT7Y3l+rEpfztjZW5GVobY4IGENK/NlRC/6e2etkAVVgtYtHGe3FsXLjS0uXpxzndwI95WpX
 TlB3lEaN
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689a465a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=biMZx1JPJxggwWgAjZQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: eRvf20h56r33TtX7hQsP6W_IINE3o2FJ
X-Proofpoint-ORIG-GUID: eRvf20h56r33TtX7hQsP6W_IINE3o2FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The QEMU GDB stub does not expose the ZA storage SME register to GDB via
the remote serial protocol, which can be a useful functionality to debug SME
code. To provide this functionality in Aarch64 target, this patch registers the
SME register set with the GDB stub. To do so, this patch implements the
aarch64_gdb_get_sme_reg() and aarch64_gdb_set_sme_reg() functions to
specify how to get and set the SME registers, and the
arm_gen_dynamic_smereg_feature() function to generate the target
description in XML format to indicate the target architecture supports SME.
Finally, this patch includes a dyn_smereg_feature structure to hold this
GDB XML description of the SME registers for each CPU.

Additionally, this patch series increases the value of MAX_PACKET_LENGTH
to allow for remote GDB debugging of the ZA register when the vector
length is maximal. Furthermore, based on suggestions from v4 review, this
patch also changes GDBState's line_buf to a dynamically re-sizeable GString.

This patch now also includes a test case for testing SME register exposure
to GDB, based off of the existing SVE test case for the gdbstub.

Vacha Bhavsar (4):
  target/arm: Increase MAX_PACKET_LENGTH for SME ZA remote gdb debugging
  target/arm: Change GDBState's line_buf to a GString
  target/arm: Added support for SME register exposure to GDB
  target/arm: Added test case for SME register exposure to GDB

 configure                             |   6 ++
 gdbstub/gdbstub.c                     |  25 +++---
 gdbstub/internals.h                   |  25 +++++-
 target/arm/cpu.h                      |   1 +
 target/arm/gdbstub.c                  |   6 ++
 target/arm/gdbstub64.c                | 122 ++++++++++++++++++++++++++
 target/arm/internals.h                |   3 +
 tests/tcg/aarch64/Makefile.target     |  23 ++++-
 tests/tcg/aarch64/gdbstub/test-sme.py | 119 +++++++++++++++++++++++++
 9 files changed, 314 insertions(+), 16 deletions(-)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme.py

-- 
2.34.1


