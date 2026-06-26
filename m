Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B975C43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG99-0003Oq-32; Fri, 26 Jun 2026 19:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG98-0003OQ-5t
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG90-0003yo-Qx
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:38 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxDx42746519
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bDcdYwgNzTh
 XsgxHH3XFPnMChdpFPwOSyZqvf1aj5R4=; b=OWNJPkKHn/o7nUsUkaqMMlgUipY
 pDNjWg8xaEijvQNmjWXm9IAV9b4ypOyPWJag8VyC9haNJhr6/PqLnpHzAt7ZZ4fv
 HF6JWkslkeB13XPg4EIGcLus1jSAlYeYhUJg/pnCVjXTDyN4XbDxAnEI0VJcxoGy
 BX+JGUWzHrkoc+UHAKyxecqrfMqIfYDb5mXZSsnyYxJ3ItkbCb+pvXHJUSBdW81I
 A4/IBEtQYlZbf9s8w1RoEMubSW4fqKeuiksozF6OdvhvUO9QixOOJbV+Ujqbpzof
 Yv0hFPI4YaaxZ4tO21LOsCxcO9kVNOi+hknHGlaSaFkBhiMjA5pkpzlUafQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1yqv0mwd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c8722a4easo2382574eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517173; x=1783121973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDcdYwgNzThXsgxHH3XFPnMChdpFPwOSyZqvf1aj5R4=;
 b=LR+Ks3hQLs6QZ7qYC/NqkJ5abzGO3ADQMUT9B24IyIndWZToeinKbSnzo4JMzDlXpE
 RFYFA6Bau3q9b8t0ZYs1TjU+g/vIzvAtbg+Jfeq/dVMDBlaify/xjUlAjfFegmFAiKsU
 BY497yGcC0jx0yTdAMuecDAfy1l4JxhIn1/DQUr82Uy3CBKkVHUrLPjgrCEdPeHOf/gR
 jHTaFWMUBidWUNZ7pm/XjTo0Bnr4AnoMkGDJWk35lXztmprQnRlG1zoCbT2NFcDniFvv
 vGGPmfw69y5ctnfIxk2PQ+cRAXHDRf5hl8P8icM2kIaMKiCTGFAkfSccqWSJClOmW5S9
 JmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517173; x=1783121973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bDcdYwgNzThXsgxHH3XFPnMChdpFPwOSyZqvf1aj5R4=;
 b=VjEDH42926efGXf1eaMtN/QZvfkrZdElsp7GNT8m73/cAELFdTUwtnalp8+1BQbhte
 sJh800CBS4vY72mWa7IN5KQAV9IzikpDZlerrL7Lf9VopoLasEIIzoT++5yz/xz51zMW
 Xdqu88igiJDVOz2SLadJWZmPPmsJebXUIZNYpW97F1GrD21oRe2lwBxeSBAr9iUrvtQs
 qbTd4LZAunKxW/P5R5GjEWP6h/qTpnx5o1SmacZGKS7FZ9mcRtUJR/9o/ibGhr/lo8qY
 X2iobKlO+BfpgYEYbpTQ1jE5b+QgoEI0hOelwJT1NVgcCx3xBzXje32mnfyLpxKAfzRX
 lhaA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoomOcFNyGbTE83qxPBB0d++5RAlOfg+tUKJK5b3ci8jNjQfxRA9YGF6ZKPLH93uQ4tdvbCRbGUHw==@nongnu.org
X-Gm-Message-State: AOJu0YzTjXIktycZEf3tSziXMD7vdV4E7tY0T4ZJ/jRuDU0KwAyhH1wn
 Grj5Shfyo5uYMWI9CB0pnJdBY0gBOnYd1xxtsEW7QmI19fIe+GoUubLjL7JxbVAuD8DcR5naTWk
 xR0zjnrvO3jfrDu7RfDe7ZD+JoI/SkIad9lRdjayYg3VkDcwJRFaJ19U=
X-Gm-Gg: AfdE7clDJ/KakrU5GAytsQsj53F2/40DyzIY2S5YYZzAhzwaUwTHMztYWw4KW510ipb
 Yx117xHhyV36N6OP18pCUhHZFQukeEkAlpFmVcYyQZ2Fa7wAm3YY58mYKvsKdyYxkqud7PJLEin
 6XCeAQ9tkf4x1IxRrgpU1e+ufXueo/5q5YlZKjXIooFKzkieOyUjSVahyVObOmprwGKIDVSQ3Mh
 lNeG3YqHkcXManNJJUJvhS3KLCt6HoHDF653drVLG97xn1eay7aPjDVM86q6ml0c8asghddMDin
 NP9l3fH8qsNgY615ZBsajHZeCtQh90lUCksIPxpO4WiUJUhnh2Mg67f2fsF1jDcIIYr4Qqo8llD
 +WiLqvBl4YwFa5oiehQvwxRFqctuuNEc2xrDopwcVrk27U0dJDMHeeCrOvdZVVeiMfiHdxU35qR
 qMl+q9nw==
