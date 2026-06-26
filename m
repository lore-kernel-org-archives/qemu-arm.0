Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C2FC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 23:44:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdG9r-0004xs-Uw; Fri, 26 Jun 2026 19:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9p-0004lP-8X
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdG9n-0004NS-CQ
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 19:40:24 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QMxCNu2675865
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iEw9+4qnpQG
 fC0w5ladnSWMt4gvdJXjxhPCDCCY+xyk=; b=pOVQT987hjEjOVugEsB6BRw53r+
 ltMvEwouvluw/D6J8r802oE6xjQYfSR9QUBbvOLdSAqGI55shdEmNyxgt8IiNltv
 KvQ97FVnAAmGLjj1QJCSrdEtRuF1p3Hb2sLXmarWNIp4Z40HoLaX9OGLXIAAL319
 3H3dx/E4Q3s+YU8ES+rcIzSBxespdYSwIQdQQC72Bjw4FD+EmcfFnukYOSA1wKCd
 EaIkU2RiyBx3+mY41kMiEDZYrWDidzZFedMl+v5wO5zb+w2pqR62CgonMhEfYN2P
 WXmVnTLQSM22DTj3U/kPIBO2qFGNPRKhVDCiubFAUW3STvVKCdLn+lOVCNg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xqa8uyu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 23:40:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30ca81e05bfso1094541eec.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 16:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782517211; x=1783122011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iEw9+4qnpQGfC0w5ladnSWMt4gvdJXjxhPCDCCY+xyk=;
 b=UEeOa4xiyKwwu6GNqOHmQy0S28h7ZrEoLdEtNqNh7xsjldtB1XNJPtXYgjJMx5k6bv
 Ty+3ilrMckAab48aQnBGeM2c6ASRsC2OQYcvajXF6HsHxtWtxyX44REH01VRSny8oVA5
 ecMoMKBmWdF3uxmFgcixGgVXVsSiiX3egLWB+7SPdhPMrJ2qlcSwKZE3P+Pg0tdOnTQu
 3LzxWL6rMz443wsHTvs29YUxOoNidZBolLTsLpUwzRm/HkqO9MwI8/mbE8bkNSbpNy2g
 BK//NlwrxA/pgiLrf013ySgIRX+Cs0Il/mD8qvgzaOQHSAFixtf1wZIAPuXXezJjH3Ba
 GuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782517211; x=1783122011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iEw9+4qnpQGfC0w5ladnSWMt4gvdJXjxhPCDCCY+xyk=;
 b=FhMIjWIf4JQDsVuLOdnXE0V9azIZtWq5TZxFZjcqHxlwBFVwPzBMroLJaZy7rxqgSM
 J1a9a12Shrm1b+FT/KhhrmCQKFaKyqqyXIarFNgeYQrw0Ks2Oijav7r6al9NyRq98NTt
 iVOc2jnQg8Y+STagnxBdQ56pLvi61UejY2+mAy8EsiKtBT21AZFGi9sufXxRCZaEdaCG
 H9TFhftsZl9xtMi1CVJkvPjsKCxRd4uqarNu0TtCq2+VdEBXaRRBtLYk4WsjZpy4DQ0S
 mzCHg/acxpEOPJKmWpJGobmoBciRAG5aMfQdqj56eN35QTom4jKDwIHEBRGLLMPYg0yn
 NtAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrlXmpgjlUpYvjlnGuYxrQsllbqhEMuf3K874+v0W7zBnLYPYil+m9DlGByDwLjqHDp13RNKdNMAA==@nongnu.org
X-Gm-Message-State: AOJu0YxA1fj1N1UopoydkMP4WIjtrtFekgIeO+wPnqvPs+3tqXdwOQnT
 ZT2hZVZMp+hQamtg+gsxKHlfjeocl1xNYyzy5HQGJ6bHi7GxWpKrFZrMHko6w6gjuid6s3OqtqJ
 M8I+7IhgqWQjzOloHvgj6JefSh4Y15LNJmrUxYhXH4u0+ZPtkdnlxWso=
