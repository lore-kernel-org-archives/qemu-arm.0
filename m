Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6517BCD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JK-00077E-35; Tue, 09 Jun 2026 17:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J8-0006qL-H0
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iz-00085f-Bv
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:20 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4iUY3229335
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ewqJKFVLzl8
 rdS23UubrdswMFY3I4XBQjyebwcsYW0Q=; b=HHQqMZX5scTPjXXFqMi6z5brkfd
 zOIMA0CJHwDgKs32vsqsTKkD749UFdbIR+Wd/4x0XZf0GikjYZ3edsJiE2KPfV54
 1f4iS24IX4+cZ16yAqekucwzx8Ymq/+Ez8AzV+cpPnAvCcoKqLhePwV1EB8S65Fw
 ZOX3wXudgyRQdBA2n2axSZJp3niSCvtTN6zSDItgMmByXAPafvoDZS+0f/dDapu9
 Fraq8rdonX6FDqbNmBWBARvGckOYTxcoQnWT4MIJY0FwFq7zuMmDP5/aiEohCVej
 wnZVqm6ReFW83SFjP0f9+r45urN3jal4wQx0SzZruTydPFGXRGuRVuZY6DA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg1y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-13825e1dc0dso10306600c88.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041685; x=1781646485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewqJKFVLzl8rdS23UubrdswMFY3I4XBQjyebwcsYW0Q=;
 b=EzoBBqo9N/nciY/jhqJBjCA32Y9ijswUqyt27wXXb0qxgLkMaD8Qy9M70kyAMKBuYf
 OxBHLvvpUZnTTVmGKNF7B3VI79JIH36mS/YnembmbSF3quq6/6pCtSJrUApe6Rj+Z+Yh
 UY5lOG7lZLrwxnb6fhK9Aoi3emQVqK19C03kUtj+yBJ2HT5w2bRO1PUAnElW4T9MunY/
 T51UMjo5wfmbOaUDDa2Q0rC3e0b9w5BQDbZu500b5AswRuvxyNUbE6WyiUrwwXbYw1wi
 Ei2z7viUVZBypAdtkskfRs5KWTNd2jOO7YzVVyXKeu8ncPO4dMWbP3NNM+EM8iZG/J2B
 m/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041685; x=1781646485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ewqJKFVLzl8rdS23UubrdswMFY3I4XBQjyebwcsYW0Q=;
 b=QfHioJ17pITe8a2iyw2289DmUQx7TFnNBYZ7+8EpRTq8ashrruyhRsE667dnYbOaB4
 iS+HiH6IaPrk1DDSXRxAHWtdhf9rAAzgWyUK2QXvHlE9mxE0P+99N9AAiB/MGH3KBkKu
 OyomxcOd2MigMjl7doMBE5Y8cpQklH4bMrmKDhKXdNpHQmGKWOTdrmgRfVglUVG7YL6R
 hifg9/sjtH2aJUjM3giXxr8dsn1eQ7UbVcuArz5Cu3fXMkX3OeVm/Y2QzBekSXalmy1+
 Ylx9ToUvBdJGQ7o4wKWslJjgBpMOFhj68WsizPTeOt0aGuwPQ4M/BGjrFPiUySYf3wEL
 PGFQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8T0o7kKTxbgFstY6iaHeFPUhVlJ/0sK8P4iocDR1agXijFrTi2f7kFirJq448q9MrTEWscXO3RXA==@nongnu.org
X-Gm-Message-State: AOJu0YzqmmE0wl+Q27aiAar4S661DVIsgHN8NcIcBkinVQBzc2Gc5NBl
 9rDcgjD5noCbM+c4kDSE2x/xQA7+/1qo+hWL5wwck6dJooMWIPLEcpkRcRh9Q7ZQ0ZW0AEV9BV7
 JsdQdnKTvwDM2W9vahcbe4DqAASZsNyKJqwNf58yYE1y6N2ScdtZRhPA=
X-Gm-Gg: Acq92OHkMF+oBctsJ8W0+BhI9/xhovZ/3vpCOQuvSjdAtkV5lFHimc8VD6ZP+rfWKjl
 lQ0aNvmHx1J/Rr3eQ7niAOyk+2pNWo52/w8wHAlM5ADbuGm83wQMtzAxbBMKnhyDvnyZIujOAkW
 uvpnIuCwW1uW2rmK/ECOH5Qvt0tkx/k/3VERIFxRWdJZKmFZpy3Y3N1BwAb09iOMPjzqeRD9tym
 vQClKAV7a7+YVAPJYjllUk4paKmFjcHUIcJCCNBn4bH1dCXskCUN9S+Ied/MI38p7IMG1E8T3X8
 9tMvK43e5XA/1HSkmakqP/SBfYWoMmx+BikKtku5Bi5+GJ7azICnxnyoUCNXYafdn8P8W1qK4Q7
 4d/ro1GYqRE7lLUZ8Z1pNQ7gc0e8fHPwiopTiiIn2qVXbzqYXhu5lyOaVYnNvffKmnoezUaneTZ
 XChb0tEvj8Dsndmvxu
