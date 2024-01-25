Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp356994ejc;
        Thu, 25 Jan 2024 08:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQm+q0nQUMNyD1ZvnCklZnYo7bnUEz+kShj/bO9vxBnYUcj3+SIXNR/eqFsggOCztJxAKI
X-Received: by 2002:a05:6214:2349:b0:686:aa9a:25ea with SMTP id hu9-20020a056214234900b00686aa9a25eamr1281269qvb.113.1706201887124;
        Thu, 25 Jan 2024 08:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706201887; cv=none;
        d=google.com; s=arc-20160816;
        b=nllZKXSjFFvQLlcjLp4FgB27Lck5KLWYN4IuoVa2RZI8HwevYgyCYST472i3K9KvkH
         lCERppEWvmMJdElYtGGcnVdaHn5/RPqSIkpdDzUHU/p6NfRye0HY8vyUFwaRhDOEIAXq
         ziUUkbZwNkZVK36FPNfTnwNJx6nUIEdPc6VimShb+F0e5mi1/5OM5YtNkJshVb/b4dTj
         l72ci0LIMMw76wGV8aZXKVGkwtuY/JgKrqV6XiMz/b+LNSAm0tqipu+iObmm35I5LXhz
         NSfM9lXSP4IWD9M6L6vZFbcctHAvIEyDndW9VqK6kIoQodtD12uH3gmZM1PFW0M/KcPt
         CSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tu0Wmz1gyaDFvvITpysE/w6FwQ0wlgaZK51MD3LFw0E=;
        fh=LrpQCMqEWkkfcCkbk4oEAKfm9hfQMuham9yWwcV3vYQ=;
        b=F69i7XRETpsoZEm90iCe3axNF2raomHHamjgvhd6mSMv1WPe9pJjucgqwlrU2k5qCO
         02XNahQjaBq/FvJuUdR782K7pIZC513Vv12cSgIfBhF6nqhqXqXnYwZn/6GIjFvCmZiL
         LvtSiwd1lsEZ2O8E9VzYSAzqAqP/5oKWhaiFgRNCFi1PjcMD+guzs+tr+poqcHcrVAdC
         0Owrv9wjrcYIZhwY2wqSRazfNJsEinWSbPlN17P/oC2LAym7s4KMAap4tFw859r3sgHX
         v7x35D5ADpl1ExEd0ipSNrQI7K9asS+9g1j4+pkvq10P8dVerkSmcQmWn8BCHesa2PBw
         6qKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b1sRax/G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a0ce0d3000000b00682d67415b4si12957056qvk.138.2024.01.25.08.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 08:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b1sRax/G";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rT32C-0007UT-1U; Thu, 25 Jan 2024 11:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT32B-0007U3-Ai
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 11:56:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT329-00017d-JD
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 11:56:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso56599385e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jan 2024 08:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706201816; x=1706806616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tu0Wmz1gyaDFvvITpysE/w6FwQ0wlgaZK51MD3LFw0E=;
 b=b1sRax/GvB438lPXezIU42qinJF4oEXHnkbT25JikElIKa4NfBd91r7JSgB0NBNTgh
 FTgC7h02zgRWJQwEr3e7JrXfZ4uxOtP8mb3uzvjee/vAIuKbQMiUapQEtvYL7jW8y6zf
 +H1JSfWq9VwzCwesdnlofcqJXTRt/yHUUfnGEird/X0L7NQRfau+W/kUzQh8dRcsbZjZ
 cmOXSrDe4eUYycSFdGUaReFYTMzpNWWccNatneLKDJKsOye58l2DWjcpvotgmdTPdaTn
 NlKa9Ppi801MEZFhbavJ7wZgJTSi58J4kZQGcFZr8gIVm6dAmjByeuWRR1s9O0Pa51lQ
 RMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706201816; x=1706806616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tu0Wmz1gyaDFvvITpysE/w6FwQ0wlgaZK51MD3LFw0E=;
 b=xIyI4oxAIOpPqTMH4sPCfRSkI/E4cHbjdX7lUkV9Ftp9dLv24CyjXf4EZoh5Ne8/2d
 5FMyb62TK5EkOl5rLUWZFVnavlFSnP5VtI4lYpNzd/kDzfQbcNwUyPeJ7AayuvxDi+bJ
 DBSaN0fc6jzJPtHlrHMT0lsQYGoPWQa7pe9W6vlnQD/ByaXotJ6f5tx7+cRCDExbcE5n
 nsvCnqRfnCKhdhZBpPPvk60tZVm7mGlyJ9w653tIWUbRzT3NL84+3YzNES2J2j4UJ8lL
 MSkx2I6NZb8ZWKOXnJ5CYC4S0MsmoYQfkrgyXpmsUXKRdgjkRAVFr8WLDJBXQfNlNxjc
 8hMQ==
