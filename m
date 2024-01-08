Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2257865ejo;
        Mon, 8 Jan 2024 04:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnWU2v1qWmP8jhI4ic+P30bVY6YSi4qzvugbSGYM+mcI1xZsWr+MqwO9/K4wdWHD6cIy5z
X-Received: by 2002:a05:620a:45a3:b0:781:80dc:8e13 with SMTP id bp35-20020a05620a45a300b0078180dc8e13mr5384838qkb.147.1704718260933;
        Mon, 08 Jan 2024 04:51:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704718260; cv=none;
        d=google.com; s=arc-20160816;
        b=DfN/gUDPhbxzwqqHs/2v20OGlg/x8E/R9pX9dIr8xC5vrlXgowzqdy6PQSyY0XAmf6
         Rt3Kugowr1jLNwYOM6Unkn1pktuDiP2ZBpzpupibAXK90z1rcdmqYXud60JnGkf5Heq5
         yAElhB7RbekjRgIIoh84TNzIJIVnrXRGj8EIwcvs4FsThHQMLwZL93ZkJWe0SLRKEbzN
         +8ld99i+HOLcb1VCYA2pilPtDsZ4oTPHH410pluWEIWQMFtD8DfmoD70JVuuoy4EXV19
         IOcq6jTytHVqGC5xSFidl0qq9I2G0AR3QHimhwZuK+YrjsYBYVkYlTG93nQiw4br/WBm
         slww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=N0tHCZIWFjSHh1wasfe8VFzeR+j+9M76XHh9XfyjqoI=;
        fh=bBQekQR/P2pOG7DRwivIi3zDyO7shyklhMYjX+JI6Rw=;
        b=jS+UwDqgTRh+/5nlPPgqx2UImEzwMaKP15/Vc8m5ZiMkTbZ9S67L1s539etATOuSuq
         pWcusPmPMRkFMeL5xGTfCK1BCYUZkMkCLMQP7N6Lb3VoB4BXu5sUNWwru87LUrCu7ZUo
         ieeKLv5eiLpRox9dOBPkXuTeVdJxdzATo56tlYkABeahjCl8xYjSEpNHlrG+mFvnuHrh
         dVmuXdnwvk4O5m0ISzWKRiIgbNP8A3b98y7bhRTXl+W9NOohCi17XE5M+BWX/74JCCu5
         I8GUW1KzCfoT1cpTPbvVy+kOV8/in1ean9zSSiO5UB88tW1UHL7yU5YV/D2dgZ9oEAQH
         dVPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=iPffQ+FZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pb14-20020a05620a838e00b007811a26404bsi8288727qkn.768.2024.01.08.04.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 04:51:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=iPffQ+FZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMp5Y-0001o6-Te; Mon, 08 Jan 2024 07:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1rMp5W-0001nY-Vc; Mon, 08 Jan 2024 07:50:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1rMp5U-0004tO-AR; Mon, 08 Jan 2024 07:50:42 -0500
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 408BRb0c009449; Mon, 8 Jan 2024 12:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=N0tHCZIWFjSHh1wasfe8VFzeR+j+9M76XHh9XfyjqoI=;
 b=iPffQ+FZpt/LsLiFRaa6BpyCIjFx+P8CugopxnBarh1qZ3bym9hc2k+U5eprDoYhCMRE
 BIibeVjBl2dlBoHcRUTIXKK5qR2KJjUkZ2v3QStKW75jBQShYR38E+UxAuFT4bXEdJ5v
 3iUT5EcZNGm20rQvKqv/bEEra3FvwbpWGQoB56Sx3OXsakeeqBVrQxoki8QXw7wBJJeJ
 7lmXF6kFHLNTYKgeu1NRvyjmvWzxPybcNEG2ClHptFunm1SnEqM7MEG9f0q6Hp4jCaiR
 jTbYJTYGMrApajvNnepFRFOQDA/j2fvVsGAhgIkvsqqm5JOsxZckneR/Fwa8KtoQNb+W wg== 
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgg6jsne1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jan 2024 12:50:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 408C6DBg022781; Mon, 8 Jan 2024 12:50:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfhjy82jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jan 2024 12:50:34 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 408CoWN866060794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jan 2024 12:50:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1795A20043;
 Mon,  8 Jan 2024 12:50:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7D5E20040;
 Mon,  8 Jan 2024 12:50:31 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.200.166])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jan 2024 12:50:31 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg: Don't #include <inttypes.h> in
 aarch64/system/vtimer.c
Date: Mon,  8 Jan 2024 13:50:00 +0100
Message-ID: <20240108125030.58569-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9ew2VzDaQ-HYg4BPfA0SArI_fQggQc6H
X-Proofpoint-ORIG-GUID: 9ew2VzDaQ-HYg4BPfA0SArI_fQggQc6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_04,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=868 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401080109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hP7NtBJu7Ala

make check-tcg fails on Fedora with:

    vtimer.c:9:10: fatal error: inttypes.h: No such file or directory

Fedora has a minimal aarch64 cross-compiler, which satisfies the
configure checks, so it's chosen instead of the dockerized one.
There is no cross-version of inttypes.h, however.

Fix by using stdint.h instead. The test does not require anything
from inttypes.h anyway.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/aarch64/system/vtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system/vtimer.c
index 42f2f7796c7..7d725eced34 100644
--- a/tests/tcg/aarch64/system/vtimer.c
+++ b/tests/tcg/aarch64/system/vtimer.c
@@ -6,7 +6,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#include <inttypes.h>
+#include <stdint.h>
 #include <minilib.h>
 
 /* grabbed from Linux */
-- 
2.43.0

