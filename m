Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34227C43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9P-0003Xl-Nl; Fri, 26 Jun 2026 19:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9O-0003XQ-G9
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9M-00043A-Qb
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:58 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxGhq2675930
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H21yoKvmbMIPgdRRrw3U6ivG2dyPBgVcsCsVENzuXjE=; b=h0VVhABWoaLrk/ct
 2Rd5ieJtm4nirGVFl8a9NjVCSlG95R8yef/LVJh33kC5/sCu+ABeUPwHKXYx3T5d
 ujjcnG6/SZTLEAtT8GjmLz6nfp+2RdtlYR5RNvehjbZK3mLLtab48e8hLaeVmZIz
 lOp2cBQWpb/Fu3oSgwTi/ZEvJx4E57VodP1wWibJU3ukq3C5HASvKy2b7oyr+qjr
 05LWMMhzJvyWuSBrIp8r5unufZF8tkEXS4QHpPlzXMF5wa2av7Efu0PSynmNh9zt
 O9bKZX1Uk3sJcdpcXuYBAC/NoKVV8xtavIhX/vySP1KeGSDi67jztu/DEhuo6/aR
 hKmhWg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xqa8uxc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-139b62317d0so5534026c88.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517185; x=1783121985; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H21yoKvmbMIPgdRRrw3U6ivG2dyPBgVcsCsVENzuXjE=;
 b=ROYJK8t6L0/JgfTVIFve1evkwCisajpNDoppnCinVy0MAtYO64sgRiFVFdon02uSp5
 TZgkeRpkrwMfftYYV1OgUKcCVMdNngJFv3HnK/b+/uPfOqgHmhCih8ySdAYpGCgHp9jJ
 8bBKqqo2x4tJNbrkiu4/4LdZOFmJrS6QOoWFixhBwm5L1AanlNHZXQgLEoJN9T87A4EH
 OCSphOPP3vI+ynA+OjpTfxrmata9v6oPeAX2vy8lK0WiUkxZBSew4KIFsq4R1lLZaqxc
 CGcU93clUXE23W6WjixMJdoTcAHkrAIQN1pW3MF2pdq0DSl0K9GnIisR5CdMfe9rgXkA
 leNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517185; x=1783121985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H21yoKvmbMIPgdRRrw3U6ivG2dyPBgVcsCsVENzuXjE=;
 b=JGzUe1oW1PtTZz/IAXw3HhAxLshccaGgpiSNXFS7fUYkKW6kW3ouTdoUGBvia0wMbE
 UHT+Gx3t9ax2tMNj4xRJlMKS3n3zMnxDIZ9P8Fw2x4TEV2f394aakbTiUD8gukB/WkJf
 rIf02wZbOYtMzYD2YLAddAnGkOK6JfFkltcQSDsCpQibFuweHOSSHyf2TwPtmwKC0YRT
 GoV0sugalGcZLciPGz5t6bgRrvNxrEEPflwjPFLN+lCg+fzNDOWvAB6uOCxmivnUConB
 LK2qVN1ODx5YNc3j/ddmvXTo2E3sjOi12Uzox5yGdz5x8JWSsOMBLi46w2HoQwUMhaoI
 eALA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQ4YJV+ZV1YReZi18XNOSQ/HFB5rmhH6Kd28HEZGJRb+Sy9tO2UQAMbgwLeVAaYiZVgSSmKofGcg==@nongnu.org
X-Gm-Message-State: AOJu0YxYvcLeLxpkYonEba6E5PYSgcfhvSeGpM2VWZwpfXzNNDElV5d7
 0DI9EkiEs/C1MWCWX7mwssK40/Pao7h1O+/W6ueQ+noLJnff8pkWruI4KLkwmY2cu8PtIUs0AtU
 FLJijUUMolYg++9vOJGwxQSwptUG5LJbIP32bKqZ3DAmccQmFb7l+kiM=
X-Gm-Gg: AfdE7clXJZeqNb8SsM0pudU5ojCTu7idVF8Fgn8GyuH7d+4t5Hx43uoiqEjeDsFH6dn
 M5xzZHvds+CIIBHvo8nwNI2yX67HdDmVdSgabFagVXjmJcfGVuHY7VjGcPgaXnGQnEiI6ebW3RZ
 pTYwvXYlIQ3Ly/BMwey88j7TB/EjNVEuZcLtJ2WGpl5F21VvAy8KK0jiJzupR3gUl6pgnLVj45E
 A8aMZbvEIVFt5xnCAbFBPPZiT0TdRCRSx7Zk7zvMAPAuCO8+H7Cc9NPNYKUSRkBk6zw50iY4til
 z31LApp/Ukn7/eDfsRUNz7lRA+c3X8gyTjsljLJVKSbh58LjQDgyQwQNyJZUNbWP3xJlMIyew2e
 Adb9Ho6wGE5yV8OwZTUrBaN+xPsOIxaqHblpnAPJwqWpweTuux2ISFmKoF+uTS3h32P9U9gl6WJ
 RA8EmILg==
