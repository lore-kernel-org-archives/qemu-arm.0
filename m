Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61E3C5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:48:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0Jm-0000XD-7R; Thu, 20 Aug 2026 06:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Jk-0000J5-AF
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Ji-0005ln-E5
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:48:16 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA2lsm3132006
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sy4vN/OTGBwXa0UO3cJvv7KQZLmMlNbXWMIg5UlIao0=; b=aznFfAC5gKt/Npt9
 FJzr7TkG0dTSyTJnsVclEmXrnZ030foF3v0h9kw9KULnDBHW5kLbdvyfMp7bt+lz
 CpTAA0bYy9tVM1qWW1RGOrvLw2bjfg0hN8UF+B2kwp0vfOy0sMlhn3K4w7wyQVlR
 kySAW0DvF8Js8AaekVdGy+KiIJk6RlWmUhsNs5ncSXMcrB+Bt3LzvN0B08s3twoI
 ZrQ1loHAqYCcDv3ruxJGrUpHV9hDog8de9Zr/utdNtxEJVYsixoApCkQVOLOE1L0
 2ioVfwBmFeYSIsuoK6pTct7loGQxrwJhbqQlXY0ySjz/sCKCNlO/uo1wx1cPQnFL
 vM0s4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg185n3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:48:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936cadb0e8bso176957185a.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222883; x=1787827683; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sy4vN/OTGBwXa0UO3cJvv7KQZLmMlNbXWMIg5UlIao0=;
 b=aNDoByGx/Jj1f4uQQKl9A+eugWrYd2oDipzPGokrtGC7V1w+AjcJVdJyN0wTojseR4
 s+RYTgp8Cu8SkrCwsGhCZvLDDxe0xnoxP23fQJoH7Ak8upteVyqNMGTVcoEdebuQOa9M
 uoJi/RZbDove6RSr4LLjQWnegPjsgmVPi6lQegvckOPi8od29cXh9qfchX852xGdSqfA
 bfA1TsH8NnqG7RYYQzrFSPF8yoc5QFvZ6pV2+MW2yFVzIZlszuzNULptsjhjCtgJiY8t
 romYeiQwwswM3GEz9vTY0JX6rdWMaofgtp45cEigwP2lAuvpiYf8/HiJ3HSNr4fvZswY
 Z0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222883; x=1787827683;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sy4vN/OTGBwXa0UO3cJvv7KQZLmMlNbXWMIg5UlIao0=;
 b=OpjeayNdBELizIiUJYl10zkHYBhxPzQ1PYnh4RWcYZAOzFNb5GsrpsVU233L495TVl
 CeCWhCevtWTDwAX286Tm7Rlpgt7dilNQzvyMp2ZWLRQ9qXBE6nnCufMtCf0ZavIiGYml
 Y0tZV8ix6H6lSKob84rr4Xw0p4aRNtGfSUZofxNneGXhd+h0BqGLW1kPcnDeSd08rZYL
 AiiyC7xE3pYFAGJ5CpP+LZTAS+0OBUnJRhRkV4fh4hEkIAkpyvBmeWsO4mcJS4FIX+Ze
 gRZ3rLPLSBXIO1ahU99+bZ2MB+5u5/kFI+591XZJ7LHpuy9wySj5o+5nOKfI7+AiVFZ9
 +1HA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro776CDkj2Hv/kb/bAkLDWm4vfmw5ldbYg6f7VhvNfvbyMuA9QGrhaKG2AFQJXJyqtzKiPOBd/kIQ==@nongnu.org
X-Gm-Message-State: AOJu0YzfiI7DxNajSWiU+r7ZenCNimL8+oVC38bi/7AfPoGzREobTklj
 OhGk60oTA3vN7Bfdua5BT6dNaO/4iwsO0kQO1NCJiTY93O0l6Aczv/uIenofCCl/R+cVHBAY9OW
 +E+TzROIw9WEWTxGQnLMCKnKtddqq8yMWqck9QoAS0dJThBKhlEeIStg=
X-Gm-Gg: AR+sD11JTAKFDkPFnq1q5hXSq8aSrw98PMjtF3+CGizyNxs/DQfh7+9jL1gaSmLv+ng
 ltjFpljbXanXlMQ9jvNvkA/NtPk8r3EWozXIp5esMLEqZdqMNX9EZ9G+a8XUj8OG7lbT82hKKoP
 t+uiAe8YDG4f3lwRaf7psE/jDNnlD3xPU7u+wViLLnQPOay3oIVcru7pKvzwPASOpgBqZTowV9j
 Ia8GP/5C48rnI6WUkH/vwUtvWiqc/MkXvE0w+ovEua/l2p03Ze6YPQngI/lu31KL3E5GdGCWfww
 dMqZpW6R8TCKnr4XL+PdhOLh8IlqAafoC3DyGHLTNOW2GLNmcYtCjMymMR9Re0xx2i85W0mEEZM
 u5/5PLLdgNhrshy+ORUCdBTRq7CSccft9sJbNpT0Uyw==
