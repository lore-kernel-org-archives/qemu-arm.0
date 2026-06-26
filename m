Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC3EC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:41:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9p-0004lN-5j; Fri, 26 Jun 2026 19:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9n-0004eJ-Hn
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9k-0004MM-UQ
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:23 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMx8Jb2165211
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=XIsSvYDB0YF
 joMT3cTFaZ3ZKfXnAINEb6LPUS6LbuJY=; b=dQZIFLGf3MAOUoHU+vbwfJUOioL
 Uq+ECrSUxY8mhpO+FF+e7gKvzmdHOgq/zomnEeZ/ROc8rCYKiVxZY9WbuPA/AWjn
 AJKyKg6R0rUoi2geV8TIwWHFx8Kz5R2m6xhIgbdgoPTdXB7PJDPcIGF7TccAH3KK
 +AO4QEJC9Xx1VP8kwhkCeimMyWhjN0t7jh5ry2eJ0cYn8eeFozzsvL8MMFNd/2eK
 nKePvLtqha5miB1s9huF2y5TCfHzxzDRNQ1fprKTcet0DWbw5qDAefIkWDE+3tRN
 6uFBppdgvD6sCE8qdVRrub2bxX1HkUpSVM1bRO4yWbEaEgOIYlTmsvf4f6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdvkrt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30cb5001ed8so248258eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517209; x=1783122009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIsSvYDB0YFjoMT3cTFaZ3ZKfXnAINEb6LPUS6LbuJY=;
 b=OXTbwmkzwesjq1fFWgdHTLa8V9+yM1FJKpRjK5rIhqMWfdRL9VpPFwfYoqlEpBBcV9
 kCPoYq3jL6LX9OkFDhedPvFOP44nEgXiRxdCpgAW5M2MJEzjABaVFhmsCmUgd3ypPz3J
 Am79INOah0jKu3aNY59/MyLaeCZjzt0BwdWqKkwMf0uP0iTcacj2pixMdKERr5gTCd9d
 zwJ5FEqdFmDLqi7foUGEn5VGAUeIYbEmtoaZrMmvBACQr2WyXKdolz27qPtei+QLmh+o
 abl8IiXCI3pQLssDrue4O18d7rpgWe8DvAhi0lMKRZOTZ21Fx9KEaHs3Kw7+7Tyl8oky
 zuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517209; x=1783122009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XIsSvYDB0YFjoMT3cTFaZ3ZKfXnAINEb6LPUS6LbuJY=;
 b=LOILvpNOJUhXS9tRzsy+/3xbY0xvJEnE9y0upM2SoEUB5mSVD4w+/Za1fksfPjlAmv
 JrF+FM44lDi2NkiYtwRS0XvKMhjhxCi7aDcHLZvjzySBl1YKLcDCHW8JgD0hnXUG2G+X
 4xoyO7gnD/LklOK7coUwKp5BU3rHv7NH30lcgMV3Nqq01JT8HAPd208xOx9bll/sD84k
 R78IYVv+FdUJRrjfC/7h8ca2s5HVgWj3FOcu8fU9kIP7rfven2vsdYBZ8NFtlDezH0aT
 o0k6iwkxr693P5+HEcPaZVE0YgKUYDNhRPEv9jBXPbisHLh0diyv8wN6XV+JY/LF5mBn
 T3WQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpljEb+fhl8vFkCefj2WMo3zgTPcPy1DvDA2dZ0lNKkMnj/TrYa2TA8ikgLbxjt3UoXODJE4wkj3A==@nongnu.org
X-Gm-Message-State: AOJu0YxEeQczMZBZprzE/So03Y08VDbtXxe5ouVKg1yzSIquCbn1pHTn
 lokbsKZF+ocp2AyMuqKvK90CT3vjHxjLjiPCNhFa20/8veUcND/ettgD/0vxwqhihWo2PTNL+rw
 UQqNWX+nS/fv8nQEt7/Xbc8MfDTRGFnRnCzHtA+e1VXriMl733WwlCc8=
