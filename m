Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B8ACD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST8l-0002l2-5Q; Thu, 28 May 2026 01:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7m-0001ti-BK
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7h-0003pG-PM
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:41 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKlkOq125217
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bNWTYNGwliX
 gR5yN7yApPakICBNiwgMn1PqqkUBtSeI=; b=LqLg8HFNOg35FeH+aPJ4h0bcxBb
 5S9iMEu45JVSMz/BjJlCL1WJ+d7AmJWasdK85oFqbwoflN2QbFFAJ204+NJOu0Gz
 D8Sm0sjTWJFxcYnMbEMa+K9AHBi+leaeIJNBXjkNAVHiTmyPYPxZ4kLnNPu4jacR
 FluuVRlLjkEnQiCfKJXMdDB7e96flnL2KJ6ukr/HU/V6bLpSibzZs6P8fySiYTDZ
 fOLmt/rpHdkUhopO4gGsPG93UekvBeWPyv7g5U5NUGuAAd1FEtEdkPcl2CGcoVwa
 PJAyImQ5/DDKgbf4CeTuV0u4/BDS5vgV72HfL8WPWkMwwoLZ7QW8k+YmCwA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yahd9n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:26 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1370417c0bfso2474289c88.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945446; x=1780550246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNWTYNGwliXgR5yN7yApPakICBNiwgMn1PqqkUBtSeI=;
 b=BeMtXigAP+6XfAklesQViEfywuJc6Qe4iaOQkhJAUKWefUZFyXw9rB2LXDHFkJYX+/
 KypypORWfhes+S5aN1MNSqwcgpCq4T/FK+3xne/E3HDrssQ708YfijsY3ydKX901J1KC
 9wUt5NP1mXXh9L532uGauOsSO+F1eWCrbij2JL4t/FMXj0gU2/u7WUltNRV//zMV0FPH
 CuOssjcugZXrvq6fytyMEfOrqybaozlfC/LsecligQ4Eo9KWAFC9VQ/Qce9YPN0mYUkk
 Zhr8kC2LnxkYN8Ya8tEfUAN6alFw1cIj4P+Cj+gb0pet9G6Hww1bh1N0DjwtvzF2ehP3
 mzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945446; x=1780550246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bNWTYNGwliXgR5yN7yApPakICBNiwgMn1PqqkUBtSeI=;
 b=LPm2XaOU1SVftD/+cE8F9T+JDdg84cqBInbaIK1f0pfI/l/u+NzdoWPXI8PMiBx7Tn
 NGTurnhdRVymh+Y2SH9oS4aCU+QK8n6gifCqIiWLtNdmMHSMRdpUO3X7x4Jh5MYgsm2W
 F6psk+5yDr3jsNYfjrUUOG1dPPumx+WzNi3+GgOiaRyvvgWa1JR4IvuYQeQ44YFWlWUx
 rGyTUQYmM6EmTlsm92ZUzxvhqXIT7JOLlbcYFf0JKX60OWPIh13sxbEj5XXvA3/kx6PN
 tBW3FysoISvq/twUXYuM9RAxOo5ukjdwYGGC32L4GzKKDLbJdiK51p7GyETUzVwmosib
 E9Kg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+VIwCvdIIxrwkpW2mR+QU5b/TB7beLZwR5XKyEAh3N/+DfufGzU4TZ3SF7i5IpPUDfkxH8Br2nxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx3uUPtblM+frd1EdZ6JqNym4zCQ47qxb19W6KcRkwzEq/+kZhs
 1s6p7W8WpGZXYwBXhLg4YP0r8PBijs6/PR39WhqTMWAM4a1Ni/OMGJShKM8/c+dMuzKghSrwmMI
 ViZXjRJ9AdztGq1PC1aAZvZwASz3coH8067MtDZeIIpckulZ5uT5CNp4=
