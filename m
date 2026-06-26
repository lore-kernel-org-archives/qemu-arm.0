Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D09FC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:40:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG93-0003NZ-5c; Fri, 26 Jun 2026 19:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG91-0003ND-FE
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG8z-0003y1-Iu
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwpRJ2098355
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4iPG7HgoCwy
 yn3cVBfy/apwnSNpE2+3aArsuuasPz+M=; b=TGINbvTjC0twA9DIVN4jPw0+VqN
 qbflU3L82n1rsb2yfKyHtth1w8Lvyu6zKRlExEVnHJ5BkYxwS0OW/VS+BE34WjvA
 XnMkXgzc0GBlu3Z12q9+AvMjgUhOn9il0c6ZWLLGctI2PprBKyOHO2WElHPgt8zN
 nk7I6xd7CHyG+alc45bHRWsEWlolfpiO03CUq+Uhv9M7g1YFmhDagPWDQF6NJFy0
 BCWEU/Xm1S07zhC0MB+2GlvL87Y30u+RUoUDMo2ZAj+YyAT3uk8CQDyoP50yuFEE
 ZyT6dnfPHuKiQGz5l1ONgTlLf0gNKWKd7TQiZvVGShuMRAzoqP5vLvmX5oQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xxvgtj9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c42d96713so1188212eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517171; x=1783121971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4iPG7HgoCwyyn3cVBfy/apwnSNpE2+3aArsuuasPz+M=;
 b=NtP8hXwTEQc+SxA5lWmgAiGcyOuUoOIg3ZwQ00dsQmpEqFSlshiHyEOYE5z70oZUms
 Ea/QJBoWzMggtFa3ifh5MoKj9BtYrS9IC6TE50I0LQT/IJCDzaB5yZLndl96CoI+Ittd
 bb+ECictFTzw0oCI9xndpQd8N5YQd0PfKt7lVVqd9+0bk2m9zoaXthEk1285lcg4ZZn0
 +7i8pNJs5P3HvxHihv5SRsUtY95xM6PxIqja9g0Pcd1cac6PWHni4+AaZBgZOYRLTB9m
 1thMbYBZJdrd3u+dgx1Jp/ILYkMJkKa1Vrs5jd/6LgM05BQjuFtQOZgLgVHFM7XA8V7E
 p+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517171; x=1783121971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4iPG7HgoCwyyn3cVBfy/apwnSNpE2+3aArsuuasPz+M=;
 b=VIISqm5G6+tu7N/FD2f7DuOl3mJnGYjdHsUcQ0U3Lv/KzL7jSBAI4ZrwBb2Omstu6J
 v+urfgFChkgea0JhtVChJNhM3nxww5xaWcj44ULfIMrLEjhd79tnFeJBUWLOjsJf2qr8
 dy8Vq5s+1Yy+ZaOmChDcqgJ4KZPprvty5o2wersecf0Edo96naEP3Jvsdi9f0WxPIlso
 RzkTpZ0Tp0v23+UhgMNX0H0y8AlEH3f7NcJMr63HPosqdTU2lUwlSjEZXU9QOLwBl71z
 Dy8c3jU846s94f1yj6PTqCLwUQSn7DNPZL8Gl68caOgnG7+MxvlZCwKPX6aOhVqEPrFO
 LsWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrYfz7J7pB4jDCU4ctWAicFGEbqlY1I6AGxgNTb18l6N2Vw+u9Am8DILsLuzgOpZ75Dbpyp70YtFQ==@nongnu.org
X-Gm-Message-State: AOJu0YyWQJDahO6WtWd/rSdLH/eBb0pW7UoDb/nmLuKYFL5xLC9o7HUX
 Y7cVoHNdk1TNDm7NnspkaqlIzDxRKhWG650goEbmB12/X7ssR/TWNaRk17ZRwiE+ReVpS/uy0+4
 ENjD6yiMgUggh2iy81N15pNAHDW72fL82vJKG1XHrlzwo4bneeRKw/3A=
X-Gm-Gg: AfdE7cmNMvBAnjaEWV3174C/def17ieYJ/kUSmhfbTm04em+QvTFy0JuxyasIC7jIsY
 TRCehMFhE5PsT3jLfHf5klvm0UkqqZYWobWngiOvNChiaUF54vF53PoYx/QSsykLtPwubIfrbv/
 ODF7TYNbALt5z5GWBfBWvxLgPV6/InwivGcedbLnz94FDKDjB59fsR5mt9Hixz++AUPcCDmuikY
 cl0uO6zlsCQPQNs/hdCzhWw4HACLV4Z7oRXnZoN2yMc5M8ueszQaYgEAZXs2uxfwlTWRXRLQ3eB
 6Lwp/xavCfwVr/mVQroXDQoJgsO1VJrlGWMg7W1fdIDyQVy2S3+QJQmZKM2Z5Ojo0TOOJ7Z1itm
 BAlgq/b+lfIB7IeQgGVuoNAPOvVqIcypUARK75zL4lByoUI34FXKwUNqet2YQh6PguPdGgX72DK
 JFeFrR1w==