X-Received: by 2002:a05:7300:2326:b0:30b:e3c7:27f0 with SMTP id
 5a478bee46e88-30c84c04eb1mr8892851eec.13.1782517184908; 
 Fri, 26 Jun 2026 16:39:44 -0700 (PDT)
X-Received: by 2002:a05:7300:2326:b0:30b:e3c7:27f0 with SMTP id
 5a478bee46e88-30c84c04eb1mr8892812eec.13.1782517184385; 
 Fri, 26 Jun 2026 16:39:44 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:43 -0700 (PDT)
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
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 15/37] tests/tcg/meson.build: introduce wrapper
Date: Fri, 26 Jun 2026 16:38:56 -0700
Message-ID: <20260626233918.158740-16-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zX5hwO8tt9sRgONJhrHcvtMFRcQWk_5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX9DbP+jT5xMg9
 nfUwfQxAfHpZqHP2MFfHt7v4eRAjvdtKj9GCFuWqwqAR9pqpsqBKapYe3CN1Thbvz6pwM17SQsQ
 H+pkpQthB3NeRDwXF3AEzZnZAR1geJk=
X-Authority-Analysis: v=2.4 cv=GPs41ONK c=1 sm=1 tr=0 ts=6a3f0dc1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oeoYDfJPrL2azRNJ8Y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX7KXEIlNLNP+B
 tb5HJkqrYXqbQpvfV0ZI7lKtwsXfH475IJOdpmz19b1T8vpGK/CFu06IDhXfpZtl32Dx9vaw2uh
 dNbcCEfHzqOeGsDLrdlp4sFudoNRx6n10QOArASWQ8kQcNEkLhb3BHmpKNfBY0tppqe750jHHor
 hZ9XzhYywazB/wOXrki0jAv7zhb/iJOUzC1CrQpT3+3s/qK+/RRwn2CmlHhWlh3W7QgLEiSUE9p
 pNn9gMdpnbewB76xA/TWvCy0tl596sr/8QZYVZKFtj+POJn7ne+AebAzVmaSiStNA0zm1IvSQK0
 hU8u1DV/Ell7RwR+/Kn7UC//2B44r+L+/Ak573EvdUz2uMLBapucDr2/bvxKo6q80ocsnyuU35e
 bwnwoIMwjbU3939j79Ei+xkugNQW7qJ+TBqp7YZ7OlfpcKpmgE7pWNoNHVL9Awg2sg51Tnm5+AU
 bCXhRBOZ9ZvNwgVHQIg==
X-Proofpoint-GUID: zX5hwO8tt9sRgONJhrHcvtMFRcQWk_5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
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

We add possibility to wrap a test command through a given script. This
can be used to provide any kind of ad-hoc check for specific tests.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index fa9c0d15342..ad4024f793b 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -26,6 +26,7 @@ tcg_tests = {}
 #           'qemu_args': ['qemu command line flags', ...],
 #           'gdb_test': ['gdb test args'],
 #           'env_var': ['VAR=value', ...],
+#           'wrapper': [program_to_launch_test, 'args'...],
 #           'plugin_test': {
 #             'plugin': 'plugin_name',
 #             'args': ['plugin_args', ...],
@@ -87,7 +88,7 @@ foreach target, plan: tcg_tests
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
         allowed = ['exe_name', 'env_var', 'cflags', 'gdb_test', 'plugin_test',
-                   'qemu_args', 'test_name']
+                   'qemu_args', 'test_name', 'wrapper']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
                 ' (possible: [' + ', '.join(allowed) + '])')
@@ -201,6 +202,10 @@ foreach target, plan: tcg_tests
               ]
       endif
 
+      if 'wrapper' in setup
+        cmd = [setup['wrapper'], cmd]
+      endif
+
       # some tests expect QEMU env var to be set
       cmd = ['QEMU=' + qemu.full_path(), cmd]
 
-- 
2.47.3


