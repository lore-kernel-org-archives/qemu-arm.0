Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE68CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JJ-00076V-Po; Tue, 09 Jun 2026 17:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JA-0006sF-TF
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J3-000895-Re
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:28 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4grJ3229239
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mX9AURxEn3F
 Mu3PeaHMHnmctpbTWl3flWrxnltNaJGQ=; b=khaS2TK+2W/LmJrDQoWiaRWmkZX
 Lk5xkS0THDVfQkOpcO717BaUhFMS1IrM40cZqaaK60aEa8ING3rk+d9D/D7bDEps
 Ai/nAxPJnY68EIEp3IvYdoa772Lbb2wpTSrt1NJeUuyc4MlcIiXgwbPMhH0r57gK
 +ZLzDL8+zHVHZ6XBn5z1wJQyxFF3B6D8/HyYT1OJt6SFoNykpmJGlGHA52xnlcwX
 qv9e/1fcI4PnnyDcXr3yOf9WBxYYyHUSMaV0zP/c1XRGktIttUB/s8387wdhpJWB
 VOMURg13MEXLS2/qzd7OsQPEvmXLV5SDEFC4MlM/JRd1iWCLqek/fKWXI9Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg2c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:10 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-13815cb1507so9024956c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041690; x=1781646490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mX9AURxEn3FMu3PeaHMHnmctpbTWl3flWrxnltNaJGQ=;
 b=Uxl+eYrk/P9Ld7kcFj2p0+Dlw28F7ic3frbT7N6F8g3i5DkAbn2QEzh+t7fmvkExyg
 otlnv8YKDnmcHo4TF7uYQTGb28GIjBJmBTn5pLBsVgE+Ia053XDUKhtCAwF2iu6TliHT
 LknUGJ+BgyL3Vttjv/uYmvCwnBxyHtfqizJxpya96dNXKr+BNWTNThrqzS4Ruj9VJr5k
 QWshPN/ZPmR3521mtc9cf/F2Wm/dDA6Fu3E22fuMJEcBFbUwWZ4FvQh9Mmk04BYix4TB
 TWh86P/kCokVPdjIJ6XNt8ocRcI5AXT53pvVc5OA1DHx0jZhcpB47hfjja88v/2rjfnQ
 m/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041690; x=1781646490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mX9AURxEn3FMu3PeaHMHnmctpbTWl3flWrxnltNaJGQ=;
 b=T+UW4OVHEST0miWaP7yiqRVHVPOWKtxesyVVsXA/C5O0wawahMSxb62E306roP1YxA
 aSR5GGGN6476jJAJT7xMTcYT9T4n+g9IyFyUMmtMhEcl3oMAffS36BM+6eQPpKjj+agq
 rxvgpF0ELDpKO4oUk6zeCQL9z+mDYRGozpiMemph66EDHutt0yT2z1jk6PkR5RJzDWFI
 YlPdA2eqw2q581aXgsx8nGEeWxQDlvEc0GvhIXJzUYiI3zsVfJ/xCYZsq9ecp+oZkyTZ
 zmkXouaiPvjcfRHk95wLY33A7gbKa17+U4k2KcuBxUXf2OLTDrK980EMf4uZJZ0vGy3s
 85Lg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/3Y2HG2Lw/vSisXC/PD6poWM00syz0gcP6dCS6Y5JXC4x6D1yKla6f0jTcsulrAb6PnYKgtcUnVA==@nongnu.org
X-Gm-Message-State: AOJu0YzhPdqWBBazZ3ffQAe/tKb6K43HFOpIkYOYMsoWCBebfXQutNEb
 kjJ87hxBLMimOikjx8Xg7IyYzLEOhYMxDZ1MImcYKUgUFuIwC6sUZji5VJ8dO16vTaqzb8lhplP
 LG2ZHKTr39IGm5UQP2hZ+2CuOy7SvS+UZWqGMri2VSBCF5Zn9oPHxhfk=
X-Gm-Gg: Acq92OEIgesHoVo8TJJ2AVPtrIoxzxX/aQNGWxOfRhOjHH3xNcEbXKVrCwDwP2m8H/e
 dYpj7K/8T2P3fX3kXM1mJtufMi1E8jRVsopREBXH3jhLcRJR2j14dFr6Ibi9AbfCKtGyOPO+TQd
 uniB+Oxwe0IrfShB2WQ7H7mrDTvdhmjBD9HoXoLEK6iiFtAbIifiwJirJfiUNxY3s9TJshNwy0r
 HRFMoYkp71BBaBaJxENBTKwhgr7SjLO4a2Z+fQAkWTQscNjWRbgWb6grvjAqMTeCgx35zHcDV/y
 /MnuVSr+Uvwl1oVfdFuXJl3uhx7vlxFM9LJo76ITeL/Kgj9Nu5bOqSLdaonGACC1HniDRS70Sbq
 6PC0nHdnPkQ5s8TWFYnZ0c412iI2Y+JesCm3sYXCF6v3ixl9E7ycdL/QJtHOQRpCPdaU4EaY9GA
 aPt85bzaOB306dfO36
