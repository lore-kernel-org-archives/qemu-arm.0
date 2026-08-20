Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0986FC5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0JH-0008CF-IP; Thu, 20 Aug 2026 06:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JF-0008BI-Qz
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:47:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JD-0005h9-T0
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:47:45 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA2i162932659
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OesEcufEhEzMhBKLh/i/9HJMWMl2iNHPd71jd4muFYg=; b=BQr/YcSWrgqEoUB5
 GrLOCC6cDmTaUh1BsFLBE7uoUp/t8o8GovvbjiO/wnelaJ8X8jDqNTbNYdmgg+MO
 V+GHAsDml+XgPe5A4ZpbjcuW7x686WdOcVdFaSiBzDWvySk9G/sVeGO5i4XJxYkb
 +X/2pki6ukKr5OCRX6/mE834jlnXuBeZrwuIIu+bIKiMusa7vO4lkCKCG4QYC4dz
 8xrzRLJNrOc1mgQxdU2sAMuWi5HLZa67DOU8CEn2K0syfKQkLxOCywD9uTWqOAml
 m5d+xIQLh/+QC3kTpI5zfnArbmx1n/7ZVVdHEhTwWdld6fCvcw5IJfOL2B3lCRmd
 p0WUfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g5va-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9349c5af52bso354679785a.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222862; x=1787827662; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OesEcufEhEzMhBKLh/i/9HJMWMl2iNHPd71jd4muFYg=;
 b=QE/uYXvenNcu+YaGlsacGLw+6n4mDprfAL8e1ugB1jCB20NQbVef8W6KQ3tmTecbOy
 B+ThLHN06GUtedZHmJ/EtR+1RU/DAQ4Aeaekrh3MXL9cK+ANjbaAWow9h27wIAHk0xTf
 gRo9+3Ms2iGU5Su7uypvmTpzxrdWVS4TvUOJmqSXkoBiURRXg6Z1WTDGlp3TLCOo9jAy
 sTx+qwPH+ISPk3MWeZotI0Od1T8uOt6j4tedKj1+XOPNM7fLWdv77nKxc3+NA9IsppIS
 pXhByhLq45xoehkFKEl9rGnJtCX4VHN5L+/LW3kUZvBW8MTfMTD7/LItA9zqo0TcLK/s
 e55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222862; x=1787827662;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OesEcufEhEzMhBKLh/i/9HJMWMl2iNHPd71jd4muFYg=;
 b=m2E/pPp65Yx25snhV3XH6kAfTlwvC36IbWH+epMC8JaikBLKrg6wEhetgwpJQt5n0E
 ++eMi3hRbHeKj/QRHJjtX6o7m89uIHutcyz8h5mvKw1Qeho/7E5Mdmkd++aG36G3IDpQ
 qqT61Je/iWPr8P/FGg9XMPIHdKpZgFdyEEnPSmmmbq4uhjVz5fbqEDDhAe9co+a19rdS
 w8sZQvWsR3uwZloLHxSc/qNvQOWmYHj9TqHzzJyY4XW9b8lnWGPmENZvxSmSDRwnBBnY
 iMR1XfgchgGgsrpjFC9EsvHoiUPfZt9iYajPpdBbu2LbrvUd4iXgUeREK4IlmlHYCWUh
 v57A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRZqT7S1bvKTlo1n63VVo24XnooblpJ6fwy9bue7cr9/zVZSUI3SO4eDh5hl2nrTfYDjGR47rQCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxnt5aw4mGVnOQRLYpiRD62GbY/06YfEBIXPLaz03+58vvrtVxx
 dOFBM853wZms5x63Jqsz0IG4Jy+n9f52RNiNjdGP+JGpN4uW72ukmzvbnOkbXnpQrfzJvNkkstx
 bQt2jjLNH7wygR99oGUykiM6yHh5kekEI7+oCtK15PaRX2UboQ0mIEPs=
