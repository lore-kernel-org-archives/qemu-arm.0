Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A259C43602
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh6IE-0003r4-6Y; Tue, 07 Jul 2026 09:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6IC-0003pI-ND
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6IA-0000Gf-Lb
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:56 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8eUt3755377
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 13:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w/Y1A1rnN5XQpB0yLzeZ7iY3qdBcMQxkot2cBAnVUQQ=; b=fQbMtc/qYlStnVb5
 dE3hL1TSzcpNFt1yNHrdquQjcsA+PZQ7M0X5Jm9xcwm1S7YwKQ53fPz86hkSnhFM
 3l01m5dlwYRuNZj/TSDAf8czCryxnQRe5NTb6m1h+eav1OYGM8caHlMl7Ib3T1hu
 7lHobkk/6TijCTnS4Zo1xHuBeiUQCJKS8zx/RqbMvNqIQHMfpGTXRjV0jINVFuZ8
 FTf0Ba+riJzesWROI6knetSj2cQhD0QsToKtUC9xYU1z4E7WI+wf2xcdaWFpsoHB
 7id1lzmRVyNCLJkKU4qaQniroKzAjamk+M/QkT7raGkJdDbp4yuU7HeouL8GySG6
 w7Mpnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep1edn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 13:56:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0d6a2f4cso47502791cf.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783432612; x=1784037412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/Y1A1rnN5XQpB0yLzeZ7iY3qdBcMQxkot2cBAnVUQQ=;
 b=c0anDQTftBzHP+Qfc+OyasAS3oC2KRcKIUTNFrj9EuRvbc9YfMy3iNlG9ps+VmJ1T2
 +1aILMRCJCmqr7xlEI7PFZM5++0Ock90h0iBJ4WSP36lrUpQLyT+/d4ElIKYvsoguxov
 vmmw+hFCxPjap2W2/ZIhzmddeVqfOhSSF4Pqz13Aiv0fDb7kkIgVLSbOOyrIYmYAh8yY
 LDKfnen9WXUPXA7V3FkuuBZaeEGJ/VhDL3feRLHwSh9i2NHzeNvm5J5yyBb5JHJkAPe3
 CL90s3xvkSzPY84jQzYJPKrJhaEtM63Hiygy/ejVm5hjDYWX7HCZeNm9Jp85Bbv846JW
 9o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783432612; x=1784037412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w/Y1A1rnN5XQpB0yLzeZ7iY3qdBcMQxkot2cBAnVUQQ=;
 b=cP1nxvADpDqogRJhNsaaekdwO+a3nUqaxkf20kgK01o7FfytLloTEGPl2rTLlfrNKX
 asb2zRrtul9mJ2zGh/6PPk5uP8h16s0E+YkffsoRifW7TpOwHxsXM/tvBVbIJDunA8dK
 6kV48xYslqwzHERjBeWyxUB1bnVpgWxv8LPoI7YsGkOrELOQNyReceEC6fgRIkyJKm1G
 Ps0DQHiP+Ua+Opi6X6MAL+m+oiSGUjwr9id14uxIMDug3dhcEr4Pd5RGYywPij7laHZ/
 MQBXu3BgVbMstYc6T0XY/3W2HVVrEsoYDiloQDTZFQe2CC1AbtWGMHi5GQBHrQqHubWR
 faEw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpA97Ai7eN7/pdzKfLxPu6rbRD+HmtnmkO1CFdfMgJ+wrNupzyPHoHzcXZ74vloEuKFgPLsc+2FaA==@nongnu.org
X-Gm-Message-State: AOJu0YylJTf3Z3ZQQND54INPmIC34dxzaMEJLtzE7e1NQISo432XGgno
 xLltXiNrQpprt/GPfFNy0HKSBrYr+Eon09vruMPyvN7sC0PXPZroyC02lVnSRoLnECR+4L+Zk2d
 piBb5+ej+OqhcEnTtuj5t9tFfOvmB/bStwx5nowS5ZjXFxc9yV6DCWKY=
