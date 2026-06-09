Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9615CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:50:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JR-0007MT-QO; Tue, 09 Jun 2026 17:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JG-00071T-1R
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JC-0008FT-8k
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:33 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4Y403567369
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ohdlov8MLGy
 MC3fdWCLpt9IUMTgal9ssjm8dlZ3h89k=; b=WLM3vuiRF0tl2ciQb1RdTP17/jB
 /t1+o/wS/5w5G9RZNAZiHINXtihVv+TMyQxPw1naESKBuJe7cbEPmLAWBZ9kyXi9
 PIfFonE6oScq71V/UXK3JEotmgtAn26ts8HJeYQdPV/ihOEvklmTQPZbtCgDyTZ9
 sCjJi5eH/ANmn5gM9zEr83ev7v7Ddjlh+4VIliuzhqz9UtyWZkQefR4Wcp5eeR6I
 aub/+Xy0LGxUv7p01Pp3WWV1iQtbOXtryjGw0UGFWuLcipvo/DR8h8O7MEb4ZSKZ
 S4GGHdjrE+FCyxTKwqX2EqJQhOyjdD6HN/0twqPGbCL9Ws9LhyNXKkY4nwQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4kyuq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1383975f18bso53818c88.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041703; x=1781646503; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohdlov8MLGyMC3fdWCLpt9IUMTgal9ssjm8dlZ3h89k=;
 b=SNnTLzTGdZ4uSCYsKEhyCKXbsN4NFu23sd3cRRqjEPQeoLnkFAAIZ9fbgKsTJFqaug
 Yr/zRQV7m2WYThUua35f/7vAHqpAvwIrU4SfMj4NyJD+MnXklP6tv5ZyimWvFrKQ8cmJ
 aL7qCAa+D4X7nzuGo3O5SqwkOCK8z7s7x7QGnZf0bGW95bIERHL5M2P31BA5+R/I1bwD
 tCrez2RJ0IjNPkoHSVY2dGD1JCc1CB4FAe89IsvVSBh5aosTLx8IL9i9AyBokAq7ERES
 ORH6e+c+XZHlrGOe5fs78FYw04ud4Mt+8V/sRFkEx754m1le1WPlTbtJyNYFcV56djay
 kOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041703; x=1781646503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ohdlov8MLGyMC3fdWCLpt9IUMTgal9ssjm8dlZ3h89k=;
 b=D6JpUBCBFPW6MPU1IFmV+fhtNAiq/LxQ5dcZfNTFbnZrQcxID1XXJ0NgKr/yWdPdTd
 SIBuWZt2dfTNeWnDk0Wb4zLpTpL4JyXmmSAxHGo+eIptmWW6x/osk7sPtYKiGAgcss5Y
 EOp8OC/zagR52808e/kA7YxG0aYA0Pjz4SthGc78yhe7z684e2CMspY16qkDJMsL48yL
 iSStPtp+HsGdt7belzAu/tCcrM7IEJFRgyzmDFk8AEoj9NJ/YwhU4Daca0FnYb4D3shB
 bhbu1RnQPWiTLZ7dD9/ayPuRKRq3b8E9gRNj3DAImpspijLFUFnAs8G4b3cV4Z+nQ6n+
 r94A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+gu2Ai8ZKQkQg8htfQNG56ScRym6oIggjJ/k0xGTSfRFGsmvlJEkaFzm4QpM5kr0MlRIMdCo7xCw==@nongnu.org
X-Gm-Message-State: AOJu0YyZ515zooN1RqY0pzIUL4dY/1acA9EDUP8FMBH2LOa7aaUJ9MF7
 82Yo8uXwF3z4lDTSDE1DfTaxR/3zjxJL6kSTAcdbYhQL4vmUTzcCh2YLbN05K2JuZ44NelXdREv
 xS+0knmo248lrS7NBEKOcUCnm5PmoqyKJcUXwuRhxhO6UbiwHjFg8xulgwrfFpwWa0Q==
X-Gm-Gg: Acq92OHHjjZRBlQMKegWXI9R1YgHiIdREMYtzP0AoSepOmLssGuDv8sgypsyllfvJ44
 iwOd8Dn11qompe/yCS+LNfcg0aAZ76PooTyRtD/6dT16LllHz3XZTVvhmGabn5dhD8eA9PMDHjc
 f/ecjvesfCybRBU5Z1YwpUzlx/1+tPQp4MnF7DrmlGwugxAcEQAlo++UrAbtmvdtxFic0yaSjBh
 p1bE6KonDK6q2r9o1leAmKcUTiYdZ+DeuA6KGwemhEnQ000HNlsdJ1XrKHT7j7r4IR8Yg022kCq
 OSXCUJAbwWLFy4H4OWMlGZbFq/gsvYzoXibTSgo30WrQ/h8MqtuSg2qp27QQIeuGiVdFOItjaBQ
 puMLudIkIL/JkUfCAVnU0eE6S6ZFdBwtJBs/ok8VpGFJmPH8IjK2pZU7bcZf2+gwrzHe7UhJ0CO
 q2kX25+zAXPVgvOBFS
