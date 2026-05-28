Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3736CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:18:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST8O-0002Cj-UE; Thu, 28 May 2026 01:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7e-0001ri-K7
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7d-0003mW-1G
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:34 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKn32E1638774
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MlYXm57XS0c
 N10pj8v6iy4d5pOPFTMD/0gjetLxA2Xs=; b=bgL08QeZ3GphX+Hcvgyhg7tghfn
 vCBR/bL9x7I+ZJxxoBx6J1iIqXW2tz+K6qaKhYkVLUXsj7T3xzJ4li3605PqkVTw
 KdL2S5EeUgEa2a9qOPw75nyualJjbQpAdcMX3q6oqPJd0B91inMoppDbfSBjNRsi
 3vPw2W7pXglBnn/odW+16vl5Cx0FHrmTF3lE/hVJtGkYjvHQjxVMeTzFq9eLNuDg
 +rX8wktlId8ltI7NSO3wTlFMor+q6MwFX4RrT5ferMUxf6SeBLrohOUIKYD1QcCD
 llpfjc0Wi8s6dX7BsjXGKn2xi07Nr+yzStjULJsKAfB1MXdTGXQ3ybcceVA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynhd4e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1370417c0bfso2474249c88.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945440; x=1780550240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlYXm57XS0cN10pj8v6iy4d5pOPFTMD/0gjetLxA2Xs=;
 b=Anoejxzzb8UMLMWCM5FsysalWnPVwO78GJYRZMaXKJ4SlCGSxigUFNrWLxvE37bqH6
 K4yYSA7qlItavNxfYF7Ip5qqWv2igUIJY2Lhlmk+OibeQw1O5vSTQlU3jhP9XBZfeY/3
 2+gbxik5G1PCUdlW7Y1vLuX2bTgmIN2vHXiXWOB2AUBH7tgJ7F0VBK+rSumTHgfV3tZZ
 EjXk/3WBZWhFQuemNQFpdyKHEi+G8/3UFWOWIv3/PRA1oLVuC3Pppg9hgxakoNWCvvQT
 gH4jWxy7y1jTTN8nGCdktPGj/j/FAN8g/2EXev+tmzgwAnlF3Mrty+9sIoN5woOqExgA
 lGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945440; x=1780550240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MlYXm57XS0cN10pj8v6iy4d5pOPFTMD/0gjetLxA2Xs=;
 b=YxCSRQMJx0+x461+zP8Ratm6wX/y2u5wKv8FzRqT1iynnCi9HBeq5ISVPdg30A83Sm
 TonJ7+Q/sPa5ieYrffeyYym/EVoH/a/s6rWJYSoSwpk3Ei0bqZ93LxNuG+PiMzJcWLLU
 +7+LIkfh29oyos9LVi3IS8TlIHy+H+DI9fL7Sx7HTcXGlJdYoIz8c1V1lYXX8ZtwgkyT
 WjF85Ped6AsfeEBdEFmK1uycR7TMiwxkLO9Z+N8Razu6EflXsa+3f/nzf5mHKgaJtnqr
 fNjw2BL9OrKvcy1TsUy7rJV65AOE5it02qFy1VAfVjodKE3Y/TuS6QLMF+/0fXi0hnUC
 aWlw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8M+tJHWUOjK6kvRuNK497dbJjT0zDx7C+iWotf4YzMD22eox0QNE4VoaHwc8XpncLw5bXN6/uIDg==@nongnu.org
X-Gm-Message-State: AOJu0Yzz805aM3Eb4xxcO+gm79/7HTnedM0KOEAIWAExXdXjhOnsfk7k
 XmM2MPhIrNU/mY5/QwKazr9hRzeyGFOELZose+81RTY07KQn2gmcLO/3a24PEPPej7fGl1PoDc1
 JJ3CZU4WsQRixz9dPZ8JDq7FJHs8pwrpc+bBsD0TQC5JVu3RpCX4gsU0=
