Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D20C43602
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9V-0003bt-5G; Fri, 26 Jun 2026 19:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9T-0003aI-CU
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9R-00043r-KW
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:03 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMx8JW2165211
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=cZoPr+343cB
 /jYeaHXbTMOT7ZSVJo9VCbsO6f4nij9Q=; b=QVccBKm6FkCFGg8LaSgiuC8Akpu
 QJVbFUMCTd0v8T9ZC0UNFEQ25wVSLHVUGFyYXNOgV/gWc/TBiIeenIAG9DBkkaY5
 B3oSrMXuFh+qhIh8pq2OAve0Nnco/4PFqeEhQPYKdDc55yI3odRLB1tiQltoZgDn
 B6UREQpOdmHRuBAVPb0QcEfp9aLHn/cOLNy7Hivyd0/4R2Iyb4DPHvMO1cGCxL5V
 fcmvrJfvYCGOgJLeLpGXYqGR+/R8FrMHrhzF9bqCuInWlDrNR+XYmxaYhqEvY+Dy
 JhzOC1Twb2y5xrxgK3n5T6z/K8GqcoNQYtvqQcHYhOrDws1fxywd4otx2wg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdvkqc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c1f6c5559so1699001eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517189; x=1783121989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZoPr+343cB/jYeaHXbTMOT7ZSVJo9VCbsO6f4nij9Q=;
 b=E86F0CI8llbgigIT6Xp47MMg0o7SApLaFXjVCg7NyE9ClAU6KVJ/Trxk/K6oTAqg3J
 AgGBHcQjauN1jcBWVA3WexfqHK6tAIKCSGWMISBie+/zhZ8UJuQIblP5cNbik9TMVsrc
 hwFygwnzRWn5Pa5JBuDpY/ae9PSqFePlC/JAGwf17d2vUYscp1+LxzixdHPf7ddIV8mX
 Ru5phZsKTvnIg/jB5lz/gmwyy0MyCmhqIa6Yo4SZT0RAN/BSBbNjwPI7LGWTSZ8d3PW0
 Du4lwcWXE6+EUf2+ktEHNXufkk73mDFvPyOqSdYqRKmKGgiSqeJQLG/Zjs4HnaGqFCS/
 0y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517189; x=1783121989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cZoPr+343cB/jYeaHXbTMOT7ZSVJo9VCbsO6f4nij9Q=;
 b=rc5V82n1fcizKz2e32ADzuGiLXZXHJty9QCZfha1hn9B1YJfXqPht6XyBlMd8fU93l
 yEGmnPrMeQSAH26z5yPyYsZiR4cD9Ce4Zaa7eOx7OCrtrz+SiKstlSnXMKwnMbzGac4J
 tUT72vixKzxnEl8B0hXH46Ky5or+rtnkgfE/ooUf2Jaa46FYiqVfhQHzuA8XlfMGdhkx
 5ACn8N06nx6v4/+QLWhjVpMGfXbnhtTr4ojOtO8bpkQ2fSZtDrdu/HMJeKrDN44umBTX
 5ijNIa3eZuOU8j1Or0lS/4dXBxvRry8rgF3B8MQX/tLygkFjilpfD4dV5XFZYn9iNEpy
 W3hw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOVn8EnEffwogr6lkJKHGJXpEWfNjEolWzPN3HaYKS/Po8AeFqPs5+8i2oZOuI5rFzOnufUQ5Lrw==@nongnu.org
X-Gm-Message-State: AOJu0YxCbnZkAsdnI2uUXC3f3GpphtoPq3az9bPugtc3IoLWB2Vljvlz
 1RQeR97vnbV3MlmDiLgWLrWZ+x+1SiM0WLqcm/cTLs0+u3wdpD9C/vPfYa7gYlBnLFU0+cYBRF/
 TWJwfdqEmBATEIqZFnbjwVb/3oAkrFttdzAJg2y5Za+k9+yvUvbxCq6sjDNNQQ18=
