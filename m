Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1DBC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:41:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9k-0004N3-Bk; Fri, 26 Jun 2026 19:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9g-000460-VE
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9e-00049n-Ve
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:16 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxpLw2794189
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xRGWgjcmxxW
 mhPzEdMdtz2o4wlC3qDxpEEhiYzASCrI=; b=pRjas55xr7fMHfB/sc99U9h/58T
 o+YB0cKSEpugxrsP+mpyeWb78uxRbHRomD4xOvy063GH0YgWGaUWoW6YuHSIJAU3
 Ol3q/D916sw3Md/k8gPhKn1x3H13ArlAZJeQ1PLL3P8DPdsfnYdy30jgzCXSZwhG
 D7B8s4MouPAka7NC4tQmSrtErhh0iABN+3cizh/hcOl27TsRIfsprHf73AQXanah
 VleCU3+mIvszstUFEXko3m4HnluW8OZbS2emQSuLPtLlLVZU/Sfn+BMj3T+gHreq
 sprAE8GYVUhxSajFqKW9oZFETM4eHtkhfABG6KWXO2ZR4NWzHzrHepwcA+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1tc3hyv7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c0a27ad86so661458eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517203; x=1783122003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRGWgjcmxxWmhPzEdMdtz2o4wlC3qDxpEEhiYzASCrI=;
 b=LjlT4HWCdHbzU74/o3TpQBfhrR5WqN1u19AWmwce1umXk0Z6Y4z55jAnmQI95HE3x/
 SWpYTsPY0DUCWHmVxgDSCwPeFzLllzOitPGuThff+35LRxd2SNnt+1WyRsCu63fux7BE
 qeVG6U6XZFPb315qqIqyeB1HvarPTYAtcQKRw+7EYTOOiJ3wTJHw+YGCLUhYFq3txhFv
 QlQJ6mfVlTKbN++RmsCQ5S7U1iNUceELJ9SBykeesRCY+JYMdB2r+GOVedRe1Lje3dyq
 C5NnGJFpeWatNepSuxHZ0PcqIE/LRHLyVDm8AXCaRW7HDk3Ekz7gHd4yrO86nvDQQtUm
 Zveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517203; x=1783122003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xRGWgjcmxxWmhPzEdMdtz2o4wlC3qDxpEEhiYzASCrI=;
 b=M8kgY1pJAmQqKJlsvjJbQ5ZDUasMLT2+MTyL9+q0DpfuL46OUOoc3ZakkIIkHlYxFg
 R0+sMnTaR44a0E1QyvFu/jVvPKspOLItg6wm6EoPdUUgdcSxggO1YlJHVrk3ECrOtaM0
 EVFAkzUgdMf2/ulWHn4zsHGNUHriMq8bEL+FeU0UaK0+BYwZcwQK8IDPqvjLpA5DZ/QB
 cqo1pybO/DsYGcNA8t8eWLf+Awg8nApy0MRan1GfinkVmX5/ZKHgmb6xwyePC7QUhP7y
 tdpYA6Mc/1hHs0hKyTqZHmdBfHskXna2Aa6ZhaLAvrp5iYm8mU1mal6nOG1GELu52BO/
 GTOw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqWtjc6raHAJUuNB5o65DuqYu65inEbdb7R0Ucd043EUsdxdUYKCmz3diTAv2LlZolPrYflIsbfag==@nongnu.org
X-Gm-Message-State: AOJu0Yyfy5SwMAsRU0FTCSRjWzJlQcRX+zoDK3oIoKLoSLaE3F7ERNp/
 jxq7KMvrxttrkzJ2mgvhhLxwAvNqKs+nfTBQ3egmS2s8t3NLCHPHpiIqoQgiQUegRnSznr1EGhN
 JDd44OmFmW/kJvNQQtUzkosIG2yOrsWqLRbV9BTxP8lA5c0U2KaGGaswG0Ud/cOA=
