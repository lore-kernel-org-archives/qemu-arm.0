Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE32CCA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 17:51:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBySX-0002TX-OL; Wed, 30 Sep 2026 13:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRn-0001oz-G1
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByRl-0001We-M7
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 13:50:27 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHeiYN4160500
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3ITDVxMKQyrvO/cJ01b1Bv1m3X4CEZI3TJHmNI/NA9U=; b=eT4e0g3F9F2/lnef
 Gay76jl0OWK+Mb6RtFekfmi+U4/fOsnjfLfjL2bconqtQtAjJ8xtN+HCwPo2EQ9Y
 Stbyd5kV0jnib8g4aDt7+kG1KLMz+pHDdUJjN1/0lKxPqcVLPGlm3X9EFNt0vXjT
 oMSNSF7Jkw+oD727t0cLH+qA2a7wuixdOZd08vdvkt/gVzsp041Jx+5Pn7C/nYSH
 bpvsDO930ovFAWNk8Vo6hwE43E1Vr9kquyQgiUkHao18kbXK3pqCrO6aBU+wgSNo
 SeEnrqI4YJEQ4yUIjVxKUJ/3b1A4cdgTEpDT7lVV8Z7fgmF2w7DQP9uNo39iB+EM
 Lc9WuA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pgax8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 17:50:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7bf853be08eso30467137.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790624; x=1791395424; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3ITDVxMKQyrvO/cJ01b1Bv1m3X4CEZI3TJHmNI/NA9U=;
 b=KZey0DFFLmtJS0BhIP9uYDHiXLKVOthaoIl2XEiu8otgPYuOZYNs6TdzAgB/nGI2Vs
 N8DpH7Ncphz4cQ0LXt8qtQjX8ljirQVKYE8Uchwf+R3kyP4LLm0kTGH5PrPnYZCZoEXl
 H46eHK3OLX+fOO87u7cQ6B4bFqlOUMdbkPSSlfnjI+VqgnUdoCH7GyiDIJRQ4M160rsl
 rKRfm0dV++bMS1MzCQmx60L+8gUwbYdzapo2M/Z7uLq9PnVHS5axPERkgtjXgSyKbUPq
 ET5cQz9byon30bhu6J/pLZgaC3vFgMoAh6e26uieQWfQY80JJ6N0/IYMWqwySBkHnOr5
 PBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790624; x=1791395424;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3ITDVxMKQyrvO/cJ01b1Bv1m3X4CEZI3TJHmNI/NA9U=;
 b=CHX2/+5Ol7b47hwiKgXU121cmDiO27OIY3zxKYpLcEHNQlgq7TNF4WrCAkBpOUbxrT
 dlgAwlNL5k7ViDJkbFEq7PtHrUPr8t+vdw6OWIQi8TVFQTfWU7SG+DtB5cUdBU8d/PGS
 m8fKX4PW5IFxfljuDcAdclIp2PvHRP6pyaekFqNUkRtTpjYgjcfSYDMdytTHDpcyGaV5
 IrWt901/xb9nnETfookNWqemV0BkQQM+8cjwMaIQT6B6Ge/D7y808f8qF6b7/liEYSJq
 WQg3b1zfd4WMenzDI44/W0s2mm5GSowDDj5b/fgAZfbzVfwU5B4SNiamxeEPhct30FMD
 Nzyg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxEe/mWKkTUpC41zt2Y4uhwpjRiSIxDSg2OzQNRt0DDzgWX1tibRRKFUUQxEV5Wch7DQpWbX+uFeA==@nongnu.org
X-Gm-Message-State: AFq9FYI83VE6Oz3su6EHdrj4WAwic5EtCDxb2TIpt01wI7JJtJ1g/tfF
 dJC26krE9NRqEslOQQGazwLiKAGALfOtKThCI+qXuvtRnIXLHt/dKkyPam+DeMzxQNf7NnoIi/z
 UOn2rb0/jEpjsQQaP5y8f1x/2Mc3LW/ej+HD8ZtQ9RjsLL8JpsivthUrww2SHBmE=
