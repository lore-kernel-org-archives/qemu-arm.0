Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B45C4452F
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 12:23:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wm9Uz-0004PY-47; Tue, 21 Jul 2026 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9UB-0003TZ-DF
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:22:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9U9-0003x9-PJ
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:22:11 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LAR8P21134534
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sW0H4vPzhW2N5b8QWJcMqMYu6iN7HTkZwHNpnDBN3VY=; b=TgbVVe/W1AhaBuJz
 jKO5zXm0GiI+PwpHbYAifkCk5MsU0/+/l1IV81x2NuZYoHrjdG5mBAkSNNCfNg9v
 YBw+hTz5oY0ZCrGRKEM1s8EUcXvXiJ2wwGA9eMD0aaIeWJQ51uKNv7ZQ8Lkf7gHH
 HKB/mIMnmUyCbTUDDS17TjOj104zkI6ZsjptaMcZlPDML2aV4r9q/4oiG+F7k4zP
 UVFuiMv7P9vdCaYEgr5AS/6ZUQD5RnpTb51yzv8DsuNiWIsS8ApFTf9beHF1uEiK
 RfIIv7bLf+UIq3z/H+y4E7foGZQxfUCui0NBnqNyg4fZtgjyc7pEDCySb+bXhrMf
 tBthRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as2n4v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:22:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ef8249f871so214597186d6.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 05:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784636527; x=1785241327; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sW0H4vPzhW2N5b8QWJcMqMYu6iN7HTkZwHNpnDBN3VY=;
 b=cn8lYKDJ8jbx1JyR66r8bWLT9dqUHG97C7aOt3kxK12Z368V7VrKVoj8kYO+Ip82cP
 9W1LnaWsqhbQnN6DopvE6A/QIBSgQ7IRKGsK9Gz9w0dJHBfUcxzYJc9emN8lE76iCQt5
 7FU2OhoiKgiujcCYXv/xhMTQahrRQTtfpqpj8G3zhoFKPOTe/3n8WY4XR71CIfdMROAZ
 aKAidhAqjFIBjOrftyXQlv6VJ7sgFwuArOMRPtry0wuA7iIC/Wacou+k56//if0pyi1G
 9Q2OHONa9kTzcwWgkYmFTCx4mstbLL1+C3pk7vLecrJFLU+XHxPy1LDrDGqqe5bJ9v88
 tytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636527; x=1785241327;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sW0H4vPzhW2N5b8QWJcMqMYu6iN7HTkZwHNpnDBN3VY=;
 b=K09pWyYrOYCRQ6VRawJncwoc/lK/SK99FrYVhnpyK+ir97QF4FOSBPyq71y09xpaHZ
 Ad5rvnAumkinr599btEevcQ3lTle4jdtnSz7ENok37TA3Yf/i8wd7q7JvLRncCDyB7QQ
 WnVwOl/b6k53LNDpy6A6+sHhq54yAG8dR4ClDCmImQL41MKLj9sn3JEpXQG74sQMLr7R
 YbPWoLnXdgEHGepWkshamTD8XR4lASFAMOKPCPNQ/sSMOsFSOmlNjlIwFG0GqJWT6X8W
 2ENJ1tYOF5nfjupf8dAh7CAdDECh7MBFcz6zu8yh8CY+KS7xCxOHrf83RBkBVLx4tpyi
 cbMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RokfHsIFdV6WRuXB2NYhSNFYjZpHxCGH3rDqr3jcCQv02mWy4OGvP7v9obBPjv7nDVb4nzUOkwxEw==@nongnu.org
X-Gm-Message-State: AOJu0YyzYg6X8xF+bN8sCrmtD2v/k82xo7/TBtNwAZbq4X3avTZ2MDxu
 56w12BrRzLnHYtns/rFM3oGh03QAOc/yYXBo7Amzp/8kpYHKob4Q8lHN67ElIIPLAXD/+7DNWWa
 jtQfpDixPwZyq59zQ8/Y7PYgi6U2w/dc2d2rBL8+dh1THqqGO6NlfqOo=