X-Gm-Gg: Acq92OEDs4NkpbR+8gzhJyul+recwgsbBQB1CtXa0dfEow5irBtHDNP/LFVT4cms0sL
 BrBwzVIXGrZfCAGb9sxKcy7H/nTk5mwbgDd32uuVe03CMo1OmHGE+MNpKuPzUTYGGzFZgvd7U4o
 31VXixSahyAG90IupK9NfFmzqLdzodH24Ky5Vj6MVRpZ09UUo15ciECKC40BpWo+X9cYWCrP1z2
 jManzef8t0JIf87A6UZeefsqiwJPyZkjlKGU2UFy4kKMnHicOuJh3UXG4++AzOEkNB7V/1bvEgy
 ksqlymOSo/NiC32TfqaoePPUDuusYeyyAPdlBDdFbTku5SFEOfPNBRUUyJW7mp9WAWAUJcOcxaF
 dYkVcerv2ZxjEWJhz6A5Hk59RO1N+4lcs0vbm3UhqnBbNnNNf9pVPca7XcmVtAxgv34vvUM9uyx
 xBVgFNmr8Chr2dDY2u
X-Received: by 2002:a05:7022:497:b0:136:4bbe:9523 with SMTP id
 a92af1059eb24-1378e89e454mr37301c88.8.1779945439726; 
 Wed, 27 May 2026 22:17:19 -0700 (PDT)
X-Received: by 2002:a05:7022:497:b0:136:4bbe:9523 with SMTP id
 a92af1059eb24-1378e89e454mr37264c88.8.1779945439181; 
 Wed, 27 May 2026 22:17:19 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:18 -0700 (PDT)
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
Subject: [PATCH 06/10] hw/net: use stub_ss for vhost_net-stub.c
Date: Thu, 28 May 2026 05:16:38 +0000
Message-ID: <20260528051642.115721-7-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfX2h8Bg6XY5dQy
 NnW+bQYvboZUKP/d68wzW4wu4phqqEExr9QIbdjhUO9JWysleWbpbUuiz6mCGQifwBuijzxXxfe
 1Ni6hLqIEVO2xD5nCgw6RK1I12vl3BbnrJjCoitt2VUygjXj86gi0S9TgQwtC3naXLPm/P2Z9y2
 ecyTNjobXyLgLjY0OcmRwRGbe4GrvW3LGUrXA62ZubGsLDaWPil50ROLHpDUJjqR7gFGBrLsOi4
 UwagGE0q37wR/pdieLwHRdPbU6Y/SutyaKoGqsmW45PGL8cC9VmLYSOM/oisEZE+5OG3f3RLB3B
 rIB/sej0g48XX2umoRUvQfSAmazYbF1bJj2GKMQsRQgqJmIpG38EIiBGPUNehFze80QoWIC6rQd
 bdHOIVbLV38do/EcMbKHLGQfNo9EneeBrGb13eg+9pyGl0KnkRLmgbPiuxDJp/4M77Gr/Zt/+gR
 T8q76cybdyfg7rtxsGw==
X-Proofpoint-ORIG-GUID: hm-YhAWGVAfqVdROqK46k_4hivf5haBG
X-Proofpoint-GUID: hm-YhAWGVAfqVdROqK46k_4hivf5haBG
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a17cfe0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rftao9l6T9mWZSOHg_8A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
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

Removes conflict with several targets where some support vhost, and some
don't.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 hw/net/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/net/meson.build b/hw/net/meson.build
index 31025874699..84f142df222 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -48,10 +48,9 @@ system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
 system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
 
 if have_vhost_net
-  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
-else
-  system_ss.add(files('vhost_net-stub.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c'))
 endif
+stub_ss.add(files('vhost_net-stub.c'))
 
 system_ss.add(when: 'CONFIG_ETSEC', if_true: files(
   'fsl_etsec/etsec.c',
-- 
2.47.3


