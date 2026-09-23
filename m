Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C819C98302
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Qaf-00020d-2T; Wed, 23 Sep 2026 13:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXW-0006Tv-D4
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXT-0001La-QI
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:13:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTcPC740339
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=; b=puIIDaR63fI+3uYW
 4W041okidglmLhaedEalM+0c9Abq2Ulva1r/iFZAIWYWMynbEo6wGxrhMRQR6osd
 T7avsjHucBZcCIp4PMifaa3wwBWPZE1nFXq0uht2afJ5Nxis5kfw4q8MlredVs6o
 ZN0jKjpC/Ki7DJocls0cD+1tT35n/s1ogq2/bPR6QQIeEwkVLCo46ULFzlPTMGPj
 ncNNI0MZTORgw+SCKXdRbtfEmNt5xLEMbxAaDnioO9nMzXGRe9U5Y2zWXPVCt+rU
 Mmj1nHU2F0sV2cxskhO/qiJflsdCG7+NP4aFD0yHDHt2KfD0Du9lZSJDHmaraJfo
 x5E9oQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsh3ms-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 17:13:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-97e9909eeeaso294380241.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183615; x=1790788415; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=;
 b=BjWtUF2A39y/eMkVM0Rwkq6NnytT/Yi0y/23z1W/EBzJGbKZp+fcC0WwG4lanjhcDI
 ATwR13j22Gf+wDu33iwr5YL6kYhrXIcgO1n3ZpwxnKmKYyha/kTkONkG1oE9XVm9JJQj
 EzR0K/Z4H5Gnem5Gs9+7Q2xuIDjslsrZ3kH5ntUU8gV5yZR1g0TTqfecimFwMzTwULmE
 ghx6GrWwteyrPXuKBgZnkxNdQvc9F8/HCTIvmOrk+JvwIfKhunA6TtIInSayZe0LE6SH
 4zy3fE2AYtNEkQqC/PXbfFoMKRZiwPH/qX2y+7WNOrfKgJOwRk3IH9yvrI3fAI68Y+ZH
 V0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183615; x=1790788415;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=;
 b=u3t/Uf/dRKZ7Woh51QvvLYiYuc97zesU327dZOVY8t3KJvF0AZLsx32IdNzoBX7z4T
 APTO30LY3wLzLfxB6/BJthINW+7lQsBvfhbceSrNcq/X57eNN4vgcuRs8VosWeh5inWM
 /UTuPtqDlMTJXnODzi7SE/QzLkugBZvb8pbkmb/KJvoogexdFb7sOO+hvFJ70uNfxfku
 jLRyZ4kdGYc39gQ7f7sja315CNFf6hlxcHkxuHWvZJzJOhaSDzMibswFS2llmbVt4XOk
 g1vU6zTmEpWhtpchpS/+KxkiB0u9NyM37zA+VFbLoe2G3C5lyfG0NKo8R58F5b8VqdBC
 QrUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwyBwiNFZ/upMT2KxhgJQ65nuNjYsMWHdlGhJs/qPNvEdcPmDAT1x55LIS+80jUDvWi7bxtHIoaWQ==@nongnu.org
X-Gm-Message-State: AFuF++k4v05Dbnbhhey5C8dd7M/I5VlslD3JcODQXzu8zn0RWH3HsY4p
 I/sgAL4+B2hkW0uRDH2FpiH/NB5zydSUskElq+OLaN4JmOdLzZWkI+gHfjCr5XM53kRWKprtY/t
 YYElMXxio5ARpdnMDbi61ytjjN5HDGdOpH3J6E3ZhORS7ApfINQg+T48=
X-Gm-Gg: AYBFou1HYOFRdm4bn6nuEs7v+iLKU+dvd0zh9qj+4Dw2xVcYyvflD8UM/MrP/jMncT/
 s4NSoUhk8dZPwH/d9ZVAJYi4qW2q0kOEclwTYOcp1lRaYskLQQv2JnZcJyXIy5FTlMbku0nAKCW
 hR7bAVN219jfS/Wn2AxSM/evhTOw22FSpy5QATMBg464E4SDObwfXBPFAqiKGz+3yVF658SQhMz
 XO9oxRNzfLyefwzZyeD1MMagBHfPJZUP+p3SbjMSo0BgCKrrQuE1I+HCUz6J+8XN4QX29l3QsJ4
 N3WB8g1Ro2jd1u9huBLpF/71aZZvmQM8lqgn6GGRSNu0j7nnJW3FOFhM243k210xmoCr9lIjHFA
 94cLeC0Pht7jR0EQKQ4ATZRioOr9x15bPvLQ9BsHK
X-Received: by 2002:a05:6102:8083:b0:798:8ca:3452 with SMTP id
 ada2fe7eead31-7ac1aad2aa1mr3022010137.1.1790183615258; 
 Wed, 23 Sep 2026 10:13:35 -0700 (PDT)
X-Received: by 2002:a05:6102:8083:b0:798:8ca:3452 with SMTP id
 ada2fe7eead31-7ac1aad2aa1mr3021994137.1.1790183614917; 
 Wed, 23 Sep 2026 10:13:34 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5de187asm317215e9.7.2026.09.23.10.13.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 18/21] target/i386: Split APIC polling from
 x86_cpu_exec_halt()
Date: Wed, 23 Sep 2026 19:11:12 +0200
Message-ID: <20260923171116.31276-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX+7egMm6A8BQG
 tX4gK8KoQqzK//sMCGefbxiyjvEbmA8bdXKm6cCj47p0Qgy0LtlBtC+WQChpGzX5C0+TG+/wxNZ
 2tWzUvRI2mWYXInHxeFIeLPi/ZAiMH7hdc1jHip6ACirGOWo9nJC1rY1bnj1cMPyvCsCGu0DmpB
 81nPkEFaZ8ALdJ6/4OvZpZKu9nxDhLX0iIgxDhtvJ4Lw224r174znUlYj+Ra+3MDgbwwH9pZ+Mu
 8n4dw7G4dJYbGnm7y99ZUBZGn9z3xEVKfZsu7wPAsrgo2f8PViCY55o2KI2nLbU5jaBuQN4fiBM
 D0Agh5SVsFum6fWVgmkEeZ/uZ3lAP6uVH/LNTsKCN1JHTafct24n4CXhH2pItGJdqY2YtrpT014
 ViBxkMb/ukYf2Y0uOrOgdjSD+qQ9d5ZktmoDxw+alffq2uZbp/4tKNLsDBtNG+DRMMr16T+Ausx
 +9BmzKTChaeJpoPTubA==
X-Proofpoint-GUID: 83hoifQqj6TW-a_L4YtHbqfQnelE_iMA
X-Proofpoint-ORIG-GUID: 83hoifQqj6TW-a_L4YtHbqfQnelE_iMA
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab408c0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=h7OMh5kjI76PbTVxvEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXwPVvDPL1hJt7
 qhqZH9WdsBYfxF+yHpWamnlmOgR4/1SWhdMPvvtOKo2HiW0PFKnsw9j3fMAi6wpbAz1bYPZT/zx
 6iXLGy4exY1HCC8DExbmO3Xu84FmVVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
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
2.53.0


