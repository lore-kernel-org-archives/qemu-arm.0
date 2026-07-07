Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ADFC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh6Hq-0003dW-N5; Tue, 07 Jul 2026 09:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Ho-0003cs-SH
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Hn-00008Y-Ht
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8tPt3749579
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 13:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 12ntz0riBx4+nic6fgWGFvlIIoRgNjt6n/klVAeq7qU=; b=fTsLOVdFOGMdH7dF
 TN/G4kyM5KTX3wdL+U7EFYP/HEFCvff2/qG40uxmQvXN4sjU5fP3gkByB9sZSq+e
 VOvcZm3lUPEEJ/m8+qGMZjZUMG6wHgkKHGQRS47deS0v2hL6+Hn+UFqiVXgpRIQu
 eF1BTgDRXovp/1E//rJMdpNX400w4P3gVLDqMNdcCk1wjjgDvClOdCaEU5ar2IeV
 6uIcyJZRuFilHX5haC8GOp38vbdKvNOmW+xekpeU2Vza3iFy+1bWOGOtFOixaiTy
 f8L6K9TAJdpKCQEakAsm1rXnfpgU4udt5R2pjranWh6jK5tYwq1x6wccFcbD3UiG
 QV3SFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9qs3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 13:56:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0ab07320so38593081cf.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783432590; x=1784037390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=12ntz0riBx4+nic6fgWGFvlIIoRgNjt6n/klVAeq7qU=;
 b=Eaj7dSICcF5QXtuV0Lqfmudz0jkbdVN6D67VUcmZLZFWKG05VJldP8usKp5lCTZMSH
 Cti1Gpf8+M1fLMjJZQTgImw+sqa8z5G6sQeOdQX2X5fllzehwGpk0uyT5LLn7pI5/nlf
 lcFBPSGhNE/wKz5WnZShKzQyEc+pwmXSneHLflzjDHqXV5HOj8trJ5qDK9TUzuU5T7M7
 sG3EQ6eJM1HOibmD8RCPCMnNHVksNElYwd1VZg6sl1UTx4ZxvVkNFeNE87CnBy+fXQyk
 ZYL74C/RfISc8sEuXVtnc5+noIiPi0rnImEuLxebTwfY+lNjPRhDVTClrOE/vBctN11E
 di1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783432590; x=1784037390;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=12ntz0riBx4+nic6fgWGFvlIIoRgNjt6n/klVAeq7qU=;
 b=biJSzymhOzJxp01s29Lpg6ET57s6qfpZtCYS6U9e1cGynVKTyS7Qx0C/YIOLTbA0Lf
 Mmjne943RYfpeq4VFuk+FQffA6+chfjNZ5vxr7Cfc3jmuV+j0gfi7Mxs0GcF2JQKtvbD
 p8xPRALxRAXdavE1mgEyBRHf2C9czdO4yfut2ENpz+DchZ9X9xSq0NtVpwomHj1Ac0nD
 WiopJMARPoB9q1SmfIOeB9UetIvG4BLMYLuPJc+nMV9EGDto8NvGTcCnUpgRj4rHcnD6
 2gdjprb6ULNlta25KIMGNqxt5yOS9AV0ZKQiGX0TiXif+QlHp1Zaz+MD5I8AfXszFhdh
 4qwQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnYwC2IG70ZrRVr2fVUuBR0NIRL2/ixuhHKfbN95hqRK8cqnUld8i1EDh4GnuWFuPlx8rWL9534w==@nongnu.org
X-Gm-Message-State: AOJu0Yx0y7UjwX5cgvNsSgeCYlg4TmxmGQ3FuUPiE3/O4l3rvPoa0tSy
 YN/ByS5I9BniK0DA/U0mazYD1zErnhRe/k3uHdM7nHl6wFltCe6i1RCg4HNRhuTbnsTPCobHYCE
 tImU93tiYjvGcAvBO0VYhYA51jR5PB4jSGfRNGi36Rk0FztaWRdD0AXg=
