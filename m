Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92347CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JC-0006uC-E4; Tue, 09 Jun 2026 17:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Ix-0006gJ-PN
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Iv-00084e-WF
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:15 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4grI3229239
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=deUn6wLqpr2
 xGWtdEzVNdGG7qxVt8rPS4faBh+zYGEE=; b=h7axax5GGVM2N0DJK+BfNiGhACZ
 ZHJf+NTWAY550ZdYDrD/StzQhhurlDXj1FmgB9G3bN0oLbVzEVnmUWYi62mFWvts
 s3Sn9f9PEwg20nW/GV3K1cQfvWklkJlze6abxrpmqkiUdAQKdCVQocuj3IrBdtT7
 O3mie9/k+bs6+xARLPXA8NJzwU5boAq7DljIX3a8RDGvuXDk94vCQrnI44FNlbhm
 qEWimrZi5wF4D9l5lTx0jXyPaUs/M4UAgUVttdbLiMcJKlZmnMW94mNvLdGZcgSV
 vKlCF/N6hzERJSLdOMNxVesmP8+S/PlPBrMwublBkMsqCMH1gF+Yj4dOieg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkg1g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-137fe4a3640so8865770c88.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041682; x=1781646482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=deUn6wLqpr2xGWtdEzVNdGG7qxVt8rPS4faBh+zYGEE=;
 b=FBGUTgvfYsrD4ASDwR2p4Xh9Vj+nNbJsKCZLptt2dC8jJmwZlhe/Oz8IL+1xvDO4WT
 bxp4GqUuV4vpwe4sNoHCWBKlrKAaF7TSA5Op/5QW0pcu54u2Hdy61U9p/AyyyhwMBdUF
 NiZnds6v4cCXQc0p0yH9JztBMyPviqPOVavqoc5d62iVZN7dqVpQsdH+DHUrbuupuJ4K
 YP9MesGwdTQqXKSVqQDA3VJsbU5X7hyNUwPuad3DDmMaXq/PMpwwq8D8y03kdbqO/bTJ
 a7rlV2EBxV0mDNHmz30cu4vrMBAUQyXgWkBkqY6lg24XtxX9V5w4T1aOHdYGsjcEeq11
 mG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041682; x=1781646482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=deUn6wLqpr2xGWtdEzVNdGG7qxVt8rPS4faBh+zYGEE=;
 b=SrD64aACgEKyX9E5erMi8U4qLcP1lqQbCzVNfLwE/qdko+STuo6oBD662nTXtd11k0
 wbWcQf4Hb4HlQqFkaWFuI30pcPJ6RASvzftdx7dawLIqN57RrVRjj6GhkXrfjMVuB10i
 QXAkod2/S3EBQJTzFwyIzlvempQq6NWeqe0WS7P+Mh2cY7nv/ggp2irrl2UJ2bp0ypqO
 xHhD+jPXfxfKlaxTiDA7SyfljdE/Avx1LCsceIrcuPiS9Wrx7pc69mBkPNFLqK4/N7eM
 5BoAFKr8RGAZv6eBrM2SAR2Ygy+py3eOArtBMb5RdkC0GrOm6ia244mNtAbjVTZXiDaE
 VnUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9x2o2WUgkz8Pa1JvQjJAkR0fNT6ZOkT3ALgCQtj7B0RRe4oY+z5+q9bCbYlsRLZrolIWdiZqxPVA==@nongnu.org
X-Gm-Message-State: AOJu0Yzmar2FLJoSxB8m6fd46GUH5IN3CoixCP1z2WVdkb3FipW7o6/U
 kiQc8uL8ozcDjY7N9rY44aRNJ2YHruAc8Dayh9EJX8Z2Stq4zK7DQ3G5D1oeZ1MJ2IJ/EKtwrRD
 xGFITaZymP4f8KJqp8XRHScJQzHL5bTu6ovkcEXm/Rn4oEGc3iYrk4Ng=
