Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88819C5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuZzE-00023t-7h; Thu, 13 Aug 2026 14:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzC-00022h-Vz
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzA-00023d-LX
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:02 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DGVJg22077244
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 je+h48SSHuNHSOcK2Vh76kGO2HaV1LztKcGPEWVgCLI=; b=jkdX+5805XeSZ65F
 zyAqHNN1EEGu0GEpXMbYVx3QNeEPTzKVMg98z9wcqTXSD05Hblpjfqx8B4MIPHBx
 Ueano/1EY+PeKVNFXQ7H36tK41VWvzN3FhV+34Rxf8OloQOqmP3J9KiuaNLEa1Yn
 pO2rg7KNryLSUsiPo6BPNaqjT22SHZoQ7Ao047A8Whzn/Lql7MQpU6Qo+iuP+exf
 fl7859Edx9BtEpteHeNzPS9m3TeuGsPCnABevyj1ly6OQaR73islKYR7GwhhMvaU
 BTBq4auXdtqJXCaPWi7mDzV9zME2TBzYuQaNpxZBzkFUavyXiUHpJvxO9IebqRY5
 eVEWZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy0f3g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:16:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c21c01cf3so3569101cf.2
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645019; x=1787249819; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=je+h48SSHuNHSOcK2Vh76kGO2HaV1LztKcGPEWVgCLI=;
 b=I14YFNBK4lFLqSS6sxPk37Q6tLlv51/tD2kVZ1xrSOA6MK0SoSTJ95S1D+FAEVpEUM
 tOuNxlPyIE+G7F+eN0mBdugGBFAVgapxm2ADjHN6jwePY+L7GY3zJ6d17k3fOt/aS+Ga
 MuAEQuaXyBSpSvW1XkNjXezWTW2amaoexoJpExCgQjnb5wf/Bj49Hb3wn7F83n/kSaIv
 DMqlAHVxZZTOsPVqBKm5kwvIsXpxSOFrXWVzH3vW/EYl6LWl5Falw6bwkXH3iuD4qOLT
 J6GyPmke+nIwmGUVQWMJG09ZoltvcIL+eMw/4Lztv8Xwmr4XnHGYo42YlU1nwrYCU/dd
 GuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645019; x=1787249819;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=je+h48SSHuNHSOcK2Vh76kGO2HaV1LztKcGPEWVgCLI=;
 b=pSaI/4duMhUpR3NSoXAwUo+LmXdZ3Wanc43tbgheiUFLykKj6v22H2N5Cfbojj+4hc
 EyqoJWVALzm8PRFmPc8+kn8kDCN8ID3hnxQAfQr2/5KpdP6v0znQ5ethY55lVC3XEGlV
 YFENwfWak5A16LwGRaJ0AK5Qb1+cRYTaY0K6y6IQkEc9VCp8R4LjujXq/5hT1uY/ztvQ
 e37vEs5OVd4+xH4btLw1zCJuODrm+RE2vk/MVAqGKddQj2jm0SyRyUxZLnTSyYZn7lDM
 hFlsVopBC4TbaiYykwqgW1YXZiXr4aFAUezmFjN6Fa3x7tQZplWut29wXr1EGqz9ya1u
 8fKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnYQB5FcdigqTCX5sYE5X/XJKq26nZ1zHoXTvsnHFah/rVN4C3SvMx1bN9HpvxEHfbyXhumpT3RA==@nongnu.org
X-Gm-Message-State: AOJu0YxhkQ+WmKBbxtWxf99jhKsxGvm0h8xZnt6IfMxEck1A1IJ97Qd+
 w28XXN5ikyXTPy31Z4MSHVYIjaEvPZJJ0C3StLatwjq12lZK8WU8QRA202Do6WYGKjJxpDL8zSA
 5LoHwZkmfuYYbsJeomrV0GHIf3by6REb4sN+zZAALvTdXf7WNONmhyEU=
