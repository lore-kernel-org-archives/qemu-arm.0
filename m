Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp713974lfc;
        Fri, 23 Jul 2021 09:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsNTuG3hFCbE+c8Ua06DIfNgxKKrqoREs2Qp3BG9T22wPtgJOZ5E/5Gc8MMj8j8HH3CUL6
X-Received: by 2002:a05:6638:338f:: with SMTP id h15mr4776249jav.135.1627057597168;
        Fri, 23 Jul 2021 09:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627057597; cv=none;
        d=google.com; s=arc-20160816;
        b=jPT+xv35vQmQkHENOFIpaM13vXYWf1SXW7JBlUw9QGIZ8qjduQqvTvnqE76COCiw7R
         Ael0hIs3nnIQH+ZS3cbLWoVMg9uauYdPKV/12SijZrk2hl77pdXSW4NGl+LDSDfJz+6w
         p7NnAQDsd7HX7v099MMqbHBsMYlnl32O8e6wPOg7FdDJqZrK07X5fdmWWq7DbJ2e27z5
         xwJib5J38SNQuQYZn7GY8yjoE42GrQUTOhJ7Whfce0hupaiT2WzsPcrH5aP7UUDdfDXB
         falC0VRoE57sgHwZ/YV/bwRJrb49uCGpmhSHaBEsrP8gruumaNdsOvAbPjiCDDw0zd7c
         gLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=25KPohKxJgwnGi/5F22vyFBpbh7T5Mv/FLljFv1RBvg=;
        b=LdsbahcLYSp7pU6H7qRu1laU1lWn3sqtEO6LPxResRM6WsoJYSghF9fI5zBoD+Go8A
         ziuHeUxtHOlYAsHg/fJnQ8WeJey/uqbFKYII4gHQzXdEMXaMdRlUSSvcOHoi31hQgfQt
         FEjVYE+UppUwk8WpaejEFzw/MFq55p7pp096HowXfRelVIXLIiAqTTMyDac4+UjdrDzq
         Mw+JwEJAowQuV70bhTliuWQ/cMEMB+AbunDPm+P8clbbQH0yxTBf6cRrm+aTKOv7rptl
         V4bHitwTRXMv9DpJWb/Rp8xWxjkipScl5CK/tV7kQTXE6QTprrQvkLjDaaUooPULUG9j
         +f6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVR+KH17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si9134990ilh.40.2021.07.23.09.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 09:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVR+KH17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6y0S-0001su-H9
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 12:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvv-00008g-Sy
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0000mR-FA
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j2so2931006wrx.9
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=25KPohKxJgwnGi/5F22vyFBpbh7T5Mv/FLljFv1RBvg=;
 b=MVR+KH17X035bYJ7dmzqEKZ2hDNHNNdUuB6zq44bsqU17LRdNmyZEs5nwVsMT6xqSG
 MuWTZQ0w7UbbOCoGz7GA2Q+ZivwNTs+HwK9LYPzJhZoA9kT9NEqZ4nolJcDOQK3X2X/3
 5wlgUoHnBgjyPgTxCv2aTlDlzXv8mnmTm0RZtpL++TPZyw1drb5casLeXRCaGhStL40H
 4MnE0tGxn5NYMqeJdjuii7bUTkUxIJPC/SmO7M6+2/RYSOT0TMl6vCiGxdSQ3ZMu+mLR
 ScmiBgLguIqkfGr80i7JZnYz6KMpN2lkXiWY6/aIZYYYX/IW0iKw4gQ0MSIWZW7TWo2u
 0Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25KPohKxJgwnGi/5F22vyFBpbh7T5Mv/FLljFv1RBvg=;
 b=g/DNpPqazBHIZ4I1p84xV8kH8uqOaZNPwBzegMQT+sJ3NOddqu0sPzhcusCRq50Vay
 qTYJC4pZV6XdJnJJD0oktLh0CMGDM5xGdeI6MgfFOOs2RqodyQIDPmut2uHjuF/gTKJt
 sA8VW2fdZ4abzuBlJPfj+Yn0l6QQFl8GNsNst6RI9oIrPCHlESxCfUZA+YnKylIq8QpB
 p/Mpnd/4ammBLLEluhHKBIzEwuRvIrNzS34OMfHFG2HbtpX3SZYckTcKbgYzF5ATydSn
 +gf2e/7uHWl3nWKiG9AYayS3PR9HwQT4Vgq071bxmpb8NAqG/4y9F1AsGbzKRA3ecGoP
 mQFg==
X-Gm-Message-State: AOAM533qzTq0SIqaCDTN19f8ZVxkfGbZwbVI9Asy3R0MQtBaum0eITBh
 /lYIDDW6QbuGKotgEXyPWxoQRF67t6NWiw==
X-Received: by 2002:a5d:610b:: with SMTP id v11mr6237736wrt.58.1627057312106; 
 Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 5/6] hw/intc/armv7m_nvic: Correct size of
 ICSR.VECTPENDING
Date: Fri, 23 Jul 2021 17:21:45 +0100
Message-Id: <20210723162146.5167-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNy/5OYTpv41

The VECTPENDING field in the ICSR is 9 bits wide, in bits [20:12] of
the register.  We were incorrectly masking it to 8 bits, so it would
report the wrong value if the pending exception was greater than 256.
Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2aba2136822..c9149a3b221 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1039,7 +1039,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         /* VECTACTIVE */
         val = cpu->env.v7m.exception;
         /* VECTPENDING */
-        val |= (s->vectpending & 0xff) << 12;
+        val |= (s->vectpending & 0x1ff) << 12;
         /* ISRPENDING - set if any external IRQ is pending */
         if (nvic_isrpending(s)) {
             val |= (1 << 22);
-- 
2.20.1

