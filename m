Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2182715njd;
        Mon, 31 Mar 2025 08:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUe/XJz9VjgPkQcyt04PBIE6GqY9XEojlzL7v4yia5ToULMVt7ufCTx1Z+Xm8KreMsJ8bDzmhjoMDRWvA==@linaro.org
X-Google-Smtp-Source: AGHT+IGL6RJWLq1iB+wX2JsAMsnx7ADGCHF8ZHaNP9ZjC49bXHeodPU/TkajzBhr2SBy2rA+OtsZ
X-Received: by 2002:a05:622a:1821:b0:476:9295:d4a3 with SMTP id d75a77b69052e-477ed7f8c5amr146385081cf.35.1743434482873;
        Mon, 31 Mar 2025 08:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743434482; cv=none;
        d=google.com; s=arc-20240605;
        b=T27g+XfCgmd4h/qMdFq+uMZfS8bNGI/AYRdFNqNi8eV4ZUZ2LwZFu3UUE8iF+pBkTE
         xYXmjLvaxz3ZI+hmdk4TETZQHSLn3phf12UErU25gX1H5PC6QViFaDDF6PxCGzPWkIIN
         HMERRlzkzHyc03rtPjOxpd9xef5mtZEWvo1W77tfPrEqF9TivHbt7Lxq+DLI4Co9gKOv
         czN3TQgWefUKgVx4JDSsB7nEz7t3Ezqi5A73Lg92zh5PI0pmNSdF5OJjzmlO8t0UQd+/
         yLCr4SZTgJ8knSLafrj2R5fhsgXL/1Vc3H18foku+cDL2Iuowb98tyzx8BHbBx+DQmNA
         ABjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8fZQ/jWuVgumxwu0tM3Cq9QmlHQyh2uem8M+GBR9J8Y=;
        fh=JSc25SeHlhGFvT/2QfUbizwULxct1w00FdjoM4j4B+Y=;
        b=OmDu2VMwMZDjClD+Q3+dTDprhpg2VRfCVcQ3XDwwnbGqa+5qWkIbY//lgSdbnpziBr
         Z9Fdw59cvXpWO4AM/oaj6VR9jDjhXBErTe7DfK6tgoqtOwJH4SKeCp/+rxssO8AE/zUI
         sAWngBzVYmtZQi1i4bC7C6JlqCL8jh0KEw11FjueIcxtoyFWoE7mhuwL/hrcoxAmknRp
         mtphPgipZCNe9G+OX8d0GouhtqZ2EkootK2DgMnMQpTglrMDO5lEHGEVROwRs5p16JZy
         rItR9rjWhtz9mZBDcb4TqNNB+g9KiDFdlqTDQHrTBZ4cERlxy0pTtuW9boNCp7QPbUeb
         Htog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtwv2Vyh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4778303ca47si67320031cf.223.2025.03.31.08.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 08:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtwv2Vyh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzGwc-0007FH-GS; Mon, 31 Mar 2025 11:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzGwX-0007DE-H2
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 11:20:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzGwQ-0007NM-TO
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 11:20:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so45756065e9.3
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743434443; x=1744039243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8fZQ/jWuVgumxwu0tM3Cq9QmlHQyh2uem8M+GBR9J8Y=;
 b=dtwv2VyhZeCSLplD3Qs4+G+vif0ug49JRPKbhH5yZF1IfEHPC8PzEBFfCCTlrBsmXo
 XLYtOOfLXbTsy0Ft9DD5trDKlcet5PSoU7hokFfuPy4h5m0dSAzCnQM9NM++u7ZAnS5i
 uLuWnX7B83VNw5uhdIYqvmgzUo5G4WP4icJTjPmx0ITIABMZUcpmcUkN/rRl83CUjRy5
 EKXlqSvk8td2b1eSr8vxLH0Gn3X5lDFPw0wkaHRfwj1JEj9Lx5HFia8nbonCV8vTqlzz
 5cNYgxTMj+c5phllKaUF1GyBm9NkOKjWEW8QHURsAqaM4zkOiMCm/zDTbbyzfwaZ/LXe
 zuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743434443; x=1744039243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8fZQ/jWuVgumxwu0tM3Cq9QmlHQyh2uem8M+GBR9J8Y=;
 b=I3FtOBW3KW8Q2Ymw/0lPsC8FlpmYbCAYlFBcyAF7dgWP6sdmPgkwZ3Avuts+l2BlpJ
 fh8e39rXlsbbh7kfzz/xgTE0YF1IvliB3MMCl+LIwkZ37HNwI3MayewRsBkQEkmd4hQ/
 c3HzTHoxUA3Hil6AlwqtKFBL2OvC5G5TjWjcVBQxBOu0j/k8ghqj9YfKodNI+sTgK/ri
 zZnS4BeXvhoRGUmTeufx3NfpfvuwDpQ26bCZIRxfoitptIALf06H1US/H6EtLks0disa
 YNAtpGR4QXNxH5wj01BynmY88EMdVW7QwRRXwccgquMVqwWtHu2d+0D3xNF0vQfvVhnj
 SeNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvtm58ZLnxW0+6LykEe6RJv2dwj9huw9cbEkFmfirqD0F9qNj+UOJASq5q+ESRaHJcLY7tM6D2Yw==@nongnu.org
X-Gm-Message-State: AOJu0Yyqw2Zz08rtnkymNyCCD/c8YNnMVlR9mbX/whLngRM60WCeoVkv
 BqedHqTTJa+tmDsAgYtLd4zvaEpHCKfoEOr8afCRqeEP4+gBcN1dvsL8QS15SeE=
X-Gm-Gg: ASbGnctaQBbMSpANP/TYMfhXUL2JkG3bbrYut1wdr3lgjRWnFM73Rbn0quhGveW5Jzp
 o6vYkEVqC7yCbP8DsQPczQmeRak3bSnErg9svrcmO7jdhoYBtPbxmqAvVMtI6AnqQgw5bAfzvbf
 TIX/gZJZ4fEH3JQRvVH0Ws6rZ0Dl3IumUvUpt+hlgfh0cfSTTBidg/2qTE8S6SkBzaOzlgyy3Fc
 2hWcyUmXtqzXg1bTJWf76IJ3msGyl/YdNRJHJf0tkCf34kUi4cSrOOMYXbZNEEaaP/b/i+EBN0+
 Utgyn4wEM1zqSlD5TxSJUTKKw6whBKoL9m15QFShQDtaOWqhpieUqv55iaDQMULeM23E0tNo3qN
 UMldvHKCpLdksq6PsWWM=
X-Received: by 2002:a5d:5f48:0:b0:391:47d8:de2d with SMTP id
 ffacd0b85a97d-39c120e3585mr7717333f8f.23.1743434443014; 
 Mon, 31 Mar 2025 08:20:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4498sm11816188f8f.99.2025.03.31.08.20.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 08:20:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>, Joey <jeundery@gmail.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 0/2] hw/pci-host/designware: Fix ATU_UPPER_TARGET
 register access
Date: Mon, 31 Mar 2025 17:20:39 +0200
Message-ID: <20250331152041.74533-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 7yhY5ywWEZEV

Trivial fix for issue #2861.

Philippe Mathieu-Daudé (2):
  hw/pci-host/designware: Fix access to ATU_UPPER_TARGET register
  hw/pci-host/designware: Use deposit/extract API

 hw/pci-host/designware.c | 47 ++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

-- 
2.47.1

