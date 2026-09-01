Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200A9C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LCj-0003eN-HA; Tue, 01 Sep 2026 05:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCh-0003SQ-VB
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCg-0007lh-FZ
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:55 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681793N7705504
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HEBSDWkPfatOfZfORlKDlW+OAil/75LNccJZJS9x74U=; b=SzRmXOx28ijPgP9M
 vDPr64c0DLwjSimH5wVXhn0yvCc8pypaTNrDq85B2mxGVHhNXND9wgDD2e7BouEI
 O4Xh9H+HXMTPXTRBdnmdws4amGzRqp0FF2ALHnPKU+6uA3b0xGV3Ue0DQjf+B76U
 8ojoiwR0tqqLqlm6rSu2J4kie1ANNgHCUi3Dj2DrwF+LwAzAVlsdtdin8lkaSgiH
 WnO5tbfZ3Iikd+aQSLbEfGpKnozFjgVjH56FFJ3JlWHaWjJG4/07gYZl1kwXcE2c
 Qy/779oTR5jyN/AiUAiZfVpcN56MTUAx9Fk3nTmkOgFiXxogDuAT7zpoF0t4WQb8
 E0t+wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh6dc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e52306621so610151585a.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256492; x=1788861292; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HEBSDWkPfatOfZfORlKDlW+OAil/75LNccJZJS9x74U=;
 b=AnABgcd/tdj7qyUBA+xTWCOuXIDjyShOqmrn7CM/cixf9W3jmXq82xJbrQJtKQOvh5
 YnimMPnA7P6YmBgqrzjDQa0RdmMy5QaIngX+odho8jo0baTJvlhlfMBAfWgK2FDHw7Z9
 y4RlPFETJFAAaM0FtiW3LEoqi0N9q5gjo8K6foPTWMgci+Oze4waLw8pEnQfppXs577M
 IVAi1ETkWGaYLt1R1t+gk7WdVsVnYinMPAGNSU3/Ue22D+0rcHRmz186YcRbSeheXoFq
 NGfNrqzL6jEuSz3vU+uDoETo7mZQpm4Hz/5vo60VKOI7uv8R6dNEW7UVuY2pP+Kl47nL
 f81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256492; x=1788861292;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HEBSDWkPfatOfZfORlKDlW+OAil/75LNccJZJS9x74U=;
 b=W8a4hbPOZ2rrKoJ8VrnMozW8BCFXZbdOi8PLXKl2nsdcm9YdIM0POf4y5eMs/3dpQQ
 7/jYH3z2Pr+vkkUifS/p07pkOwABMHEQ6euGACDrUEM18CvI1mLtOivHjkU59wb8HkV/
 9J/bxFGWDepJPri3VlcJlXrv+m4mIP+ZBowpgMcPV5hEUXbNw+viVm7hx7bfj1mvSRzg
 /manm7jYIHDFVjQ21GmieDaP6QYIf6n74pdVDSdGaRiiXCUY0PH4yUFCqK2J8VPYrzyG
 Dd5vYzM/YIXZorc35IWHCTRfm4Ub7Yb0Gl/KOdTpmrSalG71U2IpCDczb/ez5VwmrNSw
 T6Lg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKoU6ulLnhOFl4SSlWB0f6S9Uf8Lsd0tMzlxvmGY6tsLIM5fj0r4wsdpbzyiXUbkMGURJjOJi+VA==@nongnu.org
X-Gm-Message-State: AFuF++k57vyK+OaKp7Zzc4vuo/9c5hAH/K4PQp+z9ML+G9kCTd2RMYpE
 aF3HTmnaAkwNbZDvx50wGuSkNSRTFY/laLVe4YmTUy9Jy5lkdQn7VaX2kukDIeMC7b7LIQGct1h
 qvF9GSOsrnXfYuyboEgEZWkbwYyPSlUxEw/R7XLt/yrlZmG65G95IKIE=
