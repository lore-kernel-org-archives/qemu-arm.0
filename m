Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A84C5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:17:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuZzL-00024m-Po; Thu, 13 Aug 2026 14:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzJ-00024P-UG
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzI-00025H-6K
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:09 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DGUtEM2076779
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ii+NakEKXLwaKt59HrJUbtrSCVrxMYJtk4E5DyQdSG8=; b=cKXJ/dGITmTYU76g
 QK6H2QsSx0tIKzWS+1UbfDX6ErVmzta/AHyXVk2GTefp6qPAKcukvlXoAaFIGXfz
 56W6fpGRKhgWlpm9QXQD//3F6BagJWRX/5fqg30tQNR874qolvR6X4eV3ow0+RZw
 TG6dj0PEnIZZv3JYew8/2laMYaNPI9bU7Xbsag2+XwzEC088taqtc41ouFFZ0PPU
 u8N7Ut1KzEnlMgasU/Q+dptng8KYLSFGkTxbdyq9+jWt0ib2oI/lsrmGiwo1VHK6
 ryRSHnPeNx9x3jPbB+oHg2amgacWrfD0jvfhfvTO8YTnQoAao3J4YrJMD9eUDeu0
 6BJpLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy0f45-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d33c89a29so3178341cf.1
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645026; x=1787249826; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ii+NakEKXLwaKt59HrJUbtrSCVrxMYJtk4E5DyQdSG8=;
 b=Xj0yDf8GEFtQda6+ZVR9kuj5Z3wQP0pEF8hzzwVA5tM8odpCgvLLrhQocmOO5r6ICs
 JafYkqzPu8Pa7j65uFNsFwllItTiJNu8BnTtomt40lfXX3YNDXprc22nBqnOqXanjvGn
 csWowzUQCfwsAB2IO6OwZ6rzTNF4I5XI74IP8IPXlG8ju7y/0cS/lUZeTlxk7guiDS14
 cj9CTbRdPoyqXkcaCQWTSl2hCdWjsBcORjILRt5UFcJn7zAxtN01M9c2KkntriG2F0m1
 f95R45AW9lP91hDfWmvxw6/Ns5JKzUsHZxbQdrtykyXjlBeiDLROW/TjuxzqJBGCNlOW
 fOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645026; x=1787249826;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ii+NakEKXLwaKt59HrJUbtrSCVrxMYJtk4E5DyQdSG8=;
 b=f3cTuz78tfRPi1UfkfALyZihhwNcnmkEUHyIxs2ZR8B9Z9riaxKQXAIzv7xZiElylS
 /w/wvvvbqVL8ANbBpdYfNFWF7h4uBUDd/5Q9ETkH7ZMgFjtr8fgSJZw7bfIGgZCKKcDQ
 Euvc9UJzu2l3q1z9epzxWLgSkgFUggDom6c7HmcHIGaUKyPwY0TK7OaIg0EdcnK1YHf6
 IAzY2MbK7+kR3EdjTOYNLc9pDu3C5nglhvaPMMWn8Q5qznNIISdLK5rTTnu7J+evkbt6
 sCilG7bo3AIdXKLs8hbF68fCMJmv+xcFgl7msihcLYM25aPtnL1g0i7G4NCqdxp+ZwG0
 pbkg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoDA5NWmTR+Uog2oTV026+69UQp9kixartVQYJxuJ65941uUxgD7CyOOznisABgzpUgVKXh8XOwEw==@nongnu.org
X-Gm-Message-State: AOJu0YyDBTaWkdIZYjVVgY1Cncy2gwYez6wRWn+HvzpzEDbef06hsSju
 zsi/lq2Y+MKK/zMmBtOUzRXU+oMu01XCUHr0tFWH9XV1Vx/r9vBsrQQKCl9jYEYCGrI6B2/TEOo
 Lt2+iVUd4zqE/adefHhW+c2HiHalR2iSMQalF9L9ImqS2+BChqTVXi+U=
X-Gm-Gg: AR+sD11/3KSAWbewrgHEr/FkAjOKecWNCbG8WZRQGiJn5M1Tr6ru8HHPizw/pfWz0vw
 Mj1vuYtpDCBfz8qJM9exZY8fgDivH1M/9SF50f/OW69OCZAE3/e/Zdib0/eGg+X6utvGNVBndMi
 bFfu/yiPEqcsN9RX8AhKk+WL3q1Of1Ql3mLHWcAaAqMDwRIpI+4nKu51r6SinOs3wjdVacEia5S
 UOWHmO0gUz698I3WZaCRKwf7yHLsUhZkXVGWlhgpi3HzLRGwMiR4nNQgPbiXU1PjDbkEAO8G2b6
 4BL/e0qD8RBKarLiozDP7kMio/BfjRmmmNXPBep6QKBXVfrtXpMnBAKJgGLkCMb4TaZAgHFcQXX
 rK32cGu+qpA5/iC/MWYHnXpn46zIMuWeFxFGJBoqq0g==
