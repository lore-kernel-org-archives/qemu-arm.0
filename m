Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4540BF9D0E8
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 17:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wChXV-0002mu-BR; Tue, 14 Apr 2026 13:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wCdYL-0006Nj-MR
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 09:11:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wCdYJ-0005av-HI
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 09:11:41 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63EBs5O1361498
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 13:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ViVNBJLDNe7dTza5ub1nJhFCv8l4ZF0Zi6x
 rrxyXaFM=; b=EAnMcFr+ey6Al7x1i1Da/cv/6a+Zqj1VnUfJc274B8YpFRUz5Az
 BVi5RpwdD1EtPWQAO82o47qhQaAroyHczjp5SQAChqXLn6aHHv5vsa+dmY25GlPY
 LsGxOPtTYQukMdSHTXvYnrodtCX1TYdZWrr01vYsuYn05H/1NKnXvwpI+5gyrn37
 DP6NrlRZ9JGQkcqp+8lCIzhtTalrhSyave0+PoiRmLceqdvYMIdTVlsTwOJes/fw
 YpR5BvghF88Jgyapeea7mNOJBN6uIkTAcnMYMLlpqoWM/WzvY+VdLfHCUUnJkw+Q
 PlLKsB08gEmgN2yG1MNb2fLlvZhGDy2dlzA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870ttqd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 13:11:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2d93379001eso7476322eec.1
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776172296; x=1776777096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ViVNBJLDNe7dTza5ub1nJhFCv8l4ZF0Zi6xrrxyXaFM=;
 b=NCue08UhG+WvAVjlnnFTKpPvomAmXBwp74gZnnCQ9460b+mByQyVCOZ+t0Y2ZbMte4
 +TiD8HzZoMWMLTs+OBAzVBGHeUv3SzrrPlYPPY8O8Fecy5NXiyoS1VT4k5miBzuq6L+m
 ovz9ZopsEoff1qQ/Edjeyphr0c3obWK5Omsm1duZJ424uqCHwqIVML+NlqLqMfD4k8W6
 RVh9YPPaul9343CSdihU0ztQ0ajPCQYJkebEEieiYWA3ab89VDcNOY2lFPIej/uS12Og
 NiRJ3NPXM/b0k7IBFCfrVVw0Ah+4b3bPm+YHEBPKjb7iWncnr5UCkTfKKa8/mNYWgFwC
 K61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776172296; x=1776777096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ViVNBJLDNe7dTza5ub1nJhFCv8l4ZF0Zi6xrrxyXaFM=;
 b=UEtDupxSfXefgX73M8LwD6lrQ4AS+14ZLGmhtJAJAUSwvURKJHzInUpC2TFkBdKnPf
 /ODh04rAejVcMfXU/W9PGKqlVFBi9ANGXqzjRRNbSP6qy+9NHSxiR3ifFlqd6pI81AIT
 tO1/rr67nJIP4VYmk6qNyG9TuggPonNN1+vmV3CE5bmBtNChn40GftOlQ5AVz2Dp9KlR
 pyjizUNgNV1cjrg22dBU1jCW8D4nLZTgfMo++pFVLz0yM4ReYz5z0cNzTXnTwxctdY0h
 TJDEp0l3H3g4xv0MEi7C4XJfOYtVlxUPY4u//5z3ELp5895o9LiGdzliC/ZalDrLAXyM
 su2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8575zJp5jqpboUO/MQ+1mEWpZ2E05Eez+brrypMyCXRSOOMXXVEq9GZj3c/kHuLGjkls1U67d2jQ==@nongnu.org
X-Gm-Message-State: AOJu0YzVoHijIGYqZj52QV5zWTOx6saIlReqYTSxsL6Xx8e8mNzX8kay
 g5OMexNSNDvzLxHm6LVmXypgQZz7A5oaGXP8LhkXHoBaW7FifmrzBqQQ+jhF0HqKR9c5gWM0SP6
 2JA7RunOU+f3KDK3gkZ4zxwtaVHWVqk8wmugGtACcJ3Ef17s+Neg6VZs=
