Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEF3C982FA
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x93jo-0006HX-7L; Tue, 22 Sep 2026 12:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93ht-0004Pd-2L
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:51:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hq-0002XC-PB
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:51:00 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjdcT898354
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wzgwIgPwTbv5GuXC1qq/1cp5HK8wllQnhGsYgJ3NxUk=; b=YNvKOs4wZLxJEQB8
 MxRtMyv51FVS2mRHvXc8yqJN2OzBK28HhlOz6yaxzk/0wWNeSNYqOCUL603U5Myf
 eHCBL4UiROupy2buqxpdSVHBQIL1huygbNBDhc6faNNmo69eHDzLjLzP+NoJcHaG
 cN8W8zSK0NeCeET9EWtMvlBsjVBh9Zy2WaaZB0CgfeWG4gO0EVL+Yv8G4ZWSM2SP
 AmKc56D+CUwXosKWXncclOY9KDZgk0XZKn2EoR/r4JIm8MSNYYyO0sOg2IEOr/mP
 bCntzkTFyY7ew51eS068NHEmtTKoGfYMhp3cW2A91HyVp5x/zcMC9nVGqgAWFUEj
 TJUUqw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkvvr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:50:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-983310b2d52so12957241.1
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095846; x=1790700646; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wzgwIgPwTbv5GuXC1qq/1cp5HK8wllQnhGsYgJ3NxUk=;
 b=H4Qqg152/gmQaDAjEyjrjDaKw2iGmnyuatkfeiDyCo8YwqvDs0LNGO9o2//QHJJzUU
 B8pJ/P0Cmjy9P4PdpyrtRjnR6HO1fcy6r4kqin5c9F4MbsAVy51fJQm5vFTdObLbFjGR
 WL/r9JpLG42Rf1Vqpk6eJFRP6OsEKAn/6xlOBneCAeWUtR8FmH2a3XRb/DYDPHXq0Ngu
 iEGkp1Nc25cBtfmIpzYbGvemFkbBmQHfT1bu9IOFZfODUB9WWTImDSSzOh9ZglL+BEnQ
 3mJS8x3VKtamL3fx7+REZWCDUNxq2CrB3kf0jqtxDjpvus980jpYl5dVRV/8KUqZTe5y
 VKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095846; x=1790700646;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wzgwIgPwTbv5GuXC1qq/1cp5HK8wllQnhGsYgJ3NxUk=;
 b=R61BRvkbt9OUo8BFN1xQ3Zi4MbBnH5HNgLgkBylVNlXZF2eoVH6CwVITl5YDTRkXSS
 BuM8Tqt5TzYYlElWkHoTF5s7EfbqZJr5Eki/DmqQ9kKtlmAIKwtotMghUoN8tEkW5b3g
 yT4/F7s/8OHru5Cd3Z862IAqro+M0h/FY50emYJKIf6R9OZwV+Auq5Ig2a0Yj/OeO+ZC
 vjDEiys41Xdsa7DKg8+YNyoEOzUUhu1VXmMa6dXni4Edcxc1hVsSfT7Y8IUY2GHhlw+V
 1MBO+WnabnpXtjTpn4UzmE34U6sOcIKq06JRVyPaygq1DmKywuwwfmqhN7mBgWXgf8Y2
 5cAA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwHOtfA0D6DFpeGs9ymih/Ph2YkhgzjxBv7LYM0gdJQe89g7E0lIZX9k0Bafc4rQqD15/EBrI9+rA==@nongnu.org
X-Gm-Message-State: AFuF++kzR6GWqDTcUNvf3rnYzL/HrOxZGKuKsQgD70njsZV5Rd88twrz
 pqiyrhRXjDD+dbEINVxhpOzPsSaXKvwJOrgb4AEsi++J3HRQbgdJGq7+91iv/a5xOk8YCDb2WP/
 3fqeGFbcDIU34UT088x2+WRi4QwOyl5wKlqM8MatSQdwXd4NtR2yNhSQ=
