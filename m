Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0077AC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9B-0003Rd-6L; Fri, 26 Jun 2026 19:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG99-0003P0-9Z
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG97-000407-LR
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:43 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxDep2675871
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pJWsk2ojtcgw92LwGjPWMswgUVyDfpZlPL8if2Cj6l8=; b=XTokW934bwI/gXaB
 LL9UHwBroFhHSn3f3aAfQpdBq/qNRkIg1HmpWNDfyTH/WwRXTdl7M5jK7s8Sx7Pt
 esZh3HZQVDKGvDtFMXMhGNQo50fK39e+CuI2v2Rq5ATI5LtYnf7+uBfW8M5Ti8CE
 doGyNuD+zvPVU3GzXNIgLqNHcbvVtN7UVNsphIXo9Gr6Matb55zb8HJRE/3gfycX
 xvaYmP4kdzWD1sof4uWrsm1cR/nWIwkOW4qHYgFaby83E6YppRzR/EM/CslNa72A
 y+kzYQKUjRDe4yaSheSSAUxDQ49KVa84ct5AdfwVW5O7PcOWPZBazjrNOSPpwA8b
 WHA5fg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xqa8uws-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30cb2bcbf7cso376895eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517174; x=1783121974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJWsk2ojtcgw92LwGjPWMswgUVyDfpZlPL8if2Cj6l8=;
 b=Th7Il7bTLg37wLnZjpWngPZLmnItvGIvGpRPJD/+/idAUpVebiQBeZfj7mDGzR0yJO
 vYfJp8w9ny46XUjAQXo+q44fP6Q+nAr1c8mlzp1eunadDQBxOS2vC4QUSi9siG4hxFts
 DxivVZxUBcDU8n2p3MJiuEZhlEBMjmk0X8oQy40R9RnJV3d6HKUZzNHqjIGLepCLJ6jt
 HhZ3/VCQ7TO+qi8cddCWTg5dORDnnCfQbMpBYZJusHUH2rwQ9xX00tGYZwOOs5m+lNAJ
 rk+dJ/jllLw30Zv8hjpiRbcScCvXJtKoim0v39TZLs56mI9SkqMaM300dKFNStsKWKrk
 4p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517174; x=1783121974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pJWsk2ojtcgw92LwGjPWMswgUVyDfpZlPL8if2Cj6l8=;
 b=kxj7krvaMKHnSJkhFyNF3d+wz/qgr1FyX4okxgfuWZnUfmElTnaqKOyfRxWKV+fsd9
 +4utzL+DBGMOjKBnqGEp/khqN9Q0OItjBeBFxPfCrB9hVDV6rIOsr+v1FLVu8An/GHPJ
 cHh0mtht7e4AgpWQpYj2Cg5XEirdMl5wYpFCsasiGprVuULLGcMohERHVZbc9JvNs2vB
 rNJdU0vWA1/rHBC2n8D54199B9OpAz6cjBJ/QSCxmjTS06BvjNS3bq/A2H8loFGY7I3i
 EgLzY7KL+9i6eoJnEXiFkxZuEYreWZ7gygm8Z3ETz4ZSJ9iLNTSaAjWeo0DonhBB1KH1
 tpFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGhAmS00gk61r78UH8aXYBHwrmhGZs98khUEDkMpac6Yy9n+ZjGRWi6L02ztlpdx6txxwlwsoOWw==@nongnu.org
X-Gm-Message-State: AOJu0YzjaySr0rPAuw8ylSGWle7B1cK8ycmjizlmNyYYE57ZpOUJVAoE
 sgNn4mrNT6q93kJl19tzMnvswIUeHr3+UlenkWSclSkj44c3DnzxuuMiJe8fAudQ23UyuY/szd+
 KifPDjKZdKCEHds1PdcV4CzNLiQAUVx1YxbtqMCMhjR8unFCYrsBNfXI=