X-Received: by 2002:a05:7022:f314:b0:137:fc2b:1efe with SMTP id
 a92af1059eb24-13831a62d4fmr2263845c88.11.1781041703261; 
 Tue, 09 Jun 2026 14:48:23 -0700 (PDT)
X-Received: by 2002:a05:7022:f314:b0:137:fc2b:1efe with SMTP id
 a92af1059eb24-13831a62d4fmr2263820c88.11.1781041702714; 
 Tue, 09 Jun 2026 14:48:22 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:22 -0700 (PDT)
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
Subject: [PATCH 26/27] tests/tcg/aarch64: add multiarch system tests
Date: Tue,  9 Jun 2026 14:47:44 -0700
Message-ID: <20260609214745.772536-27-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a288a28 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nM4Zb_-IiONNN0rUaVkA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: nn_ZzkZRzzo9OQdYGDZGz5xhGCtip4n-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfXzNXPUrqVgbl4
 tKvb3mzHywFdHh97b5C2YQLWd/Q127TdaWfWyDdIssPP+PNLkaOYRXY5bdF0BoBOIKdpdSuOhKw
 Lb+jac6YxQ6Tg0KRqRxP/P294YPBDNStjXhqAn+SdlQ4UU3kuJV+rqxNmxhjfURPKOeJYIHcM3V
 T/JI/AgXZ/rtQVLHkbFUvSP3aAdVQldDaY8uv8XKw1pEWr/qH7VFFwCNtLVlHVrOrjEXb/YbDYQ
 5N+ShiTCL3Zpk2Ry1095TbHhf8qj/Ul+dgwYBXPCabWBiVAEgEDcWHCJ57JnToSMrM8W2cNjUTZ
 HZYYHFaFkd9dL06h2zMvAlWPdyGkuQerbsJB7zfZAtC64o3GPScq3iQz50GD4yfgVTVWmnXyBi8
 BvcFG0e5nFJQYAZryjAum4UKIOJrzAryrIyRJ6eYxP7lvfDxZpaYrRLDnNEDk0YtSGOeDzClddT
 7PQDcxXN0F2cvm5BmoQ==
X-Proofpoint-ORIG-GUID: nn_ZzkZRzzo9OQdYGDZGz5xhGCtip4n-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090204
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

We can now add multiarch system tests. Because of our policy to not
repeat cflags, we must make sure we only add those once per executable.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/aarch64/system/meson.build | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/tcg/aarch64/system/meson.build b/tests/tcg/aarch64/system/meson.build
index a1edf1b8442..2a613cca52d 100644
--- a/tests/tcg/aarch64/system/meson.build
+++ b/tests/tcg/aarch64/system/meson.build
@@ -17,6 +17,32 @@ qemu_base_args = ['-display', 'none',
                   '-kernel']
 qemu_def_args = ['-M', 'virt', '-cpu', 'max', qemu_base_args]
 
+# Multi arch tests - add cflags only once per src
+multi_src = []
+foreach t: tcg_tests['multiarch-softmmu']['tests']
+  foreach src, setup: t
+    new_cflags = cflags
+    if fs.stem(src) == 'memory'
+      new_cflags += '-DCHECK_UNALIGNED=1'
+    endif
+    if src not in multi_src
+      setup += {'cflags': [new_cflags]}
+      multi_src += src
+    endif
+    tests += {src: setup + {'qemu_args': qemu_def_args}}
+  endforeach
+endforeach
+
+if cc_has_feat['sve']
+  tests += {
+    '../../multiarch/system/memory.c': {
+      'exe_name': 'memory-sve',
+      'cflags': [cflags, feat_cflags['sve'], '-DCHECK_UNALIGNED=1', '-O3'],
+      'qemu_args': qemu_def_args,
+    },
+  }
+endif
+
 tests += {
   'asid2.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
   'feat-xs.c': {'cflags': cflags, 'qemu_args': qemu_def_args},
@@ -30,6 +56,11 @@ tests += {
                   qemu_def_args],
     'wrapper': [prog_run_with_input, 'X']
   },
+  '../../multiarch/system/memory.c': {
+    'test_name': 'memory-record-replay',
+    'qemu_args': qemu_def_args,
+    'wrapper': [prog_record_replay],
+  },
   'vtimer.c': {
     'cflags': cflags,
     'qemu_args': ['-M', 'virt,virtualization=on,gic-version=2',
-- 
2.43.0


