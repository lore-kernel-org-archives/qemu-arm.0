Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750BAC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:42:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9L-0003Um-1S; Fri, 26 Jun 2026 19:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9J-0003Ty-Ax
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9H-00040M-Mv
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:53 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwpVs3842906
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=1D9F0cWfuHg
 6rzDmCItN7unesvXI6SEuxck8o49D++Y=; b=o2HgsHao8aRi83TJGzFv/msKyh8
 0GqLgKRuewKN/rBSpA/siFBvIOOSodLXMt8HM+kVbyM2Es9UItcrYOdgIJiFnkVS
 qaryBhccRCQDnWlFJFh3zLel6YR5rOeGGuF+KgjTJltuyuDAQj8b1V6Y6XV+/75W
 XahHR7oKYIqAKhVHvzpVBGQ0D9sUCh4A6aYcwFP0kDBdf5nv0/6fOtJkQpY13BN5
 RcSKRtYjHORX8GeLqUPjDD3FYK7r7dz9WlZnBNmrbGTx43GuEot0J3FZ3TzvbPUj
 /ailBHCU5Alxmj4iJ+SvXVx5fgXwPI2/nmEyT6/B+9VNBs8LG9poHq//8eQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f21wvg76n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30ca3374c6aso2723647eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517175; x=1783121975; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1D9F0cWfuHg6rzDmCItN7unesvXI6SEuxck8o49D++Y=;
 b=K3gmETsARGYJkpdiTrRnljnRwpi/y8EGHWMfOJWVKNpFUeVgHRyNG9z0hm4c62Y8pa
 wiaeftiKMw079i3RvQJrl9Cp/CwBrPWbrFVI9ItRMZSZ1Jr7HzKk5IRtv0WoO1o3kyCU
 xLpdiTqXp3BDBYL2b0aoBSxvzaCSggAf7TEePs+i3WOPUUFoweNivQwXIQBzsIBdpSlD
 xb/Z32U4BD20WR2xvuG8+0+ftosHCtx4EewProh8a1+7LaFl+9QC96VY4nKN4wzBM70P
 EyoXfxjSSI2ivHT1oXeIHJOStVRnGK4lWWmW4h3jFDojcjpNUAQECNTudxq8qgLzNTe9
 Jvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517175; x=1783121975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1D9F0cWfuHg6rzDmCItN7unesvXI6SEuxck8o49D++Y=;
 b=Q/dYOxlUOIvP5XtA81hp+KY2K4unAc2ZldKlwjY1sp+fLbMqUbXMEhGbyRy3/5GXsM
 OM6pB1C3ka1Qa/yhObmZUARdnfp8oym4YDm6X5l+vyj+L/2qcmoDxi1B+IBHwQVdpIO1
 OcI1asm9XcQar+B9oPCJWmCYPM1f4jV7boKfkmjPemcg08BY2X3mqg4y02Tbsrty2DW0
 U0HtC1PelJMS3c4CeHDRdb0LjS156vDn481GXYjKkRj0U2JTS/J3AvZaupG0G6pFIMfW
 LNX6fdRZadZmokq33EFEFyYksfTZmkyF524mSBQBh8YWleSWlfEA5/LTU90p3GCLt7Hz
 5HOg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8bJbWXo9S/a4MbkqPQ4iYFWPyEellcJDqIuK2yAwJB88skE2TdMn3sc+sq7ntQX6EY9zpm8pISw==@nongnu.org
X-Gm-Message-State: AOJu0YzvVMljfP+GPDZSGt6SpPpcbN2r8JP3SefYMNCRYntYebD169qx
 krec21Ua7BIi3SFyB2VSsxKKMz8uwTjXoQTO4oA7sl12vvI31g2aKNHH8Gjhh8BzvqGgItWOmD6
 fF4Q4CFn1WZJ9HptPX+QDf3MXfM09i+80ToUtKhxfCbaCHBST6I08IwP95PkeD8U=
