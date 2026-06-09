Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A85CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:48:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JF-0006zq-Ji; Tue, 09 Jun 2026 17:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4JA-0006sB-SX
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4J1-00087S-H7
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:24 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4ZJR3232142
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=x73CnRpHc6q
 Jw1lBr7pHZdPL4NlO8wFYpVniuD7+UrA=; b=G0Ol8EPeNc1XHvd8iKFhI0qur3K
 UUrEikZhP74FfI5ZFgM2093LFxe+OI3aT17ipRBDs2x2MqhzLuS4tGAj0jwBUDGD
 2dSyt+B7s8d78miFRCT9wtFVLDjy3/FNg9q5Y9Dexf9CPG3x997XPDsIXO0UYKDz
 tHMVkW3IzuWXUPfFSjxtMzyUSg06WGaDDwyy3mE+6isinHnp14Ds9sMY8BvkUc0f
 PfXb8bDTwQXxk+002iMAJYnwl4gsJfgdQqZeePqHdLiT6uU+c35GXathQEkYoZQ0
 ihvxaUseWb/+XyaunAXmiCMFmbTBkyznigyp/1Dq6BChfowC68YWOOw0wKQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeevb34-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:48:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304dd917645so6455900eec.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041688; x=1781646488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x73CnRpHc6qJw1lBr7pHZdPL4NlO8wFYpVniuD7+UrA=;
 b=Zsi1mUgi7v4LxmASrTgXUJqH/Qm51BN3TGymC0TlakbMheeIBe4xWVF+EdjJBbrq+c
 TCbN9emRD++87N6stnATMiCeDt3QZXBXsyrEuOfAskjIS00ISuHAA0CoEdIIrfMZWRl8
 fzL928XwriN9Md0BlC1kp6yT9vS4PWhgJ6AzR7wC3gpb4DShHYWWHwnqaSQqQIL+XSMs
 caOXA/iI8hgtvUruW2UpTTYyTU9GrSO59MCzHAfvPBb0SiTpdFkg0j59tjV8xYFvEZhq
 AxQAudLEpgX3+wrH5aSCB8Wh02M3bPL273gL7BfjUi6QmdLsT4EOU4SLBLh/DD20VLUp
 wbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041688; x=1781646488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x73CnRpHc6qJw1lBr7pHZdPL4NlO8wFYpVniuD7+UrA=;
 b=Craxod62K/Z0o7FzzvjpjZerv6gwxJ3VEPhhqFYESu5OHVc0ALb4sy/5dRuq7F01rL
 oxf/13/1M+elU9dwi0RknddrIyUb/aGaHNj5I1q8AMegQt1RVGPAr9ZP9CwMO9e+Ol/m
 RZy44pFU0hGLTMorsICgRiRMmjfUNeBxUbNy6Po2MIMypqFqhGSjKMdJsMdxqkctMGYl
 kequJeTv2H2WgDyoKW2uuN6BqAgp+s17updzFl3JUU6420iUL3sZPea9A85nUGvm0u+U
 TGY5w/P54n0/1rB78bZNL80IX0RL+JVxafMzrYiKeez0VtW+1+eQWs5IBdWeZ9Y05Kzp
 xg9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LPi/RdUDJ3/2cPM+Wx3RVT/h25nvVX9YwccNVHNVuEEjL0RBTBqJXSTGVjODRcp11Uw/KHEpaJg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/UTeRyYrsdRXG+J+tOGD1koE4fwEWIGpRTBqsijJSApd88nCM
 B+q2s7fbCWvoETZjXJYNqpX/ckNK5gnEpYFGxLj9Z/2fFQ+kHDK99EzxXzcaJZZcGvYfzrw/ESa
 W1TQgOTJqDEvIWL4aQ3Dj5pcOzvGVRpmqePQMUD1lc4ilyc0QeoUhVwSeVgCC2kP/zA==
X-Gm-Gg: Acq92OH26xL+PtfYovGQ2Uph3EJmPDLr9x7+O8rFfRRYdBHXvGi0n8t3PiCALtJTnEq
 mlBS30wgwTsETP4lQCplyrJ8uu/2HLpKf8eLPeZ2wolZsAHQOK6IV7qPHzb+K+yVqHxxe6+y9Tp
 0inv6I5Was8qqYHuJmxN6R3WM/eQH1Gmonrr/NdT8hPWybLF2iLNDphQcO5myaJZodUsLhXtXms
 MaeWIIXsl91JcN2nItj0rBur4Dh4S9Mrg9xQHboL5q0QoDRB0mB28xr7Zl91wyv5PqaMbxfHq9k
 rauUMfUB2tzLOC3py6VQikjOWnUg97hpiTJ7MRmZmwV36gxoxVZBE+p09PZyVMv8mdUJKcO2V2u
 yqe6ye8nV220qwtMBmbb+CcENC/phPvNxhFj1QS31I9NKVXqW0F4Vjluo5BBl6br1yDvSFCmAy6
 1g4r+hCV41X/TyaY1P
X-Received: by 2002:a05:7022:f81:b0:137:4062:4c1b with SMTP id
 a92af1059eb24-138066d1951mr12378227c88.11.1781041687494; 
 Tue, 09 Jun 2026 14:48:07 -0700 (PDT)
X-Received: by 2002:a05:7022:f81:b0:137:4062:4c1b with SMTP id
 a92af1059eb24-138066d1951mr12378199c88.11.1781041687026; 
 Tue, 09 Jun 2026 14:48:07 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:48:06 -0700 (PDT)
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
Subject: [PATCH 14/27] tests/tcg/meson.build: add default flag for testing
 compiler support
Date: Tue,  9 Jun 2026 14:47:32 -0700
Message-ID: <20260609214745.772536-15-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a288a18 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ipGdpegYSuLUQ3QCAGcA:9 a=zgiPjhLxNE0A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfXyZzBEh+Rwrmv
 BRtHjqctFscFb73IGRfSmRof5A1Xz/bA86bN9uaq03O4O3+i8U4QN1QkILjavkdCi5K4tjhB66B
 aCIfg4AjQlqQHPXmgaQgMFfKXEpAA5c7Rs24eA0wczypM6T9BFGu0zZQKcveKhjnbQrFJOZRPmM
 9Pq0EZnRcsv/2ULgS5zMQIHYhaGI/W8hrvjPvTPckYvGLso6fj/HhORlS4p8t5X/5uvjHv4yqdH
 AEqggL/4IUMc59odTn+B9W5TiD9lN6tHFaAN3/vwfAPh7Pa1eDg1NnHVnU0Wzug9HKAdIcrlMwX
 p9v85dTl1cq65aJgKI5/ZuGSU9tr0GPXbnAesGKNwYV9g05Xymjl879qRL+6d4MwE6Vr6rVzk/1
 cdTWKG+Z5qkWUsP99AV7H/CJI2CNmyt7xw1CaB7QYY9Hy6FP8mWXnrDfTFrz2DBFRkxRe+z+k0v
 WnCZ/YMvebTy2+zOzcQ==
X-Proofpoint-ORIG-GUID: RSU701b7Uc8es-j582GVGD5npzy5OhkZ
X-Proofpoint-GUID: RSU701b7Uc8es-j582GVGD5npzy5OhkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090204
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

This global variable can be used as cflags when checking if a compiler
supports specific flags.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index d0080eb0f9f..aca59933d71 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -1,3 +1,4 @@
+cc_check_args = ['-xc', '/dev/null', '-o', '/dev/null', '-c']
 env = find_program('env')
 
 gdb_progs = ['gdb-multiarch', 'gdb']
-- 
2.43.0


