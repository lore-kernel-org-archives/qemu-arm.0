Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5DCC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:44:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9N-0003Wm-Sw; Fri, 26 Jun 2026 19:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9M-0003VC-5y
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9K-00042W-OX
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:39:55 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxd7T2488112
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X0ETRuFo76ALMbt8d1kKF5xibZCT71RPU8tqEx6CAQs=; b=RCFZQZRyt2UdfxcY
 TSaRexREJ0XUt8Q8GbxIvESp8+OswaiuIHh+UAX1WSzaJBCT3OvJAKpNRuTOzc8r
 3ZWatR5gWqMx9CJ0ha6gjv1Vc6ywZ/e5YDM3YJEue+K9mRdfW16wn3WjK3/4Z6+J
 KLB8SYCDXAsNMDOx1acnC3nO3STR0c502Bq0oeVecOQVU2pkjGSYhcGZruuIiuxn
 xf5G+3859N6O80001iVcA/LcSPM3nekvAuJySOVZL3uIRAtK19PZUy4JFXmWlvFl
 oHe0m8iGzS4qva4reDghgRQcRs3lSQEfeHQo0HxBBCLavgXqDelcS87JDuQ44SCr
 0ox9Zw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1wsds4u0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:39:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30c8d355dbcso4220367eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517183; x=1783121983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0ETRuFo76ALMbt8d1kKF5xibZCT71RPU8tqEx6CAQs=;
 b=OQ5P7RNOCXaald+uAxxMPqVSBEv2uyoE7p7XmeE/+MDzgsCcHK8FlbgIeMqnUw5bSf
 p2MCK2mJA58aGEg8JZ5EvJYsXe2NaBoCDvF0TvZGqrlW3C4C02Pv4YHiYGu2x+hqjnix
 8eOJxNcnB9Oh7NIk+lWnCjMr+mRyj3o6amfBfBft7+d1ppwvqm6m5U63xNSRigY6odTX
 NGpcsdWQPh65nPeDF5FbHD1TMaU+I0sCOatK7tik9g792XubDjvmoN5OKJ8WJXo4Ot4d
 6SokUk+lCznTnWsrQS2VmJt97Tvu9iPbn5YyWHV0q2xoX2fx+a5HPwgwqKSxX9TDVRPs
 LCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517183; x=1783121983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X0ETRuFo76ALMbt8d1kKF5xibZCT71RPU8tqEx6CAQs=;
 b=M7yYqvgOL8ZJ6YAIR4oZS0aQAqKP//T3JHXz4ZA3TzLa8xt+1/uDIE1BPZFly1kP7M
 vMFljF6OLiTzaF9HMdwjoj7gZ+1yXFwY2bUf6rqhKLUncESxcVczHsmGSdFz4iSJLCHR
 L0RkpV7HfXlmB8zdCraa5Up6PwfkY0M9ne4rTB7DriUbDXspw2D3kZGLDXHqCsVx6g+u
 p7bP7d7FcE2vr8xumPSXkEtqS5AdwcMSvh9gnttYEpZUxuYpFrawkXDICqQal6hwFM5A
 HUrzpvyYdJ8NlyjAIFXqZ6qa0w4nuh1FS+clIjVN52lGS6627EOfxLnqVHWYHGlMo3Ko
 rEhQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3qBTtCbgVH8HdzpVtdmnLge0iB2nVcb2ZYkJpX5rnAaX2KpQwWeqiPpjxBSOk8Ka/AWZZFoCEUw==@nongnu.org
X-Gm-Message-State: AOJu0YzV3XsGfXs9YdKIuzg/DBzxx7Gb6qW6KAnw8vn8ilcPT3LZe+ml
 44m+ViWnOwkhhbqSPiU7okdU0NQWToPRI1M0GjnT0dSgxyn9qrl2mQpI+mzdfwLSDEKNsmBp8t9
 JgAiBLNVE/W495cxkj64bVje6KeQShbwsjH8E9wFwRCzrEUWHrVj3imY=
