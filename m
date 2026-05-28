Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E312CD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST8h-0002R0-Go; Thu, 28 May 2026 01:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7j-0001t9-C7
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7g-0003oY-94
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:39 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKl9If1225042
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=r6Q9uqmouqU
 0KUQoADLBFN1QJBO+6mV0Bq/R1Vjkl9s=; b=GPJEk3EZDZhf4wSsETYxwDY4fiV
 H4ZrlmhvgFOMOYc3Z6p5H0HqeVkDg1gUKVZX38NjyO3jPUHrxyqxKyKG9dSXw4GH
 iCQrYXaqzILxiA8+cUuQwxEjUaiCJcc3mM4vcduSTT3KNzlQGuqaX+1zM/4xg8lB
 iMyqlU0QHjC2b3SB0zYf6X04jOFRSfD8dxd5kmeCucSrRmNppe2y7raaUESmXl2M
 sL7kRlbMCckbYPptA9furejhkc7tc8ob7mz4dCgYFY+L7I2QWS4K2TgdXIIkpajb
 6uWJBXVq77yUYg4sWuiMj3hHyEQpFDq7of0Rlz6NTUhCVRiNWHbHd1h3srw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1se66-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30457ff05b8so5459493eec.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945444; x=1780550244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6Q9uqmouqU0KUQoADLBFN1QJBO+6mV0Bq/R1Vjkl9s=;
 b=cnK61sofQM1CbeW/uicOhcESK6vpR+h5NL/72nRzVcNNH3qCKt/RCQPVGiSXnHH84X
 CK6xfpM7pWNfk0k+M3mkQbNb2l0to4eWrzI+yIueCckCHJs4/wgEMCi3THLPXOy54P4r
 E675dpyJvIDvFClSjvaT/6Zr5DOP2EfofwYN5nWqI6LbeoFab04nfra2TA1XMshNBTXm
 JOgdLyWARM94T7cKr+GOpWCGaJJEOGQX7m5z3Ui401jhqwCq8EoLpM6sNirzN2xJz0Z/
 wPPmAWxBT0pXzOHE1gPFDnRGi9KEZ/UcO2b1v8esusQqYBNIvGVyfR113oR3iUWmJLF4
 uAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945444; x=1780550244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r6Q9uqmouqU0KUQoADLBFN1QJBO+6mV0Bq/R1Vjkl9s=;
 b=X0v8bMBYf8f7VRxFF49qgjkNjLyqDzbedSJLiWXZ7qIGHz8fPlAyf0MgapIK4UN/D8
 08w00tKP888HGen3Q78zJNAR5vlJwndQnLBAHj/Digz5DDzgKgxsuukre9N2yAOI5/rd
 1XgmqUVC7hPfDrnLfQZgWnBZKU6DWw1nsVQa8VAWpif3JAc5Id0kHChJarMdT7d9zkAy
 pmKzTg1X17H6uEQj1+ok5QEPM7UlL93VK5DPJ4v3h9kGYiQXuGNo8tcHLncTzYxonX8g
 r6DdxSJhBy9QRP9dS0ImY1nViEpJnkuebSvDXPlV9YXpZPhphTWu6k4BOHUGYQR8BQpK
 SD2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ocw2fULk5lA0yjyPyXhyUKn8kfNZY68Grh7ycKV+z/ucYYsVNcim3HA0XN7Aw6aHMMFagxGTdZw==@nongnu.org
X-Gm-Message-State: AOJu0YwDudbvCNkVZrUzCyWF7PCEwpk37/RRkxX4L0RDCxNE3RL9+3HB
 BCjtV4tKrKjC+qH6UDZvLtjo/M08c/O6wI12B3WLRF7aWeEFByemVY/lbMh+0X8yonbdWUeE6LA
 f9c4dWEQ37SR4/3+e5wdRU5MxH37rUEh1mNdlpI//sbl0DqjHANFVcvg=
X-Gm-Gg: Acq92OGH0x7jfVwCcfdEYI9aRRicaaor03J1l/wBBZwSxx1AqhGotpVzdnTIYORUf9j
 615V2ipsy9QTHAkawSTlG0kwE/xJ4DGw8dLHDlOK7i8kkD/FGXnJ1whyre1GFx2crOQFAGAsx8y
 x4agR2Ds9PPK5LiKP8d83bq6hlTrghZGpSPRg73R6VlHY2hZQkyCfOj/D0su5zhSn3VUToYsnlR
 rhZtu5JWJ+twHuJp4m+d9dil10+8iuRH/oU6PVdZ1dPeoKDdh7y1+P053t1g2dqlz5nJsgTzLB0
 h7FWKLxtFCiwu9O6UyZBTF53ap0hYqY+s4GWptFiMZ1H5bQRm4/ynmRkaByoDJMRXH/XojyAE+S
 Nd8FuRiyTqSI9iQTv7TGEKWItA0kvDTmNaVaqEZwhfW2SLeHmibgqH0NJs1t9N4GNbbRDpg3KGk
 WgKjwBK8am1H5TmiCI
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id
 5a478bee46e88-3048361afcdmr7602102eec.33.1779945444251; 
 Wed, 27 May 2026 22:17:24 -0700 (PDT)
