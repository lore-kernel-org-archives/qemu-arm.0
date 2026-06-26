Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03198C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:44:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9l-0004SW-D1; Fri, 26 Jun 2026 19:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9i-0004Fk-Lo
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9g-0004Jz-Fm
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:18 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxYCt2793913
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=leRkzJZSXcb
 tK0vszzBhM4JakuZho7K1W3lymJlDdbY=; b=Wo8wXmBMxsVokv3dI2ug7vs/ZpB
 gFYvzW+NRWvTzMQ7UxBseQBKQX3NoIBIMU2bxHZucgdz3BB5VzSjHzcptIJXxxPh
 v3SyCFQCkR6rFkQxMEAmVzZN6UbpV9VcZj4s6oILpUFZiyhh29wAJDRfA7Y7C1hi
 lgPeCPcmY3ypvfIJzli5r6MegdkhrYtDR03hWVLCU7+Zt6tlRGWC+gIeN8VPxtzL
 CaKu1r7p4MaMbpiiTfATtg+3iMLC19kOBCFzvVe6riAPF2TM+xMf+ik9x7X2bOXc
 UunZlQnCvS0iBitmCWkAmGsdfew9V92zHF7l4J+zw1pfaHV4QW1M/FMtnzQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1tc3hyvc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30c17f62afdso1302299eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517204; x=1783122004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leRkzJZSXcbtK0vszzBhM4JakuZho7K1W3lymJlDdbY=;
 b=VFO4ScUN+I/xFVYrAGgK99ZluJpFHZBA/KZ3LOXxhl4n+Epi/rr6Ra4g/EB+LJpIJt
 HgnYECFEHO860azAoUXG8O3ct4LefTsU0FeuT8dqzXUJlufBnY1+lQQXs125lln0elhV
 Dm3hyGJuZ7gh7YbCL+6pYhPzCi5z2eMfmiTuW8g2sxMAQeDg7V59Gpdjh76077VripuL
 RR1e5Kw2HcwoHgnxcV3gbLK1BIXCpflIQL3mIhlqwLTiBi52UFCSFv+yFUN2H/u+6LBO
 0T9DGU7h7OTROm39NiKGyY/1S9trCzj0XiRj1d+yFqXhrRZK6YFn7n4gl3NsTk4WgpEB
 VxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517204; x=1783122004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=leRkzJZSXcbtK0vszzBhM4JakuZho7K1W3lymJlDdbY=;
 b=Q/eP27/hZWGQHuTPRCxi/L1R19cDHkabeSwnVd4Gw51q2DTNKfUVYYY48NFpaNm6qV
 9OPAVbMqP35M4lwItoUERpfWBY+UobiTxVi/ZlJjg8S5nKZ9mZRkIeBxQ8+wQkRV1ur0
 71CvFv0mloSupbue1pUkgs3vMgKCwyLwbEQK0h7I4RfCSnu/TqT5cdZlwx5yJ3qnAZyO
 OmRw1HNFWNqYzvBuiDTQu9+je59ImVU+rO5odUFfBoEocP8pfFFkHI683r55W8hl51zf
 Hvi94XPEX5FYxehcI0ZkLnoWUfdL0kpbngVzK8XLs6/01ENhz0/vQoDef3MgL0LXsUnK
 gALg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rowi38DHkGjUCy5DFXlaIjWekRoANiu0EWz07fVRr5mhD9GUnD30YitjyzXlGznmSn1VuNYl1tOyw==@nongnu.org
X-Gm-Message-State: AOJu0YytxKdOl62bQ/3syNOSkHl4f6yX0yfL8ceN9+8hJ0pozO9NajxA
 a5FKMw/c7kiHbNMiH368wUrDQtenC5rXQY9ARf2tuEtX0neAYeWtIRIg8IPma2QVBfb4+zvSAZg
 7a+f0IXp+BohfBM06ol0xhLEsYp7Uq8hsJ6UjnhOY8uHlGxaonyiAm58=
X-Gm-Gg: AfdE7clPZQPlyRgx4WkHameCzxuh9M1ffpD8DQOubrfF57Ah+QEhsaWKhXPxqHm3O75
 RhlkjR0ybK/sngwWL8TZ84sEbi5KL5Ifowvi0/rA96KiHewzZZAGRE4MwUYWXMHpdwLjmlRxbQg
 l1eknjz8UsXWEzE8ibQgbw6c3UClTWxcxXDmbm1Pg47XVI2QAtSV9s4Q1Soka7Rfb271BAi5/oV
 lqPmtHoV4wL2mPMSOGA+EsUda4aXqFHBlqrJDYy39IzYJF7a1PtuZZkyR5wDU70UNJnGbKfEyvq
 jFNxPCEa92BhTBIgLpcttTqeljEzNPH+WkjGF8Sjs6aeVy2eLMbD7b+jxETQ6j/TYJ255omKuj8
 yaMICWi8euldCqr0/u1G1fv5iSaVraAmfl1MEflren6iCG84+a1t1pD5ncJ2Ngzl8/gcpz5HGjB
 A+V6tBSA==
X-Received: by 2002:a05:7301:e0c9:b0:30c:ab96:7307 with SMTP id
 5a478bee46e88-30cab967712mr1224360eec.22.1782517204262; 
 Fri, 26 Jun 2026 16:40:04 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c9:b0:30c:ab96:7307 with SMTP id
 5a478bee46e88-30cab967712mr1224334eec.22.1782517203712; 
 Fri, 26 Jun 2026 16:40:03 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:40:03 -0700 (PDT)
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
Subject: [PATCH v2 29/37] tests/tcg/meson.build: introduce cc_feat and
 cc_feat_cflags
