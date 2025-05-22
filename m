Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1602635njc;
        Wed, 21 May 2025 20:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrTgEo/knHI+oZx9pL0YD1ol4MQiNGmrY7IfgGwSM/KG7JM1Irrcx+gDAUE35MfJKi/w/rYA57ekWTlg==@linaro.org
X-Google-Smtp-Source: AGHT+IFOdXZy/Ws4RKsEppsyLfp+/OJz4hW3dh2QsiNxCMrbJESsKqErFKp5H8qwIEYq6RCvva5T
X-Received: by 2002:a05:6e02:5e89:b0:3dc:7660:9ed9 with SMTP id e9e14a558f8ab-3dc7660a182mr83493745ab.0.1747885014197;
        Wed, 21 May 2025 20:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747885014; cv=none;
        d=google.com; s=arc-20240605;
        b=L/GPq+h3F+DOpMjL3HnJoZ68cYqnHqBievmzCkegvOdjGkvA0BPcQVzmu2dw+uPWO4
         YG/T5X/ecLbsmt0q3gw0FlXTJHPwLWQcX4Q2jeIG1KVGUkQzllbErr6cla5Rtkoc35+z
         FknqQ9ZG08nMndynaCXZLeOjFHZbZQfl7zcc96vPgbVHIaMDEzAeTWxvbUJ7hMaIUxZG
         skDe8yKBComu4kojzuVYnqGLGF5gQz64G5xlcIbZ1ySGpjCHTdj2zAq+D8NVvKROAj12
         KQpct+ZU5gaoxYIsXc/C+dC8NGSjhA0TayA/k/vQ9hpdsVH1bPcxG7Zg0HYJydo9w+tR
         mGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=Z/W6KnEe4mhrFH8dilt+kISkavHjfhv6fSBL3wNnHhY=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=iQG6ThpM5452UL+jNMWv3E3NR/NivC2HWSrx7/cwe4p2Rf7Hz9zW4+xUhuIb0LyQxV
         dK2+im98SPkvJvyrY3GJFN9aYmt4irubTiJga2/voWob9ku8wGE4jZ999OLv2/q+JIX4
         dyDvClumCRwUfZhWkiX0ON6kz5B1P4/b/AngkSbpq20rZaFW3FirnbnC8pknyskE1dnd
         SbxRqGnvzC7nq0PVeGT5sujmcTsYW2m9wHgYvRmNJitfuzBiNjCu4BK5K9I/y0mV4OhK
         Vu0URmQmdvbOH0zT+JAJ7GkfCkBLXo/mgTAvmtZElOGb8/1NdpFmTsuFYnvxAZio8R10
         sWVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3db8445b55csi100292845ab.160.2025.05.21.20.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 20:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHwja-0005jU-U4; Wed, 21 May 2025 23:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjZ-0005jF-Oy; Wed, 21 May 2025 23:36:41 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uHwjX-00047S-BG; Wed, 21 May 2025 23:36:41 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 11:36:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 11:36:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v3 0/5] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
Date: Thu, 22 May 2025 11:36:22 +0800
Message-ID: <20250522033628.3752086-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N4xrFrVJYuav

Clang's sanitizer reports a runtime error when booting with
'-net nic -net user', due to a null pointer being passed
to memory_region_find(), which subsequently triggers a crash in
flatview_lookup().

Root cause:
- Missing NIC configuration in the CA35 initialization.

Fix:
- Reduce ca35 ram size from 2GiB to 1GiB to align with ast2700a1-evb,
  where the ram-container is defined as 1GiB in its class.
- Add nic configuration in ast2700fc's ca35 init function.


v2:
- Split the CA35 memory mapping into a separate patch.
- Added a new patch to fix BMC memory mapping in the fby35 machine,
  which had a similar issue (unmapped system_memory).
- Removed Change-Id tag from commit messages

v3:
- Fixed issue with incorrectly inheriting TYPE_ASPEED_MACHINE.
- Rewrote the commit message for "Map BMC memory into system memory".
- Added more details to the commit message for "Fix unimplemented region
  overlap with VBootROM".

Steven Lee (5):
  hw/arm/aspeed_ast2700-fc: Fix null pointer dereference in ca35 init
  hw/arm/aspeed_ast27x0: Fix unimplemented region overlap with vbootrom
  hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system memory
  hw/arm/fby35: Map BMC memory into system memory
  docs: Remove ast2700fc from Aspeed family boards

 docs/system/arm/aspeed.rst |  2 +-
 hw/arm/aspeed_ast27x0-fc.c | 10 +++++++++-
 hw/arm/aspeed_ast27x0.c    |  4 ++--
 hw/arm/fby35.c             |  1 +
 4 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0

