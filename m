Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1D4C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LBQ-0008D0-CJ; Tue, 01 Sep 2026 05:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBO-0008BK-IZ
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LBM-0007aU-Qo
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:53:34 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6817978d1211433
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FYs3uPH5Pb8hS6ZkgeHaIaSrfIoM0pZKlpLy0wB+Gps=; b=IWHe0xexRQYq3q00
 s6WRSHF63KSSUgusAYjX7A4p4ZYJBtjhPn3FcE899hkplun2IcDucAiigjgZ+on+
 fsLcBKlDyTAupQl9gLZI0Oi4a2dCJc6XOBRtpnHjpzL4MLpBzvzDx1YaMryGoPs3
 2EETsRq81GgUkPtd+RsEWPKJgecLU3NixRyG8Zt6aOlrlpOy/SyE5+FVPCEKsArG
 BxMmQN43Rsy85e9EbnimpkD4znxAvgp0p4WRmqmu+nGXJr2pp28AkTvz8UZ9tGUj
 VndCgDaIOtcD9rSLDnI7GkvFMADQzH8RyXEkm6TH1uLfe1LFnJvqIS8ElvY/uUpZ
 57FZyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8svxb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:53:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-930edb4362dso633065285a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256410; x=1788861210; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FYs3uPH5Pb8hS6ZkgeHaIaSrfIoM0pZKlpLy0wB+Gps=;
 b=ePRJfCZL7cIRvP0SGq4J8XZQNiphTYNY5dToFcRXJB5E+tccBGJroni0BkQaYTSXQk
 V+1z0maEKw+zUBiRh9rTLaM0QiCxBPi0B/F9shFIzDvfvMYCIX51SOv0AdpLkd4eH4dt
 qI0a0RRz3tv7HyxKLTHyL4TFXqNaYvH5tcyr7Lh0/nsSBA1tGM5+0z1e/OcmgDzCHYaO
 cmIb0Qu47xhe12F21RN8fPTP+5GUv8Bfy8mAn91+MOSpANhAg0/f7K4prsnZL+0+VG3/
 22ornefxfNVHMy3na0oVfNDIMwvOmMgzNqH5kPtoWcNCtJNXGAgZtgTm1/Z604n7e/JF
 bmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256410; x=1788861210;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FYs3uPH5Pb8hS6ZkgeHaIaSrfIoM0pZKlpLy0wB+Gps=;
 b=Tt/7dWoT6bogPWCQjtczYjgM3wgfEssMPwc/J0MyfIaAlChZ07+g8LFyJqnmjzDKgg
 zf7a79+KId+xpp/XNMCEZDAY2HRkv0HIgTQ6jx/FqfNc3WAPfiYfN7Vm/llgyGgnNiR7
 an0s3Ba2UEZT05/jDfw1v8jhLj05sS01Dsp25YqCwyGrNeQ0sqs225TfaIX2xakZoASn
 0buak0oJUG9ksVWZ8qwTHZzHKkWAskjt4kRawlugGUqLE9iBxi1RndeJTfGDWz3vNoXL
 7DsP992WP6g9Tia0Fh1JbLstEb0sAQwWZ3iDormpJ9lwOliLMZgY19Lk2bLjlx4yl1eX
 c0pg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvEacjc87DvU8/d382HvvodrNr41cxiD/tXD9u4wJ85rtgCxX9e0vC+bhuRAgBo27YQ+2NaLXb5A==@nongnu.org
X-Gm-Message-State: AFuF++nUxZcehDz9yt28mR3yKFw1twW1Auu6UTHlzGUI0jeu4a/NBLBu
 1Kc/+Avnm/Pn3T9qGx0Y6ukbrkmI/PDxv6dz2mtsxwNFCaoCV6SNAcgrAmQFCqhcHAUVBfA3KgK
 0aZReS6hSp8AUpz+2x6brUZKNKAp+V+ZSMhkR2va3KjJKU7iHjtOdSNQ=
X-Gm-Gg: AR+sD12Zne5fphP99zJaoJCsF6XW+C6Q5ArRrOpse9TLctPlPiWuClaMIuzR+UlbTdZ
 rzyR0FSMQBNDdWsfCRThEYWtikCyFqVEe6BDV9Kr6+8I6I9Qo0sZJF3xQR67FEY6tQ2TmqA81T8
 r2CmFzWTU0SkILsG5xXB+DKTb2F/ZCEHY9/7A5WAdTrWJovnxx3Vo1t+0WUcfuZJaFTdG+rns4y
 5ZO5Z10N5hr4wpsTecr251PgmKE1m5jhUY0/eBjiO6BgtPIxzx3E8UK1kwjo9MuBc/Yql+bqC+H
 U0oIO/AymJUc+u3qnBED/o9lfNHTkVtRvK/xFRODyIN2DxwQxyWxHbxg0wEuFEhIXvotl78bxyT
 KrOuVdHwBBJm11vLQh2mlonCP7B09H/PC9MVPQm/y