X-Gm-Gg: AR+sD137wp5X2MF4H0ScnYnRh1S53LHkSoexv9cBNdm885JINKNBbBwwBw2F4m14F4p
 deMQ8JRsAFsCOBuR7tNjeAqvdRsy5Pl4HbMaCmg9mn5qmEng2vNNskv4gDs86YEvlBxdrbVstTQ
 kXMXIRL+FKsYzJPwsjMho1AuZBV8AnV0xeGBu59m2hJjPnOFZv/uM9JciKblUDtKLRrXpg32ItZ
 5u74G6YVs1KErnox3PTNvs4j3MKKF1s0NIljrmRB5CcmyGAMv6ClcR+It8hfyMSPFuXlxG9RWHs
 +RqGEQyCNwgipgbHAMzrR6BYwLx+wRtuVMziTSUldpQGR67X0RYGXQvCkUFcF2gA8TBqH9WBG9p
 XN/Ui1LvKcAi/GsRtWh0jpNtSslgA0LcUrrL4ey5Itg==
X-Received: by 2002:a05:620a:4156:b0:937:1225:ec49 with SMTP id
 af79cd13be357-9371e21fb02mr1001483485a.18.1787222860818; 
 Thu, 20 Aug 2026 03:47:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:937:1225:ec49 with SMTP id
 af79cd13be357-9371e21fb02mr1001480585a.18.1787222860319; 
 Thu, 20 Aug 2026 03:47:40 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm117748025e9.3.2026.08.20.03.47.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:47:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 01/13] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Thu, 20 Aug 2026 12:47:17 +0200
Message-ID: <20260820104730.25462-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Is1lE4Xx1a7kR9K0L-pcAX_hoAwOdd4
X-Proofpoint-ORIG-GUID: 2Is1lE4Xx1a7kR9K0L-pcAX_hoAwOdd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX4ppTrzv3B5VB
 sWz5sAS08P5+wHkLVfBPAAcaYVrARpnQ0DzQRz2IQcy3cYljVxAgaOqTZy7z2r+mrO7KtC85yhz
 fwLBlceteOF82wzDzKg+gvP73/k/3ps7YQ1rE5RDPDw9W7gtPqHiSLIzlVYDoph6nReT+/Xy8Dn
 hW80CYJ4GsAh+4oAsoQ7SUTYxP3O1LkD3MNn+eJOUg9h6ZTo1/PXzTmsvXPwdrCfmLaIAAhA6/h
 tp8ZjNliLZA/FogqCd1JfAW8rLjevKutOqv9y7FpbZKIZsVMTV8etoS9c9N7RVU/2ey4B7hWHzW
 Kgjq6yrPr1ibowStHIbcM3UFCrBC7F/LIDOXbf/DFGunI2py2m5ewyH9ztpyQzWX4Q0pbE/8AN2
 21tZtRpB4WygBLzG6DcBusXTe0UdI9RQRYA74GlRE2DtsHAZYmEqe2rwAc3R/me5kSVbHcVQuNq
 HDhZBnHrT0Vg68VFVhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX0prm+/WsazNS
 wAWut7ZK+Ddki5wDiE25Eh6yxZjhK+whm1S7b/8JDuTZO9JCCAx7Am9xqV3mu7u0lgibEOSWdDZ
 jFsV5yl6tJIHv12gV0/w99k+oHHkNKU=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86db4e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
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

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/avr/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a818db753b2..1e4e839bd83 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -183,7 +183,7 @@ int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
 vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
-static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
+static inline int avr_feature(const CPUAVRState *env, AVRFeature feature)
 {
     return (env->features & (1U << feature)) != 0;
 }
@@ -204,12 +204,12 @@ enum {
     TB_FLAGS_SKIP = 2,
 };
 
-static inline int cpu_interrupts_enabled(CPUAVRState *env)
+static inline int cpu_interrupts_enabled(const CPUAVRState *env)
 {
     return env->sregI != 0;
 }
 
-static inline uint8_t cpu_get_sreg(CPUAVRState *env)
+static inline uint8_t cpu_get_sreg(const CPUAVRState *env)
 {
     return (env->sregC) << 0
          | (env->sregZ) << 1
-- 
2.53.0