X-Gm-Gg: AfdE7cmEfhn1XxWjwuHJBwtU26NpaJvid4jBmWId0NhuddjXyJNA6sCM1LNLQbuknNT
 17whc+PMvB8mVFTV/fp9Wo0lIbTWLZP/BvGY82ai61ZHfJfnIK2Bb2boUjqIrIs5lxZv1h8JPqo
 lQYtXg5+S8Bx4lPxdu/e8vchTF1CRXUJzcsVgeHwWjJnhBk+le8wamQU2jqrd9g8ubER5EgFg+9
 oeyU4JzjKdSowrstnKQPD/fQK96AxYJVxqaGMDJ64Ck2aVAuqZgu57J+1TtvrUwMs31XXWKSQ9P
 pOcfr1ylKONWRP7p7sRIH0YvYBGDOsnfLdGWMSLHpNQXrk50CetaBGOxGzC7lCGT7E571ZZEHbU
 pS4Q9cpGPzKDZR8swKEJOwwsWOMJZUVaW49chQm5abUTxqaT94yBGF3toawsIZKa/afrp0dL5iq
 YBjOA9YA==
X-Received: by 2002:a05:7301:4008:b0:30c:23ab:b7d2 with SMTP id
 5a478bee46e88-30c84db2870mr7350427eec.28.1782517208545; 
 Fri, 26 Jun 2026 16:40:08 -0700 (PDT)
X-Received: by 2002:a05:7301:4008:b0:30c:23ab:b7d2 with SMTP id
 5a478bee46e88-30c84db2870mr7350391eec.28.1782517207921; 
 Fri, 26 Jun 2026 16:40:07 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:40:07 -0700 (PDT)
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
Subject: [PATCH v2 32/37] tests/tcg/aarch64: delegate cc_feat and gdb_feat
Date: Fri, 26 Jun 2026 16:39:13 -0700
Message-ID: <20260626233918.158740-33-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3f0dd9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ReD4dPPu0ofPpr2dz88A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX3WFhZ4In4VAC
 941drMFfwzNlPiRO9bgIwJNpamAGr1vAAfOK6OPOAFqWCTKep4xao179UjD1+5oCnM2wU5V4gx8
 0PnTN2Tim6i+0QdJ+T1elXRkpeDVxNnddBDVwGcmvFs2cgSwyz+wubznzkYSB1zHD2ISAnBif/R
 93qK4M7mf6ZwIuHFmDevrqRauTqn2ulhvTRWttcsY7DhfpFNOC45LJ60SCa2/xUvR9MODPeiXhs
 Mzi3hCoyEfpf6dBL21Zp/mZhIj4erqINpqqdro/ygq3dhn1G0wN3Y3WkgtERLBuXStyIWaVwT1E
 oHOzIU5KharHUaRHEq9ulwt2nro5Z5nkAuYoNNwQbZEYRnFa4Y8CWqyiSfqSqIGKInp3RolXnga
 y/idnDVULpikvgspCBZW4SPJSuXXvvrNLoIB+oNouMzps9wngJmWqtUsZXW3eR8/5irlkmCLjdO
 36haEottS/ZaNVr+0hA==
X-Proofpoint-ORIG-GUID: ANIhyMIDGszBAyHQsbRZ0uaPFpL8ZznS
X-Proofpoint-GUID: ANIhyMIDGszBAyHQsbRZ0uaPFpL8ZznS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX9b4FWzeHqsY6
 g0g5qiGiATkMKX2svhqbD03wQxZam+Wvr+JMpCfgpp9nyUN8sPCpT2wj/NTUns69bjAxPGce+x8
 9szm1a4wICeWTpBic0E7uzqUv8JOmXI=
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

We can now declare all tests with their requirements.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/aarch64/meson.build        | 227 ++++++++++-----------------
 tests/tcg/aarch64/system/meson.build |  48 +++---
 2 files changed, 111 insertions(+), 164 deletions(-)

diff --git a/tests/tcg/aarch64/meson.build b/tests/tcg/aarch64/meson.build
index 53085278155..f7c0202ed1b 100644
--- a/tests/tcg/aarch64/meson.build
+++ b/tests/tcg/aarch64/meson.build
@@ -4,7 +4,7 @@ if not cc.found()
   subdir_done()
 endif
 
