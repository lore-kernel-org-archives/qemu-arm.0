Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B425EC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9b-0003rq-2H; Fri, 26 Jun 2026 19:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9Y-0003gr-Ip
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9W-00045b-Ne
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:08 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwoPZ2098345
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rQylhokNiW2
 6HOahB+0zaOcX4iTao8YaEK1JAHMgfTw=; b=nYmeGDRVVODcv4UP2EYBkmfriD0
 d9JA7JIPbRwFiXFtRpzf/nUDlioO9sdfT9befe+SkOpAl8luGI05Ou/6A2Iqw1dp
 dvSg0pccTa5K4K/88ELFduQlcAVgXZ7cGrRiWdVSmSkex9OBu/oBCTB2vtQEeuTG
 fGTGLS5NrvjpEzmVGIgZPoG3aCBhNCP+Un4eyyyFuEoPRbfLEKihniSmVLQtArCe
 JrGpXFX+JKMbjWVL9fc/r7+DEZ30KIjvGTtfojI4Ia42aP6ITflDW5ViQhL9QA0V
 6xvpNAr+ptv+V0fdOmJmn73fei0pHmfIb20qeFM1H8InOnxu1tKGdMNybdw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xxvgtkp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30c8d355dbcso4220870eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517195; x=1783121995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQylhokNiW26HOahB+0zaOcX4iTao8YaEK1JAHMgfTw=;
 b=LOSFxE1o6s1k9EV0ZXSYiR4+cyEH4+HwBZq249t93wYQneUtBkI7WKtS/OKG5oAdnt
 ewYrALuEooznXlkZL1kS2HG0rmufOV49xmGGfP8Kt4jhN+o1wrTI+xAS8kaDYQzpCI5g
 9uCuCdv/Dsp3FI+gCdh6AH8Bo9B4XNp4XU7Ef6LmCTfx4zN9ZN/jV9Lr+8AP9u3SvJ6c
 22761N27UTETKF7Vztc5Ha/9EGvY1j5tHxae2apJDC3e4fOyLtKnGcCywpeM5mdsy9l3
 E7/ZCjYgNt1pQUx+cgAMyzX/tKQatzVUQebtYV1uNpr9tHPXb1ibCY3cZKdcaPR644j3
 RahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517195; x=1783121995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rQylhokNiW26HOahB+0zaOcX4iTao8YaEK1JAHMgfTw=;
 b=I5Iw2S0h8Iwq3O9Cdak02cINUTAwqoLxOJ7dDg2zz8calTBXLf8ZjdMjSmkNfLyAIj
 Pb//ITykF0yRbhGKtgGIPWqWzUtcl0H0desbrxJ50/uJ4f49Plx7grkt+4iqsdYe4dbi
 DmJAtBueOsrtZo8Qbo1TIfGIAVxaWRZwYBFACpYKQhgZQPV68OF22A4QLoyFzrlzEnY/
 ImgXygH59pGkOZzF1BseQQZXa4LipF5U+cxz6gwlEjeOIciGMc6YyQe31D619CPZk1ln
 y9H1pMItVNhj+vMKIYqQWj++T+fl8RaomRi2xcLXOoUZYrlaZRuMcPB80Uv6RIISfroX
 cudA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpbsXk4FLF62hVV7kntziqhtaCw3nQ00PrqLqVJGtEvBl1AFULvmnqIKqglqN0aqJVgp/eq8FkNNQ==@nongnu.org
X-Gm-Message-State: AOJu0YyseB2ghhUpT2Bm7DRiam+8g25kDxftyogBZBrBFK/wW/zrcOCR
 3b9hKkLxFNjpNVa42VBw5OAV84Rcfm/H8RTwqyBrZDEtDIToQnh1QeauNYxLYa6ch4M9LUey+8v
 Xm51VgddrG4ge+TlVeyi9Xish5epFrJZcGYHN4RvUVgsjFLVDEUbZMv0=
X-Gm-Gg: AfdE7ckerOm8wLluHcPbwC88mwt08LBECsGJoLXzJsX3zXo727BXEqzYas/53U+Xr65
 RDO1Bje6+mdByDFfT190CNkWfyn9pUj9WMITd5gcOHtjDlsbIxNzrO8QIO4G9cimWl8lxhOp0TE
 5juj9qZ0aOAnkyM0mY8KxvMSsdSGIwByLDQaovnHsMsi3UGe3JF2/ASJo3NwQSUq8t+5Eu6iTFX
 2tWouttg389JAfLghHDNrMpetRbsyvBzNEr/7AqnvQSkicvQWh+6ndjOUpx7k7dQ39RxmWorJms
 ZqfGP1r6Rjc/5Vrgpu2WYZFRnzC+YthIqzA3GzKEZ3XWnFEIVAzcKr1CubjIuBQSPn00kFII6wS
 Y/nT6XBOEWDG2lviyj/5jWJ0uJEpffB4Omxk/bsird+JANXac63zHyyrTP/7BUII34x/DFfA8d0
 DWiEwhDA==
X-Received: by 2002:a05:693c:6385:10b0:30c:ab97:d7b0 with SMTP id
 5a478bee46e88-30cab97dbf2mr1179040eec.42.1782517194571; 
 Fri, 26 Jun 2026 16:39:54 -0700 (PDT)
X-Received: by 2002:a05:693c:6385:10b0:30c:ab97:d7b0 with SMTP id
 5a478bee46e88-30cab97dbf2mr1179016eec.42.1782517194006; 
 Fri, 26 Jun 2026 16:39:54 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:53 -0700 (PDT)
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
Subject: [PATCH v2 22/37] tests/tcg/aarch64: add system tests
Date: Fri, 26 Jun 2026 16:39:03 -0700
Message-ID: <20260626233918.158740-23-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HfBbqpMfCHiHpb114XN5mTl3U7KEY30-
X-Proofpoint-GUID: HfBbqpMfCHiHpb114XN5mTl3U7KEY30-
X-Authority-Analysis: v=2.4 cv=BLyDalQG c=1 sm=1 tr=0 ts=6a3f0dcb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VjnBZxq8liE_eFJiS68A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXzM0emFuAKC4G
 FPygFNtFVZ5WhOagkRbV0bdPTYhp/F5dLA/uU0J4AfyYFLnKyCb8jdmHNwAb4kNzstImL4yJvnD
 RnInw2xPi5/+Nk0fIqDaYlbjtKTIm65eCXTZLNjbSzTdE5O3XY6bC+is2Qu2mIf6QC7MMx2JRGN
 15+5DQSaUGNYirjCI7sJOES5/tLAy1HqC1mPYmJZYkCEEGb/GWzWKBr62wn0cR5dPxEgyAE27B5
 dr9Ra9ts77yvt1bdjIsok6HoH4sFABg7rljjF8kyBLRcguYzfuyKvlyjWnIogxVXHp5O8VQqgbk
 HmGaY2EmeVbljTTCST9fR5KVc1S0E58QqMpODxaZmUCyGCzsZsEUDLj5l6bTttOba45KAXqbcB1
 ft8hTZQ6B9caEpAHPVHcwiAbLWAdsAtth371/V7QB5/I/K+qVoszkM3yncaMMO0z0beX5IcioGN
 LD2hBJha40Zdxcyma1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX5M3bqwm6eHqE
 OCeUjx6vm4tqyHeyUTp2qgI8tqpFrool5mL1lzU8a2rQ7uUD+MJeiT+yT79NwsccJDs/Q7cniyE
 RfN0uho/ERuw7bw/uo7TwJ4Pqj5DqZc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
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
2.47.3


