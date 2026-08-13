Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB18CC5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua10-0003bF-Ky; Thu, 13 Aug 2026 14:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua08-0002Sr-Nj
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua07-0002CK-8q
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:00 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFqqLd3180255
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8agxJTIsSpKLfDGc1usrfc1YNaxVZOAKA/A8ADkj078=; b=W2IloqFSb1jzcQUA
 hzNfC++VvnGkvXpFWcFo+lwZ81M2zW0z/z4hTdmgBqJGQu5jf/GqRsdwlDGFMR7c
 +4+VolF0RCI4s9wW5sgkHeNMpAss6Hd8s5Q4V2enuDqYqblKrhaOUKOaO1hvrmd/
 6PNjhPnQAFo2PnK4qktqYzPx+yYDO9zk6lCum6AdlgwCfEf91ichE7b5tVfEms20
 IIKMbzrlnOmofR9RZIS9nseeb4kSBW9B3IRdg5MNTaXfkoIU89TcxWPE9BV5ci2f
 8H2a4ftDokNQPm681wb6YJVzPzTWvDKb99oiN+d2fLTaCIdr7zuHQXBckVPe1NeQ
 znsdDQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4rnx3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1d30035dso1728411cf.2
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645078; x=1787249878; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8agxJTIsSpKLfDGc1usrfc1YNaxVZOAKA/A8ADkj078=;
 b=WDaKUY/4NNeQIsZWOZBYrX71tletcOBu69/fkYyaQ+RnskuhwXWaAJZ8PBoZlS3/bx
 MCt5QAZzydgu9uWocX7o9E3vsuAELYu60mecS8ZfzbQf5eTPk+bLjpNsrAQf1jq2urVl
 dJ5+HkHbkJuXpv9qi6CfdielnmoQCW2afGdjVEXG/naebvO5OVNMB9oLFQF3wUw7L7+Q
 hqej/1At9IW+w5k+0uoHcIJYSVBVxuHdvEFHP97NIRfldGmEpayEfjn6Tb1HgY9gVHXK
 +YwcX1DAZgNROXbvhO/gdN5VKcA1nwUPxOu12G+DK7kYH38zlxcLNA8BsVKUIkJSn0eL
 1Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645078; x=1787249878;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8agxJTIsSpKLfDGc1usrfc1YNaxVZOAKA/A8ADkj078=;
 b=SZXeJrAtYNPHsZWwVvngpIcCqOIGxWzdokAyJnqdr6Gf1ubsZ7kNWjuJP5sTTSNpYX
 gmKINLnXb+gs0Brg1PqxHEKZBTofBiEKZbj2mg8mcHIar4CvzupAbf2zI0NqO3MQc9jW
 bezddNXLP2qCR9Br8/Y0KCE9f6/Ioocl7aefSwWYVMEXhhxtAOdV+MesWydDiEZ1/1RW
 drxXgOJFyNIseFnxfSH+qDBSOVA1yto8MJOe4u1TavxSQk71IAI4xI8SFK9JSbJmXewU
 Dvzy9+uFuR297YNFiaMOTWDN1D2l8wCbfXx3zVotiOPAAUka8rSla/AsGA7MlLmaQCcw
 vMHg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpncFxVOTxftrRSsmz1dmHgJsAc4p28pjG8rTKeOsd988iQVFMQ02AgFfkjgWGt0b3oR8LPJU87fw==@nongnu.org
X-Gm-Message-State: AOJu0YxkDZH7h4PdiY1lQAkTHt/wXWOWp5QDpcftTNg2WM4EaRJNTF+Y
 w3wvv/dWy0XkJDmzIY47fOwZDCmsn6yl8WBuiBNZNOZCiKCC3WZ/N2FrRrhcrPI2PXk420bIwYn
 Qetuw28OwiLdEleGhoUXjmUTQcySc+FgzmuXWcJBACRHG1F6oopPXJ2s=
