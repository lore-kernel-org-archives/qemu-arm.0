Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA5BC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9E-0003T1-DF; Fri, 26 Jun 2026 19:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9A-0003Qs-Rl
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG97-00040r-N3
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:44 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwqbZ2744997
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=D17DQMd9Qan
 0fIf/b1TuIn+7shy7BCT4D0Np+Oqpwjc=; b=pjTqOKFNgw+4TXakt0724K/W9hh
 xzEQ45wlQqE60sVUoRcRg3tLjuDNq3DH491d13YM8v+2jEV7nmU8Du0c3gM58NuX
 9NnAQeG9QcaavPzFs8tykUSPBs0qqxL/H1uMeSeV5aUVu+jGgizYtoUGammOSE0L
 6yPQKBJjc1M+g5SBA/M1pKCycn2gc5e1Kl8wrARcU4vapTMzNl/zQCBeD4tvXjQJ
 vJi2zN9gjcLk36SIZLKPr5mr2o2T8YFespCGEynBpnAENA1tlKpAqtYq9O3Pxp+V
 NhFI+RSzzliv0ZZy2FuvdAi34LZ+eqEFqwstwbROtam3HFpRvUfqHpVIUWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1yqv0mwr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30c17f62afdso1302052eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517178; x=1783121978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D17DQMd9Qan0fIf/b1TuIn+7shy7BCT4D0Np+Oqpwjc=;
 b=h8aMVzENd5CoFq8ff29zHb90qy3dNbx/Z2dXmLtJJXWZCvYaV3mDmU/0xWcPtTG9Je
 5pBW/y71Ogs7eN6nMmZo5sraowWom/6RhdzdeUKWCPEv/1uQLjJbKB/AE1h5eDfI5DXF
 QLSk8i6We8gQdBgN9OuMw02mvH8RF0ijTAl5rhC3yXvXE8AskWoxrdVhKiIlED0BbhM1
 H7nzejYax1lmPf9ldjostiXUYqJDYjk2zvYGBLYZ7bsyafwyNAdckhmXdBqhIRMHlEWW
 17bL+TSj2kHjZYx9U3hlrdaQQVQx8ULZUJVme11hKjqI5QM+kyFwiv7HNItYtgOGYyrN
 JvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517178; x=1783121978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D17DQMd9Qan0fIf/b1TuIn+7shy7BCT4D0Np+Oqpwjc=;
 b=g+asysV7SOaflgGqZQ4A9S8E8g/viptdUfALUh4yYY4eOB8QsIA0vqG368ry2t7/x/
 VhzFCi/SnFphwW6/xyfwX66jVBcUhZXHTdFWkRwEdXuNf8zHGIGQMLUvmUudPtnz+nO9
 M+DSfI7TkPMBlxWGfecJYacapx2KdmPtdIU6OCXyzk2e0douT4UbQq0eQoMj88RSTzRk
 84WdR3eBxponhCFDGmmDDOXd2SK8yETME1UG+J4dnNROFPKKtflVHhNzgjUPGkLrW30z
 KXoZk+RfK5vYcN6ohOwh60N+XXGWKpnV8GkreJKwmDEet7tS+FFbHApnLL65Z0ZYA6l1
 kolw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrux2PDTxBsdyPV8aNnmNafHHl+oVTjYdieZPTSkDciPv3bbQbOW2n32/k6kS+fmIzBooUbAJlr0w==@nongnu.org
X-Gm-Message-State: AOJu0YyiUNx8/wsey4KHJ03UkXLkJyQ4U3dWd/u8rSDJ4tB3GlU3Ncii
 QCLMdKxZj7vRPrOg5h+6DebOcj7Yo2ed9bXDk2bGNMiq1XUPwy7gfvYTkqGEQWLNbQGbOJdu8Xs
 0UMd3ph2HzSHiCFfjVYqMN3KpsPhmLSBju0Fv1alrVzHFj/HafLrcHUw=
X-Gm-Gg: AfdE7cnHbk59/qFw/HGIXpMTU7uy/kQbEwfuMPxqOQPvx07k1d5vpX2D0wZ+TlAvKs+
 1b7AC1VE6TZolnn3P2QRhglM26MAvYs2YXxHi9lrObZRNuQXNiBebV6yn0fnY7DvHxsqUF2wOmJ
 WQrGImoWRLkJPKGCEi+UqhkPIHvUR9xIz0vc4/V6YvxENMla5ybzHCA3vOeKELMhpJw5OVx025v
 75xs++kAft7gfp7Uk38ZxbSuTXF1zWyVTK4VG1JF+kDANiybAHR5Ei4UqCovm64a/Z8N6YlWM3j
 1uNdFYNUBGt6asXYCp/fKaNU/tWcnmi4njaHa7oQg84+G5bwbDjmE+Ld1F0L6CIWdyNYR6lxeHd
 DnwG8iG0IIy58XUqpQcAZDEUnuJ3EC7YqD3kEgqG81h306oD81GGxQJ2RxQAhJaJx4dGr93sYF3
 J2wWgzfA==
X-Received: by 2002:a05:7300:a49a:b0:30c:b63e:bb8e with SMTP id
 5a478bee46e88-30cb63ef7b3mr319030eec.20.1782517178144; 
 Fri, 26 Jun 2026 16:39:38 -0700 (PDT)