X-Received: by 2002:ac8:574a:0:b0:516:d699:a99b with SMTP id
 d75a77b69052e-52d73da2a13mr76547741cf.40.1786645026176; 
 Thu, 13 Aug 2026 11:17:06 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:516:d699:a99b with SMTP id
 d75a77b69052e-52d73da2a13mr76547071cf.40.1786645025661; 
 Thu, 13 Aug 2026 11:17:05 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c6115sm1270516f8f.32.2026.08.13.11.17.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:05 -0700 (PDT)
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
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH 03/16] cpus: Rename cpu_stop_current() -> qemu_cpu_stop_self()
Date: Thu, 13 Aug 2026 20:16:26 +0200
Message-ID: <20260813181640.6537-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX1dFsQpCixH5G
 1pfVW2xEvr54Pz5FOB5VNaMiv8xAT/h+w8aRo/t+zpb8uMuhvtrOCJmVzf2VUmsWWlJko0PZibs
 l0WOdvTrtImRDCZ1fIRR8E8MvqTsaNNATL4Ky0UrZP1uODyAAUnsuiszFS9OnEAdpPPnXtnLNjF
 BU6tVD6RNiKJu/DsfT/EbK1q/5L+CYpy9565pAnINM4Vz0NJohLZzXWypvTJH2z7P8kLMIXR1hl
 w0bOGCUWrDm7G3jcoK+j0m1tg6UFPRCQIKmjJaiOF9btf6UPnnST1XlO0xR5/TIq+zJuoF6Bovp
 QqJBFdSkdm/0SgSpGBruG8sErLK3YlyZuh71hjl1yzzbzYyO9P9+N/DTYB2mwgzNN0X8ZMdmXAR
 ro6QnvQE48u0oIE60pFrYNNDEFhdpigqtdKn7KjWugNrsUjkVnn1PHXZXbLfLtMDEk+8Z3ExGuv
 Uo3DQxm4ywIu6cikyFg==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e0a22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ao8Q1kDP7eBHT8PKhbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4-fg2sStYNdF2yKMigZa8DK4vv9YCkLy
X-Proofpoint-GUID: 4-fg2sStYNdF2yKMigZa8DK4vv9YCkLy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX9iKiDGwYloB0
 0T0Pg0+hf9JiNZJUhEstS/Ly5+F+Oyjjdq5qwPuh5RCZgmnsB0sF0k92vFtU7chaJPb8LpUa5Au
 SzDkKqLr7SXR6l1ronI0Q4BK0PGre3A=
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

There is a single method with ending with _current() suffix.
Align with qemu_cpu_kick_self() and pthread conventions by
renaming cpu_stop_current() -> qemu_cpu_stop_self() for
consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/system/cpus.h | 8 +++++++-
 hw/ppc/spapr_rtas.c   | 2 +-
 system/cpus.c         | 2 +-
 system/runstate.c     | 6 +++---
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/system/cpus.h b/include/system/cpus.h
index ade13e068eb..2365c7c4597 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -28,7 +28,13 @@ bool qemu_in_vcpu_thread(void);
 void qemu_init_cpu_loop(void);
 void resume_all_vcpus(void);
 void pause_all_vcpus(void);
-void cpu_stop_current(void);
+
+/**
+ * qemu_cpu_stop_self - Stop execution of the current vCPU
+ *
+ * Note: No effect if not executing within a vCPU thread.
+ */
+void qemu_cpu_stop_self(void);
 
 /**
  * qemu_cpu_kick_self - Force vCPU to re-enter to its inner main loop
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 328fc27c400..80cd4246af8 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -93,7 +93,7 @@ static void rtas_power_off(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return;
     }
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-    cpu_stop_current();
+    qemu_cpu_stop_self();
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
 }
 
diff --git a/system/cpus.c b/system/cpus.c
index f37e215c586..1a6fd286a81 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -674,7 +674,7 @@ void qemu_init_vcpu(CPUState *cpu)
     }
 }
 
-void cpu_stop_current(void)
+void qemu_cpu_stop_self(void)
 {
     if (current_cpu) {
         current_cpu->stop = true;
diff --git a/system/runstate.c b/system/runstate.c
index d3e64d2b625..1302fea9ccd 100644
--- a/system/runstate.c
+++ b/system/runstate.c
@@ -472,7 +472,7 @@ int vm_stop(RunState state)
          * FIXME: should not return to device code in case
          * vm_stop() has been requested.
          */
-        cpu_stop_current();
+        qemu_cpu_stop_self();
         return 0;
     }
 
@@ -900,7 +900,7 @@ void qemu_system_reset_request(ShutdownCause reason)
     } else {
         reset_requested = reason;
     }
-    cpu_stop_current();
+    qemu_cpu_stop_self();
     qemu_notify_event();
 }
 
@@ -918,7 +918,7 @@ void qemu_system_suspend_request(void)
         return;
     }
     suspend_requested = 1;
-    cpu_stop_current();
+    qemu_cpu_stop_self();
     qemu_notify_event();
 }
 
-- 
2.53.0