X-Gm-Message-State: AOJu0YwWVtUPyR/xjBnt1mxCSUjI6xpoRzauQ/tfqf5uCD78BEmV5Oym
 +s32UrSXM4/YsSrOmkNv3DYxWlq1L6SVDd1VcmQimrwWaSkJX347+wmhb4sMDdQ=
X-Received: by 2002:a05:600c:b52:b0:40e:cca8:dd32 with SMTP id
 k18-20020a05600c0b5200b0040ecca8dd32mr7264wmr.364.1706201816314; 
 Thu, 25 Jan 2024 08:56:56 -0800 (PST)
Received: from m1x-phil.lan (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0040e53f24ceasm3223034wmq.16.2024.01.25.08.56.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Jan 2024 08:56:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] scripts/coccinelle: Add cpu_env.cocci_template script
Date: Thu, 25 Jan 2024 17:56:45 +0100
Message-ID: <20240125165648.49898-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125165648.49898-1-philmd@linaro.org>
References: <20240125165648.49898-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 51oZT26WRGAL

Add a Coccinelle script to convert the following slow path
(due to the QOM cast macro):

  &ARCH_CPU(..)->env

to the following fast path:

  cpu_env(..)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                               |  1 +
 scripts/coccinelle/cpu_env.cocci_template | 60 +++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 scripts/coccinelle/cpu_env.cocci_template

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e..1d57130ff8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -157,6 +157,7 @@ F: accel/tcg/
 F: accel/stubs/tcg-stub.c
 F: util/cacheinfo.c
 F: util/cacheflush.c
+F: scripts/coccinelle/cpu_env.cocci_template
 F: scripts/decodetree.py
 F: docs/devel/decodetree.rst
 F: docs/devel/tcg*
diff --git a/scripts/coccinelle/cpu_env.cocci_template b/scripts/coccinelle/cpu_env.cocci_template
new file mode 100644
index 0000000000..53aa3a1fea
--- /dev/null
+++ b/scripts/coccinelle/cpu_env.cocci_template
@@ -0,0 +1,60 @@
+/*
+
+ Convert &ARCH_CPU(..)->env to use cpu_env(..).
+
+ Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
+            cpu_env() is its fast equivalent.
+
+ SPDX-License-Identifier: GPL-2.0-or-later
+ SPDX-FileCopyrightText: Linaro Ltd 2024
+ SPDX-FileContributor: Philippe Mathieu-Daudé
+
+ Usage as of v8.2.0:
+
+ $ for targetdir in target/*; do test -d $targetdir || continue; \
+       export target=${targetdir:7}; \
+       sed \
+           -e "s/__CPUArchState__/$( \
+               git grep -h --no-line-number '@env: #CPU.*State' \
+                   target/$target/cpu.h \
+               | sed -n -e 's/.*\(CPU.*State\).\?/\1/p')/g" \
+           -e "s/__ARCHCPU__/$( \
+               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
+                   target/$target/cpu-qom.h \
+               | sed -n -e 's/.*(\(.*\), .*, .*)/\1/p')/g" \
+           -e "s/__ARCH_CPU__/$( \
+               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
+                   target/$target/cpu-qom.h \
+               | sed -n -e 's/.*(.*, .*, \(.*\))/\1/p')/g" \
+       < scripts/coccinelle/cpu_env.cocci_template \
+       > $TMPDIR/cpu_env_$target.cocci; \
+       for dir in hw target/$target; do \
+           spatch --macro-file scripts/cocci-macro-file.h \
+                  --sp-file $TMPDIR/cpu_env_$target.cocci \
+                  --keep-comments \
+                  --dir $dir \
+                  --in-place; \
+       done; \
+   done
+
+*/
+
+@ CPUState_arg_used @
+CPUState *cs;
+identifier cpu;
+identifier env;
+@@
+-   __ARCHCPU__ *cpu = __ARCH_CPU__(cs);
+-   __CPUArchState__ *env = &cpu->env;
++   __CPUArchState__ *env = cpu_env(cs);
+    ... when != cpu
+
+@ depends on never CPUState_arg_used @
+identifier obj;
+identifier cpu;
+identifier env;
+@@
+-   __ARCHCPU__ *cpu = __ARCH_CPU__(obj);
+-   __CPUArchState__ *env = &cpu->env;
++   __CPUArchState__ *env = cpu_env(CPU(obj));
+    ... when != cpu
-- 
2.41.0

