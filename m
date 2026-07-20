Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BE9C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 17:41:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlrzl-00088b-J4; Mon, 20 Jul 2026 13:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wlrzW-00081N-O8
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 13:41:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wlrzU-0002yX-4B
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 13:41:21 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KH6bI52785380
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 17:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2OJRRCmADXE
 01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=; b=Wgzw3CPu8hPr1tu2ByO1o3S61lk
 xcTKCnraVPG6U+733od8Kwm55fkTzwRJaulcv+RXEJ54iBkilV/e1GIilFtRMTNg
 eqYJQJGf8LcUY+rWcrRWxpCX1eJ8JIsiqK9QMSLDeMUF71wMWi3RrgEzyVAnn4ke
 2kfwQ3DfEuZRDx4yKjaepnfFGzozX6eZmuKH+M/DFpivEb77o953SU/w0QKzgvMJ
 itR1MHSvhFdi13Q6/JJUckY4CDKHrWLYPM5swouHiufj81hGVVs2avdDOGsM5Mvw
 R0TeFJZS4na1hfIj8K+FMAOPLwbUtMj7UennqaQeLV8KCcNQSoHQJXXPf6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs529pa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 17:41:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cc6dd43737so195995175ad.2
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 10:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784569278; x=1785174078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2OJRRCmADXE01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=;
 b=bubsj8GdDX6dGM//TTcBSzHrUVZTcSDikqzA7MPv92790t33cdxNarhYMvsGySrRX1
 y893T/SUOamE1TRD+9/HIeNFN3TwvFZ2+Xu9HOHcbGHBJ/dyu89umcqqB5QtGw335k5v
 bKXTV59ZgCULnMbkb4JxiiEEAjqdSoIrQjePFoViAIpUt0GCVcQyHX1BHYt3g4GOqFNO
 zhbD10CWQ8+iraNuLlYqy5G9XuyvoGBw++qjVnlSaeS0/AMTf6X49mMt273rBBtnG5Kt
 YJGDr6HAt4V1277PMnwQVLTtjJu3LkCYkIlj20Y4vCFPUfIfhQXsH4EOd4ECtNEUSflz
 MA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784569278; x=1785174078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2OJRRCmADXE01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=;
 b=Dh32CeuwaI6Jud0AiMPnQXU22CU38SiTI9j7754BohYwVH54FoVRm/34b8isb/Zab7
 j16vvaFZxTEGbhdr/2lA0l4gxlg5k4jYRgZcGY6r6YVHmaYk6GXBBLHzkP/bAhKtrlKq
 1dDLFAFFm3IQ8KTt9JEt4omogXq7uxabuqfhtfn1h242S2K3EQ0wLDgAur/XA8Uj9O+j
 LfwU4crZSIimlqaVdAmDJNj1/OpyCyLG0pw/9QaXe1Vvo2jGN2yFL+wLqYWqpvrYVXoY
 r/jpfLVLc8vfuhcvqVurAE/nINO/I4tCYARTwjZebGUZEaX2IzZiwKkOC17T6btIWM4K
 yrqg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpaN2m1XaUtj2gXCac+1Tcs6GqfqswGVr+ZHYXNCtNc85R/KxKO0pFH0STr8V8MBlrZGMELNBu5Hw==@nongnu.org
X-Gm-Message-State: AOJu0YwaP9ZP1O7B12BRrmrVNEMlq9ZHLCm/2nB1f9Y72Qd25I8x5WIA
 OnjwhMdyitBjyFlMKG3J2mABUYLGI0C2h2F8xVb+hgucgbQrr6zNiZOnsZZgCOp6HdsoO+Zvn+Z
 ZhboPdm4HaJ8P2RJLX0d863R3Evva5F4x8sR8bHQrAcYCsVzs+vdJ+LQ=
X-Gm-Gg: AfdE7clGjEv8RsZyHKwKGqyCmskQRvhsrjXVuA4Yl2b7yHFXdAjHuEBqm68ZJz59/hB
 5Gf4vNLdXRJpkp9lF02m5vxlSwKLXij8xERmjfQhgwW2VpL4UU+NqZAAOH+msyyrrONQcXw/qOB
 fMRtK7FnXNZ4RBZn96SUIK6Lhe8v6Fa8oqGhjPTmy4sjXmOaD33HjEuX/4nt0RQ0VokubwXPpSG
 ZEnBuG5BMxu019bttu2XBoyzD1tQALN+2ByJBK7vMs/yBxG7l/s5RrK/ye4cO0atfewNGse7Lhm
 LC3TdqDEo9IprxgY+RFPP7YfiDixHc13CnA+e/Ee3KkISkpXNsIRUkTO5aM5hoaMKPobSyw0mZv
 8udRfdnPgGL2Q+v1s194D79HScWaMSdadDawPPmtb9IF2CLzsLZlchNTu6NjuIXs=
