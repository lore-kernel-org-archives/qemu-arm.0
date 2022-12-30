Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4840055ejb;
        Fri, 30 Dec 2022 03:38:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu1wkPMXFCD1JL3KgDMkrrBel+CAwxawrNWAO3c0y/EZpmxuCiHzwGQ4vfrh+rK4KNiwNRC
X-Received: by 2002:a05:6214:440a:b0:4c6:f7a1:dc03 with SMTP id oj10-20020a056214440a00b004c6f7a1dc03mr41036727qvb.37.1672400282521;
        Fri, 30 Dec 2022 03:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400282; cv=none;
        d=google.com; s=arc-20160816;
        b=NJ5vzLoLcrk1r5tZP8d4b4lpSfVcB0Nnti5d8QMN8CtzDLYJ/s7PSYkEtSfBa7TSJM
         2NW/Qx1lcTM4AbYhBJexKn94PNQnygBcraKp3iZnwJMm8xo39x/Ql/YFDPDoCKesuyi7
         XQDXzRmVLMhkNyryU1TscBml2sCHCvN2jLe3OxC9dBmSEwvP/k/tbcdlbePOWnmp0py9
         sNBcPE6G2H0Fhil/0Sgpz6w8Nn7C8P8Smn64tu25RiOfMMpsSYYPClBbjChERZ6CemcJ
         QhLEAteOOdcQEJoYTnqyqBYg+SxDcegLOyYNwCYpJKE5viCB9j8x57Wzkr0sMaS8hFOw
         FVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=70DGxBuGEM6E1qaNTyKpqAEgNBdsVXtKZ3vAYEiZW0c=;
        b=s/exnwL8CxDd1y4uoOsUz5wB76YDCnTwvUQnPz1ACk2spRmcGGEAQ5+XU0wKmtkHw0
         xbxkaUMpE2ooAcgPjNlnDWMqupMi/n7zl5r/pG6J/hP/85A0M8Wk+IyQUB10Mnpfoe2a
         SgHGpoe2JSIDyHK7M9bn/F+tyzbZr5wsD3A7SfPOCwq83CGKmcjhX2aDGMFZjzds7U0i
         LHS7wb3DiwPIvxPqniTxx2ue3R6HrbZZKUSNso1nrAIT9U/F+jFDSoMyvakVP+WwI/M/
         M7xxWF/23GDOIEUUbfNSw9IL1cppBGFeLlb42oiadZqreUHLBqsoAjvUPvKgoJFzAFAl
         h6rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Fagbiy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a37ea01000000b006e3fcaa9da4si9768463qkj.41.2022.12.30.03.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:38:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Fagbiy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDfd-0006GX-WA; Fri, 30 Dec 2022 06:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfa-0006Fn-Lr
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:27 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfY-0003pk-Tt
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:26 -0500
Received: by mail-wm1-x330.google.com with SMTP id ja17so15007257wmb.3
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70DGxBuGEM6E1qaNTyKpqAEgNBdsVXtKZ3vAYEiZW0c=;
 b=m0Fagbiy3GfGjo0hXhR5k0EnmmqWA3c4F/Iopm3MHVIW0V+LLRD60zJmkIVLlysccD
 Q4K6wOxCRIIV1qsH9RZrheLacggzI18p+WcfNvtj0CGnLnDymwVXlHb2cmjqk4qLh4du
 kc7qq+vK4FQwDcU4/jjIjV6iFpGuMXfbNrGQoeCLWLSHEmCcqCHoLsASxMEKt/LOkA6B
 Ys2LLhQ1q/Rk/jt1MKK4hJ2VT2jvEqktplNWHJ8lx/jcZawAZyHKDX66siyX/0bvTOAb
 katNQHTGpcF6ibZzIVNQONKXs67NwEfwQMhkY3CtuI39bq6DEsmd8AslKSgo5HcCJzXW
 vlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70DGxBuGEM6E1qaNTyKpqAEgNBdsVXtKZ3vAYEiZW0c=;
 b=kTc4quWlT+Ot7L2qRxOAhdKBCSfMLJIOZ/VUDncCL0BbDsLRkO6r2ore79mE/UR/o6
 2TxNC3A9NolQL8ZgbijVnCsNsNPxelPCrNUhbfQTJofg167K3LMNGuJuWSmk7Xh2+dhp
 hjmAD705JofqAMnRxElWS0le7lz29tcCXoDinQOq1HDm6pER/vw+xqDWpvsGot5c1bYV
 p4xNEy+vB6KV4eZsRKqtCTGv4vAk0odoM4DYNVXtDvtA7lBAro9NqQ31/CWYNmdtWYcz
 4d94l2Ytn/C8dqrKOOcajSxoKU602/QZgge/oBO+l2w9RsanfZp4OMcxmm5HXt4fzrgu
 yGHg==
X-Gm-Message-State: AFqh2kpiyKQl3JtN8CllGU7vVeOQGZ6UcWKfUwPHW/FocHSE2FZbjq/j
 XTcPRu5+M9SUANnYt0l8+XRMsiZOJ+FMtLBy
X-Received: by 2002:a05:600c:4193:b0:3c6:e60f:3f4f with SMTP id
 p19-20020a05600c419300b003c6e60f3f4fmr21977721wmh.6.1672400124069; 
 Fri, 30 Dec 2022 03:35:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c2d0700b003c6c3fb3cf6sm26626859wmf.18.2022.12.30.03.35.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 03/11] hw/watchdog/wdt_aspeed: Log unimplemented registers
 as UNIMP level
Date: Fri, 30 Dec 2022 12:34:56 +0100
Message-Id: <20221230113504.37032-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +XWkuWQHRyLG

Add more Aspeed watchdog registers from [*].

Since guests can righteously access them, log the access at
'unimplemented' level instead of 'guest-errors'.

[*] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/watchdog/wdt_aspeed.c         | 13 +++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index eefca31ae4..d267aa185c 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -42,6 +42,11 @@
 #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
 #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
 #define WDT_RESET_MASK1                 (0x1c / 4)
+#define WDT_RESET_MASK2                 (0x20 / 4)
+
+#define WDT_SW_RESET_CTRL               (0x24 / 4)
+#define WDT_SW_RESET_MASK1              (0x28 / 4)
+#define WDT_SW_RESET_MASK2              (0x2c / 4)
 
 #define WDT_TIMEOUT_STATUS              (0x10 / 4)
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
@@ -83,6 +88,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return s->regs[WDT_RESET_MASK1];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_MASK2:
+    case WDT_SW_RESET_CTRL:
+    case WDT_SW_RESET_MASK1:
+    case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -190,6 +199,10 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
 
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_MASK2:
+    case WDT_SW_RESET_CTRL:
+    case WDT_SW_RESET_MASK1:
+    case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index db91ee6b51..e90ef86651 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -21,7 +21,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
 #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
-#define ASPEED_WDT_REGS_MAX        (0x20 / 4)
+#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
 
 struct AspeedWDTState {
     /*< private >*/
-- 
2.38.1