X-Received: by 2002:a05:7022:f90:b0:12d:ceaf:ffcc with SMTP id
 a92af1059eb24-138066bad83mr11932734c88.5.1781041685238; 
 Tue, 09 Jun 2026 14:48:05 -0700 (PDT)
X-Received: by 2002:a05:7022:f90:b0:12d:ceaf:ffcc with SMTP id
 a92af1059eb24-138066bad83mr11932706c88.5.1781041684729; 
 Tue, 09 Jun 2026 14:48:04 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:04 -0700 (PDT)
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
Subject: [PATCH 12/27] tests/tcg/meson.build: test gdb support and introduce
 gdb_arch
Date: Tue,  9 Jun 2026 14:47:30 -0700
Message-ID: <20260609214745.772536-13-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfXx5u9v+0TUgkv
 quuosCztc1P3UQP8CJ8i3AsDWEMO5dnYbj0aQR+CyHAq4lzT2d/APxMwxnum2QgIAcv1l8jTlee
 ZVhjl6hKDVzMOsfa9lQ/kWDpityoKhCHKTtw5TYOcUQT9Km95dkxAaWT8Y7f7TpX7kWwYnEXshW
 WEHm3A/Gwq0cIZY30r1A7SdcddQyMQpu37YKXGTH91hB2HSwmSPWiZ8CIPOx8OOoAopnTPu3cFu
 NsxgZkvTSHeh9b2VpPjZ2bFrc6c+uwai0tza3IvEfKtDJrY8eZvV3YFIUgKXNkMNgOlPzgN8PTm
 DVHtnMOuwkKmdOWZHkIjUmfD04beTlbsqbLT8r3IxK3Fs6v6VNUrDC+oHK33fvZsosLJ1/o+arx
 ipu2YTLVmTFFvcXlaLqURN35CNb7rc0a6GBInl2uN8C5H/6hqmNfmWg6p167FuzpetXolBmxXhZ
 XTNOh4/H9GgSXj3J3Nw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a16 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EVhyENkjGFIjn4asmzEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: RyI8A7FJydV2CsQbrg-Q4G3puHyeizLj
X-Proofpoint-ORIG-GUID: RyI8A7FJydV2CsQbrg-Q4G3puHyeizLj
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

A given target can now declare which gdb architecture it requires.
Also, we add the code to check gdb capabilities, and version.
Tests can use gdb_version.version_compare('>=X.Y') to test this.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index a47f1ada779..1496cba460c 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -1,5 +1,11 @@
 env = find_program('env')
 
+gdb_progs = ['gdb-multiarch', 'gdb']
+if config_host.has_key('GDB')
+  gdb_progs = [config_host['GDB'], gdb_progs]
+endif
+gdb = find_program(gdb_progs, required: false)
+
 tcg_tests = {}
 # tcg_tests is a dictionary with following structure:
 #
@@ -7,6 +13,7 @@ tcg_tests = {}
 #   'name_of_target': {
 #     'cc': cross_compiler,
 #     'folder': 'folder_for_test_src_files',
+#     'gdb_arch': 'gdb architecture requirement',
 #     'qemu': emulators['qemu-...'],
 #     'tests': [
 #       {
@@ -33,6 +40,18 @@ tcg_tests = {}
 # is guaranteed to be unique also. They can be duplicated by setting 'test_name'.
 # Default name is derived from src if 'exe_name' and 'test_name' are omitted.
 
+gdb_arch_supported = {}
+gdb_version = '0'
+if gdb.found()
+  gdb_version = gdb.version()
+  gdb_arch = run_command(python, files('../../scripts/probe-gdb-support.py'),
+                           gdb,
+                           check: true)
+  foreach arch: gdb_arch.stdout().split()
+    gdb_arch_supported += {arch: true}
+  endforeach
+endif
+
 # plugins come first, as we need to build the list
 test_plugins = {}
 subdir('plugins')
@@ -46,13 +65,14 @@ foreach target, plan: tcg_tests
 
   # return a clear error if user mispell a target entry
   foreach key, _ : plan
-    if key not in ['cc', 'folder', 'qemu', 'tests']
+    if key not in ['cc', 'folder', 'gdb_arch', 'qemu', 'tests']
       error('unknown tcg test plan entry \'' + key + '\' for target ' + target)
     endif
   endforeach
 
   cc = plan['cc']
   folder = plan['folder']
+  gdb_arch = plan['gdb_arch']
   qemu = plan['qemu']
   tests = plan['tests']
 
-- 
2.43.0


