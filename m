Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp350173njm;
        Tue, 29 Apr 2025 08:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHwfdIRPhc+2UPyuqqTAgyEh8m0qbG6IJ5tNIQBrpWOy0m0Fmx19k9xkdb4DzjPDizHEXioXGUVIQ3hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEEQvHyUk6f51jn5DzD2NFwZQIq4Tmv09y7c3jVgyYGyfgm6oRmrot2JEWnl2pXI12nEWpJ
X-Received: by 2002:a05:622a:5507:b0:476:6599:dee2 with SMTP id d75a77b69052e-4881393c4ebmr69300611cf.27.1745941253623;
        Tue, 29 Apr 2025 08:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745941253; cv=none;
        d=google.com; s=arc-20240605;
        b=Fqwae7oGcADEkPRsv7c93/sCgofRrHjS7ki5kfc71+5x0ddlahLLQrBJnLhh7syZxb
         cPwvTGj1mJtL4pJlZ0n76EpGrJARVPhAeIOFhNfH+KiMr/7gF/rnKw8gdm3qPb99tord
         PJRQR/8TTKlCz96j47ZNrolqQ+Hat2bZD4+5fWUjzG12aGDjbKApVLKLmvBXmoKIQWBA
         z8OHPfXIQ1AEZiWHgymfLJhPZMDFwhlK6O4xnRoEZje3pkg8rmlz9K7w9sqNayF6AqE2
         hJykZh4e11lqWCATNR3SyckCe834rA/dRsojNM+iFrpLYBMinzFsePm9GXlSABW3CqOt
         aufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BvMuIcy7uWLKoIFwC4B1ZONwZFZEu+NYFeyFXhIve0M=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=d+bFR/WTlcF3QE15qXoBUVul3JIJRxwQlro73RLZilvC1CNyIU/fafPSLJUDqTs8de
         ieD4Tv494H/I6TiRh3N5Klo3nR7/Onoj6wPviuIaz4pef5Sls/LH7cH3+B61wJGRjYgh
         gVRX/+VXNmBqLcCnb1mz8r5J501LxUTf92e970SX8dzEaeHspppm7UQ7WykNYmYE1WMf
         NsGpkg2l5LHzPnBfWuOAYGWHbzNcVUEdhyFjGSy7Wf6pgLLXvwTlpPLPYbnIxQ1sPIRY
         Gqq/I2wKUzfx3MtCfTNEJ6cBtWDhuw/TcxClqQHD06Jg4dzj5BsT1xfV/AeMC/xQLCIB
         yLgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SohTDoJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1f97660si135036531cf.437.2025.04.29.08.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 08:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SohTDoJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9n3X-0006qC-G8; Tue, 29 Apr 2025 11:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n3V-0006mp-5B
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:39:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n3R-0007eS-Bv
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:39:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so51801585e9.1
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745941167; x=1746545967; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvMuIcy7uWLKoIFwC4B1ZONwZFZEu+NYFeyFXhIve0M=;
 b=SohTDoJOl6rKTE9RuAl/DomJU2IME7t9RsMEyZ4XXJqO0cxrgeQpzafoCeF1F9qBAi
 ODLTh3gA+eo0WBsQDbmYEzBcEdKP9+qtZRhdJDVfxBz7ipq2xbW0jxCjAeovpDq9nyu/
 O5QoSiGgZFld1M9ejRB6hxwuOwNuDLlwYUT1hlk4BonromnZO2gM8Nh5dh1XSQA2zJuw
 oVaTdLBIXMqhnIjjSS6mnN+xp+e5I+lsIIwCH33br2h8YxbEl/C8UzTEuB1ON9tfYUjw
 xoAE8jk27BKRgpZnD/05iQsiDf+u00JcxlinF3Cr15p03+qzxAh1mpFOj1Ii+4tpbPcP
 Pi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745941167; x=1746545967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvMuIcy7uWLKoIFwC4B1ZONwZFZEu+NYFeyFXhIve0M=;
 b=G9Zf0VX7nmYWF35DEAw89vjmJgFqgF+x97VVv1jxwP43EeP6K/08nB6THTmuaKKgEu
 IGE8mZ457RiJ3Yb+NGTjboZDJMOsQJ1Z+9tdu62UH5V62NKDEROUzioRdg52s9wpUfd1
 LV4iX54/kkPkcER1Roet48U9sPd4NP0OGarP10kco801WDh6zywqAlqMkeypLCnW9HFd
 r4/J3WZFRMP1BYJYmgXmD0b3gTYbyJMJ//8398s5iBJr5Zfb2rffrvstTkZiQMG7i1DA
 huJ2gN/6ZUvjQDDdw2ugqN9lhpl7dANVGew6tdCnw7A262H/yGkljDGrKHhiuv23BGco
 Fz5Q==
X-Gm-Message-State: AOJu0YwZMdjTobUI+28UyT5xoDpVENS+rfH8dDCndg1mxjFdFkXlPFdJ
 K4jYWGsmtPL8hAzTAdUpUxKQwYKPwwsRxP5OoOToqm4AX53wJlHuxU+bcEHk1ktf9GxqGJh8Q0+
 T
X-Gm-Gg: ASbGncsLPUvXFJjlj1VDXu0fc6wZVJiqUHekboo+quoj6hcXLXHmUzyYtj8Nq6uCv18
 UbOx/0JbgA2y+0XrxYpCXfCGqCPfrHBCLdsmJsNDVx6/L+TP5UDZ2O+Z5TpSE/KQ1PGNiTMSCKW
 2ouxqpz0RZdiNrFXO1hxd4JUmGvfkOUwzT/zEV3Vj+Y7aB7MJrFA+jL1nzcm2R641zB9GuRBkZL
 a819MFlShrJMNCrrZXUzbTLXNIbpD1AnY5W4l5vGfhExpQvJx2XrMttokDVpt+LL2Q19pEasGyn
 m4Nn3pYVhJ24LbRTWC3DCEGCv1S9f+5aGuZiZQLBvS+9PzlZB+hTor3VuBD5chI+k8L6fV2gAZT
 fAK/zcz4CNU/FzwdvIPmR4Pn9gumq5GU=
X-Received: by 2002:a05:6000:400e:b0:39f:cfc:d520 with SMTP id
 ffacd0b85a97d-3a08a51f5aemr3425102f8f.15.1745941167596; 
 Tue, 29 Apr 2025 08:39:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46517sm14306959f8f.71.2025.04.29.08.39.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Apr 2025 08:39:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/4] hw/arm/virt: Remove deprecated virt-4.0 machine
Date: Tue, 29 Apr 2025 17:39:07 +0200
Message-ID: <20250429153907.31866-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250429153907.31866-1-philmd@linaro.org>
References: <20250429153907.31866-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: m6TCIbKNsWsz

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bccbc54073e..f4e5a93f0c5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3563,10 +3563,3 @@ static void virt_machine_4_1_options(MachineClass *mc)
     mc->auto_enable_numa_with_memhp = false;
 }
 DEFINE_VIRT_MACHINE(4, 1)
-
-static void virt_machine_4_0_options(MachineClass *mc)
-{
-    virt_machine_4_1_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len);
-}
-DEFINE_VIRT_MACHINE(4, 0)
-- 
2.47.1