X-Received: by 2002:a05:7300:a49a:b0:30c:b63e:bb8e with SMTP id
 5a478bee46e88-30cb63ef7b3mr319001eec.20.1782517177656; 
 Fri, 26 Jun 2026 16:39:37 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:37 -0700 (PDT)
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
Subject: [PATCH v2 11/37] tests/tcg/meson.build: introduce plugin_test
Date: Fri, 26 Jun 2026 16:38:52 -0700
Message-ID: <20260626233918.158740-12-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aoiCzyZV c=1 sm=1 tr=0 ts=6a3f0dbb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=EYl0GfpNujVHqAgcqgYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: npK8WmOH-1xli3KMMz7yBAa8F54VuyFJ
X-Proofpoint-ORIG-GUID: npK8WmOH-1xli3KMMz7yBAa8F54VuyFJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX2hJhHvuXDcBz
 +dgvv1/okQV5q9ypGr3XDbRtXibs/RRjKM1SATecAAhmPr+gvZjOEVl9C/27GCApiuScWS7Lgtw
 76bDPfuf8jQaIyrsfcXSulLp8BsNJmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX/KvQBLEQr0YF
 n3ut/X3Y3hE2+8JfS44Hhfug5V0ukbnWivqHLf9B3dEhQyBV5Fuf4a8Oix2dMGZPhhoXu5ylI7f
 WXQnvgwKRuw9FcElsZv+2a9cV9FobQE8raJ8AVa1mcDYW3ykAnCWwz6LZNFQ17eudTmS0OJOAXQ
 A3yYf+/45bw5caZVOe3Wd51TLxUavdT9A8VHDg3r+f72PEPsX3Sh5rM96xeEv83BRTjh27/3Rd/
 sU8F4Q8zBwzppvFwbXZQb6Wi7Ay5J76UYYWW/Mq9fHV9q2rFGPewm6XouSNvflUtRy3cVMoecs5
 kOGHo6zJF0+E3GrJYV+AK8mGU4KZ/JeBmoHHfEqfB8bGwDkyQitc5ETooRFSo1RmJzcXgcvoaud
 ett/fTlwzYPdYT+9R6LOMLnu8lg4ZcdjxvnK7F6sgkD7UcRN+CaL6GUS7EK8lCZO70UdQtcHuYC
 hhahFmfm55CUr35y1bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260197
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

We add possibility to declare a test that is based on a plugin.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index f5f518fca1b..8419520d9ff 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -16,6 +16,10 @@ tcg_tests = {}
 #           'cflags': ['additional cflags to compile test', ...],
 #           'qemu_args': ['qemu command line flags', ...],
 #           'env_var': ['VAR=value', ...],
+#           'plugin_test': {
+#             'plugin': 'plugin_name',
+#             'args': ['plugin_args', ...],
+#           },
 #         }
 #       },
 #       ...
@@ -59,13 +63,29 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name', 'env_var', 'cflags', 'qemu_args', 'test_name']
+        allowed = ['exe_name', 'env_var', 'cflags', 'plugin_test',
+                   'qemu_args', 'test_name']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
                 ' (possible: [' + ', '.join(allowed) + '])')
         endif
       endforeach
 
+      # return a clear error if user misspell a plugin entry
+      if 'plugin_test' in setup
+        foreach key, _ : setup['plugin_test']
+          allowed = ['args', 'plugin']
+          if key not in allowed
+            error('unknown tcg plugin entry \'' + key + '\' for test ' + src +
+                  ' (possible: [' + ', '.join(allowed) + '])')
+          endif
+        endforeach
+      endif
+
+      if 'plugin_test' in setup and not get_option('plugins')
+        continue
+      endif
+
       # meson '/' operator drops left operand if right is an absolute path
       src = folder / src
       file = files(src)
@@ -78,6 +98,12 @@ foreach target, plan: tcg_tests
       if 'test_name' in setup
         test_name = setup['test_name']
       endif
+      if 'plugin_test' in setup
+        plugin = test_plugins[setup['plugin_test']['plugin']]
+        # remove 'lib' prefix
+        plugin_name = fs.stem(plugin).substring(3)
+        test_name = 'plugin-' + plugin_name + '-with-' + test_name
+      endif
 
       exe_name = target + '-' + exe_name
       test_name = target + '-' + test_name
@@ -118,6 +144,21 @@ foreach target, plan: tcg_tests
         qemu_args = setup['qemu_args']
       endif
 
+      if 'plugin_test' in setup
+        plugin_setup = setup['plugin_test']
+        plugin = test_plugins[plugin_setup['plugin']]
+        plugin_args = []
+        if 'args' in plugin_setup
+          # add empty arg to generate an additional comma
+          plugin_args = ['', plugin_setup['args']]
+        endif
+        plugin_args = ','.join(plugin_args)
+
+        # since we turn plugin into a string, add dependency explicitly
+        depends += plugin
+        qemu_args = ['-plugin', plugin.full_path() + plugin_args, qemu_args]
+      endif
+
       exe = built_tests[exe_name]
       cmd = [qemu, qemu_args, exe]
 
-- 
2.47.3