X-Gm-Gg: Acq92OEBuDcHsXxiL49/kvet0RhN1XN6LllKd/XSGsoL48nEKnyO4m1XvqhL9tm7OEt
 OayKXFwH9oG59oJZCQA94XU8CLtEqizVZxSAu7wr0sXUZadhHFQgBPUSd00UW0cou8jsK5DYuxe
 +IDPhbO3s3dxKc7zO4sv46kNVmhfRqWDAq4dtRLDTr89Qj6hR2cDj4BBJ6yvGSe9C2geVLQ+Ojx
 8MYp/jdBh3GWc+mqpWDU8cJ04pSB/hwGMlbwjuAh+oogcen562ls2xNlKxUSU7p91zfjVIWh8Z4
 mLZxQdiO+W5lilTj8W7Jjr9RwIMnRF5vE3qiCV6wOim0i9bjK8YfmPR9ZlrrrLBbEOzorAIRyHr
 jsriCtZfGHDXY09SAVT03Yb6VDllKh6yyVmP78TyztRw4clX20hTTYv664AJdElfg4nZu7B4Avx
 7ZIEvL2AsC1eUN/y9t
X-Received: by 2002:a05:7022:32b:b0:138:136b:6154 with SMTP id
 a92af1059eb24-138136b620fmr11083096c88.28.1781041681942; 
 Tue, 09 Jun 2026 14:48:01 -0700 (PDT)
X-Received: by 2002:a05:7022:32b:b0:138:136b:6154 with SMTP id
 a92af1059eb24-138136b620fmr11083069c88.28.1781041681383; 
 Tue, 09 Jun 2026 14:48:01 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:00 -0700 (PDT)
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
Subject: [PATCH 09/27] tests/tcg/meson.build: introduce env_var
Date: Tue,  9 Jun 2026 14:47:27 -0700
Message-ID: <20260609214745.772536-10-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNSBTYWx0ZWRfX7z++r7YxrAaj
 N8YzNVaxTEGUzjGhbL/a+Mrh7jbnjROOAfBD2jre5PB8hdqejXGU/6k2EUws3ltveRmWffFfFCN
 30BL5zXeqbuoqwDXqBYKkElKsCTgmWrxMGegCqfcZscIkkQVN/Rdu1qpcWZzgOa6E8IlbSaKItD
 ZptTZMGqPL5DltTUMi1suIub+YnqC9C1tRBGA69UekGD6fSfYhnQg7maGyGvdChET+8BNuks78F
 e4oD5GkK8FZ2swLUF6HA/AFh8pOFA0/WqkZxYrM8/e5R8pINai3n+esOXxyHd61qEogwNHNBoO8
 Ec05Ry1dt8lUsvbpBrM1EPNJ+qM/OeOy+60l4u9pEVmeOchv+x/hMb4IMYmppTn/ku4ZglDovOp
 M9dwkdH+cJK3FCSYUgpekYC4/kGY30btA9MHXdzuuduCPU+0vQ2CfwJo4nBf4i/RkjrsLs/C8t3
 TslUZHA5+ZIN3AqAU6A==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a288a12 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gbQ6B9eDvqgx0y-0Ix8A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: T2y8lUFvzpteAFKjz8wWstLMz3e-2PRG
X-Proofpoint-ORIG-GUID: T2y8lUFvzpteAFKjz8wWstLMz3e-2PRG
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

We add possibility to set an environment variable when running a test.
An example of a test requiring this is
tests/tcg/multiarch/linux/linux-sigrtminmax.c.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 28a7e529c7e..b6a375e9eee 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -15,6 +15,7 @@ tcg_tests = {}
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['cflags to compile test', ...],
 #           'qemu_args': ['qemu command line flags', ...],
+#           'env_var': ['VAR=value', ...],
 #         }
 #       },
 #       ...
@@ -55,7 +56,7 @@ foreach target, plan: tcg_tests
       # return a clear error if user mispell a setup entry
       foreach key, _ : setup
         if key not in ['cflags', 'qemu_args',
-                       'exe_name', 'test_name',
+                       'exe_name', 'test_name', 'env_var',
                        ]
           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
         endif
@@ -120,6 +121,10 @@ foreach target, plan: tcg_tests
       # some tests expect QEMU env var to be set
       cmd = ['QEMU=' + qemu.full_path(), cmd]
 
+      if 'env_var' in setup
+        cmd = [setup['env_var'], cmd]
+      endif
+
       test(test_name, env, args: cmd,
            depends: depends,
            suite: ['tcg', 'tcg-' + target])
-- 
2.43.0


