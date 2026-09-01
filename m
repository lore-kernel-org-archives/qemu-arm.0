Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FFBC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LBw-0001kr-RP; Tue, 01 Sep 2026 05:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBu-0001VT-U9
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBr-0007em-HJ
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:06 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179GlT2561935
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hsq1JIRdh79Vu7x6NM4uFXlT94qjGqXG7DyO7tUPxUc=; b=jaQLUly1+OAr8t7G
 b1rPAi2J/Je1EvoZrulXXS/GBmJIODY+yyxOJPN/CpWP9ECsdARi/plTzkGs3vRT
 ModHbd5mkRwbrbHoF5NSQFqf4rYLY6F2egJ5wRUDZGK5kLR5OHHgJJGob4wrNndA
 /Nz6z7U/qkJK8ctFko7EtvfFw9czn1utracPbGw7qpwofMyxcu0VKDCUCg6+7ZiP
 a7fFWq2923O3+WeEtSf2RCCLQBk5SxzBcuF6A+wGaCmK9+ZOhlnicOeeeozg3uiT
 fXQk+GbD2jP7XjYPHU7nhpOO9o/CxitEnd9wcpvmI1ySkFYYTBMJeuInzVJdJKwq
 CqzTxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3bqqj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-930edb4362dso633134485a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256441; x=1788861241; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hsq1JIRdh79Vu7x6NM4uFXlT94qjGqXG7DyO7tUPxUc=;
 b=gL9geS80mZGT7AZCLnsZMxRMHwji17SoLnrjLyq9yiZjklcGJ7zspD941GqAzr04Rc
 tE6CfzE9lZpygHiG20kVMiL+lUSLQ5TD7+E/sZWnxebqDiWvq1jYRnY971r+OgpZaitd
 mTuvcoYnb9Hv0QWPHgAWxLMyuzS6S6cNhtGSHI6fBeaU+i8Z5kc6FvaAiEuzy9PVmo6m
 cv7X0uvFZKIJ28WLzdTiS2HcOsE871sAtclFvgCz3CKh+UPkIf3N/AX+bYs4r7e6H6Eq
 koBjGLciTnE7Ge8dmDU8sAXFtth4Xep13U27DM9k+T0rXiu88VcZQ1xVydXfq/ReFMsa
 UNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256441; x=1788861241;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hsq1JIRdh79Vu7x6NM4uFXlT94qjGqXG7DyO7tUPxUc=;
 b=INKAy554gYkUI5mFkfhUR/IBDNKsS7GRIAxFpRxvJU7WfB0e1Utd1e8YTRJHo8u4Qr
 Xpd2JAxiO5QpgaWwyZ7CvPyqVpyQNAoqobAJletaDFxuS1SJZPBdPX5RYMj4gEo9MYeo
 K9Txxz1Iu6wCkFgGPVHnFUCk6gkuWg5lBSKEQRtZjMZF+DH1Hdgn2EocBn++ZdVYlNpI
 TIu+XMHD1g1mxEM2VQ4GsL7zBUhxTvif7jiMBzy8gy0lXvRhpKA4IbcJ/fUMWCTZZmg3
 a7P220i2itxUK5yR+YaCbJKd1FJGEGHi4D+qma3rRCvsv+LmqTMGZemLAA9ngo4TUJdO
 C/7w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqAt9lkeMVfvD7FDsslTftPzTey5d0dalkV69bXIblXtgCooRt9g8t0DyuuzyVu5iibxz+ZsMYTFg==@nongnu.org
X-Gm-Message-State: AFuF++kFtA44MiPIWAgxKjSwBdpyefV9hSHKxl/Cm7kK438Z9s953zWM
 HHQt78uzITFe+3tMmFGVMjokWCDHxtMiPnFOuqzAliNhbd163g9mjR9dIzvnWhCg1iC/+vompQv
 ZanmZcxRHvzzDiAkRhFZqZIdf0bYQjOBN6y6EdbMb59kCFJnLLPdjRZo=