X-Gm-Gg: AYBFou3qnzAjNXBMhN/ml6cSA0KRmg/5Oj7aLziOo/jYiUlqyZdtjw6gBNy0gx7m4b3
 oZ3Qp0bMMKTcXziAeOIHiE+UR8s3Vt1ZOK7lB38kzIuzBNfZKstZE5kDTPmj9XptJTQFsnOolgx
 wpTUfmIJ84j+VrS9GNOUQEu6nXEQQ2iCOQgMfI1PdVxPX+ObiLIHLGPhwfgnk4NdM7d2AKQBBin
 /jWesfdu+rldmyz3vjmXScnwiks7vsU3lEMKvfWLzimryGIMw27k5JtgW2sPudhPXVkHgrP+N6w
 U2xYAyBK9IaOhkzetZz2dyP6YsCJB1cJiF8ycp2SevY727X6Oy0INUEgiCFTtB70yHmN+P+Etkf
 b95Kcsp4A34rC/VdxydWXzLT7gFd1jaE+G7Qy9x0J
X-Received: by 2002:a05:6102:41ce:b0:7a5:1d50:ac35 with SMTP id
 ada2fe7eead31-7a56fb37fe7mr6286085137.21.1790095846048; 
 Tue, 22 Sep 2026 09:50:46 -0700 (PDT)
X-Received: by 2002:a05:6102:41ce:b0:7a5:1d50:ac35 with SMTP id
 ada2fe7eead31-7a56fb37fe7mr6286056137.21.1790095845679; 
 Tue, 22 Sep 2026 09:50:45 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde197466sm3544725e9.7.2026.09.22.09.50.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 09/17] target/arm: Read halt state atomically in
 arm_cpu_has_work()
Date: Tue, 22 Sep 2026 18:49:27 +0200
Message-ID: <20260922164936.15189-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2b1e7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fCBUlyQ174aHMSgJZicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: KeMkdQj8YWLTaUcBr1gKsBmvmzme7xmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX03oG03zfGFs8
 nrPJ7n4Ad2hR9JPS41JnTvpbBXYj0Fzl1rQdxtaC6ik+K9V4W7TpvvlnLX2bqF5wnyAQvaPFtZm
 WAK6AQXdpxC0iftYeDuqXEj72ICJ/OtCU6Yw8mqH7MAwIofqC3ut74pnaPypt3ZZX9v8t1XQUJv
 7Ujei7r1hjLQI3hZzjlzdOpCDSk/mX2R293oOa1EeI62xt8oBt5QlGtAKlw2G+loAs5U0PskBAL
 6+1Ra6cDMXq01LzaKF1w9NKeftBFJsrlHE0VgD4dhN+7t1p8Njb2Fh0gP8cx/ZyHdNp4Bist9mE
 EJZmQ8C2JX3SVHeN67glWB7nVcPGAkc1SKztKiGpENx2PDdrpxNlvXNG6TuqyYt1Du6UokqObV+
 mOY3BL2D+lj4QJ2R54YdninSDQQNbDlho8dTBApFLFYhx8memgfst3tpanvXoMdyqVMHL1oaLfa
 cI0g6gE/eDPgvO6xwSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX68k/umwDB0Vv
 xUmrmBY3YCYQt5hAGZ0IFx8682jjDgH8jyMqfhmhGRHqFutxK0efoegKzn6kCV/+gsG8Wx9r7fQ
 D1wVHh4p5EUCd0BKhRiPZ4TFy7WjCPE=
X-Proofpoint-GUID: KeMkdQj8YWLTaUcBr1gKsBmvmzme7xmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

arm_cpu_has_work() runs without the BQL held. Use atomic reads for
halt_reason and event_register to safely inspect state updated by other
CPU contexts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cfd3bcfc8e..ccc6630026c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -144,20 +144,21 @@ int arm_cpu_mmu_index(CPUState *cs, bool ifetch)
 static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
+    ARMHaltReason halt_reason = qatomic_read(&cpu->env.halt_reason);
 
     /*
      * Only another PSCI call can wake the CPU up in which case the
      * power_state would be set by arm_set_cpu_on_and_reset_async_work()
      */
     if (qatomic_read(&cpu->power_state) == PSCI_OFF) {
-        g_assert(cpu->env.halt_reason == HALT_PSCI);
+        g_assert(halt_reason == HALT_PSCI);
         return false;
     }
 
     /*
      * A wake-up event should only wake us if we are halted on a WFE
      */
-    if (cpu->env.halt_reason == HALT_WFE && cpu->env.event_register) {
+    if (halt_reason == HALT_WFE && qatomic_read(&cpu->env.event_register)) {
         return true;
     }
 
-- 
2.53.0


