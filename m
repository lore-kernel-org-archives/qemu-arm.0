Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp799725ejb;
        Thu, 19 Oct 2023 14:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNMG3xsdC9eghznCFMLem2WNyq0+WvCNiE0I4STcQ1crykV42aNF8UitiE5JUbGGTJDWGP
X-Received: by 2002:a81:5e09:0:b0:594:f864:8507 with SMTP id s9-20020a815e09000000b00594f8648507mr66925ywb.51.1697750318858;
        Thu, 19 Oct 2023 14:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750318; cv=none;
        d=google.com; s=arc-20160816;
        b=QYS4qtAlQu6r5R6LqzhL6Qee8wE9SMG0UqpcW4TA3ekJ9xk2Q8kWg2oAPd/j1CbSFD
         DK5j5K4TEQ+e4rfjJAdWkrkVl/w6bw/YHhZ7kpE1NEe0guuRvuw6RETgw2tBZixy7qMi
         xHn+TiXed5OIvgbkA8/CQfLVlh/DH9c5LppSfJmgc29kn62X5IsYwfx+/wUxA97fiNO/
         6sjV7beJsJ7I4LdFGZTzVPPdXKC+Vo8JUerjbaQaoCy9Dk2VgjSqYe5py2MhJJvmKkcY
         xm+Q9Cmui5xHIsqqnIbH0PVnnobdP12k3bU07fs2ts1swtNlbqzwjGL5M9w3azfIUwrn
         95bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hia+i/K2YtabkAu41NP8XCQvgUNbgGky8+wqX7wYf4o=;
        fh=LDAgkXFIUtpglHF2VvPRPfhwYkSxALrpKTPtL8W/YP8=;
        b=zuBP7QF2MK44WMCVh4J0zTa91B45EAIzvGOM98ZtJCZ6KFyBia4cLlpg+w8n0l6ozd
         8PGun7nlBitlVRG+3+seazrYCLztFzusDESyI55UFoXIPRIqvDIW71cPSHW7HA6L4H6I
         d7TKXhZHX9EG8Oi2Fx9iBnwTSem3pYYspRBxIkFOJyY/dsbqFzi1Ia1dbyF55feSOVDY
         6ghZFMjm6Joc8EdWdJePi62U2k2L74Ci4HiTaZhKKCUSZKeEm1Id6kLt4LrSsOx7L9YQ
         /80ksz+gdhuoYpbXHENj/8mmmvv4O/sh+1FpFLPymfya6do+GJVHcravW5VfjW70Ygb+
         uJ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dn/xnAo0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az44-20020a05620a172c00b007759a519e0dsi267006qkb.73.2023.10.19.14.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dn/xnAo0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaPZ-0004jo-Up; Thu, 19 Oct 2023 17:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPU-0004h5-Tb
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:18:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPR-0004A6-ND
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:18:28 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32d9552d765so106476f8f.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750304; x=1698355104; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hia+i/K2YtabkAu41NP8XCQvgUNbgGky8+wqX7wYf4o=;
 b=Dn/xnAo0m+dMi0Fuxx/hk2Y3zz1X9zHDk5XgUTTwUFe8uZ98GqwKjrXPuzAAzaMDjk
 kixxp6jdGuOnsH4R26sg75aBZ5cXGhcE1m4iIcm19IN8s1biMaVWcy+4zuoBqXt03LZY
 Fgri9K4AcfftAleLATtayUPr72cUiR6eyYZrI0lV8IA/HbOt2ielWUENuRK8C+0uTaEF
 7pGDYlDHH/sQ+lmGOrOwFAZOIQIE+hB9jX9gKeAIjz9fcSoquO3z/S9sNXB+repl7q8b
 sknCp2t+/PQ/3mGElzdx2TzGLnGByaXVeZ5A6oUZ0IbCQKRQmLYH3gJ2IhZxiQzDud+7
 jQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750304; x=1698355104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hia+i/K2YtabkAu41NP8XCQvgUNbgGky8+wqX7wYf4o=;
 b=XBwQsG4oOkf2ioSewy7C8XgpCUdCAa8qg6Tt1ncm7gSqGjsWT/o5XxB8lTNzpUOOhI
 fcFkMdYets1dxzFWFP1sJnwhv4kCsQnwCZ+h3mLgLzq2AIUTXhyJt6MvRoPb3WDkUIG8
 +y9OKfvq3AT8SBxuGLCpZ2NBJesjmsJ/ownMo5v6U3bV3uRtWbUvY8e3ZMvhlFvWWKZx
 FNcT2Qz5qY6zldQTLMw+PbqtJBzEXw/hWCrYT+dRU2pFXyWEMjDKxqFW2ML4b6PS7J91
 lXc5ADnmQkWk75w1QTAZIn+HTV+++KQSfpm6wbwmdr1TEmDKrolWKrF1vY1JdLVs3lUA
 Us7A==
X-Gm-Message-State: AOJu0Yz971QdfFUB5gBLp3yGoPQcFT8sKJjTVSE90MDDdQub48QxbXKV
 D4G0sJDvAiGSWuNISf4u67Iuxg==
X-Received: by 2002:a5d:6b8a:0:b0:32d:ad05:906c with SMTP id
 n10-20020a5d6b8a000000b0032dad05906cmr2065409wrx.3.1697750303889; 
 Thu, 19 Oct 2023 14:18:23 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b0032dab20e773sm212889wrm.69.2023.10.19.14.18.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:18:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/46] mailmap: update email addresses for Luc Michel
Date: Thu, 19 Oct 2023 23:17:26 +0200
Message-ID: <20231019211814.30576-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: pfCZkMgIwGDI

From: Luc Michel <luc@lmichel.fr>

Map my old and now invalid work email addresses to my personal one.

Signed-off-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20230929140326.2056658-2-luc@lmichel.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .mailmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.mailmap b/.mailmap
index d214959288..94f19a0ac9 100644
--- a/.mailmap
+++ b/.mailmap
@@ -81,6 +81,9 @@ Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <quic_llindhol@quicinc.com> <leif.lindholm@linaro.org>
 Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
+Luc Michel <luc@lmichel.fr> <luc.michel@git.antfield.fr>
+Luc Michel <luc@lmichel.fr> <luc.michel@greensocs.com>
+Luc Michel <luc@lmichel.fr> <lmichel@kalray.eu>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
 Paul Brook <paul@nowt.org> <paul@codesourcery.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
-- 
2.41.0

