Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF98FCD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:52:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JL-00079A-CB; Tue, 09 Jun 2026 17:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JD-0006xI-EN
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J7-0008D1-9M
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:31 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K57si3231126
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eYH4V0CzIEe
 VpXJVnPZp7TO1QlnGAy5uVHmPTMef5SI=; b=CzeFlylXL3fcR1Ylrw0QdxKi/fC
 e1ugqiXsmD2tp5Sel71gc2GSh+FUCa+gtrIvbgkscmd034OlnQJm/tK8tUke9Hzq
 buOdtKFNThJqW19TTTaVemSN8klYs2GiE038TobvNTuuNAidUalkP3KlPdGY8yku
 6lr66oVvybfY3eYxn3XpK2Q4PknpP4OYvFt8qQnhhASqNfKecw3wu4lZAwLZJ8Xl
 ZVRIYsvQcEbrlsXYgBPPSKBfVgtKnh5mCPH5NFvUrydzSiJacQWD9rVaBHV7QVbD
 dGb6+4UZubAOUkeyREmj2FsHeyV7M+o1wzoh6T0wDmNxq/TUJB8/4UX0jjg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg2r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-137fe4a3640so8866033c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041693; x=1781646493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYH4V0CzIEeVpXJVnPZp7TO1QlnGAy5uVHmPTMef5SI=;
 b=hUTFg9UhI1dHTtdckK4WMG947JxPHmrbNo2dIOwyhgjfMFzi2MuqGdARM7l9psEW5V
 5/lApeyfilfgkCe1iI5lfHjO5DDsnYsamPCwSpSSla7/qbPHlbjeB8oWQ/fAr4LkItDW
 pQYyk+ROPlE2AyBaQcLi0IiXJrCHu0eGEG2QhTvTGcernSN2A+Ekn9hb5vV7B637ZIXI
 aE/ApDjWO8wRU9+frynRDC6Qeo2cL+9zIdlQSdavJQ8VItCfB4354RDvrgaW0TmbS108
 X7b86cVpZ2trvZ0VVtEKAePhPE/TJCMAH3kg+3Sq/KOhaPagOEreaDD6dMK7t4xt/N0s
 J16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041693; x=1781646493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eYH4V0CzIEeVpXJVnPZp7TO1QlnGAy5uVHmPTMef5SI=;
 b=PDwY3jcYD8zPvIud2hnlfKwiZWsfhBTniwfmpjL1DXBBb9JiD3SlRqrrQfrDr3cYGd
 9v5TvzZAK52zchFx8/XQW3oA7l9yl4OSJGSc0VMQ/DrBQHOrQWgHpsOCSmfBCwT7e+Na
 ERl2C7OxE7koOtBFCj04TpdzmyWpL4tlMNVeT6PJovlLfRIEEsnJOb0ZUK39+gtl0Ov5
 46euj1sRkjpKH9w/UgCYG8s6uFL8XhL8z536kLh8RmuuWGRhcZrtkIqxJn63ToSExw/B
 gkncCYdn8pEAbXy7hc0t0UAZN9RYIwby7/1rINgGApbHoyore2LL11EypH2/vxiFaInK
 ys4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/y3pwJkS3vwNnSIrdNzx2cn5TQYcrsKWNLnC1TrOJkVJSejuIvucLCkhzzWDmIMIWxLkFWKCYuYQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy/ocRPpMw0THZgyxAQTarMoRYMhoYqJN3+ogBZA2a9NLfILWLV
 4wWRl3HwmkJ7EQCxbao97EM9aYqbq2gRISYcKGkzlfNIccQqUz3nKw894Dbfun5o644zatutYxh
 8KVjWOv/a5lLrqRPiESg4pF+U+buuG3q6f+jXLx1SzORuS6dPhrRERW8=
X-Gm-Gg: Acq92OG5NRmqfn4irO2iWtap4GDHxK8ACecVcmgc34MUrLZuYo27Z3VY6IIk9UGhYJy
 uqQvUYq17Baz9hw9vIqnLb07IgXKcu1oooavPfs0mTVhI4Y4WmL4j2UNGT8MVhD9LeICIFzWowK
 wQKytx5HlHdE0neycWDOymG4WFqY74jzR0/ZIAWFPob5HenOvfBDmYZp9oEh1/n4hf8a8tSiLza
 knY1jzcmznhOG1gKcfSKtRZu0D4HFUoAnt7IUN+x6kfuK697jwoTmRdOgzr88kYwmf5Vvy8JBhk
 9M26rwpznhmckfUnl2FeEljxaOgogrqFuYfK1kvHVJvabH57mQr7i9xd3VLAF49NqgCnl4wnG/r
 iKhCbisp+qMvI+iQu66YgnQQuVr/Ct5OwE0Iac61BlLcAgKtQK5sS5MsV1bWSPk4Q3N0uIBvXlo
 FkmlL5DsZcn9I2mDdG
X-Received: by 2002:a05:7022:111:b0:137:f0a7:beb0 with SMTP id
 a92af1059eb24-13806713868mr12796669c88.20.1781041693042; 
 Tue, 09 Jun 2026 14:48:13 -0700 (PDT)
X-Received: by 2002:a05:7022:111:b0:137:f0a7:beb0 with SMTP id
 a92af1059eb24-13806713868mr12796651c88.20.1781041692523; 
 Tue, 09 Jun 2026 14:48:12 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:11 -0700 (PDT)
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
Subject: [PATCH 19/27] tests/tcg/meson.build: add wrapper record_replay
Date: Tue,  9 Jun 2026 14:47:37 -0700
Message-ID: <20260609214745.772536-20-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfX9TNfNndfxzIo
 ikhHEjglMHkXWFRObE1nTMVXZhG1UpaHckkqh/ugfOa4dk9bsSL35LRqLFmEy3x+aHamDrH9Ydf
 BjNDSOXJq2N2zH3mD/5XJE6Q3gCBmbvV1PJb2QIbIJxnoEHz0BdkL3jvNqv3n0aisC+VBVyxZ4J
 /lSkBNFoUy1uOPZpkYcKt3nfdgpmjnasJ+ttpEJJPn9NB2jQbgXPJKzVoT7ck+sPwC1IR1T4lRm
 gidESlPshYb9ZnH6qMPFvJGceHGe/6TYGc3tXsZrNYVZD0YFZeBqgFeuRxvMKB2ARbkIU4NbNOs
 jGmkcbhmGVbgTxciA85f7Aaz5F7uJeV4zhC6OnHKIERKkXHA7IQ91/J289hKtQzpafQu575f7nG
 TYrEpYWL9BZU2yG+XikTBI75CJHHH1eMeExRDXW9Ab5rHnlU2Nfi9emiCDZR6nzDA1BMb8X2L5l
 br1jc64S9eOyZXorX9Q==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a1d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=B0LFpWwdb5_kycexZfEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: qJapd_rG3MbvXguYYSCPxgCDx4sUqtXv
X-Proofpoint-ORIG-GUID: qJapd_rG3MbvXguYYSCPxgCDx4sUqtXv
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

Runs a record and replay test, and make sure the output produced by
both runs is the same.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build              |  1 +
 tests/tcg/scripts/record_replay.sh | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100755 tests/tcg/scripts/record_replay.sh

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 7201a7809e1..f0efd46ee3e 100644
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
2.43.0