X-Gm-Gg: AfdE7ckxAW3igeYlJz3/0NiTwa6arVXGCOMYkBILtvb2vQeGSToaKyX+Bm5kWeWbNMc
 jqt3cdw8wxX7BsWB6pwHF1r0q6uVSiRjggZCzF9010MzgxltB2QvSsbIdOknzOP9GfY+HjH0a7u
 At7kCGHu8Ape/u+HosSo39oMFe+TYS9mxUuT/wyVky9daVlYVzcLjI9wAopDT+PAk/Y6euXavB5
 tPchJBmIrK3MSfOBZUK2Awbg+3ZKR5yiiLyF+W/SIAHCT4F3Fvd8Cnyehy5oB9KxYqMhLNtxZdG
 GKGT2K7T0HrWCH73Exbu5nU7SGbOSirzk4Xrr3DvtSPSeDluXrLc0TpOPLATmB2R62N55SLCJqW
 myaAwDNwFu5FObaQ3tXEUKU4TG8dIXL8pPbFu9VrXR/aWjtGbK08MplXapwH/9zQiXzVUztc094
 SyMKeV1w==
X-Received: by 2002:a05:7300:e801:b0:304:2e00:5fb5 with SMTP id
 5a478bee46e88-30c84b2cb38mr6657298eec.3.1782517174249; 
 Fri, 26 Jun 2026 16:39:34 -0700 (PDT)
X-Received: by 2002:a05:7300:e801:b0:304:2e00:5fb5 with SMTP id
 5a478bee46e88-30c84b2cb38mr6657269eec.3.1782517173702; 
 Fri, 26 Jun 2026 16:39:33 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:33 -0700 (PDT)
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
Subject: [PATCH v2 08/37] tests/tcg/meson.build: introduce qemu_args
Date: Fri, 26 Jun 2026 16:38:49 -0700
Message-ID: <20260626233918.158740-9-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nexoIk8kR07oeTNIYI3NMcaDNYuVNZH0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXxD/CYDz/haar
 cFN7T2rLgDbdfFwZlG6bbM646emm2mZ90urJJ4IxKNEzJLpV+9BjA8egg+POruj/DWCcRej/A2j
 x04ZMBB08cIF/Ct/9mhNBcRfOwOyoUQ=
X-Authority-Analysis: v=2.4 cv=GPs41ONK c=1 sm=1 tr=0 ts=6a3f0db7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=BgapuaGD2VAwZ5NCc8gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXz3gGrnKsM26r
 Y50UJiRb16tXSpGhfvQ/O2QPQ/gO2+zLnphUSsYT/eE+8LyIVQB5DgnoE4mb6dB53InXP4A9GRG
 3/5knQ5rD9ySltvyx3DqGjjQ6U5gV8SWwN9n6TRB0TOSXyKzR3WCTNDMXIkxVExGitDWluIfI2S
 kn6kxff2dxADKvvZHtL18ETvgD5sYhpyqwBTqotHX/AxLir4kjum9GHtXOCjGRkJgs8VzdYm6X9
 LB5DEieuD4Me7kyvHrP3KbBSXd2jcPC19bshUyuvuPfpnj6yJ4LgArbIsgKH4r7mUs0z1IS+OR0
 U/Lfg+e/9tUoqFwCZZJ8BnitzZWDKuQsjh0B1wINBTl5e0oiAY7rIvGVmfEsFj98AgPoJ1h2rkY
 fHt47GvxEDFdQPlVacBx9LFKkrCIBiAcz7pCnXhSVBLsWD3Vpk5c9JeBncOhNXhwP7VPimKFfD6
 g+tHM7sElqq0u77wdmg==
X-Proofpoint-GUID: nexoIk8kR07oeTNIYI3NMcaDNYuVNZH0
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

We add possibility to use custom arguments when calling qemu for a test.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 47a600e4bd6..d1a5bf3deab 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -14,6 +14,7 @@ tcg_tests = {}
 #           'exe_name': ['provide an alternative binary name'],
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['additional cflags to compile test', ...],
+#           'qemu_args': ['qemu command line flags', ...],
 #         }
 #       },
 #       ...
@@ -56,7 +57,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name', 'cflags', 'test_name']
+        allowed = ['exe_name', 'cflags', 'qemu_args', 'test_name']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
                 ' (possible: [' + ', '.join(allowed) + '])')
@@ -110,9 +111,13 @@ foreach target, plan: tcg_tests
       endif
 
       depends = []
+      qemu_args = []
+      if 'qemu_args' in setup
+        qemu_args = setup['qemu_args']
+      endif
 
       exe = built_tests[exe_name]
-      cmd = [qemu, exe]
+      cmd = [qemu, qemu_args, exe]
 
       # some tests expect QEMU env var to be set
       cmd = ['QEMU=' + qemu.full_path(), cmd]
-- 
2.47.3