X-Gm-Gg: AfdE7ckHif+0l2KDVEYBODav8Ov6P+iMvoHymDkGJ7O/Wrv+T0F1vHTtNqvgJWDXW5R
 CS7j4YZKn9s39EHCIvlmIm5tgbmnhPk8UlmF86iCl4K+U3wNkkdgU12HBYb5hRFCtA7TsxPvHUO
 SUxEDxAs2GAj7J0+LwurptyNiAVK+CZIaF3VJ1+vSpvFBPGby9+ZKZisM3y2F+F3BpklwQt1edY
 w3HPjDOt0Q7I95cP+aB3saXXM+9m1DnF9NY/oER1faxSyrezohL9FODERubd7ldNWIuc2BaxoZq
 9YgrEs7ULUhbHNyBGIlWdz4ZZlfAgSoSjtn9uj3xpCMXmVCla5y8vs5Lhy/5twk+9JxxwgW6UrO
 UayFglUUMKKQNzCRcYZKShSYzYnN4qnvxE9M0wFYpQc9kOIVThQdnU8S2sU61dy+c0Y+uGMpCJj
 8kCGLq4Q==
X-Received: by 2002:a05:7300:a145:b0:30c:38e8:54da with SMTP id
 5a478bee46e88-30cab36a243mr2518951eec.24.1782517182693; 
 Fri, 26 Jun 2026 16:39:42 -0700 (PDT)
X-Received: by 2002:a05:7300:a145:b0:30c:38e8:54da with SMTP id
 5a478bee46e88-30cab36a243mr2518919eec.24.1782517182214; 
 Fri, 26 Jun 2026 16:39:42 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:39:41 -0700 (PDT)
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
Subject: [PATCH v2 14/37] tests/tcg/meson.build: add default flag for testing
 compiler support
Date: Fri, 26 Jun 2026 16:38:55 -0700
Message-ID: <20260626233918.158740-15-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RNyD2Yi+ c=1 sm=1 tr=0 ts=6a3f0dbf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rodC9k6DH4pmb89SaOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hKwDr6SXKHsdiZWrj6vEEc0WgBqttLwd
X-Proofpoint-GUID: hKwDr6SXKHsdiZWrj6vEEc0WgBqttLwd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX/NcKIhPA79iD
 jbE2WJrMgds8bi0LmlpucCOL40tkhNDfk3nLZh219TC6mAb1yexqlNZ8bHRmJbBz58lhq1AIpqe
 cW+qGhTzSriZ4nG/NUvHwFQNnCuUsNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX7wKQnntYONjU
 oKMHrB1shWwW5bCVOUlB/saPXYgXEuE76uN99vGYduvMe8UVZJapf5wl94nxrsFfXbF5qzVQBt9
 bDBhgx2j6Ht5m45pCw01TD/7kEmL1SNPu3I9BZqZrsSQDt9vEfjhCqhrCGSHwMpc9TbydDOyGap
 OkqONsJBpPr7tUFtALUj9NT59TFNiTOyT05GHCt4/7p9ffzrcGklvHGhjw8AAzh9EZDGsDr6gAW
 aJ4MFz6oI6LoQdwTVQN7A1x4E3xeiKYvTGXFTfmLGRMgjXDUMx7swL87GYTZZk/9X9r9JqiyMBO
 izzJLeLNslq52X9gX7qwuTbSdgHzRHe5Wn9iETvVuXIDCRdubW4cPnKNeXujGkPUax0dcyJvtCw
 Sq6B5neeLf/jlf/kOIQ/DmZUePI8ZKYAZg/0e2dRiKpieZdRCQ9wSh7AU+eRQAVKt3wlDkJgz8f
 ssEoBH2r7Pj8foEAuiA==
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

This global variable can be used as cflags when checking if a compiler
supports specific flags.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 35af4c609dd..fa9c0d15342 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -1,3 +1,4 @@
+cc_check_args = ['-xc', '/dev/null', '-o', '/dev/null', '-c']
 env = find_program('env')
 
 gdb_progs = ['gdb-multiarch', 'gdb']
-- 
2.47.3


