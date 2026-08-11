Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992CBC5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 18:35:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrJo-0007tX-1C; Tue, 11 Aug 2026 14:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJf-0007W2-C6
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 14:35:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJd-0002ab-Jh
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 14:35:11 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BGO90Y4121161
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 18:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VrfE7e/OO/Q4kyhaEr9Sc92fr3TG41A1jbOfCVVmhYI=; b=DelrVk38tz8OQPkw
 hIN3iyMJZdKKV4ZWDO0CiO/L1/LbBKFv3Sf7C6UY/5BD0eL4wwZh0giVIWDp0y+I
 v3cvo48k2KycEaELWYAYJ+9fKMaHNpq6DZsWgkNJobqvgNZ6ojHCsBmukNDDUg1U
 /W4+CzW9BC27JUxo6PVWHqLdnSsrd72U3+mgM1upUe7jS6r7bQ6DCzihZRFXW8mw
 dOP8xWO+vvq4ANVT4j+RpHHuJD+xeWkhliWxOjsVWXlvNiYuld//00U734LQCUzR
 wRQJFZ4uW+wtoQMGd/oc+eyatJaas7/GpQWb12tpAMIEnlMdynXxFwKyh7gVOQnM
 xZaMDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwette5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 18:34:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d28f8737eso3968831cf.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473298; x=1787078098; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VrfE7e/OO/Q4kyhaEr9Sc92fr3TG41A1jbOfCVVmhYI=;
 b=BTftGAjZvfbz4vKev8AzS/pD41gt6YZhCO/vPG4W0tkmUvuA1uZ5RTpEBn7mlYdWoP
 NsfvkSp+1v2nPnWTMEBablxaAgVLFBdMjzkM/jjkp+ldCTMWcAoy6G4BvrJ7K0EoKctr
 VUCSerOXbIV/xggbquM7x58U28j4VeZinjt93zOpjER4o6G8hRZC6RIhoCVtcq5hWzyH
 fWF0XGIBFwL0IPCK9aUJRGekt1cJZbICL17MEugp/FyGEA2ZHoCXJfYwXnTlZfT5Ys6d
 e9G9CVeRzkK+pbSY7l6N2w+8PTOvp4zcLRlnppvHD6a8v2diD6dck2WzWW3kUVOjm6zu
 pqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473298; x=1787078098;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VrfE7e/OO/Q4kyhaEr9Sc92fr3TG41A1jbOfCVVmhYI=;
 b=qT90KDfkKAfsPmBBxOjnvetxuZHoNBq9wHSzQK2MroAbuwn0rNnc0QxMafUrf8aGEQ
 E4LiMpU3nqONgYN/IK44b+VmdiJXi1vx8Giz2ksQfA73E4+A4tCqxeto5B2aYxJqY6sz
 vt5oNLRuVYxoJxMrBp9grihxsdE84P5XrnULzcQAQSS4V6D9ZOzpaXp8IheC9+BMr4+N
 XUOZfug9SmNbf/3WiigIkKwzkHiXNkjnTsHJWDMs+BWDqKP2tfnOVGE+RyWtGFOxWEmz
 CIxntFYM33go+mhREzwygwlzD1yoyMqSb7yeX1CuF17oe6U3KcI617iVX/pg/6znI9YQ
 QDIQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoDc1Em2V7armUFd5OkSrRZeNt5a0DHsusnzvVqrOzjfl4AR8q5nNlTluVTQa5Hp5I+A3RKw7vn7g==@nongnu.org
X-Gm-Message-State: AOJu0YxZllMREGPc5cK8l2kJvGQtGTqdSO/yAt95XCjJXH+i7SAaFNlV
 8JhEQgVCoTiDotXXlWQI/ORP0AZ+B8/Ro9Vv/B0C9+kpYtGe36TMxYaKBkpa7gW4ZdruQSau5Z2
 TZJL8f/4I5/qrSAEDMNzxFTFOD4NFQpSyM6vp0j0l9gmrJCuZV/JUU68=
X-Gm-Gg: AR+sD11vvotmauk0Q9C+myhuXYyKGmGrLgVO5/dNb+9g7E4VGrF+uMxNogkymMw5A2p
 yvVXsrGdkhMhTK99I5ck14EZnMqPShtSxFS5K92Qm847jJ9oF7nGI5/Xx3ZujiM5okj+AsaK2zI
 gUU4Pyjtp8aAniSTvEAUxg1eOym1/QNm9emHRr2h8aVoBq6PMCEmR6VXl4CB+2CE0wzobpEmz7u
 jq4TxilpIhRz0lpfAVtUitKhcfqoB0rcNayjbSGehUV+cCbXJOGpATWyIaeYKQvJPVjtLh0wV3W
 YHVJwAQ7fi2w+V11GbuuEUQszi9AqLtK9R8ivZvmcwnh8YDI9qWKJFfJ0C9LnrX5s/H5uK5B+BM
 2W9Ee2N+0gBfH8tfEVNFHMtoA5siYwwshThwiFYXM1Q==
