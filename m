Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3058C982D6
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 00:44:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Mh2-00075y-Pe; Thu, 17 Sep 2026 20:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mh0-00071s-Cs
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:43:06 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mgx-0001Rf-LV
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 20:43:06 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 98e67ed59e1d1-398a1676000so174499a91.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692182; x=1790296982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p8jipkRCiZErY6Unp0DQyf/hv142izPNPRXYzqEKx5g=;
 b=J9KriP6XzhnRPGlXNKVkBZitQ+l1zeyX2gUg4QtPjRaCPFNytT8LyOP3iIsv0ITRK0
 DzUx2K9ZSDts6VFRdd5Kv2zwLVVnzCq0NAgOsMHtTTDcJvq5xhN/YxGGQqM2XsjbjpG1
 DhmOtUDIUuvZnw2tY7b18B9/AHxDF56P1cjkvXBqO2/cey0qQE6NAQzyXXtUXy27f9+M
 R/0ImO8Np8pzTI+iAcZ13uR43vSymEF/FncXzjjdF1BftNXv5Gv1ntU0xyxQAc+1RJRU
 1VYh8tbpvxsuIH5C4tpTAcavweFJYNPqZEmu6L9AtlytkD6HXQLPpmSKARpJZ3YX/8Ld
 UcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692182; x=1790296982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p8jipkRCiZErY6Unp0DQyf/hv142izPNPRXYzqEKx5g=;
 b=wYwlTNoRUlCxVa19A1zS+nwiUaBfeWUNSvLy8jcDi8g9dQihlKlLJ+NCIa2wXfmn7U
 Qtpp1wDqqj7BADhESd6VSYOqro2KyPAr/DqJbC+ktAMo3OxsYENk6adQnKS5lvCYX/5x
 WanrsafB/+RzJyvm6+MJLkN16IiYUlm+jDr1dTnDehFqn5ipFSMliDrLppYvMUuM7KNg
 EINZIrEVviGNxtkkvvz32kxzbPQtZSKYWaXPBGZmZlOVOhB2GwI3QtquwL1EAtenQiQO
 aUNnM2+W7795kg1UfUWdurwpJecvbOZ/QorI+lHBP92z3BQuh3AXUUt9fEAKeyYnUERH
 VoMQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4BncG8mFLcKq3nTyv5ZiUuUqdiYzPLKCrm+EASkF12BTgSqlF53+J+frtDE5bCrcmWE2UFdsddg==@nongnu.org
X-Gm-Message-State: AFuF++lUHRkWYdSdO4U3sjAPQ4mPi8YNbrjl0wK52hbjEVNsExoMV+uz
 lmUuYG7Ds1u6LSj5ZYSJm+OfO1gckUi4MEFKWatGeiFkKHxONiBpo5dV
X-Gm-Gg: AYBFou0Fpugr4BwwMUST8FhGC60EjKh/1aHqFoHknT12NRJPQBzjQ81gHvebVa2J/U9
 icyMYTWXNDGbGIwC8TB8E6VdXyL4qDKY5O5nAtH00eotYAX+l3ttmGpx7OCeDEvp0AXZGjsL+jM
 /YRNRwu+r1DEv3QoofQuaw3H/vrMaExeZjyixHhlKYngy6xF67d5F9mPLw2Caf1KVNesrD34E/U
 IDp2chgroE//QlRTcIS5lMIkap+gDMA8eTj8E9CrFMGyQ9TqTTgKDdTvNe9kTW3m4f+adHvX4MM
 6CFnhYCCA3QP4bQqCEPUIkhS9/Nleo9fb3C3A3Gf74SPasnAfAm7oHTBvIQ2jpg7alwznQjJTrx
 HomY9t1i0W6bWjXSk5WnhAge3QBSrM14zCAxMZ+akl26iU5Uiq45aaQQQzpNRi8KmK1jjiY3tmJ
 IdKidcq+QsCPoeRLqT72+Ax6GbSUVEyK03URkVXNACxpeyrsl360VtWblZ/Cvl7U+qoW729UBMq
 xgnV440ga5/Pi9sDwP935ckjsGiC/wx
X-Received: by 2002:a17:90b:48c6:b0:39e:131d:4510 with SMTP id
 98e67ed59e1d1-39e54ce5062mr1882200a91.13.1789692182105; 
 Thu, 17 Sep 2026 17:43:02 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:43:01 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Nicholas Piggin <npiggin@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 03/21] accel/tcg: add helper raise_excp
Date: Fri, 18 Sep 2026 08:42:05 +0800
Message-ID: <20260918004225.827-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add TCG raise_excp (env, exception, restore) that exits with GETPC()
or 0 via cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/tcg-runtime.c |  6 ++++++
 accel/tcg/tcg-runtime.h | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 7c0aab98a80..ae93765b09e 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -130,6 +130,12 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
     return ctpop64(arg);
 }
 
+void HELPER(raise_excp)(CPUArchState *env, uint32_t exception,
+                        uint32_t restore)
+{
+    cpu_loop_exit_excp(env_cpu(env), exception, restore ? GETPC() : 0);
+}
+
 void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(env_cpu(env), GETPC());
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 0b832176b33..036a33d566b 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -22,6 +22,17 @@ DEF_HELPER_FLAGS_1(ctpop_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 
 DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, cptr, env)
 
+/**
+ * raise_excp:
+ * @arg1: env -- CPU env
+ * @arg2: exception -- EXCP_* or target trap number
+ * @arg3: restore -- 0 skip unwind, 1 use GETPC()
+ *
+ * Shared TCG exception raise. Translate calls gen_helper_raise_excp.
+ * Exits via cpu_loop_exit_excp.
+ */
+DEF_HELPER_FLAGS_3(raise_excp, TCG_CALL_NO_WG, noreturn, env, i32, i32)
+
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
 #ifndef IN_HELPER_PROTO
-- 
2.52.0.windows.1


