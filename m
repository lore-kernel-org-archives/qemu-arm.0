Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp155531dlq;
        Tue, 21 Jan 2025 06:29:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9vBzqNdsI8A7P2FthYWyf+EwZULmzBQYB3QPRuCvd+wJUM16jxQ92uNhenpywG+YUNzq7n15N55Ni8A==@linaro.org
X-Google-Smtp-Source: AGHT+IF8URDXJR4psHTEZOtiyXgnSHYK9OoeYdi2UIk+hbcoK+gfQObGnyv42E1NTZ32Do0UM4tS
X-Received: by 2002:a05:622a:180e:b0:467:7fbf:d10d with SMTP id d75a77b69052e-46e12b70d8amr285244291cf.23.1737469776666;
        Tue, 21 Jan 2025 06:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469776; cv=none;
        d=google.com; s=arc-20240605;
        b=aYXfAhTxExqMhKktcy2eAqyfjZQU7Me+C7IaBml+fveZHGvQka6ocHoblHBYq/OqIV
         DrnZydSLN4IbvyLIVyZ89UB5JuqGVu6DGgBNusIM3ks6gaMQUR4Sm8BAwhlFuweg815Q
         xBCoxGwtv56H2rECEiFW9yfPYXVhcTvhtbsJdHJTKsN92XQPR0vlENUWrNFjHWweZkq8
         2ja/UqAfRYVuy5/yOCturQlKOheMgdOXLenkNirPQ4cqzb/6GHhtuwPWg20oNDD28iJR
         o1K4OwKb8H7sMa6ZmRwvMyYDZUuoek72qCCkXWRFZ90WIuX34liLSkLu92P+T+FV+Exn
         z/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y8HZuuYQMEsWgExTk6OZpUbl9UQpyo61BMv/xXe3yCU=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=AMQXcnxUWUY77W/mHdbzAZNACArTYIU9I47It5TuKcfkcTGlbVLTNKwKWESaAfZ0v6
         qgPtJP2Vw314VMfUXUOVBJ5E/dyiGxuao/FfBg4/xOD9D9gYgy3HUurFTNC9q/Cf0uYE
         p6hNWsnT58PLPFjSSzIM60ZP96ZgEERC9J4MMTWvKik0uJJzjVWPe9TQy3r267eYvRgU
         F6xQClS3vCjlU2vDvNOWsaTVSNIEMgs2BhJu2u4kdDC1XQ6hK7dd3Tlxat4ifSOg/t+e
         KfSy6IeJQoGVUlA9bX5vL4YeQpWotv4mo/qsDLieU0Vut1SHk+u/wxU6K+DiyN12oWmF
         7HQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlCAd28C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10305adasi123884311cf.164.2025.01.21.06.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlCAd28C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFEO-00085c-J6; Tue, 21 Jan 2025 09:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCb-0002z6-9f
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:26:02 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCZ-0003ka-1d
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:26:00 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4368a293339so65600885e9.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469557; x=1738074357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8HZuuYQMEsWgExTk6OZpUbl9UQpyo61BMv/xXe3yCU=;
 b=MlCAd28CPmYy0XrLrcd7xyYIk0uwrm3XwJbj1kcitNL8CAHiCjyhaShI3oOQw/1AQ9
 LlswD//+fsCg5eTs7wOFZYScxq79420vcs+VaiLNFiQ1G0BHzFhJTSJF1gVSFW0/k7Yv
 JK8fp3By0yiJxIx3kHsqxj5dF7c7QzMSie5H8Erq22Txgo5G7v/aIsYrR/hQhbFeFwnd
 W32fiDlQVddU76EcaOhFEitm1VKxxIROdlfSabVX7Wb7jl6b5VwcUZO6gUdtS5/8MBjQ
 b0AIg1qLzvLAtgYOO9iasskxeu6kArPej0O/tq/Iya6u/KAD+SUFreGfJY0rtMqb61Tw
 R0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469557; x=1738074357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8HZuuYQMEsWgExTk6OZpUbl9UQpyo61BMv/xXe3yCU=;
 b=aXDH9mGa/8eK26gp0PVAjyYWtftWJ2x5HwzxH/Wa8/fyL1yXQTn8w+NlvireJy2Qhx
 XcOkMuc138h2Q3Dc8a2LtSQJqGrWfm3j/LZ2K/IBlFxXK7Uk95IkbzgPyNzcrPh4ew/6
 GolBCXdRzmNCmrTTnyWXKgpj0U7eaubQzVU5WpjruGaLGzxZxYJrwvs3T93DmnsbZM74
 XYL9bc3/c/4COuYIaGnp5QR3iUnuX4iTYyZOqhCTUZ0bt8JS69MP7nfsPKo1WDhl9PjO
 FL2Y6lXqqlL4CJ8RqZaOPmjqLiXSU/O1nkfKpQTecD8Kd3pPC10O7DpFqXuNgQXhV8j4
 eI+w==
