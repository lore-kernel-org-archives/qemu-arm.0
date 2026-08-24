Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8469DC61CE2
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySgu-0001q9-5X; Mon, 24 Aug 2026 07:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgs-0001oG-S8
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:18:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgq-0005DB-Cf
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:18:10 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OA3EnN1630134
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VTnZDkxqxcWE+Uhz4CNPQNK9aE/+Gp16fw+HxNLxbPo=; b=UXpVjzX1Ll1hWj17
 GvmqP23IfqVLS0if6NvrMUQeIbLhMwzGONhapTLuyr1TrER5J1+CfuQtbRlwHXz6
 sfzka/i9dDiI3bfXFsWDbMULmtRXBoXw1dp7amlk6KxbGwKfTv7TUnch0aH1bb9W
 w/0RVtqY58hfjWynXMuyjFOLtmQPR+hzlGElHM7kf8W0WEW47j3gLHgrS6R58pRc
 FGhixC923yjfuWS5mAXan2QBUijXbjpXzr0MhBWMywwBfLe6gsMhy70O688c7l91
 VFtY+LNqEEC0tI5aOvMet0MlQSdjol3lnPZpBh7wnt7zqcMrIlzkYdsEfdEItEcE
 6Mb5dg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78801-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:17:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d9cef8d15so63107231cf.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570278; x=1788175078; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VTnZDkxqxcWE+Uhz4CNPQNK9aE/+Gp16fw+HxNLxbPo=;
 b=CJWu0sHheVtbU4JqLrqkDRdQwGwPlFMpGFBLHxZke5HjVK4n3442VJ5KlhEN9LS85T
 mXh2WAsEbTQoq+joSaujqP9YurYp6n388sTJRyQf/TQr7oXwArIiSJHUhaxVb1H5FXyk
 7kAMpCP1pC+xsm/mwzdVqod12ALp/gscuO60Ct6cf1GTL0wPq0wcMwbs/+BgicxGOWvk
 TiQL7qS2BK7nMJ8kUQpe/8CU3LGKhFjusLqRRO+O39hcJi9HiEzEoL3SMtIX6b/2VfPC
 sAtwefrfTtd/EA95JZqZe1kAORF0V+3Hmv/6dcxxfZlGiqj1z1tN6Xbe3tEAbz/sGXYV
 Pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570278; x=1788175078;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VTnZDkxqxcWE+Uhz4CNPQNK9aE/+Gp16fw+HxNLxbPo=;
 b=BoQa62P+4J7hqS1SpGOGzaeGHg5zDGcGJ3i97PWybKz/wg3QBFFPQt+9wbbqp8JFrv
 ofC82nehsV8m6Yl3l1wvQehe8my0t7vrg8WCg/1evU/ih8JKmQUMY0EuqwXrvIHeH1SO
 GNBogRxnx8ws6WvD5fE/p+KeaJcuB5NB/fuTd7uJ/owdOONWCwre95GFw/1N3ZPSRX3J
 fQ9VF2636/WkpPdO37w8HxN/qxSQAAoe/bu0vpec2iPNUL8Bodv1F1oTLw00cprDJWFe
 M3TCnHl+OUJPuYTlMukbN43TN96o+ALyNEbZ+u+YmQWO9hlNiwVjF4QlbvQ2wyXVlg3w
 KO0w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpnnEDOtkghmKhhpcACxXcNb8rNItLaKgXCdmGviF0O/Z5xO3AtM45t5uHvEdYMWkD2vgjM5rwJkw==@nongnu.org
X-Gm-Message-State: AFuF++n5T/T35AQ8+eO9AmBUiOhV7rZhf7xqUU+Rn5mVtQJo7jG1JSiU
 wWAyFM2+ZQ4SsRiZfkp096HsS1u67jogtZhta03RsxBwHuaBwk+P4g+NZH3/tPJNP1bpa+s4pKq
 CPvfN0qO/72DB/x6PbOmBvwB1tovtcObU8X/WMPdYeKZvgG+/UylghLs=
X-Gm-Gg: AR+sD12L+VPZ2EQNoIOrMYY0cKOY4H0XMDN+gZwmqWl2yKKW+XuUGmmOkeldJxj4ZDC
 sJHcIZSztezNnXytYKZ7Ne0MwCZMxKcTD7n1lW9reZ+GwNquY1rbKmnj7uUrkPvAkP4FJuG9XhW
 1XMvpmmIZnz5Pp2Dnea/ybDNNBNny594bDAczot1S8znuYLTdXPyUQB0ES63FNx3qLu6IIdfJJP
 4OPKrCI5yWZ4vRJ/eD1lfRTElAk/28cKC2//SQorxmVqAxYRLQvb9kxrSO8ZcfY04YlxFt4goLM
 xUbBhbL02TsqRsNQmsOOmThCStkPmlGMEt2tz4b9mlSfK14HdHytMUPDVdTN1AhTSRlbitoX2aI
 CdNlCj3yqymsfg+u2hsmiGxu3PTP3+hrARs7yadjEqHCr6W6clA==
