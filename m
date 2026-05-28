Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE542CD6E45
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:18:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST7t-0001uI-6W; Thu, 28 May 2026 01:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7f-0001rm-SX
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7d-0003mu-Ih
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKmuvr3197814
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=etSUVx0eN9V
 cjfDsztnPxmI9XUOjm8175SUF+EAh3HQ=; b=J+lmsyyllldDWMIddy9VogZxVJi
 3gKcnmiiPguksL9mJzaVyzLFhNGroVAXXigPBCT6OX4mAV6J3SzX+L7nnCAe5uRC
 X3ivbtCJzzPUHs8jMABk0JQlZ6Jnvd3pRrpVa68mpDPpQgBRUgRrDsl24s0SByN5
 kWfwkhMRN6mOuSZpTABS+RDwoVR75lnMLYdU3vVOLHkGxG6Qprs5g2JBh9ebiUnr
 bEyQLYOMz0tz4NzBn+UaV3BcuvENVRQH56Zay7ReIvs+okwc/kNH/UaUmB98wc9H
 9O48sm8Inf3RyRs3xI6JiNOFdrrhGarriVon6ghso1TzuuC1DJQyBU1J3NA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynhcec-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2ef37c3f773so12443161eec.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945441; x=1780550241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etSUVx0eN9VcjfDsztnPxmI9XUOjm8175SUF+EAh3HQ=;
 b=F/WYiOzm9rIi7Z280s7+4pIaRYC7x3IB45NxneTLrgiqFHV8PUr1AhTlk7vb+cKIri
 9I1vhUCIy0vWYmWpdoDEFhlBZyMcUV1xhG9DhS3qnnHYcr6OfA6ryjuVyeGkSPSOSg7A
 KdZpewdFI0K9nTUhPBW2tEf0lD7u2u02/rsRQSUz/H6H2uLEuNiTn7DPc84NeJd48B9p
 3NJdYxBHZEXrzmjHVSADJfIj+grmvV/tk5XOZ6k6fyX5AiSOUdzzEAsG1QcabPhh8xc6
 2c0A/aXaNH0cyKZXE6Tc3o+vtJ1x+80nQ9KeIN5YRBa2WfBTLFZwzQqWqtqDsB0i2oPr
 03vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945441; x=1780550241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=etSUVx0eN9VcjfDsztnPxmI9XUOjm8175SUF+EAh3HQ=;
 b=ltIFax1E2jZVtHVq0ZI33MmZgSL7onRFBJu+6lgKfUNex3Gup0KMbr8nuUr5HGVet8
 iV6ethbTTrJF34lt0m/2fLqviTGGyKBBZUJs7wmbmSpxtOfJyBZ0KNeA8DO2MO7zr4Yx
 HrPhOVT/Y3YzvhltHJdb8Vx+gDeGht8o5o1UYJeuvaveXPcXEoGlNmiZO7Dyw4RVIOXx
 IdBBL39BAJl9xv5vzI6TtbHELdCiNoRwbu99b4+oyQ8RkOTen6T7O4bvUlrGFIuaqC+c
 J5NGZwhNLMeQyUgea+hAllHIZQyyrZluQHHgiQX0k61GSZNoBCil9wJINERshnsHmaEJ
 Tbew==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RBY8Vl9G4QPQbspXpseEaLj2xf5wa3zV8nfj9g66o4rC7jGW6pVsheLqOLNipTmADxdHAJTDb4w==@nongnu.org
X-Gm-Message-State: AOJu0Yy8070lMZMfHqazYz6Vsqg2j0yJguWOtiuyG8QgyhoNSggtwG+2
 iool7ImqHJKbh6q6kCw3zFqVigAOgNN4T2a9W8voIrdct7PyUQ6UKF/X55Ifgb4934rHqGF6djv
 GzDOMw47ZDwH2Fn5laK0ZdqG96mvgcCtR3s56qEEpNjrpnC1iYP0KLIfg4iCBcwjmXQ==
