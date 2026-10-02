Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C05CA5FC4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 18:00:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChWw-0004YL-Gp; Fri, 02 Oct 2026 13:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRX-0005S7-KG
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:21 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRV-0007hw-Na
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:11 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-1438f55921fso2381494c88.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963588; x=1791568388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V/myMGrF9litc5fpiNrbS1vsILsiL7VfUUCto3gkYyo=;
 b=neTnudzVmbQFQW3bzJYFfmkqGjtv7C8qiWaLrshg4s2VcuyzWrBcZ+a6Q7NPIC2f2f
 fsg25+9t+IIltNnAAV9Ii7Mct9c6qA6crePjj4ijQZLuoUNPk53QHCXxNIbGmvLofOt1
 tORKDoVNuxzLMgWIrUu2H3yVVR3nqIjm11GOWPdGeF+V0AJ42VNZ4t3UjN2kzOrWcSyo
 dYQWOFKhV7YKBhb8YlWHe0ET7mVO5YB334NIr0G/t8G9b/dr1rlqauflHchVHuAlvv17
 X2LwvcvLn9fscYAg9o+ZrNKZM+9ALJI3VuPG+p3ZC98kzzpa/m4D7DaLmoBO7cjBfoZU
 IlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963588; x=1791568388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V/myMGrF9litc5fpiNrbS1vsILsiL7VfUUCto3gkYyo=;
 b=IBVQiK6SALU1G5orbC0/iiH+2+tGTxGfKYCBIC4b0sMYlYDJfVS3nGOH6u/zvjiMuR
 SFDBaL+qky9wXltKDRylQU1sok1xMM/xClg0KqWK7k2feWzT1yrAxQFg0xuXsIlP8nCE
 lDmFC8Mh42lnvQDwxTI4i6qkiMWjsyZMIXC/qGZMpfcPSU7ghwA7kNN8BcOhbRM9nMY1
 MGfS3jUOiXQktxttjxOSp7o3pu8T9+ga2mdGz6CZ3VsORP5W1YVKd9MI3Gbc/Xoc5DVK
 SHRlMR/I86mT9JGQOZqkBqWVs6ozmT9WIV8O/zhpYSEK0S2T5cpOVvmUHdvd3fRnNye9
 MJXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzR9ygyI6LzVtyI7SdvZly/NIrZeqpC5H7GEc+FRsbT75DoiDjnHmYKSxY7neGQVJwJdt+ZUGDmPQ==@nongnu.org
X-Gm-Message-State: AFuF++kPVeyt4llr5iRS4WM4Vqs4TKbWojEJY5ThonqNdD98o5DvwcCe
 i/ddcAZZPdwShcHNK4iRQUie1iwcM/bi3R5/9ICmZbDIQIv00/eRTTe/
X-Gm-Gg: AYBFou1Oh4BblKof6my0+/ef4Ay9Y6vFsIzV56sD/8jGNyZiJREyu7dGiFL6oMVKaP2
 PzDNAIOYZq+I3H20sP2O53csq6a3zIhwcrgXlVEAg9TTxJ+RQZV2wEOWkuzp2uf33E/a0c/YUMr
 W8u31uGPTHKcNN75gV47rb9WnO0jkldqEkcKJcTWUu8L5rGFAwju67RhBsqLoKoZHVfkk1rxzfh
 HlgGfRruGJSIs0jRul3pL/65sJ3MyH6gMZoUOq3LsaOVQlhtHoPEOHgx/rGFNkrY5Vg7axmtdt2
 dHIKeSvetmoFTE5dC1chnBOTBrMvrCvzf7AyPItJpTl0hzMg8TJ6HoAnz3E1TWchF32S/KGNkh3
 EZHu0SM46tn8kRGfcpBm4+RWrb7PzBUcNiqwkzrC+As3zAZ9FQuqy6Qs1v1F3hJ8G6FK2+Ra906
 k3/HbfZ0a0EDmIt4u1ZH5PjFau6LaL2En8gBPBgB3ncW5F+xL/4j61Ms6SdoAtqDc3wSXR5H4JS
 9C7vXJYpvRB5jue0ekOsWs1i1hcVFk=
X-Received: by 2002:a05:7022:1b11:b0:144:de98:eec3 with SMTP id
 a92af1059eb24-14f590cab13mr4538814c88.5.1790963588190; 
 Fri, 02 Oct 2026 10:53:08 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:53:07 -0700 (PDT)
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
Subject: [PATCH v3 18/27] target/hexagon: reuse cpu_raise_excp_restore
Date: Sat,  3 Oct 2026 01:50:26 +0800
Message-ID: <20261002175037.1747-19-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Inline do_raise_exception as it's used by other arch.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/hexagon/internal.h  | 10 +++++++++-
 target/hexagon/op_helper.c |  5 ++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index 05d1129916e..981ff7c4607 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -36,11 +36,19 @@ extern const char * const hexagon_sregnames[];
 extern const char * const hexagon_gregnames[];
 #endif
 
-void G_NORETURN do_raise_exception(CPUHexagonState *env,
+void G_NORETURN hexagon_do_raise_exception(CPUHexagonState *env,
         uint32_t exception,
         uint32_t PC,
         uintptr_t retaddr);
 
+static inline void G_NORETURN do_raise_exception(CPUHexagonState *env,
+        uint32_t exception,
+        uint32_t PC,
+        uintptr_t retaddr)
+{
+    hexagon_do_raise_exception(env, exception, PC, retaddr);
+}
+
 #define hexagon_cpu_mmu_enabled(env) ({ \
     HexagonCPU *cpu = env_archcpu(env); \
     cpu->globalregs ? \
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 4f00ca773f3..1536e81d4b8 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -73,7 +73,7 @@ uint64_t HELPER(utimer)(void)
 
 /* Exceptions processing helpers */
 G_NORETURN
-void do_raise_exception(CPUHexagonState *env, uint32_t exception,
+void hexagon_do_raise_exception(CPUHexagonState *env, uint32_t exception,
                         uint32_t PC, uintptr_t retaddr)
 {
     CPUState *cs = env_cpu(env);
@@ -82,8 +82,7 @@ void do_raise_exception(CPUHexagonState *env, uint32_t exception,
     ASSERT_DIRECT_TO_GUEST_UNSET(env, exception);
 
     env->gpr[HEX_REG_PC] = PC;
-    cs->exception_index = exception;
-    cpu_loop_exit_restore(cs, retaddr);
+    cpu_raise_excp_restore(cs, exception, retaddr);
 }
 
 G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
-- 
2.52.0.windows.1