X-Received: by 2002:a05:7300:6143:b0:30c:ab4f:9b9e with SMTP id
 5a478bee46e88-30cab4fa14dmr1882160eec.38.1782517171482; 
 Fri, 26 Jun 2026 16:39:31 -0700 (PDT)
X-Received: by 2002:a05:7300:6143:b0:30c:ab4f:9b9e with SMTP id
 5a478bee46e88-30cab4fa14dmr1882133eec.38.1782517170931; 
 Fri, 26 Jun 2026 16:39:30 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:30 -0700 (PDT)
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
Subject: [PATCH v2 06/37] tests/tcg/meson.build: introduce test_name
Date: Fri, 26 Jun 2026 16:38:47 -0700
Message-ID: <20260626233918.158740-7-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ogKfkhmhpzzleOjHlZi-nTO5YWsTMSuW
X-Proofpoint-GUID: ogKfkhmhpzzleOjHlZi-nTO5YWsTMSuW
X-Authority-Analysis: v=2.4 cv=BLyDalQG c=1 sm=1 tr=0 ts=6a3f0db4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=FnD13UrixhZlOC8LVz4A:9 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXySEGp9tL9H+i
 KM49EBcWv7SArOE/VkFrv1nF5QDhLJZ9pc3eUazqxfjVycjkX1DPOUtvM/hMXXiakA15nGixRL0
 J3+DNpFlObCMjjdlrE+ZuTBYL/ohWWBHetlPjICPkSKDx6aOShxjhn0vQV+sLury2a3ksuDIBkw
 Q9phZ1WW1+ZIooswv2+ny/DskOksn4ajSMicZUKJLXbtl/n4h6eBrCv5VVY4zeLuPe3d1FXd+bQ
 bwe/+eylxjyqJavARdrasxUL6QUCj0QCDMkcmRoYaeKarjAQO3aVUykuyjJm0OvPAd/CrTn8xlc
 ohp0nr9p7hb96pu+LRog7uN9onTZ7TNEhAvLIaNtfeJQS84GwIWiBaPX2plgp0lsumPi/DPK321
 i6WIbbdwp2P1CtDHTO+qjrlioZn8iwHrLn8qiR4ZpP+2SCGnDT6sQdRjpEUIH1K34FI/HNVq4yW
 6hdJXNiWMxoeKAgQO/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX10C2Jux15nO6
 ZH6HueH7ROOvFsEkJeuq7IXy0LGIkRG7LR+Gz8p7dSt1eQszcMqaJNWXz3P/FCNU2K8kUr+bSQA
 CHe3Fa0rP8UlmkJvfX27rf1ZlygHyhw=
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

We add possibility to duplicate a test for a given src. This allows to
declare several tests that still share the same executable, thus saving
space and compile time.

A side note to mention that meson perfectly supports declaring several
tests with the same name. However, we prevent that to force dev to
clarify what is the intent of each individual test.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index d2b11bd6593..49c8681e53e 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -12,6 +12,7 @@ tcg_tests = {}
 #       {
 #         'src_file': {
 #           'exe_name': ['provide an alternative binary name'],
+#           'test_name': ['provide an alternative test name'],
 #         }
 #       },
 #       ...
@@ -21,8 +22,9 @@ tcg_tests = {}
 #
 # Every test executable, identified by 'exe_name' is built only once.
 # Tests for a given src use the same executable by default, and their definition
-# is guaranteed to be unique also.
-# Default name is derived from src if 'exe_name' is omitted.
+# is guaranteed to be unique also. Several tests for the same executable can
+# declared using 'test_name'.
+# Default name is derived from src if 'exe_name' and 'test_name' are omitted.
 
 # plugins come first, as we need to build the list
 subdir('plugins')
@@ -52,7 +54,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name']
+        allowed = ['exe_name', 'test_name']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
                 ' (possible: [' + ', '.join(allowed) + '])')
@@ -67,8 +69,13 @@ foreach target, plan: tcg_tests
         exe_name = setup['exe_name']
       endif
 
-      exe_name = target + '-' + exe_name
       test_name = exe_name
+      if 'test_name' in setup
+        test_name = setup['test_name']
+      endif
+
+      exe_name = target + '-' + exe_name
+      test_name = target + '-' + test_name
 
       if test_name in added_tests
         error('test ' + test_name + ' was already added: ' +
-- 
2.47.3


