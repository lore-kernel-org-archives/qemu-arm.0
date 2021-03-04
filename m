Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6647138lfg;
        Thu, 4 Mar 2021 14:50:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjcIMH7VQ/EuPzRwMg5W4CXIuhHsJslg5fg2CYEEo2zwe4Mu6O+LK/udPcTDbyP5Rayq0p
X-Received: by 2002:a9d:116:: with SMTP id 22mr2515376otu.163.1614898247440;
        Thu, 04 Mar 2021 14:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614898247; cv=none;
        d=google.com; s=arc-20160816;
        b=GXuYrrXzkiB5rC5rOokHEDQjW2U+pFuMiP5LyX+3oSrQ4PW5EJ0Iu1zaG4//qB6+rK
         ZuIH5cYpNs7wSSpb4/shZViJC0yQtGZG6W9LlOdak/6VsRQ9OsUASpaWpAczvG/cNpkd
         CmCqEJWgfWbtqmD1VSPIrbTNe6vq8zxWlPLxMMll2qI8G7Bh9cN85TzkJ00iQXa/ZEXj
         Uoc1pKNvXywL0ZSzmwFNGeDyvBDGqvGe9Zlk2pmCI2vDsZHZADOQ8uSDpPT8rFn1CzCa
         Y4anhoChmueTDfR4XyI3lmaBanlRL6MBtwWaHEZa98Vh3B2BTor7Wjc+vlRasLnjDSjy
         73Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fX6hEXkHOn0EDIH5ppgTAZxEG1tZNK4v7KhIUlmGx5M=;
        b=d/NfJE1oEAxa2RKs3SCrNnx3RGkXdP1KkNrXutrTzyBJDDfQWsgUiySa6K1IaNysk/
         JlfcPDEZ0Yyul9iSoA4Wh0Fd0j+jCwqCJwnv2sHeGvUT94RLd5vPAhEQlAznU/W0+r/z
         CcyL8nlDIYOgFj/o3B75wTfNzjfHOB83xoBnd42mNPxUTIyvIJi3pK4Wqzxa93p/mXOU
         qFZxBKUE3/HgPPwB+JopNQYq4GlQFpA/BG8tRBVjbJTp9UTWOwqoljQLRKGX06A5xow/
         F3RVpQLxxHlLPHQzI5NkuWlVntqAuDOI1xVcbKzo+wTSmh1A7D1OX0Y6NjnYZzsiZQW6
         cB8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NmsARctx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si803818oti.224.2021.03.04.14.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NmsARctx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwnu-0006g1-Ls
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwOC-0007wL-61; Thu, 04 Mar 2021 17:24:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwOA-0002eR-K7; Thu, 04 Mar 2021 17:24:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id k66so11160338wmf.1;
 Thu, 04 Mar 2021 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fX6hEXkHOn0EDIH5ppgTAZxEG1tZNK4v7KhIUlmGx5M=;
 b=NmsARctxdUkxORvwpGrzrQBVLeNzc5ZUXeZNDaRJMDGsGYiiepheAAeenQx8XJkWG0
 V6DQv6qOlw9kCHbaM40nZ95uRgDrFEM74p3NtTXaUFxeYzPtYEY+/8buH8VD1g6Z64z9
 Y1/j5YnIRV8TWYzbnM/G+CHCU0nnPlfO6OYaqxsPrCdpPwwHEJOD8EWrxWcxdemXwK9D
 JnXOiRmTvl6H4cteMVFBQ3+TLc0ueTbXcQSZKsK/wQALoWndsvwOe4023JDnq+Lioxxk
 W94rxO+oT/+zmHb+qDgrOD8V6m0EzWs6IeHb8lETIoqONVLMTDwHxelhMvZjiMlKN24u
 XLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fX6hEXkHOn0EDIH5ppgTAZxEG1tZNK4v7KhIUlmGx5M=;
 b=tjCpmOptBw+P7gP+iKY8nolbZFbIdxfvqO8YL86JBHXRH2+UJahEUa7OULBOvY+Xvv
 TqfkmGcVu8DO7DMivKBeEM7rv9TDhrcXazKTwzoJTikeOiLHhiRI/7nDEE3trL5oncNg
 J3FAtXn6x5DCgJKjgFP25zitQKiyi87qwg+P7bQIACKEJ3m1q/lfHRun66eTmYhAKMfT
 AEy0Yof283c8gFkt8RxPDFZ1dmDRZ3pB4DToaPmE8FokrtWN+6P7GjCzDFOcSgqfu4YE
 cpwPUgX5gFgpzaNA0BtXqwfCz/pYuvCV6JrVn/uFIZxmrN5BS9MU39YLdf91ksTWKxCw
 Zi7w==
X-Gm-Message-State: AOAM533VrFtl1trLUZdZ6m7/eNBd0qDrPDwRBzdIFNz10al4P01n1o7U
 8DYr8wPySsBSq3u3OwZfbx4V4se1w9E=
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr5768799wmk.123.1614896647799; 
 Thu, 04 Mar 2021 14:24:07 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n66sm1250102wmn.25.2021.03.04.14.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:24:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 8/8] target/arm: Restrict arm_cpu_has_work() to TCG
Date: Thu,  4 Mar 2021 23:23:23 +0100
Message-Id: <20210304222323.1954755-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mAKSlSWaIRme

arm_cpu_has_work() is only used from TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1930be08828..db81db9bf57 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,8 +172,8 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
-bool arm_cpu_has_work(CPUState *cs);
 #ifdef CONFIG_TCG
+bool arm_cpu_has_work(CPUState *cs);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7181deee84a..02db969c00f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -74,7 +74,6 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
 bool arm_cpu_has_work(CPUState *cs)
 {
@@ -86,6 +85,7 @@ bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
-- 
2.26.2

