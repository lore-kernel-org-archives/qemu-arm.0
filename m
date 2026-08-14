Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA487C5B572
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Aug 2026 08:05:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wumuq-0006aq-R5; Fri, 14 Aug 2026 04:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wumun-0006Zg-Px
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 04:05:22 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wumul-0004NC-8U
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 04:05:21 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E7faH2273914
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 08:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9aocAErqtcOVa0azkPqHmN
 xwJ2foHbbi/pvrs3OIGu8=; b=kV9iSBU8hjoibewBClpO9Y0jBvMr/5RcSsxlKt
 rH2Fnr0iAsIFAGY0nwy1CQW45uToz+DIOriMRkBApOaxgoU0Re2sF0NiEaDSgffp
 s6jMmW+ypdQ9SbMmGAz/RdgGhr2fto8FXHqeHR9TpjTVa8jv0nJCHF5i2TH1a26+
 iRzLS/VaEUM12U6tmTmf4M5dA0byd76B7inA9PNKKfjX1GLKj2Z44xSwHn+neEyD
 u7PqeTyyGgmup3F+UgEG95KUSSuyjHNbMJxqDntuTtS6fkBU19zBMT9HGkv6Q9GI
 fpmr162wfZpUnLV9+yRr+xRm/vaVaWTt0WxyLg9aB4m3g9+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42jbsa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 08:05:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c26012cd0so7454661cf.0
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786694713; x=1787299513; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9aocAErqtcOVa0azkPqHmNxwJ2foHbbi/pvrs3OIGu8=;
 b=KfTcbL5gCfdGGXYH27fd5QVIsD/uwKRAb/7IEmdKXcOXUR0/oHrRvuwhvzsZeQYiy9
 JNIsxdDiPySLl+/wiG/caTLxy8432vRwEiIrbCljoXPfgUYXtalSB7tIdjrWCcGdf61C
 xFYwkk2jDnyw+EP9L684boQXGbsK4eC12JeyOZcJO9cFdqtdeIKipEa56gLBFz13gyyt
 bs7guUuQ33EjChIYyTFbdPJXdYsFyg83mkzcrqyW5Ald87l81lyETJVkr5Qkj7LcWvGk
 ecpJkyE1WRCLkORMnQ8XoW8FCz3MFW8WmjAAzJGCuDYBNaURKiF3MKR4MvaGRgrnd9A9
 3YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786694713; x=1787299513;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9aocAErqtcOVa0azkPqHmNxwJ2foHbbi/pvrs3OIGu8=;
 b=Ls8cAx+9MzD47dkBPsRfCZUTjKmkbKWkrsZHUM/9p9R23qAW8KjHp8MwTEh2flmVQC
 E1cDoBQ3HrMu4UtJ8yVd2gkr9BRNXn+8tYS+aWAvPmngXCBWfxHsh8zel60b2I9uakYw
 OnT3GgxUnAYSLDGD6OrGceFWX99y4sZwfan6ApDfFZ6XSJksXOg2lG3u4zJzPwsxRNRz
 5upq/Z7XYuEcwPZFwmXuChPPzTBKo8kQRNfpMjtw40lStgJ1pYi80UBjMl6SRhzahCGP
 ulKRQoo54yfd7GlVVS8WyA95N7byXGvUc95+FH6/kUbJoSUTVgV+54rR3ZQLC8yVgxB9
 jcaA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYnyt/nrOxOtq5NfHLU/ID9X44mOReftI+jwGGfmNRzAgRzhW+eb+7IrMUV9uDe28kh6OfXaY5Zg==@nongnu.org
X-Gm-Message-State: AOJu0YxTb/Pq9FxiFm+ws1N3MUFb+YyRnFX/y86RyGQ2kuuwOEqZNuSD
 SXJSfliYwi+RcWAKVJmf/sATbGi5CMehnWBe6gE0LZCqWTGNMdiobm0yz6yO2JEuHOgsstJa+bl
 dAkG8o8dr3d0rFe5/F++uFa/qgsFP4yvvbSToorLXySf5NfqJnW50uIg=