X-Gm-Gg: Acq92OFIubtWHkbB5Do5/8v22lq0gffyEGt/X4H1pkVjgE0G+KyMeYoSY9peqYgz/un
 0WtIJV+bEPwuQuLPsiCpYFmEtWbQTt6O3qMYD8/7Lcw0/iPrWLQVXfl8OM2zTHHFwdENjAKQLim
 frG9hDiSMXwt2iFnTYSHnhtOoMoLmOznOpYxF6YbgRctCMFyU7NnGb5fsX78vkaVFhgx927V84d
 zvMEoKyV01RwR4BB8i+DWQ7r+DSUjQklAykak1s/t5MGQrhcftQbqWbzIdar7ugKPNpoME6qc6f
 rWfTJ3UCHDmZcrUdunOiYImbUzpmDjoRCNz0qBwzy52E4IC8iC/enll2D7o+pxFg8dFnzZQyWyT
 5eSkV2Nq0b3uC95cjHpLuyfO4EX+bxD3HX8RzlXZ2CUQaKl0RwWQwIXyIi5ccE8zf8I7VEkHlQm
 hC0fej8yvThezoXxGP
X-Received: by 2002:a05:7301:19aa:b0:304:b14:ec53 with SMTP id
 5a478bee46e88-3044912c370mr10201596eec.27.1779945441186; 
 Wed, 27 May 2026 22:17:21 -0700 (PDT)
X-Received: by 2002:a05:7301:19aa:b0:304:b14:ec53 with SMTP id
 5a478bee46e88-3044912c370mr10201574eec.27.1779945440664; 
 Wed, 27 May 2026 22:17:20 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 07/10] migration: use stub_ss for vfio-stub.c
Date: Thu, 28 May 2026 05:16:39 +0000
Message-ID: <20260528051642.115721-8-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tOD6KtPi1iZ53acUS2585eb2P0qDFKy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfXynswdx3htaJL
 05xfqNxjkD6llZGb8uPwIgUEhTFIrjn99JtDg2cbYIQhmGaK5DEBzxSTBwjJWO2uz1lkvHCuTOy
 4J8+HrNMIauv1ZR0yvotzC0B3d003oIN1ZGZ+PlE83THtVGWqVol1HpGwcZbIjMM0UWaGwK4sta
 hRmlYqmzpUQY4nVkBIXBQfw+0aC0q8npsZj9lvgUfuSQ4Vc60jZUoM2c5LTFzdNgj2GXlpQXqJj
 um1No9WRq7DJoj3Vue2nMaYWYOnwsObsy61VGhx/bOPgSmDn2a4IybAjQPI3x+w88fAwaPQcYvu
 rGPQSNSydR0/p2drtXO7+4aTmyV85lo7ppeRmDqZEeY93ijBJ5VrpkYwFRTIYF4M8YztZkhs287
 VC6d0BXpxLjKo7mUY0KJRkZXvFP1KH7Mr33cM9cVsKtMz23tb0bD951qonihBYkhj38ITSVHorb
 9+PG3Y50PL/iHkQR7rg==
X-Proofpoint-ORIG-GUID: tOD6KtPi1iZ53acUS2585eb2P0qDFKy2
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a17cfe2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KtVruv6KyWWGae64uJIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280049
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 migration/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/meson.build b/migration/meson.build
index e583822dec6..0a9a5d0d374 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -50,5 +50,5 @@ system_ss.add(when: qpl, if_true: files('multifd-qpl.c'))
 system_ss.add(when: uadk, if_true: files('multifd-uadk.c'))
 system_ss.add(when: qatzip, if_true: files('multifd-qatzip.c'))
 system_ss.add(when: 'CONFIG_VFIO',
-              if_true: files('vfio.c'),
-              if_false: files('vfio-stub.c'))
+              if_true: files('vfio.c'))
+stub_ss.add(files('vfio-stub.c'))
-- 
2.47.3


