Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12199CD98C6
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JC-0006uB-Dt; Tue, 09 Jun 2026 17:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iv-0006ew-L5
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iu-00084A-0B
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:13 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4cG63167607
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QSWrXkbiPa1
 l97PSuSSa+llDSUpXtuOmx5P3b4omr8E=; b=bqLdyFwE31IKmX91B1XKSl3Pvie
 UzlNccai1fgNBh8lhjGDJFxw6+OFOLTJXvQjWf3yCDrKnvYq4TcshXHbX+aC3FM5
 rSi4zUsyTunbnpPOAzQIWGLgmNYTs3lDIluKjfCRsjO0HDAr1hwRKT6U7XFlpGFY
 bIVymHzJb2isbCIEvRkmaeq04dZM8420W5nSWckU9PO1cYE5se3BZZarlidgxLHQ
 hUw7jFSuMgSeh+u+QO0k0jAGnXsVOG9qUHt521VKd1v50W/DsNyiDIyUbWxmT2bU
 DzGmQLTe0HZEdqvSr0fG2e+Ad7KbVG1llEDKkNoqXlw4k3usv4C0wAomPGQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenrc0ch-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-13815e0e6baso5106681c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041680; x=1781646480; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSWrXkbiPa1l97PSuSSa+llDSUpXtuOmx5P3b4omr8E=;
 b=E2UBRqWpDcP286HSopF0zkjoWT1mZMeJeFQcKPXHD8nVFRBpoZmaX8fD7Nc1m4Rvko
 MJjqNkG5HlQ8NWC8XvSqj2+60TfUr8t1B7VebhqTmxSUgEjAUU/gueSlo/OaJgp0SG1c
 WFcorbt+ExsQczAiPcQX/BMjJicRlB/fSI01+Fp3iJUIR7hyr9ebdVTcbq424PKw1vvx
 uorFtdQbsimy3z0Rpt2l/tBxUdgU3XtHkYzJBb3FlkdU2XKgz6rX/2s12Eo26RrfoX8Q
 z3JtFWCJ82uSBrXatYXN2kajmuCl+VdMdFUAGjD8pgwLmWWkmjUcXk+h5PuqLYBBdh3w
 f3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041680; x=1781646480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QSWrXkbiPa1l97PSuSSa+llDSUpXtuOmx5P3b4omr8E=;
 b=sfGGV14ISrqVJIlDjIeyRdnbuaAhisHZaalSkp0+NBaIbmBAFlO/WMG2xIOobdfW/f
 jTB9Jgf2DPKpWrHysV0N0VO/b3tICyEZ9slx23s/yGtCqLGQkHAaS6kiieQVq4N2mniY
 gA3+ZKnc/TlstLtKqrPC1OpGZacKptvlncPqMHp+0lQUv7UcWoe6NkHka2Roy29ihbGL
 +hHXHpBudT/vybc23DXrQoufOVfaucZDMchtle1Ju1dB5kYQZZpiAguYpcSzvDkNiX9v
 SjWhgO7pKv9GFY0mCRj6ZJvtCXevhU6ESZ96iJX+7g1Gwn1mTD39XoZyp3OX4D30ubFx
 74DA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/b588wwdEOdvBHn3dwiE8WzNK2r12FhOt+rtQ7WFza5+MJPPxHngys0dXDTp5rmQVf9UhxIg203A==@nongnu.org
X-Gm-Message-State: AOJu0YwfFF4tSxS+u8eibMISiVZOdaRyw6UvIkRGDlalXyGA9lE+cEAt
 FflYF9l51BCCqPOOgolwZ90L3hEGVdajjTDLfvJwgmbnc6UfoGM56fpz/gQR9vQUwrlHrkS418J
 nrL3DkdsT9eXBTayQ6dZufk12TABlkvBcGiVDcWe3KuWP5Iw1wTifxyI=
X-Gm-Gg: Acq92OHnXRu5iSIGOc8ikRf28iiTIBFeEsgQoclSyB5ffoWmh6PJqK7Q0DGIXROaR8y
 2iMfzU71iqFJdtQ2bIbYymCYXPTjOyAB4/Q3B5lXpz0MvARJnNbJ/+tudoIMKwF5AKtMlC7mPyH
 y/WEq1u+iEnnUQsVvla7lkVrLIlGXTYzNJgXrUQeEZ+TsnoQyv6XPNJLpp76vczboNrWtPRQKEe
 /JwExEook1Ao9n+CoAXY0syT5JjlBWbTW7FZK3mFi6mgS+ejenk8ZxYssDvR4/oi1bo6e/Phj5i
 191Tz2fth1aKU5SurNzWEJBjfUqpaMAYiUBAVq2YcDgb8OeSb+L4MgISaXVts6n2hUPYds/tbBO
 ikkot79Ocxi+aFY29dc/YVfEwzNmOo9NstnFOM2zqEIfB5yzmY+aWaYmDD1L+I0OKYScWCu5B3K
 Nm5TPssq+qn1+U6ONz