X-Received: by 2002:ac8:5d06:0:b0:51c:1ff:2512 with SMTP id
 d75a77b69052e-52d58670614mr49692401cf.33.1786473297920; 
 Tue, 11 Aug 2026 11:34:57 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51c:1ff:2512 with SMTP id
 d75a77b69052e-52d58670614mr49691831cf.33.1786473297432; 
 Tue, 11 Aug 2026 11:34:57 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e675sm344795f8f.23.2026.08.11.11.34.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 6/8] hw/cpu: Rename cpu_exec_unrealizefn() ->
 cpu_common_unrealize()
Date: Tue, 11 Aug 2026 20:34:08 +0200
Message-ID: <20260811183410.22428-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fm_DZY8ubci3gEX-croHGkkWjS98kXz6
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b6b52 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=--_MrfCweEvJdlqdJWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Fm_DZY8ubci3gEX-croHGkkWjS98kXz6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX4Zf/Oab4TS2C
 9kk4pvZaHed5o3171mWt4ucINDdaxF+gKprOnGDPug+6+QFSG5tCvJ9LM+zAzHuGyLhHgFHQsuo
 AG5EUjZsvTZuXuuad8I6MDqiGRQO3zQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX23ehAgzE9WpB
 1I1B+itNJtBwi33ZowGblaVr+vB/X/Y+E65ffsBx+YHoKdcwTZ62mg2smeTKuo7G5OXyJzIk8fV
 aniHF86DnSiRQctQfUg5KkYSqm7Q2tRgEu/sC8UU1MBHm4rwP8FfO4Ljbzd8ThaZxP+uELHCeba
 +Oa4Htz0Z8DtQyUHSOP1lJyGhPWv89K9N18QoMB3jGRYgYurM9pThX5hmsn83/3N+Q+Ft+nZxuA
 LzHBvjKVzWWN5IEn7mjzHosSg3L1jAmEm8Cu/XXSHl7J/k+i8jVcwU1jFVchP19LFy00phAz9jF
 jH+XFtQtfk7865vOVwHenaj2sX5cpH2peqwrI0zPsNsQjJ0RhxmQVDEsSo7N36kTLfYYVfLAIGU
 RZO4nOUuId+n2+JMrbPecm5Xz9QmHmm9ORmHgmfVP5ZA1tHx1dCRc3o8zyTpEKrLM3S0dQCXng0
 PBEUmWcV19YdtQRuOPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
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

Keep cpu_common_*() pattern for publicly exposed common methods
used by target code. Use cpu_exec_*() pattern for internal ones,
mostly to distinct between system / user mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 +++-
 hw/core/cpu-common.c  | 4 ++--
 target/ppc/cpu_init.c | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7b7cf330cde..81af7b9ee1a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1180,7 +1180,9 @@ void qemu_process_cpu_events(CPUState *cpu);
 
 /** cpu_common_realize: CPU DeviceRealize common handler */
 bool cpu_common_realize(CPUState *cpu, Error **errp);
-void cpu_exec_unrealizefn(CPUState *cpu);
+/** cpu_common_realize: CPU DeviceUnrealize common handler */
+void cpu_common_unrealize(CPUState *cpu);
+
 void cpu_exec_reset_hold(CPUState *cpu);
 
 extern const VMStateDescription vmstate_cpu_common;
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 732e32fade2..59cd489b713 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -284,10 +284,10 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 #endif
 
     /* NOTE: latest generic point before the cpu is fully unrealized */
-    cpu_exec_unrealizefn(cpu);
+    cpu_common_unrealize(cpu);
 }
 
-void cpu_exec_unrealizefn(CPUState *cpu)
+void cpu_common_unrealize(CPUState *cpu)
 {
     cpu_vmstate_unregister(cpu);
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b07e9c3ff9c..e3a1075aad3 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6956,7 +6956,7 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
     return;
 
 unrealize:
-    cpu_exec_unrealizefn(cs);
+    cpu_common_unrealize(cs);
 }
 
 static void ppc_cpu_unrealize(DeviceState *dev)
-- 
2.53.0


