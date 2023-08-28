Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3055019ejc;
        Mon, 28 Aug 2023 07:58:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGswdcL0BnK0B6jpi3V4ZQA65bmRu44Jxfw34f00Q4QEkNsURI3bs7Skw1wiyRwO9UKIMbU
X-Received: by 2002:ac8:5dc9:0:b0:403:cb17:c108 with SMTP id e9-20020ac85dc9000000b00403cb17c108mr34457696qtx.24.1693234701206;
        Mon, 28 Aug 2023 07:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234701; cv=none;
        d=google.com; s=arc-20160816;
        b=b63loJ3rDb7rcaJV3VmzybnC9Y9W+65mAtTBYUjFgV/Fq8ZLxUEZbB1CQLRTZYQlsr
         0H/r2AjxipGEK+fWa7sYL1S6H7MrER0f6CfEoi9HTIm6V+UqU/+wjK2ScE4GJnyZaycp
         fQJj+7Anya9x1rMFMkVN6aPjG+3C12Ip/Wq7OuO1pQo1naQMwFYNL7y6Ls8xAkFCjDQr
         8JrCl+BZ2coCAWCceQz9UGUl1UNyAY7O9ECIYMkOQKqu6gf+inAXFLugTJaKi3xIu3eI
         CEGI8vhIVqbIOLg3tlVw/6D9jTv9hFod9Y2BSYbG/3gR6Qs/P40kqcqOG4jEpK5MWrNf
         NS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u0Lad22grnmmVAIA9RRmXOBjrMZHt2ARUrmeTwnSYEw=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=DavdPGSl27A1pYSaU5WB4Ww7CeKWxRmuiK8//+8xhFbEiHZ6gFdRzCRzPwhe3wtO0L
         YWr+D8sT1fVsEX5LYlfyIikaDBUUG/L8q6j2DLZYLjXRreVbD2ObYnte3N1Z5e/tQISm
         XYE18KkigENHys8YRo9jEoVjF9l3kAIsxZ9/0yDlLtRqFWexBPdrFMnPVjujOkFRuSRO
         TDQt4G9ZndGxM43SkgkmhQ/gD3nZQacnaE7Y7SgvJtev3tHOPZFWG6nqzrwDHDlcfp6S
         6rvjNj79znKgoGFo8/UaeyGYT85U69i3LBEsnoAw2FJTAEk9ww/dpslbt9YrU+VO4iwk
         E17w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIhBp5xa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac84e8d000000b00403b2544bb2si4917349qtp.427.2023.08.28.07.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIhBp5xa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadfK-0003aw-Gh; Mon, 28 Aug 2023 10:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfI-0003Zb-UU
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfE-0000kp-W2
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe24dd8898so30529005e9.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234583; x=1693839383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0Lad22grnmmVAIA9RRmXOBjrMZHt2ARUrmeTwnSYEw=;
 b=sIhBp5xaGntcvfdc1Ktm6Wjl8YcnEbjFPWQM/QFFhOGmSw6IaFbyNz5GeB0Dzdnre+
 JGPcKOuZso4emL4nVdsMZwQ+nYMi7a5zlZobka8mh4HveupOwaur72TV5kANHiOBcm17
 4+5mG2yXLT7QJE+Lvn6hj7OVKIkQK0gnbize3sb9y+OZSpT3HQCRBCIWPs4WJu/P1cYW
 LjP6Y0bU+QzRrUKOQVMwsxnfIn6fT/lEvu5hKKuSICilioGhRy6VLW7gRDFKun/3Kn2d
 5RBVaZ5pE4tnEoflZhyK9IJhqNjP7w6J8JpSd98Brs/bffpBsLUMbOgnsOnlXYMAJ872
 mrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234583; x=1693839383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0Lad22grnmmVAIA9RRmXOBjrMZHt2ARUrmeTwnSYEw=;
 b=V48OjIOs/WreaZDJOYBz2gwfvBf4mozMuOCt7ipnL9ylN04aCyE1oo+HiFIHs40oL/
 lWopJhfsmokC9jxV7o0ySveRDHisGh1yMm6i3PTlZunqGwqO8MEdRy6ewL8ZIu45cqw5
 lCGcgTXJEfKz+fl30od8UmcCpC1d74/ejra+g7r/d6pOU5VgG84YGHFtLyeOHWg0Fxmy
 01KtxJHCNEM+02ZM8co+TOiU+2kgx45PyIiCnh33PUlXTPX82Jkcuwihc/XYlt3VE6mg
 TtjjVmeU0sUUqatnniuYwqjJcn4y+gJ37eEnk9xw+3jyG/ERH3DVLGqKgNT7YpbtgzLN
 kwDg==
X-Gm-Message-State: AOJu0Yz4D++2KifwQXqNXY9ej3IWusfDkBCa2NutZU75PwxNAIJ7IJW6
 o7BSVtopi6XDeuwRo9bAI1ozOg==
X-Received: by 2002:adf:f9c4:0:b0:317:690e:7b39 with SMTP id
 w4-20020adff9c4000000b00317690e7b39mr20300901wrr.12.1693234583469; 
 Mon, 28 Aug 2023 07:56:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a7bc4cc000000b003fed8e12d62sm11070920wmk.27.2023.08.28.07.56.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/8] target/helpers: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Mon, 28 Aug 2023 16:55:43 +0200
Message-ID: <20230828145545.81165-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: iD29cmd7J6P0

These files don't use the CPU ld/st API, remove the unnecessary
"exec/cpu_ldst.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/op_helper.c              | 1 -
 target/mips/tcg/fpu_helper.c         | 1 -
 target/mips/tcg/sysemu/lcsr_helper.c | 1 -
 target/s390x/tcg/excp_helper.c       | 1 -
 target/s390x/tcg/fpu_helper.c        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/target/cris/op_helper.c b/target/cris/op_helper.c
index 40cb74ce73..98a9aaf504 100644
--- a/target/cris/op_helper.c
+++ b/target/cris/op_helper.c
@@ -24,7 +24,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 //#define CRIS_OP_HELPER_DEBUG
 
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 8ce56ed7c8..45d593de48 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -25,7 +25,6 @@
 #include "internal.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu_helper.h"
 
diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index 942143d209..8f97d04313 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -13,7 +13,6 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index b7116d0577..b875bf14e5 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -23,7 +23,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index c329b31261..d8bd5748fa 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -23,7 +23,6 @@
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
-- 
2.41.0

