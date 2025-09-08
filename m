Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3D8CA1016
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 18:31:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvgc5-00081V-1m; Mon, 08 Sep 2025 14:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uvgbo-0007yx-QN
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 14:29:01 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uvgbb-0001An-TU
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 14:28:55 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588BDn0r013595
 for <qemu-arm@nongnu.org>; Mon, 8 Sep 2025 18:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3EI9SOU6kdd6tgzMd/gX2Y
 zpwNShR+7fPBOkmdAZVfw=; b=Pdj5IbHNLhX9MpvJ/EWnucvI/gz3sSnjIyujHY
 p2P8NM/JDMQ4yzV1nxpzzHu8lNlBCLkBTmBUs/zMGxn1iD+pesGkelDvBuiEEmSV
 ZZs29as9n2PZj/NOVHyOslKabcQxRHFHRoJqU/jS70ZL5m00TPtCrRfKg10G4YDJ
 wvde43c8G1Zm9bUg1Hn0Af3DOcwkZrrzdXaJwDpgcrTK6TV+kgc2BXfhwGBfIgpl
 7nNWCTAIXSC76rLgD0juNgay9nUKUjQ3ER0IRLKKt40LuXUXTQ6ieXCJAK1KmgY7
 R1wDuJm2Q626ta3LOZH+G0Hy669+wvthNYTaVcuEI05hKUiA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdte47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 18:28:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e6e71f7c6so4750529b3a.0
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 11:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757356116; x=1757960916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3EI9SOU6kdd6tgzMd/gX2YzpwNShR+7fPBOkmdAZVfw=;
 b=tkX9iyL+rSRTk2VDiAld6oINmA6a46JuUiY1Wr6/4CM0T5XLbdqThRspdEcM36txeQ
 h/XKV/2s+P+b5VscudJbGXV50qET0xxCNTSy2mpECpxQ3UGVNOJC9Yw4SsscOXeNghlk
 eiO0CRNkwiM8haoZmO7COYRfNrKpVT8Lm59lsynjIf7fNZnCje88HVT0QzELEyE73uxg
 Z+m7UgePRRTuxhCjWOFECALCoDiBvvdf+uk6TAxUL634TgoOrPNDSJkL+2BGTrw40V09
 Qp/OekCNGGgEHquQmcgbZOtMfB0NDE8fa+VNtSH2Wdz6mZ41R3y4sYyd3iDEZikhTZJz
 xwUQ==
X-Gm-Message-State: AOJu0YyalfyQKPfQLhU8T+t9jJh8YXLctA4ufX76AJZE+7cEL8EGCVUB
 WncVyR0Xc0V6WCknN69wNelapwm9AH5ekRANiZgd4Zu6uC1G/oJvCvnSsDhvZInFaVguxR75uzd
 CZrEFKOrEdS/f/Hkc1TvImxAlFBpdFUr6CfLqU941R1qr+IxSQBP0YOY=
X-Gm-Gg: ASbGnctkF+vN0AEBbeGdi770LCyYCMKH//MaFtV5tew65CvVBssU1trZyYuCiXdc9sN
 Ec4D24o9g0HCI4V2H5dRE1Z750CaJHrchb9Yv6+kO7VZYctJ5VS8E885qEbFgdfZ4fjlyEyTFeC
 8oaxru8MRWFmWzCNmjUFXhV4t42yMSdPJLLgAcbty6N6PiAPjRsZs7Nga0qd1eHrQfXjGE8u0Pq
 /QESIKznW9DD2mSCdI4SjJwj7lia7x1ktotEgtCQCP2QAfOeONi2E49CwZl5CtvPs9rVO9cBSQf
 0G4qFDWkAchk3DH3R0qEcdXJym+U8O+TyM2vguHhXZg772rpHY1NelFiG9eY6ZkMYQql5EewQzc
 fIeCf4I7KcMIxbUg=
X-Received: by 2002:a05:6a21:6d8a:b0:250:f80d:b34b with SMTP id
 adf61e73a8af0-25335a8eee5mr13716406637.0.1757356116324; 
 Mon, 08 Sep 2025 11:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfO6hEYX1Ke3SCk0TYEZjbxRKZ5qDRbfqV5CHIQoiQ0X8RDepVKeuD8ZWA14cVeWjbq1MxKQ==
X-Received: by 2002:a05:6a21:6d8a:b0:250:f80d:b34b with SMTP id
 adf61e73a8af0-25335a8eee5mr13716362637.0.1757356115863; 
 Mon, 08 Sep 2025 11:28:35 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4f9c35f391sm15480164a12.25.2025.09.08.11.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 11:28:35 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v7 0/3] target/arm: Added support for SME register exposure to
 GDB
Date: Mon,  8 Sep 2025 18:28:31 +0000
Message-Id: <20250908182834.2476277-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZL07YsiFNdfr8ghFOz7_RXiVbEoUtCvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXylVKxbAUuMhH
 7aUE85YRKdCWypRoK4DvkYmcPUCcS/37zXNRdyUkQAWP1CKrDnN0+db8tQgC2la2f/iDTCrMRK8
 DQS6l/f9NNvmIpJl+ZOo1txogVLB9GPwp7tud9cRiI+a5ZHN/UAZ/HdHZ8SF6a7MWqAz3fE+1zU
 PBZTNWpuIpU5vqjS0hv0dwjIfIvX/X3TFyHQa++EmlFdSQJ/KqpzrLV7hjPiaOBxOLyZprU+UJ0
 zqxjOlLPs3G/W5+oBJw5XlHAN3xxPIOgG9Hc+/0Qj/D87xapFP9diIzOnOQdyB1aBttqZfKva5W
 kioS+Eht4nbBLbxVOK2Va6SeeIfXrLYyEhvNgP56QrcFsve5+b88CedMf40Q8/GyOnJtItW3Gu5
 S0D+XF/p
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf2055 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q-dapHUw0VXFM7UNezAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ZL07YsiFNdfr8ghFOz7_RXiVbEoUtCvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
length is maximal.

We have chosen to drop the patch related to changing GDBState's line_buf
to a dynamically re-sizeable GString for the time being.

This patch also includes a test case for testing SME register exposure
to GDB, based off of the existing SVE test case for the gdbstub.

Vacha Bhavsar (3):
  target/arm: Increase MAX_PACKET_LENGTH for SME ZA remote gdb debugging
  target/arm: Added support for SME register exposure to GDB
  target/arm: Added test case for SME register exposure to GDB

-- 
2.34.1


