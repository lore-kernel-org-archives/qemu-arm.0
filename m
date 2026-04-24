Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E3AFF885A
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 23:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGPWm-0000s1-Cz; Fri, 24 Apr 2026 19:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wGPWR-0000mS-UL
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 19:01:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wGPWO-0004YM-5q
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 19:01:17 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63OLpCMe1054512
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 23:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=8iNkOvHAuwzmKaH2Z0zIaG
 UeO7YFIjh4iUIzMlZJd0c=; b=H/brk4tOcW0ziSL2tDgL/ZTzYgjXrsO69Xqh9p
 asJXpqDu4KzjNiX7eoTmsoa49zPWfD38tiPHwjey0uM7Fi/rKuLgRwnacC8cyTMc
 /2ABw/h+0f+HbmtHXf8ElNd1t1Ua2vh7lMV6kR3k4XtixT/GyA8cFXeuxUOnc7/a
 6QkZXyj1EKVP8ES/iJYiF1VLR0ACXbBX0GPmKNhPf25qWg3cF2O8sfyH2dPpL9bR
 0qtJcHFLDgwFn5z0DgzGE/Rge1O0oZi6SjYTRHupU+s4uOzQ/6Kc8vQgEAc2RaIU
 GxoaO4HyfmzT3yxNMBH3Cfg/lrXySlllj2OU7/MpASqRlpCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drdf48sm5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 23:01:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2bdf6fe90a9so12348407eec.1
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777071672; x=1777676472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8iNkOvHAuwzmKaH2Z0zIaGUeO7YFIjh4iUIzMlZJd0c=;
 b=IW3d067eAe2MYFEkI3vPg3f9tN2RwBhBz6ATi+E8HSItyRQNN0DEDlUg//u47HNUF9
 aVxJVcE2CWHJ+sH9DBpyG3Rz6NCd5rquCRX8z+WRfuKEkCRtL3ic7450c46gbAnmiw21
 nvngp1CWjUWnlPYnoxq9CwsJ5ui5r6n2wYNcLTZ3dEsW6ItPSN1daWGfR6OISfCaYmAK
 Hjt28rERXoZbpzCeLFT6/ROFVZNmWKjwtEZwovwJQX3e33FzbQcZRUmaBRHIk8WIQU/j
 V4cg/MOFwzOhm+UfAbc97r9H+193jPoP+2BIYh7WgxDu7FF/1uVwoJT0Z/YNLQq4YazK
 4NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777071672; x=1777676472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iNkOvHAuwzmKaH2Z0zIaGUeO7YFIjh4iUIzMlZJd0c=;
 b=cGnrybSex5PQXXuvdSYW/Alw6M2vmHJBdmhd3j0MemqLPW7AgkOOhD47QmcrT1r71O
 0Qi0aewAWQ9yvrXxNI6svS11f2GhDmbeKRuFWRyeuyU3oKGkh4LdzAzVJ5lYt/MeCpTm
 tPVq9rxps7WzGUVrl8PkOusJseuEfNGvxTAkDCJ6tRwfCNm2szhSUcwkKrfydxatbN3j
 ps10MhZrG9Bye7KDRJ8h7MCuthqPHrILaYbmYFVNbCg39efXYf9IO1TXiE3yBS95+1jO
 +BJDdktHtRuy4oqcH5u0FJLxxDnnIYofTzRM6CzwsSBZymrVHSHkbRAqR9fDWTSRoyId
 NeRg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8F0uWUxvmHd6fwFkGZ2Dk3tY83b8GxrxZpk9+aKd+8ZRGOQZqdKAdHgRwRBDZ8Ufd4l9LukTYhOw==@nongnu.org
X-Gm-Message-State: AOJu0Yzi8KowlaNy0yP5kYBoTSKDwKSWCXlnnGlKoLAshinJXfFaYS65
 YaMj/PPCWmYPKi+ps1jRUUXG3RNQt7d3xjPeVIqYor6B32Er6GCiqrOSnd0a2jE97lB8CtIBIKT
 krPQ5+yhlHlCrTp37qWq/Rq7/CVMRdtcLjwZqSu3uV9vx2o171w7jlk8=
