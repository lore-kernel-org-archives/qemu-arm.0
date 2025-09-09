Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE2CAC583
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 16:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uw0vu-0007Ru-NN; Tue, 09 Sep 2025 12:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uw0vQ-0007No-68
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 12:10:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uw0vH-0001e2-4O
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 12:10:31 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lnxb030101
 for <qemu-arm@nongnu.org>; Tue, 9 Sep 2025 16:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=3EI9SOU6kdd6tgzMd/gX2Y
 zpwNShR+7fPBOkmdAZVfw=; b=GXPSDd5InsJNVjtBB+u7YHMxxj/AM84JxLK3Jw
 gKls3Rv26QqU6O7cvWvq0qKiKZZWwoTAz+Kvhi1Zk/UGQUCRf0RmcWwcO9AQh2X/
 mJFoTu3sii7aHH1+Od+Fv+bfekFwkSc726I0WCroQB/HvlPmlFcPI3qC5itAvzNk
 QlaLH5jWQaBSWxc4BRyD/Ldj8GRcBUFNmuWYb7KhDlCJ5jcvTHZSYgdFSoTWoVdr
 Wn1CMGuEd5eIsODNjKA5J8xnEWZb9wt83HFRMi/M9XF/TmWKRMHuM0Rpq461KjpD
 I/0dEqGxS2L3MbjX+cBTHhtu5bZVZm9SJOjCjEHLqfn3T+DQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8gus0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 16:10:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b47174bdce2so4505878a12.2
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 09:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757434215; x=1758039015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3EI9SOU6kdd6tgzMd/gX2YzpwNShR+7fPBOkmdAZVfw=;
 b=fakh/UrfWXtpaiax2aPKqIOEBKfpNMmzX5Pw5JlyFPF4Khmq4idQpshQQnapKKDyZ/
 bjI0FbXGEadBSUOUvCDTrs+vPf1vsd7lrS/bgNUuOmCVVSifWbnoOkci6wZ3WJXVDhBY
 HPSqI7UsQgcE3mEvewV7LRFCv0SzoM4i2RRq1FoCnnPjwLtLVVqvmYuhI3N8h0Oe8i2O
 p01m9cAj+3IJlfgPY7pN8y3FvzmAZf14AqsTTfMxfiL3WNsejuS1vsDqan2AC78Rf7Um
 Gq9g8JExm0ZutsdMuoKFPe8ycPV3egsxK2NrDNc6DKal5AvCvLXGu4oGrCSyJCdpaxPe
 Qy6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+WKoJ1+6kFtVLAqPHHpeV7Gpul/QFahaHtFsqKOr+hPsY/9lLC/fZldhf8mhUTT1iYYKIEfubOQ==@nongnu.org
X-Gm-Message-State: AOJu0YxRcZiIQxswOYxUBhFPzKdg/hNncPCL1bJHHA96gxRZ1V94DNF6
 bpurINxdrIdQ0JYUuijfDZgs62tJtUSZv0OrhQ2utlvYU6YCmqTeDhmBdV2dBbzkPJZB5IuTSNk
 cMXGBXeoYl6jICRxWYLYA2+lcGVkjJm56SsbdWY+JxTcXjYF/QEDy2dY=
X-Gm-Gg: ASbGncsimY+ggOZDTXsSbwuhPXGKW5hHzqqJCNyEPkU12zjXSMQ1rpq2TKJah5pd3ty
 t4fM+mF9QBnymw5zkfCpfW5bEjjd4mxEmgj/pw/IAW5EN864B0DSfdvvfntSQy08pbX2q9OTIfJ
 SeGrk1bo9L1MlkGTsTkLkzrajRTLlwIXbugh+G5IDViAbFpBpJvzhk0T0FOzhal/H7u8rPjKfHX
 o8eIuyX2KWvOWx6yUB1mUNxoVBNRLxuqNJ9oTyPdjHATscz3gMNNYkGmfGJsrftWW/j8aqTVit4
 nX60tQ6BqyDz8m6SGYZEoDDZbyBWpyQcV6VXYOqpiALRFdb0WO79W8tEQY3Jzi6EIL3UJDDGFTw
 eauZqTh6rqw5gCoM=
X-Received: by 2002:a17:903:2442:b0:24c:b54e:bf0a with SMTP id
 d9443c01a7336-25166792637mr139882615ad.0.1757434214831; 
 Tue, 09 Sep 2025 09:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUcPXfSFxRIj+Ups1onwS1KkfdAzEO8tvtlKiq/bRddItl0Hp2vi8x/lQZu3Q+UzH9Bv6TKA==
X-Received: by 2002:a17:903:2442:b0:24c:b54e:bf0a with SMTP id
 d9443c01a7336-25166792637mr139882235ad.0.1757434214345; 
 Tue, 09 Sep 2025 09:10:14 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a2a43a9bcsm1794975ad.89.2025.09.09.09.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:10:14 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v8 0/3] target/arm: Added support for SME register exposure to
 GDB
Date: Tue,  9 Sep 2025 16:10:09 +0000
Message-Id: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXykpR34lJTcKC
 YjW9tM37zxSYjX/hnFlXk0Mz2+dKXVfAJEaKRWcKOkVm3ELhPG7M7adlWwFBvENRwbtkrc7hbpX
 XaK1+MH7r1M0XQcaqq+04CTaax4J1hrq9drOo7x7t3Y/LGwsZqTOMN4C99f3J5Qh1PU43jSTLtr
 NfYaxWLm63SCxECXg2vmqIfX+cXPRykt4VkOzvlSSYC+PdFGJ0afo0D0UkPIV3gy7DO3UV+/37J
 BwAztS+un9Akj7VmdM/ky/RcgN/NG5mK3jVdn50My/Sx8BZ1nDWMZnDJktGdl4Nz046riMxxI2f
 jbjjAULmPetrNqn7HPdrdKyK+oToJB9QSoYY7i3q2U/rH+E7UqCv97MIHflqmwmNSg0l+tEsyLY
 FuUaXfQv
X-Proofpoint-ORIG-GUID: Alaor4vI-13d3cEsI18WO0JzixSAuvQP
X-Proofpoint-GUID: Alaor4vI-13d3cEsI18WO0JzixSAuvQP
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c0516b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q-dapHUw0VXFM7UNezAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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


