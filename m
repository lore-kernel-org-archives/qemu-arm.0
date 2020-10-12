Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1150840lfa;
        Mon, 12 Oct 2020 08:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzN84mbduUUEDWaNG/7sUFHw+3prT9ojXDA9oYlkpw/1Vt13/V08Fhvt5DqfKcdQ33+wev
X-Received: by 2002:a25:d60d:: with SMTP id n13mr31100450ybg.10.1602517116403;
        Mon, 12 Oct 2020 08:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517116; cv=none;
        d=google.com; s=arc-20160816;
        b=Bngl9xDyr0K3p8rw0j3oOJBBG75xQNX2gR5ED9uROxBRTnL4dIcFZUe81O76FA4zyx
         7NaIrxbkdFxISb8uLcPY2aHKCk4LzW8+usbrEzkcOk88s3RBSTN3DeQbpKyYnE0x96BO
         K47yJdfgZ1cgZwbYe/0xl2XQb6W+x0sxOnt7pJ1JM94bhkVSnezQ8o0u23a7JQs+kpuU
         GWpu7qaIdRHpscHnRk9C2sZsGxytQX8bApdWlmjQjEVhAlxkmQbxQxhxPV/bboCv4HHo
         5EC/6JM1GcciomfM/sEAQ2jyJxrkyh+3MtuUX8b2Yhx6fbKQys9mcPlmNVJCG34Z1GoR
         UiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CZMtI/tGFEHR1d/kfeU7MuVTM6tT3+kuWZIcP5eHXGU=;
        b=fioR9QlTSj2IIacOpcb9S1YLnZBBi5OZNOAEBtTB9kxexQbGfclKF69JuGPrTuCZF5
         //tZm16TzhJ/1v5i4ZHDDaBEXMW15x4x401TCMhWQJctiiPnG+sDWcDBtF9+zz2HAUzh
         SyPZSRr3Tyax/EiJA0VzSrzbjdGJaBIlMA/wFPYgK7y+jvCWK5utpUEe7yaPSTwdjs9f
         Zc2aaLaek4Zf2u/J9lk2LdJQzD43dyCfUbjpHw4Tf4dyLmvvtRC5rhBBjV37u2Y9U8P4
         eCfGJDlnozJqr4uBD5+XNQtxmshsjNPBZe8URfAV6trKBKZwRixLt5lAqAOZYWSU1pNn
         v+pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cDaZlaE3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j190si14483605ybj.150.2020.10.12.08.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cDaZlaE3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzuF-0003PX-NG
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq6-0006Nz-5u
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:18 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq3-0007Dc-3D
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:17 -0400
Received: by mail-wr1-x441.google.com with SMTP id x7so11086089wrl.3
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZMtI/tGFEHR1d/kfeU7MuVTM6tT3+kuWZIcP5eHXGU=;
 b=cDaZlaE3XiozaOt+HUTF9SxyyrGNTiC/zQ8DIcKqtdeDRwU5hnN3OYBht0fIaq5Y9+
 AWpmGQ4hhWdeNzMEqeGzGDXLeScrJ53+Aq006Qt/YAq7LX73HpeR/OokRfNAMzdEnK22
 atAw5jf+eZbxarM5IMFeosKpcvJZzJfeMrmU9nz2C8ACMgJB3iVdUWPYeEJAX09UterB
 SnneMuZbf4N+o5sk7qrgkWnvRfmN/t9ZUYNqamD0fEzhUAJtMVehxhLFQA5d1XpMnML3
 xq+t18om15wn9btfmVCxQEBYm8V3HQ+3fsQYpvg4aDOIeUsvmCgWF+dHhCsUY7rCBUoS
 v0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZMtI/tGFEHR1d/kfeU7MuVTM6tT3+kuWZIcP5eHXGU=;
 b=UScqXrpLSAb1jgn8c8TVdBL06m9zs1bFn0AVWs/sFe7iaU+DdJ5VFIHGuJbo8TQ2/V
 jZgfrnDSSqgkVmdnfm5PW/DC5gIoWrvf5/jJAsnnVO8pBoZrxsbONOBha5J3tCODee+T
 YR18297wlUwwiinNVJir/nBDdMjeh1FRDh5P+PULGd23HlviNZWQ90MwtGtjO4nAzx0Z
 +GcYfJe//ap7aBdKEHSWbEW0U/boHQfmG/jGYtsfDK/H5NCpg8Y0Lds41PdKY5D6JKdd
 u6jCX1iGaExrs+TSZrmfpQceRrT3e61MgQc4tGLLF5yXD5U0ZHAFguIKu9ksJjzxzSvL
 LSMw==
X-Gm-Message-State: AOAM533ZZwAcJUUYKtKtgvX5jzmQx02Y//RCiJJS6DpEL7N/w1a8eC/+
 DJLeAy3jCTMO74zpHURTuT8ToyusGLphF5+O
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr30825046wrr.19.1602516853658; 
 Mon, 12 Oct 2020 08:34:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] Deprecate lm32 port
Date: Mon, 12 Oct 2020 16:33:26 +0100
Message-Id: <20201012153408.9747-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMTs1jWGFE12

Deprecate our lm32 target support. Michael Walle (former lm32 maintainer)
suggested that we do this in 2019:
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg605024.html
because the only public user of the architecture is the many-years-dead
milkymist project. (The Linux port to lm32 was never merged upstream.)

In commit 4b4d96c776f552e (March 2020) we marked it as 'orphan' in
the MAINTAINERS file, but didn't officially deprecate it. Mark it
deprecated now, with the intention of removing it from QEMU in
mid-2021 before the 6.1 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 20200825172719.19422-1-peter.maydell@linaro.org
("Deprecate Unicore32 port") to avoid the obvious textual-conflict.

 docs/system/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 4c52098c707..5c7fc8a3c99 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -416,6 +416,14 @@ The above, converted to the current supported format::
 linux-user mode CPUs
 --------------------
 
+``lm32`` CPUs (since 5.2.0)
+'''''''''''''''''''''''''''
+
+The ``lm32`` guest CPU support is deprecated and will be removed in
+a future version of QEMU. The only public user of this architecture
+was the milkymist project, which has been dead for years; there was
+never an upstream Linux port.
+
 ``unicore32`` CPUs (since 5.2.0)
 ''''''''''''''''''''''''''''''''
 
-- 
2.20.1