X-Received: by 2002:a05:7022:6898:b0:133:3c47:932e with SMTP id
 a92af1059eb24-13806731c39mr10893208c88.28.1781041689862; 
 Tue, 09 Jun 2026 14:48:09 -0700 (PDT)
X-Received: by 2002:a05:7022:6898:b0:133:3c47:932e with SMTP id
 a92af1059eb24-13806731c39mr10893186c88.28.1781041689317; 
 Tue, 09 Jun 2026 14:48:09 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:08 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 16/27] tests/tcg/meson.build: introduce expected_output
Date: Tue,  9 Jun 2026 14:47:34 -0700
Message-ID: <20260609214745.772536-17-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfX+GeBLngUpHh8
 za6uiFtvyRydFk2fsKhTPL0FTofpkAbaiWlNZ06PGAZgmgMqHB1CoZqn0ichYJ6HAn6jsOB3Eoy
 Rv4bMm4ciS/bgkzuD1b8q0LqcNOCD168TAsfCxJFjJCoBgOVO/el6BIBE7QE4i2JvpL09bWrF16
 BVTSb3UZ3F3mcrgoFxb7tZR22kvDVpyVk7p3J0yBmYebIeZENgEYGu3pnvKPx27Jz2Ck0eNsXqP
 3QQrys3zGHmRZ/fzOCqOEPFIKGZcnrYsbF6pAcqYPz5pkgV++s4xegGNZ3FYx+mQTmhd2END5AB
 7bqG3uirRR/fVMZ/CgNAdLEyBwrYhNGIZCROes6+r45KE4K/zVMrsJBmyGxW9y7P1qLApAzJitZ
 cpoTGocqpKTDagCnEksuqacIR8SEO7SQefVE1Z6pL3B6hMz3FpNnjFFqP6FrKqGn/Ka4ZVE78eF
 str3jYEv7shRN94Re6g==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a1a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SiMjXmYFN9jqeZmQACUA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: E24zWQrVleKx0r1hAraSaArXgxqdeKLq
X-Proofpoint-ORIG-GUID: E24zWQrVleKx0r1hAraSaArXgxqdeKLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090205
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

A test can declare it expects a specific output on stdout. In this case,
we compare it to a reference file. We implement this instead of relying
on a wrapper because we need the flexibility to resolve name of
reference file per target.

For instance, multiarch float tests expect different ref files for each
target, which is something we can't express with a test wrapper.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build             |  9 ++++++++-
 tests/tcg/scripts/run_and_diff.sh | 12 ++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100755 tests/tcg/scripts/run_and_diff.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 5380a360830..3d2c0d6583b 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -7,6 +7,7 @@ if config_host.has_key('GDB')
 endif
 gdb = find_program(gdb_progs, required: false)
 prog_gdb_test = find_program('../guest-debug/run-test.py')
+prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
 
 tcg_tests = {}
 # tcg_tests is a dictionary with following structure:
@@ -24,6 +25,7 @@ tcg_tests = {}
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['cflags to compile test', ...],
 #           'qemu_args': ['qemu command line flags', ...],
+#           'expected_output': 'file_to_compare_output',
 #           'gdb_test': ['gdb test args'],
 #           'env_var': ['VAR=value', ...],
 #           'wrapper': [program_to_launch_test, 'args'...],
@@ -84,7 +86,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user mispell a setup entry
       foreach key, _ : setup
-        if key not in ['cflags', 'qemu_args', 'gdb_test',
+        if key not in ['cflags', 'qemu_args', 'expected_output', 'gdb_test',
                        'exe_name', 'test_name', 'env_var', 'plugin_test',
                        'wrapper']
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
@@ -197,6 +199,11 @@ foreach target, plan: tcg_tests
               ]
       endif
 
+      if 'expected_output' in setup
+        expected = files(folder / setup['expected_output'])
+        cmd = [prog_run_and_diff, expected, cmd]
+      endif
+
       if 'wrapper' in setup
         cmd = [setup['wrapper'], cmd]
       endif
diff --git a/tests/tcg/scripts/run_and_diff.sh b/tests/tcg/scripts/run_and_diff.sh
new file mode 100755
index 00000000000..d1e9243c49d
--- /dev/null
+++ b/tests/tcg/scripts/run_and_diff.sh
@@ -0,0 +1,12 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+set -euo pipefail
+
+if [ $# -lt 2 ]; then
+    echo "run_and_diff: expected_output_file cmd [args]..." 1>&2
+    exit 1
+fi
+expected="$1";shift
+set -x
+diff <("$@") $expected
-- 
2.43.0


