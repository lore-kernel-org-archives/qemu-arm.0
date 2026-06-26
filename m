Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1842AC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG8z-0003Li-NC; Fri, 26 Jun 2026 19:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8w-0003IU-Mw
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8t-0003w4-VO
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:30 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwpMn2098351
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sU1ZEpbtsPiTi3Z1jYI9sf2PH/WmQ1kJvaxyrijgup0=; b=aU5rvE1lZaMqJjIk
 CNkKbaJtD5X87KcOjA5z/eFLcPVaJYP3WsDaTMVwd9niH4Ydol6hAXgIOMDmCR4J
 lR8dTr7R3E/jiJVfTJfc8IMiCGIdU8fJomd1jmo/wvXp5Cz5NVCDwZo8xnsLDxbf
 Ck64VvYYtXubr0VUdWhVzWWi1Qej8j1anmtXhp/ipJHT9IALh+eItWWnteDh7DeL
 aahxicHUcCPki7xgTFLPYOyPQxV8DHHwmSeIC6QQicLWjm9Ju6dLLriXeSo+vV72
 x3zbMes+TNcoYG7MWYSifFE41+cgeqroGTRtS+f/7CC7vuusA0ZB09nFCJJ8+8KD
 uPxQvA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xxvgtht-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30ca81e05bfso1093912eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517166; x=1783121966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sU1ZEpbtsPiTi3Z1jYI9sf2PH/WmQ1kJvaxyrijgup0=;
 b=eCIj4SKtLytRGCaZ/jSrA+Guf/5lZB33F1yV+6jklbC9a8nSdLewdrMn3vHpy0c4JJ
 sCJWVlzt65F8WIr9yT6z+9RyrOIyRhs1cG/jou5qfQAXYu1yYY3iki/yW9qf+ghU6Bxg
 vVdZMPJjA41uYvRwILSNJhgs2AgPFgDsfCU3d6kE9f5TztSVRsoyv9aZBIa9ScYYFsOE
 UNIFCiNN15CA93cgaUW4+KV5apfUt26EZP6zGm9aMI33bKLi84lBBkyR3CzuA1aDpTlI
 5Yt7pO9WTxi9L/D/6QTQUJdHnTwWQa6Tf3GhodT0HR3TV61Ff1un63Nk+b5rRvI+szLs
 fAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517166; x=1783121966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sU1ZEpbtsPiTi3Z1jYI9sf2PH/WmQ1kJvaxyrijgup0=;
 b=LZDJbQ4hFTC7KHiLqtmSO1GP3zGZYMSyAlBuobkhwBW0LQtRlJE9HVvDeQabhqIimb
 qsA4ONV8sqqdTgv67KPd+flcq8q4ow5stsYtPTAkrF0gi5wfyShqFs+e4++1NyaiEkcs
 +OMK0u/Fby7dRFB+GsDg1mb04jPM3hZTiM0C3xTNgHQ0G/eV6rs8w1T8PjnuLuGUy9gC
 sPWRFGMRl1PZ+oCNAlkGA1t0owJ2GJNeb075rU7XBbz4U1VcjIeWXdMgpz5CQs+PBrEG
 QpVgoOtpStDQOXXFbKPHJLxCJl6eH1E1Gpfz76DzVUB0vvCBYIdt8DpIox9hkk57hlDG
 yoIg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlgLzHHzkIz6zJilQfxFDZ9jdNlRzNosyYkOQUGS1eQ8nA4a5A7pQIAY6+GQ55kpkEZ/pS2hdYQg==@nongnu.org
X-Gm-Message-State: AOJu0Yx+9cg/+Y01MySxu35O2+S3lVYr6vGqJa/rJsj7ZQGgPe/NxEah
 A0Xr4XpSLEgJoiXQ3VDGKRpQWBI099awB9Y8NE/0OggmLJGqwFEAecu7YgoVNhQqvFz047AVDAp
 KNz1wEG3n/aSiLzGfZWYt1rhgA+rRwRXp7eZ5d+Sst951hLxOzVqghGc=
X-Gm-Gg: AfdE7cleOuAIAMiy5KbV4/2igjTq0Oh9w2Zqxpk+kV6fdVTUToC4TVn9sH+8zYsEQ+0
 Wu98CBmicMXQeEjLaBBX4IhvMkSqhOlFFE+JOJxR5vFNisCeQkSQcRF0jjaAAq73cNWsHqJ1STP
 yFHLF6VSjt8sxngIIYcR9hu605yQGxAwegMD8LgSSimd5dNRzdVOlvg4bcZkz+o6kQxQSGfIdfu
 Wp7kAVemmCkza7KQccD4sE9WBbzdUHssPDtRJ6FLA3ybSZD9C+lTAsiW3SCeF5izcXOYUy8dOix
 C27vnH+A+oqWupWpDbWc+VbijBpWlqvWyydRwMOSiRmzqTXynVqQ9Fh7AT6TDgY2ob7TIKIN9HX
 qFWbZEMHuJZ+yDNBJBdif917+M7qIphRGmJ0C5rGoiP7rpQqHkaoIP249vbhcEFGg3741tARltg
 0ofWbDIA==
