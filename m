Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837E1CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JB-0006sH-7i; Tue, 09 Jun 2026 17:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J6-0006nD-RS
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iy-00085L-Fg
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:18 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4i2N3229341
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=TwMTnYSHBtF
 8jxfmTzK4AAEVmJ+eki90A7FeMBV+J1o=; b=Zduai4Lr8iNYeCkYY21fe9BP1ZA
 /CIfiTtHwsuMPr6aV+h1AJxgkL3l16fQLWr5Bad31BQ+d84xuCGquPVSWVK5Rvuq
 lzIfJe5FhwVCCyPGcPHCxWs9FNuyp9udktgWL89GvRz7gG3Vls799VtAcxocVJl7
 po9jQk00kO+0h89Uymlj3xdRhkMsN/rzW2yaIFKiJPvu4MHrlgrHX8lfmsf/Tgsv
 TUElh3fsu14zBROK+Fjx52ZHS7RUsyX4C2slcjwkAR2hOdZ8mnLIDJskyP7w8KZs
 ZOaSWmFUrR7p8nkSFX58KOmsjkzdB3exKpu35AHHJ5I7URn9nkbYPDi88ng==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg1u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1383678095cso2206119c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041684; x=1781646484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwMTnYSHBtF8jxfmTzK4AAEVmJ+eki90A7FeMBV+J1o=;
 b=XsnmU4KkXjLFOrXX8a55PMYu6RaukW/JS81EBSGOOi0dmdNx5M6W4jMPnrOKTplurZ
 8D2V4y6UX6t3YREARVWL8d4hpvCNxd3sNY4oOU3SUwCu4qF7pF9DxcAvg6jXc7Th1vmk
 sN0h/0UKABr3aQTn5pJFGuAiHtmqpIwXQaD20JuOkqyLslLxlJ+RcbwNgnH6kZHkrrsn
 +S8sHCmfD3M4pA5VyQvhLCX/GJ5gfy/HzHnRW04AsV1KyWeTvPFRaxajbyHs17Suo16M
 btfhveEYbaL71IKehiOPZRcBLdqdFLA4qPIGTLDZKG/jGTaBuA8ZPB3XSM4DNZYQ00kN
 oYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041684; x=1781646484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TwMTnYSHBtF8jxfmTzK4AAEVmJ+eki90A7FeMBV+J1o=;
 b=jwrb8WJQ0l1A/YZV8F/6RU4Qw2+j89vjieDBoZ4mlG+26AMzs9kpZ1z5/6jAFxkLOZ
 /7b6uNjFEMsIqcLJdTBqMnRqmlN6z/oP/LTf+/3UyTGIK59RXJBNHXcZYRC0XntLdftC
 H+yZNS+JlsJID5zUECYfLR0AhWp98oKNxxoyv9E/fEcdY/0ldnynv/PGsWigVJuNoOAT
 8KhTDh8VtTgeV+dVyftdImhaRbAhQhR/P3S3OIyqtmmD1wzh/8uubc1bogob/3hui29u
 3d+X+aSUeMlGMeVxeMUeSWRsT/nf8VPmiAqAJp072PDb+c06owGI0selDO6o6V4Zywo8
 9HuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/zwV+RmZVZ3k7cohB7prD4+Up8IiBVE2Oge+C3Ff+ZNpvqPDSczZ4UwWWphdgH09qUPme0KQz7CA==@nongnu.org
X-Gm-Message-State: AOJu0YweSoiIOhcyhQLgu+unDrgywD4IDKbhbk/5yLHuVf7DC9a8iG1Q
 yfCNsQdVU0+iJ6FcfLe+ZOqTUEqGOG2ZIqLw/a+ciPr2MjztFUGHErn45Lp0hXj+WjP3g45ydqt
 SFXC85s/X4EHa691jbzbIV2XaLGrofkIDxigG6Rk8AMDI2efCBtYbGzo=
X-Gm-Gg: Acq92OHGkhriBPupHVBIqA4rRF/kHqqxMx2bmxSPffMFm5959aCCsJPQT5Yxm+f8v38
 Hf2jo6YnOUXHhuXVm2cANctoIEUQmI0gOl3oS596TTnp3fvtYnWUkjfb4+VbHyv/GVkbPM1M+0e
 17YBXo3DQW/b3A+lMCE5NDJ5sYBdZ9WWw60PaqcNeY2CrsY/FVe/ttx9G0trP/KtP8c3siKvZsd
 qPasGs1xPgDuTLO9cXFf59Z2z2nhynbCnJZDVOW8hqm4YgbMoHlp163GEDnjoKtpOxGOMTSTwwY
 Gf3L5Z+keSMLRkZ1guiEEWMi6oVqQpZLw0wRJrqLmDszaSzPWdlIKzIy4ZxT/4UH0aKlq6CKiHb
 XXsDh8x31Oni3RfyJURRkxhmZ+qZHAkG7RYO/Vgpr/wrwqjTQG7DBxm3anmL5V981g5YQ42uw/i
 dNwacfHKuz1NzfiTtz