X-Gm-Gg: AfdE7cnsZffxRRM5XJ8+RWlxBPBY2t7rqbH+NG+toT4LI8s2b994cTzFQbW5XHDXbtr
 tGzO7UZCMipE3dkUVRMLhdcDUAhdWnVFxpF9tuglunn6wSIMjZbnnjjmstmMizcox6wF5oUcLE5
 qSoTrYxC2I/7MphafIjKWjhxDXsnYFbYDCRG0ypKhR0zVonCroONx5g9ZpQosgfGFj7pw0ydWD6
 yyN9yGThrdx3rj+KzDzgiIx+HnIXQZRfaEQXqzcZRYxX8XB5LPIVUn/aDBzI08Ss/1II1SrduG6
 Dy9vAxYdn2JJYK4J40Kq6MI+La8lekHqZHO2M9q47SmSuCe1+Ably7rdbl1rSU+ZBaV3VdXrvfZ
 O+HUFJ96mOjx4gDMzVPEyx1+eOYDwF8vggP2JWx59Sh1lrhtsg6ueTYWIePcEP5nBRsKuWNe3Z6
 R5lFzGVg==
X-Received: by 2002:a05:7301:9f13:b0:307:393a:8f1d with SMTP id
 5a478bee46e88-30c84b9bddemr8290507eec.14.1782517189088; 
 Fri, 26 Jun 2026 16:39:49 -0700 (PDT)
X-Received: by 2002:a05:7301:9f13:b0:307:393a:8f1d with SMTP id
 5a478bee46e88-30c84b9bddemr8290476eec.14.1782517188549; 
 Fri, 26 Jun 2026 16:39:48 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:48 -0700 (PDT)
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
Subject: [PATCH v2 18/37] tests/tcg/meson.build: add wrapper run_with_input
Date: Fri, 26 Jun 2026 16:38:59 -0700
Message-ID: <20260626233918.158740-19-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3f0dc5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xR2A3ow12ysiLA1IkLQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX3QDfof3/c51e
 HrP6OLWGpewjEvx2RZsFubZT3L8hP2iEIf1h3+KNFvD7/qbmdATGcUbh5fe9QFux69/jFKtlsgf
 2LBkcW2UP1Va24g63Mdoh7DKK5VlUfJRFhp4bRmZbTCunpGstBCjNKeHD+8PQfxn0PBoUQi+gJM
 oEHgachVPEk3taYICWuqglYzTM4IrP8qm3/HpKjeklAxv44oLQWdxeYfNVQ9NJwKEmbTRrP+5Ea
 9aKGgWT93Csj8ZB7PnPRyCQ0cb2pmWZrodhCtG72kpWvVNexVJ957hoHztAHGat71hzTLkgXASQ
 bCXvmgj9aS4Yv/IgW0pZYikSWqOXX3Xrg9p0+iXE5d7Hri9IOCUFCujlpmPIC7tW/ansbHtkDs7
 Zcd9NN1LCVlysic0fpP8tD17oQBeZxIbUFTw4L4yEDG4w1G3uehOvJ00tAe6zMIPNlwWNkMaK5m
 wjWJ2sCsL/WWaFHtyDQ==
X-Proofpoint-ORIG-GUID: taihbMD8HsZoiz_AkKGgRZDeu2_5EYOL
X-Proofpoint-GUID: taihbMD8HsZoiz_AkKGgRZDeu2_5EYOL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXxdHvHEw1Imj0
 wt0A34pHKsuvMSdjYdjYjlyvrdyiUF/9PqM+qyVTkb8eqZMA3A3gxEC8OJb7P92V2TwElLdaqz7
 Jjz5Dod1bq+kCSYxaS2r6GsDiOJpCMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
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

Semihosting console tests require console interaction, and were flagged
as manual because of this. This wrapper automates interaction, by
sending a specific string on stdin.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build               |  1 +
 tests/tcg/scripts/run_with_input.sh | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100755 tests/tcg/scripts/run_with_input.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 130f8a83c54..0e6546668c9 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -8,6 +8,7 @@ endif
 gdb = find_program(gdb_progs, required: false)
 prog_gdb_test = find_program('../guest-debug/run-test.py')
 prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
+prog_run_with_input = find_program('./scripts/run_with_input.sh')
 prog_run_and_check_forbidden_output = find_program(
   './scripts/run_and_check_forbidden_output.sh'
 )
diff --git a/tests/tcg/scripts/run_with_input.sh b/tests/tcg/scripts/run_with_input.sh
new file mode 100755
index 00000000000..3d280547c3a
--- /dev/null
+++ b/tests/tcg/scripts/run_with_input.sh
@@ -0,0 +1,12 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+set -euo pipefail
+
+if [ $# -lt 2 ]; then
+    echo "run_with_input: input_string cmd [args]..." 1>&2
+    exit 1
+fi
+input="$1";shift
+set -x
+echo "$input" | "$@"
-- 
2.47.3


