Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4630C606A32E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PlfjhT/I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L22AZBya
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj3B-0001H4-Cl; Thu, 26 Nov 2026 18:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj37-0000sA-UJ
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:45 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj35-00019q-8c
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:38:45 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw8DU3340041
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kQiYOe2ljrnpQFopM9IZYgv5ZftHEmKXEj6HZt8HEmY=; b=PlfjhT/I9k6pHK2B
 UAzTcztrO1cU53C4Hk8c1nkihfV9ElHyCvadEA9ALD/Acl1oqoBoHLMQ3CryhoLM
 VGsnLsjtZNe/E1vICfgirl1MgIgLszo2333eg2OYhJnBWyJt51mXyz4aNIWKedGQ
 PPItomzibVDPN2/GJALi2N97QaNdzu7kFl8tD86BLr/NLICUmYKdP6s7h0Se9FeP
 E9lhyPjh9cla6vZGhww0VK0GOz+9xbYEYdE8VUuEPveRmN3nd3LzzVyhLer7E00a
 VuT5UAFDniyoIn0qFlQIl0eh/cnP94VplJWnOFU7Zoiz7+9l5zUmysObbt1exRWw
 n1IOQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdvc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:38:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f20addba1so1108638985a.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736311; x=1796341111; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kQiYOe2ljrnpQFopM9IZYgv5ZftHEmKXEj6HZt8HEmY=;
 b=L22AZByaDf1JC8X3OuHJv5AE4CwxhPTmoGLc0p0XixNi3srMXBDB6drjwteHr9nNLD
 4RNt7JRD3o1i62ziJ/7M0scvDA2vnHDw8cFea/lHEKKbs5NRDaxTOCMvYPzNI+AABLN+
 gfQ9ziXyZhPxv+QQ6y3l+Rrd8/RTddwTFgJxnnuuVmZQ2nYpRe7M7S3lqH1VxVNFiaEh
 5+1eosGMC99YoS6L9nQWoKCT6+0om54IflXH7omz3o4+wkq21LDV9Ss2X54lsR4Uu+Fd
 WKvnVNZ406m1wO9h9I/jZ11ST9HsqZUm9rbKm8QR5JO1+R9lDP3wYUwIGky/vCaC3kNA
 PxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736311; x=1796341111;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kQiYOe2ljrnpQFopM9IZYgv5ZftHEmKXEj6HZt8HEmY=;
 b=KKelJckGRoiygqVwy8HqqtrjO4Ve+Wc/WfwjWiuNDI3ktSjOI+avjdQbarwrpjqx53
 AeWbEzGSLMcdxwZ3S4x4aJHGiIvQkgK4YgRjixVy9j00bDtCTGDGRODYxOi1tYLVXhFJ
 RTApSEYkII/YkJwZotzYmKU9Gyew+hgYCAWG5EAL39Po8u8ypLOBzU4eDU0E3Rcch932
 J+lBAX3U0iUKPktcBjOC1prqwMru4hlgrA5UEk8XI+uQyoSqOWhGUmqhMuvfZRn5ioF0
 yDwnI1TCBlzMzTbmKZlBP6xBC8DoU+iFkvKEXqaELn5qkAvLQXSvTschU6mv6sXX5bjC
 JBgA==
X-Forwarded-Encrypted: i=1;
 AL+hErFpq9rdLxjWDLWw8zuiAgCNHnf86gK3CddGu4y750lYyMLRrO6yNLa00MTTDffRakTzL9Vp+4CE7g==@nongnu.org
X-Gm-Message-State: APuU4Z9QoorUQRXwFcxrl7CRHKgg72vRHpIahRiof+miVhV8CReVZVIm
 /Ac/JbC7zR6WbZriQadz7mcwEnajaaCrc7OCqyI0Jixe1Iv241bkUK3H5TWELStLlUAtodonBdl
 /Fj6r2/sDEr+RJSZdvCy1wy46o8Sw9TbJrmnk1FSkxTMHT+xK9a8a95U=
X-Gm-Gg: AZFdTZdxw9DwC57pnNo0E7GiqLpOlM4R5YLjPxG8R9HfbmC4OsKJWajVutx6eJcnu/u
 DwzCS/eBSVVkeJbx0PR7QugstiTlb4lLAwWACREYKfFAd7p7RKqKVOMQI+73NwJbaRm9YyAkhW5
 Dl+gFzJvcZ/BCraHIS5dgVP7JUlf+qoFFmdcrZIhlVgSczKTcwyGywQZ/PWBRrW8qQiV61WosuQ
 2mgH8gFrbSoHVuaVP+FGitzRQWToeSHemncoQnD+1NREh2bQz/wJ4SjuNPzsh8nuxtiNFsv85rz
 vzpQ6flYtlxKDpNB5W4tu3DxmzjCgc+7iI3ftyugSK8Ij7pNhB8mq6X66WvZWPaydbIrgO67EMk
 xrpdDKCQ71i2Yva8WJ6wCAvTTfnOiAUo2lL57sU0cQIA5eJ9mpf/AUy+h82M9wGHw+pxVDn7Bo3
 vR2xOoiXsaxu7hsA==
X-Received: by 2002:a05:620a:6892:b0:947:7691:7316 with SMTP id
 af79cd13be357-949bab3d3bemr3929338885a.81.1795736310836; 
 Thu, 26 Nov 2026 15:38:30 -0800 (PST)
X-Received: by 2002:a05:620a:6892:b0:947:7691:7316 with SMTP id
 af79cd13be357-949bab3d3bemr3929335585a.81.1795736310383; 
 Thu, 26 Nov 2026 15:38:30 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b2c5sm629921625e9.5.2026.11.26.15.38.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Subject: [PATCH 18/24] target/rx: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:56 +0100