X-Received: by 2002:a05:7300:c8d:b0:30c:1b70:896d with SMTP id
 5a478bee46e88-30c84fc39eemr7057068eec.31.1782517172872; 
 Fri, 26 Jun 2026 16:39:32 -0700 (PDT)
X-Received: by 2002:a05:7300:c8d:b0:30c:1b70:896d with SMTP id
 5a478bee46e88-30c84fc39eemr7057052eec.31.1782517172286; 
 Fri, 26 Jun 2026 16:39:32 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:31 -0700 (PDT)
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
Subject: [PATCH v2 07/37] tests/tcg/meson.build: introduce cflags
Date: Fri, 26 Jun 2026 16:38:48 -0700
Message-ID: <20260626233918.158740-8-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aoiCzyZV c=1 sm=1 tr=0 ts=6a3f0db5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xYeKZKBo3MRtsS0M5EUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H6ZqMorQFH71LFbxzmfhgK4NQWY-bGg9
X-Proofpoint-ORIG-GUID: H6ZqMorQFH71LFbxzmfhgK4NQWY-bGg9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX5eyhzdV6QDKu
 1GxyWT5bWUTVYChEIcnz6rv2fvN5Xq50OHNFzPoSfCb1omzwrj4m0CTTOhs3eUIj2ZoKOFdmB91
 +4Y0PNeDu3bPpyFUnVA5giksQeWWgZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX1o/E53M1oMGI
 NR/bPJb8HZ6WTowJOWChANc79HdRTu3XBWpWIAiKMnC6aifXA4XT+xfpMGTcCmTk702lMbzc9vJ
 /viyJ/P3ep1u3zm7bMyXqrl1AGQxN3L/xlAeg2XpXGeS8rlOPLPU+GQtzz69ySUY1mcRlaxfMK1
 I3U39W5J84vmJMfYhv1LP6r/rfGrJqQaEUbB3ysA+w8meDjnLv37so6hmih5TG+A0NbZiXbXHUv
 nwONuLQCy87PA7uTtGYWW6W8MU9GSowrdG9Hed3KOFaatsDQ4HxBB8ciNZFwl+CSEUFguTV8aBf
 F5c7yDFHVN1JJ0PzOMNa5RHKt5xeSUK1A1I9njkgjoxilXr3D+ZzIQreTJzpwdG7VktU0EstSkh
 HPOz1te3BQCoM7SAF0bfKrdS24s2rNgSw0548Vqwctm9F3c963UPMFYMltLxo4+cVegUX0X5216
 wgoClomKPGeDb6MCMdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260197
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

We add possibility to declare cflags for a given test. Since we want to
preserve the uniqueness of test binaries, we prevent repeating those
cflags later, for an existing binary.

This ensures one executable == one set of cflags, and if dev needs
duplication, they can use a custom 'exe_name' to override this.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 49c8681e53e..47a600e4bd6 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -13,6 +13,7 @@ tcg_tests = {}
 #         'src_file': {
 #           'exe_name': ['provide an alternative binary name'],
 #           'test_name': ['provide an alternative test name'],
+#           'cflags': ['additional cflags to compile test', ...],
 #         }
 #       },
 #       ...
@@ -20,7 +21,8 @@ tcg_tests = {}
 #   }
 # }
 #
-# Every test executable, identified by 'exe_name' is built only once.
+# Every test executable, identified by 'exe_name' is built only once, and we
+# ensure cflags are specified only once, on first declaration.
 # Tests for a given src use the same executable by default, and their definition
 # is guaranteed to be unique also. Several tests for the same executable can
 # declared using 'test_name'.
@@ -54,7 +56,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name', 'test_name']
+        allowed = ['exe_name', 'cflags', 'test_name']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
                 ' (possible: [' + ', '.join(allowed) + '])')
@@ -82,6 +84,15 @@ foreach target, plan: tcg_tests
               'specify a different \'test_name\'')
       endif
 
+      cflags = []
+      if 'cflags' in setup
+        if exe_name in built_tests
+          error('test ' + exe_name + ' was already built with cflags: ' +
+                'remove cflags or set \'exe_name\' (if cflags are different)')
+        endif
+        cflags = setup['cflags']
+      endif
+
       # build executable if needed
       if exe_name not in built_tests
         exe = custom_target(exe_name,
@@ -91,7 +102,7 @@ foreach target, plan: tcg_tests
                                       '-MMD', '-MF', '@DEPFILE@',
                                       '-Wall', '-Werror',
                                       '-O0', '-g', '-fno-strict-aliasing',
-                                      ],
+                                      cflags],
                             depfile: exe_name + '.d',
                             output: exe_name + '.test',
                             build_by_default: true)
-- 
2.47.3


