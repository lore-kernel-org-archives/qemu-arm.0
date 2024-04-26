Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638299ejb;
        Fri, 26 Apr 2024 12:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXO2e17BRhRomkwlQv4XtFcvB8mmJMV7xU91cVFPDuh/HRILrwCKv38f3xvlqK2p54EgTHDPY7feGAiu+/omd9XbXy5X5Q4
X-Google-Smtp-Source: AGHT+IEcyD+JotBtRjLhtU2t0CaOErJtqy5BH54fwgZ6bUAqlH1et+0qQ9/YlQFCuFtfNDVHAI0h
X-Received: by 2002:a05:6214:2a4d:b0:6a0:93b8:6c9 with SMTP id jf13-20020a0562142a4d00b006a093b806c9mr3725048qvb.62.1714160787601;
        Fri, 26 Apr 2024 12:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160787; cv=none;
        d=google.com; s=arc-20160816;
        b=eUuuQwZOlONFhtv2eW9RuYgBf5EsbZmkSB8ikyiUeuZGG13gYlRjUWFmCW3KE6tboa
         QHC5K1br9pmBEHZipjAP+Y5BKZWPJurjv1GNygnZKJuVxFaZB5LqMka/xGVzpjgjrYW4
         40lK3czMEratSWc/dgVx4Cuuk0V83F2hbFlJZbHQ+NlJOEuS5oOuUt4GFal5/Xmmzfd8
         EIiiQvFMsbdAZKN4NTW+MEXiMHmFJIgPl6WXNJeqTBbey+Q3UWxXjcf/cBfePnIQv1iv
         +nNt1WN6h7967qyiDfnBkGqGJrDKy7O1L/X0EY6mA7nxR3Rm2Hcz4HFYFj2qy42kUEQm
         l0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PmvNrspQ4cegMOJikcLgrcfGHx45XMIAa70gCbSZauU=;
        fh=PHxkKbOTLbQlxVKPl0judirWFiC6GeHrb+o1LcVhEUs=;
        b=mLeE3qdEeDqq4Go1FEf8n+3JM4cjgAsxGin0+ssaglDwDSHNb455ryZz/VQoBA0PQp
         SELlXX3IYJxI1FX0eGZqnwR/4af/m8a/eMM3F8aJoLPJFaFLV9gsf4maDEQMyn4UlUyA
         6jUzc4m7PnznAfHEe4nG0bcFp8WEJGlQqdL/Vt0+NqusnzerAKNhp9Jw+aQh/1+V+kY7
         hT61dN3JtdYCUPZW5uuamAVFifqtQiYfQmtRhP+uuPCKIX1ZmLE20P5+6c+dkzxhSXGW
         JGIjuKgiW1a4hwgeBPhFA5ODMCJ72F48FODZPLZn0WUj2OznR6zlZ6c3P51NCkYQxawt
         Gtqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdHFy1AV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm7-20020a056214268700b0069b3cba3318si20628820qvb.48.2024.04.26.12.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdHFy1AV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RSy-0000Zf-4T; Fri, 26 Apr 2024 15:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSv-0000U9-5L
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:37 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSt-0002tU-Dd
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:36 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a58c0a05a39so257164066b.2
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160554; x=1714765354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PmvNrspQ4cegMOJikcLgrcfGHx45XMIAa70gCbSZauU=;
 b=YdHFy1AV9K4NTYD+68FsT4yFL1hAFieTQIFgCpNqwaKIrUwQmnNzMwByKsNvR7rsSD
 /JNhA4TJOKP6DOw28Xyqf1rY6wgdVzwi0Cq4g0kBzW1gpC5ewaBygSwol5XW3k146Z3c
 akKqFxiU1esv8ZaUr+E9ysTiCvQ4Lhn6ZXmwUGNyceG5NPgoW4xa44T5/3q9d9pPE+am
 PlsNN7acIFVKepYyPgNCUvZk/Eo4D0zAhXUlRw7gqyhKV0x5QBVoDTMp82bJQLvq14By
 xQoCP1se+o7K/Z08b6lLnnQragxmwjD+3jDArQMjnQkPQ5WtCr0+kl+/t1DHZ0Xr8Zud
 NjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160554; x=1714765354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PmvNrspQ4cegMOJikcLgrcfGHx45XMIAa70gCbSZauU=;
 b=nV7wXVMvhO/OoLhha0dRiPb8jws/8zmvrYAZWvh86E089kAzwYjDgtZT24S0FZZgDX
 P/SzBtzoNjnlS91yT3oIjiE1WN54pla9GcmrcQVWIWpa3kLRFnN341lS/Qmlrv89raPa
 7Lo+TUQqh4j7Z7R/42ThSIvLCe/rZX9D/2qHKDyW3t9IzHe925RoZzyneHp7/2qqsKBj
 mYNP/DrZD2piI5RzJL9KRqOKvZ7et/cpOHFX2bmwLGdiv423S60fiN+iNdE6BHrzue/M
 GkXfWaRSAEHPQ5mfg0U56OkPWJjlpCNg6wEM+OAez+owue0hUgyrESqYCEYq4DwMpJOq
 j9mA==
X-Gm-Message-State: AOJu0YzBWr7PxKoxkJ3H1ZtjuQMWt4NRHhcoK0kXyHUZY9lx9tT5zsJP
 xcvGZ6RhbMPGW5Lr9EslsUpsAPsHWWD/wt36Fp34tpHHdxsxeXfgdbxTvqKw5L0=
X-Received: by 2002:a17:906:3593:b0:a58:be1f:9134 with SMTP id
 o19-20020a170906359300b00a58be1f9134mr2374855ejb.30.1714160554023; 
 Fri, 26 Apr 2024 12:42:34 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 m24-20020a17090607d800b00a524216fe78sm10939590ejc.64.2024.04.26.12.42.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Brian Cain <bcain@quicinc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 05/38] accel: Include missing 'exec/cpu_ldst.h' header
Date: Fri, 26 Apr 2024 21:41:25 +0200
Message-ID: <20240426194200.43723-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: 9hQjzWbv6ypq

Theses files call cpu_ldl_code() which is declared
in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-5-philmd@linaro.org>
---
 accel/tcg/translator.c        | 1 +
 target/hexagon/translate.c    | 1 +
 target/microblaze/cpu.c       | 1 +
 target/microblaze/translate.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 9de0bc34c8..6832e55135 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translator.h"
+#include "exec/cpu_ldst.h"
 #include "exec/plugin-gen.h"
 #include "tcg/tcg-op-common.h"
 #include "internal-target.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index f163eefe97..47a870f42d 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -23,6 +23,7 @@
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
 #include "exec/translation-block.h"
+#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
 #include "attribs.h"
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index f8dc3173fc..9eb7374ccd 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/gdbstub.h"
 #include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index fc451befae..6d89c1a175 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-- 
2.41.0

