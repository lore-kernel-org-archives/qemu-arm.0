Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4083203njn;
        Thu, 16 Jan 2025 15:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXb+4qZj53204w4Y/IQL2qpxGKDrYJzWof+kvwFnKHMh72+vODlnoWQqkjIWoqdA1KqFB34lm3nTQk7Cw==@linaro.org
X-Google-Smtp-Source: AGHT+IGwKoOMKj1IgxAz+mp+Rcc2J2aECi4gmRh5aAgjTWcV1oCu4KBHQHkx35oeZGUSf5LA8AKw
X-Received: by 2002:a05:6102:418e:b0:4b2:4877:30bd with SMTP id ada2fe7eead31-4b690bfba7cmr336282137.12.1737068698755;
        Thu, 16 Jan 2025 15:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737068698; cv=none;
        d=google.com; s=arc-20240605;
        b=kAnvW6FUNj74R3FDcZtIxsErDu9Bann95wwi8doMEZW7/9uvU5OcQdOMGZZtjhyLZx
         wjFvUuQtePFltwO3ZDJqJff8MDOdV71NZQDZh4WsxTGfY77/He0Cr+CP+tSmnvimRyHU
         sYrv41254a9QlmFjVQpdT3OSAYfylGg2706uVmIamhyC+p/cHi3zjbBa09hY25qdx0KG
         8vVqiISOjsGOUt/ASBN4klUH6p9pJcg657omEnOXm+g/yT2UKKPx4zdTMQ765ouVZJib
         7A7R/8n7fIk40eujJIOfOkSVRbmE323b8G28x+/5ykKX4Q0KToKWgAbD7cJvoFzG6k7y
         pX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=L/Xc2XaAlWpyN5NpG603Hh+ExSXBxGrhRynU37t6mFU=;
        fh=yFgcmjB8yXEbKihIgvl6L/ShgzuauC3QER9vY0eS4WU=;
        b=WM4g9cKsDprcJlgwUJAeudVEmekx+Ih5htYyJydPYLjrPHj586mKMQie/l7eVvpHqm
         JVzmlTtcNNoQmEbY2hoQKBn0OP53IFGh43iJEHpbMj9zEslx63LKRdOrWWAWuiNvjCCO
         CtHtCNwBo/bUJ4ug/NRAv82r6mR0izM8H16NjBQzZse8P0BZx4JAbGRMOibEcWncC7Z2
         ZNj8mVnmABfYNaCmqUCktKb+FSs1nzM5F9VJLjkmwUNfOhB1T2wCBMo2jnAgYzBXJIqd
         NgvbPt9znwbxVRL9z131kMo8o+gM7om0D+xyKHfjWrKYdLz04/77wm720PhzNqkpjJ7f
         7kcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkLSrPW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8642cc9645dsi633272241.113.2025.01.16.15.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 15:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkLSrPW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYYuq-0005um-If; Thu, 16 Jan 2025 18:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYYuo-0005uN-9d
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 18:04:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYYum-0004xH-MI
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 18:04:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso1202114f8f.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 15:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737068679; x=1737673479; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/Xc2XaAlWpyN5NpG603Hh+ExSXBxGrhRynU37t6mFU=;
 b=gkLSrPW4Sa/TCnlnNJ3g/5pxMcqBE8rfXCABf33WK5OQLeEITzAtbsKTdXfFObSlJa
 xz0QSZwnYQ7mHZkHSe2M2m571o/UpYn4jTgWlA849N1LNX1yIxVIs7Tr7ex1+9RU5rQV
 pDx6lXaV5cJP/lnK4ByuZrC8/8QiVjgk9iZxCzDR7BA6ZocnryHvDZPEablJIrjSRaAL
 SYoNSz0OTKRiwbZvvNHMAvnqkS6CpdloBSH+k9HByDx3Uo6sArFA/ZxuD9y4E3hYhM8L
 p21J9JcUI7vjt/v4cZcYKTD5Rk+W3qMitSrw6wCvxxz3quTeAyvYUME/QZXcrx+a6PCH
 y/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737068679; x=1737673479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/Xc2XaAlWpyN5NpG603Hh+ExSXBxGrhRynU37t6mFU=;
 b=r6Buerb9Jf1YZrT079ZZveDCL8dnotGFUiU8o8yj+2oTqTROooldRJurGp8hjTQl+O
 Y5Oz4EWYnGUiET7KQ26ZuNm3XkRF6J9DWyDhjNBd2IeBVD+utTVgcGy3dApYnwDcCEJ6
 sWUXjYd3wQzMMha7Lo7O0d3vvADYA3iTeYQJquCQ8cRxqF81aFOXtxn/s4H8KQTLOlnw
 q1Mtqepc1lgfmhJJxISEJAm6hod3sZAYY9zPmYBuVYDG0NLJAFVkVGYm3l8YTeGErKgA
 c5c0JW8gKTb33DE3Fc9kigAgr45alGq5xKKSW7GDJxhxjpjiOGOah1hPTYZL9ZV08zLt
 Hlvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzuUxCj+ZjzXQqcEC075B6YACVIfe4vurreYkB6ziHs6IQvNBalh8XBwVms32YPX9X7cQ4WpIq0g==@nongnu.org
