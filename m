Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1748138dlb;
        Mon, 28 Aug 2023 15:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvBxjeRnZLuOgqDvGc72IyeRJ+tX9reScDmMP2rarizzQyM4D9bBOTxsejeNlGhWgXy8CO
X-Received: by 2002:a05:620a:2485:b0:767:96e2:7dc with SMTP id i5-20020a05620a248500b0076796e207dcmr28044637qkn.49.1693260872705;
        Mon, 28 Aug 2023 15:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260872; cv=none;
        d=google.com; s=arc-20160816;
        b=qAcYUW7wWAc1g/qmF83M/YjEZ/Y+vyEA5gYgtSBzgtQEcouQXppt3/SQs8QJlaSuDY
         cDZto7hwmi8BcRZZkLdKaGQ8tv9DcQ0dpGQnFdB75oOMjn8Tp0DqpOQpYXgbIy2ck9jr
         lKBTAilev4WBHZ9v5E74W7OTncjrm4ODNDwD/cpMV4T2jKYWajojZFo1U4YvWfuX0U6M
         GoE8WUjk2ek3FVAREzE2cgrZExqsnA1xbNkjkHRktgrvwbxD+mluV9hawl+8Eylzcqsa
         2EbYdju/XMFakm3lOvYCxVRrfGSSHCcIrvXDbAvcVsnYFXDUy8nwm5wHsUF0i/lL37ZY
         NEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oSeyYv9fGrIvCDH06h643mqOjyw7AdOjJCHmBe/MXEk=;
        fh=dbvxcF+wv/s0W/vbgiEajIQqQ0tE/CJz29MvQ77T3zI=;
        b=FeiCsBS9if9NIKJ/icsIJSdY/J9XZHbOHUo714vXRZCSz4/bSjD6vbbVUvwOQJTdiu
         tyacIdSame8iBc961IGJxPasEQsMP6+seL3RO2wa3EkKbQlpp0UJJqRf+aJ9bNPlJzZJ
         InliwbwCl16T7m3morqJUnezNKA2WZeaIttOHs8KY8u15AYiXqGOIEw/tLFvW0k6NJQ5
         Nvitd6Wh2UCBz6R2ZlIfXyOA/c8vRGdPvP+/9+dLmJTlffWPhmXm1l8WE5cqL8AfYrci
         RhL7MyU3MpyBqnQOCBJgm8zeixIn8proypkiZKDEuLhsjdLE4SmCYDCHEUTJ4i7jMiR8
         KP6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvpjAnYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a05620a280c00b0076cab6e9e69si5271071qkp.158.2023.08.28.15.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvpjAnYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qakUz-0006TI-FS; Mon, 28 Aug 2023 18:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUx-0006NX-2S
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:14:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUt-0004Gl-9b
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:14:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3ff1c397405so36036165e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260849; x=1693865649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSeyYv9fGrIvCDH06h643mqOjyw7AdOjJCHmBe/MXEk=;
 b=HvpjAnYRFHzC3gtkDTwozxlhG1ak3ReMatVzT8Pe0f/2/gI/eOPL8drNj6EvvQXkzT
 PnxkW24IbXCXfBdCjXBsnft67rjOkTE5pbQOjeWS3ZOswjwjIrSnXtasLA8XdguJiCn5
 LKpGf4rCE2MbWRyegi0TsE19qhrEV64Wt6M/gGbaL61fb402qJJfIqFZ3bb8fIH97kaj
 MZ1kFgogBOV2m5GILZi7f9xJSbCB5RTmXduGjLKF24PZrwUIwvVTTbDT9fwXZN6VbEIM
 AKDFZGWliSdjHbqATogc/XWNy7TqDjB+aiUqjUytuQ0tPKujK5W6Ucjz/V5R4OzPOPPG
 9yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260849; x=1693865649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSeyYv9fGrIvCDH06h643mqOjyw7AdOjJCHmBe/MXEk=;
 b=dq0FZetSGJTyoLb7a4dzy5G/Xim8AC/FpSapJcCEw38tA3TzPU5xggY8UlGDq/kHA0
 ySQb9F3VilS8+Wvy/vNYUQLJNpfK4msufhRf9PMdF/9cybwv2Sa/jodKnMFGnUZLoqlJ
 Wv1CC7jdoek0w60tdj6JlDsk3G//NaM0aLovaKxWrIJgB0ZuM5TEIz7hR5uujRAdvbJZ
 GrOmEjvEi4ogml8GoDY6YDFQcbvbDYaeE6i3yYKqVmGLCCMSUQA136PamcvvY0ZmXND/
 K+zaPJcs4qqbWWmUQJe/m7VxDalTyFmkweRZisW66NNJVSMCXOu56curiZU/bJrK7m1b
 Ze9Q==
X-Gm-Message-State: AOJu0Yyl/KsmxY5Xs/bUiDJmKZOiQbqz5vg28BkpTcKScP+wv7A2F4xK
 kpsCvFVov4wPBsAnpNJRjiTQgw==
X-Received: by 2002:a1c:7407:0:b0:401:c338:ab96 with SMTP id
 p7-20020a1c7407000000b00401c338ab96mr4610157wmc.34.1693260849479; 
 Mon, 28 Aug 2023 15:14:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a1c7c07000000b003ffca80edb8sm12058270wmc.15.2023.08.28.15.14.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 08/11] target/mips: Remove unused headers in lcsr_helper.c
Date: Tue, 29 Aug 2023 00:13:11 +0200
Message-ID: <20230828221314.18435-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
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
X-TUID: SzElm5B6HZlB

This files only access the address_space_ld/st API, declared
in "exec/cpu-all.h", already included by "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

