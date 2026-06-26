Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD8C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:42:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9x-0005CV-CF; Fri, 26 Jun 2026 19:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9u-00055q-0H
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9s-0004QL-5z
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:29 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxd7Z2488112
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=77UTVHuHvA7
 xz1FcfiM0rKSwDOTxXFtP85Ihat0fLQs=; b=O4ZkYxoznPmlzNYueGXAbzg+KGM
 D4ov+memdbad2Sd17yTGFLFs9wVjiEEOoln212GC76L0smhxlRvEnOS0BMcnQps9
 6yqohjS7+H2yMrQGC1k6JwDVqVnvLxqjtpM3GWSNay3Py+C3STfjB/v4Va+aamIw
 R3HHj8HefnLoV8Ve4Rx1zd++eokeM7279kqh8jo5ekv1ulQlQaFo1jc9ztIxDT6g
 QubtY2SQ5MtH8C31JeOBkjogXhyyMxIAXr/o5r1WDz+9V61XqG1ZS72ezEfalrcl
 QDLS5p7KlfWuvpalCenCCQKyY7+arc05Q+svdoGIRWarEbxBrSATkn9/KWg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1wsds4wa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c9bd8b9c7so1587262eec.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517216; x=1783122016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77UTVHuHvA7xz1FcfiM0rKSwDOTxXFtP85Ihat0fLQs=;
 b=ZDbLXtL6w1vt6TbY5AHbjqdblezqywAb17zq5+wSNjai4IYg5clpYCzqhBFFqscNJP
 DVRXHCUXO89rFzsKLQ6yUKdifFW3djMYjzi4akEPRmEwI9JcTFtgQfDj+FVSmVlMg6oN
 4ZY7zukfggPzuVcy8BporPDDJFwPebODr7RmZJAJVyg5CPJAD1nIwq06+bJExt3Fr6If
 IPHGNeGAo+FybLFVTymUNjkMwg73PcoflaTxqU5UNKKwhc5ahaGR+RvCZOVMRsV25aAc
 CEwyI6U+80pmNTEw4WsjKKYwsa/JKnuBzZTxARYrkXejTE4LKVduT1JwuG5h1VAk+rn6
 ckvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517216; x=1783122016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=77UTVHuHvA7xz1FcfiM0rKSwDOTxXFtP85Ihat0fLQs=;
 b=iSbfvkLF6I/m741rioqFObM0wSV1TlDC+xVbOJK7eCAIs66NDTlcglwciPgeVCnOZj
 OHL8iWXjFbQ2l8zBcheJUCbI+zZMDdyi/Ze7T49eKUnkfLP2tuOr0iHYkRbuuYX9mOLC
 sNlmplojpdVk5YfAeefllht3CKvxxNhwYV+6CMiI63CvPjKioz1gEkhJLvkXBuNfG83m
 LtI7nxOXuxJTggo0HcURWPtgu9U0wbjbaJR1hHFiYbK9cThXu75QM3vUBmFHDQJNW2oC
 4w3cfgf0XnFg9NmJ91DvvAuks+JxeS7OBAmi0mz+Cl8XWE/Kd2KypjLtz5BUATyC/qZo
 xxXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZM/kmcEIqENDsjsPPuwaeZlceLV1PY9GK15SY8/iC40xq3tqbfdold5LlkwgN8rLedcNNr/cq/g==@nongnu.org
X-Gm-Message-State: AOJu0YxaPrJJAUQt26Z9mUoOqd4awx2PRoRD73gHdelN924ldmB8ikuG
 S5cnib8QL1eT+bSebeTCgci6hkV3yKy7uLOdzjRHY0zC8OeMwwzHWjfQzpKA8r61dmF9Sc3X4fK
 sp92MWV6fiGmq49FhLntOhkwU0AWzMBdUG1izjmsjWpQRK7rTV5K3nLU=