X-Received: by 2002:a05:7300:8b14:b0:304:8361:a87e with SMTP id
 5a478bee46e88-3048361afcdmr7602055eec.33.1779945443698; 
 Wed, 27 May 2026 22:17:23 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:23 -0700 (PDT)
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
Subject: [PATCH 09/10] target/microblaze: rename helper unaligned_access to
 microblaze_unaligned_access
Date: Thu, 28 May 2026 05:16:41 +0000
Message-ID: <20260528051642.115721-10-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a17cfe5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NETCEBYecQgaRV2tlM8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HvlcLQ2UvGpQ1DHAw_gfr1SrwKJzuk3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfX+5xc/hjoJr1L
 TbRETD0o3CoY2doRPGMebAuTIWkebN9v4xJN9/QzWbmM8wO34ZGN+eHGEwJzmapeNOe+euCZbYn
 49N27j1th75yRfuNO+yOWGyJ6QfTSHpHQLJmgwO5yRU8Ra1TyZXEijSppT7kY2OoJOajX+L+t9H
 iX5wLX5WGU6dvyo4aevbDgJBnCd25D5vuCGtdZHWTnwAZ5NInWxFICJNOI5v3ZdZjjHyZQzi49l
 ZtXnSt4t4gECQt2V7yeD7OBGdDZWWY36KT9V8G5btC4+dykcKddaiaYCtNFuzAfVqAkByOTpMD8
 68debYLiFucslVnC/C0FdSPCTj5JxlGr04uvRSU7qUB7TK/Fla9V+1QjvgEaVZpBeh43ukcZNuS
 Hj15kTVX5xlh2bh0zthLQZepDiRgTWSj9dByyw4sSHYcnKCo7c+kheWWKmUdEMcl7KSedClwj/u
 YOnY1qINRRW+twXexEw==
X-Proofpoint-GUID: HvlcLQ2UvGpQ1DHAw_gfr1SrwKJzuk3D
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

Solves conflict with aarch64 unaligned_access.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/microblaze/helper.c    | 2 +-
 target/microblaze/helper.h    | 2 +-
 target/microblaze/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index f81c4f625b5..3434ea47e8c 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -69,7 +69,7 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
 #ifndef CONFIG_USER_ONLY
 
-void HELPER(unaligned_access)(CPUMBState *env, uint64_t addr)
+void HELPER(microblaze_unaligned_access)(CPUMBState *env, uint64_t addr)
 {
     mb_unaligned_access_internal(env_cpu(env), addr, GETPC());
 }
diff --git a/target/microblaze/helper.h b/target/microblaze/helper.h
index 01eba592b26..1429c1727ef 100644
--- a/target/microblaze/helper.h
+++ b/target/microblaze/helper.h
@@ -27,7 +27,7 @@ DEF_HELPER_FLAGS_3(put, TCG_CALL_NO_RWG, void, i32, i32, i32)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_FLAGS_3(mmu_read, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(mmu_write, TCG_CALL_NO_RWG, void, env, i32, i32, i32)
-DEF_HELPER_FLAGS_2(unaligned_access, TCG_CALL_NO_WG, noreturn, env, i64)
+DEF_HELPER_FLAGS_2(microblaze_unaligned_access, TCG_CALL_NO_WG, noreturn, env, i64)
 DEF_HELPER_FLAGS_2(lbuea, TCG_CALL_NO_WG, i32, env, i64)
 DEF_HELPER_FLAGS_2(lhuea_be, TCG_CALL_NO_WG, i32, env, i64)
 DEF_HELPER_FLAGS_2(lhuea_le, TCG_CALL_NO_WG, i32, env, i64)
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 74b5420ed24..a93f14d6e09 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -692,7 +692,7 @@ static void gen_alignment_check_ea(DisasContext *dc, TCGv_i64 ea, int rb,
         record_unaligned_ess(dc, rd, size, store);
 
         tcg_gen_brcondi_i64(TCG_COND_TSTEQ, ea, (1 << size) - 1, over);
-        gen_helper_unaligned_access(tcg_env, ea);
+        gen_helper_microblaze_unaligned_access(tcg_env, ea);
         gen_set_label(over);
     }
 }
-- 
2.47.3


