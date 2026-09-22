Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44497C982FA
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x93kY-0008Jf-NY; Tue, 22 Sep 2026 12:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iD-0004fm-HK
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:51:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iC-0002aB-59
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 12:51:21 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjJYj449502
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kn2lfIEpf8rwL5b2StWxveggcsoepXeRi8I92ntqRYw=; b=ntQO7OpN5obckipM
 SwrW3NUbCKG3DtEsJvI8P5y/TNew6szA7yXeCEGWnfqdwyYQVepBRpc3SG1N3V0D
 7juoMfaSqOXMJCENGvqM1sl7eW3DO66Xb1trldVFCHQ90gkBZWA2JudEZ5X3o/bE
 YUNiraDnVCA/xGrLErUvUuuPH8ebvBO8WVr6bUX8vnmIC/6et+T66NxRHJmDDtgd
 Cy8tzoWpaRdc5dac9cdN/nK5eq4l0wpCv0VExGTjrhVmjoWhahC+DWxFN7VZ8AD9
 esAfCYyy40RIdfqT+Ixel8TYOlvnvZs7Y6XErD6TH39mZ7KUHiaNBRbuD1Jvr7oW
 i+rP6Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjytfnv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 16:51:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78faf713ab2so7720137.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 09:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095868; x=1790700668; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Kn2lfIEpf8rwL5b2StWxveggcsoepXeRi8I92ntqRYw=;
 b=ARkebPogy8ByiKeMkcge3T1tneHqTNcJSp59P3Z/YXxg73aTg9b/MsT59tx/qC68o+
 yI/DrThiSb1ybyhpcjrQmswgKHxIVBgpBu8coVMQK9FhM1+wdayK57RMA5qgCo70TL0J
 qiblwLhKFWthjYzQO4BVF7yucmT6f/s/TmZFcSijm56HNKVumFy9Ox+h8nADBR5heEEP
 PEuXCZsRzM4YK81pidIm3oIcxfx3lcY1kk9M/tSulnWaEt7OgLzz5VsEx/lGnWzBMkHV
 DknRRxMaCthbu1fYuMk0B3le5nzahYMT70/HQb9jZ1dE9k1QCVtEgd6z0hulKBv8sgFi
 kILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095868; x=1790700668;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Kn2lfIEpf8rwL5b2StWxveggcsoepXeRi8I92ntqRYw=;
 b=C7vHvPXlUQ5nbC0T9fpKqUmMXvogzn7SiDfu8Hb6qrzkxlqfK7hDaX+k4yNGUxoOSt
 YosNkUZa/mdMRGjbvbI/qzIuksuLz4eBjtjlVXT8D3raWXlBzuyr1uSLlRAnCT+cTubG
 lMFKRNU6YuO2HB+btE9Z4rTRq1esI7xco3O5CnQ5ExQpyTHw/rhulTw9L6cc/kkjEoAU
 /94huFBuhS6zYqLwQAAQGxNzKkEiRxAQN1xAE/H9sSVcc/tEynEIyN1Kwl9MOyFy1cgV
 Vwz/iPrMxyD1HlEBo1V2GYvk+DYzzQTBGZM+o1/YuLlefUa5cgaM0dIHpGlwu8URYDwo
 aNdA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxb1Q+AJ2MDEEhUHiN+8Zh59zHUTZ1Q+2WTJFul/St9EZxOY2ADe2EIPIPMhx7R4Mbr7YnykMfdOw==@nongnu.org
X-Gm-Message-State: AFuF++kLIuVgEMyXVx8EuapOH2+TgLIestc6b/OGw6nUXL28WeYHDETT
 Ko8u0t1YkMcri4E3NvPSsbOoXDCsX26gzmHserJt3ZGKqwV+dRFxIoHcEBZSlZ8jgMVhoQomtce
 SQmrauGOcnS89jUWKJQlvHRsXdfR/Cvib55pdUS0J4NanPruaxs0TRqU=
