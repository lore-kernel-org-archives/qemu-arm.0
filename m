Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6435CC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:43:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9n-0004fa-PI; Fri, 26 Jun 2026 19:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9k-0004PE-SG
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9j-0004Lv-1O
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:20 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMwraV794983
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=99bpuWSg6o4
 v5qulMLRIRcUM8YO8KgbmTU2MCc2c3sE=; b=fScIwhf8vZRh3W2XcGA8Q/7aEoC
 /OV2NLapxxqVONC8C4jqT4Qgoj8dSuYEKmowVkqzu61Cd7K7GTUet1vPbfxxNV3h
 14OkfIwL4buFnEdhaVqjgtaSmsrOSqtGvCv8KenWKQz8wKQRtyntTrgsFycSkjGA
 pNR77zbZQS+MnKYXnc3S5RwI3n7nuJWhni0hqxOrvu51ua+XK8vk66QcKcMObohH
 TnTstR8NxLUCcdFC324NkwL7dgPNTgAbSnPEoXbRiF/ay3DBBhXDN5iS++rz7NAV
 YJbEo/RlfhDJpV3hvymBDUC4VQE2GXMhC15bMJe/1D5go6wyehvTvn2F8Jg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ups9kmk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30ba395b047so4488523eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517207; x=1783122007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99bpuWSg6o4v5qulMLRIRcUM8YO8KgbmTU2MCc2c3sE=;
 b=LnkP2uW2Y1nqeJQ3J69DSDLXi77O1dBSV/9sRN2LxMaltW56w41V+oFZT/SBC9/+Z6
 0ib4QANP9nRoHmaF+vCU6fhbB6Ia3kQQZ/9Rn6NJHNJ91qcwqUizk/iQxGH3rQqErNy7
 4BKzmhq4yuXk6tz0DszMQvusyfYnqiLDdPmkyGYibjSCb3jovs5XNN0y704fVW51GfYu
 ZM3PN1jwSB/S0G6x2O7SpHlZ9bNhW2/OdB3KBonXR/8Q1Tsy0C5QOZHyV2YYXr8Ys6fl
 WIzjPoeWUd1uTrzSzgELqRKgsqHVanipY8eO/6+thCClJJEx5PWND6/PsYEWZSLgnjIV
 LZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517207; x=1783122007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=99bpuWSg6o4v5qulMLRIRcUM8YO8KgbmTU2MCc2c3sE=;
 b=VUrZbEhvLU6AxsLDfnmyUdVyUB96iAteU3hYGb6ok6Erotas/GRDqcmz7nA3xaUn75
 epzFCAFJIR3eNV5TG5AuhF+WaWDHL0+fQeP/CEEqMJD2btkp/oN8mEbDuwQjgHP3BV0Z
 zj/r/GITD/2fMRXqMDk8SQywn8NoUCgHA/hN6CL/2YfnJsz3tmDxxZn6Kcz0oVlkRaVB
 hk2RiNhS/zHZNUtOX68LCix+yTuqBSbfuicRSVhpWZm+B2y5UzJp/jvmfHbAnhdKCAtp
 DIjCTidp5RUMH92U9zqrmuxbmnwKdwUUWy57tg1OEhs0TkHtFcd/+7tj0ARVJOdqzMVN
 lI7A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVsKlBkN9CpFiJqyn58VxMMbESc6JtxipA3EyHWJvRmLq5a6JJjhFGT61tZkL3NyjXTKx9ZbH9Fw==@nongnu.org
X-Gm-Message-State: AOJu0YzMuIAcqv3bBg5NK+VjZbyaOirAD97Cxzq6BRMB5JVgSEyhYldP
 UTWNDBRd1w3X+gwljeP7j3Cqe9Kxre8nwXsVqmGPyZM3QwyXzYU+BZkJfhanbhXY8mdb9sr+2H/
 LT0hN0zmV1UWX0PwgIeeCpwsoYA2vvIgQnymbfsga3T6MO3dvhRWfYUY=