X-Gm-Gg: AR+sD11xH5pNZt+eisyiFr6kjOREL5BHzwJSDb1mBsnNcoSB7C+EbLIHV9dVBzBAayW
 P/0k2Ju5gZ4SenYE8DGHwz6Z94scjllki28CGBdiA40nOkqiFSYHfaZEQPB5Y7boNZqTGlyyFwH
 tHFYMxoxWhnpXU+Z07au2FYeHeorMeuwLrxDvNAU+jRP05NFpzhAO4ojeg0T+xFrlAlceTtTowG
 lqqIIidGeDPpBf3kDmOvmCcA/WurA209Oeau/+sgOSytQn4ZkI7IH7BMTjUJy9yDOj2hdZnn4fC
 9d8Pu5LRUyoFQcr7mrxVEZzDIVrneQpG4EzK+wYUH/YIcVOPTRlouH3mtT85GjASHCZG5sYdT15
 D4Q8eHPgeVNGilvbsu+IPj99jGSqv0Ea/M5j0etJR
X-Received: by 2002:a05:620a:8086:b0:939:16f6:4d01 with SMTP id
 af79cd13be357-93916f64e85mr3521140985a.21.1788256441031; 
 Tue, 01 Sep 2026 02:54:01 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:939:16f6:4d01 with SMTP id
 af79cd13be357-93916f64e85mr3521135685a.21.1788256440377; 
 Tue, 01 Sep 2026 02:54:00 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b927d462dsm162657125e9.0.2026.09.01.02.53.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Song Gao <17746591750@163.com>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v5 12/21] target/loongarch: Constify CPULoongArchState for
 various tlb_*() getters
Date: Tue,  1 Sep 2026 11:52:18 +0200
Message-ID: <20260901095229.72018-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX5/oDK2Q33aq1
 yQk3ana/EGj/HpYltm4mF2cLR7hCeJjmGzitjvTBVyJ64a0ZjXF8MSKWerMdJwVUgdwygWg/wll
 4cY/zMwR+KcHMdY5XjgwOiSxhNeH2NIfFygTMmNoS+LUo/eVRYEyq15mK0dA+DAHKpLnH55mw/P
 e+iUNydAtMYWYvDrCGnH7O3tsxqkbUf5mnv9UX0zoMuQVqIvJjO5iflm8zn4u512fflKRrvUWPS
 ThEIisnrHLTwdJTIE/MoRnHZZE6qy6tC0cY8zyQdd5jepYZthVcmAGOpdLDbw981yp7raV1Po9t
 JpZ0JxXpAqQtOPJ97JS44hwJ19/fdPgOfggVtP1ufQHy/fcu2f7RMtpvKNgnk0sCRG2hkvVfs9s
 ynlEsgwrPAy+Hckp6KhBIb8RAx55Hec2KJFu/cQAbENh052ZGzt5S+dsr7/VJuDWRd1+EFOv4DB
 wagy5KTnT/wUqfGZa6w==
X-Proofpoint-GUID: I9eTp3mq7hslpBdFXIiEkNMMUC2gNnXt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX1B7zLOHJuSo4
 SdjMp3mUSf2VJmGI+hQHRZbEaPCEqqSIgkuHH+elqFNjgpxx45LrYGB7tUuFt3ptLaafT91rv46
 dTF/xUA3oSan7YeCeQ+0UtA3HeAwNgs=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96a0ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XHwqZfJ-JXiraPowwWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: I9eTp3mq7hslpBdFXIiEkNMMUC2gNnXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087
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

Add the const qualifier to CPULoongArchState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
---
 target/loongarch/cpu-mmu.h           | 20 ++++++++++----------
 target/loongarch/tcg/tcg_loongarch.h |  2 +-
 target/loongarch/cpu_helper.c        | 20 ++++++++++----------
 target/loongarch/tcg/tlb_helper.c    | 12 ++++++------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/loongarch/cpu-mmu.h b/target/loongarch/cpu-mmu.h
index 54fb732d62d..61b59f3d3f3 100644
--- a/target/loongarch/cpu-mmu.h
+++ b/target/loongarch/cpu-mmu.h
@@ -30,14 +30,14 @@ typedef struct MMUContext {
     uint64_t      pte_buddy[2];
 } MMUContext;
 
-static inline bool cpu_has_ptw(CPULoongArchState *env)
+static inline bool cpu_has_ptw(const CPULoongArchState *env)
 {
-    CPUSysState *sys = env_sys(env);
+    const CPUSysState *sys = env_sys(env);
 
     return !!FIELD_EX64(sys->CSR_PWCH, CSR_PWCH, HPTW_EN);
 }
 
-static inline bool pte_present(CPULoongArchState *env, uint64_t entry)
+static inline bool pte_present(const CPULoongArchState *env, uint64_t entry)
 {
     uint8_t present;
 
@@ -50,7 +50,7 @@ static inline bool pte_present(CPULoongArchState *env, uint64_t entry)
     return !!present;
 }
 