X-Gm-Gg: AfdE7cmw7dmuRWtvgOETZpdoHTFmf+EPV9ol/hD/OrTJl1mTYFDU7i4z996N7mvrd6B
 ZOhhl4XFVVY8/cf5t0eIMBLRvCw5yV2GVRnK+QWzOMDZmK65u/mrUMUqeQM/w4fLnYhyV3mcjWS
 x4jGzrSdMYKoBFyI79dXWtE4sqi5aGOvmr2u3gcVnJ02mIAjJzu5J3lj67Hvypg2cQsQn+AxBfK
 ZRJRWCiBgLoB7XsK6aM3mDn76dn3zW+GzNJpL1kQrc9LlFl7u3jhgXAFNRg+j5y3VziSlVE6OD0
 m9eOW8DQJSKjF9QXJ+m/EoTBsHYA//QPcVAqzmweRIWVePZgSDWXI0i65f6aHS0uBHBdlS7+tZe
 GBblopOD4jEH4aRErRc7Vyelq2MqYKoaQtBk9skuopn93og1hDzq+q9xyQt2gXgaQQKtrI3VPza
 mCoMCh2Q==
X-Received: by 2002:a05:693c:3105:b0:30c:ab4f:46a9 with SMTP id
 5a478bee46e88-30cab4f4865mr1926663eec.45.1782517211284; 
 Fri, 26 Jun 2026 16:40:11 -0700 (PDT)
X-Received: by 2002:a05:693c:3105:b0:30c:ab4f:46a9 with SMTP id
 5a478bee46e88-30cab4f4865mr1926634eec.45.1782517210763; 
 Fri, 26 Jun 2026 16:40:10 -0700 (PDT)
Received: from QCOM-qjMf8PBlDw.qualcomm.com (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c52c591sm29369756eec.7.2026.06.26.16.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 16:40:10 -0700 (PDT)
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
Subject: [PATCH v2 34/37] tests/docker/docker.py: return error code if probe
 fails
Date: Fri, 26 Jun 2026 16:39:15 -0700
Message-ID: <20260626233918.158740-35-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260626233918.158740-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9pAU-gqbSJz6Uv_PSAJ_nuzPvZDkWzug
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX1fTAT+VbRY7l
 KdcNzBGqvdSalMJIKCkOGM6otajq1aqWpVDlAq4Xd8OrmZ8mzMhLw8FptXh5PQEUtxg7w7kkCg2
 JCp3j8VBjrAdl3xD/LurdX9Y02kwnOE=
X-Authority-Analysis: v=2.4 cv=GPs41ONK c=1 sm=1 tr=0 ts=6a3f0ddc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9pnB6j0hrbqWY5gff9MA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5NyBTYWx0ZWRfX9qUtozd6SC5X
 K1Z2P1qOixM2cCUP7eeMuH4uY3uW49rb8TjkENOhOR3o2wHOYTUwyJu8w8SkwX7Y34XLD6v1NIT
 EO6baWRxyU+CTI9ifNItsLEbwPjbSoCtqBteOcafe9E+iS6/gYLbC7jMxN0k9nNLU1wBBXu4U5g
 FGh61KcZMdq28cuw2dYGdAIpYkeb+X5mPJ1qVKuvevQOYb0hDARXr8SsIkGkRj2Uv8rEaMu+DYn
 zBU6o6P2FANnma7QlMa4wlu4eB3PwxAx6nQMTKWs6dioRXJGfXMX+ASY4pkOGb6QZxxl5Nyi1qr
 T33rUyhJiqwaS5OlZ60i8QPOuQNrehyr7DwHuDiL+Rm8GTxTcRbEDJzLf8iHeC1NzU1MVygrlov
 o9xV12z0Xsj6E5oHVYgDVADyd7O1my7D+wCA5sxwTkr1YdhP8fqhu6n6zWPyYogfs76I0sbOsae
 x7vjwyKcu5SeE3pvrNA==
X-Proofpoint-GUID: 9pAU-gqbSJz6Uv_PSAJ_nuzPvZDkWzug
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

We are not necessarily interested to know which engine is available.
However, parsing "no" as an answer is not intuitive, compared to
read an exit code.

Thus, exit with 1 if no engine is available.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/docker/docker.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 9e18b984f45..6640cebfbec 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -623,6 +623,7 @@ def run(self, args, argv):
             print(" ".join(docker._command))
         except Exception:
             print("no")
+            return 1
 
         return
 
-- 
2.47.3


