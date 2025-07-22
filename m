Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1115C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 20:14:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueJNS-0001n8-04; Tue, 22 Jul 2025 16:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueJNO-0001il-4y
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 16:14:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueJNK-0001tD-HW
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 16:14:13 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MGKOYk012550
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 20:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3TAy4bvkTkR
 BBhKd22HZRG7VTf0KUcpbt2SkLKVIFfA=; b=ar7FP3DL2u9r5OrI0K76u+KpLIK
 PlTfcvRRGRSoLAuUl923x5MRJkKHB8vfrxdobuRFQbxhj1SIiZ5x31jD2cw+yFhL
 yMnQLVtLIUemGxWPiJlYeDRgFYftuVr7UdiJWCRQmcpnyTwhS8mkXGABBvlvPgZA
 3+XeHDJfdbFReKP5PDKQa/3udoz3SvKJWE2wVUkOZdXgoaF5Rb6Dbx3AK9c+1rb9
 PgpkbJyH1BQijOSNdPuX+LkQTmPXomY0ed04HCTl5lJ+yVRnesdk/eBkOk2EdyrW
 zBSyOS5vLpInxApC24spp1b/2Za0optLWoQp13uIwBzFvhfkietfKxo+XNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6n177-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 20:14:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b31df10dfadso4047504a12.0
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 13:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753215248; x=1753820048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TAy4bvkTkRBBhKd22HZRG7VTf0KUcpbt2SkLKVIFfA=;
 b=HwVs9nUdrIEQJLdePnXpgTBlo9BVM0LaVDZALrrs3rbkDWdArzCYln+aAuYNoTfWVU
 Mx3DQcJf6TTPXKhcnh+UvQc0Qy5XQ2+5OQamyuX1MZEmWYg0uV7cGDREKvA/lO8o03BO
 XTbddZV3p8VWH5Q6eFBwt723LT+ny3FxS70AAYqVjkac+UGRFdD+rFq6WeM1Iq6xbWHz
 X32Actt1q6tD1Fg8y1bsiRCGetpfbu4qT+nWHg9RtElYptknDrmW8wo2lH5EaXmd9r99
 xk19yEVpMgmg6W3T3HdG2V0YXMPi3J1ET9E0yycCHJVHS3flEBX+uvfKTHXB/mx6V1N0
 2Rpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDPlMp5dxgZlT/ASgxR6Ldqxm3vsQR6DHSu6XJ+07JVki+hJtoGfzCdknKkRLExwrIymMPPah+Ng==@nongnu.org
X-Gm-Message-State: AOJu0Yzac+94XSaqwnKp8+8bYiMW/7xm2Xe5SlcBCeTL8d0xSiEAqFCd
 kjx4WTsI1E2r2O1aTlBpJgUVNY3cmCVWNkKT5ZEe77s2KxUZyx5Flx1AYBo4LfFcDjF+vyR15Ou
 GsD7vWmT26vNhFO51lH8fkyrXpVLwKcUe6e0bCIWIZ+P/yNuYumqFcws=
X-Gm-Gg: ASbGnctbiTGg8geDAzoo+y93aiKi1teGHOyceN5QdDrNYG4gCvHJfhybbgVfFvR0W+q
 yeSTGVu2gzw5fDDOnhaJ7WbLm/IQvJY5KujU28D+7FK2gps32Ift4ShkxC/TG4/Q3vj2ala1+gP
 8Mxiy3SlLEYsnPYc3tQ0RIJLm4CtlMc328ESEIQEMjRYbdgwWkhNh0Rtsa04Y74sD9cv9R+3GFd
 iD+ehzB41gdOKfrjQEHsRwiEgTMNk5pmq9IMEwJmRe2IDzGNwpaw1ODKHhsYaSXT3nU/dRpOttr
 H7AIvUjjtun78h9v5D0Rp6l/7Yg9o9W365QtfRmZjEjeoqB3n/1jbvlhUSaiK4GJ9wO3WND4+jV
 u2P5PcCBnnxa6DXE=
X-Received: by 2002:a17:903:b87:b0:235:f45f:ed2b with SMTP id
 d9443c01a7336-23f981619c9mr4146825ad.1.1753215248003; 
 Tue, 22 Jul 2025 13:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhgvBFqjglWRZ4YjWAwrRnOA+Bp1zqhdtqcB18cl6USAe8tf2ougFqjgVh66yTSdN+Eb9Cew==
X-Received: by 2002:a17:903:b87:b0:235:f45f:ed2b with SMTP id
 d9443c01a7336-23f981619c9mr4146545ad.1.1753215247614; 
 Tue, 22 Jul 2025 13:14:07 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a9esm81917075ad.93.2025.07.22.13.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 13:14:07 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v4 1/2] target/arm: Increase MAX_PACKET_LENGTH for SME ZA
 remote gdb debugging
Date: Tue, 22 Jul 2025 20:14:03 +0000
Message-Id: <20250722201404.2368507-2-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722201404.2368507-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250722201404.2368507-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687ff111 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IPAH5rSrwdKhQ0QJRd4A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: sc8a72qhyT4t12pysmSu-DSMDLvEbjZI
X-Proofpoint-GUID: sc8a72qhyT4t12pysmSu-DSMDLvEbjZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3NCBTYWx0ZWRfXyOnNvGNr8ESV
 icV5iXXhD/stfrmlec3hrwMgYOxLv6GCJSckENnUxYJURs5Y7nwcAXB74jv7/v/cqD5POHFw2tP
 EHia23ij9hEJLtk8jaGC3lRigXxsj2NjTbI5mdBU0BjbT1VOarIqbM41PW5qZbyk/KIsHxz48iu
 OaNLotfy36Iun3WY4ZKXwjSN3tBTv1I0OAWJgCdfODHnP4SzTc6vCwMFKxByeXwMEg8tejUrfSO
 rDPu43BtDsodHSwJuHhx8EU+TAKaScSLqHeh5KvNgfPM4DIQ/PGQpUZhQnq47Q2flgCZlBh6A/J
 FohQ94piNv+GfsNyaccNLBh0NRdqY4NvEzjqDdxTE307TCjjsICbOoiJoeD5EpsHrFYB03NnCV1
 P4MFr3nylDclW2j3x4yHr06j98hl+CwM/WWMyyVWtys0sU8sGO+F6grdbHRfEuK5KzRPJ8MN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=950 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220174
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

This patch increases the value of the MAX_PACKET_LEGNTH to
131100 from 4096 to allow the GDBState.line_buf to be large enough
to accommodate the full contents of the SME ZA storage when the
vector length is maximal. This is in preparation for a related
patch that allows SME register visibility through remote GDB
debugging.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v3:
- this patch was not present in version 3

 gdbstub/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index bf5a5c6302..b58a66c201 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -11,7 +11,7 @@
 
 #include "exec/cpu-common.h"
 
-#define MAX_PACKET_LENGTH 4096
+#define MAX_PACKET_LENGTH 131100
 
 /*
  * Shared structures and definitions
-- 
2.34.1