X-Gm-Gg: AeBDiesthyVmgl9zcrV3KSg9zinycnjTONkv8cNENw2SsJaZz63o7H7S+KFdUOcyhom
 eU6GdBPu+RjQIfzXEIX11oW+ebioJAbdf4K2aJOHSczGzaiqrsEdafV2QQHw3Uz2Kvpxh70srkN
 bB6cCgkxXsS+KTPghheGmN46tiSZMUEKsbCmfG64m35iwYWlKxQcDmQLeFcvDhM4QVy2V2MDefJ
 eV89UbFq13aVJPi3fcQ/K/TsHzgFimYuqzuoibE2uJhQUEicFZ7O5ax3c4mj0TCkRqflhh1+luS
 LKNSChxDBTgmGPPEQiTKVGpLM8Lbh47YsXMATzbTBgnCZngYJqBt4SsMf2k93Noy3vbdLVA8r4s
 HL56oniaDKE4c23xjLIrS0yg58+1kv+PgpZQcZ6ntIPLJJa9xhofC/sc47/im9VdMQzRCZBwtcJ
 I6/yGzMnVS4UV+B79vC5Y=
X-Received: by 2002:a05:7301:470e:b0:2d8:1efe:51dc with SMTP id
 5a478bee46e88-2d81efe56c0mr3926764eec.6.1776172295667; 
 Tue, 14 Apr 2026 06:11:35 -0700 (PDT)
X-Received: by 2002:a05:7301:470e:b0:2d8:1efe:51dc with SMTP id
 5a478bee46e88-2d81efe56c0mr3926746eec.6.1776172295118; 
 Tue, 14 Apr 2026 06:11:35 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2d561cd2c09sm24301325eec.18.2026.04.14.06.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 06:11:34 -0700 (PDT)
From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, slp@redhat.com, peter.maydell@linaro.org,
 philmd@linaro.org, richard.henderson@linaro.org, mads@ynddal.dk,
 brian.cain@oss.qualcomm.com, mburton@qti.qualcomm.com,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] accel/hvf: fix double hv_vcpu_destroy() causing teardown
 error on ARM
Date: Tue, 14 Apr 2026 06:11:25 -0700
Message-Id: <ee6f642af1dab29aaf99f86ac9254ddd25765bf8.1776172276.git.matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de3d08 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xliAoVnKQx6J4uCu_igA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEyNCBTYWx0ZWRfXwoYXNqixRju+
 fAptSI0YaUohUhNiM75jQuBW9xBg9fp6wOWO49/POsA14jK3rFDxJYoJ7et9pIYK2H0+Abtnr6U
 VDkcdbngY1FoheZHe3GmZ4S+FKWLeLdorSew3Df4KL4a1wvWjV46oeEQLi8Ri4eeO3yMLOV8mUl
 4tii3+drMvOFMTAxaLr9Fm6l7Q56lCfjFD6Kt3d+0FeDZZsETM+j25dzX2l0fuxH1TYm5nEtXcn
 7w+HiX1elx2weGNBhLSwVyeeZFrK0ES2jELLeHppFZyEYTrTxA+797tBUmNLETpLUukgIBlxUgJ
 QzI4gfEv0fKItArsnj5ssFLBXrdGs0YmDiR/gcMUllT/LzOLIv+aIeGXvSI4adg37ZK2fhtqMSm
 owUAi0/pnQSGVTEgVroWglW/t6+IlF1r/Gy6ufXQ6zExAZBeEuaPLOFnHZ569ua9W5mF62RaaFa
 X3WEllh0U1REsrccSig==
X-Proofpoint-GUID: E-qzllfggt66vcLG10uIcbAQpTy9oRNU
X-Proofpoint-ORIG-GUID: E-qzllfggt66vcLG10uIcbAQpTy9oRNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140124
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=matheus.bernardino@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Apr 2026 13:27:03 -0400
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

The following callstack causes hv_vcpu_destroy() to be called twice,
producing HV_BAD_ARGUMENT on the already-destroyed handler:

hvf_vcpu_destroy
 |
 |_ hv_vcpu_destroy
 |
 |_ hvf_arch_vcpu_destroy
     |
     |_ hv_vcpu_destroy

The first hv_vcpu_destroy call covers both x86 and arm. Let's remove the
second one, as it is redundant.

Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
---
v1: https://lore.kernel.org/qemu-devel/70cca2a5cdde3e6531e5c8f1e399e0b584d51ad6.1776096073.git.matheus.bernardino@oss.qualcomm.com/

Changed in v2: removed second call instead of first one to avoid
breaking x86 (thanks Philippe!)

 target/arm/hvf/hvf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd..2ee653f08e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1212,10 +1212,6 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
-    hv_return_t ret;
-
-    ret = hv_vcpu_destroy(cpu->accel->fd);
-    assert_hvf_ok(ret);
 }
 
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
-- 
2.37.2


