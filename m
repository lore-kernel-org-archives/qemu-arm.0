Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9178C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:41:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9X-0003e9-AE; Fri, 26 Jun 2026 19:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9U-0003bT-Rk
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9S-00044A-E6
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:04 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxh9X2793983
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ykn+UxFYzaI
 cm4JojODWoHiH8caM2oi2zePrssmLLNE=; b=Qf3dQp6EY9oTYoNW8vJXRU6dmt+
 2en8+XV18zRS0Pnu/XFy2JTUEsRiNqj/YWJRREbrFWVVRdHe1DbMKfP4g5iC7Xt2
 Fju8o7a9cd4WO2Isv9TsM3bwabkwA/dbhVOELWPjCfXwzO3s209DKPz7GBbTi4HO
 nbiAJM7OKHekeq1tZ7XcoMsXzrgvg6YofEQjwKJdqmSBZGyUejRUkXt+mnUxrfTB
 6nyOGPJBwIAkb6fwpBE8O7JyYVj7K/hQCCoXJB1aBBKFTAwF5w7ZEnFboOBQfNVp
 ZImAqMwafGLJsLGJ7KtQ6ZJGQZiSXFqRPfzbjtDu6cj9y8eNZ3PP5r25H/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1tc3hyuf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30cb5001ed8so248011eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517190; x=1783121990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykn+UxFYzaIcm4JojODWoHiH8caM2oi2zePrssmLLNE=;
 b=deDl8uL5Ez99vGEARAw0pxcybV5YgXUB20T8dfs7Jb7O1FsYNa9xJLO0Igl/FUn+qW
 yoHozR4KU481tfCkUu1n3oVnGmh7a03ySzhhBd+JYSXWZbxFk41QSr8N8dPuxfoDEIj0
 6P4zch8vNHMEAPpCNqwoLTzeC+n6t7/XNCihaIj032fMxfHtf3C9o+hqejyeGHD7n0hM
 H2o/RJisANCBlVKGklq05cICSsJ8SyPxN8Lgo0W3Cr7ZGxV7BXR5EpuulLAXfOBfuibm
 ttV30FtRDvdE3Qus22hDdh3yHRDqTgpDM/7pZenX1Yysm7/d1ep5UjI/4tVKV5Wo9J0B
 lAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517190; x=1783121990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ykn+UxFYzaIcm4JojODWoHiH8caM2oi2zePrssmLLNE=;
 b=J579gTGQjJq3f2r/OZgBO0H8/mZOjsSa78IDhFU7q/ufBWk9s+bNVxivZBuw+SYoKR
 w8/gz/PE5SgUaDorFfLr8XV7rez1V/0rwGiclMR529yBJaT4TijqHcXZdLz3Q8rDxY+W
 OQDhIQkizgs8X1v2S54i/YZRdhZvx0/dm2LQsWexEdhUzVnJ28BDMWRG7VLapAGN6MxW
 P4BZzhTxl3qLKOnYsIv1M/S+tQBnO9rgzA4TKT+KCdIvFybd4XfVXiPLrCRdiVLLPnuQ
 dW/l//MlOKzSlW7Rm7bOduebU2TAcmu1BLvJE6oB53mFb5t8d+totwrDBlkTSfzobfZ7
 UUSA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOwVpJX/l7B/2VYoT+q6UjMpCuUdf1rifUyg2W0LaM3n65Qx/ZrG2hsunD3cMNb/xaywRBcjA8Eg==@nongnu.org
X-Gm-Message-State: AOJu0Yxp8EY+SPCkidV/n62zv5y+Ic2mtJW46nhzXIAgtRu7BlAENqEv
 J8TRy6191+RDnRDrFL+xiB2+EDz/SYYQeMuH1VA5xrYzYi+5zcqyvUavpuh5NwwSrgfU12LA1os
 W/F3+6aPAIZbEb5Q5nkDXIRGv1wcohnrdpMROgnwuQ4/zJPpn4q8Vc/Y3QAtcnzU=
X-Gm-Gg: AfdE7cl3zRxL0BTEhWEetXXUb9GFJUw6Oxg01MaYYxAiLvCYvV4DSNrgSMV3WRwU9Bp
 +8Xs7rzldO0uGeMJzpOeGSb5bzEEqLxOXAV8QZX+33xEpOHHcx09pUO/JG56xENNBGCPZtUG4Re
 V0IiQ7cB4RQIbMqCbIQ/5uveEQ4IPi4nP3wW0oaia2aTUlciHyuDbcSEeqn68qw+PvZ+IcrbclZ
 x3GNLZEkdtn5ZerGPSuCKQxzBH1ewpTdj3w2YzEX1BaQdEVW3jchXIvHYbHQkBa/GdMFemJuAn4
 ZoKErzOXzXEaehOJXyC2cyg8m49fmSxWSL+nOxaWOGRmwXE/OykU6oDmI+E91IpaUIcEIElGzuC
 FsSBrtckPmt7cELxwJDMutSmX6l/DF3uwwBiZ0jq9D6sYBOrv4Eusi3epafgjCXuQX5gXRYt6He
 FEwxLl3w==
