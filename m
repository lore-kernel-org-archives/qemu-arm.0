Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1826CCD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST7T-0001i3-Fj; Thu, 28 May 2026 01:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7M-0001fy-Ps
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7J-0003ax-4T
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:16 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKlNjh2450341
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pUXCyHJRsjb
 wimqvrgesToHDduCIQ67SQJqg4nfGx3k=; b=hnDMgBC8Rbq02fy3lDqzLYzghJ8
 kkGfgq66plrFxSsSjX16843Qzxw4CN5zPMtzeUTQhShNvRaOL/goxI07kAWY76xV
 abcvL7M65R8mE05jg+bOU17Z6qyRnljZnGOK+gdsmB7DOkrfVBIh7wjzD2adPa+6
 +rsvgr0/0DheW8Oigbpr+vyonhDJGqBqCi6QB6vorltGjMkdy+bQekp918w1/aEL
 2/KE/0i4YutZxJoGQvmnHXtK0EXQo9EXFm3ZCU5bTsZ3ppBnG+hqAE4Xt5hbRhlG
 DX8bJIoDvW+Uwobx8YR1gI0ryejwzXSxYqzAG4m5rs8GiOmxYgNOy6Plh/A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y59dbw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304627c66ddso5363841eec.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945431; x=1780550231; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUXCyHJRsjbwimqvrgesToHDduCIQ67SQJqg4nfGx3k=;
 b=VkWobf8QYcnEJK3AGARyB8wGimwCYvXlTdg5c9aqDuCaGP+Kjx7P1udo/oSUB00PfI
 9altdBtJy+tedjfwMesaSXBk+mVW78TKa2Dwh2UHOlkgWyZJt/qUtetUiRgJbr9ZHK5S
 jHoq7oXZyNsRDZKm2Pm67Pu++EKi4UNbkKKa7acPDUAzMMstZ2LJGc4OA6oVOqwQlPCc
 kXAic8ZB6+lvAfOVSIOfgCd9Pu0DeHmg7PpMlZ6+9xi+PwXR3ePYUUzrAN+F68eYs9ny
 sVIwSP3lYhJB5OHs74itEKUzBZlRVTLGzkgi2AsPWV23LD4lJaffUJh2ffq5AzxZP91U
 sAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945431; x=1780550231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pUXCyHJRsjbwimqvrgesToHDduCIQ67SQJqg4nfGx3k=;
 b=rotKwxseCw6PfzmNzNg0yHjLUhAaIfKt0ONq6OOVj58hFc8onh9cE6PtA5+cAPaYBY
 bAzHCEnDDVTIm8OihXr1MxiU8BDJ77HBedVKRtKmyDBOUNFPEGKX66xoLk5u6ZNZhszv
 +XsvR3Lyja7aMjBzoEDXQEjrR+5Pl62TtMrHz1OqUqBo53VndbzWbaVylWQuzYapIDsS
 4Qp3Z4zD9bAQcg5ITK/jkYn7bRJ3HiHMOxiSfiIkpfRp4q22xWIjHFSWosPrz65EwNXb
 eDzZ3tOZx+ogOy5Glt+KoGbuDpPR9RZGhmj3z1n8ldmX6UwsQ6g3DDS29vkjGGRGKI4Y
 r1sA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/R3e/CKf95AjJxyrSE5yB8wrKKN1iN1v9uZBBHfcfJPyXNr41XFUKBgjwACyY9q2oPh2dPA63e/A==@nongnu.org
X-Gm-Message-State: AOJu0YxTKQQg0nV4WvxYCcpcLJkpFt6+5/CJeOLfEaQ037qIISYIqXaQ
 1ISxCwDlc13gWSCKETwrsc795SKMilaU/p0lVt1F0Ux9h35zYND0tLaTRsByGUSTj1fAL65lICC
 xe0o8442ju2aMg4+D1JR4IWiPqHwTM14zjGa6BUKKrPFlGAAT0xUd3lo=
