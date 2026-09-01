Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8521DC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LBf-0000f4-8G; Tue, 01 Sep 2026 05:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBd-0000Yg-Vq
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBc-0007cK-3w
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681794pc2974638
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wc0yFFveao/k/OMW8MeygH5JlbqUOVDVNRms4LgrmoE=; b=J/Ejx8PBip6d3uVC
 bAl/e3gbr6I3UIHQefUlGm2LCvPuyBfK+N2hQ201nBCwZvPnzViZa49qRnWXJOu3
 xh21bzKc7crPbFOwKpq6PQFpQhA5smD6Fh9ZJa5kFOFKz1tDX2KwJ/Oc+TLt3Ruc
 mYWdOtdIn/AZGrKSa0/djEJUJw/KgVFShg66Y41bOz9B5OWIfnTYIFTBWtHhsJaX
 P5mN3HGRin2/GQ9YMCCrxJQ1WYaCSkX8i/qbQ/Soit4Y17d2k7ma9ZpAjI3GRuHI
 Ix/s/1wnh4S0r8d1/1sFPoLWZf1o7ON4Ldqwuo7CJRIHS/l9QhngUZAGWCS8sH2w
 UI/KOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0u6m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:53:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9308eafb465so1132907785a.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256426; x=1788861226; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wc0yFFveao/k/OMW8MeygH5JlbqUOVDVNRms4LgrmoE=;
 b=ABZQLKVBaIPYnj4yIxk2tLRZKw6ebZixXhfYeWfxXkbDhlJHQgsdl5maYzZnFGmExB
 vtqDsa2cd23B5BJa+LJ6qiJpZjeH6+WztkVfIymCpNrYghT/qwujIhQkysH0y6P0vScX
 U0ph75lqCOGMsk8awEkLs0WmcJSbE67Vd0nVVn31lcp3WsghDjOVHaqq3yvL5XlTVP5X
 /V9EwxTJNBbgPGo+BiOyw0+KvCsCuUs+3KqRQQWEd6E7IDOWt1oLUQVjWhbwlNU6LbFR
 xhhbKNfbWILCgKXIYjjYDxl2q3AFAdSZEF46T8aykV+KjX1DCi4kx3Ygt1EtC0jQCKLD
 khYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256426; x=1788861226;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wc0yFFveao/k/OMW8MeygH5JlbqUOVDVNRms4LgrmoE=;
 b=tEWyOq+xyhtYBhN+tldhGhQomD5XJbzcShYJYdMsq32xPPh79G2UZOWqJXegJY/666
 KoY9EFQVwIsdGPxcZZWqcAH6E1TJIlxCpLEuQvx3bXHUhYjHiRIFNJzdpcI2pNDSsCt1
 aYCMFoyPhIY1EmRAVhmbXKl1Vi00dzcILf2/q8LkV+2GpLmx0uh/r6jT8L//SFN+Pb7l
 XX67usZV0G9oVTJUet4PIUUs1czHUZkFy3vRQVlGwZfaaFfT8J3RA6KKIgt7xMDCtWpk
 I7fSJjzQkOL2fPYfw/oHMNGtLQG50CtzUdzZCUDZ/j5DT8yUtYG/OgC5FreykVeWUoYn
 mbhg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpP6hsMu/I9RMVaPVDJtfC1b73xlK5CNEeR8s/dXGKgGaGOk+Z1jos/k8Ad3/gKvn4lbD1fH5oIDg==@nongnu.org
X-Gm-Message-State: AFuF++kgczZ1WWaW4LcnBSQs3gcH+dln3PrfeiYWsQVsxnB0RPChD+pT
 JKYCUqmNimbH1W3clsSinh+HARsi4fQSGuhYlTUTsNfMlgFNRlzGTZ91+H+IhmScGvcOy5l+aAl
 GUf08s/BaWTNFib0GRAEjdUbJ0YE0TTDzZ/W7sgf8oulyrOIve8AmKvtjDZBtuSA=
X-Gm-Gg: AR+sD10CigCYE5W3jrD/gexiN+bVDAEwgaHuZDUy5pOKy9hzPjPdOTDFtoFtUdLtbCi
 Wrbe918W/1nSS87fJnigvHbFodzdErmkYLV3CsbQx+PAN3s5C+auzhM3djALK6KvQ0OXdisba7s
 aefqjtRFKUl8JnXHMFepCxAOyPV5CFlNFy5qVvQWExNvwMxO34Pf9zdJba9QjqTnAJfQf6NbLNv
 hQx1f7wwvVvy5pWThuPMBfqsBduaEkE0p2vO27JFxcuX026BHoJ9ulD+7CGwb8gwGP743ugw0d4
 K8v9J5xs0nqW0w40ylx29fcQoa06uXe222Sk/W/iRnX+1kfvnEeQMFqbPW8s03nfaPFXnSbUxKj
 rwoLsTwaHzSHJ32a0k0Mc+RkfdirsAqIkvc4BuV2w
