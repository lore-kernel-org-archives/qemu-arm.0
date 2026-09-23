Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272EBC9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:13:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9QVw-0003l2-BD; Wed, 23 Sep 2026 13:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVv-0003j8-2p
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:12:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVt-00015T-Im
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:12:10 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTh0V596139
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NsAGRdq+9vptvPtJkbZuTIe/H9s+dn5Lcf3IVJFeHdY=; b=LgEORBPwh729Uug4
 6YleYsrEZ3iYuhpUzOS7iGcHLk8nrtr8qe2YuKlBeul0HlafiwHccFORvCTEcw2j
 uy+v7oT5XxL+8hoZDvOP/4KNz0LB26mogPO4IH7Rvvivq15bX+SA3xBwGdhcwApr
 GmTaG68CNUkdRuHm+GJoEGy0F211KgT69CePWgwrpBbZvZ0vBkEH3D0dHv6K+yPy
 xeOgRr1EJSZzvOKi4gq/HsZViexaPisK+s96OOarvhFDPpGkWHc32FOdwq3Y0M7d
 eRuMdTDmV35yYT5irAPlKc2L/aDLsTD+UUiSvkJ28sAJM75swwx8vhRguCcj/wcI
 pbXVGA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3bq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:11:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7930cb5cd3aso972019137.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183517; x=1790788317; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NsAGRdq+9vptvPtJkbZuTIe/H9s+dn5Lcf3IVJFeHdY=;
 b=M0hc+/9Sr64GmyB2T7v9vpFgIWrrHHPAHOoJl4NF7ETHYjftTWgte49ZS/qpRmyxn3
 NDqs1pzTazckciJ7ulVswzlFig+ceRxSh/gHsY11HPVrZrUB/c/rJEtF1MJ+BjHjC+D8
 GCenNHmy3XrOGe9ZndDLNZ4Z+oKlyDyFFA/42vvjkm16Iy3g9yFb5fq8jeKHy5xGQBQb
 MrVwGqyMh2Dxg2YmweaJwkw3DMfKn6JH5SZlWRy/3w+ED7Ew0WDUHVX/E5pahW3mdpGX
 oUfOlK4NlA917lmakVlmW5I2DiQVBqIx2i1f9IsQ5Zodz6W6Qj5d1MNh8NATXVyC1sM5
 jq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183517; x=1790788317;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NsAGRdq+9vptvPtJkbZuTIe/H9s+dn5Lcf3IVJFeHdY=;
 b=IOPMznQIiT1iKATM78xvfWXyGow9gTk04NpvzBfpKVvvCHo93ghrargcifgs+TAN6S
 QnJ3IEGJy/Ksmtv+yDoZmC8lOUVJ5HrA2psaxrYOzJzh4GJeAkUHpKz6DXSHAE8ecnPs
 Ri1ZvzxWpv6syuO+/NuCiZTJEuthZ2+CbKwrKOuZ00U7GrCPmcZI7RS0CIk0fy+obpVg
 dN8Ldx/NIdRgRj7/hm9IMp+15/gdJq7i1RhscEeX90OdPZjD5m/KDKAg77bpADUqd8Po
 66AtWkh5QmgPL2ZEAkg4FhE3zzLroGU5ad8Xlv2UymWKIvpqAkKfz1og5d7R6pFI7mAr
 mc4Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6THHKV+9/JV7ATvRgVrX7t31iU9eZj4cAycxZpKpu97AmMcjGwFf6JmYHppq50kSYMQigTsSr/Q==@nongnu.org
X-Gm-Message-State: AFuF++mEtkg9Jzb68d8aGc3LrNY8ACumzZH0B/8fE80iaVol/oVnTnXL
 Yc985qL6lekRCaJ+7ZjgFrajJs9setZAGNKklOmjkJSSBRuYU0+fqOGJ4MpRUsMZEf9Aa0CTSyh
 E1RpFuYd6R4RCZyzFnJbh8eK9g8xp4lDgOy9WuDN+vF7D3BpWQ61Ksf0=