X-Gm-Gg: AfdE7cnb8DAy+jjoBSAeHaRRp2IzIma/z+PsYy8c51w36ve8TZcKMkKsqL23UYQLaR5
 CeBY0RsK+8MScidUrdrwz/as5PY7m/DMTBUykiQMJJics87D7NdjM3VjdNIqjkQS4jTz4Q8+40N
 LGLFonfnCbUlqA8c7xe3pAlDM6zooxYOJUmTQuEia8OEMFiZjXP1OSkNtJX1eug2nPxmF52BHvF
 P5n5xqFmmaqI5i27B8qlaOMgGqxgpjhLGBMnQG1ff8lurElnSKggYbE8Xt7R228cBvf9TH4NlVt
 45asI0Qcl5l9LdgOvfeiMCW/L8EvqyC9LpevY9aoRXu/nRa7/62/FvnVjRD59R0aQXlVSWHILCV
 NKNxvViriFpzSOVDg+XbLy2aX5GlfaV8kyJcYzC9OJQ8UkaCQQwHR6z/hNw==
X-Received: by 2002:ac8:7dcb:0:b0:51a:8c97:938e with SMTP id
 d75a77b69052e-5213e188626mr163570451cf.69.1784636527175; 
 Tue, 21 Jul 2026 05:22:07 -0700 (PDT)
X-Received: by 2002:ac8:7dcb:0:b0:51a:8c97:938e with SMTP id
 d75a77b69052e-5213e188626mr163570081cf.69.1784636526685; 
 Tue, 21 Jul 2026 05:22:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c7desm86665805e9.7.2026.07.21.05.22.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jul 2026 05:22:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 4/4] target/arm: Build TCG stubs as stub library
Date: Tue, 21 Jul 2026 14:21:34 +0200
Message-ID: <20260721122135.6288-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721122135.6288-1-philmd@oss.qualcomm.com>
References: <20260721122135.6288-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfXzg46yGbBUhWA
 XWJfGhbIXGawrpBCEiEvHBkW7mTcVickZrPO8GhCHdL50LK7lr944LnVzHfpM4oNWdBALFNIu2l
 y2l31nUDpj4PJlTb6OT+B6MlpZqYTCEs8SfbPEtLObICvFIlSOju6rObyzRPoaCpfnI8+ty4m5C
 4vxcDZBz9W7AHGNyomgmCPu1NVYulByFxl3jLzhzE/g717nOemf4zGR9ml8BqvR1U8P7UAYxBSG
 AfqIXrUXGpx2kmGzOh6SQ5KqguDfQum9K0LyU2TGaOSS5zgUKKitwkTV/8nMgEZP6SCLe3bgFB0
 s5L5TjK+2m8tm4LjQu/bwxryUBzzxacYHbbsGoghGuzmWKO1A6sn3Yy+kwZAvFmeBSSh9MHf4UF
 vp5jBzdiPqvvoOvbXTKoxa4p+ZpOZfU3lf04CYoMGcYd41nfa3DuIBGOSSlSqlgdOf56HRQh6Qn
 iBeKBxi43DS+OU2M+2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfXzbNemk7+5MgV
 fbsmWDo57cynt9kKXNIw7un/c4kSgfiFVqQjMrIzV0G45gUMsQpBjPprj+ND9O9QRn1enLUIk7l
 OOLr+HnHdIYbcpjeuiSQ861L81agSZE=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f6470 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dYXcIrvnCqDwK9geEd8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fDHyAvj-ImqbMx6rerkKeR_dgxSm_BUA
X-Proofpoint-ORIG-GUID: fDHyAvj-ImqbMx6rerkKeR_dgxSm_BUA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210131
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

Use the stub library introduced in commit 0da978cdbc6 ("target/arm:
define stub library") to prevent symbol conflicts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index f6ae8934d1b..0369f96b4cc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -38,7 +38,8 @@ arm_user_ss.add(files('cpu.c'))
 arm_stubs_ss.add(files(
   'cpu32-stubs.c',
   'gicv5-stubs.c',
-  'kvm-stub.c'
+  'kvm-stub.c',
+  'tcg-stubs.c',
 ))
 arm_user_ss.add(files(
   'el2-stubs.c',
@@ -65,8 +66,6 @@ subdir('whpx')
 
 if 'CONFIG_TCG' in config_all_accel
    subdir('tcg')
-else
-    arm_common_system_ss.add(files('tcg-stubs.c'))
 endif
 
 arm_user_ss.add_all(arm_common_user_system_ss)
-- 
2.53.0