-feat_cflags = {
+cc_feat_cflags = {
   'aes': '-march=armv8-a+aes',
   'sve': '-march=armv8.1-a+sve',
   'sve2': '-march=armv8.1-a+sve2',
@@ -15,33 +15,12 @@ feat_cflags = {
   'mte':  '-march=armv8.5-a+memtag',
   'sme':  '-Wa,-march=armv9-a+sme',
 }
-cc_has_feat = {}
-
-foreach feat, flags : feat_cflags
-  cmd = run_command([cc, cc_check_args, flags], check: false)
-  avail = cmd.returncode() == 0
-  cc_has_feat += {feat: avail}
-  if not avail
-    warning('aarch64 tcg tests for feature \'' + feat + '\' ' +
-            'disabled: unsupported by cross-compiler')
-  endif
-endforeach
 
 gdb_feat_version = {
   'sme-tiles': '14.1',
   'mte': '15.1',
   'mte-baremetal': '16.0',
 }
-gdb_has_feat = {}
-
-foreach feat, min_ver : gdb_feat_version
-  avail = gdb_version.version_compare('>=' + min_ver)
-  gdb_has_feat += {feat: avail}
-  if not avail
-    warning('aarch64 gdb tests for feature \'' + feat + '\' ' +
-            'disabled: unsupported by gdb')
-  endif
-endforeach
 
 subdir('system')
 
@@ -63,68 +42,83 @@ tests += {
   'test-2150.c': {},
 }
 
-if cc_has_feat['v8.2']
-  tests += {'dcpop.c': {'cflags': feat_cflags['v8.2']}}
-endif
-
-if cc_has_feat['v8.5']
-  tests += {'dcpodp.c': {'cflags': feat_cflags['v8.5']}}
-endif
+tests += {'dcpop.c': {'cc_feat': 'v8.2'}}
+tests += {'dcpodp.c': {'cc_feat': 'v8.5'}}
 
 # Pauth Tests
-if cc_has_feat['v8.3']
-  f = feat_cflags['v8.3']
-  cpu_max = ['-cpu', 'max']
-  cpu_neoverse = ['-cpu', 'neoverse-v1']
-  tests += {
-    'test-2375.c': {'cflags': f},
-    'pauth-1.c': {'cflags': f, 'qemu_args': cpu_max},
-    'pauth-2.c': {'cflags': f, 'qemu_args': cpu_max},
-    # Choose a cpu with FEAT_Pauth but without FEAT_FPAC for pauth-[45].
-    'pauth-4.c': {'cflags': f, 'qemu_args': cpu_neoverse},
-    'pauth-5.c': {'cflags': f, 'qemu_args': cpu_neoverse},
-  }
-endif
+cpu_max = ['-cpu', 'max']
+cpu_neoverse = ['-cpu', 'neoverse-v1']
+tests += {
+  'test-2375.c': {'cc_feat': 'v8.3'},
+  'pauth-1.c': {'cc_feat': 'v8.3', 'qemu_args': cpu_max},
+  'pauth-2.c': {'cc_feat': 'v8.3', 'qemu_args': cpu_max},
+  # Choose a cpu with FEAT_Pauth but without FEAT_FPAC for pauth-[45].
+  'pauth-4.c': {'cc_feat': 'v8.3', 'qemu_args': cpu_neoverse},
+  'pauth-5.c': {'cc_feat': 'v8.3', 'qemu_args': cpu_neoverse},
+}
 
 # BTI Tests
 # bti-1 tests the elf notes, so we require special compiler support.
-if cc_has_feat['bti']
-  f = [feat_cflags['bti'], '-fno-stack-protector', '-nostdlib']
-  tests += {
-    'bti-1.c': {'cflags': f},
-    'bti-3.c': {'cflags': f},
-  }
-endif
+f = ['-fno-stack-protector', '-nostdlib']
+tests += {
+  'bti-1.c': {'cc_feat': 'bti', 'cflags': f},
+  'bti-3.c': {'cc_feat': 'bti', 'cflags': f},
+}
 # bti-2 tests PROT_BTI, so no special compiler support required.
 tests += {'bti-2.c': {}}
 
 # MTE Tests
-if cc_has_feat['mte']
-  f = feat_cflags['mte']
-  tests += {
-    'mte-1.c': {'cflags': f},
-    'mte-2.c': {'cflags': f},
-    'mte-3.c': {'cflags': f},
-    'mte-4.c': {'cflags': f},
-    'mte-5.c': {'cflags': f},
-    'mte-6.c': {'cflags': f},
-    'mte-7.c': {'cflags': f},
-    'mte-8.c': {'cflags': f},
+tests += {
+  'mte-1.c': {'cc_feat': 'mte'},
+  'mte-2.c': {'cc_feat': 'mte'},
+  'mte-3.c': {'cc_feat': 'mte'},
+  'mte-4.c': {'cc_feat': 'mte'},
+  'mte-5.c': {'cc_feat': 'mte'},
+  'mte-6.c': {'cc_feat': 'mte'},
+  'mte-7.c': {'cc_feat': 'mte'},
+  'mte-8.c': {'cc_feat': 'mte'},
+}
+tests += {
+  'mte-8.c': {
+    'gdb_test': ['--test', files('gdbstub/test-mte.py'), '--', '--mode=user'],
+    'gdb_feat': 'mte',
   }
-endif
+}
 
 # SME Tests
-if cc_has_feat['sme']
-  f = feat_cflags['sme']
-  tests += {
-    'sme-outprod1.c': {'cflags': f},
-    'sme-smopa-1.c': {'cflags': f},
-    'sme-smopa-2.c': {'cflags': f},
-    'sme-fmopa-1.c': {'cflags': f},
-    'sme-fmopa-2.c': {'cflags': f},
-    'sme-fmopa-3.c': {'cflags': f},
+tests += {
+  'sme-outprod1.c': {'cc_feat': 'sme'},
+  'sme-smopa-1.c': {'cc_feat': 'sme'},
+  'sme-smopa-2.c': {'cc_feat': 'sme'},
+  'sme-fmopa-1.c': {'cc_feat': 'sme'},
+  'sme-fmopa-2.c': {'cc_feat': 'sme'},
+  'sme-fmopa-3.c': {'cc_feat': 'sme'},
+}
+sysregs_sme = 'sysregs-sme'
+tests += {
+  'sysregs.c': {
+    'exe_name': sysregs_sme,
+    'cc_feat': 'sme',
+    'gdb_test': ['--test', files('gdbstub/test-sme.py'), '--',
+                 'test_sme', '--gdb_basic_za_test'],
   }
-endif
+}
+tests += {
+  'sysregs.c': {
+    'test_name': 'sysregs-sme-tile-slice',
+    'exe_name': sysregs_sme,
+    'gdb_test': ['--test', files('gdbstub/test-sme.py'), '--',
+                 'test_sme', '--gdb_tile_slice_test'],
+    'gdb_feat': 'sme-tiles',
+  }
+}
+tests += {
+  'sysregs.c': {
+    'test_name': 'sysregs-sme2',
+    'exe_name': sysregs_sme,
+    'gdb_test': ['--test', files('gdbstub/test-sme2.py')],
+  }
+}
 
 # GCS Tests
 tests += {
@@ -137,7 +131,7 @@ tests += {
 tests += {'sysregs.c': {}}
 
 # Crypto Tests
-tests += {'test-aes.c': {'cflags': feat_cflags['aes']}}
+tests += {'test-aes.c': {'cc_feat': 'aes'}}
 
 # Vector SHA1
 # Work around compiler false-positive warning, as we do for the 'sha1' test
@@ -154,76 +148,27 @@ tests += {'../multiarch/sha512.c': {
          }}
 
 # SVE Tests
-if cc_has_feat['sve']
-  f = feat_cflags['sve']
-  tests += {
-    'sve-ioctls.c': {'cflags': f},
-    '../multiarch/sha512.c': {
-       'exe_name': 'sha512-sve',
-       'cflags': f,
-    },
-    'sve-str.c': {'cflags': [f, '-O1']},
-  }
-endif
+tests += {
+  'sve-ioctls.c': {'cc_feat': 'sve'},
+  '../multiarch/sha512.c': {
+     'exe_name': 'sha512-sve',
+     'cc_feat': 'sve',
+  },
+  'sve-str.c': {'cc_feat': 'sve', 'cflags': ['-O1']},
+}
+tests += {
+  'sysregs.c': {
+    'exe_name': 'sysregs-sve',
+    'cc_feat': 'sve',
+    'gdb_test': ['--test', files('gdbstub/test-sve.py')],
+  },
+  'sve-ioctls.c': {
+    'gdb_test': ['--test', files('gdbstub/test-sve-ioctl.py')],
+  },
+}
 
 # SVE2 Tests
-if cc_has_feat['sve2']
-  tests += {'test-826.c': {'cflags': feat_cflags['sve2']}}
-endif
-
-# GDB Tests
-if cc_has_feat['sve']
-  f = feat_cflags['sve']
-  tests += {
-    'sysregs.c': {
-      'exe_name': 'sysregs-sve',
-      'cflags': f,
-      'gdb_test': ['--test', files('gdbstub/test-sve.py')],
-    },
-    'sve-ioctls.c': {
-      'gdb_test': ['--test', files('gdbstub/test-sve-ioctl.py')],
-    },
-  }
-endif
-
-if cc_has_feat['sme']
-  f = feat_cflags['sme']
-  sysregs_sme = 'sysregs-sme'
-  tests += {
-    'sysregs.c': {
-      'exe_name': sysregs_sme,
-      'cflags': f,
-      'gdb_test': ['--test', files('gdbstub/test-sme.py'), '--',
-                   'test_sme', '--gdb_basic_za_test'],
-    }
-  }
-  if gdb_has_feat['sme-tiles']
-    tests += {
-      'sysregs.c': {
-        'test_name': 'sysregs-sme-tile-slice',
-        'exe_name': sysregs_sme,
-        'gdb_test': ['--test', files('gdbstub/test-sme.py'), '--',
-                     'test_sme', '--gdb_tile_slice_test'],
-      }
-    }
-  endif
-  tests += {
-    'sysregs.c': {
-      'test_name': 'sysregs-sme2',
-      'exe_name': sysregs_sme,
-      'gdb_test': ['--test', files('gdbstub/test-sme2.py')],
-    }
-  }
-endif
-
-if cc_has_feat['mte'] and gdb_has_feat['mte']
-  f = feat_cflags['mte']
-  tests += {
-    'mte-8.c': {
-      'gdb_test': ['--test', files('gdbstub/test-mte.py'), '--', '--mode=user'],
-    }
-  }
-endif
+tests += {'test-826.c': {'cc_feat': 'sve2'}}
 
 # Semihosting tests
 # Add -I path for semicall.h
@@ -240,8 +185,10 @@ tests += {
 tcg_tests += {
   'aarch64-linux-user': {
     'cc': cc,
+    'cc_feat_cflags': cc_feat_cflags,
     'folder': 'aarch64',
     'gdb_arch': 'aarch64',
+    'gdb_feat_version': gdb_feat_version,
     'qemu': emulators['qemu-aarch64'],
     'tests': tests,
   }
diff --git a/tests/tcg/aarch64/system/meson.build b/tests/tcg/aarch64/system/meson.build
index 2a613cca52d..8242580bf6d 100644
--- a/tests/tcg/aarch64/system/meson.build
+++ b/tests/tcg/aarch64/system/meson.build
@@ -33,15 +33,14 @@ foreach t: tcg_tests['multiarch-softmmu']['tests']
   endforeach
 endforeach
 
-if cc_has_feat['sve']
-  tests += {
-    '../../multiarch/system/memory.c': {
-      'exe_name': 'memory-sve',
-      'cflags': [cflags, feat_cflags['sve'], '-DCHECK_UNALIGNED=1', '-O3'],
-      'qemu_args': qemu_def_args,
-    },
-  }
-endif
+tests += {
+  '../../multiarch/system/memory.c': {
+    'exe_name': 'memory-sve',
+    'cc_feat': 'sve',
+    'cflags': [cflags, '-DCHECK_UNALIGNED=1', '-O3'],
+    'qemu_args': qemu_def_args,
+  },
+}
 
 tests += {
   'asid2.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
@@ -70,30 +69,31 @@ tests += {
   },
 }
 
-if cc_has_feat['v8.3']
-  tests += {
-    'pauth-3.c': {
-      'cflags': [feat_cflags['v8.3'], cflags],
-      'qemu_args': ['-M', 'virt', '-cpu', 'max,pauth-qarma5=on', qemu_base_args],
-    }
+tests += {
+  'pauth-3.c': {
+    'cc_feat': 'v8.3',
+    'cflags': cflags,
+    'qemu_args': ['-M', 'virt', '-cpu', 'max,pauth-qarma5=on', qemu_base_args],
   }
-endif
+}
 
-if cc_has_feat['mte'] and gdb_has_feat['mte-baremetal']
-  tests += {
-    'mte.S': {
-      'cflags': [feat_cflags['mte'], cflags],
-      'qemu_args': ['-M', 'virt,mte=on', '-cpu', 'max', qemu_base_args],
-      'gdb_test': ['--test', files('../gdbstub/test-mte.py'), '--', '--mode=system'],
-    }
+tests += {
+  'mte.S': {
+    'cc_feat': 'mte',
+    'cflags': cflags,
+    'qemu_args': ['-M', 'virt,mte=on', '-cpu', 'max', qemu_base_args],
+    'gdb_test': ['--test', files('../gdbstub/test-mte.py'), '--', '--mode=system'],
+    'gdb_feat': 'mte-baremetal',
   }
-endif
+}
 
 tcg_tests += {
   'aarch64-softmmu': {
     'cc': cc,
+    'cc_feat_cflags': cc_feat_cflags,
     'folder': 'aarch64/system',
     'gdb_arch': 'aarch64',
+    'gdb_feat_version': gdb_feat_version,
     'qemu': emulators['qemu-system-aarch64'],
     'tests': tests,
   }
-- 
2.47.3


