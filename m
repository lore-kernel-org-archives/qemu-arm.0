Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5053355ejc;
        Mon, 27 Feb 2023 13:35:04 -0800 (PST)
X-Google-Smtp-Source: AK7set94lF9u5RX1umJPX66Zzm8DIFtA31JajsLszzppjA7T+85FprwcyLhCD2pX2FqEia8hHcLt
X-Received: by 2002:a05:622a:1101:b0:3bf:ca04:3bc6 with SMTP id e1-20020a05622a110100b003bfca043bc6mr1317375qty.9.1677533704693;
        Mon, 27 Feb 2023 13:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533704; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0GYqlIkIqeahqcRjuY9p9lwGOAxP1W6Wjulf2upyA1rm9rgL/oCnqqhmI8ZgbgIXx
         4GTaabQmV+lh9WM0Q09ASlBOApThsnpMS/mFI/qBIGeVjTgsXtDmHsBwJGQQ5AKTY7/V
         vY7/GNyVs+dj5M0i4KFOoY9aJ/lvH+7p+yUsWtuAqCGL0SuBehXNU4PmLA/S+0WMpQbK
         EBbkFTDFnioWXWisJsPgfsF2pcoDmELdZOPdaPZSFspg9uQD3brc5fBGZjTGq0LyKC2D
         tEhwUxaqmzLIkX+KsVSlltO2NdgWloN8exuB5oa2cV3XCa0DSgGpKtbF6CtnrDwX73br
         O+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FVJHbUykgOVOv7t67KB4t0GKsC8KJ/J9KiSQxpR45pA=;
        b=FvjfaKt33uvKOgblASy4EqOjBPhWpxdc1LbDBpdCcjIQ85JUXLaYywCRH37KqNnvNu
         p9W1fgRXeSScKxDerywPc9mo4uTU6Iwa1ye72tQg7zaxUuriq/w8ynhJV+/XMs5WX3Ph
         s7lyQr0HvtlTbkeTRR5p3YYheL71fbKgtzlrlLhww5eQ7Bha99a8MtCrtRls1YkXkCzd
         0TCWWtjYIpSkpqPHWbY9qPRGouyt6J/gnB1FDwuqblF1j7uJ57gPvzzMXox4n2+BSIZe
         NMHTVDhKyAUEuFs7PJ+Gj61wphUcF94oMfebJXNWEnFwJ1/VGSFAHmbhcPOvk3L/KFX6
         L/LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agjmA4MT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020a05622a02d400b003ba1d2fd43bsi6914611qtx.195.2023.02.27.13.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agjmA4MT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl7y-0007Bd-0v; Mon, 27 Feb 2023 16:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7w-0007An-I3
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:44 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7v-0004IQ-27
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:44 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so11496950pjb.3
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVJHbUykgOVOv7t67KB4t0GKsC8KJ/J9KiSQxpR45pA=;
 b=agjmA4MTl6QPVFdtv+h+j/a+h+LOiOvFlHgEUAkFoXFsXKwQ3ZNynnfXHz7TIT0Gfc
 6beifMhdiXEqkRw616tE0MneXazpUZHaMWaepVleODSdcwE51eWvXhNhhA4JBHLCHIJO
 qS4N1U+tLBoxfZRFsU8b1rgTnXrromer0RKeXL7mWVNtJWvgfw80qIPfO6r94RiEytb5
 ooOT1Snvr5O/+uhs2ECK8uHcQ6z++lnGd1vi0hTjFnumEwIfwevMDSXuOJ6hSNAvvwL4
 BBzzcfIlH1z7yXi8k2AnKscKyiMzGbMHo+bQGZh8T9btUqPmPtwLT9vNQflp/Hvz53XO
 cX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVJHbUykgOVOv7t67KB4t0GKsC8KJ/J9KiSQxpR45pA=;
 b=j9XaznDpUZdD9/xxuhN+9yeTQGjbgup6cvgl4lVuALMEbb3ps6KbtcT6fWXBK+nnI/
 Y6rwUEYe2jkwd40oyJHxzaejQMM3JFwK/IGiYJ2RXwFtqBcQOtdLscpJnzaQ4JSXhNFN
 1j5DbVBO0GnAZjh10kJGKCq9eDiUUvF4Czo9FMmXDRKK2EvpawQd7wj4hw1ZOLSySbjI
 pTkrfgur29CBmaoTe95WXw26a37/lrrFbfupSE7EoDMY1hb3fqNUTRq8wZVdAin6k5QC
 4khddGj7RZWO9xU0pt1UkG9TtHeMK5yhYO4zKhwNuuLRcn/KWqQTbJZyicXGOGcH1A/h
 rvxw==
X-Gm-Message-State: AO0yUKVIIno2Z85OEcTiOrvl7P4dW0NJgWr9O+7yDWrDJ4oGHRLu0jI2
 Brl1Ztj/yE3MMTXCF7Y0Ug6m/6yYzoj5lmS9wqE=
X-Received: by 2002:a17:90b:390f:b0:236:9eef:e285 with SMTP id
 ob15-20020a17090b390f00b002369eefe285mr608537pjb.35.1677533621792; 
 Mon, 27 Feb 2023 13:33:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 27 Feb 2023 11:33:21 -1000
Message-Id: <20230227213329.793795-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: mFIpENVwbluV

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 070ba20d99..895e19f084 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -283,6 +283,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
     int base_reg = orig_base_reg;
     int i;
 
@@ -319,13 +320,13 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, cpu->sve_max_vq * 16, base_reg++);
+                               i, pred_width, base_reg++);
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           cpu->sve_max_vq * 16, base_reg++);
+                           pred_width, base_reg++);
 
     /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
-- 
2.34.1