-static inline bool pte_write(CPULoongArchState *env, uint64_t entry)
+static inline bool pte_write(const CPULoongArchState *env, uint64_t entry)
 {
     uint8_t writable;
 
@@ -89,17 +89,17 @@ static inline bool pte_dirty(uint64_t entry)
     return !!FIELD_EX64(entry, TLBENTRY, D);
 }
 
-bool check_ps(CPULoongArchState *ent, uint8_t ps);
-TLBRet loongarch_check_pte(CPULoongArchState *env, MMUContext *context,
+bool check_ps(const CPULoongArchState *ent, uint8_t ps);
+TLBRet loongarch_check_pte(const CPULoongArchState *env, MMUContext *context,
                            MMUAccessType access_type, int mmu_idx);
-TLBRet get_physical_address(CPULoongArchState *env, MMUContext *context,
+TLBRet get_physical_address(const CPULoongArchState *env, MMUContext *context,
                             MMUAccessType access_type, int mmu_idx,
                             int is_debug);
-TLBRet loongarch_ptw(CPULoongArchState *env, MMUContext *context,
+TLBRet loongarch_ptw(const CPULoongArchState *env, MMUContext *context,
                      int access_type, int mmu_idx, int debug);
-void get_dir_base_width(CPULoongArchState *env, uint64_t *dir_base,
+void get_dir_base_width(const CPULoongArchState *env, uint64_t *dir_base,
                         uint64_t *dir_width, unsigned int level);
 hwaddr loongarch_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
-uint64_t loongarch_palen_mask(CPULoongArchState *env);
+uint64_t loongarch_palen_mask(const CPULoongArchState *env);
 
 #endif  /* LOONGARCH_CPU_MMU_H */
diff --git a/target/loongarch/tcg/tcg_loongarch.h b/target/loongarch/tcg/tcg_loongarch.h
index 7fb627f2d63..0f20c60d73d 100644
--- a/target/loongarch/tcg/tcg_loongarch.h
+++ b/target/loongarch/tcg/tcg_loongarch.h
@@ -16,7 +16,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr);
 
-TLBRet loongarch_get_addr_from_tlb(CPULoongArchState *env,
+TLBRet loongarch_get_addr_from_tlb(const CPULoongArchState *env,
                                    MMUContext *context,
                                    MMUAccessType access_type, int mmu_idx);
 
diff --git a/target/loongarch/cpu_helper.c b/target/loongarch/cpu_helper.c
index 123cad3d930..3401e7ed727 100644
--- a/target/loongarch/cpu_helper.c
+++ b/target/loongarch/cpu_helper.c
@@ -18,10 +18,10 @@
 #include "cpu-mmu.h"
 #include "tcg/tcg_loongarch.h"
 
-void get_dir_base_width(CPULoongArchState *env, uint64_t *dir_base,
+void get_dir_base_width(const CPULoongArchState *env, uint64_t *dir_base,
                         uint64_t *dir_width, unsigned int level)
 {
-    CPUSysState *sys = env_sys(env);
+    const CPUSysState *sys = env_sys(env);
 
     switch (level) {
     case 1:
@@ -48,7 +48,7 @@ void get_dir_base_width(CPULoongArchState *env, uint64_t *dir_base,
     }
 }
 
-TLBRet loongarch_check_pte(CPULoongArchState *env, MMUContext *context,
+TLBRet loongarch_check_pte(const CPULoongArchState *env, MMUContext *context,
                            MMUAccessType access_type, int mmu_idx)
 {
     uint64_t plv = mmu_idx;
@@ -111,7 +111,7 @@ TLBRet loongarch_check_pte(CPULoongArchState *env, MMUContext *context,
     return TLBRET_MATCH;
 }
 
-static MemTxResult loongarch_cmpxchg_phys(CPUState *cs, hwaddr phys,
+static MemTxResult loongarch_cmpxchg_phys(const CPUState *cs, hwaddr phys,
                                           uint64_t old, uint64_t new)
 {
     hwaddr addr1, l = 8;
@@ -146,11 +146,11 @@ static MemTxResult loongarch_cmpxchg_phys(CPUState *cs, hwaddr phys,
     return ret;
 }
 
-TLBRet loongarch_ptw(CPULoongArchState *env, MMUContext *context,
+TLBRet loongarch_ptw(const CPULoongArchState *env, MMUContext *context,
                      int access_type, int mmu_idx, int debug)
 {
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
-    CPUState *cs = env_cpu(env);
+    const CPUState *cs = env_cpu(env);
     hwaddr index = 0, phys = 0;
     uint64_t palen_mask = loongarch_palen_mask(env);
     uint64_t dir_base, dir_width;
@@ -273,7 +273,7 @@ restart:
     return ret;
 }
 
-static TLBRet loongarch_map_address(CPULoongArchState *env,
+static TLBRet loongarch_map_address(const CPULoongArchState *env,
                                     MMUContext *context,
                                     MMUAccessType access_type, int mmu_idx,
                                     int is_debug)
@@ -299,7 +299,7 @@ static TLBRet loongarch_map_address(CPULoongArchState *env,
     return TLBRET_NOMATCH;
 }
 
-static hwaddr dmw_va2pa(CPULoongArchState *env, vaddr va, uint64_t dmw)
+static hwaddr dmw_va2pa(const CPULoongArchState *env, vaddr va, uint64_t dmw)
 {
     if (is_la64(env)) {
         return va & TARGET_VIRT_MASK;
@@ -310,7 +310,7 @@ static hwaddr dmw_va2pa(CPULoongArchState *env, vaddr va, uint64_t dmw)
     }
 }
 
-TLBRet get_physical_address(CPULoongArchState *env, MMUContext *context,
+TLBRet get_physical_address(const CPULoongArchState *env, MMUContext *context,
                             MMUAccessType access_type, int mmu_idx,
                             int is_debug)
 {
@@ -376,7 +376,7 @@ hwaddr loongarch_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
     return context.physical;
 }
 
-uint64_t loongarch_palen_mask(CPULoongArchState *env)
+uint64_t loongarch_palen_mask(const CPULoongArchState *env)
 {
     /* PALEN stores physical address bits - 1 */
     uint64_t phys_bits = FIELD_EX32(env->cpucfg[1], CPUCFG1, PALEN) + 1;
diff --git a/target/loongarch/tcg/tlb_helper.c b/target/loongarch/tcg/tlb_helper.c
index 40cc0764248..6194b976c36 100644
--- a/target/loongarch/tcg/tlb_helper.c
+++ b/target/loongarch/tcg/tlb_helper.c
@@ -35,9 +35,9 @@ static bool tlb_match_asid(bool global, int asid, int tlb_asid)
     return !global && tlb_asid == asid;
 }
 
-bool check_ps(CPULoongArchState *env, uint8_t tlb_ps)
+bool check_ps(const CPULoongArchState *env, uint8_t tlb_ps)
 {
-    CPUSysState *sys = env_sys(env);
+    const CPUSysState *sys = env_sys(env);
 
     if (tlb_ps >= 64) {
         return false;
@@ -239,7 +239,7 @@ static uint32_t get_random_tlb(uint32_t low, uint32_t high)
  * virt_vpn = vaddr[47:13]
  */
 static const LoongArchTLB *
-loongarch_tlb_search_cb(CPULoongArchState *env, vaddr vaddr,
+loongarch_tlb_search_cb(const CPULoongArchState *env, vaddr vaddr,
                         int csr_asid, tlb_match func)
 {
     const LoongArchTLB *tlb;
@@ -291,7 +291,7 @@ loongarch_tlb_search_cb(CPULoongArchState *env, vaddr vaddr,
     return NULL;
 }
 
-static bool loongarch_tlb_search(CPULoongArchState *env, vaddr vaddr,
+static bool loongarch_tlb_search(const CPULoongArchState *env, vaddr vaddr,
                                  int *index)
 {
     int csr_asid;
@@ -837,7 +837,7 @@ void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
     sys->CSR_TLBREHI = FIELD_DP64(sys->CSR_TLBREHI, CSR_TLBREHI, PS, ps);
 }
 
-static TLBRet loongarch_map_tlb_entry(CPULoongArchState *env,
+static TLBRet loongarch_map_tlb_entry(const CPULoongArchState *env,
                                       MMUContext *context,
                                       MMUAccessType access_type, int index,
                                       int mmu_idx)
@@ -853,7 +853,7 @@ static TLBRet loongarch_map_tlb_entry(CPULoongArchState *env,
     return loongarch_check_pte(env, context, access_type, mmu_idx);
 }
 
-TLBRet loongarch_get_addr_from_tlb(CPULoongArchState *env,
+TLBRet loongarch_get_addr_from_tlb(const CPULoongArchState *env,
                                    MMUContext *context,
                                    MMUAccessType access_type, int mmu_idx)
 {
-- 
2.53.0