X-Received: by 2002:a05:620a:25d3:b0:937:1538:6b93 with SMTP id
 af79cd13be357-9371e6f0580mr985528285a.40.1787222882554; 
 Thu, 20 Aug 2026 03:48:02 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:937:1538:6b93 with SMTP id
 af79cd13be357-9371e6f0580mr985524285a.40.1787222882046; 
 Thu, 20 Aug 2026 03:48:02 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14cf0a3sm11807807f8f.32.2026.08.20.03.48.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 04/13] target/mips: Constify CPUMIPSState for various cpu_*()
 getters
Date: Thu, 20 Aug 2026 12:47:20 +0200
Message-ID: <20260820104730.25462-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3E8fVrc63l0mvZ3OEjGbEu8gxYRH20Tw
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a86db63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OdUTIDwS7iTBxe5GiEQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3E8fVrc63l0mvZ3OEjGbEu8gxYRH20Tw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXwNkAe0Do2uJF
 0aiUbM/6h0ox3+lRa4qq1pFj7geFy9259OuKA2+rcm8+/Lex99fVWxzCSGnPYTV8o9VAzmaJXFS
 ikYYywG7W439zlUtUgJ8przOaJXLS90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX8aTplkbEbWTX
 vqgkdguqCkO/nnLZM3Umd0X3tlzxeDldufgo7D9UQTwpL07YUmHexxSIpA6uj8wnm8qfqxZdxdw
 Pkrq8pftQvgCYLJOe3G5F8P5HUL4wShJptH0ckGA7IMKDkL9CG8l5wnA84pEZ1rPoEeY/42amUX
 GQXi/OSJZf5CKaGyoO/+ndeQOSapPv5SuGrD9j3TpV6By8D6R4VgNBRkfGxDiCyVZdQ0aTsGNdo
 FAbB8/6xaw8BPhKpysQIqn5NA3A+68Dp9uw2kXD1lBeb+Vr/POZLKVtVtzUOSLmYXGYH9akOiRL
 vWwYiLeTzhPA66HOW0xrf8JpGBAfXm8LD6ptoEp/uYskLS7D39DoBON5G07xV6GlnxcR1zRj3Mf
 VeGnxfFsyyEc6w1aXc2RQzhHQ4r7YXiz/q+P79vnG/qd/7LkRE+5zO+1uc8vAd6dtDYHW75ZP32
 hQ4x85P7/7sywMa9UTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Add the const qualifier to CPUMIPSState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/mips/cpu.h      | 6 +++---
 target/mips/internal.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 319147a948c..6404b342a5d 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1372,19 +1372,19 @@ static inline bool ase_3d_available(const CPUMIPSState *env)
 }
 
 /* Check presence of MSA implementation */
-static inline bool ase_msa_available(CPUMIPSState *env)
+static inline bool ase_msa_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MSAP);
 }
 
 /* Check presence of Loongson CSR instructions */
-static inline bool ase_lcsr_available(CPUMIPSState *env)
+static inline bool ase_lcsr_available(const CPUMIPSState *env)
 {
     return env->lcsr_cpucfg2 & (1 << CPUCFG2_LCSRP);
 }
 
 /* Check presence of multi-threading ASE implementation */
-static inline bool ase_mt_available(CPUMIPSState *env)
+static inline bool ase_mt_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
diff --git a/target/mips/internal.h b/target/mips/internal.h
index c5c286872eb..66e8c599b43 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,7 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
 extern const VMStateDescription vmstate_mips_cpu;
 
-static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_enabled(const CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
         !(env->CP0_Status & (1 << CP0St_EXL)) &&
@@ -180,7 +180,7 @@ static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 }
 
 /* Check if there is pending and not masked out interrupt */
-static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_pending(const CPUMIPSState *env)
 {
     int32_t pending;
     int32_t status;
@@ -281,7 +281,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
     return active;
 }
 
-static inline int mips_vp_active(CPUMIPSState *env)
+static inline int mips_vp_active(const CPUMIPSState *env)
 {
     CPUState *cs;
 
-- 
2.53.0