X-Received: by 2002:a05:622a:5812:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52e09cabc0fmr185061901cf.28.1787570278298; 
 Mon, 24 Aug 2026 04:17:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52e09cabc0fmr185061491cf.28.1787570277889; 
 Mon, 24 Aug 2026 04:17:57 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496296b8bsm1120780666b.16.2026.08.24.04.17.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 04/20] linux-user: Replace env_cpu_const() by generic
 env_cpu() equivalent
Date: Mon, 24 Aug 2026 13:16:53 +0200
Message-ID: <20260824111711.26297-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c2867 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX7XDuqNh6lNPZ
 riDmNNgTSTgndH3gpmvlSPkNFRMiTNvmJRvsNB09gYgn700S20f2MhOLOqTsVB70FH20tuCkon0
 f30WkROmiSDuMDGXfooB7lplVHyOap8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX9USN4R+4M4CU
 V6ICdZMtoP2N+KBoXX+270PAuuT5Mj84CvDVGvFoCTLJwqLFVXpztIJ5ExjPzLKKmOkG6KCy/rU
 ok2z+i2IcRKW5MtSc5mBfq5WabwzlsvORdouBAVD2XpYN8ycibj6LK9w+0rZMZyzsUWA2qLorFy
 to2I+xxHA8IC9wZBO2GWzhiz5j3eHStqprKWbzwLoNQQDXnHt2BYL5zhTgAuy14bh1vqJsW7t9T
 78Ayy9SSX01/4/FrFwiz/+h8p2qeUjSJwy99+4oSRq6oZMmqqyMubKGzVTLmJdoXLlZLyt1qZEn
 6tm9PDlYuq4xaFShlXopbjvlqkW1qAtHz2GajCKl+TYanrysYvkDa2l4sL1gFuEArolPBZUUqC4
 7tTUVxm0x5ooTdt6O292MIp4Q/wCenuQY12AUkeL7q8lbp7esmt/O+8O4qqWCqN9qU+x7wpRbfv
 KIYhOrv5oyf3FMIhmmg==
X-Proofpoint-ORIG-GUID: 6HgPg6COwgKX7eRciL7o612HivZPC9LH
X-Proofpoint-GUID: 6HgPg6COwgKX7eRciL7o612HivZPC9LH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_CSS_A=0.1 autolearn=ham autolearn_force=no
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

Use the generic env_cpu() macro introduced in the previous
commit and remove the few env_cpu_const() uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h   | 1 -
 linux-user/elfload.c        | 2 +-
 linux-user/i386/elfload.c   | 2 +-
 linux-user/x86_64/elfload.c | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 60997628cc6..c14362f780d 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -102,6 +102,5 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
                 (CPUState *)((void *)(env) - sizeof(CPUState)), \
             const CPUArchState *: \
                 (const CPUState *)((const void *)(env) - sizeof(CPUState)))
-#define env_cpu_const(cpu) env_cpu(cpu)
 
 #endif /* CPU_COMMON_H */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 88508deac50..c4bdaa146a7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2128,7 +2128,7 @@ static int wmr_write_region(void *opaque, vaddr start,
 #endif
 static int elf_core_dump(int signr, const CPUArchState *env)
 {
-    const CPUState *cpu = env_cpu_const(env);
+    const CPUState *cpu = env_cpu(env);
     const TaskState *ts = (const TaskState *)get_task_state((CPUState *)cpu);
     struct rlimit dumpsize;
     CountAndSizeRegions css;
diff --git a/linux-user/i386/elfload.c b/linux-user/i386/elfload.c
index 26b12001a3e..2e10f38a412 100644
--- a/linux-user/i386/elfload.c
+++ b/linux-user/i386/elfload.c
@@ -38,7 +38,7 @@ void elf_core_copy_regs(target_elf_gregset_t *r, const CPUX86State *env)
     r->pt.es = tswapal(env->segs[R_ES].selector & 0xffff);
     r->pt.fs = tswapal(env->segs[R_FS].selector & 0xffff);
     r->pt.gs = tswapal(env->segs[R_GS].selector & 0xffff);
-    r->pt.orig_ax = tswapal(get_task_state(env_cpu_const(env))->orig_ax);
+    r->pt.orig_ax = tswapal(get_task_state(env_cpu(env))->orig_ax);
     r->pt.ip = tswapal(env->eip);
     r->pt.cs = tswapal(env->segs[R_CS].selector & 0xffff);
     r->pt.flags = tswapal(env->eflags);
diff --git a/linux-user/x86_64/elfload.c b/linux-user/x86_64/elfload.c
index 49a6f6180e0..121a8167acc 100644
--- a/linux-user/x86_64/elfload.c
+++ b/linux-user/x86_64/elfload.c
@@ -59,7 +59,7 @@ void elf_core_copy_regs(target_elf_gregset_t *r, const CPUX86State *env)
     r->pt.dx = tswapal(env->regs[R_EDX]);
     r->pt.si = tswapal(env->regs[R_ESI]);
     r->pt.di = tswapal(env->regs[R_EDI]);
-    r->pt.orig_ax = tswapal(get_task_state(env_cpu_const(env))->orig_ax);
+    r->pt.orig_ax = tswapal(get_task_state(env_cpu(env))->orig_ax);
     r->pt.ip = tswapal(env->eip);
     r->pt.cs = tswapal(env->segs[R_CS].selector & 0xffff);
     r->pt.flags = tswapal(env->eflags);
-- 
2.53.0