X-Gm-Gg: AfdE7cmt3Id99vIGlr2WF13HZpEsYG1Tlwwb+3rTIhDceGmc2DvOuARnLurE5hJwHNw
 VisVhgF8mS/qlOzMcOKsRXvPe9cD1W6rl4UiJ0uoouxNdjn0VS0Hv1YfhKdLrNbYNf7+ZnVaBF+
 4GtJbIvGHOs//47e5OpoZUhFpIOhoW1dVpKHOtPg0M6CjB+3LJT/NSrE0cfs5HmeL9CLKIcYuAE
 s9oCJi32diKUzNGe/z2c4wb24Er/0TH23fV1XbbFvX48llMrHkhLhyqPLuLtfJWCO5LxWqDKtO6
 EOcgLv7TRIdqa1lbO+wK1NER3cD9HpwveIGLKItHIO4MFuAX/nNRwJH/Gm2E7GJ0b1KMrJLQkn8
 /UBzMR0jMiGxTHcYXObhTmxitq9rdU34hBG0ze/xiqAsNy8npnd287ZiZRl5JFoasbmRcqkvwaC
 AX1nQyPw==
X-Received: by 2002:a05:7300:430f:b0:30c:5ebf:63c9 with SMTP id
 5a478bee46e88-30c84d9ba29mr8946477eec.5.1782517202974; 
 Fri, 26 Jun 2026 16:40:02 -0700 (PDT)
X-Received: by 2002:a05:7300:430f:b0:30c:5ebf:63c9 with SMTP id
 5a478bee46e88-30c84d9ba29mr8946442eec.5.1782517202374; 
 Fri, 26 Jun 2026 16:40:02 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:40:01 -0700 (PDT)
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
Subject: [PATCH v2 28/37] tests/tcg/meson.build: add logic to skip tests
Date: Fri, 26 Jun 2026 16:39:09 -0700
Message-ID: <20260626233918.158740-29-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zEqrP1mQjLdcaDhfE8_dMBwyL5NfF_8c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX+CubLvnL15pH
 WqNElqPHrEb72GMzX5ZiiAxXTdmYzjsIlB1x6MIPSWiunt5hFIi/OTQl0+B448y9Vh+pCxqZT2E
 PgAgyFxmqhu+FGYyy9VXT1ZVuLD8NR4=
X-Proofpoint-ORIG-GUID: zEqrP1mQjLdcaDhfE8_dMBwyL5NfF_8c
X-Authority-Analysis: v=2.4 cv=T4m8ifKQ c=1 sm=1 tr=0 ts=6a3f0dd3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Yg2_v1zmUQqHFUBEWrgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX3PTAy5bm1w29
 FHYJkehX6nGPWUpwOGVfsTiK6XhKEV5AbZCAYue/5hf7mToyWC88n/+OLrm2d9avwJLfJvjctTR
 clfX9zTl/EecLT1dMF85CUvJEwatLkMlVhiSdGEXe6UcqHjjkfZf29KFc5z6fmw9KafPJjz4Gkp
 D1XDBjtDfF27iSURibnN2FwluJiJI0umQHUhDa7TeVxfqhlQW+W1be+bWC2SypkHujBaTG+JGCQ
 Or22AmlaImOd+vuL0h/brjFqooHH9xG9FFTUg1z57G3IfvZ9znAzuHlNl5d/O8ZJOlyt6pJjAzr
 Nnb2kmfVFYe8m3Nlntz62aJF4RApjPmWTYtg92WNhNxHvQkcNI4y0Ivus2fMq3y6MF0fzRkyPDt
 y+hVK/UGVExhSxck0xNVK8whNtwLQ4Vf/oCAvaJaAp8AWYfxmswSMxwfvJ7smbaQ+5bZCj5QjD1
 eTzT4wzJbdbbhNaxhjw==
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

Instead of skipping tests and not declare them, always declare them and
simply return an exit code 77 (SKIPPED for meson) and print reason why
test is skipped.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 0f0a2b578af..17996561798 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -161,11 +161,15 @@ foreach target, plan: tcg_tests
         endforeach
       endif
 
+      # if set, we'll skip test and print the reason
+      skip_test = ''
+
       if 'gdb_test' in setup and gdb_arch not in gdb_arch_supported
         continue
       endif
 
       if 'plugin_test' in setup and not get_option('plugins')
+        # do not use the skip_test logic, and simply ignore the test
         continue
       endif
 
@@ -273,6 +277,11 @@ foreach target, plan: tcg_tests
         cmd = [setup['env_var'], cmd]
       endif
 
+      if skip_test != ''
+        # still declare test, but skip it and print reason
+        cmd = ['sh', '-c', 'echo "' + skip_test + '" && exit 77']
+      endif
+
       test(test_name, env, args: cmd,
            depends: depends,
            suite: ['tcg', 'tcg-' + target])
-- 
2.47.3


