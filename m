Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46106C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9BJ-0000Bf-RR; Thu, 20 Aug 2026 16:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9BH-0008Vb-Nv
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:16:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9BE-0002zy-AR
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:16:07 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7reO251246
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 26i3IaPZ18XqbWQYHKnxx6cxDLlxhS3q+ou9xT+imks=; b=fWLKLgGNFoiJyvJ+
 ctEkGo+3VRgNn3TIo5x0nVMybsK+uwn7IxSza4SJato7FmYZp6tperhdDr0B1WRT
 PRHO1OLhYKkatCdWi3vdVPlpH4BsmzM4d4uPEb4Y+I1sUpsSN20CGxJrX4DfM2tP
 8Z1rCGw3H4YYGvs/vZ/vB4krb3vb8mgSctuKGDhqhMyAelBdqOI4sXygxHLl+Ww4
 zufk0yPJfoKOc5jDrEF3ZsAkWdYhlZQ/F/6BTAaGjrSAUsnuAHtUNP7RXlfoREZc
 QbZX++AhOtvkIrSCQqBq389+T9Hsp12lGo/tVPJjEU5W8S3GzEySiCUsNjq2KlI4
 7XFGQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49bepv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso3970741cf.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256952; x=1787861752; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=26i3IaPZ18XqbWQYHKnxx6cxDLlxhS3q+ou9xT+imks=;
 b=h+PJENOf0GdfAbeUxUmXW8brUNKKHSis0HLloOSKaOQ+6uQ4wQfl+CWooGNEIK7R0u
 uVB9LLkbVquId2DPOhKT/j1ydcwlzgIrMzXT0XIxCa7umG3PVatBYh5p1J/7N08NW6Ak
 mRWxJc6ScXnDK9Eo21+NRmzW9eT4jlmhLf+SNyvCAGuhtqDFOHnCWUxuRYs0+/Irsvs4
 bEcZQez7zYuWD7ulww69EdCa7H+B7PnzET4Y+cviFi/ghllZqqiOOqX6bxRrNeoxp4b3
 +B/XZKT8cQBjsJkuCiYl3tn2nXGRd/qzr9lfjmLegeROkT7cYd4eZEPGPI+eC6HXn9bs
 YZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256952; x=1787861752;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=26i3IaPZ18XqbWQYHKnxx6cxDLlxhS3q+ou9xT+imks=;
 b=Ub9tgraJ4rXHdy6dQaSO6O0oOzeNi45CB5bmgD235oZqmriQYjWng6ovZ0Snm2jCWz
 wfGQVKLstcfo+AwICsJGfEVtwyndXn99FSdonZF7YzxOdNmyO8dGx/idFhLzGQ/Z/JdX
 DLhno/ixzzLiVH791UC2xMJMg6GzNXeMIKkpuU1e3ZFO4Bnjm/i2wSnVDpRk7tHgF3Jj
 +9mqeginb4pWdTod6K934B7vtIVNXnOksYvVcKZXwQAaseM/nQBQQy0QdQCsCSf4Cq3R
 VM/bLrYbyDdC/2i8rvTu/+1b4JFmb5Rxjdh3zdNxREXDIo6vvU4N15VOLKtSbZvvIUoK
 LZWg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqoLZnQ+QUsTli/uIrqImuozp+vifHWrsx62lLY0BkPRMRYFU84H76pv+XdRauzWVkzoA45BMEVsw==@nongnu.org
X-Gm-Message-State: AOJu0YxR+2I9WqODuL47+p//N/ezFbQz1wlcYHfJ0lEVlPlJHUri4B6a
 6u9bg0MtEN1PZ9LPAKz+3NT4NoyGmXgcTYJ9zm0s6pSbrAc8awvTXXLqUEN0jfbe5cDikfju7rz
 OKjDR5HUxfkYECRFtAJ2GSHCaBJH92UBTuKqSecDu0rlhXaGVYbLGoOY=