Message-ID: <20261126233604.67722-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m3IOtXJ-TNe4Y4bLlUDvFIb47W34O4gr
X-Proofpoint-ORIG-GUID: m3IOtXJ-TNe4Y4bLlUDvFIb47W34O4gr
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c2f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xyxvAluZajSoLEIRtJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXyLeaWuzrEoHy
 ibwNCi4zwsKgzBUoSN5782/kEP/0JvWzKJq3+VIh/c6Z8MGbKnXQhJ8YiEDdzptVYm2eDYW9G+D
 B17SBFlmby+Luu+/tgelTlMoGbsTjvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX9JpOWW5u7kEH
 Fjy5p+I3gXDy3xvQzVip4PnYH0UhUlQsaOgtOFnP2R40yShhu4EUad7KsZPnpey2tyMsAZ/5oj7
 Z0uNCeR31CAm+SsKqYEumH1KtU0wg/pfMqvZGZM1beFdUN/cZ6+1eHaG0IaYzxQQ7N11WYlVdXD
 2eOoB/u0+Oo1LvzBx5PwVQIaKdnBJocV9mDYB85mQqianeH3Pf9+B8Gr2MI+oVZw4KoYFouvPjs
 sTHNew23Y1OAY3H3l23GWT/CTHwSrIWsqBLJls+B6gnY2/ksx4BsPqGhciycb8o8Itpt9Ysp38m
 YJheXJv3ha+nb+Da9Q1Ku7LNRegiwL1dUatWqJhMuVXxe4PyLmCcQHiUxoiJI/Ljv4GS0/ROc12
 yBGyoIb/0yFEidWY+h5y45OaX1lfzeOvSDgXkhHxBGJhrGlzmi6iDYpvg2ynRktigbd7U5jeZii
 F6sMZkcbDqYHde2/aug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/rx/cpu.c       |  6 +++---
 target/rx/translate.c | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index c35a98f7cefa..dba253bda9b1 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -47,10 +47,10 @@ static vaddr rx_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState rx_get_tb_cpu_state(CPUState *cs)
 {
     CPURXState *env = cpu_env(cs);
-    uint32_t flags = 0;
+    uint64_t flags = 0;
 
-    flags = FIELD_DP32(flags, PSW, PM, env->psw_pm);
-    flags = FIELD_DP32(flags, PSW, U, env->psw_u);
+    flags = FIELD_DP64(flags, PSW, PM, env->psw_pm);
+    flags = FIELD_DP64(flags, PSW, U, env->psw_u);
 
     return (TCGTBCPUState){ .pc = env->pc, .flags = flags };
 }
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 1bacc7adf929..69547c83cc05 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -36,7 +36,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     CPURXState *env;
     uint32_t pc;
-    uint32_t tb_flags;
+    uint64_t tb_flags;
 } DisasContext;
 
 typedef struct DisasCompare {
@@ -243,7 +243,7 @@ static TCGv_i32 rx_load_source(DisasContext *ctx, TCGv_i32 mem,
 /* Processor mode check */
 static int is_privileged(DisasContext *ctx, int is_exception)
 {
-    if (FIELD_EX32(ctx->tb_flags, PSW, PM)) {
+    if (FIELD_EX64(ctx->tb_flags, PSW, PM)) {
         if (is_exception) {
             gen_helper_raise_privilege_violation(tcg_env);
         }
@@ -332,7 +332,7 @@ static void move_from_cr(DisasContext *ctx, TCGv_i32 ret, int cr, uint32_t pc)
         tcg_gen_movi_i32(ret, pc);
         break;
     case 2:     /* USP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(ret, cpu_sp);
         } else {
             tcg_gen_mov_i32(ret, cpu_usp);
@@ -348,7 +348,7 @@ static void move_from_cr(DisasContext *ctx, TCGv_i32 ret, int cr, uint32_t pc)
         tcg_gen_mov_i32(ret, cpu_bpc);
         break;
     case 10:    /* ISP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(ret, cpu_isp);
         } else {
             tcg_gen_mov_i32(ret, cpu_sp);
@@ -386,7 +386,7 @@ static void move_to_cr(DisasContext *ctx, TCGv_i32 val, int cr)
         break;
     /* case 1: to PC not supported */
     case 2:     /* USP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(cpu_sp, val);
         } else {
             tcg_gen_mov_i32(cpu_usp, val);
@@ -402,7 +402,7 @@ static void move_to_cr(DisasContext *ctx, TCGv_i32 val, int cr)
         tcg_gen_mov_i32(cpu_bpc, val);
         break;
     case 10:    /* ISP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(cpu_isp, val);
         } else {
             tcg_gen_mov_i32(cpu_sp, val);
@@ -2080,8 +2080,8 @@ static void clrsetpsw(DisasContext *ctx, int cb, int val)
             ctx->base.is_jmp = DISAS_UPDATE;
             break;
         case PSW_U:
-            if (FIELD_EX32(ctx->tb_flags, PSW, U) != val) {
-                ctx->tb_flags = FIELD_DP32(ctx->tb_flags, PSW, U, val);
+            if (FIELD_EX64(ctx->tb_flags, PSW, U) != val) {
+                ctx->tb_flags = FIELD_DP64(ctx->tb_flags, PSW, U, val);
                 tcg_gen_movi_i32(cpu_psw_u, val);
                 tcg_gen_mov_i32(val ? cpu_isp : cpu_usp, cpu_sp);
                 tcg_gen_mov_i32(cpu_sp, val ? cpu_usp : cpu_isp);
-- 
2.55.0