X-Gm-Gg: AYBFou1iCTWlKXfuSobobjbWT5PZwzz0ducv9gouytes/aHS+6uRkMjod9xNpAbO6NX
 qSco1IUU0Vtjs7Xm3XC6fTQXy3nBDsN0Kqug0PgVCPf+SdIobg0fPt5UJqjjRpTaslQy4galuif
 y8Aq690z1uY+74EDxkGHjzyKDWPImdkgoK6UYwwFvT5DCuvMEAEHwiEvDjDoSTjtT56SJQ8cM28
 Mp2mFtCeeAFj27pQWJdVxwqI1OV7KkM8/ytWv7oC0Hg768k8UUmGqYDQETeJZOlT21KlVQvghz5
 Wmb1W6fi3bGq3mJgL6nHEFFyWUNYBah5LMVQZfeMH8qTql3xFNN4unoB/n4O9dmUknB4K4MYobM
 Z3t7PbKT/xh7M4kvamIqHcpAz0+O9DmLVs1H3rlgW
X-Received: by 2002:a05:6102:8482:20b0:7a7:a382:6bd7 with SMTP id
 ada2fe7eead31-7a7a3828422mr5081697137.27.1790095868442; 
 Tue, 22 Sep 2026 09:51:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8482:20b0:7a7:a382:6bd7 with SMTP id
 ada2fe7eead31-7a7a3828422mr5081642137.27.1790095867901; 
 Tue, 22 Sep 2026 09:51:07 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1c159esm3813515e9.4.2026.09.22.09.51.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:51:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 12/17] target/arm: Split leaving-halt handling from
 arm_cpu_exec_halt()
Date: Tue, 22 Sep 2026 18:49:30 +0200
Message-ID: <20260922164936.15189-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gbMXXMknuTy8UF_vPhHxCMY6TVFIRHpu
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2b1fd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=snbnvTbt-5-dSQZ-83gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX8dH4bgeOTn13
 gRwFfJE8XIvljQulpcsoGI3Q+clr/V3oFwunbYYmc4zxNFw2RFABBEUsR8cEjMYJzT+owCm14B+
 9vvA0rxqcekC9vwCC5rn/Snn1cCTGwHQyrhKYSo/GH9fxDG8iiUd604R6LHTRDrPIPMJvk/1u4J
 VyEBfRrU6BWdNKraQcXfDy667MO4lLovPs+nChr/wiJPer4V+z8Y4blQQnCIvG4qnKRtAH73uH9
 OG0fiUS99FjEbedQsAZx6znb18+UA5yPmPS+Y/jGANb86+siQypeJ0NX47NSLg5v5qQ2eXyooLy
 gRkT+VE/5tS9cmtTCf/0GDkxHwHnrgvAK9vmwUdEnCCMekhcNCcqrJIQe3ak4c7wBkxB4HXMHAZ
 p2fWXk/etoA4RojOajLVHSiUa5SwopcrQfJLeXgQ5pxU+SmxvqeULWchTntkQKo+9iUbFrCxoUA
 z5omgiTxK8beuishgog==
X-Proofpoint-ORIG-GUID: gbMXXMknuTy8UF_vPhHxCMY6TVFIRHpu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX2AUnLJy/+qQ6
 EwbNvsbBcugIbhEMURmZy1wBpTFea6T6Wjt4kJg9jXhL4nNXrRHXltUetVYPyhh1vljIaHbeYEQ
 HmDpUrTDh1Tb6jCgVJ2+LJ242NmOBxM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
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

Move WFxT timer cleanup and halt-reason reset into
arm_cpu_leaving_halt(). Keep arm_cpu_exec_halt()
focused on deciding whether the CPU can leave the
halted state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ccc6630026c..4863e7cd450 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -872,18 +872,24 @@ static bool arm_cpu_internal_is_big_endian(CPUState *cs)
 }
 
 #ifdef CONFIG_TCG
+static void arm_cpu_leaving_halt(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /* We're about to come out of WFI/WFE: disable the WFxT timer */
+    if (cpu->wfxt_timer) {
+        timer_del(cpu->wfxt_timer);
+    }
+    /* clear the halt reason */
+    cpu->env.halt_reason = NOT_HALTED;
+}
+
 bool arm_cpu_exec_halt(CPUState *cs)
 {
     bool leave_halt = cpu_has_work(cs);
 
     if (leave_halt) {
-        /* We're about to come out of WFI/WFE: disable the WFxT timer */
-        ARMCPU *cpu = ARM_CPU(cs);
-        if (cpu->wfxt_timer) {
-            timer_del(cpu->wfxt_timer);
-        }
-        /* clear the halt reason */
-        cpu->env.halt_reason = NOT_HALTED;
+        arm_cpu_leaving_halt(cs);
     }
     return leave_halt;
 }
-- 
2.53.0


