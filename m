Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E868C5DF69
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:20:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wua1J-0004fT-0J; Thu, 13 Aug 2026 14:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0s-00035B-GC
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0n-0002Gy-7n
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:18:44 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DH8K033052591
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eCWTqwclBlLHkStMtx+d8TC5Wvr713M4u6l2TBYeh3s=; b=hQBuqPujzsXhPNrS
 uAWc9ffvY5FWr5MT45GSB+SH5TWqtHiKgCTMt6ZSI4ThqcuefaLdsLMoHYwltHmw
 cBl+H6mky0H7pf22b72/ipbpsibziJ3AHjAfA3Mbjr0+m3znb6E+57sFnSuAd0AS
 5EHRT7nY6aFCiUwHbRRHRUWxfRa8utRK7ChqbLqrCkg92BdtkM3p2uJHUlAPm2r1
 tTb3rVNECxDIcg057QwM9Bjxbtsz/o9ZDwsCWIKBMW37aVxaFKYLEhkUew73phCQ
 9cCFIJgtVjvMVYAmtJYnyebQUnty87t7SoSIiuKBPGelDhT4DTV+YfeYE+zFpZx9
 ljmTCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f0a29-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:18:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c07f25de2so1994491cf.3
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645106; x=1787249906; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=eCWTqwclBlLHkStMtx+d8TC5Wvr713M4u6l2TBYeh3s=;
 b=f2xlNrj+hVZsrjLcnauVbHFhgVSh/6HbcWWFcqgpjvaIp6HzW+YXFKHzBQ7ka5lHt9
 UQHhKcrkk2QFKokvF/ou7vCuv09+o11+II35XLi6RFmFT3pjJunp5FiYBca2m1xp98bB
 hFIWnO097Fls0JQTtUP/bC3uMJS9l3NpxaF/lMPhTMxJ3po0joXH3NtWtjlS766dkyJ5
 y3XTReFHmmfE3j/ks9BI4DQBKvU7uyEdxk/rZnCazxzD/Q0vUp/JYgG2/dVIY6Jq/g1N
 S4P/yiLCyZ9FplnTYPJvAK/NFb9nnjSIVfGRe1s1HSFG2sV83YyFGbtBgzUlzuy7+yco
 wG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645106; x=1787249906;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eCWTqwclBlLHkStMtx+d8TC5Wvr713M4u6l2TBYeh3s=;
 b=ewnWgCUPpw+lSv4qTGwi8YKWez16Vp9JT02PXipXdrMiWBAIPidXLRpJ+BZqwHMVR2
 Vch4N6St0aRz+6XhrOEsQ55cOrREgaCMgtdmp8GH4VSx92voTpO0J82ngHEvL60u7q76
 dk18VGm/okL4Cjf6xUD+Udkr81plSprRL5jOs4/gHUwSU3lTkWhn0b32RXCXESHH/4bm
 HjipJf8jVWDl4vx0i5Nv/xlctsJULOrvaTb2beMi8Lfv5LpXmRoXY+D08ffV9emCzhXg
 nfngsbSDYGB6X+avP1C+wNDDsukVOW45r0GMzvTtEPTrS5d9lF3udaTyaLpHEmf/5iG+
 VxoA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrs1oKcOTdIm+IXzsohOKk8+pEECuSzC236+5Y0eSM/otZ/gDEs+gQ7f+02/+Qw7yabD/eFkDlsHw==@nongnu.org
X-Gm-Message-State: AOJu0YzOZp9oaU7npyNnguKWC5T/QyuiCfI0eMgWvc6RLNWp6rTr9CNu
 HRyWthAQsjJTxT5JPxsXgiw7PSlzqDedJD2K82cHG31RzvUk4XvI/nXF6Z9YOOcM4+KmuQEjywC
 jl3vLlN3JqgVTx1ZYAikS/c9Y2wHUJckpsomdXYUQed/fdRrz00Fg7o4=