X-Received: by 2002:a05:620a:2304:20b0:936:c026:be61 with SMTP id
 af79cd13be357-93913798f13mr2882938485a.13.1788256410265; 
 Tue, 01 Sep 2026 02:53:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2304:20b0:936:c026:be61 with SMTP id
 af79cd13be357-93913798f13mr2882936385a.13.1788256409813; 
 Tue, 01 Sep 2026 02:53:29 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c9cf95sm262624555e9.1.2026.09.01.02.53.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:53:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v5 08/21] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
Date: Tue,  1 Sep 2026 11:52:14 +0200
Message-ID: <20260901095229.72018-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a09b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=XxrlQHdRtCO5bKJNttYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX/tKTzhsrjjf4
 I6Q7HLpjU/7JlP/Of4IhyLA37zgCzKNaA/ZPlrDT4ojq5GMDZIxNcIhzrVLyXrNwk/no2vklpD6
 ezVc2aCCQ7FckldSHfTqnBEzE4LTDY7fuitdVoZeg5UixWqPJPuzY2F/H3rjw/EO4hexaGNflAK
 /DMFqbjvTLwKEap23wxMXMNziZOljhnYBrkdn/wSssbJeqdBJN3vFwfavpt+d6U9SUKFa4xJzyT
 vipvRHIG5dGMDFOiS5usw9EcaW+s3qVkDx5bYtt19uFR/VgxFXEry2TBIFpMcZI6RYE6LsVeg7O
 gGHKYam98PUd38pxOK6jphy9VCdKHztt6Ry7OekiSzLLYqdM60v51Ipd+u35b1OhOWwU9ygAKtD
 ukv5AyXbJxp3TpwfsQxVmgpst2Rt7kfpxA2cFIWbfA4RMNZ4ZBEgMv8XOpkmThStlUJbQyJgPnR
 dzfW9+2ElRwpCnZY3ZQ==
X-Proofpoint-ORIG-GUID: kKWQhnUpmGfnu7JGzpcU9Zhg54hxvlFK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXwv4lnlkAqOMX
 HImfPmLTyRwYgz1bx3nOBNIoF8lO/unx2/EfYVReJpDfvAdGZolCcYzksbu7mXqDRAMEOl/FUhk
 EP0tlKA3vvOkHjMSXHYlgnf98xyoOIo=
X-Proofpoint-GUID: kKWQhnUpmGfnu7JGzpcU9Zhg54hxvlFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
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

@env argument is accessed without modification in
hexagon_thread_is_enabled(), qualify it as const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/cpu.h        | 2 +-
 target/hexagon/cpu_helper.h | 4 ++--
 target/hexagon/cpu.c        | 4 ++--
 target/hexagon/cpu_helper.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index c50fbb3f72a..e4f120eda17 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
  * @return true if the @a thread_env hardware thread is
  * not stopped.
  */
-bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
+bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
 uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
 void hexagon_cpu_soft_reset(CPUHexagonState *env);
 #endif
diff --git a/target/hexagon/cpu_helper.h b/target/hexagon/cpu_helper.h
index d1767503156..a669091a89d 100644
--- a/target/hexagon/cpu_helper.h
+++ b/target/hexagon/cpu_helper.h
@@ -9,8 +9,8 @@
 
 uint32_t hexagon_get_pmu_counter(CPUHexagonState *cur_env, int index);
 void hexagon_modify_ssr(CPUHexagonState *env, uint32_t new, uint32_t old);
-int get_cpu_mode(CPUHexagonState *env);
-int get_exe_mode(CPUHexagonState *env);
+int get_cpu_mode(const CPUHexagonState *env);
+int get_exe_mode(const CPUHexagonState *env);
 void clear_wait_mode(CPUHexagonState *env);
 void hexagon_ssr_set_cause(CPUHexagonState *env, uint32_t cause);
 void hexagon_start_threads(CPUHexagonState *env, uint32_t mask);
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9765716b516..4cc6bd67c28 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-bool hexagon_thread_is_enabled(CPUHexagonState *env)
+bool hexagon_thread_is_enabled(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu = env_archcpu(env);
+    const HexagonCPU *cpu = env_archcpu(env);
     uint32_t modectl;
     uint32_t thread_enabled_mask;
     bool E_bit;
diff --git a/target/hexagon/cpu_helper.c b/target/hexagon/cpu_helper.c
index 64c5746c6d9..610e29a0503 100644
--- a/target/hexagon/cpu_helper.c
+++ b/target/hexagon/cpu_helper.c
@@ -212,9 +212,9 @@ void hexagon_ssr_set_cause(CPUHexagonState *env, uint32_t cause)
 }
 
 
-int get_exe_mode(CPUHexagonState *env)
+int get_exe_mode(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu;
+    const HexagonCPU *cpu;
     uint32_t modectl, thread_enabled_mask, thread_wait_mask;
     uint32_t isdbst, debugmode;
     bool E_bit, W_bit, D_bit;
@@ -384,7 +384,7 @@ static int sys_in_user_mode_ssr(uint32_t ssr)
     return 0;
 }
 
-int get_cpu_mode(CPUHexagonState *env)
+int get_cpu_mode(const CPUHexagonState *env)
 {
     uint32_t ssr = env->t_sreg[HEX_SREG_SSR];
 
-- 
2.53.0