X-Gm-Gg: AYBFou1tbqJUl+CyK2Dh0V7owDWRtIS7a5RtveoJmaGQ5DGG4q+k6CCyqT0WdMgcE2l
 XmZFCiNK7crlDtdjg+F87r+dKg7R/6P0KLeJc5to5VKB4nEV+9gJ0onNkqllZYpPNiBf1GFKn0X
 2M3m7aTq+7XhcMFU320HmRel2kCWGkK+oUSFnhdibFWgH4Ed/GXr94T1OFr8yF8td2zX50xOpMC
 OA6IV5+GlmTOQ5G9fJJDZg1rQHnJvBfGHmZQU8LSCKHhmxGYU1bLL4zwntVNIcZIYJreEoTjHJO
 UU2d4uNBzrYilkN/blK2R+MPqUvvHo4Z2D/in7gYExSqnAhrg86hnbMaD92POqFjoY3vIUX/A5c
 SzOTRyrH9xvWhTU87dKXECu6OiR3zNd+rZlPpkCeq
X-Received: by 2002:a05:6102:54a7:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7be724b9384mr554129137.8.1790790624134; 
 Wed, 30 Sep 2026 10:50:24 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7be724b9384mr554116137.8.1790790623690; 
 Wed, 30 Sep 2026 10:50:23 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01ef9b9e3sm5652445e9.2.2026.09.30.10.50.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:50:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 5/9] target/i386: Split APIC polling from
 x86_cpu_exec_halt()
Date: Wed, 30 Sep 2026 19:49:41 +0200
Message-ID: <20260930174946.82195-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Eruj4amsQzEkAhIFoC7JCZLGQeji0b8k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX2JcldTI4yZ2K
 dLFnkg2bi+W5VMiCZVxR4WNOh9jdbtvePkKbpyinHMNz5NrGfsPFRT4apEj9mwQ/VMSLBwnOuBJ
 PB/TCcDdqrvGXT1botlFWhf8aCNpwrw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MSBTYWx0ZWRfX3FgVm+6co7vj
 ZO4hJbXREHfZFhgcYWIS4WFfM0ko24Kr75pCxtKw2Io0ekxqRLR9BbyBIcGuQt2Plzg7Z4hlSAy
 h4Fb8GUnY819DcJie7vh+BB/rREzzl+5waHnWJdmFZ0fr5J+XzTOzMcRGLWJYW2HjnzLEWam/fL
 JkNb36xwLuxyaKqu1icQmvLUkDc0ugiuhl2FHBvXE2BOkREX49gMMXX4D4n9G6C0mb74OuFN2AS
 P91v2kNWFRDsLQo3OP3PRIY1WKY3mpgz5tTuDQTaQcNW07MSpvmb3JEXS269tNjlY7l/M9gkN/V
 gRZHYV8Oe6fu4fVFdjWdeBNsCSHDAOgOP9TnoCVlOAklX6cV2bFdLL9KYOCOfBYmXcEPXtf+jmK
 VxjbBpl8DdUwhDKvqfENrriE5anLbQxwfyFWxXPjkkiDT0oA9gynkzhdbscaJBStD4CaaT18m9u
 sBKCL5iN4DSi5s5BWtg==
X-Proofpoint-GUID: Eruj4amsQzEkAhIFoC7JCZLGQeji0b8k
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abd4be0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=h7OMh5kjI76PbTVxvEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300071
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Move APIC polling into x86_cpu_poll_during_halt() while
keeping the remaining halt handling in x86_cpu_exec_halt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 +
 target/i386/tcg/system/seg_helper.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index f4b2ff740d5..58e8ca0bc1b 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -37,6 +37,7 @@
  */
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
+void x86_cpu_poll_during_halt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 8c7856be81e..9ce608a0bb7 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -128,10 +128,9 @@ void x86_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
+void x86_cpu_poll_during_halt(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
 
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_POLL)) {
         bql_lock();
@@ -139,6 +138,14 @@ bool x86_cpu_exec_halt(CPUState *cpu)
         cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
         bql_unlock();
     }
+}
+
+bool x86_cpu_exec_halt(CPUState *cpu)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+
+    x86_cpu_poll_during_halt(cpu);
 
     if (!cpu_has_work(cpu)) {
         return false;
-- 
2.55.0