X-Gm-Gg: AR+sD12r+KOnlkq/YSsircJ5+knWMh+zEwgPNHZOQwAqHh0HfMC/139y6e3qiJJePsA
 c9o4B7GWOD/2aZuDh+l9sw2z8nkEpehN/byh8KIra+/Def7AQ38HD8K31w5Cau8c4jL9LCkcoJZ
 lKivEZe8acBI/NSBjzprIVny6mYR/tfA/GYFWRAa0IsqhAPyPpYxe4W/i+1bqAEMFgYVNjzjczL
 39cEMNp4Ty2s974sjzaHg4fM2iKaPXEsUwwFbQqBngvTkUjDZ+RVPI54xuribopOasSLC8QvJRL
 foKTvnQ+iq8aWCI3J89cnbt2G0cJq521cWHEwcjb4X2sPx7vMbXxULFBeaR+JQWrILdNjD7wPIR
 cre61QqtqLPOi3p/1t7T/uw5rgMoblggQnYtF89N6
X-Received: by 2002:a05:620a:3196:b0:936:e938:b07a with SMTP id
 af79cd13be357-93947f3fd16mr921356585a.8.1788256491784; 
 Tue, 01 Sep 2026 02:54:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3196:b0:936:e938:b07a with SMTP id
 af79cd13be357-93947f3fd16mr921353485a.8.1788256491334; 
 Tue, 01 Sep 2026 02:54:51 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d78a0bsm3860498f8f.28.2026.09.01.02.54.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 19/21] target/xtensa: Constify CPUXtensaState in
 xtensa_replicate_windowstart()
Date: Tue,  1 Sep 2026 11:52:25 +0200
Message-ID: <20260901095229.72018-20-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXxzac3ugDK5Mn
 zmltHAcXakDKyILoYcFtAHSgJ7Ay2qrN/ufuhsMVb6l0QJtIlTJHAl1ct/3jzOoDrRf8frnqpew
 fLvXw1TLK53gYK7sxD1xcGQUUCWZs3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXyd+bwuzY/no1
 kFJ+A/MZLn0UzoQ9Q6yF1mjO+jNtbYisp7oLf6+sIdRlt1CSFBIbH3EbJftqRpyXIR90sWRg6/f
 S2IPN7+LHePg19BvGWeVFdNw1fDt5Xo/HnIQgeMVjpBU1TXDh0TzMJ5AB76ml27JAK9INM3O0jL
 RoaAY2eYCm4wk9RB2zxWevo+tANM1jpQbefXsaDOmke1OueOgd4a1t1hmkLencY27z6/ksWXbir
 v+PuT0YsLqPZUXBNwYcnuv0u2GBcnZM2I18i20075Iw/R2QkAygt0N7rpes0mhe3mzKsOqZzZAd
 HR+yO9gTigZjdAy8V5gSRg3kwiFemH2ml+XcD0O4cjXIFKw1ZEuhuPX84Syw0fZkJn8L3TVukC6
 udH3oUwLyNKepcKqSmm/+xOucDFWtEN6dhlckWDPAf2N56ETfDqp2PcOhBudDxkRBsqnBPUsXYX
 u3fw3LODGDrqhmx4HWQ==
X-Proofpoint-GUID: Wh7yUp9N1aoQ4ws58SO14x-sihbAEpDS
X-Proofpoint-ORIG-GUID: Wh7yUp9N1aoQ4ws58SO14x-sihbAEpDS
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a0ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WyWAz_IcRkS63iEfKG0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Add the const qualifier to CPUXtensaState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 442e98bd1ba..49d6ad9083d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -708,7 +708,7 @@ void xtensa_set_abi_call0(void);
 bool xtensa_abi_call0(void);
 #endif
 
-static inline uint32_t xtensa_replicate_windowstart(CPUXtensaState *env)
+static inline uint32_t xtensa_replicate_windowstart(const CPUXtensaState *env)
 {
     return env->sregs[WINDOW_START] |
         (env->sregs[WINDOW_START] << env->config->nareg / 4);
-- 
2.53.0