X-Received: by 2002:a05:620a:c53:b0:939:47f3:c0ea with SMTP id
 af79cd13be357-93947f3c157mr943128785a.34.1788256425777; 
 Tue, 01 Sep 2026 02:53:45 -0700 (PDT)
X-Received: by 2002:a05:620a:c53:b0:939:47f3:c0ea with SMTP id
 af79cd13be357-93947f3c157mr943126385a.34.1788256425298; 
 Tue, 01 Sep 2026 02:53:45 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1e3a9sm55439215e9.15.2026.09.01.02.53.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Song Gao <17746591750@163.com>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v5 10/21] target/loongarch: Constify LoongArchTLB
Date: Tue,  1 Sep 2026 11:52:16 +0200
Message-ID: <20260901095229.72018-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX7l8iC34Ck1Lc
 5IiPN57C8aBcahHl3uD9HEt9ixP9wTO38j2FH9vmf+BdM2dobxPQZ8S0eEQhAKYS3WZg0VSMITt
 b7mYE2UNkMlI4aH/SUPTxDwaRCSB4rOruLDIoBbTwWvY0O9Kr9CjUopPB8E+Sm7TMsPe96lhxbK
 d12ZZKntgT5c+1ts8Gilo/htFiCEoJ6uHW4g+/zYfa4yS+ofsAdAomgYcfHM7VHKZ83CbX2LLns
 1ZBowN+Qf/p5kKbD3I44JSptPInrjnqfGVrz6HH7yZENWVoLlQeEjUmcHPIOSsxZNjgrFdx2wLC
 ckASOwiSisX5VfYmSd6w5pIIsOJdA4nF3MbWLrjlsIiL+V8ev2LiNnvkf1r5Kw81HNXKOZSorDZ
 6yVF4Y99LKmR2XZ82yt8BVCCpAMAAArIbiCuQJzeHmCo4uONBu7+MJ0lM4QIVmTyzFcLvFl2dlU
 7eDs1Mg6d86psd6eexw==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96a0aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ttdALjtd2qF5AbuOeikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXyd3sj9sbzjgh
 pswUkwjVzgArs+DTt1i5lYax/01Rx1aRgmSCumr11La7facOE/Wt3+YnyHjllP6GkYhWmAw/U0Z
 6no6UYP7yYCbkUT2/kveqoBSZ+ETmX4=
X-Proofpoint-ORIG-GUID: cHrnlIUrp88mlelgblc8xWEKtZiApqSg
X-Proofpoint-GUID: cHrnlIUrp88mlelgblc8xWEKtZiApqSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
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

The pointed LoongArchTLB is only read, not modified: mark it const.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/loongarch/tcg/tlb_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/loongarch/tcg/tlb_helper.c b/target/loongarch/tcg/tlb_helper.c
index a4b90beca65..40cc0764248 100644
--- a/target/loongarch/tcg/tlb_helper.c
+++ b/target/loongarch/tcg/tlb_helper.c
@@ -238,11 +238,11 @@ static uint32_t get_random_tlb(uint32_t low, uint32_t high)
  * field in tlb entry contains bit[47:13], so need adjust.
  * virt_vpn = vaddr[47:13]
  */
-static LoongArchTLB *loongarch_tlb_search_cb(CPULoongArchState *env,
-                                             vaddr vaddr, int csr_asid,
-                                             tlb_match func)
+static const LoongArchTLB *
+loongarch_tlb_search_cb(CPULoongArchState *env, vaddr vaddr,
+                        int csr_asid, tlb_match func)
 {
-    LoongArchTLB *tlb;
+    const LoongArchTLB *tlb;
     uint16_t tlb_asid, stlb_idx;
     uint8_t tlb_e, tlb_ps, stlb_ps;
     bool tlb_g;
@@ -296,7 +296,7 @@ static bool loongarch_tlb_search(CPULoongArchState *env, vaddr vaddr,
 {
     int csr_asid;
     tlb_match func;
-    LoongArchTLB *tlb;
+    const LoongArchTLB *tlb;
     CPUSysState *sys = env_sys(env);
 
     func = tlb_match_any;
@@ -594,7 +594,7 @@ void helper_invtlb_page_asid(CPULoongArchState *env, target_ulong info,
                              target_ulong addr)
 {
     int asid = info & 0x3ff;
-    LoongArchTLB *tlb;
+    const LoongArchTLB *tlb;
     tlb_match func;
 
     func = tlb_match_asid;
@@ -608,7 +608,7 @@ void helper_invtlb_page_asid_or_g(CPULoongArchState *env,
                                   target_ulong info, target_ulong addr)
 {
     int asid = info & 0x3ff;
-    LoongArchTLB *tlb;
+    const LoongArchTLB *tlb;
     tlb_match func;
 
     func = tlb_match_any;
@@ -842,7 +842,7 @@ static TLBRet loongarch_map_tlb_entry(CPULoongArchState *env,
                                       MMUAccessType access_type, int index,
                                       int mmu_idx)
 {
-    LoongArchTLB *tlb = &env->tlb[index];
+    const LoongArchTLB *tlb = &env->tlb[index];
     uint8_t tlb_ps, n;
 
     tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
-- 
2.53.0