X-Received: by 2002:a05:7301:9e41:b0:30c:472a:248 with SMTP id
 5a478bee46e88-30c84df9c55mr7095979eec.32.1782517190440; 
 Fri, 26 Jun 2026 16:39:50 -0700 (PDT)
X-Received: by 2002:a05:7301:9e41:b0:30c:472a:248 with SMTP id
 5a478bee46e88-30c84df9c55mr7095958eec.32.1782517189944; 
 Fri, 26 Jun 2026 16:39:49 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:49 -0700 (PDT)
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
Subject: [PATCH v2 19/37] tests/tcg/meson.build: add wrapper record_replay
Date: Fri, 26 Jun 2026 16:39:00 -0700
Message-ID: <20260626233918.158740-20-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: z-OxzH_PaOdasLVdN8G0qd7unkZ6VrZa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXx9LYwqAYL2sv
 1Gz0RBI/QcPvUGpzdQ54yhGdCfo/mhCPDmN947Ck6O0I68TzLee2hs+mKJP9RZrkbM/l7Yb3Gc5
 EN6QXxSLh4l6Fr6gPWDkEIytzZqnNLU=
X-Proofpoint-ORIG-GUID: z-OxzH_PaOdasLVdN8G0qd7unkZ6VrZa
X-Authority-Analysis: v=2.4 cv=T4m8ifKQ c=1 sm=1 tr=0 ts=6a3f0dc7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=B0LFpWwdb5_kycexZfEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX/Ow8VRvyYC4C
 j49mQpaym+nfbncB4Mk7Lq8e7wXBa/1dCluq3nLvwD8fg0cX6dNDRy79hyERzk1D0K2cjwUIZBG
 90hUqw1NwuS303IeZhB8fQ4f52BbjZ/rZWXkSzpX15BLLPveiwvGLvIhSd+x9syJYMsgYd8ky8c
 PKOGMtMnwT/8FRDNfJWxk6GHzblKpqfIZtGjiTIYGbZLLOh9Joo40mMA6yHZ77NT5q0jG6Slyzg
 ovPErQcpDHKFMYuqqNrooqRATjbOd27HIEsx6K0LIScUyGzZxoQXIgVbZDkooIkF1EP7Ij9t7JL
 0AuH7mHKbDgZhsTXlYBlpK6HvvQQGnbayWiWke093p4E9LCgHTaA1GHbhR5iKqXOmK42EnNr4Fj
 wXknnde1qP+jUopHkdHJWxBcHK5EfTcB/pvOW7P3l/Nxi5y70qryRAEmwSnAZqhqLCeKl6nmeSC
 JWnhc8uik1jNaqLwGNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260197
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

Runs a record and replay test, and make sure the output produced by
both runs is the same.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build              |  1 +
 tests/tcg/scripts/record_replay.sh | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100755 tests/tcg/scripts/record_replay.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 0e6546668c9..1d08db5cd3c 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -7,6 +7,7 @@ if config_host.has_key('GDB')
 endif
 gdb = find_program(gdb_progs, required: false)
 prog_gdb_test = find_program('../guest-debug/run-test.py')
+prog_record_replay = find_program('./scripts/record_replay.sh')
 prog_run_and_diff = find_program('./scripts/run_and_diff.sh')
 prog_run_with_input = find_program('./scripts/run_with_input.sh')
 prog_run_and_check_forbidden_output = find_program(
diff --git a/tests/tcg/scripts/record_replay.sh b/tests/tcg/scripts/record_replay.sh
new file mode 100755
index 00000000000..57775a2d4c1
--- /dev/null
+++ b/tests/tcg/scripts/record_replay.sh
@@ -0,0 +1,16 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+set -euo pipefail
+
+if [ $# -lt 2 ]; then
+    echo "record_replay: qemu_bin [args]..." 1>&2
+    exit 1
+fi
+qemu="$1";shift
+tmp=$(mktemp -d)
+trap "rm -rf $tmp" EXIT
+set -x
+$qemu -icount shift=5,rr=record,rrfile=$tmp/rr.bin "$@" |& tee $tmp/record
+$qemu -icount shift=5,rr=replay,rrfile=$tmp/rr.bin "$@" |& tee $tmp/replay
+diff $tmp/record $tmp/replay
-- 
2.47.3