Date: Fri, 26 Jun 2026 16:39:10 -0700
Message-ID: <20260626233918.158740-30-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e3DL1Gx24Db5_EkKP1TknKUGc_9jSN6j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX5Lu+iN9hPRc6
 DU7MUdCxWGlmzZeJCXV9PyI8w8zuI26PislPuRh7c6e2peAWc+L7+5Ay6U7GUZzFwbKntEJKWQx
 tpSdhSQzqvY7TbxeHsUQnrAsIn7lCKQ=
X-Proofpoint-ORIG-GUID: e3DL1Gx24Db5_EkKP1TknKUGc_9jSN6j
X-Authority-Analysis: v=2.4 cv=T4m8ifKQ c=1 sm=1 tr=0 ts=6a3f0dd5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WryKx-XaCgVW6WutTgQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX6B5DVYv1jz+s
 RPujWAJZ36BBlAAdZ9kEl+pizoYDoKAR+Ok1PcoWc+SmlVOBHVLtEFCa0e2UBTo6jpjorXPYWq+
 KHGM6R3LGgsgFuJUI7PqRTHZUa3zA+Zwy4qwaJ+Si5bat2sw58u3Zi/voJBroOoR8LDxL4n5T2s
 Vq76PzG9rmN8kOLszAcTG90VhD337+z+ctdRcn7DX5se3QsM1fA/3h+4JpjOrD8iiKoRFqQ72VJ
 NWUO3sQ+yOmkz15jT41nfFODzHE5MkudqoFVWv4KkBTM3MqtVB6n4Bc9pipte/eQhAEWCCKP4vq
 eSwDsDceuDjYiCNx7tARCxGCcOsQIFitQpgQuemJE2Ko4lmR4PCeSQzZgo76HwL6JJwzpsJANLr
 ESPeID0qChfSfT1BJC7U1kw5rRERVTbER+vuVz114S0f1eDlR3GX82El51OrJHqHT5syTnzD+RT
 SuljtRocIC1FQvpS6aA==
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

We directly move compiler requirements in test definition. This allows
to always declare all tests, and let the main loop filter the ones
that will be available.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 17996561798..f4ccfb0bd84 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -21,6 +21,10 @@ tcg_tests = {}
 # {
 #   'name_of_target': {
 #     'cc': cross_compiler,
+#     'cc_feat_cflags': {
+#       'name': ['feature cflags'],
+#       ...
+#     },
 #     'folder': 'folder_for_test_src_files',
 #     'gdb_arch': 'gdb architecture requirement',
 #     'qemu': emulators['qemu-...'],
@@ -30,6 +34,7 @@ tcg_tests = {}
 #           'exe_name': ['provide an alternative binary name'],
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['additional cflags to compile test', ...],
+#           'cc_feat': 'feature name, must be present in cc_feat_cflags',
 #           'qemu_args': ['qemu command line flags', ...],
 #           'expected_output': 'file_to_compare_output',
 #           'gdb_test': ['gdb test args'],
@@ -121,10 +126,11 @@ foreach target, plan: tcg_tests
   # choose how to deal with it.
   built_tests = {}
   added_tests = {}
+  cc_has_feat = {}
 
   # return a clear error if user misspell a target entry
   foreach key, _ : plan
-    allowed = ['cc', 'folder', 'gdb_arch', 'qemu', 'tests']
+    allowed = ['cc', 'cc_feat_cflags', 'folder', 'gdb_arch', 'qemu', 'tests']
     if key not in allowed
       error('unknown tcg test plan entry \'' + key + '\' for target ' + target +
             ' (possible: [' + ', '.join(allowed) + '])')
@@ -135,13 +141,17 @@ foreach target, plan: tcg_tests
   folder = plan['folder']
   gdb_arch = plan['gdb_arch']
   qemu = plan['qemu']
+  cc_feat_cflags = {}
+  if 'cc_feat_cflags' in plan
+    cc_feat_cflags = plan['cc_feat_cflags']
+  endif
   tests = plan['tests']
 
   foreach t : tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name', 'env_var', 'expected_output', 'cflags',
+        allowed = ['exe_name', 'env_var', 'expected_output', 'cc_feat', 'cflags',
                    'gdb_test', 'plugin_test', 'qemu_args', 'test_name',
                    'wrapper']
         if key not in allowed
@@ -202,15 +212,36 @@ foreach target, plan: tcg_tests
               'specify a different \'test_name\'')
       endif
 
+      if 'cflags' in setup or 'cc_feat' in setup
+        if exe_name in built_tests
+          error('test ' + exe_name +
+                ' was already built with cflags or cc_feat:' +
+                ' remove cflags, cc_feat, or set \'exe_name\'' +
+                ' (if cflags are different)')
+        endif
+      endif
+
       cflags = []
       if 'cflags' in setup
-        if exe_name in built_tests
-          error('test ' + exe_name + ' was already built with cflags: ' +
-                'remove cflags or set \'exe_name\' (if cflags are different)')
-        endif
         cflags = setup['cflags']
       endif
 
+      if 'cc_feat' in setup
+        cc_feat = setup['cc_feat']
+        if cc_feat not in cc_has_feat
+          cmd = run_command([cc, cc_check_args, cc_feat_cflags[cc_feat]],
+                            check: false)
+          avail = cmd.returncode() == 0
+          cc_has_feat += {cc_feat: avail}
+        endif
+
+        if not cc_has_feat[cc_feat]
+          skip_test = 'compiler feature ' + cc_feat + ' not supported'
+          built_tests += {exe_name: exe_name}
+        endif
+        cflags += cc_feat_cflags[cc_feat]
+      endif
+
       # build executable if needed
       if exe_name not in built_tests
         exe = custom_target(exe_name,
-- 
2.47.3


