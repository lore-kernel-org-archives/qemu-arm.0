Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED33CD98C6
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JQ-0007KY-Ax; Tue, 09 Jun 2026 17:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JO-0007Gv-65
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JM-0008Du-8c
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:41 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4gVk3229298
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=kZkSQelKc0D
 nO1UT5BgQ7/HImZykPe/T75yFvbdrt/c=; b=Bdg5mO0fEX8DzfvcPxqahSFOKWN
 8X6ZMKOsSma3e6VWghuxExUfRScRS8JxmnIxH4djXIFOWr/0ZoVl9Iz72IebxnRK
 jLcEki6bU2k1jO8jXupbFI8aCRNnzczyDdgw4+LBqusVSN8/wSYSnRLk/M8XKyYf
 niWkeVUkqO8qryag47smogJRRtTAYfrFpZ/2/XG13LUxmNDh/XHCsk9d0BS5uNSl
 EEUgW8acslnY611WbD+o2DG1/UO9LL78XtL2/4VXFnZtHImueuQoTW0FjIeAQBjC
 WSaYIPBuwPLDFxU/1LJut5Y7DdSCdx1M4TyBVmCSyWEWsccPhf8DUauhLsQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg37-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-13709ab38a8so7310145c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041696; x=1781646496; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZkSQelKc0DnO1UT5BgQ7/HImZykPe/T75yFvbdrt/c=;
 b=Ahfufx8cdFwhZj5t/0pkmcbGJieHY9WLW+a7KQm61DMR9FQpN+ksMN40vk7CTHHzpL
 2A4SZQMfrcM/bcrsVw5qzCFbQsJVV5NRvKAuVpi+Ab0ePclryEuVEz9Zon/egJumKn23
 GGvaDxZnwM4yy/N+R/lpHhTb2tV3uSMAX02bfOGWdptQJuKckgjFNWeDpUzIZW87XLPs
 GzhUr4Ndkh1JEa1Qz3xDutqOtFKbDSofX1SSJKP5YdsGFLHD+9oZmDn0aYM9HIRFcJOl
 baJ5nVombFKy7woCiBPZSVQaEPODwvKqF1FYIq3/POOLI67mJrPXyOd+u70FjjhKD5z9
 qv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041696; x=1781646496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kZkSQelKc0DnO1UT5BgQ7/HImZykPe/T75yFvbdrt/c=;
 b=Tsx0jdk5gGFllHmQ7AW6Od+lTpjUvHt+72va5QaTbcZTs4QGkLt0yxwZoJjA8yFnla
 8nFv9zhyKbqoPy81AiUWMvnxl+LQ0qQWY3s+Rme3JX5iTugz02lqhcsjWaynyC7Sv/pW
 LHCbvziUxnsjhKAZv0bvl1rwhXQxLRouUCuk06dU3VI993KX7mIQp27aPhLUrQr5oFIz
 ha8dxtjtmbTfpHdILfi14LS+GqkdfDmGUUSMqDJPicy0f0PacynqZyQA8r9xV3S+sric
 XoO3xqdiGDxsSf7vTMByiYyG3jEXOSeQZRbCVOzEvhGYRYK0uumA+YMLvrfXY4iLHBxd
 uWYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xUFJurfJVcwwGX81ufTzRtUO3wwzpwbFKfniYtLvixbAKFf4I45GSJNvRAW2brKKvkSJKp7oeMQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz5dEpknCT+Y9Ku17HvVJ6uTaBTBoDfnZhxf8SZTJkmXyC2d6lY
 xwh4kU1Evl48qyyJcqYYvBT3N7iULjX9q6RfPQ8ogkWMGXXsVF842sLv6OWnevHJzfkr1yPbSP5
 NjcJVvRt+WsVueT0HHtMkPuN2ERqWe8Osm7dyclu0RIWAFzq+f81+hBE=
X-Gm-Gg: Acq92OGbiVTkXnY+kVfnAVlGVUnzOvfo25Gipz/TH6+dMB8TnGnwOPErPD3Q34g/Ukm
 bL94vyJoSFRXh7mIbT+HLc7CWfjTcw4xVH9+n8FTzw9ZOUa6kK9HpE/oY2WdeWOM3FZtuE4BXkB
 LcKkpGFN9tnqja4B0NWeXuBiZKVmclZF8jqIWVZvjJ3sRCF0P8Mqu8Rbv9lynvd9WnVe30yMF4d
 d/hd0SONDYEbGIBZaQfFA5Gy56QLE9XtTH5CF8LhhISnLURvF/g3d1HOwJGS36nxf0duP6nborb
 C6bMJc56HQGP0IM75v0Of/GYpPF1kQxeHkYq+eSnK1mMT+DFBRYkVaSparpzonbzmyHANOMwLX1
 RfpQQXTq6ZQf7A4R/evUnvBihkXOGMyt5rFwvdV8/8oCj1XayYlUJi4wBgLPhd8wsbLoxicp1FL
 QXPUCCAG/gnFAGSqZW
X-Received: by 2002:a05:7022:ec1:b0:138:37a4:fcc4 with SMTP id
 a92af1059eb24-13837a4feb1mr583200c88.13.1781041696061; 
 Tue, 09 Jun 2026 14:48:16 -0700 (PDT)