X-Gm-Gg: AYBFou088hdY1+mXYk/oR0anpzmWyfc2l1E4pWU8nUraHwj9NwZGsA+REvCR7JWj3NS
 4mqfYcrKISXpPvaCyDm/RVU4Ox+HcRAfpgRUcUEDthbqaKvFaOfr2sDWiAZgf87TAbTHkF/PUb6
 vBMbbOeoNVX0F9lUH5fRytzSD5TBBMQRhTMQzMnlbt33vtxBSFQlCRW0V3cnvT3LU5qml6TB23/
 QHeDfHn0QyK2ZVNNjCrBwu7TKVEdtMgOLljtsIwdV1l3qyP6PWuYLvWdRJJai/9vbBdrB0U9UKv
 qbXvd1rOA4ogzQdmxtSHiOzzEREGhp7g2nnY6JLa1XByCNEh8KvnvGJJ38N6GcQ+QpDgBaxb5ig
 ms2KUlF5wQvAhHNq5EK/xg4n2d4GSWRrA4g8nicue
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr3177267137.9.1790183517144; 
 Wed, 23 Sep 2026 10:11:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr3177255137.9.1790183516625; 
 Wed, 23 Sep 2026 10:11:56 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdf158147sm66316385e9.0.2026.09.23.10.11.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH v3 05/21] target/s390x: Access S390CpuState atomically
Date: Wed, 23 Sep 2026 19:10:59 +0200
Message-ID: <20260923171116.31276-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jwY46WFzYB7WkOrr08usIVuzBk1imFAp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0A4X0/Gel59S
 Fbj72Jly33oCbpqEt9bUpdpXBBsQFV5i5HvPIQ5IxrQErjQi00B1S5jLx2S2oG23Eg6CC9+xjlR
 7wPCXsVnZNtER1Hk+eNYU53LXQVmMiXH8AZtrh/LfgEjJpESkenxzEZq/mr7crcd+YHbDllqAa2
 BcEgp3GLKlbRw1rsTUl8YjNRAUp85gz0Y6X+2nO4pGzPReizPQSbHkMwkWcV4ZHCRKk9f+WHs+s
 Ii9vMZjJA3123nZXS9bdo564mi3TL00U9AyqZNIegem81OdF6nxR+hLNkOJJASqA9pDfVLfo2tq
 B8VyyToDl2D1BURynsuzRgK2Dcmul1zTyQQqATliSA2I7uXNtnmX/9QV0+6tvXSreXa0F809SPS
 7ez3UZJcX+nWFBfuzbG+cBR4Na102meAO5pWGx6NZXOf636rlOuSirIW7tlmfiDWYj1Hv4jUtbH
 Sr7fvi0TK08km2LituA==
X-Proofpoint-GUID: jwY46WFzYB7WkOrr08usIVuzBk1imFAp
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4085e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=jkZ4ftcXAbePN3d4lLkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0GqCeuQcWF04
 gDX8hJDHhMxsqfrJJ2m7rby7/9IljpYqeVByO3AmqfGehN7i+25HGYNIdblGX7h1WfDw8gWT/Uo
 beSaLZjuVXDpeXT0XYvy2Y0YVda+RVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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

Use qatomic_read/set() in the S390 CPU state accessors.
This avoids non-atomic reads in s390_cpu_has_work().

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu.h        | 2 +-
 target/s390x/cpu-system.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index bf9f6ed1de2..ef73b15218e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -855,7 +855,7 @@ static inline void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu)
 #endif /* CONFIG_USER_ONLY */
 static inline S390CpuState s390_cpu_get_state(const S390CPU *cpu)
 {
-    return cpu->env.cpu_state;
+    return qatomic_read(&cpu->env.cpu_state);
 }
 
 
diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index fffac09f241..d38de4fea2b 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -272,7 +272,7 @@ void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu)
     if (kvm_enabled() && s390_cpu_get_state(cpu) != cpu_state) {
         kvm_s390_set_cpu_state(cpu, cpu_state);
     }
-    cpu->env.cpu_state = cpu_state;
+    qatomic_set(&cpu->env.cpu_state, cpu_state);
 }
 
 void s390_cmma_reset(void)
-- 
2.53.0