X-Gm-Gg: AeBDieuLsm6lTodnuxtTwYebNluGb+Xd8FvyqjQ7A77braPyGtvUie/50vj3HWT9Ule
 HUGAoX3fUDxG0t/4NQS9cS7ZkrvY1CMKo/ImIN5ArwoaBhnbXZ2+hME+o4WJU75rGvGSVXErw3I
 o6JesxtIFfVPapVSI3ifs64hQJ6rlBhUk+z+CBH8FdwHVp/oAC0ys5OxW1V464v1O+BAx3L2jtL
 aM/NQFfeUwXX9R/D05A5QqmbKtwRAwz/v58M1Zx/zosBizC4SpAvc5vJckHcEIHFvHXe2eEnTYQ
 F0FV5vm1yT0ypU2qx8kQhvdNFFSZ5B5DuxPY4Obie35MgpJFwOHKYA31kwqeJOC67OyVNdA5CQ5
 YIiTqgQJWQICIVEbViLMvTaseQWQMcjZ4/9SZ2AF8KyjGGMIpUHf9kRmk8Ks2NV0Y/hGr5KpJis
 QLlLcCJBuG0tzRi0zE
X-Received: by 2002:a05:7301:fd81:b0:2be:80c4:2c8c with SMTP id
 5a478bee46e88-2eada6d6576mr2056198eec.8.1777071671988; 
 Fri, 24 Apr 2026 16:01:11 -0700 (PDT)
X-Received: by 2002:a05:7301:fd81:b0:2be:80c4:2c8c with SMTP id
 5a478bee46e88-2eada6d6576mr2056181eec.8.1777071671285; 
 Fri, 24 Apr 2026 16:01:11 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2e53d8b944bsm34075003eec.28.2026.04.24.16.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 16:01:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 0/2] single-binary: add stubs for target/
Date: Fri, 24 Apr 2026 16:01:01 -0700
Message-ID: <20260424230103.1579600-1-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z4vc2nRA c=1 sm=1 tr=0 ts=69ebf639 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Vgz0Oo33IDKrnIdMAkQA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIyNSBTYWx0ZWRfX9hmWuYK79SuA
 OS93whaWWGtUgj/8FxFBlx/QhGP3y1sqXPzwc1y+SMupRuvQ84Kbr71FM496Ypfy/6qErKnh0Ry
 ZUlUdY2nwSLK9RkivYn3rsSotaG8Ufw8bU5OgZv8kdKWMUIGLdYccYtHPizM2Qb5D9D8MYkCuI/
 AfPmOnacodrYfrRNZplPkR5cr9bRUJgBqyPsuF6LyuiN51pmIjUqnfneRPndzclKGV+t/jnDCNN
 NIxWs3mu3kS+8bIPl/7Xj3AsBtET1vO+sYHqsRpJxxGzfUD1lQ5V6JGWEWO9B+MBd3nnRNHRgcs
 YLoSOSYOfEwXfBjRzvZWbF2Qon8AM2mv06N/gr0AaA+HsgvAXnqyWQ0nxQ2hhPFsRHQZljo9Cn7
 FzPZgm2ixgU3im5GAA1rTPuaUhtrVw8AJqTid7lFaSGHa4HunvKUcI6m5bBB9AVCAxePGHwDR7C
 TKTf8wwSqRWci0G7HOg==
X-Proofpoint-GUID: FPtf6AuLVk4ScmbfbOJ--YqB-pyqyuIS
X-Proofpoint-ORIG-GUID: FPtf6AuLVk4ScmbfbOJ--YqB-pyqyuIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240225
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

The existing stubs mechanism is limited to common code that is located out of
target/ folder, mostly because they are built in libqemuutil that is independent
from target code.

To keep the same semantic, able to emulate "weak" symbols thanks to static
linking, we need to provide a static stubs library per target.

This series defines the common plumbing for that, and then define stubs for
target/arm. This allows to remove conflict between stub/non-stub symbols in the
single-binary.

Pierrick Bouvier (2):
  meson.build: define stubs library per target base architecture
  target/arm: define stub library

 meson.build                | 22 +++++++++++++++++++---
 target/arm/meson.build     |  8 +++-----
 target/arm/tcg/meson.build |  2 +-
 3 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.43.0


