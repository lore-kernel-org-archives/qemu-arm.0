Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp396839njj;
        Thu, 1 May 2025 11:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNIok2LwEJroqc/iClMr0n5sXYtT7qR+0pj0pZ48duaNuO8aBCF0CMEooCRLjx0hiCP3af8851+wf9Eg==@linaro.org
X-Google-Smtp-Source: AGHT+IEIG+wfjMmDg9Z2AK3ICfg6CTU4qlcx2Dafqfa2unWOKuFb+WRSej8psmhpI9RNQfIg0irV
X-Received: by 2002:ac8:5dcd:0:b0:48b:2edc:99fa with SMTP id d75a77b69052e-48b2edc9a91mr49598791cf.2.1746124560860;
        Thu, 01 May 2025 11:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746124560; cv=none;
        d=google.com; s=arc-20240605;
        b=Ie9n6CzLecyyjC++DrGUDQmR1Hjb23q0kqZlY92BmMVd4mvkv4Tug60boNOROeryqP
         QRKj/F+F9ByZvgMecdwAXXiXq2zBkzqMzeEmABi8aXYaMNk9d6DZohuZXQl9Li8tUSlD
         Z3A3njNW+uzgjDZtKUgWZdiWpYLKJEHJM1UW2pGD+EErkXq4c75TomSSrH6vg65k06aZ
         Z8/OzzDkOhEGFzNM+C1irQQet384sa3IT0Z4gfTr6+hXwvkC96shSjIqVutLpqQp/thm
         AmaoEQZUK+aYgr2dDfN6ZOY9TLWzMRVb9JdrOuY9UJ2Ui0e0/9eAesnFMPe2u3VPJi2m
         y9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y9SBlCSkCVD4bmzSTB80UsQ0zXpNYjxPRjiJK/2PHJs=;
        fh=Y5viIPeezhtztxX3lrtOVourHqLRHzaT1tRl7XXW7qs=;
        b=NygLcpLebohw7IAamQmk9L1gtw3BBTBPAOtCL4VmL56l5lcpRPSFhWJkzdbBegPsJl
         MYkZleG+3y7KBHT5Gy23RSiIReS/RiCeCfV0LWCNBlgYkaGMjgnxl9XGQ1hBMJd6Kown
         fdi9CmFoxHJggiOfI31BkFJgGBkWkaRn/5kEt2oSP7OhZnhIbe3YBAjA6LiqIQqDlvjZ
         kj8AwVj8luYBcJ9HIlBf/puaDF6nqlNSyd4PkD6acMLOq19lRfLazTMqDdSHUWBVKl+w
         Q4yLT0UmPuSyXO4HMux/CWaWVIvS/Ypl6ZocAJ+sYSFC+aAAzHgWbfq0wk1/axgLiDsU
         8+bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=aTjnnqW0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b960cdb1esi11155601cf.113.2025.05.01.11.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 11:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=aTjnnqW0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uAYkQ-0004ux-Cl; Thu, 01 May 2025 14:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uAYkO-0004u2-Ib; Thu, 01 May 2025 14:35:00 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uAYkM-0007Vk-Rn; Thu, 01 May 2025 14:35:00 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso1869087a12.1; 
 Thu, 01 May 2025 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746124496; x=1746729296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9SBlCSkCVD4bmzSTB80UsQ0zXpNYjxPRjiJK/2PHJs=;
 b=aTjnnqW0LfaxeK626i5CkzrLm9VOSyBBC4qF+kAk5G1gonewNXEvqPR1Yfa3DLiJD1
 ZtP3HAXBxV3Po2mJI04dZx6csfkdFt5+MZqtDS3yYSN4EAnv90r0u38UOPC3SyTvaxN7
 81f9iOBWE7vg6q9dPfzeIqZ/K91qdRbNUtqeJJfA4CmkjKg0HNuD02bNYvnI+k95bCw3
 F/+DuwCPEPo+nBIWzB6K9bJG3fgZ703uUhBBA+2xe7UCJLrbz+JbM2E7v5h93f1WitKi
 0QAQUKmuzO7PfqRfKDS1SA/LgF7a+5HcXOCi+iNUFSs9akvEjUmSVr2Vo9oDEzfI+H8L
 7vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746124496; x=1746729296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9SBlCSkCVD4bmzSTB80UsQ0zXpNYjxPRjiJK/2PHJs=;
 b=bgx4e3g1snaBhQUuoXDfDCpaitpaihm3CEdfpvLieR/r1TywlSSsSN3gAVToiSDHte
 SJMWyCwR7ydFnMn48ZYeFnelObOCQN9xlavAlYeVqmsHMjv0AfPSjHTNyvV3CgSxvDPY
 1LNhuaYhKpP/SkyXg8T2SyHGPYVtQXaQx+dbXhQKylKLjwycIQQnK56KQapZd1pH+RmQ
 geE0a96e0xilw+HeEqrHW2Sq8QqROkg33wUQQ/VwkmQIpDiVXkQ/bqjvejXU5d2Ittld
 yFE/14FV97HmbO7jwRWu2tcqk1CQ6atqQOPPE2nZCstpIyGYnix59Q8FFxA/krgIvG76
 SI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKHV26l5pbPWzxc0vuA/eLJgL2WA6ACkXoJ0DA/uEYZNcV7J8cLxWkHiTwKAuWyffAi+FRGsdZ7w==@nongnu.org
