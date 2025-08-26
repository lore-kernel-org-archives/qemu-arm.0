Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0852CA0FF2
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 18:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqyfg-0004x8-7X; Tue, 26 Aug 2025 14:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uqyfb-0004ur-GS
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 14:45:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uqyfS-0008Sc-55
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 14:45:21 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFsx3A018228
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hYcRMIyLWQv
 lXfcTsmqq0jOfVzmmK99eaBq5EKBXMsg=; b=ehMRCi7RYVh3YVFF+1mDh0NYDcj
 0rRCElaeWfwMGSVWzCDZ7vkof7hJe9tE3iTIi7hnPlIob3CcFYCU7Z6kW4+vApN/
 FxILcxNJwpEocUZmia8UjK9kOhkG1LKHIUf9kg2Dx/ez1tGeVTHV4lU7aLE60EIL
 KEPGT+Ir9BUXn8WeuJFw36ZsmNipPYcUQnxIEQ42hOXq+qmUMWmXsZDn8f14XKmP
 GErFi8MQx/U9FHdPZ1fWfNoXI74RpvHWKfLgcBHZiOxX3lSxDKccs6v0vQ0LVTNs
 xvKOs7Z7v2spsjcReU4Nh0deYVFy1T/PTPvWaZIXc/Dd+HIIz4hrT89Ql0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5hvh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:45:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3274f7e6c1fso785062a91.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 11:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756233909; x=1756838709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYcRMIyLWQvlXfcTsmqq0jOfVzmmK99eaBq5EKBXMsg=;
 b=pR9rjo3B3yytm/DwKMeDmfevADOA9/z/OyB3k48+LjHUy1c2wjYeTeVca1wwNeIfgg
 cSym78lKYnnw+jam57GfXy+9fRJARJ4z93smi1Jcb86PJQEW3onh+2rWrp5sMmjxi2jL
 El4Ofh2G21xJN0VG1X4WHTNbdMzUsW10WbG8OWoj0QGkQOOZAyZIHLLFj8a134rIjpRt
 SZOj6CkfZXBDvWRLydI8LbfCOZ4uW893EhhfZA8WQpkdlVSJmJMlJIlE/JvoUNLL6Orp
 HE7GkoOFgdGRIAYn8XE2/KJUoOPwHv4531khk0vw39v+bhhpbSssi6WLicjhymU6z+Mc
 kMww==
X-Gm-Message-State: AOJu0YzOd2hBk5O5K8s8X3SJUujU1G9JJ7xZ+TYMIwS4VrCsUeDpI9vW
 S0i2JaXnphVEjy0leW9vfvWHVtKql0Q19tefXtliXYTeRULt6VNTqErL4IFSwibeDoflUr110q7
 HBaNiXI53WIahsXdCnKEuXiGHZPNardpInWC2ci+EvG6z7rsUpzkaxgg=
X-Gm-Gg: ASbGncu6zz8QqFUkX4ywu5k0eLLtzrUHg51jxBaugMio9wkEkorFGLGPQ1yZ2CdDOzO
 gSBwxfvu9iwEzKoqVl1DOKibRFo4E2DchNFFEAS4/MI0YqjIyt8lxW3a+OV/oYeo06bvKSmIJXg
 yQL9sglMCWJolH0BTMzumjOOLcMbTcUDufia1QiUnPykYF0KLYBMXQeci8/pK3p1u5AqTwj4lQq
 dBA6d/R4LyO57qlB6UUtv476oOX4OiZ1UxW3Rg+sy/6Nt55DmFZeqToJuqanr6Kb/fh8yCaPltl
 g/nGAFZSgZ5oPk2Dy3ztDti/pdBHjh+XpjmL7qbQkY2nhDH/2TAVq0SNt4WiVSTrdarkfFcf1UP
 Jk6raZy+s9o63/8M=
