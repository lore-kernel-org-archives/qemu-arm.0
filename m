Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C065606A323
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ev/RZ3H2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVtiW0SR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWj1G-0004FG-FT; Thu, 26 Nov 2026 18:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1D-0004A7-Sz
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:36:47 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1B-0004cZ-AP
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:36:47 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw7gp781856
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aKXQ2PUage8tK9Q/lYV3x/9ZrCYklyEq2vLrHsxomHw=; b=ev/RZ3H22mdjFZXF
 i/vUf3YAA60wWIXV8+OLcScme/VXHK8oklyXcTcNG9Yb1ggwIesfJGljsRSAYW2y
 eC4ZSPanhueNKG5naeQwHWuVUyO21v9aUTnmEkjEhWwA6UiZH547BJ1UwGvDKbB3
 h0iPzUpQP4IzGLg0dZRNxKzCKjRi/B2O+YZzl3ZxSBP1bZcuNRYLauMYXznoibwf
 p1F19oOWbmrA1TSsS+X5OXTRiJQeZVoExMU3d68+ERVPHucSUfFKlUivRofeitO/
 jd88hecct8EarVKhO7feG9g5fZDKB58o8/d4ypUOLKIj3qKNhy5SAyjHsgDzDUdW
 7Fc9hw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm82m5x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:36:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so1411676885a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736204; x=1796341004; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=aKXQ2PUage8tK9Q/lYV3x/9ZrCYklyEq2vLrHsxomHw=;
 b=kVtiW0SRyVa06U3PuYPSgDih92AYqtLxF5yZ0eFTLLenhtII3ue8rV8K0BBtUJkvyY
 CHO9kDX5pZ4+ihbc6QS2WbJnR0YfyseKDWlNBF3sUH2PFTKrVwkWdXs/gtQiHIPdIVzc
 LCr4JH7ZGXLyxySjlxaujARUPbXuodkACH87W79QKi25tie1fufCj9MLhl/5gyZKtEVK
 G1c09uauyhM5DiRESsTMpU4N2kmrbLPPa98Fse++SHS+sa1sKiNL+8gZsxplrUd/3P2e
 uDIhMyRkqie3POp8q9Oe1tO++ee0qKlXGqqSaSiTDUl6n2g48MzIyr/qLdrN+QsiIZjx
 uYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736204; x=1796341004;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aKXQ2PUage8tK9Q/lYV3x/9ZrCYklyEq2vLrHsxomHw=;
 b=TAnHnCH8vhRrpdBS152l1pgZxB0lLTRuHc2S+S6aEuPdYTmR2/4Pw7SipG0dzqcdYc
 5fPejfUI6E8cr7x4qCTZTaIWHEzSRojONv5L1UzxhN1DVYb2PR4HZMT/PoIyLo/ZLEUx
 ytb/8iOqt4snjnBwhfEv9qfJR0ocHLxJ2vgoUx3tZkv3Z8WOlbq9h+i56Itm3n7pt0aQ
 Hdm84ZY8S6iMhRiOf0xdYy2WjqlTNBimYfOW3DrP/rVSSWJ/US9chxyZ1hwDYV73ph7f
 r4kmfzj9aPg6acGDkv8goSqvQdn2aqh/jIVP9c5M6NTSoQA98ALxQ38+Dm2rKSWFdj5e
 bA+g==
X-Forwarded-Encrypted: i=1;
 AL+hErG5M4btC//LvwOwJQ9qxzOaDzw8Obr5EWgXWBdoEwd1M+uPgX68IpMTfBh1WVjfrJRlBIUp/FNecA==@nongnu.org
X-Gm-Message-State: APuU4Z9LJytqtfEAa+51uagAbzQrbHAOwd/8a78YSXrmUZ8PnktRAXse
 TeeEZaPqGIwFs196MoTmLfZbQ+CeSDSd2jevGeQYg5zSeexu8SXtHcz1ZyI3hOQnYMtK/IsR3JP
 Aqzr6qJ6VE1IDSYjGXtFeHzoDeIPPE2MugmQoVXGQeTMpV8hcohwalDM=