X-Received: by 2002:a05:6a20:7487:b0:3bf:6c05:ab with SMTP id
 adf61e73a8af0-3c3ad9d632bmr16175205637.58.1784569277855; 
 Mon, 20 Jul 2026 10:41:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:7487:b0:3bf:6c05:ab with SMTP id
 adf61e73a8af0-3c3ad9d632bmr16175174637.58.1784569277414; 
 Mon, 20 Jul 2026 10:41:17 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1dde81sm66281257eec.21.2026.07.20.10.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 10:41:17 -0700 (PDT)
From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: brian.cain@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 marco.liebel@oss.qualcomm.com, philmd@oss.qualcomm.com, ale@rev.ng,
 anjo@rev.ng, Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 06/13] semihosting: add callback to set error
Date: Mon, 20 Jul 2026 10:41:02 -0700
Message-Id: <a130a83d7a1cf8dc4c3ee11dbdaddf8e8ec0c6c2.1784568922.git.matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1784568922.git.matheus.bernardino@oss.qualcomm.com>
References: <cover.1784568922.git.matheus.bernardino@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE5MyBTYWx0ZWRfX4jW8HNYZtwt2
 /cf9gj7rL8EbMHjhKtE+eLbtFXPJCY9ttU594PdFJlaxZX71eQChV0zT0U6jxPqnE5LJkPSEYWv
 wRvg6R3E0MDchF8uRHt93R7kJv7U6s4=
X-Proofpoint-GUID: J_Rgm9aSotu2Cs5vyz2UYZcc8vy0Ephr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE5MyBTYWx0ZWRfX4cEkGyl1gUwT
 6F/lgxzT4wrQe9Z+whfBlUNfSYv5wINeAw9B7xgNQb+z5CbCMHKbBgbYZ44Ik+GqEX0mpC96SUQ
 QsrS3tJ6BzbagcK8H3dXpyT1yaT8KMjcsT8BWggSfdRmCPnSjCYq4b4cSpLv7rV3KgccyzA59l8
 zOs8SrR3e1/S6GJZU/0G06Rdochu5ETN7a6YM40tlylXV6ASMAqAA6EaV9zqy6YZio4mU58syQ1
 G614k0UMH0lkKcWJY7SF/sPegNesXaJTxKsPa32WxCfauGzSdyVVoBcbxA0plm6VgKjZ2oldsbp
 ntmVzktpo+QdE0Ub53uDspJwil8AQb38YaHI06mriVVv7sOfem9MvmWpgoYlSdd1FBFwSj3KMJG
 96/8poW7os+1wa+CbRu0T/LbNU3SBWdlsjUE1RfvsRzK72IbmIoisLk5o04jKlpRaGUtUhpEdgm
 h2DtTS2nQF8IqU7sT8Q==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e5dbe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8ndNYmkutmpv_8xOvXsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: J_Rgm9aSotu2Cs5vyz2UYZcc8vy0Ephr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200193
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=matheus.bernardino@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

This is currently unused by existing semihosting targets, but it will be
used by hexagon in the following commit.

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
---
 include/semihosting/common-semi.h | 1 +
 semihosting/arm-compat-semi.c     | 1 +
 target/arm/common-semi-target.c   | 4 ++++
 target/riscv/common-semi-target.c | 4 ++++
 4 files changed, 10 insertions(+)

diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
index aa511a46f42..a11905ef4ef 100644
--- a/include/semihosting/common-semi.h
+++ b/include/semihosting/common-semi.h
@@ -37,6 +37,7 @@
 void do_common_semihosting(CPUState *cs);
 uint64_t common_semi_arg(CPUState *cs, int argno);
 void common_semi_set_ret(CPUState *cs, uint64_t ret);
+void common_semi_set_err(CPUState *cs, int err);
 bool is_64bit_semihosting(CPUArchState *env);
 bool common_semi_sys_exit_is_extended(CPUState *cs);
 uint64_t common_semi_stack_bottom(CPUState *cs);
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5e5f181b908..c54753f696f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -237,6 +237,7 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
         ts->swi_errno = err;
 #else
         syscall_err = err;
+        common_semi_set_err(cs, err);
 #endif
     }
     common_semi_set_ret(cs, ret);
diff --git a/target/arm/common-semi-target.c b/target/arm/common-semi-target.c
index 2b77ce9c17b..38d52deb3d6 100644
--- a/target/arm/common-semi-target.c
+++ b/target/arm/common-semi-target.c
@@ -34,6 +34,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
     }
 }
 
+void common_semi_set_err(CPUState *cs, int err)
+{
+}
+
 bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
     return is_a64(cpu_env(cs));
diff --git a/target/riscv/common-semi-target.c b/target/riscv/common-semi-target.c
index aeaeb88d536..38a00e160c3 100644
--- a/target/riscv/common-semi-target.c
+++ b/target/riscv/common-semi-target.c
@@ -26,6 +26,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
     env->gpr[xA0] = ret;
 }
 
+void common_semi_set_err(CPUState *cs, int err)
+{
+}
+
 bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
-- 
2.37.2


