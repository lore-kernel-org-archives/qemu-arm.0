Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1520945lfb;
        Fri, 23 Apr 2021 09:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Q5CyykrlsOYzNFSUbfBCJriU8TJlX+3ET66ZxmCNJRQt40zNT8n0RJ2fLhiF+rSVipDT
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr3642202iln.55.1619196933498;
        Fri, 23 Apr 2021 09:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619196933; cv=none;
        d=google.com; s=arc-20160816;
        b=0VNj18IfTKIp6VwmqYkvrkBD88JSJK927Zy084rGGBVPcr4myy8txWnnNPB/fzQXZL
         KtYWbX0JMgfr3CJIYdY+M+NolVdjvIOtmRAlNzg57FJ9ctMbW/50MtDXkf/qTREacBUX
         GTUIfMvsvzVsB6K2B8by/pnLbFONRo9pAbUVrhA15nzYiJ2W4bSsCqeEkDPllP+EZIIa
         dX866AdCFmiWz6AgOxUE+JXkfHgCx2lEu9DN4qDruaVLF53bptuXOlpCDZcbOzSpFgc1
         CGiXCgXx8690bWEFVKK57HCLHzZH2/DpOAnmirK8Aeb1jxrbIP4Uk6tTn7Y/xgZqOUmq
         VzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=f5SUJTiXAOaMhxvZ35kxyh7Ou8LKONAwDzWpzhG6HME=;
        b=DTmCQV1oN+cJQ4vdsii/CAHfWHRWHnC7DCgY94Vug8GB6KdjyQ93eXn9xrezXtU5Z5
         HQVqNdAirrdLTSeB58X9tFqmqGxTvQDd9dYG/0tKVgHXWRnwUfUg1AWRRzcT/jsKmAuF
         2Idy0NJm01SSpcpVKGo/OLpoLK6pVXPqzpe+rHHFdYfSUEQozdTeshpTYUg9RTLAUWrT
         vNb775DJ3HMSTK8oTQbh/OtfiTnF/gVbYPbLfdCLdz7y7x3/ajhq0NdFWqNW+DVUtwZh
         3/IoqXJM9DqI2VvpzXd9TbhKbolYl1o4W49zoPaLXOTno7PENsBWHmkLyEjgmdJWVJjK
         drWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZuYTiSdi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si7023543ilf.15.2021.04.23.09.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 09:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZuYTiSdi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZz5Y-0000Qx-A2
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 12:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4c-0008Pt-Rn
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 12:54:34 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4R-0008Av-Ej
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 12:54:34 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u15so16954050plf.10
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5SUJTiXAOaMhxvZ35kxyh7Ou8LKONAwDzWpzhG6HME=;
 b=ZuYTiSdiXrY3Vt/sSs0KbD2lwok7bT0+swTdFjwSmw1aVsWZ4gJCLRlpjhhkZNt5FQ
 3fEGaHO20YBYjlUBiFJ/oBIVylzfiy9Vn4AIO8Hj7J1y/LjB93KX8eadnD1Ql57ezRWR
 uG0zvK5GHL5iqNv+0uUt1XmlCtKDXeM47AV5jxgRQp7audO8vmHeN+GYsHKvxC/DPbCP
 a+Sg7OKQBa0rJaPGlI3Vb2b0uXGF3UVl6JbfhypsfXLBJ/wMH5+FaZ7KHqU79wdcJ3Ny
 dDMxUhpvdys/4UdvQCPXPYEY6x1Zv6juje1r2DzmQ/JaYnC907uaHPAKZGDapIuubCTa
 bi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5SUJTiXAOaMhxvZ35kxyh7Ou8LKONAwDzWpzhG6HME=;
 b=oh41HpFbSKOdmm9V1u+hsynyKyK2Rm2iWmzhjKdHpDtxdqvWDXr/nMZogK15xjlLMT
 ADS3f0M9ZJBwi6r4FByRzH+E7sQ6MTdmKCyUFQC8q2TxnohLzHpmmoAMwnDwTMOIq2as
 U/G0kwzkMLsFBM+bVfw9tZneIkgdyqttcPzl4pZRiK+eeX9YnHp71BrAqYb69/BoABWW
 h3eFihQAy5lomdpHBqC4UUgcjHUXy27w3ZfSGLYiJM2McEUdLXVXuzWn9zjoGIvhTRyd
 wHx1ytlyN44Hiru8MaOojDHRrVXx8NDlNjTX34g4uk+AY7nS44wMLAg9Fns7IWbLDyw0
 Ts9A==
X-Gm-Message-State: AOAM533I6MqQ7cctHHzecIquSaO4uAiZJo1+CqgN+DFq6zjK9Z06Lo/x
 dxfUHkSdt1JOIrwpXOWA+ZX1oJ1jKDXQ/w==
X-Received: by 2002:a17:903:244:b029:ec:9666:9fc6 with SMTP id
 j4-20020a1709030244b02900ec96669fc6mr4625225plh.63.1619196855076; 
 Fri, 23 Apr 2021 09:54:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user/arm: fpa11 fix and cleanup
Date: Fri, 23 Apr 2021 09:54:09 -0700
Message-Id: <20210423165413.338259-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0monu951lqhm

The bug fix is patch 2, the rest is a bit of tidy-up.


r~

Richard Henderson (4):
  linux-user/arm: Split out emulate_arm_fpa11
  linux-user/arm: Do not emulate fpa11 in thumb mode
  linux-user/arm: Do not fill in si_code for fpa11 exceptions
  linux-user/arm: Simplify accumulating and raising fpa11 exceptions

 linux-user/arm/cpu_loop.c | 125 ++++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 59 deletions(-)

-- 
2.25.1