X-Gm-Gg: AR+sD10qaYUUBkbm+Lpg9HIc2u+IwCeTQyW17GgOkVoLO5s+7hgLpRBR+jq/T69ohla
 E941CYIxHQlN0+FRXUmQ5fVHE56uqZL75/OP7CVEPBjKwRwAhaCGdkPa/La4d34dgMMN/mU5UcJ
 Q6ZPVd6PlvXqv0UiCsxBghCwOTftRJ8pynqZ7yI1xPgLfuRQp+lvNpLnqe60IJne9xOYOKu44e/
 +TC2V1cGerfa90icmHtPK5VxgD9XP3uPD14Yhg5i+KVSkAC245mdogICoZXVgGGMJ3e5l0fCw30
 ENmlwGLZPNGtPKWuP6bbnTcEi3KnjD2DfsyolImcdx8AxFWPRxltMVLXSrQkGnGa9VA2fImZbdZ
 2rwUFGlGz2Z+QA/Rq4xLy/au/gmnofaK0JLnhNlBnLg==
X-Received: by 2002:ac8:5c8a:0:b0:52c:dde9:5cc9 with SMTP id
 d75a77b69052e-52d73d2abf2mr94409641cf.22.1786645019034; 
 Thu, 13 Aug 2026 11:16:59 -0700 (PDT)
X-Received: by 2002:ac8:5c8a:0:b0:52c:dde9:5cc9 with SMTP id
 d75a77b69052e-52d73d2abf2mr94408651cf.22.1786645018552; 
 Thu, 13 Aug 2026 11:16:58 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777a4bdsm4564815e9.0.2026.08.13.11.16.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:16:57 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH 02/16] cpus: Improve qemu_cpu_kick_self() docstring
Date: Thu, 13 Aug 2026 20:16:25 +0200
Message-ID: <20260813181640.6537-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX1RCGch0kW4fp
 peMKqacbOP50EZuhTcMiPRrGApzVgKuGWwZXqMhcJsbhosKUt/INuXRa+nFkYsGjhWP4dOC5UOE
 u6fOcTUC4kWi8G1SuvQXONKq5Ntk6zPZApF2K9yaWzkRIiZpmUWb4wKTpD80ZgSCVt+ZLtC1ugA
 x1IeJMrF0gKCzugol5hc+FdLJAyC/JDhiss9fK2BZOOXbRq+DkPI5eT9F7Hj6Tj7f25rLqtTC6J
 yEbmB4pQzX598LGRIvWvSminqvYzqfeGZMXnOGD3LF3o8FJOsImXesbcVZiAWsFLzqj8QefFzQA
 9b4EC/cD4DvyMQgKbQeuxkrMNDsGQJ7BHl7Yt/Zxv5lu67wp8Bm0U+kqsQw6Er4Eq+B8rBvxCHw
 qZ6z1eomZhZLg9k/jFfp70kOUFG0frQYPEuEW/S2cfVOtxwhYz5DhGau3D9zH3SkyrndxmGr1Ry
 oklVlHXbWToH0xP6xlA==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e0a1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sTtMEC-yLAECRKQ91SoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: PSPC3j5RtoZIywKMB_QJ1evvHl2S-EbR
X-Proofpoint-GUID: PSPC3j5RtoZIywKMB_QJ1evvHl2S-EbR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX0QYDnKu+m3PM
 KaRuKkqki1la9AyluGH/ePTBXG/GeiTDrqiXwyTMlbPNlqd63dyoPoYCdmdoeUnPZb1W8hpEg1B
 2lDc7u8eXjhfE4Wu8n2j1/kr1Shj5lw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
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

Be a bit more descriptive than "Unblock cpu" :)

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/system/cpus.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/system/cpus.h b/include/system/cpus.h
index 508444ccf1c..ade13e068eb 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -30,7 +30,15 @@ void resume_all_vcpus(void);
 void pause_all_vcpus(void);
 void cpu_stop_current(void);
 
-/* Unblock cpu */
+/**
+ * qemu_cpu_kick_self - Force vCPU to re-enter to its inner main loop
+ *
+ * Signal the current vCPU thread to exit any blocking operations and
+ * re-enter its inner execution loop to process pending requests,
+ * possibly returning to its outer execution loop.
+ *
+ * Must be called from within the vCPU thread itself.
+ */
 void qemu_cpu_kick_self(void);
 
 bool cpus_are_resettable(void);
-- 
2.53.0