X-Received: by 2002:a05:7022:5f0c:b0:12d:b7e5:a691 with SMTP id
 a92af1059eb24-13806687449mr5757268c88.7.1781041679622; 
 Tue, 09 Jun 2026 14:47:59 -0700 (PDT)
X-Received: by 2002:a05:7022:5f0c:b0:12d:b7e5:a691 with SMTP id
 a92af1059eb24-13806687449mr5757244c88.7.1781041679066; 
 Tue, 09 Jun 2026 14:47:59 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:58 -0700 (PDT)
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
Subject: [PATCH 07/27] tests/tcg/meson.build: introduce cflags
Date: Tue,  9 Jun 2026 14:47:25 -0700
Message-ID: <20260609214745.772536-8-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Eq_J3fJDEjHZqO3aEu89_9hwVIDtby0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfXynVCyo0r35vi
 8WlIQ+vhx0VCpJOMFhijoZRoFsK8vDhDMLzGabndGp7vwW7J9mKjCBN595MJlNN0/XgkmI8z6Dd
 ZXt/IZ5LJy5fDkjbCWdVTJPhOOboT0R/I93Ki0f3LUfkgznPQk/VTRpXcqzimN4hGudM6dMHfNg
 Gitj6sxikoTb1VCSU9mqoV5Mc10KFkF2+kQoHmZ6ibbKqTxUWr8s4eqiiQ4i1lz9ib9iEQo5CyF
 TfmmUp+umoKij+wO7D8xVs/rmceDdYTq0ljMYtNAQUDxnEQSFJp/xhZrD+xJ+Xpci2hDqHpMWmR
 Uz7oZtb4iUbx5opNr5KZEP90rPQFfou+C5s9IYKXD0Af5DAxwBSTEhnhxN4zfI1s+nhFe/7D/r3
 Ql6pQKpNq04H9B8s3Vg1JDB48hDU549wxKjOHLLNqqnKXm181c6KodB0cdsYsJMD9qFJX4pPrEi
 Gu5wrdjKh3vLOx+MQjQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a288a10 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xYeKZKBo3MRtsS0M5EUA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Eq_J3fJDEjHZqO3aEu89_9hwVIDtby0q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090204
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

We add possibility to declare cflags for a given test. Since we want to
preserve the uniqueness of test binaries, we prevent repeating those
cflags later, for an existing binary.

This ensures one executable == one set of cflags, and if dev needs
duplication, they can use a custom 'exe_name' to override this.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index bb0184732fd..ad56fdf4ab5 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -13,6 +13,7 @@ tcg_tests = {}
 #         'src_file': {
 #           'exe_name': ['provide an alternative binary name'],
 #           'test_name': ['provide an alternative test name'],
+#           'cflags': ['cflags to compile test', ...],
 #         }
 #       },
 #       ...
@@ -20,7 +21,8 @@ tcg_tests = {}
 #   }
 # }
 #
-# Every test executable, identified by 'exe_name' is built only once.
+# Every test executable, identified by 'exe_name' is built only once, and we
+# ensure cflags are specified only once, on first declaration.
 # Tests for a given src use the same executable by default, and their definition
 # is guaranteed to be unique also. They can be duplicated by setting 'test_name'.
 # Default name is derived from src if 'exe_name' and 'test_name' are omitted.
@@ -51,7 +53,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user mispell a setup entry
       foreach key, _ : setup
-        if key not in [
+        if key not in ['cflags',
                        'exe_name', 'test_name',
                        ]
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
@@ -80,6 +82,15 @@ foreach target, plan: tcg_tests
               'specify a different \'test_name\'')
       endif
 
+      cflags = []
+      if 'cflags' in setup
+        if exe_name in built_tests
+          error('test ' + exe_name + ' was already built with cflags: ' +
+                'remove cflags or set \'exe_name\' (if cflags are different)')
+        endif
+        cflags = setup['cflags']
+      endif
+
       # build executable if needed
       if exe_name not in built_tests
         exe = custom_target(exe_name,
@@ -89,7 +100,7 @@ foreach target, plan: tcg_tests
                                       '-MMD', '-MF', '@DEPFILE@',
                                       '-Wall', '-Werror',
                                       '-O0', '-g', '-fno-strict-aliasing',
-                                      ],
+                                      cflags],
                             depfile: exe_name + '.d',
                             output: exe_name + '.test',
                             build_by_default: false)
-- 
2.43.0