X-Gm-Message-State: AOJu0Yxv+FIejs5rdJl2fvRSP2Syo5SKTpv4ORF/EtOtDO/pyQV8GERE
 qFde9vfHHgDDD0wHuM9yjiBYbizaCuuZXbIExBY2e2RhOp1E/OJdd7t6Jw==
X-Gm-Gg: ASbGnctTlmoSd+3jjCBU4h3iFJZBeA/y3pYHbdrqE1zjgymoCLHDfVZVpKKrXqjQV4y
 ojD1/IRxaOvSUJVRzv0woRa2hlgleAR2qkSFxqGa569vGyy2etBlIW3LO7fcHupDJZZR+3to15B
 VtjfxpoVXHmxLTR23LawP5HV59sZPJB/ClCMkkksZzPPczNaFq8J3WeLzxHkFnADnfrBmvFd9lJ
 QDwvqaWYc+M6K5lAQdkDH0tqvanNDoF/n7XuqMcKhfJhY5qVYLcAbCxbIm8dU/CoqIDCGqkUWcD
 gQZCPGeNQXBS79ZSxCjB1TtiUfvIX8SF9U6gIT5RQ01ea9VuxnnnCKXB0HdbV1CuE/JMwGLwdoA
 nLeNwP/lvjIGv1mJ8ajQ3qIDHxN8VRuZ6JzV/W2u0cgnx9tfkkvzqFTtgEYh++A==
X-Received: by 2002:a05:6402:84d:b0:5f4:5dfa:995f with SMTP id
 4fb4d7f45d1cf-5f89ae6c439mr6525224a12.13.1746124495133; 
 Thu, 01 May 2025 11:34:55 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-2980-eb00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2980:eb00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f93000b272sm751709a12.68.2025.05.01.11.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 11:34:54 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/3] i.MX fixes
Date: Thu,  1 May 2025 20:34:42 +0200
Message-ID: <20250501183445.2389-1-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: oCzS+fX6Zv0J

This series contains two bug fixes related to i.MX SoCs, plus one cosmetic=
=0D
change. The first fix adresses a bug in the Designware PCIe bridge that jus=
t=0D
got introduced in the 10.1 development cycle, the other one fixes a bug in =
the=0D
i.MX GPIO controller which existed since its introduction.=0D
=0D
Bernhard Beschow (3):=0D
  hw/pci-host/designware: Remove unused include=0D
  hw/pci-host/designware: Fix viewport configuration=0D
  hw/gpio/imx_gpio: Fix interpretation of GDIR polarity=0D
=0D
 hw/gpio/imx_gpio.c       | 2 +-=0D
 hw/pci-host/designware.c | 5 ++---=0D
 2 files changed, 3 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.49.0=0D
=0D
