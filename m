Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699DFC624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LBI-0007lu-AX; Tue, 01 Sep 2026 05:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBH-0007iK-4c
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBF-0007Zr-Hw
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:26 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179DLW1892397
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=; b=ZN1vXOUB5gCpDKWg
 J0jDVsp07IObPNt9nLOELdO2jzw78xjQftH1pnFcBPW8pGZto9pVGuCMIPZtUV1j
 X1a1g8nIAfi5RES+vxZEiKH6g322giVTOGRtrrbBeCimVan5H99XQQGgiJQX7i4H
 YlL+8u7GPIrKiK2RIhgBgpXqJr2N4UID/Jb6JTGktF4WcMPEw2EjAlhNFVZbuLsX
 8QLwUf/SRNuwKnOsg9irUOAZSRmEPpInNaXK6KChFdk8p5TBwpPYXXm/Z3x62QkZ
 W87/sSb9fBwP+sKxedxiAGQ+12qfNkAf0eEmHs3cXn4ODxjXEPylIaztItmA7Iu+
 6DFREA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9qrg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:53:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93915f50a5cso178510285a.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256403; x=1788861203; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=j4FntiyZU34lBXoIdH2iMejDJkVrsFfoJqzHDtFGSlbDikFgU9m+g9w3bkc6aRrf4/
 YIxZAUWjK4LgOh06D6OGSabD9v8qJJJGUOIVoomJ4K6vSAfNKWMB62xed6YKOdR2wofV
 7VuuslmxHDyRkDjpoWRNrCK0Ap6cNzEjtyVlXTfu1Fb3o5Jl2Kbv4Bsqti918x+hyceY
 NKYKKmTAF8d02qKbEGPoX0xYZN4H1qEDx3fJDSE5SxDgqvRG4z3puIsvzr7GE34X0MOI
 1s9dBfqbg7fzG4Obb9fBvuOI9S521iQhgFJh7+op0UaZW97oZ4h4+9A+5MBE/rP3KFYX
 ACPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256403; x=1788861203;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=duXT5qhf/a7LliW4Uc+1EJnY4xPMaM5IE8URUazpYrZ30eKGJ2MN1Jv8ct+wtzGupe
 +hnBB3Sc/A9f4XTPWCJwN1hLrA1fMAA3Uumvg67mwkmXpF7FHKQvfbpAi1oFKw8fc4bn
 OUJzZNPDhZNKlGzv0y9pLK7JlyAbgllIjq7c2CNrFj1tmIT3fBmtxMfRrouI8D7d0D5o
 2DtwOyB9ZVf/Fx7GL0bMQzMYef9PVd1WCoLwx0uXfQkrs/v2OpcdoNoZ77SStXZUHcbm
 JX2JvGJGwwqOqdwcXFe/73s+zT8q901kmcNMea2Ih4fy3EzKFyAHlUukpIaHe41yBWcH
 NXfg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmHjgrtf8GHkBqDlRdqzMY1kWl7pyAzy/orsoe9LE6ZMFFYVMuf8oSLAOnaXZhPhaNYaTXzoMqmg==@nongnu.org
X-Gm-Message-State: AFuF++kl/TljnOAxm6P3bwyXodI0jr7A+JpU2VLJ5U05q+JQy4bvEjAW
 ayvXuvXmXvCgOr+Rw3HqPGTERdOaNFCLIhvPY485+0YKstvcetwK/M7vLbBwJ1eoB3E+yx9CQJw
 Q9WzL3X3dntKbOi8epikFabP6H4xhsR82gs1+W/CkXEQMUDUEPd7xb6s=
X-Gm-Gg: AR+sD13fdsWhHT+CdpzbsTp1fZpF7oM08+4QDNkoalO2lFAaE5e+kxDDc1+dO2mviwB
 2pvrFybHnlunz/SQ3MRjECcLyUim3MpCywWiVguYSDUMd9dDA51o0vrqzDVo0A0ZwWh84I9iA7i
 zmWWlx1SN/DaiFw3NSIovX3LnxyntthhAEhJeLFcJi25CPIKK0t4vMlI7rKVfrv20zVEgYNrinT
 DTwiW8KIF5mmHA7eVmmQO7lxs9R2yAmsVt/D3PSQhdbd5wXPWR2AzvXj91dkJ4XxZcr7ak+JbVR
 +ygRJ//j1cXjw5RmHC2Fu7EYXsmOgBxAjDx4pRCudhXLnN/G4jga92ZOIePeQw1qPnX8MHOK+hS
 j1IoW0uANVC98Z8yrFK06zgIO9O+VpzRmjze2qTcC
X-Received: by 2002:ae9:e50b:0:b0:939:cb6:997c with SMTP id
 af79cd13be357-9394bcac7c0mr421040685a.13.1788256402964; 
 Tue, 01 Sep 2026 02:53:22 -0700 (PDT)
X-Received: by 2002:ae9:e50b:0:b0:939:cb6:997c with SMTP id
 af79cd13be357-9394bcac7c0mr421038485a.13.1788256402551; 
 Tue, 01 Sep 2026 02:53:22 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442c42593sm4033726f8f.2.2026.09.01.02.53.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v5 07/21] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Tue,  1 Sep 2026 11:52:13 +0200
Message-ID: <20260901095229.72018-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96a093 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IsXvdHixZ-lejiqvOIaYBKYlU_xoIatp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX+qIdJ9YAhdnp
 HAfGThznwTcZHy6KL6aQaZzt+7SloE1o+8J0YjSFIMcf95JJPCjhzl12lwpW7/rFHLkFn0fWRRd
 oJLr1pziGA98SZ/8EkX9ul4sE5LIitw=
X-Proofpoint-GUID: IsXvdHixZ-lejiqvOIaYBKYlU_xoIatp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX8HPhB7XOdb7O
 +6QfZ8OLbnDOR5bdxT4nVQKSpzifIx90UuwFAhneNJLu7xIJPhGGTiIVqVD7v0PsfI0ZmqDc+Vi
 ExB+rG9Ux7j0mhzBGtkykg/heNKTSd0kCtiNyfTMBA7HPYwbqgfTfleVWsq1TJ9/B3zIQNZTONS
 hFeyWtEWLKaED0HRsBcskZa6TVBnU62MqNFXMOPwmKAjDzOLZA+LjjqEXzflxzmGHyfjvtyqSRw
 aUNPR983wTE9XHz/ygtSl6m7GOWrY9u6iDyXmNDwyb0T1UjVT4h5xQFB6rIcrYFyj7NE6fPc21c
 yg5lZQYl56iAiEd7GmEtu7Oc41ZIUbpIZUtU5/tbP/3KoreFqj9R97BsmUQ4URKhTMm/fLqwHvq
 FytsuYqDNM1qwDy92kOz8xrCXM7OXrZO37+KtmvmYiR1/meyf8F7UBb2uv6FqElSCnYXFoyx1jE
 E6TwOplPYRAlx1l1I8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
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

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


