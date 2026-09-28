Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D239C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3nt-0003LC-30; Mon, 28 Sep 2026 01:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3nm-0003KC-GD
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:21:22 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3nk-0007lo-Ud
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:21:22 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd04f7f2so1565936c88.0
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572880; x=1791177680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q9Wafx0aXX2Ni1bBJzRLIBOxNOLdNJdd9ggXabMSVEY=;
 b=BnV6i6kFt8Y+JqHVKVHuMvivV4ql/mOt78oHBBtf3DNHyGfbm8UoTjoTd8MYIU4wuF
 PLs5kI6BTnEGKgK+9uuqzu5El39S5OUUw2C4VYYipTEpvaWnk8svqnS+UvFXXB8TTldB
 +2k7H07vkixAlSemFjmRSt+gxgh+QoCmHuNWyLIr5HpneghpJ4kPWYkEq7nHxXo4xxOX
 J4Fk3Ly47pG5Vd/AgoDDgtC9ePWNSiGsTjQoYiABQSSXmIfkpngno0foMLi5comdOofl
 dzqeKdvcPg3H4koo21L8U6AaQbLkuf44zdkNJVQuPe4nRhNsRjVmn715CcALCh704+8u
 6GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572880; x=1791177680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q9Wafx0aXX2Ni1bBJzRLIBOxNOLdNJdd9ggXabMSVEY=;
 b=u9h7dFjEeDs7HkWa0kZCj53HiJvP6KrMudNZv69KqbH/Jp5PSKrv8x7pIVWw9evBJp
 zgFbwqCnvwaaQmWPwgv4e5pYn9YWxJhmBlnGmH0sGd9nwBFitshvp2qAu4QKvLHoMnam
 n/MbRWvPCVjoPNPIx0Ja31Lg/F9Z6XFZVyjCj875hzFacN73C5d4yrisPFtVEn9eBsp+
 gWRQXwkn7MdEYWmhro602Dl85MS7HwhO3G7dkIY1UZB9hDZzx9F1cUNOs14FKdh46Z+D
 pRMCXcKnZ59Ty7r0KCQEGw9cR+36cRso+FxpcwLNuHmNJ0BowEth3nOj9B0UrXH5t8Ra
 yF2w==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2y7uma8q9YhA70y1PrSkwaWTDZ0HC8Q+nCy+1W9sUZvqxcfQizKeCDkBFyiM9wwhKineesSbKHg==@nongnu.org
X-Gm-Message-State: AFuF++kwbh85tjCO0uBPOz7Eb4mXvPSWb3TWsWJJbmSUhFzBS8PVqKu+
 fwIK6ZFAwkE19qaawy5v7h12cclgg+TyTHPT9OhLt+ie6xTvK2BZHHwL
X-Gm-Gg: AYBFou2dH+utuwA7wnu6aK1wiBG6z3p1U1++X88rjVLHTv4dN5NOCWo5DtXVn7VUr7y
 p26QRPRsupDrp6K+p18AdZgiF7iMTuaEPBU6/H23W4yHfkJsFNBP3z5BZ+7bvIrc3q5BnlA92Xc
 4JN9w4hq5b25QQEGghV5C7WCUuBOjJlBzJ49tvGYZBXV4heKk+ytuYc0fpdPX2/FM9YUUSwDidD
 viO3z2iEa97tyc1RlIX/MyQmhkTMYWfbKmtvxZuQHB+qC5uY646BtvfDz51dIXQI0FSBur//j/A
 HJlIyKq0Ub9JfIYcgH22i28Yj/zrbui/W5PG7TCREWBLPg6F+qiGIhUPNqntti/PJqOVmZbNsLy
 yglpeuizx3cvHe1UarwWV3Q58s/Uw/QlVkkOWwdDacsJMeTbtLmTQErW1UtOlCefup3kMLbXdjS
 dBv5wvkNS5p7Z/cykKwIe8LGRL2SlyeV8716WDqL1ZM5vyn0+uCrvKzfcIUrF04vvitQUSuN+Nj
 MpTFEgyK36+qEDQpd2Il/MRhfrroSc=
X-Received: by 2002:a05:7022:1588:b0:147:5149:d108 with SMTP id
 a92af1059eb24-1475149db52mr8939208c88.43.1790572879456; 
 Sun, 27 Sep 2026 22:21:19 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:18 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 02/24] accel/tcg: add cpu_loop_exit_excp
Date: Mon, 28 Sep 2026 13:20:28 +0800
Message-ID: <20260928052051.251-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
cpu->exception_index, then restore and exit the current TB the same
way as cpu_loop_exit_restore.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/cpu-exec-common.c  |  6 ++++++
 include/accel/tcg/cpu-loop.h | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index d20cece1c5f..31fed8e497f 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -118,6 +118,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
     cpu_loop_exit(cpu);
 }
 
+void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t pc)
+{
+    cpu->exception_index = exception_index;
+    cpu_loop_exit_restore(cpu, pc);
+}
+
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
     /* Prevent looping if already executing in a serial context. */
diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.h
index f4d38bc2bca..856091020f2 100644
--- a/include/accel/tcg/cpu-loop.h
+++ b/include/accel/tcg/cpu-loop.h
@@ -65,6 +65,18 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
 G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_pc);
 G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc);
 
+/**
+ * cpu_loop_exit_excp:
+ * @cpu: the cpu context
+ * @exception_index: EXCP_* or target trap number
+ * @host_pc: the host pc within the translation
+ *
+ * Set cpu->exception_index and exit the current TB, restoring
+ * guest state from @host_pc the same way as cpu_loop_exit_restore.
+ */
+G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
+                                   uintptr_t host_pc);
+
 /**
  * cpu_loop_exit:
  * @cpu: the cpu context
-- 
2.52.0.windows.1