X-Gm-Message-State: AOJu0Yzg4oiOOqBaqPbsIpU9SGCGV4TpRRsdA/d8uLLyM8EM5/aB7wP2
 Vn6SsG5+EK97UmD5dpYTOeJmnfOVJw49XnaGs51faQSt0KqjCzIHRoCU8Io8YE8=
X-Gm-Gg: ASbGncs5dwbTRETBha/JfMELPGKdQ66enAi3zcYjHNrsVCD1kf8E2SVmS83mD7epq6J
 wyxUcGXOTPaZ/P2DCnq6h/iMZBa3fhMmDryTmoiyZJKJmD+dTejHV1Q9EvPCXfE/KE1GDod5Hqw
 TZWPVuAB4QvgfreVlkfccMbqkvDFztDzDj0hoAn3CwX+i733AguNMv4+U460KA+3GvLZmxbQw9o
 7fFpFeqOZb3B6gFH0NfMMtED3bk2eATwXtQpsGztJhFZlaR18r9CQFXanOjIiC8gcKlw5ZZqLgi
 QDSdsC3Z4aqwXWNotiMW4ht9Bn/zuJM=
X-Received: by 2002:a5d:5f54:0:b0:385:fa33:29ed with SMTP id
 ffacd0b85a97d-38bf57d2cc4mr295816f8f.47.1737068678720; 
 Thu, 16 Jan 2025 15:04:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499bbasm76971975e9.3.2025.01.16.15.04.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 15:04:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 0/2] target/arm: Constify helpers taking CPUARMState arg
Date: Fri, 17 Jan 2025 00:04:33 +0100
Message-ID: <20250116230435.87580-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: b6sT22N/vPD7

Hi,

I'd like to enforce some CpuClass handlers to take a
const CPUState* argument, but before I need to clean
each target. RFC starting with ARM, mostly to get
feedback on const_cpu_env() and const_env_archcpu().

Thanks,

Phil.

Based-on: <20250116214359.67295-1-philmd@linaro.org>
 "softfloat: Constify helpers returning float_status field"

Philippe Mathieu-Daudé (2):
  cpus: Introduce const_cpu_env() and const_env_archcpu()
  target/arm: Constify lot of helpers taking CPUARMState argument

 include/exec/cpu-common.h |  5 +++
 include/hw/core/cpu.h     |  6 ++++
 target/arm/cpu-features.h |  2 +-
 target/arm/cpu.h          | 71 ++++++++++++++++++++-------------------
 target/arm/internals.h    | 10 +++---
 target/arm/helper.c       | 25 +++++++-------
 target/arm/ptw.c          |  2 +-
 target/arm/tcg/m_helper.c |  8 ++---
 target/arm/vfp_helper.c   |  6 ++--
 9 files changed, 74 insertions(+), 61 deletions(-)

-- 
2.47.1