X-Gm-Gg: AR+sD106Cq0/YgsiZW8Rxn3cJXbr30gxkvC8DpsZZ2tk94mlGhnswy3yYbbT/yyvmbL
 4zMqmWSEPJCiekhH18walraDInRBqrRCNlmkhMLRUlaNrkppuuiKE7+jqxMS4DUDM7VuJSlrAO3
 IxzFQ8eFOzSF6VmxG7hlnz4z29p6sPxOTLvy4Qv/uyAD+qymNR/89uvQ+nRG93wHDv3TXSWe760
 MdYCBJ7Zaa1LuJ8cL+wvPo7SQQinrbVvmXDZmSd/qxhFFDs/XilHAZ2EYpZu7O+UUpsX2cuhabt
 ocw9NtfR6TtzQORBtil9iVL3RbO4A9tJ3rwR3Ql3QbhZnttQFk2JbPhzbEjpuf4P/EQAcABz8Q4
 3sahatUHBWD4A6j1b1x+7wTJuw24GO9/igBiWcnn6dQ==
X-Received: by 2002:a05:622a:13c9:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52d73c9a46emr78211821cf.19.1786645106188; 
 Thu, 13 Aug 2026 11:18:26 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52d73c9a46emr78211021cf.19.1786645105711; 
 Thu, 13 Aug 2026 11:18:25 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f200752sm1254325f8f.1.2026.08.13.11.18.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 14/16] target/i386/hvf: Lock BQL outside of the vCPU inner
 execution loop
Date: Thu, 13 Aug 2026 20:16:37 +0200
Message-ID: <20260813181640.6537-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7e0a73 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=k2pNA5m5VJBtx192dGAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9aMIXm65AWd6U3OOxFS68rJbfi4FzfoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX46hVidPbsL/i
 HDnGUU2qVv9Ke/4tIiYVhziTCsrkC5MWf+l/89f/pnb98/61gRwe9wut9imSCbI0OBTfQq5GOxa
 tRA78oP7YgzO8EQgj8ChonjtpOXJA1OVFiprvZbMFt8J2mFz7TpOpanuDgyzfd/l0UZId7RGaaZ
 Kdw/wLVmiRYHAeUdwkVR3itAN78w1c2DgfSYSR2hFqTMiRS4HANo5DVDpJ7pzA+mCWNNG2e8iQ0
 SFRhr/olLP3kk54Pi8UJqyd/EtmRrRtcGbXojqROYcIDaW/VMvbhmwFD7hKQ18Jf49oDVCZnfnk
 wsWzjb9Gw9pxOM3q3i+d1hEVnwL7m5pqEsexpZtU7+Rtdp3j8M/d/WIxTur+pUxZhnxRr3uOqqm
 OsQ3bhnm0iVk2JS3FTvRMA/OddnYCc5ZQUfS7g2jEnfo8qWzxPw9wTwo5t+grk4zBZ5n9l/nYjg
 qNVjwR1Dl9CSh1jiLyw==
X-Proofpoint-ORIG-GUID: 9aMIXm65AWd6U3OOxFS68rJbfi4FzfoY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX0pe5ZgioRUos
 jdf9blEfqH+yFQpC+MpT/sPBGO4VgzKh/5C35eU+oEgy57CGe4jfrEwKjuQQOuA38BvGZrsDdCi
 xmU/jpHIZLPcvbP1jDKxDwS4Hwwakvk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

Reduce lock contention by acquiring / releasing the BQL
outside of the entire vCPU inner loop.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/hvf/hvf.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 0ffa3658dc5..f8bc01d38d3 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -1009,6 +1009,9 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         return EXCP_HLT;
     }
 
+    bql_unlock();
+    cpu_exec_start(cpu);
+
     /* Inner vCPU loop */
     do {
         if (cpu->vcpu_dirty) {
@@ -1017,26 +1020,26 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         }
 
         if (hvf_inject_interrupts(cpu)) {
-            return EXCP_INTERRUPT;
+            ret = EXCP_INTERRUPT;
+            break;
         }
+
         vmx_update_tpr(cpu);
 
-        bql_unlock();
         if (!cpu_is_bsp(X86_CPU(cpu)) && cpu->halted) {
-            bql_lock();
-            return EXCP_HLT;
+            ret = EXCP_HLT;
+            break;
         }
 
-        cpu_exec_start(cpu);
-
         hv_return_t r = hv_vcpu_run_until(cpu->accel->fd, HV_DEADLINE_FOREVER);
         assert_hvf_ok(r);
 
-        cpu_exec_end(cpu);
-
         ret = hvf_handle_vmexit(cpu);
     } while (ret == 0);
 
+    cpu_exec_end(cpu);
+    bql_lock();
+
     return ret;
 }
 
-- 
2.53.0