X-Gm-Gg: Acq92OFK0fY+dFqjFptJRB5rjbOSBC9ve8JEZlvD2Pbw81ECSYTZhrgw7ECgoZkaM8k
 Di+Zt5YAK+Fjem2PCUhsuQbDZlYNFtZzTtUeuI442vIYWJgF88gTm9UA+Qn4dqJqTf7ifN5ursB
 qg+Y3X16RkjhkPRV6kGRlAGLGaVt6rl3ozzbHf+9Cz+6i3oNLgetCe3c/svJCVAWb3ydoX/ns+u
 1zntyVIxDgDAWf9bNhe3mB2aDfp4DiT0/zYww9k4yiGwzNku2U1CIAOipMlo7III9ybt6p+b1jn
 Prsf72oBy9Gzk1D+lJS5KuSpMfM3MGLRb8opE8qhWhawzMK6HaA4JouD+x7Gv0pRHg0kDkN8fXc
 53Sq+0JK7EL7uzbokwC9PYKPkXXxIeYulz74MJ98ng19ERG0OtUYY5n5HAapHmSCkbvD79O8lLy
 vkfxjTGHNr7m+u+G4g
X-Received: by 2002:a05:7300:cd85:b0:2d9:ad46:4a92 with SMTP id
 5a478bee46e88-3044905ce1emr10510285eec.13.1779945431117; 
 Wed, 27 May 2026 22:17:11 -0700 (PDT)
X-Received: by 2002:a05:7300:cd85:b0:2d9:ad46:4a92 with SMTP id
 5a478bee46e88-3044905ce1emr10510233eec.13.1779945430617; 
 Wed, 27 May 2026 22:17:10 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:09 -0700 (PDT)
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
Subject: [PATCH 01/10] target/arm/meson: move kvm-stub to arm_stubs_ss
Date: Thu, 28 May 2026 05:16:33 +0000
Message-ID: <20260528051642.115721-2-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OM4XGyaB c=1 sm=1 tr=0 ts=6a17cfd8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rLAB-7AxZL2Av_YYLNYA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: PjgbPBGq2kGQH7o7QqaVU6lXXhZZ1zwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfX6sMw2ti+oe9a
 mBcds1XrZuYZpNHo1dnWpGfuEtgkXLUJKo7TI8G873lVecXwHq+PD5Oj8mJVDbf49EFPvt4En0J
 BYu/mX1DVeqAGxk6B0HhQMxzKxQuiB0ASBP9HByFwgXjButZwEwUu0O51QbrT0HmVU6xMPl++9U
 Qbw8T0j9kJB40+xGm6uIh6X1zgRE0Y7W0SU8wS+zA9ujz7tAPJPNCE538awLCxeDTOjzPayCRIc
 fSLyd4KYifJZdHC0kxDcNSqEHoKjQFbq74t99/rcBvfmedGJscrulsXkLDYAkJmxIc9eOfm7qKv
 qw6LzGAfY2pU3L6TyzVAjIb/CFLtK9P+N1Dp/SrYxgWUJNFKjqG7tLvr6PBMDbzyrdfuEPhRYN6
 C+UCtDeIonA9ID8rs3skf7Im1C+9a1emCbY2Y18DpqRdVxvCylADgXuuS7SRz7GcQxxrvnZ7RDk
 Ga4JWpuce0c5TqB1Usw==
X-Proofpoint-GUID: PjgbPBGq2kGQH7o7QqaVU6lXXhZZ1zwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280049
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

This eliminates symbol conflicts for kvm symbols on linux-aarch64 host.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 9408131d178..4412fde065f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -35,7 +35,10 @@ arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss.add(files('cpu.c'))
-arm_stubs_ss.add(files('cpu32-stubs.c'))
+arm_stubs_ss.add(files(
+  'cpu32-stubs.c',
+  'kvm-stub.c'
+))
 arm_user_ss.add(files(
   'el2-stubs.c',
   'cpregs-omap-stub.c',
@@ -44,7 +47,6 @@ arm_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 		        if_true: files('common-semi-target.c'))
 
 arm_common_system_ss.add(files('cpu.c'))
-arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 		                 if_true: files('common-semi-target.c'))
 arm_common_system_ss.add(files(
-- 
2.47.3


