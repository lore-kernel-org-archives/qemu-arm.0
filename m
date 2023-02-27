Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5118176ejc;
        Mon, 27 Feb 2023 15:02:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+CUszTeHkCTkYxLGidZwg5libudUIZdzu14vw4p/ekC2ITDovdwHMFhJA5C03Lc46Yo2hP
X-Received: by 2002:a05:6214:2264:b0:56f:5466:20d8 with SMTP id gs4-20020a056214226400b0056f546620d8mr2530763qvb.3.1677538963257;
        Mon, 27 Feb 2023 15:02:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538963; cv=none;
        d=google.com; s=arc-20160816;
        b=QSY38r2yumBeEPLuN9u+5+YHsaAQQIaj3tmkGRst/f31yx11YOdt9R6hjJAQtfovUM
         IjI9kg2Gy/itATiSKxrqbhrdJ7lu8VcdTVpeSFlVDJvnzLdDP6n5881mo82ap9PAE98A
         fz59E8Q2NfAbfLL8NNTn1IYIXb4yG+jjDOvpwDwLHD4eLccG2cvum34yn6u/NIrp+H70
         SVL+SXBEA2RSKqj7jK1L9THk32k6ynsr9I1MPkxQrlUJt9ahImzpWW3Y0XdusX04PWiy
         KxnsZXS4k58tLNK6d0kA2oAsXViTwV81cb9MWob8aOkXP87VMR3AEFdDeWgHqKsQo/l7
         fwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tZqDXhMcCOeub1Ju764Ko+HifWn9WFHZoVwIsyr5duY=;
        b=OWpjb4D7I2zX9rk2lmVpNmQ0/7hoQ/LRAyrmCmCT492I0KFA14+HDJdxcL6+6XqOy1
         /ldzM4IAVB4NpKWS0CjnBO8JEzdHMU7+D7d4IQz8ZdjjGaLwrvYF5JgbsbTnchSqBlnO
         G7Wc9nDqf8V9m7hC+46WUhhQMB5iyYNOUuFtpLKcUfQs3RrC4dXAxvnuTfZI6TbEO5nC
         /lKjRx79kSXepGqmki46TBztB0cnYiOwlKHmrSqkE/VYiri9FPnI4HdYsDEIh881D/sz
         x5h6K5ftCf4EIRebRP8DGn+0JfRWmFBWmmZFHhVSwTIMbT7I2wmVTuSeUbHXHgKuDP45
         0Rnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xo6w2ztM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fi15-20020a0562141a4f00b0057109661a1csi8277118qvb.378.2023.02.27.15.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:02:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xo6w2ztM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmUw-0007TF-KC; Mon, 27 Feb 2023 18:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUv-0007OH-Ly
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:33 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUt-0000yI-Sg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:33 -0500
Received: by mail-pg1-x529.google.com with SMTP id q23so4565466pgt.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZqDXhMcCOeub1Ju764Ko+HifWn9WFHZoVwIsyr5duY=;
 b=xo6w2ztMChST+elFtliGIIapTKSUnZGcrkEYJYGlf0MJER4vrma3y4pEhWVznNOivR
 fC8+0SIt99uQhLg+5fwR+2xXSCHnLzBq0jO8TX7wq7XMlVPT5Jkfsjh2IA2QzS1NzFQu
 0adc8sxEgBlBryao6cpZQ4YFz36KNX5p3JPnASWNg7t/S5XXUC9EXDjUvJgiDSWDMsDy
 yTyd6dpwNG6Wxmy6dl1AtcNvCXNprHPtEO2wg0yHdrf3yzuwznLmSOVvWwA10lwI8XSV
 U1n3B4WigkiDvfIuO+D+yoIEzp/zZbMaJcGEPOWNbMi1giB43hmSzT62P988DZfG5wmy
 Gr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZqDXhMcCOeub1Ju764Ko+HifWn9WFHZoVwIsyr5duY=;
 b=ni6pZ2GjSXeAF3iscXqMqm9Wei+OEIBnrIszMQHUAubHNWQ4utg9/XHwgog122ax4T
 cBdYrKbR33ZxXl+pHsSo7sZNGpFLHTf3ki8qzIB5ahoxDG3EQ7NjNqZtLaZ/MIlNdcJJ
 WMceBGGLijqCCNU65HAADE7LdZudjfTUAIHOpm4wZrg7KOkW3gysOPNLXgOjA939112z
 jO+EDwL3h/FI9UVklM4EbzvQEJpB1SNlAnx0+sjJsQ+m6XZVAM91v8FBUAOMVsTalThQ
 6ETTayQj69Su572uTUBWA3Xp9XWo5KVTInOCYO9//TmSOk1SG+SghGIm8AKfjTI/M66D
 PoaQ==
X-Gm-Message-State: AO0yUKXcCz6T3i8pJZqObo7ZuVSzDEzXpDc5YrGZKC2qFehPp0XbVOMA
 eajauP0VAFLFbZC8QPWT98m57F3/BcVID+vxoes=
X-Received: by 2002:aa7:8f0b:0:b0:5a9:c535:dba3 with SMTP id
 x11-20020aa78f0b000000b005a9c535dba3mr567113pfr.25.1677538890324; 
 Mon, 27 Feb 2023 15:01:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 03/21] target/arm: SCR_EL3.NS may be RES1
Date: Mon, 27 Feb 2023 13:01:04 -1000
Message-Id: <20230227230122.816702-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: NZBhdzKx2LSV

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66c578c360..20e28d5e09 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1856,6 +1856,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1 (R_GSWWH, I_DJJQJ). */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1