X-Gm-Gg: Acq92OFpGgmZksQxhptPr81vmBgBCOE2ucpavmdc4s4qZQ7OtTgIJ+Oj7+7mndJCiUz
 LOpU+b67Ds2tF7Els+eg+xitUVgcKURG8eLooXuuRcJq1efABWg8P8AjRYOmlephF1LDHq5o1rJ
 5mbNjOzj5xbzaG0V9n8Q2uKMvbBpqfQyGcs7blnyKvZ/ZdxvSwyiad5WUYy6YS2LCsnh8Np7spf
 GFjtsVmQoGJbyf8Bj1zIJibpCuT+g+ZdohX9aQP3pWri8YDStryfwa0wjvIB+iUviAUhvKDnmd2
 gueXeTMWR3EMabHc+coSAKkwEDxTWTe2rgN5Zq+UPvYSslg+7yrVVc3Yb6P5ToJCw1gAJvzCA7Y
 fKTknJPw7IRBMa5fqmxRz8x8ikK2xtJCA/BJB43QfqmBwQE8fVnYPPMCH3s5FRx19Pm6xo2o/EI
 MDYSh4qhKE0IsA8uI1
X-Received: by 2002:a05:7022:458a:b0:135:1ae8:39a1 with SMTP id
 a92af1059eb24-1378ecd0cf4mr40724c88.17.1779945445641; 
 Wed, 27 May 2026 22:17:25 -0700 (PDT)
X-Received: by 2002:a05:7022:458a:b0:135:1ae8:39a1 with SMTP id
 a92af1059eb24-1378ecd0cf4mr40693c88.17.1779945445123; 
 Wed, 27 May 2026 22:17:25 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:24 -0700 (PDT)
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
Subject: [PATCH 10/10] hw/vfio: use stub_ss for iommufd-stubs.c
Date: Thu, 28 May 2026 05:16:42 +0000
Message-ID: <20260528051642.115721-11-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ki_StrKsQxoQn5WQdovpCgRDHdO-3O5F
X-Proofpoint-GUID: Ki_StrKsQxoQn5WQdovpCgRDHdO-3O5F
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a17cfe6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Q9VBMtJfUB6wdbeww00A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfX/pUf9gwovejc
 JMaPYl7qpxj3sW1p8xodW7hXq+3J8o/DWk6g9lFCYo+ULNfL9KsVL/oNUwf91GDUc8//BGS15yq
 OUWIQav49Crt5M693LLC0beChhEb0hhdj/C/lAN8qNj5VL/qYM6Iv6LvfpnjGTa7zFMgDt2iwL/
 xiYGuVmJ98PvqzVeOh7aGe556VyogtZEVtqTAlweGyPCsmYVWdzofawJ1rwkJ7qBwZW5Ylvu4TV
 WHdjhmRKsW9y4+WdseBTgfrm2+s8LQHR3rMoNRFQNKtr2X193bD7cdhJft26kvlXnjJKaRmVoWI
 Cs4uFhZMlSxzD2Bcwm0Vu5uVMS9nGQzPU5E+OO1cAlw2YUWNo1OMsOLEQAtN55SdePb0KHu+mRA
 5UfMnfDyQzZ2FR4xm3yAM3/9/nlm0LOhWYrwCyUKkFzXCJGfO1oYdWx7z3XN/yzn+DkJjPnbwC4
 +Y8/Pz7GDDSAzkr0F0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
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

Solves conflict for vmstate_cpr_vfio_devices.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 hw/vfio/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index fa0ea6ecf0e..c7c31b78f68 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -34,7 +34,7 @@ system_ss.add(when: ['CONFIG_VFIO', 'CONFIG_IOMMUFD'], if_true: files(
   'iommufd.c',
   'cpr-iommufd.c',
 ))
-system_ss.add(when: 'CONFIG_IOMMUFD', if_false: files('iommufd-stubs.c'))
+stub_ss.add(files('iommufd-stubs.c'))
 system_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'display.c',
 ))
-- 
2.47.3