X-Received: by 2002:a05:7301:644c:b0:2ea:e93a:ff9b with SMTP id
 5a478bee46e88-30c84bcdacfmr8052564eec.13.1782517165972; 
 Fri, 26 Jun 2026 16:39:25 -0700 (PDT)
X-Received: by 2002:a05:7301:644c:b0:2ea:e93a:ff9b with SMTP id
 5a478bee46e88-30c84bcdacfmr8052543eec.13.1782517165450; 
 Fri, 26 Jun 2026 16:39:25 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Thomas Huth <thuth@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 02/37] tests/tcg/multiarch/plugin/check-plugin-output.sh:
 take test output as input
Date: Fri, 26 Jun 2026 16:38:43 -0700
Message-ID: <20260626233918.158740-3-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QtIrbnSXH-wYXl2L3-IVQyKZ1QBku3NF
X-Proofpoint-GUID: QtIrbnSXH-wYXl2L3-IVQyKZ1QBku3NF
X-Authority-Analysis: v=2.4 cv=BLyDalQG c=1 sm=1 tr=0 ts=6a3f0dae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BJ7t3AzVVyt49CR6OUkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX5KBfo9jsg9LQ
 U7k+HV6THmqFRmRwwbAOPUaN/rLC+nOKOywsdEebd8paAUfCAPJ3ruGLlMXrCnhWA7L4KUe1xXO
 Jqr2zu43nJahmrGmC5/12U9yO7XhUq+H8M7ZI9apPnDBdz/hxYc18fW2Q/tSdNdJjQndUQbj3R8
 da6Zjv+EvljTtZn1ud8gWbkpZaECkkXxH66t+srgVepZ+ace1gtxXfP9d1iS65Jzd+SiLfvpbrS
 AiubL28LKitTqypz8YYoCZm+GGzzfDDGukkJfyh80fr/Q469dQyvhxJP0+7UCd8NQ5fyLQXAPkK
 OOobHEptMinpCnZQfFIpTjhl5IQgKqhulCcUzUDXDD9F91R5xu6v9Onvzj6xqh/XlUhEnwuXybr
 nVlPgQ9yfzuSIsxJayYOPR02kxJ04sYczKq/ctVLCUWjWHZWPSIIaZTi2f2l9N3+yrp8Ta+TGjO
 fceYj+cwQ+QcGtdyAeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX8weAgoHrcnR9
 YNMYlGWbReRH4cLDEGmxMPYSsB5eJNg+FRs6dLOGlTCPqGhERDjc2Hjwno348dd+9cZxtRF6o1w
 24PNQ7Vy7zJiywUPCpgErDElk0aHOco=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260197
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Instead of executing test, just read it's output from a file. This
allows to standardize how to call check plugins scripts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/multiarch/Makefile.target           |  3 +--
 .../multiarch/plugin/check-plugin-output.sh   | 22 ++++++-------------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 508149d57bd..f46983cc76e 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -211,8 +211,7 @@ run-plugin-test-plugin-mem-access-with-libmem.so: \
 	PLUGIN_ARGS=$(COMMA)print-accesses=true
 run-plugin-test-plugin-mem-access-with-libmem.so: \
 	CHECK_PLUGIN_OUTPUT_COMMAND= \
-	$(SRC_PATH)/tests/tcg/multiarch/plugin/check-plugin-output.sh \
-	$(QEMU) $<
+	$(SRC_PATH)/tests/tcg/multiarch/plugin/check-plugin-output.sh $@.out
 run-plugin-test-plugin-syscall-filter-with-libsyscall.so:
 run-plugin-test-plugin-set-pc-with-libsetpc.so:
 
diff --git a/tests/tcg/multiarch/plugin/check-plugin-output.sh b/tests/tcg/multiarch/plugin/check-plugin-output.sh
index 80607f04b5d..338c9ced23e 100755
--- a/tests/tcg/multiarch/plugin/check-plugin-output.sh
+++ b/tests/tcg/multiarch/plugin/check-plugin-output.sh
@@ -1,8 +1,7 @@
 #!/usr/bin/env bash
 
-# This script runs a given executable using qemu, and compare its standard
-# output with an expected plugin output.
-# Each line of output is searched (as a regexp) in the expected plugin output.
+# This script checks that plugin_output contains line from test_output.
+# Each line of output is searched (as a regexp) in plugin_output.
 
 set -euo pipefail
 
@@ -19,18 +18,11 @@ check()
     grep "$pattern" "$file" > /dev/null || die "\"$pattern\" not found in $file"
 }
 
-[ $# -eq 3 ] || die "usage: qemu_bin exe plugin_out_file"
+[ $# -eq 2 ] || die "usage: test_output plugin_out"
 
-qemu_bin=$1; shift
-exe=$1;shift
-plugin_out=$1; shift
+test_output=$1;shift
+plugin_output=$1;shift
 
-expected()
-{
-    $qemu_bin $exe ||
-        die "running $exe failed"
-}
-
-expected | while read line; do
-    check "$plugin_out" "$line"
+cat $test_output | while read line; do
+    check "$plugin_output" "$line"
 done
-- 
2.47.3