X-Gm-Gg: AfdE7cmNps+ORAnNsgO5vf1zwnAr0hRkafppCUK0SmOc/94v5Gcu1fAE3Nt87RlNpNN
 ufswWxAZ5IsMkNQPCF5wDcwnXb+zqnX+7xO05PhcFAIoX0NARPumbzQzK6RGAzRLq8lrfIVngGx
 EIGIYr59KTb1hH2jrHcSHYCxUbTX3M0/YXe/swtDdjyAdbHo4Tc8KPhaxFfe9mx2Lrr9eNugFGU
 vwkcW3qiSytLgoCQLijw8RUVZQ+s6OxYX1TToHeuF2dQfOQtkbd2j6C9V8CJS07yQzIrnzi4fCR
 PWybvGDX1x0hd5Uwf+EFvOvqCio1+5Av7Jd2ZpkH1blao62ltHkbhPg1PTgb9QeFB1zrtlLwpTK
 KAdsr2L0EWqg3UGbfKPZIsCcKvY9LlaxXXpd1cKLDmi9TZSOErU9+sETxXOEup85za+jQPvOqgV
 OpfYxzJA==
X-Received: by 2002:a05:7301:60b:b0:304:705f:e4e8 with SMTP id
 5a478bee46e88-30c84e270b3mr8228921eec.32.1782517175493; 
 Fri, 26 Jun 2026 16:39:35 -0700 (PDT)
X-Received: by 2002:a05:7301:60b:b0:304:705f:e4e8 with SMTP id
 5a478bee46e88-30c84e270b3mr8228900eec.32.1782517174963; 
 Fri, 26 Jun 2026 16:39:34 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:34 -0700 (PDT)
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
Subject: [PATCH v2 09/37] tests/tcg/meson.build: introduce env_var
Date: Fri, 26 Jun 2026 16:38:50 -0700
Message-ID: <20260626233918.158740-10-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eszvCIpX c=1 sm=1 tr=0 ts=6a3f0db8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=gbQ6B9eDvqgx0y-0Ix8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0VAkN2xroQvjwhnAVsT60TLen5uVZegj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX8/65pqRUoxcC
 yf317sHPOYSqu/2ZtB2Le/lelMEnSOONscXr8VE9z0vnZ+GTHv3g4oMrxLNJs+jlrA/PL5K6mz6
 ok2fFzabIvznkJSDTZHXPZa50DOO6mRHv9Nn1Gio3ZNBq1Eca87Gi0MqfZCoOJaLxA70vkRwy0T
 UKFtzHtk5XDI2dPfvp+qaCkmbUWcK+zH+ZVh3CR1LQ3MmIx7DtEW0Y9RTLqqSGcs/FikEmwvvuh
 q0v+Kh1XLTzQc8WLY6ekBYYMOPsYb06hw5k1uHbFmRQMOHD9wW44BFLakw6pVx7NbrOoeSzGW2s
 ccrm9gOTrWQAJ1Mw/qMd+4tbCtQkJYGmFlgyEj+kKpZBGbJJ+pSsXdpDCeEamIiT/ihlDvyreg8
 lXrzli8UfVXkiwXJcWWIkTyj5Y3XmmZOmQmLFvbE56awgUyi4tmxHT5vul2PCwO3+Ay0zi7SHm+
 OVndYjNGOGVn6Qcmzeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXxMrapTyAEtdj
 7/v/DoU9abufsZep91k+bN4S0oh9/+m/NpHLoEXgTyzDCtweezXfOKzicdVAf996uocdLAh2vQ8
 yTp6tx8TscyWMDowxTN1/qU5JTJukPY=
X-Proofpoint-ORIG-GUID: 0VAkN2xroQvjwhnAVsT60TLen5uVZegj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260197
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

We add possibility to set an environment variable when running a test.
An example of a test requiring this is
tests/tcg/multiarch/linux/linux-sigrtminmax.c.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index d1a5bf3deab..c7830d2c17b 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -15,6 +15,7 @@ tcg_tests = {}
 #           'test_name': ['provide an alternative test name'],
 #           'cflags': ['additional cflags to compile test', ...],
 #           'qemu_args': ['qemu command line flags', ...],
+#           'env_var': ['VAR=value', ...],
 #         }
 #       },
 #       ...
@@ -57,7 +58,7 @@ foreach target, plan: tcg_tests
     foreach src, setup: t
       # return a clear error if user misspell a setup entry
       foreach key, _ : setup
-        allowed = ['exe_name', 'cflags', 'qemu_args', 'test_name']
+        allowed = ['exe_name', 'env_var', 'cflags', 'qemu_args', 'test_name']
         if key not in allowed
           error('unknown tcg setup entry \'' + key + '\' for test ' + src +
                 ' (possible: [' + ', '.join(allowed) + '])')
@@ -122,6 +123,10 @@ foreach target, plan: tcg_tests
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
2.47.3


