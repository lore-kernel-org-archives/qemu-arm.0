Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA36DC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:57:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LCX-0003Eq-Iz; Tue, 01 Sep 2026 05:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCU-00035h-Vj
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCS-0007jn-Qn
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:42 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179QFS2321978
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=j1gbCTFs2ME0NHR1
 Si5sv9yxeLr+CCCzcdAu3+E7CiByFObb0fVykdr1nbk1tl4qDyNHF2qWGEOXnfS6
 CNi2QS1pFoA+X2dmyy2PsITZ5/0cft5MCV5XzDoSBWE2dkcB4PUv1Jk0mXASbyrA
 3XKNLcnEl6z5RXxIJ1zCV8z1xIvsLfcS198DezgOgXNJP3Ur+fRmv/lByQIzBjbd
 qGoNbH9nO1WLF4WDNp2vdXSm1ezAOhE359N2geJ7wTVNuH1DqAOPpzB5mkOcvie8
 yBcIPMs0dfx7AV57BP/g5CVZNNrF+TjiNOPlQ7wFto5pTMZ5HJ8y3rRNw8qShaQZ
 18iF9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbap3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93903982af1so1056199585a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256478; x=1788861278; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=gT3bH+bz/qkVDvm2iZ7Q96wE7aHEUrget+3hmn3hHVfZ28+NmRVcJ2WABcQJKSGY14
 e7xmUOR3pD0mDNLWK6KPsSH1VIOXoJSC3xgJyZyubbJJLO6+MCAYPbOMYRJTRLQ43h7g
 f8wY14uTRfN95mGhLt/CXVjflGJ/pTr/ZdQtS6MiAM3taNfVX7Tzdshe7cyagu1lN8+I
 5YPs9hTXIriEuBvrRva5bE5gKs4JOrFe8rngegFLz3DrNGzw8jMQAFx2I/gb7+agEJv1
 /rjGZv43EK7lktgJpjQBfemCX34OBa33q2YF2Y89LK68SJ4eyN/sIHitpu0M+qs7rxbS
 QiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256478; x=1788861278;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=ShA9IRh9DmfD7ooMk4cALQU0k5fAbj5l17q70K0yEpSs8C5rwrc4h2mgftvDVk+vng
 KDteXCX+Ti0jrRhMAHQrr6IIIKjzE+mONFzUG+SG0fm6KRc82W1KHfc47rM6TIOUwFYA
 xRRvJdkyonUBfBwYSc5BIVtchvOMRK691vNJRm5wp08ncd//IJhaxxhtZmdtJScKLdq4
 8oemMgLJUO2Z0SgG5f18PHBGn3jpnUgy5+nA1lKUeNmywGth33b15JKInE37DXVMMcyB
 zDcwr/ui3uvU+86LNjuvO+TKVXu1qD2fLlMsq0y3/sLGbaSI3L8Hq5lZhzUH3I7qlLYm
 UpNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrMnw6Gx1Gce1r7BwewgbNJ+e99M19UsqhKK2M2i15mP167YIPyBA6FcF9he5iOC/jks5GR5O/1GA==@nongnu.org
X-Gm-Message-State: AFuF++mLzcOzj0lufsSA4mW618Oyizvr7tDdHr0jmWNEI8f0KsQ8lnGB
 Hzlpuux/lrFl8Es/XwfIKbZBpKKbyaW9Dr6jh3AWRO/YkWSFYgNEJJuSxLTErDyoK60Xe8tObvu
 I02KUfF531A0pAOg0cC7GE9FVCUwFr966iPsgxIeEXaiNcFTjG95T89w=
X-Gm-Gg: AR+sD132py0eCYSqs04vZGjphd+u56rk239y1KhGDtXbPpv7N+Pd1qAnG8l2DBQDwxw
 cGFLleIsmWKhGWh+6XfSPtX90E5C6kTIA8A2ktVey0fVOVnEb/CpxSktNW8Wh58sHm+SS45d7wQ
 G2PGPEdmJ5EYQO/QsAlgwz82NQ4qI62+m2n0DWeWbMgrgrPWbo8TMZ+tYjysAKzmoEMbzx0bO/x
 j7BAZEPVCbvsIInRrTnVhCxpEDD7WI14tiQnjPcI8v7LHnWrSQuXbZmUIuXLIAleiTkr/Y8pUtP
 BH3F6cDBkmjoQXH3IimEfJZLrefGLZ8eGDoml53DXaeyfLP2SebSQvFS9R2/rkxWUtCm6ALJHzi
 1OJOSl8mxQq/NeoGsyJe22n2YMC62wXuPf2GCfdjl
X-Received: by 2002:a05:620a:3c96:b0:937:690d:a37c with SMTP id
 af79cd13be357-939137b46a8mr2623263985a.3.1788256477739; 
 Tue, 01 Sep 2026 02:54:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3c96:b0:937:690d:a37c with SMTP id
 af79cd13be357-939137b46a8mr2623260285a.3.1788256477167; 
 Tue, 01 Sep 2026 02:54:37 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1e1ebsm56936285e9.14.2026.09.01.02.54.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v5 17/21] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Tue,  1 Sep 2026 11:52:23 +0200
Message-ID: <20260901095229.72018-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aOqDCB1rwbIKqA44q4-WOu_OWjbkwVZx
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96a0de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aOqDCB1rwbIKqA44q4-WOu_OWjbkwVZx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX3U9wNk0UZ2OF
 0ZNNV+BCGJC+Jkt7g36jPeKtPpR12kljbdWAALqJCV41YbGUkPwnYHCfAVC0TUhcpjTypZQSCbX
 diHmRhe2hh4K0E7IHIc9nVeuiPEOsi8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXyjfFhQX/0b8G
 OEGMfZTg7sw+9RiZRCw5abyi60Amps2/wyA46QveAqviCfEmqV7MogA/LjAg1FsDc1IzFdYFKbH
 a3QNp90W10S/lBhuNFj9d6Pq4Tq8Wga1JZBeJoHkwowuVFByRZZYZOFZ9kG0q1VMVSA7YtPabeN
 2vWCrKX14yA5BaF4OWL7bJshPMa1KeWYeZ9lsXY47WsIB78+4CGKWrVUspsPYpIyqejxE3uNAjk
 vSr+PquHdh/hg22hMbGWh7sPC8CNQiB+Z27gt1tVF9w6N+p+EM72dDoBvI6KIqaPGU+gzNSQ6k2
 XdbK1PRfHq8+v4rJMOkayHKRu9uqL0Rv+/BSC2TRDaqF8O8D7DmnRwBzi1GJ7xxMCHct1/aZbZP
 5e6GDZYFTzYzgtF6zZkssQBuuqPWIA9eB8qtJ07yfUbODn0n/utRv1p7LpBqmtVyMKnK6Th/tlt
 IjWvvPQgW84V7PuZJDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087
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

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


