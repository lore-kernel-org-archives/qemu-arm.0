Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5071962ejc;
        Thu, 31 Aug 2023 05:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQxh9aAAwwZXuODmdUH7rnoZME+AqDdcMKBNONuUXzlnvoriIWxB/jU8GWNsnLqWM1qE9j
X-Received: by 2002:a05:620a:2848:b0:767:18b5:f6d6 with SMTP id h8-20020a05620a284800b0076718b5f6d6mr2958130qkp.2.1693486758581;
        Thu, 31 Aug 2023 05:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486758; cv=none;
        d=google.com; s=arc-20160816;
        b=ncc8rzQ5Q5MPyUZLJr3OM0e6b4mjwj9BQLfXWQK7NGGQRm0A41GhXf5rzV5DR8x5+i
         MBbumD2/cUKJjl1d0vGX4HMkRbFhhS0VJAjXllMGREUtL9RZNcvnvcpt7zybFNxgKMSv
         EcSIIrUu9o6+JdGUqDRWyNZ527u1/K+39mIo9B21f7WllvIsQNofANyuSisw1UY5jZj7
         tdgYN/uYGEYM7AmtzSkzDEghEDk0oP1y5recdTpEcVBXh+tkQPbp3iqf16zNwN5knn6f
         C3Jgn/dhv9G4sWeBi69qhT1ZtcezWINUIqTMfg5b1mGw+4OAdonftogZfaI38qM2WvLm
         dbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d7qIBX23XIKc4/u+ga9LSmsROxltOGYIHLrY8CEfGsM=;
        fh=ehJgi6qtc5GgGFSi7kUe5Uk36tkdtVlia04EiCfbU/Y=;
        b=CxgXhXX1rrAffoAAtJ/HcDooUWCZXuo98cvX1+LzHqfsexBRy1Cqjp5kAqLaphoAi5
         Nlr3e0CE5Q3nFLJNC4h2Ep/I1nGaAACqn/bZ9dl7xDz0dikC1jzyXlPS5j064sYGfhJv
         9ddz6B0bo9TuWsfF379/b5kzi7rX4us7pA4HwJmN2J5InljQWx0DSsOe3BrmP60+44Dz
         EmbTJJ+7/8ihpgqqhlhFJIxsNCP4VwCPdRVzt8tFGf3gjvlBDxprOLLsadtdglxIRzj/
         mWlWxX0gAHzN+q7LFn8PgFFlfpITeMRdJYVMYYo7GUF7UMkZjKNHxmCP9tEIP4f8fTlr
         tHDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrrWo0pB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26-20020a05620a0e1a00b007680ff87aa7si896634qkm.364.2023.08.31.05.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrrWo0pB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhGA-0003zM-2R; Thu, 31 Aug 2023 08:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEt-0002lU-Hg
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEo-0005Gg-Uu
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso7057445e9.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486649; x=1694091449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7qIBX23XIKc4/u+ga9LSmsROxltOGYIHLrY8CEfGsM=;
 b=nrrWo0pBWhQCoFWyLzBG3zpDc7PkECubeXFH2LUv/r8XvZhKno6x7TWRhp6KCAWrDg
 7imyMlNCc3X+V1GtGOPlO8oPqtY0Lnk+2ReKAfUimFmqLfb77xAIStpWhrlq7VsYGYEn
 uJyMBeeUfNgWfhwMRlZKlPbyQZUHJgW2mT50vXi68LMJfWy/5J2tJDiOsKV5U7pfTcrN
 YqQnnKLUuFh+PVTtZx+N3XEhj0HtN6pol8HRo6IgKzAnJTjFSZBLQtXmslMZgcrkOPDp
 6fWwFOci4CDQzRj3i7l72ClL9a2HHF0hemUnzsiN5vdi5lRtyiX58yMzXdcVSANJRI12
 zYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486649; x=1694091449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7qIBX23XIKc4/u+ga9LSmsROxltOGYIHLrY8CEfGsM=;
 b=B5q8DVFSO6jEGazNhCZh+1UvP/13hBxV8RgNP13NnwmVov9uu9ZlbdYd/NOF7s9HI/
 W9A61zaNxRB3Z6Y3QGGyOA0xCfVwXGRjiWdQWNL5Z0FPoV9qEf+cwBsMFxdQMHEwucU0
 hyORtPTkSLuJIv0sLJyay2Vx1AkUrTXeM0GlDiU5HLeii5NT6rOQM0/xIucvv13OO+mj
 5dxhwL9324jZACnks2BUL7HGK3RH2hYkb5mMubrcVh9ZZuLILqAU0SphoC0XgcXUcvNT
 8rOFfWdqrz9siE0oIFAwWTxu9h2JPt8Md7myi+FrvqDm4sMGS5Wtl2bj5+785OcFtePo
 VP3Q==
X-Gm-Message-State: AOJu0YxGaKguBVj0yV5IluE5oRdmY4X5lHYj/UggDF+29vP7DBgzAhid
 FVK9Jvfalo0HTXJV8v3xuRULRQ==
X-Received: by 2002:adf:e788:0:b0:31a:d6cb:7f95 with SMTP id
 n8-20020adfe788000000b0031ad6cb7f95mr3957781wrm.18.1693486649554; 
 Thu, 31 Aug 2023 05:57:29 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 i5-20020adfefc5000000b0031759e6b43fsm2175456wrp.39.2023.08.31.05.57.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/41] exec/address-spaces.h: Remove unuseful 'exec/memory.h'
 include
Date: Thu, 31 Aug 2023 14:56:09 +0200
Message-ID: <20230831125646.67855-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 5P1JgGYmsJ9z

"exec/address-spaces.h" declares get_system_io() and
get_system_memory(), both returning a MemoryRegion pointer.
MemoryRegion is forward declared in "qemu/typedefs.h", so
we don't need any declaration from "exec/memory.h" here.
Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230619074153.44268-4-philmd@linaro.org>
---
 include/exec/address-spaces.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
index db8bfa9a92..0d0aa61d68 100644
--- a/include/exec/address-spaces.h
+++ b/include/exec/address-spaces.h
@@ -19,8 +19,6 @@
  * you're one of them.
  */
 
-#include "exec/memory.h"
-
 #ifndef CONFIG_USER_ONLY
 
 /* Get the root memory region.  This interface should only be used temporarily
-- 
2.41.0

