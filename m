Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E54BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9N-0003Wb-MP; Fri, 26 Jun 2026 19:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9L-0003V4-Rt
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9J-000420-JJ
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:55 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMx386795163
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NcONfCYe+RQ
 JerB0TXfgRkx7GtmEch6m6kxK8nXM/xs=; b=aTux1uveq4EPdOUgpctOtLd1rKK
 rSajT+IC7YYML7JgI+W7N1yHQ2G7Y+Hd4DQkd6IjKlirS0Z24lozghgcc3wyHcam
 /1Ny3XDvll/7LQhO8rwBpJtdNtaMI0pRKEvJC5cTsXYxpiHw2ooo/8kXGJUxKNQ+
 +r5uCd7F4GS49lnGgcDVcEVphcni5IgLPdCRzgKpJB6VxIdrAx/7anvW4WY6VzKR
 xSeyppz/TDTiYFmM0q7+9EJOOlzMT2086/RwNwbC4RE1Tu5j584UPER8A6M6vG6h
 L47yqFeam+fnlEmw0ikKDS0ufMSN0CnYZyiYu4oG4yqjYuK3rmlqolbNOEg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups9kk3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c17f62afdso1302081eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517181; x=1783121981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NcONfCYe+RQJerB0TXfgRkx7GtmEch6m6kxK8nXM/xs=;
 b=bymM+aQ7ni1n9zsaOMjS9cMjV3THkR7RCoMYHzQJ0aRcigO0i6nyByRfYDV0rB4Omj
 jasDOEjH85t37P4SrqiBCY6SRBFMkN3LiZWK5+z+IYi8utp8cNlQ7HijimrzeCX6aaS3
 3tHoMl6eMGsHl/7PVTvaSX9ENTxPYOKcpm+enht2LfMr2qRhv3aPjANc8U5U3F3CNbDd
 pte3h/HraKAowFGu7EVlGZYnca+YtOSRrPurwuQqy5nBxc5QHxmbdb90iq0cxUmDj6IL
 GKPF6JBZX8u33hNcjeeHxFyxB6s2o5tfzJhKcH3K4kSeep3eHHOsLVB+EmOJNmoay4Nx
 KyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517181; x=1783121981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NcONfCYe+RQJerB0TXfgRkx7GtmEch6m6kxK8nXM/xs=;
 b=fNphUBwjI5u35zdoy05N3kEOxAScOI7G/gEInNDnZzQ5AzRNRbkfrObemaYVot+Vva
 d0KmQNrUbuvOOTsTytvR+qCq/ugQyCLt8qTzXPUG05s/haCfwpTBDB1gpG69ELQcZ2dX
 NVaUNx/16EaaBy+MhcInOKfi4rxYzDosrp7PIgZVz4EWv1ZAwiWyU4E1O8FVcSGazX+s
 caBA0cPC5vD9qkH964ooOZPgoLsdnA10ph2XvY61Zx+vZGOPYt/g9uOf7awgZ+T7xi3u
 OWIYl0RIAOqwXBJwihkeW9kUfx3Jsz0kvwMW0RSPIvm2BubLXhaYnK9fH5AflMODjojD
 rcVw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpzEnszoETU1mX0vniiWNiy5icYTLl3O//M9btAlRDK2T4ajEq0uAaEqbhaPX8P/mhtaU6XjbAHqA==@nongnu.org
X-Gm-Message-State: AOJu0YwbwnKgu+vI1UfouT/TtYFoAdEZnKLKvAar7Ew3RxpMXzNGfo3/
 QfHFDM9SCT/IX8q0qx1YeioNIpKNpgxlSGGzIiT6VFTPpachTh+eUsZpsjFNyMyuWr21NsrtrPM
 RWA5S5zWRHdH0Wv/WESlZiCyu7iPlGCWQv9aJ4Y1jnii6pYp5IoDgwUg=
X-Gm-Gg: AfdE7cku8N7ikx7zhX90WXFyDqhTnqsiGmrQ97cr24UU4V0CdR6dhl+zwTsD0rAcxA4
 H/k/+CU1b++sS3Uj5c7Q99x6Eg5LG+iEQ3pVI0+G9lQ1+92iT4Qnv2xiW1EJ7IEXBZjOcrL+G39
 dT2xNDIbIyaph2QhlKM2rkQyL8fSiitROfVV/beyfqxiB2dJim7NcyETnyIZd6thqqB6ojwWV7f
 QyxtHY74Hkvg8opHVyl6UGDLzgrMJyKtE4DDFh9kUw6gu3/r+Bebqw/NtdpI+QMx7UBweIJa24s
 nrAL8LL/FuoMYtsz6EgONET5PqegBQdlJelcCLbkGr4ZURo/tBTHSdCGS88wveFbsrqpmkliTml
 /XgH1/UB8P7DpS76LMTn6Kxw305kldk5RGGFYgbRc9FzBtRWvNkKOug5uNaZMyRw65jhRczDMn9
 XgRUAchw==