X-Gm-Gg: AfdE7cmXf5OmxmZbHy7GuKTrLYBmD7dPku7U2qvwJF30SsQERx86vy4uq0esVsqGuir
 OGDJk+ptA2BQKeeKjrGy9pq0VPaI4M6memF+rPRoOoz3rYr+6kQc7RpvxUvhmzSH4t+kyttfpoo
 Dbwyn9PcT3NC+xUTtAH46g8AjNO4pQU5QYNXqBoS2w9IME5yKI7/ME6wzTXvftSETdYL/5fCEAN
 g9eUdMdq3wkYrK9Lk2uFwbpokciJ/5i0iASF0lNZnxDznDzLlJeRML7TRAI6jS/aGZzjOmcOg4M
 UcF7xhWK9e7rs9klg6XMkKzi77Hlh2iNUJf9380aAMKwnWkxmLi/zqe1hD0BVsx1DCNX9KAZbfJ
 g+HRA1K+zxA7is1rJdK5YDyg7fTNqc6nQyxfauBF7RVfTy3VC2272kd8FysjaozeJx2Pmi/y+9R
 zdN92dbg==
X-Received: by 2002:a05:7301:e04:b0:307:4797:ccb8 with SMTP id
 5a478bee46e88-30c84e99bc2mr7950402eec.32.1782517207025; 
 Fri, 26 Jun 2026 16:40:07 -0700 (PDT)
X-Received: by 2002:a05:7301:e04:b0:307:4797:ccb8 with SMTP id
 5a478bee46e88-30c84e99bc2mr7950372eec.32.1782517206515; 
 Fri, 26 Jun 2026 16:40:06 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:40:05 -0700 (PDT)
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
Subject: [PATCH v2 31/37] tests/tcg/meson.build: move gdb_arch support check
Date: Fri, 26 Jun 2026 16:39:12 -0700
Message-ID: <20260626233918.158740-32-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfXyqnwZdqwtJ9P
 5JtbmVOUG1/busZ3982ysF/dRXXjaK+fofI1UXhKiKKVEC85O5EBuMHufPspobzFTdGUoyA44Gn
 UrGmCpkwbdTu3gwNyMSdGOvWJ0Ti1d8cIRP6Mq1XR9BJ8dK57+Lwto/QlYY5OGh1a5sacxD/yp7
 W0wSUB5zCICQihvQO2Cn/bJmSySlJZROQb9NBht3+wF7yr1L92dmYbPA1ZNipIf7jRaDYJvQA2M
 940gpT8mXwJMtrs+g6BNvntAIe5A01Wkf9JpWL96QwRYApVLswNKxpsUeAZYaRk8Kep+BPjsSTO
 KXJK9wYkqxlEPMqM0cJYq2wBQl9GBRsWc1FY+zI2ZUycIkq3EkGwx8L3JHIdfRCUVdXMePvtYYh
 uhiRJCROnOn5pZkovDhJ73OwUnZblwpo/+yEv+i+Ud8Epb11ppRaLQjcPLu+zxMraojTb63EcYp
 ZHVvpNAJt7v7w9y9ufQ==
X-Proofpoint-GUID: YZs7pzxwU1b8iUtPx7MNwYjkuOlp0yfg
X-Proofpoint-ORIG-GUID: YZs7pzxwU1b8iUtPx7MNwYjkuOlp0yfg
X-Authority-Analysis: v=2.4 cv=R6kz39RX c=1 sm=1 tr=0 ts=6a3f0dd7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IyeoL6OE1jcpBHINtK8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX1YikkiefkRqV
 krKnN3d0VFMuKsbfRNpIoibJ9fFRaKE3hB2GZ1BrFCrpvP1LiCPs2p4ZT7AwpPCXug0raVEF9fv
 n1RhU9c2f1zUN+2rN9C6nsB0hZuEbbQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
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

This allows to report the correct skip reason instead of saying gdb does
not support a specific feature for some tests.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 80743c2ecd6..54346668eec 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -185,10 +185,6 @@ foreach target, plan: tcg_tests
       # if set, we'll skip test and print the reason
       skip_test = ''
 
-      if 'gdb_test' in setup and gdb_arch not in gdb_arch_supported
-        continue
-      endif
-
       if 'plugin_test' in setup and not get_option('plugins')
         # do not use the skip_test logic, and simply ignore the test
         continue
@@ -329,6 +325,10 @@ foreach target, plan: tcg_tests
         if not gdb_version.version_compare('>=' + gdb_feat_version[gdb_feat])
           skip_test = 'gdb feature ' + gdb_feat + ' not supported'
         endif
+
+        if gdb_arch not in gdb_arch_supported
+          skip_test = 'gdb not available for ' + gdb_arch
+        endif
       endif
 
       if skip_test != ''
-- 
2.47.3