X-Gm-Message-State: AOJu0Yx75rLWRLhZS7Tx1VhWHmW2GNNr8EshfH7+rOZq9epXjG/f+hXa
 9343MSt59gx/Xb3sDw19v363ji6yLlDpBmaYrbH3Ll9FqMN0IS5rbAVpgK87LAgEiz1lly7XQ5J
 Hq4s=
X-Gm-Gg: ASbGncsF9XPygS97oxHs4apJe0BT4tkP4OFDNFniKEITANpqRrWyRFFhUO5Eb1Wgwje
 gteuHcWxYMq5vk8BjBKmXp6z8oIiCBhD5fl6/DTNrFtaXW5hQeOVfEcwIcN/+8nffihLxtXPjQq
 eZh2GGhjqOE4Nate354Fg9yf/NTQqXCOo4jueTHoHep5v6l8sqtgkkTe4TYNQUD5SiPh4tPP4fm
 F8chEteTnVouVVl+FJBhnJVJ3Mtke1ZmLKENbgoOIPWGQezXFaiRlTSBXzqDq5dBl3DZt6dRRXk
 ZHQ/AaMxSScrtEiOR5R3KEdw9eKdu+xy0wVp6TP1IsqK
X-Received: by 2002:a05:6000:1acd:b0:38a:88be:bcb5 with SMTP id
 ffacd0b85a97d-38bf56555f4mr14225672f8f.5.1737469557655; 
 Tue, 21 Jan 2025 06:25:57 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322aab8sm13695067f8f.57.2025.01.21.06.25.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 28/28] cpus: Remove CPUClass::has_work() handler
Date: Tue, 21 Jan 2025 15:23:41 +0100
Message-ID: <20250121142341.17001-29-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2LvpKTUveZC7

All handlers have been converted to SysemuCPUOps::has_work().
Remove CPUClass::has_work along with cpu_common_has_work() and
simplify cpu_has_work(), asserting SysemuCPUOps::has_work is
always registered.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 --
 hw/core/cpu-common.c  | 6 ------
 hw/core/cpu-system.c  | 8 ++------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d64c823e768..2bcad4b16bf 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -104,7 +104,6 @@ struct SysemuCPUOps;
  *                 instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do.
  * @mmu_index: Callback for choosing softmmu mmu index;
  *       may be used internally by memory_rw_debug without TCG.
  * @memory_rw_debug: Callback for GDB memory access.
@@ -151,7 +150,6 @@ struct CPUClass {
     ObjectClass *(*class_by_name)(const char *cpu_model);
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
-    bool (*has_work)(CPUState *cpu);
     int (*mmu_index)(CPUState *cpu, bool ifetch);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 886aa793c04..c933de1416c 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -134,11 +134,6 @@ static void cpu_common_reset_hold(Object *obj, ResetType type)
     cpu_exec_reset_hold(cpu);
 }
 
-static bool cpu_common_has_work(CPUState *cs)
-{
-    return false;
-}
-
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
     ObjectClass *oc;
@@ -304,7 +299,6 @@ static void cpu_common_class_init(ObjectClass *klass, void *data)
 
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
-    k->has_work = cpu_common_has_work;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 7b16bda2250..7f287984aa6 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -25,12 +25,8 @@
 
 bool cpu_has_work(CPUState *cpu)
 {
-    if (cpu->cc->sysemu_ops->has_work) {
-        return cpu->cc->sysemu_ops->has_work(cpu);
-    }
-
-    g_assert(cpu->cc->has_work);
-    return cpu->cc->has_work(cpu);
+    g_assert(cpu->cc->sysemu_ops->has_work);
+    return cpu->cc->sysemu_ops->has_work(cpu);
 }
 
 bool cpu_paging_enabled(const CPUState *cpu)
-- 
2.47.1