X-Gm-Gg: AfdE7cmAr87/yvuHTHmLc2ajISieEvxg+muuMfNVXjzYuSfdlQXzqdoMpI2hiOet0X3
 LMuOT71GLa4tN+IHkIVYNEwN1RyJbzlXoPg8FAR5CTHh2g89cNxcIKNS4/78G0BnY4+Od+ZA7Zd
 dFNSUXhT0nEvumiJCtt2n5Y6lcihLzHe/CuClVxAvDKynwB6s5HeDbXJPw1YvdPtHxGreb3/gW6
 Q1RwMH369UzNXlbXrk7vVlN8XXsiwa5BP/ZQ8/lAHu1ynFKV+taDEivC0Ao5skNz/12qAdR0xkA
 PfqYSOjw3PjliELmB8z+e5YWvUj3uDJTPbznTmjgCclkP0w3/SJaoV7ys6eW8W7NzVLzoi0pAeQ
 1QvaVrv5uxLIHy9763W/P5D10jyodkcMdSMSUC1GBi9cstCqq6TULGlyJu28rm06yFJZzCxXpFz
 Ii6BgUkA==
X-Received: by 2002:a05:7301:eac:b0:30c:ea:ade0 with SMTP id
 5a478bee46e88-30c84d7404emr7511999eec.9.1782517215863; 
 Fri, 26 Jun 2026 16:40:15 -0700 (PDT)
X-Received: by 2002:a05:7301:eac:b0:30c:ea:ade0 with SMTP id
 5a478bee46e88-30c84d7404emr7511977eec.9.1782517215358; 
 Fri, 26 Jun 2026 16:40:15 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:40:14 -0700 (PDT)
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
Subject: [PATCH v2 37/37] tests/tcg/meson.build: add top-level 'tcg-tests'
 target
Date: Fri, 26 Jun 2026 16:39:18 -0700
Message-ID: <20260626233918.158740-38-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RNyD2Yi+ c=1 sm=1 tr=0 ts=6a3f0de0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5y2tcC3eaVla7PVkd8IA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: HRzh3wuzzyTp_5Xw1NCKELcVO0gXrnId
X-Proofpoint-GUID: HRzh3wuzzyTp_5Xw1NCKELcVO0gXrnId
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX5VKup4mhzK+j
 nM82xIQWY7Y/hpKgBf8BbAXYIfI/BfIaF0rgda5KCOED2pqfwSEBEkkb1seDzIX14cQsSJtVDFg
 8HKNPLeZrbXBrWnkLWmbx5l+8kM6oyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX/CXnsh+jjyUG
 9RdP6fugGsLMSviN91Fp1TL1Sdc2lHPJPwYw3Pk6ti8vx9nGAmHb08VajpNfjvN2c7br5dtMYzm
 Cc5yrbAufjwntnSkwpMvSjB2UaIkbPdSrhPBwRBIYWWAnnzYzFIi3YcU+wkh8wouQ3lOI02qDx5
 P8ywu2TBOGMh6SQHt/vipfQ5j8a96F5reFCd2WJ6y0Vcys/FS55TDGkaDshxNfxoNeacWj0mTbs
 j3GYfHC9K5EzgpBSpSCavzO4rGO5qWR2NJVGWiMItRsYEy/sEMxMVLgJQnUdkqnpiB3vLC6qb4y
 DakINEdo+Iu2Ci0J0K0dMPfGs4E9mCOe7pEGJX08rkqqwtz1UD6byPN9woecNwXEwyehtAIQ8RQ
 R9hQA9BN/NKEEwz0dF3ajZCk5pCldbCDVaaIfhPNwhPwAitIkcLGRKfcx4NzfGGmM+koMTXQqXC
 SzsOiyWbMMtlWgAk7qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
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

Add a target to rebuild all tcg-tests at once.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index eb6b65c0021..d24659e7bef 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -126,6 +126,7 @@ endforeach
 subdir('aarch64')
 
 image_targets = {}
+exe_targets = []
 # Finally, we can create all test executables and test targets
 foreach target, plan: tcg_tests
   if target.startswith('multiarch-')
@@ -312,6 +313,7 @@ foreach target, plan: tcg_tests
                             depends: build_test_depends,
                             depend_files: build_test_depend_files,
                             build_by_default: cc_from_system)
+        exe_targets += exe
         built_tests += {exe_name: exe}
       endif
 
@@ -393,3 +395,8 @@ foreach target, plan: tcg_tests
     endforeach
   endforeach
 endforeach
+
+if exe_targets.length() > 0
+  # finally create a top level target to rebuild all tests
+  alias_target('tcg-tests', exe_targets)
+endif
-- 
2.47.3


