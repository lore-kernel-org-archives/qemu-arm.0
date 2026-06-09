Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B80CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JQ-0007Ka-CK; Tue, 09 Jun 2026 17:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JN-0007G9-VD
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JM-0008F9-7O
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:41 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4dW33167645
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=qsjW7QrKNyn
 sfdqovcaksLcMw4O8hgy+cGosp4YWPgA=; b=jv/JcQ5YOv+xVCltl47yuRsU1NG
 c/X6fNsPm4hpQdWOWFAyXiykqhT17KwLyp2xtvmKPm8QC0MjKlBm049QZaQzSCYV
 ECS0gKL6Y6rdKEuqABTtNLTxlhz3l6N6/PeXAUaWoFNSZQ8g0ZAwqDwHfpiJgkwk
 n3G1bMo8qiV8TvnFthAzfxBCbuW/cg50v6nv5eHn4i2lJv8FIqA57eCpn7/HshFn
 pPBoUI9jge8EGjDrBgs+ZxV5NVPRKegp9eshFwHcBuA93oP38GkV2q+tYvm5gD1a
 yz0w4TMcqZX8YW1IfrDtsKD0xPPuWwgeGqZG4ZIxM5Qf8u6T04Wg7NdBWiA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenrc0eb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-13815e0e6baso5108114c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041702; x=1781646502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsjW7QrKNynsfdqovcaksLcMw4O8hgy+cGosp4YWPgA=;
 b=aP3LRTTFQo50BTqk7WgLtoShikvIm0Ha3pLjySIpyEbXz4jpgTFZgzVRJP1TSfuXi2
 M9w3NCUHzWSycrIJuibUOKKN69m5iwyzFvjVnfliQVMW45r940lEisgosJ+B6s9jJFWp
 Uto8j5zK+dhBsYn7J+Tov4rwjwQPi7OvhodZp8eMEZkNy+SUNmX23U4+46IDwWJMw0TV
 rVq+sF20zQ43ztcrEdYyVat6Ei1gOFcZ6cWHAJb/DseGqQb6jNfDUSChmaH97OtpOjvG
 HZZU5KwEGlh4iIfHIzwAdXQtwUhobiRdMGln8GdyC1UavOQ1P/1BSIG4SPW80XFay9et
 NLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041702; x=1781646502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qsjW7QrKNynsfdqovcaksLcMw4O8hgy+cGosp4YWPgA=;
 b=l4z2soVVfmhkjK4wvTt9bOUtBCEugR/eAnuTRyDd4tEypOZhA2ycQx5Eoiy9TE5sgJ
 RRhxfA5tRYCv2txzy5sWjAwxigtQMvEymDA4cCGMAaIBPnzhJkcOOfYyrJqkpgtJd7WL
 FNzjEWb2BgX8si8Uc88mUtow/v0KNBm5nZZWQg/GUKZ7Qhwo5KdX36xSaXcmHmd8ElGK
 fC+DE8knmTgglTZ0YdLyKHfjdPeNSsqEniZvKXtjzs1SHnTGv2MMpJRyGmwmoSCuGcJM
 K3Oy+j2jJQREdtvXSdZm3PVvLRR3ggxyv8BykKtCud3t9KeYgJ7kUFrAZeZk29YOZ022
 C4iA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Oj00v8+QJahEREcX+53x5hWLC1sBuJWwMDU1DZh0vhku8cF/dqgQn2v9Ji/8skHC6tPbIAogY6A==@nongnu.org
X-Gm-Message-State: AOJu0YxRAx6u6EaXYzD26sFvPCCU4xyDcD98G8pLWnfsSOoJLQaXpbUY
 X6BYZDoSMTb5alHdcKEObZs6ihE+bZ5vwiq4UqascIJM86bOZSUXhykOQT7VjV+JE2+TJBkrw6E
 g0Av15eLLxyJMNOYmScZbZNyTqcSm2KT0kO4DihSfRytVgndsAqSdx88=
X-Gm-Gg: Acq92OE5a3lxU54cwS9GAHl4Setf+9VmIDNle+klbKOVXiBl5KUA1ibIcOCpLJBSp64
 ljvL9KV2ehBRjVzR5pnziKmx3yl7BHuIctiJ/DnwlfVgmtXpO6beu4bmHSsXtI5isv/CFVv+pB1
 71X4fTunAeKvHKkGqMgjcppvaGpptNBFnY5pmIL1rPcnSvniLN/anx/uJO+GeWnC262+aFFigBE
 roQWdPtXUdZRaJZWPN0aJx4TOYJ75y8r6mRlH8qWbOc7MBOprpkTUbm9tN/NxozVktPDylmdexi
 k9mAGEubGPe++wpGR4QDEeLF7VckUUL/zM2xpaAKgtJhKOT+pUSMFAVRu283LdkDt8tDyS+aZ9Q
 Fu3J4UZBnKiO42sV8Te5LwFIrDZZvrBX0rs9RquW1zmxPgiB+alPpaKl3s3hReBqPfiuMMEANmi
 OFDrwG05RcJoN79dpL