X-Gm-Gg: AR+sD130tKO/O0tHGKhI1Pt+H65N5GPTUe4CxHLFRzytXDhmKZ/9TBA7SfUAHQxXIpr
 4QmH5xbRgAgA0IM3FcPOadcU6rIppFCPXT2PZsoh+WDosML8Ri6hTlugkDW9s7TQBht17v04hfM
 /CqHTQuUXt1kEFZ6ppMUUqZ05upAx7v8Hno0VCtTz8HlElh+NfiJEhekCqnQZJJuKy6cx5TBKjs
 Qpg7TW537J/Cas0I2sjqYiAxBaNJWWDGG3UzyATQWbcT1ekAAuQtmz7rw6U6djBVcq4Qjp5q1L/
 u+iCquWd3hG9eFBZ+24JHtkJgYKkbGOFUP4BhtJQnAph2ytZTOv1k6Av9TaIlM5GWYFTTcpJrqV
 RmixvbSo1odpyQOtGNFj9AKzo8xSZb1Az91wMsABpGA==
X-Received: by 2002:a05:622a:2516:b0:51c:2685:2964 with SMTP id
 d75a77b69052e-52df5a3491amr10590231cf.43.1787256951513; 
 Thu, 20 Aug 2026 13:15:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:2685:2964 with SMTP id
 d75a77b69052e-52df5a3491amr10588591cf.43.1787256950254; 
 Thu, 20 Aug 2026 13:15:50 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441753sm16957417f8f.5.2026.08.20.13.15.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 14/15] linux-user: Replace env_cpu_const() by generic
 env_cpu() equivalent
Date: Thu, 20 Aug 2026 22:13:54 +0200
Message-ID: <20260820201356.29775-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX2WB9hu808WIA
 VWDvchSQufhaPG7Q+OyttCt5Q2GW9E2vru+8x/LPf0Im3Wng9WNJGng9JYofj8aQjPXkbKwNoO7
 LObhnwX/ba1L9QBhrC0ETsu8g+j9LPQ=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a876078 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OXD_3DllCHOcwck3pM8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nAczSJlKEuyMDHuNdmEDadI_TeouDRDs
X-Proofpoint-GUID: nAczSJlKEuyMDHuNdmEDadI_TeouDRDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX9zrKJ5xfXGjH
 3AoljE2fAi2xLhw8yquQgP1AMIwIlSP5gTayHOJJgCE+lH900gft7TvatFm7bZRxlZrM5kaFWlR
 w2SOFTRQ2JHrHDd/C4+hyV0SZrSZCCYUvJVzf3CbGxc50fMd82Ae4TpazWpFJTJCf0KjSCJR0XG
 MNunquSBGawzNyzPQKris866xLjgHFV1Ov0JP5xmCBU5xrOojJGb5gXkTHSLYBBjFDFqzs71pap
 ueeWghkGAHoJVCV2Jj8TGQJNxsVOWmRHXjTzodXdS0y41YKwXmWkIUsjhIxszQEN6qDMQFy/0I7
 8k0EAGFTIwxfkciYnqCi5XDSg0JSQ3AM07cianyAhvGOAm48ZafjN876VeWSubf7s6sbcePScmE
 Zzcpvhy0dBjLWsm6BAdyOdcojVAfWUvSf6tbGEUnz2+WgMiYEmIBmNHNBkUteee71oUQSAmM/KJ
 RIH1qLWJ4shuH8h0RTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Use the generic env_cpu() macro introduced in the previous
commit and remove the few env_cpu_const() uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/exec/cpu-common.h   | 1 -
 linux-user/elfload.c        | 2 +-
 linux-user/i386/elfload.c   | 2 +-
 linux-user/x86_64/elfload.c | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index bffef677607..d67d008236f 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -102,6 +102,5 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
                 (CPUState *)((void *)env - sizeof(CPUState)), \
             const CPUArchState: \
                 (const CPUState *)((const void *)env - sizeof(CPUState)))
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


