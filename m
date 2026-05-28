Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00904CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST7M-0001fn-Ak; Thu, 28 May 2026 01:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7K-0001eg-7q
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7I-0003Ze-EJ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:13 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKlV9l1225533
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WpIpFoOKYpJSUa5obQhW2B
 cueap0pIp93fg7TpyvlLw=; b=jbizOZnMtPdZsHsIE56AG7WeV/OBwQH1Opb+2S
 XJMVNUlg36VmJXhtTww5NLydrW+CT56RfI1QpPF6be4HOpQCgZb8xilf3O5GgIJp
 Y7yY9GGecJc7Z/q1mfrRnPBGheixhUqCPeDtTh+q4W4hWV8BQ2zz3dM+foYc/Y+H
 Gt0yh7+fB1aMchhZ4ofn5IHj1v7ig+YP/IImZFamomE+tZMQuuQP7ZN+PAGtH6VL
 iqm2Zjo5yRIPJPOCjwWRLt3XF8DG5D/vRR0pQRtXVMuZq6icTBq6VdhaLmAiUL1e
 WL/6QSJ7Kdj4ehVpOr4sihWoey29OQ9tGQTG2NzmXPDBXOAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1se4j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3041ab826ddso12279980eec.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945429; x=1780550229; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WpIpFoOKYpJSUa5obQhW2Bcueap0pIp93fg7TpyvlLw=;
 b=KfG08ouhbgSRc+qeugSDtrfZIAy9ruJn+acB7C2Q3Kzbq6ZuqFcQ8wuVmqsSiRjXNg
 n/jcjQgkyRiCSbIwKXjpH6S7+p8LWpJmFlcsrRodydqbCU+MR9uoEv3EY9dMkJphb9ZR
 G/k0aMiFCY9zI10onNv4nLASxT8yrX2m5X1ZzcmQOU/YJhX3pvWRtfdWRwhsYUJQF1Hq
 /nv0tdkL9ZXRJVJTkyktbPC131zq8VevmXcA4ByQoomNnDd+ZiBH2fZYV8sFxROKiP03
 p6XEgYDTvMfdHL0s4RD3eMoQMWVjNZLK37P8iCI98R6lkNtyt5SW5ZLWjGOBqI81obwH
 PLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945429; x=1780550229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpIpFoOKYpJSUa5obQhW2Bcueap0pIp93fg7TpyvlLw=;
 b=qkVTJREz3R2VRsrnyO/bjpXQvilYroTjqTXuD/GEmYjU+lZ6LOqzPN44HO1a8Se0Fe
 ynLwkBo90ZJmfzh6m9vBfV3Rgf25uChDkvLHmknrO8eAkm/+17HxCTMjOFUhe1TttIBS
 C3jLL43CPXu/nFFlo8Iy/f4dvCJcUOuKKf1qHrC4PPrfPLHaiMiLdlWZaHkuCcdw0air
 BDsGX5hnV60UszXGghh3jeMrHWsraEeQHV6fNUTQ6eVOGxP7jypRX3s7hTVwdyVZXPUE
 q/11ts837BR2lBBqMhQvloJ1p0GOoMvBfnOLx3ZVPugy++4kPDzqOao0JG5zXlZPT+i0
 Ck1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ocJlX6JdXsdLNTuTq5qTJyevsS1xe6y1GlgB5aqVSDm/hSGC9HYUW8vZFnCzlNYO2h+Vst9IrZQ==@nongnu.org
X-Gm-Message-State: AOJu0YzARXP5PdXbL2jryJ3AkUKuKh7Pk9WHQbzYNFTg6e0ZCz31p3so
 SkucuN/rrgTNnrCFJkpF1L3ecpMuo8UvGM8IwI705C9Ee2IKpBzVHpeIRTuGf/d0khyuTyevbjP
 p04YIgYnMItnGygJO1gpSofAUBE2bLO3pK8t7cq8bfQs6hdkoy2OEXkI=
X-Gm-Gg: Acq92OGZf0IkQZ6lAdjaFOgGTk5FZL4dQ14Hu11H3ZztJHwUPlj4d5YjeGU6Su+9ZD5
 LmqekoSudppmtyacEghtwZdIC5TamS13r8QvcDOk0FWd6zvE8Y/BMfvAEpnnCDRtfWwBmn8it19
 cb0xdAzVUub8Wx5uNvnlaG2xppqfdvQao4KD17LJm63sRY4WFKsPxlDSxpxHzI3ZeUmyM959oLr
 lYl7ZDkmb1gdIhbf1ks6mqCZnLZPgdeHYMeTJsfwPkWL2Ub6V+kdzX0EKR0r8nLtoiYP1R8zF9D
 40sST9vjiK6Geb8fIufCwJSvrGbEK3FTetJq4EKLopCG70Ux2HKIwS4n5dfQhcf7oH4IGRfkjpA
 piysKa+M97xsLL067WKAqeraWvYteIwdHCIVb3xDbcYeE/TUSJUfT6KBduSsbsa67xzS1WeBJXD
 mSVfTlawVVkY+nPQOz