X-Received: by 2002:a17:90b:4a4f:b0:325:7fc0:4a9c with SMTP id
 98e67ed59e1d1-3257fc06a2amr12375311a91.27.1756233909069; 
 Tue, 26 Aug 2025 11:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/zRFG7+G9zMsi7dgEtkFDSv6GNsntMMu7y6CUttwJ/yQA10QjxO11Pd6Hs2DVdUm/uCB7xA==
X-Received: by 2002:a17:90b:4a4f:b0:325:7fc0:4a9c with SMTP id
 98e67ed59e1d1-3257fc06a2amr12375278a91.27.1756233908577; 
 Tue, 26 Aug 2025 11:45:08 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276aeef8b8sm220661a91.21.2025.08.26.11.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:45:08 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v6 1/3] target/arm: Increase MAX_PACKET_LENGTH for SME ZA
 remote gdb debugging
Date: Tue, 26 Aug 2025 18:45:02 +0000
Message-Id: <20250826184504.510279-2-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826184504.510279-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250826184504.510279-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX47O3xM1p7KMj
 yGFORYqtPY8quEPKbEDzKVi1/au2CTZUppsTbcx+NphgZf1vRlph4QdLkklRoYBWhFUY+WlUxVy
 k+CHL2F8cG9IxdOsrOyjgCGYBVTKRQFZFx57txNs+oaRnmax6GE7U1mNhFqALVSQHrtDH693+lk
 aihGavbAmPozrtjKRTAu8aRMfXrolsYXbRGCKAPZsSrSwXcy3Ouf/vxCc07r1WBSLNXPMvcfDpP
 rhZmspUOYhOfxcvBAM/HaJFz/Iw7dbpUWQRbV+oOu4c056tpqMHJxbZYaW9b4gaI1IhaTu0G31e
 oVBAuXUYI60OSinagfhPaRIXojxq6LWn5fYcaYXJOaYZ9zYASScW0CWGMpnK78UwY6SdhEZX/8e
 t0ARm01j
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ae00b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=CCpqsmhAAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=XJBTR8SIO4LSYOdVysIA:9 a=rl5im9kqc5Lf4LNbBjHf:22 a=ul9cdbp4aOFLsgKbc677:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pjRRp3vAV8itVXliu6IY22AS8DJ8zH52
X-Proofpoint-ORIG-GUID: pjRRp3vAV8itVXliu6IY22AS8DJ8zH52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
131104 from 4096 to allow the GDBState.line_buf to be large enough
to accommodate the full contents of the SME ZA storage when the
vector length is maximal. This is in preparation for a related
patch that allows SME register visibility through remote GDB
debugging.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes since v4:
- the value for MAX_PACKET_LENGTH is changed from 131100 to
131104 to align with a similar update made to gdbserver
---
 gdbstub/internals.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index bf5a5c6302..87f64b6318 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -11,7 +11,27 @@
 
 #include "exec/cpu-common.h"
 
-#define MAX_PACKET_LENGTH 4096
+/*
+* Most "large" transfers (e.g. memory reads, feature XML
+* transfer) have mechanisms in the gdb protocol for splitting
+* them. However, register values in particular cannot currently
+* be split. This packet size must therefore be at least big enough
+* for the worst-case register size. Currently that is Arm SME
+* ZA storage with a 256x256 byte value. We also must account
+* for the conversion from raw data to hex in gdb_memtohex(),
+* which writes 2 * size bytes, and for other protocol overhead
+* including command, register number and checksum which add
+* another 4 bytes of overhead. However, to be consistent with
+* the changes made in gdbserver to address this same requirement,
+* we add a total of 32 bytes to account for protocol overhead
+* (unclear why specifically 32 bytes), bringing the value of 
+* MAX_PACKET_LENGTH to 2 * 256 * 256 + 32 = 131104.
+*
+* The commit making this change for gdbserver can be found here:
+* https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=
+* b816042e88583f280ad186ff124ab84d31fb592b
+*/
+#define MAX_PACKET_LENGTH 131104
 
 /*
  * Shared structures and definitions
-- 
2.34.1


