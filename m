Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667A8CA5FC4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 17:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChPg-0003mV-2h; Fri, 02 Oct 2026 13:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChPY-0003h2-O8
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:51:08 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChPX-0007Ih-1N
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:51:08 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-340f56c44b0so3438663eec.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963465; x=1791568265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oEyujAwpsRaAxwTHH646nyJUYrC5y703ZAv6Bnw+1fA=;
 b=bOVnEl2txH0efrZPUoRziRjUAWG+AK1niWwZdXztHT53TZP4bfw0RUDDHLBpYp3/Ud
 noCSUB0yfAro2NbI5ANjp5m5HCO733mj3FCd2HAi4fMf7VRusmmnloNXWghrt5mUFYWc
 +hr3XHsf/Ni1DN9xEGyYo44bv32Y95gtlpXH6msATbD820o62nBaje7B6VXCdy+5Tw6H
 m1NQhx+iOI3tTfHFw4hPGc6hg4QlOu+5zDXz7qRudCzwYPP0JE1jDnhBKZ5AmNXlSFzu
 YlPvVkE4B6XjjlUardtLhEENQqDxxdTw2FMGUt+ALNDQfj5fp1lBfsV+fsDjEt6+wMlY
 2PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963465; x=1791568265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oEyujAwpsRaAxwTHH646nyJUYrC5y703ZAv6Bnw+1fA=;
 b=El2k+UcNhHmI3Wtv7RtFSPK23Nynnpwr5rpUITOIaSAQZm2JpGU0dy0czz9iLpOhV1
 kXUk8YfOrff4fhhkGr0ecl6biExXFzs3/ec5GMKRJHLY6Hic1G3XvkKo03wToGinTS6v
 ZjSbWmC0eAdKb5dA/21MJNBqtlepOu7nQ1CXGV97mN2XRVaxCz0HdRy5qvebA1v+niQt
 TtGegB1mYQZmTEycvOY4AZ4P8UjdrCL6jsPPsV8Fn1+3lX83kl0bQK0pbM2Am8edpemB
 LlIqLhqzCfy3qma1/Q2aL+a5TyjnIFyuJPNFXQ1JFB1LUAgpWoYdSAr+nZOBoc1KuRJN
 UZ2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy706K6jqYKT6iMLosidIC1ZWUNEWzmYeTI0Gubc8IdU07Pqwals8zLJyJy9pKpe9+zFduCOhThuQ==@nongnu.org
X-Gm-Message-State: AFq9FYLLlYgd222oi0QC47frudKafgs/z85QjkeO3aY7QQ8I2X2wccJa
 M/H2FBs5XdK/8cBlEr4l41Rr6PZeQZBpMRQozHEkdifYWdRqjC2JaBIx
X-Gm-Gg: AYBFou1k1xDhqvMZszZX51Lt4EjAwt3SaXTWkQaIA0ZvnrDflgg4HHHIMnIbQoNG7kS
 FOK8Y8qcKJkRfv7a83eeOpRK7MtCAr5yVCLGVix79NRjCpNf0D00wyPe3T5GSysATIxdJhf2pbt
 XbK3sCbdCg2GnwYfe9BVUna793D1wiK03/6hWAsmNwFDowM0/5y47ScKllZveWhCI9KQFhfgwzf
 1i9MCWdctK+aftkyEOv6sMoZp5r+Xm7s31NP4RoNsceEGMZ46EydOLTPNs8VE/TtptrzO1O8R/k
 yaIiCpstRaiiYcF/Ms9xOB33/fesJwgWq4PYuH/emIWW3s1ValOEvtqzMpaiHjtVSg8bYMIIvT5
 NWXbfKQR8IvL8TqNi9dyc6AMjpUjX2YlwE97C7eE4WVNjR86261VAazHmdOPSeomUSEu+Nag7Vb
 sFEQm+8wH1L0H1H0FxVbBHqrb1nqVt0ewxexjuKa5RakOPssbkRBcxgjm+vwNskPF2npfh6FaPq
 O6hu1p426Sxdn6vMYnPDbLaDKvDoMo=
X-Received: by 2002:a05:7301:707:b0:34a:e4f6:4a4b with SMTP id
 5a478bee46e88-34f150c3c64mr3357679eec.21.1790963465441; 
 Fri, 02 Oct 2026 10:51:05 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:51:04 -0700 (PDT)
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
Subject: [PATCH v3 02/27] accel/tcg: add cpu_raise_excp and
 cpu_raise_excp_restore helpers
Date: Sat,  3 Oct 2026 01:50:10 +0800
Message-ID: <20261002175037.1747-3-luoyonggang@gmail.com>
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

Add cpu_raise_excp without host state restoration and
cpu_raise_excp_restore with explicit state restoration.

Signed-off-by: Yonggang Luo <yonggang@gmail.com>
---
 accel/tcg/cpu-exec-common.c  | 13 +++++++++++++
 include/accel/tcg/cpu-loop.h | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index d20cece1c5f..b551c1439ec 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -118,6 +118,19 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
     cpu_loop_exit(cpu);
 }
 
+void cpu_raise_excp(CPUState *cpu, int exception_index)
+{
+    cpu->exception_index = exception_index;
+    cpu_loop_exit(cpu);
+}
+
+void cpu_raise_excp_restore(CPUState *cpu, int exception_index,
+                            uintptr_t retaddr)
+{
+    cpu->exception_index = exception_index;
+    cpu_loop_exit_restore(cpu, retaddr);
+}
+
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
     /* Prevent looping if already executing in a serial context. */
diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.h
index f4d38bc2bca..5282c70d5e4 100644
--- a/include/accel/tcg/cpu-loop.h
+++ b/include/accel/tcg/cpu-loop.h
@@ -65,6 +65,28 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
 G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_pc);
 G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc);
 
+/**
+ * cpu_raise_excp:
+ * @cpu: the cpu context
+ * @exception_index: EXCP_* or target trap number
+ *
+ * Raise @exception_index and exit the current TB without restoring guest
+ * state.
+ */
+G_NORETURN void cpu_raise_excp(CPUState *cpu, int exception_index);
+
+/**
+ * cpu_raise_excp_restore:
+ * @cpu: the cpu context
+ * @exception_index: EXCP_* or target trap number
+ * @retaddr: the host pc within the translation
+ *
+ * Raise @exception_index and exit the current TB. Restore guest state from
+ * @retaddr when nonzero; otherwise, behave like cpu_raise_excp().
+ */
+G_NORETURN void cpu_raise_excp_restore(CPUState *cpu, int exception_index,
+                                       uintptr_t retaddr);
+
 /**
  * cpu_loop_exit:
  * @cpu: the cpu context
-- 
2.52.0.windows.1