X-Received: by 2002:a05:7300:6c24:b0:304:2899:bbef with SMTP id
 5a478bee46e88-304490526a4mr11925883eec.20.1779945429384; 
 Wed, 27 May 2026 22:17:09 -0700 (PDT)
X-Received: by 2002:a05:7300:6c24:b0:304:2899:bbef with SMTP id
 5a478bee46e88-304490526a4mr11925825eec.20.1779945428782; 
 Wed, 27 May 2026 22:17:08 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:08 -0700 (PDT)
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
Subject: [PATCH 00/10] single-binary: fix compilation/execution for {arm,
 aarch32, microblaze}
Date: Thu, 28 May 2026 05:16:32 +0000
Message-ID: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a17cfd6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=mvaH8uqXCdQICJZTuC8A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: _plxKk2RZBVpNyoD1vYGATYvdjis5AZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfXzZ+rL7sRL5XI
 cuc3FBH6oA7gdLKGOEh8fimm34ZcJns1Is1VeVRgR2X+P59sdz5sJCKtlKPrfELwbixIhQihgOP
 m6l3fSEPuCNmE7Cem7hqnQ1sypjOVQnLib7O/LsiJYvLVf+9Ef+A8tMwl53GHwoS0MpUpywcGaM
 Hiver+AWUKQGlu7q5Y2y+iAjXNzrX7D6B+jqKXo51pBvmfYMkjX1iGg0qppG1Yq24XQ4bdZDO5q
 /MWhA7izWN0z6a9lSFmgKliO/nc3nYTwDgLwZufwJ2lmwm/iCjx5ZN8W1+LOnXifdebqYj0aqs6
 ffA0NwXD7TxdG+ae9F+Csvr5Jbajo4aA8dDsLcIz+XhYdwLCbPmDvfwcah6bPq/yeA96eh/ov/i
 hUAR8+w7vegaU76zyrm+utDQzuqjMKJ2JEMQzBK/6xJTl3WI3RaFv69SVRRqpQmaReGeilinfEQ
 m2fN2WaKFbhPBZM9x1A==
X-Proofpoint-GUID: _plxKk2RZBVpNyoD1vYGATYvdjis5AZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280049
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

We are getting close to have an initial proof of concept with a single binary
embedding the three target arch listed in title.

Those latest changes mostly solve link issues with symbol conflicts. Also, it
fixes an issue with accel-arm-cpu QOM type getting registered twice for arm and
aarch64. From there, we are able to compile, link, and launch a single-binary.
We still have more issues to solve though (filtering cpus, machines and devices).

Pierrick Bouvier (10):
  target/arm/meson: move kvm-stub to arm_stubs_ss
  target/arm/whpx: move whpx-stub to arm_stubs_ss
  accel/accel-target.c: move compilation to every target meson.build
  target/arm: deduplicate accel/accel-target.c
  meson.build: move some subdir before system lib creation
  hw/net: use stub_ss for vhost_net-stub.c
  migration: use stub_ss for vfio-stub.c
  net: use stub_ss for vhost-user-stub.c and vhost-vdpa-stub.c
  target/microblaze: rename helper unaligned_access to
    microblaze_unaligned_access
  hw/vfio: use stub_ss for iommufd-stubs.c

 accel/meson.build             |  3 ++-
 hw/net/meson.build            |  5 ++---
 hw/vfio/meson.build           |  2 +-
 meson.build                   | 26 +++++++++++++-------------
 migration/meson.build         |  4 ++--
 net/meson.build               |  6 ++++--
 target/alpha/meson.build      |  4 +++-
 target/arm/meson.build        | 10 +++++++---
 target/arm/whpx/meson.build   |  2 +-
 target/avr/meson.build        |  4 +++-
 target/hexagon/meson.build    |  1 +
 target/hppa/meson.build       |  4 +++-
 target/i386/meson.build       |  4 +++-
 target/loongarch/meson.build  |  4 +++-
 target/m68k/meson.build       |  4 +++-
 target/microblaze/helper.c    |  2 +-
 target/microblaze/helper.h    |  2 +-
 target/microblaze/meson.build |  4 +++-
 target/microblaze/translate.c |  2 +-
 target/mips/meson.build       |  4 +++-
 target/or1k/meson.build       |  4 +++-
 target/ppc/meson.build        |  4 +++-
 target/riscv/meson.build      |  4 +++-
 target/rx/meson.build         |  4 +++-
 target/s390x/meson.build      |  4 +++-
 target/sh4/meson.build        |  4 +++-
 target/sparc/meson.build      |  4 +++-
 target/tricore/meson.build    |  4 +++-
 target/xtensa/meson.build     |  4 +++-
 29 files changed, 87 insertions(+), 46 deletions(-)

-- 
2.47.3


