Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp349445njm;
        Tue, 29 Apr 2025 08:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnW4n/deHdYvV3eYu828pdvDWHPTE5lX5SFTr4lRKpJE8X5tqCH+CX0wEBcyvi0Tz+zxguog4l0g6D4g==@linaro.org
X-Google-Smtp-Source: AGHT+IEPAFOljdMf+lu9vDn/VNolzSon1nqxS5w+iR4H213XPsaQYUUAE2AqRYuIiGuYE/F2bGaP
X-Received: by 2002:a05:622a:205:b0:476:903c:822e with SMTP id d75a77b69052e-48131ce6f2cmr209947851cf.27.1745941185719;
        Tue, 29 Apr 2025 08:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745941185; cv=none;
        d=google.com; s=arc-20240605;
        b=Qx+6C5agxvR7ygPPvNZrvojH1hl7lZWlHOjGKGMSw8Us/9LphRAwQ0YSCps6zJbFJU
         2rK2rf5n9VavqybQTXBDqEcgw2TnKAIOyLLO4B3c6vjYNpEPlVQ7WmeiDaNbtfZkNlMI
         Bz5CJQvUP+hAf5JODRHPFGyamVj2/F1l4xFS2wvzEFxOihUgPFBH2GNQTL6OXdLx+vF4
         VQMERK6gQHpByD36PmQMbV7BRcZiJxXKgaqMjLgUc53oozszjUHoA9WPnnHdpIlFNVVL
         uVGNvDa45ql/zsukiKIy1qdfUCk5m2N0eTktCSyKxmFnPRjZI2qezRs9NW93wbEQBtMV
         AQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eqNWxGIMem4uer7YASxHLzlAMSlAZlNycae1AJ5U3ss=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=Q9iFfRP6Y8kZNQzJlQG6Uv77ZmJFjosvVSDX0Z530H/yxhTekb/Ebky74CMcBCnKGU
         nN7WPXZ70XWpkPxPZzqQ5WOAt8XffCgCalVg4vPQzqy03k9Mno9c4oCcyY0kw7MTDJkG
         fUS6rQk+ybRl6a+RVFIXB6hs6SeLbQK7zmBI6zC/uIb24u59Wpy4UH+fYKqYEUjf68ku
         E+aOKmKY7Z6PU5OKEoydfYVqpMcWAPHAIQOnyyn9P8qMGg9Qpz/FFyaPlcoKWvYd18jx
         R50V3xTNy2Lxzy8Jku0y12z3+SeMFjSCq5w539/Qsbkr5mXLs6Z4VL3yVIbTupBGhnkm
         DdrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vk0P5cEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea179c343si131983701cf.204.2025.04.29.08.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 08:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vk0P5cEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9n3P-0006eJ-LE; Tue, 29 Apr 2025 11:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n3K-0006aj-7c
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:39:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n3I-0007cU-10
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:39:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso39122925e9.0
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745941158; x=1746545958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eqNWxGIMem4uer7YASxHLzlAMSlAZlNycae1AJ5U3ss=;
 b=Vk0P5cEOyIuNdaLMgM8k0PgGp6d+EJBOimM+w2KciDnS3ktzFY4wkBf92Iw/sOXCXc
 f34r96H/zsUa8VJsRBOo0gMD0EVEkTK2ERelBXC9NdNXwriD1nRyVbfT/dyPw4ODd8PN
 c0vIfw0HoT9MOPyvyiFqAfO3eklgNYQj6g7AMYhKboMckQIQtIeMFxyXplcBh7qYdVFL
 IUbNTJ6m4mIWq/ego3lImULoM5vLa/GowcWjAVqGzdPM2c5vOEGXTynJP59V7g2ZxuyM
 aYrD/BFN++M7VeYkXmHdrZ4nPeTEHzDODZk8DtcMym06uR26bsWTbDfZcX/fvIXpWhNn
 oizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745941158; x=1746545958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqNWxGIMem4uer7YASxHLzlAMSlAZlNycae1AJ5U3ss=;
 b=S2P0AVd4FtAiliHiAszz5qfS3lf7TR6M7ra8PWm3DwFxgK+mthbPw2bXdvw3V/Kk8O
 qmaE733490eRQreu1XiuSj4VbJdzwbqRrRkktzSBAEsMqZWLUpHyJpVsfpZ45EzLwbMD
 ch1Ayk4duYZnoiJEagjh3k7Tq/VbbQaW5zdsyBA0pQd3cFilPwDSqsOMp/ry1tDdi94Y
 zYiu0AcTvw+INRohAOm+ZWUQOag20Wv1x2Rdu5AmdFzL0JIhs+obvJfvpZI0bDqU0SMQ
 Dw4+hFMqpDb9n0rlxW8TAHUKPTFhsDjAwr9FbLZUDU9+DwnJmf+id452u6Vk9a3N5WBV
 mDUw==
X-Gm-Message-State: AOJu0Yx7Oh1xNsIQPrxLyHaSz3Fk2M6zPRg+ELr1An+wJQH8C9MD5EMV
 cuAK1M0Ylf6rMKJ/DAPBDq1RRtBYMIn/fLPSWd4FTUQ7La95jZ6Yo35FfiEZoGU=
X-Gm-Gg: ASbGncsPELVfcXY7A+umNmmJap4VHvOqAKb3QLeVVX8ljWdyM/0ozD4eCiu25kL7piL
 MTB2SW3reMFrxm4aFvECNyNE17i8Uc7wK4+2KfI7Q8+4A0UAj3gbnbd9/YDoPU038wp56vJGBCh
 /opXDE99yYmSRIA9S3+VmN6mBrv5anhliC9cNJnKJyC5ptuD8/59PmwMY3xhqmjP9jzva7nQeZP
 /uQ4wO0zlmAnb8lLc0uoqz7lLuvzcfgtFOYb5H/FPyC8+idqBOPnyd2RtXA3RgbfS3NmOvQL4+D
 LCypKSZ288qJVMucDVtDHoNMOs0VtQqwgFI0Zntftm/ZuqSRWoTLSAeAzraat6QH5VZ9sek5TOF
 L5EuNBDCYHW3XoDdRy15o
X-Received: by 2002:a05:600c:870f:b0:439:873a:1114 with SMTP id
 5b1f17b1804b1-441acb065eamr34645175e9.6.1745941158356; 
 Tue, 29 Apr 2025 08:39:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441ad8149afsm13772635e9.0.2025.04.29.08.39.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Apr 2025 08:39:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] hw/arm/virt: Remove deprecated virt-3.0 machine
Date: Tue, 29 Apr 2025 17:39:05 +0200
Message-ID: <20250429153907.31866-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250429153907.31866-1-philmd@linaro.org>
References: <20250429153907.31866-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: U1F2Q9NiZ+kG

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 83bd1152804..f70d90d12eb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3577,10 +3577,3 @@ static void virt_machine_3_1_options(MachineClass *mc)
     compat_props_add(mc->compat_props, hw_compat_3_1, hw_compat_3_1_len);
 }
 DEFINE_VIRT_MACHINE(3, 1)
-
-static void virt_machine_3_0_options(MachineClass *mc)
-{
-    virt_machine_3_1_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_3_0, hw_compat_3_0_len);
-}
-DEFINE_VIRT_MACHINE(3, 0)
-- 
2.47.1