X-Received: by 2002:a05:693c:2a12:b0:30c:5506:4415 with SMTP id
 5a478bee46e88-30c55675d6amr10576897eec.19.1782517181233; 
 Fri, 26 Jun 2026 16:39:41 -0700 (PDT)
X-Received: by 2002:a05:693c:2a12:b0:30c:5506:4415 with SMTP id
 5a478bee46e88-30c55675d6amr10576881eec.19.1782517180719; 
 Fri, 26 Jun 2026 16:39:40 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:40 -0700 (PDT)
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
Subject: [PATCH v2 13/37] tests/tcg/meson.build: introduce gdb_test
Date: Fri, 26 Jun 2026 16:38:54 -0700
Message-ID: <20260626233918.158740-14-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX/7OCwHXlzcdr
 SVNovrEgcWJwvZ62tS+G64Zvo3OruN99lBZYqraQLEgtBLCRSRP52wPb5GYulHPPFjkIxotYFPu
 ZVZtswm0PCG0px9+R6S+q3S2t6BhEBldZ4kDDoUxsWQ1X6xC66si+LV8q9KkIo1S8A7gpjcQBmh
 gNIcljigEIEuAfOhEh5ysxeqVGSXLMPg8/Qn479jUc0cW1gpYsZy3XFPIxKvKfaV8BxTTufXf4a
 ZBiEhVW1sDd2m460ba40W2xkICZGJB0S9MyRS+c7PHneS88fCOz3I1saAMH9sQzUnDJFGRZaPHM
 0iJBoVEmYr42OYfvrzfkDz615D8qyf/B4WLp4e7eEDRxiLHTYEoTOYkBV0Yyj0+Jo8h/FIpM6j5
 wIle19+AcwZPym70OKMYncmTpRwxEygkHIziJ6bekYetIrCvnCJeAAn1JYQVZ4ZUndLFJe56JQy
 bKyhiOTEE27aNKre7vA==
X-Proofpoint-GUID: 761t_NRHYz9RCJZEKJqZJNyg-dMeiciv
X-Proofpoint-ORIG-GUID: 761t_NRHYz9RCJZEKJqZJNyg-dMeiciv
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3f0dbe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ZkoTrUv0hqWFqrPu6skA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX8Vd3JVaZwWKN
 h7Cm1VEv5NfD6/umFgeYSq3whTV3AgRglrEmLMeX+JmY+BIb9tYJs+jiucKWeH7FeXQUxc5jAmK
 sNqgb0Rezunv6PGvhMEzHKdzDfMhgrg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260197
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

We can now declare a test requiring gdb interaction, based on
tests/guest-debug/run-test.py.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 2a2e619e363..35af4c609dd 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -5,6 +5,7 @@ if config_host.has_key('GDB')
   gdb_progs = [config_host['GDB'], gdb_progs]
 endif
 gdb = find_program(gdb_progs, required: false)
+prog_gdb_test = find_program('../guest-debug/run-test.py')
 
 tcg_tests = {}
 # tcg_tests is a dictionary with following structure:
@@ -22,6 +23,7 @@ tcg_tests = {}
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['additional cflags to compile test', ...],
 #           'qemu_args': ['qemu command line flags', ...],
+#           'gdb_test': ['gdb test args'],
 #           'env_var': ['VAR=value', ...],
 #           'plugin_test': {
 #             'plugin': 'plugin_name',
@@ -83,7 +85,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name', 'env_var', 'cflags', 'plugin_test',
+        allowed = ['exe_name', 'env_var', 'cflags', 'gdb_test', 'plugin_test',
                    'qemu_args', 'test_name']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
@@ -102,6 +104,10 @@ foreach target, plan: tcg_tests
         endforeach
       endif
 
+      if 'gdb_test' in setup and gdb_arch not in gdb_arch_supported
+        continue
+      endif
+
       if 'plugin_test' in setup and not get_option('plugins')
         continue
       endif
@@ -118,7 +124,9 @@ foreach target, plan: tcg_tests
       if 'test_name' in setup
         test_name = setup['test_name']
       endif
-      if 'plugin_test' in setup
+      if 'gdb_test' in setup
+        test_name = 'gdb-' + test_name
+      elif 'plugin_test' in setup
         plugin = test_plugins[setup['plugin_test']['plugin']]
         # remove 'lib' prefix
         plugin_name = fs.stem(plugin).substring(3)
@@ -182,6 +190,16 @@ foreach target, plan: tcg_tests
       exe = built_tests[exe_name]
       cmd = [qemu, qemu_args, exe]
 
+      if 'gdb_test' in setup
+        cmd = [prog_gdb_test,
+               '--gdb', gdb,
+               '--qemu', qemu,
+               '--qargs', ' '.join(qemu_args),
+               '--bin', exe,
+               setup['gdb_test'],
+              ]
+      endif
+
       # some tests expect QEMU env var to be set
       cmd = ['QEMU=' + qemu.full_path(), cmd]
 
-- 
2.47.3