X-Received: by 2002:a05:7022:ec1:b0:138:37a4:fcc4 with SMTP id
 a92af1059eb24-13837a4feb1mr583178c88.13.1781041695477; 
 Tue, 09 Jun 2026 14:48:15 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:15 -0700 (PDT)
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
Subject: [PATCH 22/27] tests/tcg/aarch64: add system tests
Date: Tue,  9 Jun 2026 14:47:40 -0700
Message-ID: <20260609214745.772536-23-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfXxcaodDBx7t7b
 1yhzYn1zOtYtNx2rHWXELXVLjFsBk/1eq5RDa2PUyke6oK8lwI3BlzR5OU+vgEV2ErlwHZ8sgey
 7sp8YVjhf6idvkztQylyLpDUQvwAmE0K9snoj9JZ0jdGr6AryJxS7CSIY6GTt5KUVxgMU6Yt9Ff
 ZTiyrTLqbGQMUwp+JrdoRSktU4sTGWdg2qb5WWXYWU3KHxK32NRrbad7CLXHIU/vid+OKYWlqkr
 dS0OmgUjPBKqnm4TW/ZDq2KbxQw/r5CMMM6vtKrQYn/HqwybiDgyRvptgsV6hXvGpXJYM5IJn+g
 E5zwiQ69q+Fyi0b6x962dWx1mH2etUNRo1wb1fJhWuzndXgUieBPeMsDKVxBd/JGytlcvfZ8gt+
 u+Ns+nLXaXBl5eVDvlE3ovGWmjS//H8tIMMMyMjoThszginebiw/2su1IQvLnsnNg9NTwaehY4C
 dZIthl4ZCfBITv6jUNw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a20 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VjnBZxq8liE_eFJiS68A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: coklzJ2njHrO5sx6Vd1iLBgpf-kzlSQv
X-Proofpoint-ORIG-GUID: coklzJ2njHrO5sx6Vd1iLBgpf-kzlSQv
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

Let's continue with system tests. Take note of how we don't generate
intermediate (common) objects, but instead provide a single build
command for every test, embedding all dependencies.

Besides reducing boilerplate, this makes sure we track correctly all the
dependencies for a given test. Compilation time difference is invisible.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/aarch64/meson.build        |  2 +
 tests/tcg/aarch64/system/meson.build | 69 ++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/meson.build

diff --git a/tests/tcg/aarch64/meson.build b/tests/tcg/aarch64/meson.build
index 9c42b129551..e6cf5309649 100644
--- a/tests/tcg/aarch64/meson.build
+++ b/tests/tcg/aarch64/meson.build
@@ -43,6 +43,8 @@ foreach feat, min_ver : gdb_feat_version
   endif
 endforeach
 
+subdir('system')
+
 if 'qemu-aarch64' not in emulators
   subdir_done()
 endif
diff --git a/tests/tcg/aarch64/system/meson.build b/tests/tcg/aarch64/system/meson.build
new file mode 100644
index 00000000000..a1edf1b8442
--- /dev/null
+++ b/tests/tcg/aarch64/system/meson.build
@@ -0,0 +1,69 @@
+if 'qemu-system-aarch64' not in emulators
+  subdir_done()
+endif
+
+tests = []
+
+minilib_dir = meson.current_source_dir() / '..' / '..' / 'minilib'
+minilib_printf = files(minilib_dir / 'printf.c')[0]
+link_script = files('kernel.ld')[0]
+boot = files('boot.S')[0]
+cflags = ['-nostdlib',
+          '-Wa,--noexecstack',
+          '-I', minilib_dir, minilib_printf, boot,
+          '-Wl,-T', link_script]
+qemu_base_args = ['-display', 'none',
+                  '-semihosting-config', 'enable=on',
+                  '-kernel']
+qemu_def_args = ['-M', 'virt', '-cpu', 'max', qemu_base_args]
+
+tests += {
+  'asid2.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
+  'feat-xs.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
+  'rme_gdi.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
+  'semiheap.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
+  'semiconsole.c': {
+    'cflags': cflags,
+    'qemu_args': ['-serial', 'none', '-chardev', 'stdio,mux=on,id=stdio0',
+                  '-semihosting-config', 'enable=on,chardev=stdio0',
+                  '-mon', 'chardev=stdio0,mode=readline',
+                  qemu_def_args],
+    'wrapper': [prog_run_with_input, 'X']
+  },
+  'vtimer.c': {
+    'cflags': cflags,
+    'qemu_args': ['-M', 'virt,virtualization=on,gic-version=2',
+                  '-cpu', 'cortex-a57', '-smp', '4',
+                  '-semihosting-config', 'enable=on,arg=2',
+                  qemu_base_args]
+  },
+}
+
+if cc_has_feat['v8.3']
+  tests += {
+    'pauth-3.c': {
+      'cflags': [feat_cflags['v8.3'], cflags],
+      'qemu_args': ['-M', 'virt', '-cpu', 'max,pauth-qarma5=on', qemu_base_args],
+    }
+  }
+endif
+
+if cc_has_feat['mte'] and gdb_has_feat['mte-baremetal']
+  tests += {
+    'mte.S': {
+      'cflags': [feat_cflags['mte'], cflags],
+      'qemu_args': ['-M', 'virt,mte=on', '-cpu', 'max', qemu_base_args],
+      'gdb_test': ['--test', files('../gdbstub/test-mte.py'), '--', '--mode=system'],
+    }
+  }
+endif
+
+tcg_tests += {
+  'aarch64-softmmu': {
+    'cc': cc,
+    'folder': 'aarch64/system',
+    'gdb_arch': 'aarch64',
+    'qemu': emulators['qemu-system-aarch64'],
+    'tests': tests,
+  }
+}
-- 
2.43.0