X-Gm-Gg: AR+sD11yHp/z7iYzDwLfQluPG8uFeQLXkqW+w8y3zNEP4QPn/O5Jd1PO+9nrqaIrXP3
 1HgT3lG95XWVT1ZI0ep1SCEWqIXDuM5UJyl/2b1MzWHddSjEFYF//AMrI5Q1dHhKlPuJIN7Bspj
 cbd90mJKYU0zFu8oBQ+kn8dnxS7u5OxBb7YrEv08lojxgnDs9/7jwOIcKxFTnn6gBvUU2aBl6AF
 Jx1kc9GMIJwnqchbe8XMGTrLM0jxZWZaWLia0arv99iJgP2Nbf20hk+bg27ajkzTMJffiz30cMi
 1LnUDEEgBRJGVKX9RwfPT/BFZncREBaxnwwx5gh+DU2Uh79VwhBQrarFCQelXbgXmv02LyxRT+z
 ZY0X3CFE0+2pqijyFOG25P7WSZFzjLCDUWHhYFX+n2w==
X-Received: by 2002:a05:622a:2c1:b0:52d:771a:23c5 with SMTP id
 d75a77b69052e-52d8535ee35mr39009541cf.15.1786694713093; 
 Fri, 14 Aug 2026 01:05:13 -0700 (PDT)
X-Received: by 2002:a05:622a:2c1:b0:52d:771a:23c5 with SMTP id
 d75a77b69052e-52d8535ee35mr39009051cf.15.1786694712623; 
 Fri, 14 Aug 2026 01:05:12 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b1d9fasm33143445e9.9.2026.08.14.01.05.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Aug 2026 01:05:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH] target/arm: Restrict arm_do_plugin_vcpu_discon_cb() to TCG
Date: Fri, 14 Aug 2026 10:05:07 +0200
Message-ID: <20260814080507.23196-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ecc3a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=miPjsMsDHGcx11BUPycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wQK1JbUBv3NIHSym_kfADXR1gYAXecVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfX2yjDBuYdQDaM
 jh2VeDglRufVizpTO1/NvA3AgtAdbk83NAGxSllRI7/s/gpOIvR3FmJxcnfwMGdaZwer5wq2+wN
 G6ShtuMc7zYSv+zXkxP4YpHmkRbrh8QNTOwujUOkuSdRj8WDCZtNEjIaY/tR4degmU26azUXh9p
 9zahpqmPRPCLPu+PuR/xZxfA9/MBnbiqXPzFUzXIh1dFU2X+waQrIhIy6WEVEJhy8cTV8PbU5Kx
 BAJTnhv2n31vPJI1Zgjc7Mvpi15uqGIPwCciwC39HmSXKAQNxvcNTAzSeaVICXPff37FrD3Hfr+
 A0tBNq1iJU3OT88JFnDfISHuf17YBcLD6IRjTnpqeUxML6rR9VFzk1fmvfHUbJXGnx1UVaOKnCy
 GBXO4L1Xtnq2sbnF2Vta+SPCil09ndQLb28yR/BHlCVmbda0TgEGYGKiQkN5OWJED0pVk56/Iwv
 2BTXXHpO367yqMYg/TA==
X-Proofpoint-GUID: wQK1JbUBv3NIHSym_kfADXR1gYAXecVB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfXyrb39ziG0Kfv
 PJFywkhqe4e/Co52JUfBi7s1cTCPIjIVs365ybCrq8sFmudQ++PBBqUP1EGoKoGNDBt5ujY4Lmb
 L4NVTiJaYppxCoPXZDWAVby8OAAE+7g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140061
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

So far TCG plugins can only be used when TCG is available.
Move the arm_do_plugin_vcpu_discon_cb() call within the
'if tcg_enabled' block and wrap the definition with #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index af45234ad2a..adae2b2b8e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8915,6 +8915,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     }
 }
 
+#ifdef CONFIG_TCG
 void arm_do_plugin_vcpu_discon_cb(CPUState *cs, uint64_t from)
 {
     switch (cs->exception_index) {
@@ -8932,6 +8933,7 @@ void arm_do_plugin_vcpu_discon_cb(CPUState *cs, uint64_t from)
         qemu_plugin_vcpu_exception_cb(cs, from);
     }
 }
+#endif
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
 {
@@ -9677,9 +9679,9 @@ void arm_cpu_do_interrupt(CPUState *cs)
 
     if (tcg_enabled()) {
         cpu_set_interrupt(cs, CPU_INTERRUPT_EXITTB);
-    }
 
-    arm_do_plugin_vcpu_discon_cb(cs, last_pc);
+        arm_do_plugin_vcpu_discon_cb(cs, last_pc);
+    }
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.53.0