X-Received: by 2002:a05:7022:1005:b0:135:d749:5761 with SMTP id
 a92af1059eb24-1380666a3cfmr11462853c88.8.1781041684238; 
 Tue, 09 Jun 2026 14:48:04 -0700 (PDT)
X-Received: by 2002:a05:7022:1005:b0:135:d749:5761 with SMTP id
 a92af1059eb24-1380666a3cfmr11462819c88.8.1781041683693; 
 Tue, 09 Jun 2026 14:48:03 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:02 -0700 (PDT)
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
Subject: [PATCH 11/27] tests/tcg/meson.build: introduce plugin_test
Date: Tue,  9 Jun 2026 14:47:29 -0700
Message-ID: <20260609214745.772536-12-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfX3cKjjJ9g0Kex
 Eye3OXXmJR3BD/VWAWihQAYQbW+whUOQ+xqm8AHk3PjqTKJaEfQcW3n3jXSOU5aBb1v5mwyGIqV
 12CAbc3XCehlOd9XT+gMWF8c2HfiT70UziY/vL0ibcsGCVrGfX4J3zyWbhUwf4svgOugWf76PFp
 Q2TFh+8wwUEB5qxAip22nLn4EyQxt7JKxj9A+eTyrX68kmYsk/jakcrRNzq4ed+bkeZJDuxQoo8
 eL5sz2EbHFhlNujXyvoHt9pQATHUHf2E8nTP9rs0HzKreYlMjFBsw1YfCyChmzwPQKcO2adCncY
 GmBpZqXZbtIxy+VP7V+DAG4vHygEgXMldin69C4BWrYaJw+ev35yL5W8ZkxgT6L0zU+UcqmKUb4
 IjxxwUX3UlBCwK/K9HVUdhmGe8waTHgkfGT40oydYWEBS9TthISJFKqIE1I5tT+wxku3AVIctzr
 mqgFnYIt4//W5R4WIMw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a14 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IApxms6bzuiUID3tdqAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: lwN3uZgLfxseyTjHeCqKpJvbOZWSyWbD
X-Proofpoint-ORIG-GUID: lwN3uZgLfxseyTjHeCqKpJvbOZWSyWbD
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

We add possibility to declare a test that is based on a plugin.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 5cd80f3c030..a47f1ada779 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -16,6 +16,10 @@ tcg_tests = {}
 #           'cflags': ['cflags to compile test', ...],
 #           'qemu_args': ['qemu command line flags', ...],
 #           'env_var': ['VAR=value', ...],
+#           'plugin_test': {
+#             'plugin': 'plugin_name',
+#             'args': ['plugin_args', ...],
+#           },
 #         }
 #       },
 #       ...
@@ -57,12 +61,25 @@ foreach target, plan: tcg_tests
       # return a clear error if user mispell a setup entry
       foreach key, _ : setup
         if key not in ['cflags', 'qemu_args',
-                       'exe_name', 'test_name', 'env_var',
+                       'exe_name', 'test_name', 'env_var', 'plugin_test',
                        ]
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
         endif
       endforeach
 
+      # return a clear error if user mispell a plugin entry
+      if 'plugin_test' in setup
+        foreach key, _ : setup['plugin_test']
+          if key not in ['plugin', 'args']
+            error('unknown tcg plugin entry \'' + key + '\' for test ' + src)
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
@@ -76,6 +93,12 @@ foreach target, plan: tcg_tests
       if 'test_name' in setup
         test_name = setup['test_name']
       endif
+      if 'plugin_test' in setup
+        # remove lib prefix
+        plugin = test_plugins[setup['plugin_test']['plugin']]
+        plugin_name = fs.stem(plugin).substring(3)
+        test_name = 'plugin-' + plugin_name + '-with-' + test_name
+      endif
 
       exe_name = target + '-' + exe_name
       test_name = target + '-' + test_name
@@ -116,6 +139,21 @@ foreach target, plan: tcg_tests
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
2.43.0


