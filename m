Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5081272ejc;
        Thu, 31 Aug 2023 06:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoiPArrRDx4pYYvLe4jTi5LRi9xsJgzDi2Nm6VIbfx2nqIWttSYI6ZR8NC1DxicCJpHUFt
X-Received: by 2002:a05:620a:c93:b0:76f:1dd4:1020 with SMTP id q19-20020a05620a0c9300b0076f1dd41020mr2339712qki.77.1693487350760;
        Thu, 31 Aug 2023 06:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487350; cv=none;
        d=google.com; s=arc-20160816;
        b=vYXwImjTWwCbpyCnB4GkUo9VpvD5jAOidGToozHG+zJteUAm5r2pUXTOU9tjs84/9C
         LG56Oj0p9sBmv1eGfGfMYZbPGGeDscDe28T4l/KSrVjURBDXeVPa37RGBWJqnnsJbca7
         VYs2FhbhIIq1jyNOqwNNOsBH0hkBaIlo7MysZHw//GI85coLUX7yD0Cb5Ca0wV/BZNKJ
         PwCcPtian79unDBOiulfDhRKwnEjp94LzlP1eozdUP+zxGpesCycMSAR9a32k0nZ1LhW
         Afrm17B7VEV4n1VRyLBeiPwQKdwLsVZw4hw3NtxkZYEj2smaFyOmBPgmVWqkJ0gEsy+z
         2v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QjQL80nyATLPTIBkc5alImMKX6tkMfdHx2YY+WxS1L0=;
        fh=6MB1nhhAFdK3h8cGY4b/YKLqWeU7fzcVHeHQ1GAhPhk=;
        b=QufgqBH2ccKvqTTDnGVwkfidciHPz1ZfCcPaxMYdH/miTAQr9o6FpKx0HKcGlTBzFv
         8XaIFpHHf3AHOa2zHffK/Ruq9x1/5kEUvl2lk+mTef8gGnnZ5IN78TEjpepttCu6KCvQ
         U3eMM2lOwuLQTiaEQwvASGY+H0eW5meZHVS3sCmriOwKJp15XTjL90J5PWxR0IGOW9VG
         bDw7ofubVMumAujwM6s0BXycdLaSIxUPSZ9vhy17dV8IGLGV5C377OsTlNg2DmioPSR0
         faJSkv18nuLD1Jimm/DJoItOck/YKTqewP6fudY3DGZupX6Q0yLVsgWfHhUrgz2FgNXC
         RzBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cebTV8R0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w30-20020a05620a0e9e00b0076efa2057a6si869488qkm.576.2023.08.31.06.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cebTV8R0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhIA-0000rE-Dh; Thu, 31 Aug 2023 09:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFf-0003IJ-MI
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFc-0005YH-7I
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso604471f8f.3
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486697; x=1694091497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjQL80nyATLPTIBkc5alImMKX6tkMfdHx2YY+WxS1L0=;
 b=cebTV8R04yWBkOGOfo2qgQ7yYxe+zWEnQr7thKkWwHrwn3g1WqKt0ojULVdAaKH6bE
 Cx6e7x5lKH4oDvOXoyaeRJZghPnIC/pUgtIUAQTottoEcZ9SHcoJ/9Pl2tV4E8xgpNVx
 u/mCdlEENYi4p9n/3No7PD0Fhss929ohANuSDAUwxp0ntOovVV9/pLiLIvy9DTkBK9mz
 pwbun1M3VN/knZX3mP6D/D8N8ksCHzJFXrgYwAkP1buNlP/ZIBdxFB81Kymd3JeL0sC0
 Od9QWq4mjXeQM8w+ZeGGehaYdkzmRP7zNq4FYzvBs0J1rtqZe0b8F9Bhi8PxcdKfS9ur
 PmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486697; x=1694091497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjQL80nyATLPTIBkc5alImMKX6tkMfdHx2YY+WxS1L0=;
 b=B8zHtyvlEZOb8Da8xf5aE3dTyog2cOQ5XXwtbVoHGOoVIojcfXgNdmSO8iE/2A7xuP
 MOPttZC6L+uPVupcJPokBtn1Y6ThKLz12X/ajkC+Jrck0K2JDnaa6+qZWGhPRQZfFhwd
 N9fs8A3HLR1+TBoJaEKzKoOhg5WMVMXFvYxf9wMqgBJVmmUQDjs6xVkTMpXfsRfy+uSu
 8GNtD2cGrOWduZPu8BCCMC3gIte4K3buzGFMMQaLS3JF49VTv7xft7xHlTESvmmOgl+L
 DplA2mrC79MApO62cMiQdOY5U20t1GdO45xsIFBb0AOFjlWa/k3qaUbv2gUq6ax7tLH8
 0Xzw==
X-Gm-Message-State: AOJu0Yy5LrcYnj7eS+rxTI0XHt5wl12Ptm8Qzu3yAZrOBaI9BlIqkFGf
 9ewv70iGg/b36eHvY4zelM7ar0Bs7QgxhimJIS8=
X-Received: by 2002:a5d:574a:0:b0:317:3dff:7189 with SMTP id
 q10-20020a5d574a000000b003173dff7189mr4116020wrw.66.1693486697342; 
 Thu, 31 Aug 2023 05:58:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b003143867d2ebsm2184094wrm.63.2023.08.31.05.58.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 15/41] target/mips: Remove unused headers in lcsr_helper.c
Date: Thu, 31 Aug 2023 14:56:17 +0200
Message-ID: <20230831125646.67855-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tCW90UpaiVOO

This files only access the address_space_ld/st API, declared
in "exec/cpu-all.h", already included by "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-9-philmd@linaro.org>
---
 target/mips/tcg/sysemu/lcsr_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index fb57bcbb78..25e03572fe 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -8,10 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.41.0