X-Gm-Gg: AfdE7cmBAHhWZivRV6csESQK532wysnB25fTrLIbvLPGQdvar4w0OV4tDRjJgjvv0GP
 3l8qahRyhYcqhirIT76ekxxj6v85wsvTl201IBjYQRybmA2XINBHJDFO0o584DGnmoeBcQ12xQC
 LlAvl6HqIJ1LAm92NUgp3dhfdgrHABvY+VF9WDaiED3GeQRprfZzYvt6GnmGfj362T5998nU0AW
 UQwY1gaZze+UG00leM28RoIgYMNAZGs3u1tjYDbi43IhTl2lP4DlQEQtAU+IN+q1K56U8gipXW8
 SaaRHVLxcJr3U7MRkjZKxC3hCgrw4KJzbJ2Znf+Wnjcvzu+BPGpx06VnVwWBE6Q11Q5ZU2NuOoe
 fUxMmICKottFUX0THuxMDhhIRuBySc/PyfnKh7T/Qc0rz6w5ibxA8QuqiLAZam5Q84LQJ
X-Received: by 2002:a05:622a:992:b0:51c:df0:1b34 with SMTP id
 d75a77b69052e-51c748844c0mr53287071cf.33.1783432612247; 
 Tue, 07 Jul 2026 06:56:52 -0700 (PDT)
X-Received: by 2002:a05:622a:992:b0:51c:df0:1b34 with SMTP id
 d75a77b69052e-51c748844c0mr53286681cf.33.1783432611737; 
 Tue, 07 Jul 2026 06:56:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f40d50sm67248665e9.5.2026.07.07.06.56.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jul 2026 06:56:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 4/4] meson: Do not assume PATH separator is ':'
Date: Tue,  7 Jul 2026 15:56:18 +0200
Message-ID: <20260707135618.53561-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707135618.53561-1-philmd@oss.qualcomm.com>
References: <20260707135618.53561-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LZ6tnrDzXX1ilHYvXv2_Ez0wV6sg60Ca
X-Proofpoint-ORIG-GUID: LZ6tnrDzXX1ilHYvXv2_Ez0wV6sg60Ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX23kqZKBu1//G
 sc2vdujWKHD619LDOpsQ9TP0rKVrFdvRSGlvWihCwIGTmtTl4K5tZCOwlduG1f5Z3qKYAomAfeb
 NYei+Hy8rdd5JN5Ebg0LIb4bWvN7ukgQKZi15DYofWNCvAXqEgAn9PZCCnVXVgUlNylyGWlkhZf
 ByNzHPxlXmY7Uv2kbUjDlAwIlOA9C1kMLxpg5SN8fpynaQmKGN0IMfQ8g22wefOHqZfbBgyONXM
 xew2vtmf+piiPQXt3tin5Ie+8GBf2h9iFRh//st7QzZhVpgD8e6REjMPDcAYZWIEFDSSOBDD/tN
 ogAr2o3oAeknVULJNYz7buDvdrauVc3bWZCKj8vQ8pQx68XSzE7coQPxK/65j/R4f7Xuj5StvGm
 nqox4uopX/d1rgYfHKZVdhUKAa5VejWtsKP9YmLw3ft9/ROTRK4PML7PdCYNerE0ITAeP8IW7Be
 qHp/IdYl8u9HDs3xvwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX9oLRxuNbvsa4
 +FC06s2IiRqWsFOJz5SITXOWYkM1wZ6aboTLr61yen0xhh1kwCnHYJ4/bQyCfNthoENap0vg17s
 XArV7zrezWy25Gm1PdWFauPHBuhRW9A=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d05a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ukH1R-b_AAAA:8 a=EUspDBNiAAAA:8 a=leyxIDTuJf0N8jXLeTcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=zUGFzhdS3I8ccRoxxLmr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070136
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

While the PATH separator is ':' on POSIX systems,
on Windows it is ';'. Do not force the separator,
let meson use the default which Do(es) the Right Thing:
https://mesonbuild.com/Reference-manual_functions.html#environment_separator

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/functional/meson.build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index c158197c4b7..e3adc42cfdb 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -78,8 +78,7 @@ foreach speed : ['quick', 'thorough']
     test_env.set('MESON_BUILD_ROOT', meson.project_build_root())
     test_env.prepend('PYTHONPATH',
                      meson.project_source_root() / 'python',
-                     meson.current_source_dir(),
-                     separator : ':')
+                     meson.current_source_dir())
 
     # Define the GDB environment variable if gdb is available.
     gdb = get_option('gdb')
@@ -101,8 +100,7 @@ foreach speed : ['quick', 'thorough']
       test_precache_env.set('MESON_BUILD_ROOT', meson.project_build_root())
       test_precache_env.prepend('PYTHONPATH',
                                 meson.project_source_root() / 'python',
-                                meson.current_source_dir(),
-                                separator : ':')
+                                meson.current_source_dir())
       precache = custom_target('func-precache-' + testname,
                                output: teststamp,
                                command: [python, testpath],
-- 
2.53.0