X-Gm-Gg: AZFdTZc6klqyAPJFpD8GrvkkgQYkCXYhlKLll6dUCeMfTb/kMFHsVJiRgANojgy5Jcg
 wNujZH43F9YymhJ20F8oAR0OYFkQJraEa2VjGslgQQxINm5cqIkFx8oNeG06PtuNs8IFnEfJgqW
 vG2YBcdZJCTizd6h6ZDBOPldpQ3+J2KA07FJHI+XCyhiwCNUMP8QbvMKSnUOWsz5hXztgQgGzmn
 xdlO4TkVWOHR8WHcXzqM5YoRJDn4M6pe7XB9ScVFSMJ0uzf31oKF1bbP2p0YWFeIn65vj1OsO6L
 rz/gsfYb5S/GR1nxDgYvoRXZFOYzTFZ4DGtV2jpwyMCaTnGV/WFZ9YlMU/99T19fCWdosUUHfVG
 Uf4p0onkWxh9a8yGxthPzVMfsa8ErkbmPSMOGC5Rf8TJARQZ8mEEWZnZWqFXTPU2LN/UBtx4+5a
 4k1RBpQlXZAbpZHA==
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id
 af79cd13be357-949ba80f8acmr4042819985a.6.1795736203777; 
 Thu, 26 Nov 2026 15:36:43 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id
 af79cd13be357-949ba80f8acmr4042817185a.6.1795736203361; 
 Thu, 26 Nov 2026 15:36:43 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b216esm699305865e9.12.2026.11.26.15.36.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 05/24] target/alpha: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:43 +0100
Message-ID: <20261126233604.67722-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GeBjFm2d15qyekfvz2e_l2EgfMejA2uT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX60QbgvbXmK1e
 nmHKHMsD8P6FXItL+QuhFwy6INjqA0syxf+ClqmmSVEigoB3YNezI43vo9VoOyXRuHCGYhqIPv6
 bVcTU0PmwzC7zlD+hXwAfnrBRoLRoCg=
X-Proofpoint-GUID: GeBjFm2d15qyekfvz2e_l2EgfMejA2uT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX6VtpYzMfJx9u
 Lf578mbVRPOWnO19cvKGJdAzLZiSUxnssF97JAKOlwR4Arf04sA9GoLKlGVa4Gcc8ufPpGm/7TA
 DSzm0PCtxNc6eHta75S/ggKAMP8BZ/at0L6TRVufxy5rEWnxr+FLrG6Vr58vrZ5GOcvzK17QhR6
 MZ7gd447OaABmHJYV8OUdTPkJTTMUlZt2MEYUEopJr9y2PvfbhnDMh/YKlmZf9mbVE+25NsYZF/
 JQvfEpSnMkvN6rTyu9q+zPSvnIF8e8X/1uiSK4hqxt78K3DrT7jIl+4QZncPnxPNLIAHl92t3MG
 8p+Izs7IRzIIK/HQuT6iu/sfgkTcuSiuf6GM15zovyPzhWQziQy8cwE7ZHUW4/xiKJsc4PYRJ16
 2x/gKhFCpCxQdgBq+kGZMJUzH+16yCfxJK/+O+sr1AtyAozsV5bpSS7ayJt0NxIpk6AskflN71m
 q305s7TXkG2xIKQP+EQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08c28c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=60FdqjWU91-NsAbpyuYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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
 target/alpha/cpu.c       | 2 +-
 target/alpha/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index fd099c8e70f9..de452c881172 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -44,7 +44,7 @@ static vaddr alpha_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState alpha_get_tb_cpu_state(CPUState *cs)
 {
     CPUAlphaState *env = cpu_env(cs);
-    uint32_t flags = env->flags & ENV_FLAG_TB_MASK;
+    uint64_t flags = env->flags & ENV_FLAG_TB_MASK;
 
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAG_UNALIGN * !cs->prctl_unalign_sigbus;
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 6f18b8d1af62..2063abf3ce5a 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -48,7 +48,7 @@ struct DisasContext {
 #ifdef CONFIG_USER_ONLY
     MemOp unalign;
 #endif
-    uint32_t tbflags;
+    uint64_t tbflags;
     int mem_idx;
 
     /* True if generating pc-relative code.  */
-- 
2.55.0


