Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483ACCA5FC4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 17:52:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChQB-00049J-8W; Fri, 02 Oct 2026 13:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChPh-0003nf-IK
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:51:17 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChPe-0007Jf-Kf
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:51:17 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-34b3e517e6dso2357419eec.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963473; x=1791568273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kLOBJyItJ1+wNCmx4Q5Z29VyAFIZnj6HoQfSvPthpZk=;
 b=ET9WTKKNOsAYEA+HuRudT08kUE8vVbVJxBXLVf6gzjoFDQ1XhmkZU1rA9wbIzvrmnV
 H0CCu0KJfSewgJOr1D/OUU5qTHHY0PRD6sScrNFnTYCkGTBSp3GjX+QfoE8ROETVM75E
 PDXxCXBglB3NimuXAjIMRLCoQTzdGxWRFSO98Mf2ns9Tuy6iCq3l2AQAWoC2ji4vOFp5
 T45McXq1mqe8spVRN0NqXcnxtNTo1VtiJxm+Fa5xx6CkeWfQ8Ya5p22afIuIgnpqsYu0
 g1YKQtiJUBgudC9jbOcQ5ea8+2GydZzrij5murSKr7v6xr4wXGDXxizsLftUCLIKVfnJ
 qhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963473; x=1791568273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kLOBJyItJ1+wNCmx4Q5Z29VyAFIZnj6HoQfSvPthpZk=;
 b=uFMxtBj5sQM/mfUZiiqIrHR3uIzj1qV1WXThhiBPdr/LONvjohy1UlNR1OG05ZF+Al
 d6LGX4JQrKItOaWGUNig10AAZeaVPR/jd+tqBsnLVyNc7In+AOhxmuX5AR3Kxjxpk4Gr
 UbQ71fc5C3/KIgVtVs0h02LWDdwcJx6t3KfvOgd5Grklkuo212QlGQwFnHW3Tn282iLz
 njZtGNLSG0Oo4vv+k+8RlLsevRzF9man3Qlvb2P5FZswa0e9xHGgl9Mn5zcRILnAexE8
 /ZeOoQ21PTuWAGI+StiN9FRoYwBiDFfagb+Ad2HpQgsMjUKxjPGPAYqaUXhDFIM8Xk8A
 wkNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx3p8dqTVwp3VbwwGaNnLpXGKMKdG1bdYOunYFzPF55aF0du9JZ7uFPCShBATeJTf45+hPpVcpy1A==@nongnu.org
X-Gm-Message-State: AFq9FYLxlaL9MWzlje1SWg5CI4h20abpPMGoQg2jwjQjKQFZNAITgMf/
 fe6fltvR4IOZdBAX2iVYH36xIpsk3muuWdTkFdul3pFvuByrGs39ieC+
X-Gm-Gg: AYBFou39tGWossxkqkeDy4g2jsL4zD6qt7RvMDcccxSvvXTvvmvGVcCuZ/FAnmkgKEi
 U/m6dDCBgfqU+0HZ5kEOJ9bR23aOprNYm91wHAIaQZ5hW/JjSJhjAhKlva+QSJl29vT6IJk/fmL
 JYrghgj69+Q06XuGsfV4xtlflUpwyXIYJb7iV6S433zwsYlTx+JYISMexkPEX25a1bEd8FhPuDm
 d9PcpjzYiat8jaDn3HMWjxRrCGrs4E/Y3GP0h8B6n97zLy9SGyHh6txkeMjSpE6Wt9gaCvmlDi/
 PJxWasr3cjXpsIqatIRO8mGq9ko+pK0Iaeelw48GL43lf1h90LilPxJd6vGI6xx9Nr2t6odRSOa
 vu03MvzJqb3HjNTxWA1m9Fc09vKQmFkF5R1l5mKkIFb168CBB6ohXHYCTXRwgnQ5eMGW9v6uAfh
 WE957CiUBFgg4R76ZnP5189t1iIWTuo+PpHme1eMnQ/BFs7BwFXgwVy42xrLKTUOBXx4FN5/bv0
 U54ySy25gpcJ0M9etQypPbbk1ftKG4=
X-Received: by 2002:a05:7301:b0a:b0:344:1bd9:1f0d with SMTP id
 5a478bee46e88-34f150d42e6mr3480798eec.21.1790963473082; 
 Fri, 02 Oct 2026 10:51:13 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:51:12 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 03/27] accel/tcg: add raise_excp and raise_excp_restore
 generator helpers
Date: Sat,  3 Oct 2026 01:50:11 +0800
Message-ID: <20261002175037.1747-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/cpu-exec-common.c | 12 ++++++++++++
 accel/tcg/cpu-exec-common.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index b551c1439ec..715e3cb327c 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -131,6 +131,18 @@ void cpu_raise_excp_restore(CPUState *cpu, int exception_index,
     cpu_loop_exit_restore(cpu, retaddr);
 }
 
+/* Raise exception and exit the TB without restoring guest state. */
+void HELPER(raise_excp)(CPUArchState *env, uint32_t exception)
+{
+    cpu_raise_excp(env_cpu(env), exception);
+}
+
+/* Raise exception and exit the TB, restoring state from GETPC(). */
+void HELPER(raise_excp_restore)(CPUArchState *env, uint32_t exception)
+{
+    cpu_raise_excp_restore(env_cpu(env), exception, GETPC());
+}
+
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
     /* Prevent looping if already executing in a serial context. */
diff --git a/accel/tcg/cpu-exec-common.h b/accel/tcg/cpu-exec-common.h
index 19359a97bae..1e82f3b14d3 100644
--- a/accel/tcg/cpu-exec-common.h
+++ b/accel/tcg/cpu-exec-common.h
@@ -1,2 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
+DEF_HELPER_FLAGS_2(raise_excp, TCG_CALL_NO_WG, noreturn, env, i32)
+DEF_HELPER_FLAGS_2(raise_excp_restore, TCG_CALL_NO_WG, noreturn, env, i32)
-- 
2.52.0.windows.1