X-Gm-Gg: AfdE7cnFZMhMQUyRyo+ROTkixqqdzNbJOuZB5bqkjeHi/GvdM2PlIUDz3j4ENhRauwV
 JIwKmIZ2zE0ktG+3zpSAP0ky+67uWN4fxOIusqvmdviNE1JQ0Zn4sYJE0EZ6eNDXy7QWgPsvh+W
 GBFqQ3VLNroGXtMlfo5yY/k3iYOk8NfEkrC3gU/Fdb3Unl6jkZRV3LhYYthClEFNXin7NtriTAh
 6ofM8Llu/6/px17loZKBJeP0QfDYUw5r2FG8nOBKSd1cXlKV6JSxaew47uPHV23BiHxYL7vjzJM
 6PK/c1woBOYLmOG06nDGgF1fa0nndMUsr76sJrb8o0KebgurJ9ArBw9KpPIDJbTp67DVLwqcVeS
 Ez4Ul+DsqHbgHXi8GMZ1C36XlWiRRxUhXuskrOyqx5DqWzYr5HjTPW0eNTqzcnEmvMoxP
X-Received: by 2002:ac8:7c42:0:b0:51a:8c9b:649b with SMTP id
 d75a77b69052e-51c7487dfafmr56962421cf.63.1783432589674; 
 Tue, 07 Jul 2026 06:56:29 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51a:8c9b:649b with SMTP id
 d75a77b69052e-51c7487dfafmr56962021cf.63.1783432589026; 
 Tue, 07 Jul 2026 06:56:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f5b811sm90818245e9.13.2026.07.07.06.56.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jul 2026 06:56:28 -0700 (PDT)
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
Subject: [PATCH 1/4] system: Select WHPX by default when no other accelerator
 is available
Date: Tue,  7 Jul 2026 15:56:15 +0200
Message-ID: <20260707135618.53561-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707135618.53561-1-philmd@oss.qualcomm.com>
References: <20260707135618.53561-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d058e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=m5lraNmIkCb9aVCCOlYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 328-HpavPqs0u4wWAbEbbXGRuw5OMAcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfXz5N4LJ/F5C6y
 guw1wldigGwlpSF0RmX/ew6ZhTPOWmC3WIdh8fSTdCl2wT1TkrtixawPy0gj92SoQQLOxXCNUlI
 gSmESNH6n/ugdfwKkmQKMF6X0tM81LmgXQe5x2H4skweYb1f2E2weE4KN4jPEv0bs8iSio2O0M4
 Ili71yFbK1yGhCPHoIkDcpVrrWj+cwcjpMesEzIEFbRjGGcKY84LrRmi46FY0K5YhMGR3X9X/8Q
 SL4SceYNptXsKMhhwWDONuvvvPhC45YFfacy9NvtjHGIliVWHvwcdqoI04CpBsGjtQfqt9NUX5l
 Psu2dZNBUqpbdS7Dg+I6nsals+axDK1nK6+ev5aBC3pL8n+pyAcxVErI/bqEZR0dbIgRhMw+5e7
 JOSFPeFBENYqt2T7je9dW842cKYB4UdQI2aM4k5CBmtdWTtYw5lECIEPgLDLXCssHqWzsjTjQxJ
 34maMqdOs1Da7xPCFAA==
X-Proofpoint-ORIG-GUID: 328-HpavPqs0u4wWAbEbbXGRuw5OMAcx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX0SzLdyE37uAW
 1psreapFiJwasH2u0Ls1qD2aqiHnsOpHVDQaDohpxkZqCOkfi73imNtxd45lv2jiR9DJDF33N1T
 pYBANnpJjpkBphymfAKMB4gR9s1HpqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070136
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

When testing with a WHPX-only binary, we get:

  qemu-system-aarch64.exe: No accelerator selected and no default accelerator available

Fix by checking for WHPX in configure_accelerators() and using
it by default when no other accelerator is available, similarly
to commit 964d2a0cf81 ("system: Select HVF by default ...").

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 system/vl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/system/vl.c b/system/vl.c
index 1d14e2e2076..4f6d1e1ca8b 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2444,6 +2444,7 @@ static void configure_accelerators(const char *progname)
             bool have_tcg = accel_find("tcg");
             bool have_kvm = accel_find("kvm");
             bool have_hvf = accel_find("hvf");
+            const bool have_whpx = accel_find("whpx");
 
             if (have_tcg && have_kvm) {
                 if (g_str_has_suffix(progname, "kvm")) {
@@ -2458,6 +2459,8 @@ static void configure_accelerators(const char *progname)
                 accelerators = "tcg";
             } else if (have_hvf) {
                 accelerators = "hvf";
+            } else if (have_whpx) {
+                accelerators = "whpx";
             } else {
                 error_report("No accelerator selected and"
                              " no default accelerator available");
-- 
2.53.0