X-Gm-Gg: AR+sD10WARSRbWOPl0AIoaVSQXqnyM/EmKS9iwZrchDcEB0klb4h+AgL/+jNDsFNbZ8
 yxn3DvxkBj3IszeMI8JCJJ7TnESeviab7yWw+MHgHpFWCVNBMhyE+ySUmo5GLogHTpnzr/kSTWB
 7hFBdVIGa/gYGfF/O/LhTG6oZ4haO1uqvmaxXCLx14tOAAqVG0A6LAR/ZUsQ8pZ0eGtFmE3Hz8N
 9y9R2cVUdoSWaB7rKLYgyv/36E2MBgkfCs9A77fMBtUEkYZbWMEuwTbFcMcggXTB/0chAEBBGxY
 EvOgGRCjlrk9qGhr+7tinocjX+RZkcvwGzsKfNIHF0YfVHd755tGZiCtuBkWInyifp93gYD8iKp
 /NApr7SLRNxWFPloyPP8dcxx89s56MsW0dre2vY9v2A==
X-Received: by 2002:ac8:7f89:0:b0:51b:ecbb:206f with SMTP id
 d75a77b69052e-52d73de0b68mr77220681cf.32.1786645077015; 
 Thu, 13 Aug 2026 11:17:57 -0700 (PDT)
X-Received: by 2002:ac8:7f89:0:b0:51b:ecbb:206f with SMTP id
 d75a77b69052e-52d73de0b68mr77220031cf.32.1786645076558; 
 Thu, 13 Aug 2026 11:17:56 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777cd05sm5859245e9.2.2026.08.13.11.17.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 10/16] accel/kvm: Clarify use of @r variable in vcpu thread
 loop
Date: Thu, 13 Aug 2026 20:16:33 +0200
Message-ID: <20260813181640.6537-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _NQfVLWdo0rV_3D1uj6zTBSKtAOL1A-e
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7e0a56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9RVOebA3_GiVrJoGtMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX538/c0kTuuda
 mzmWN25odZq/FdM+12/LMo1J0M1MSFuwbakElq8f6lyRRcghP7RO9M92dQBAa7qOphF62S8THLt
 QP77mAHFX2JB57U2yMN71gyaAoszEjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX4Ac/5rT2s0D8
 CRoq3DyolUM9C6U0M9I6BPsnGx7giPeOC3xJvtom4y2so3Bt88ASx56C1i0l2/1Z259NMqc0zlA
 7CmEYzmcPlw1dfxwLOvq2BWFozAqWet5v01D33RQECkAoLuUSE0E0vjDeXrIXlCsDdDQDjAJyS7
 1SVZRQMpgkULNe0TB9IV18AjvN0sYVlPvd/ZnXRkV90pwfbBycYnE3Xgm55kIASoL/5nnf/MkEl
 MyfgXr2hDcsDkpDWNe4JE2FsACWsoHhzJCekBKB9GbPXZUIe3hELu1F9iWEnlZP77/ycYsViIIL
 Ke9oSatAl9F4wkhCmCjqRiweYQNMfVTKBL6LgsDAom/3NE1YZNQbUoebkDV9pMqLO85IbCWQsfS
 wo7YrkpLJ5tu4sk98UjePnLxSikgn2h1fyXzFpVgH65OQUhoKeaP79YRmx8/QR/8mMNDJlDccNI
 n1osPcUeImDYhjN1mIg==
X-Proofpoint-GUID: _NQfVLWdo0rV_3D1uj6zTBSKtAOL1A-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

@r is used for 2 distinct concepts:

- kvm_init_vcpu() returns an errno. However we don't consume
  it, besides it is called with &error_fatal. Drop the
  unused returned value.

- kvm_cpu_exec() returns an exception code. Reduce the variable
  scope and rename @r as @excp to clarify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/kvm/kvm-accel-ops.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 73ff93aab67..06f56773324 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -31,7 +31,6 @@
 static void *kvm_vcpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-    int r;
 
     rcu_register_thread();
 
@@ -40,7 +39,7 @@ static void *kvm_vcpu_thread_fn(void *arg)
     cpu->thread_id = qemu_get_thread_id();
     current_cpu = cpu;
 
-    r = kvm_init_vcpu(cpu, &error_fatal);
+    kvm_init_vcpu(cpu, &error_fatal);
     kvm_init_cpu_signals(cpu);
 
     /* signal CPU creation */
@@ -52,8 +51,10 @@ static void *kvm_vcpu_thread_fn(void *arg)
         qemu_process_cpu_events(cpu);
 
         if (cpu_can_run(cpu)) {
-            r = kvm_cpu_exec(cpu);
-            if (r == EXCP_DEBUG) {
+            int excp;
+
+            excp = kvm_cpu_exec(cpu);
+            if (excp == EXCP_DEBUG) {
                 cpu_handle_guest_debug(cpu);
             }
         }
-- 
2.53.0


