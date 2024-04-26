Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp640354ejb;
        Fri, 26 Apr 2024 12:50:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNfRZH/MS6DvxfS4EWaGow1usfjtyKYW2qNsnOXIzsAQ6Dt5OF/G9sr8VzEYrhQrIPQv50FEQ5QVrhjzZ21TN3+2Vn8uJN
X-Google-Smtp-Source: AGHT+IF5DQdkKyTOkkip/Oyu+wf0ZsTPORcoFWzT2QQLXWWucg2HPhESOZiC2CJ+Rp8w4Y8hiwg1
X-Received: by 2002:a05:622a:592:b0:437:8c26:176c with SMTP id c18-20020a05622a059200b004378c26176cmr3996745qtb.41.1714161044410;
        Fri, 26 Apr 2024 12:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714161044; cv=none;
        d=google.com; s=arc-20160816;
        b=ELguoS4VUT02tNCQri/xMRcT3DCuJ1z6x90JTGYLuocg/On84YNBkMf8eB0vBTZLny
         a29WSES1OrCCPS+kgg8CNhMqCtWygzdjQVTXK5pfTCgfjAW3KBxho2ADZMsEe53uWZtG
         h3nDZv6KaMDDvvTq10A5Gw0ve/nNWk6ede7VmdsOaKkrameMpL6TRvFG53WWaXVPz7sz
         tSCxRhSXI+p1iLnFbJnvFBHORRyGiSFIVZ3VLaUcXGFKf3CU0c05z8Yh8JBKPGpSVevd
         phPkjuF6738kKFBTCiQrB7SLssLQ3p0cWgHkJKa+4fzTAIzkhBY8HFY4CGZPbo/8dZsD
         N/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z+2jDyZubLtcgNSevFNEEciw6F0x1NCcSU5rQYS3oAw=;
        fh=Pw2rna1XKA6Q6oVrBm5QfqVdprGO4k4MCabOwh7/beA=;
        b=Mw/hczpGCj7ukrEi0cY4OEnKgPMc66l4xSg0Djxh/c8uZsXhh9l3jDOz3dPu7cuNJt
         1vRyjGgPvSBmWL04uZqMKbkVd3otLvAsQNg6N7603IiQNKnUwrlJu3+I4BNzsalC7MXy
         Nsm6fd0xykfLZwK1WT6G4Yw58Tb9b5OZyKTEtf8aQhQ72d/a2xImmuh+cIOFaNQCrN7+
         IH38pzAJ0bWacTp5jMG7vm4P6H6oyxMUuJAiOQe60ZUbvBFDUxEHoSa1kPay4CaiAP64
         n7hd4KnVSI0Lz98/MdQ/Xkk62nDJo8j1R2I4oZAS3GaAJgHQrPUYWgCDR6Ucgj0RZTmK
         k+Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UhjCGqBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc11-20020a05622a488b00b0043980bba675si15139002qtb.516.2024.04.26.12.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UhjCGqBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RVs-0002Xh-MJ; Fri, 26 Apr 2024 15:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVm-0001wA-6b
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:34 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVj-0004iw-PU
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:33 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2de2f5ca076so27658641fa.0
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160729; x=1714765529; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+2jDyZubLtcgNSevFNEEciw6F0x1NCcSU5rQYS3oAw=;
 b=UhjCGqBEM92b5zkUfUld/wygKKFVElvhoYrm3fHPiB9+D+2M24KTOejCjKZFFj2Rk6
 ysyuK73y9GVucNQgxVcuGw9Uk540c/LN1QibEolh61fvVjCyKTnfMPN/OLO4MlBtpHgd
 UPN4YwIUgNDURpjygXpg74DcypK9iqOzkG4vili37cLue/9LEPVbU3v+SuWC3P1+l6DH
 cujOXQhWoNm6500QUIyc/IAIEhAuqt6ffSnOXCe6ibgzDyc2FqC45BC47FoOP2cfinJ9
 QeJ8tjnX2cujeck0IB0JZ/QAt6HlzEy640a9TqDVjPmtQzlAZkI6YzVhRWeLyQ7kUbKO
 MyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160729; x=1714765529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+2jDyZubLtcgNSevFNEEciw6F0x1NCcSU5rQYS3oAw=;
 b=dtomAsNQz3DnGIBFr8fTjXCMS+fag63zzUF1ymojoc7AZi0TGRoJebts10c4aL1T6D
 AzQsW19QCahkE0IJNcBeXl2oCOUsiabNMXtFb9gFLIWjK4gW5c6LH+KqgfPU0LIm5eyk
 hhAJH2kNOA6zfFvlcwv28pieS75Z7+tBY+osoWJO5Rv+EgF0moEIi881rgkvfygQh3Ly
 avLB+d/htXHw/O8gsPmgxDTEi0je2b86th8CiBWOLhFeOwaoPfgNV49TA4xua4YWQ6CP
 AscSnScurhGcJ9pU4aFDcQ1qCO0TvMYyG7EmByCgzJzzGGQIk6NRYZ3VLD8Pg3TXyWJW
 3EuQ==
X-Gm-Message-State: AOJu0YxKDONpAzLLN/hR/XtbBz8ednnm2EieGWR2WrdA9+6x5J/+Prhx
 S7UVXESvdg/JtQj2n5v3A0D52y+u0nifJcQivzuLrn95PWwClDar8WrMsve3cVA=
X-Received: by 2002:a2e:a4a4:0:b0:2db:7b:1a7b with SMTP id
 g4-20020a2ea4a4000000b002db007b1a7bmr2028423ljm.46.1714160729546; 
 Fri, 26 Apr 2024 12:45:29 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 l10-20020a056402124a00b00571bec923bcsm10012663edw.93.2024.04.26.12.45.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 35/38] exec: Restrict inclusion of 'user/guest-base.h'
Date: Fri, 26 Apr 2024 21:41:55 +0200
Message-ID: <20240426194200.43723-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W6MWe5iQaJiQ

Declare 'have_guest_base' in "user/guest-base.h".

Very few files require this header, so explicitly include
it there instead of "exec/cpu-all.h" which is used in many
source files.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-23-philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
---
 include/exec/cpu-all.h    | 3 ---
 include/exec/cpu_ldst.h   | 2 ++
 include/user/guest-base.h | 6 ++++++
 bsd-user/main.c           | 1 +
 linux-user/elfload.c      | 1 +
 linux-user/main.c         | 1 +
 6 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 027f19e052..e75ec13cd0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,9 +65,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index f3c2a3ca74..7d0a0412ad 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -74,6 +74,8 @@
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
diff --git a/include/user/guest-base.h b/include/user/guest-base.h
index 1e42bca5db..055c1d14fe 100644
--- a/include/user/guest-base.h
+++ b/include/user/guest-base.h
@@ -7,6 +7,12 @@
 #ifndef USER_GUEST_BASE_H
 #define USER_GUEST_BASE_H
 
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
 extern uintptr_t guest_base;
 
+extern bool have_guest_base;
+
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 01b313756e..29a629d877 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "user/guest-base.h"
 #include "tcg/startup.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 207455c1ba..f9461d2844 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -8,6 +8,7 @@
 
 #include "qemu.h"
 #include "user/tswap-target.h"
+#include "user/guest-base.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 149e35432e..94e4c47f05 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -38,6 +38,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
+#include "user/guest-base.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/user.h"
-- 
2.41.0