X-Received: by 2002:a05:7022:4a9:b0:137:f49d:3388 with SMTP id
 a92af1059eb24-1380670b402mr11382910c88.21.1781041702405; 
 Tue, 09 Jun 2026 14:48:22 -0700 (PDT)
X-Received: by 2002:a05:7022:4a9:b0:137:f49d:3388 with SMTP id
 a92af1059eb24-1380670b402mr11382888c88.21.1781041701863; 
 Tue, 09 Jun 2026 14:48:21 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:21 -0700 (PDT)
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
Subject: [PATCH 25/27] tests/tcg/multiarch: declare system tests
Date: Tue,  9 Jun 2026 14:47:43 -0700
Message-ID: <20260609214745.772536-26-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r8xQpgZMye9e_ZSG0QOOfHDWU8-ZnF9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfX5kUd0AvJxx+5
 WzqyRhz6W6DVpb8dFegiebl4JzlX/ZHdDPtpvMh6aG+CuvnnD0d5WD236ddepxowQnz9Sa7CUzN
 x8qirU1zqTniYAD+cYt9yFInZKtka879W7LwiPiC58+XVbRgl1gC4bR5Jqpp1u/N4Q0Or5IVzV6
 1qe8EapPlNXveN4X2KNx54l21cPxgJcTLyAmBhBfQptpBP5dV4OwtIulf3GYRhVVE4nGe6caSRL
 lxBuDgwL5+Np3xiv5ZfT32tuvmmYgEEqucB7OlMGVYYkjDYlX93Q+4KTbuNOGJFV/Vi8WDgQsHd
 3LxNQWFX3FtEoRLpKhiF6qjnDlhZL3t19jUfd5l9roSszf0zzw32yc2Sfx0C1+w9vMuOZm24vRZ
 HsEHYQ/B+HY+uAJrYru8/EurEnuq8ZpHrofnz6zbGefg/TdgZbzlAPXbI29hiyUscIKKKbtilGR
 hs/Pgu8ROToYvW6FrNA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a288a27 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8vYM-gic8w0O4C_0kjEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: r8xQpgZMye9e_ZSG0QOOfHDWU8-ZnF9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
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

We now declare all multiarch system tests.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/multiarch/meson.build        |  2 +
 tests/tcg/multiarch/system/meson.build | 53 ++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 tests/tcg/multiarch/system/meson.build

diff --git a/tests/tcg/multiarch/meson.build b/tests/tcg/multiarch/meson.build
index 99af41b3fcc..508fdb585b7 100644
--- a/tests/tcg/multiarch/meson.build
+++ b/tests/tcg/multiarch/meson.build
@@ -1,3 +1,5 @@
+subdir('system')
+
 tests = []
 
 float_helpers = files('libs/float_helpers.c')[0]
diff --git a/tests/tcg/multiarch/system/meson.build b/tests/tcg/multiarch/system/meson.build
new file mode 100644
index 00000000000..f71c12db38e
--- /dev/null
+++ b/tests/tcg/multiarch/system/meson.build
@@ -0,0 +1,53 @@
+tests = []
+
+# multiarch src path are written to be included from any other arch folder,
+# so all arch can directly add those tests.
+multiarch = meson.current_source_dir()
+
+tests += {
+  multiarch/'hello.c': {},
+  multiarch/'interrupt.c': {},
+  multiarch/'memory.c': {},
+}
+
+tests += {
+  multiarch/'memory.c': {
+    'gdb_test': ['--test', files('../gdbstub/memory.py')]
+  },
+  multiarch/'interrupt.c': {
+    'gdb_test': ['--test', files('../gdbstub/interrupt.py')]
+  },
+  multiarch/'hello.c': {
+    'test_name': 'untimely-packet',
+    'gdb_test': ['--gdb-args',  '-ex \'set debug remote 1\'',
+                 '--output', '/dev/stdout',
+                 '--stderr', '/dev/stdout'],
+    'wrapper': [prog_run_and_check_forbidden_output,
+                'Packet instead of Ack, ignoring it']
+  }
+}
+
+tests += {
+  multiarch/'memory.c': {
+    'test_name': 'registers',
+    'gdb_test': ['--test', files('../gdbstub/registers.py')]
+  }
+}
+
+tests += {
+  multiarch/'memory.c': {
+    'test_name': 'memory-access',
+    'plugin_test': {
+      'plugin': 'mem',
+      'args': ['region-summary=true'],
+    },
+    'wrapper': [prog_check_plugin_output,
+                find_program('./validate-memory-counts.py')]
+  }
+}
+
+tcg_tests += {
+  'multiarch-softmmu': {
+    'tests': tests
+  }
+}
-- 
2.43.0


