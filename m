Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp562399njc;
        Mon, 24 Jun 2024 18:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5d/PLiG0zCnfdA9/6HzchIcuw4NVRcdZX9xvJru3rqtmvZfpuYSeaOWzVji8tmXxUhDY1yo2a0tJsz5bjHaMmm+mveuEH
X-Google-Smtp-Source: AGHT+IHXytddg1z2CKW+r7pPp0Ej5CszH5tdZEuN9AbSim3yom0eYyf3IRrG6ebH/14rjlazDakH
X-Received: by 2002:a05:620a:1790:b0:795:81ae:e0fe with SMTP id af79cd13be357-79be6f23a78mr846043385a.48.1719280299948;
        Mon, 24 Jun 2024 18:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719280299; cv=none;
        d=google.com; s=arc-20160816;
        b=TDLszI6KIgq5doj23fNtDOFTn71i1nZMWBABZCn1l8Xi/4hCPiFMmtxrTprlvGP3y/
         e8Qd6a12BAqAkMuP9Q07hWlEXl0atRr1qjI8Gqy9Zj+nNYMmPrHDxELpk2VTvNCAOF/Q
         tBg40HbaOicnUVMH0+C2MjeusvTCNFSSwC2yURUBa8SA8omCnEwob5pvkLMZG+dRUv7b
         owREKY71u95yRtjCK9aYo3PH/VlG/IeQX8mN8QvIj5qiLCq1bJ+xKng4DzpOE995D05d
         HUEwURGreHwJW1tP3ukVmPMzvtth7tI9yCGfUl33Px3+V9RX2Oh3qTYXQU69D/BwzgQT
         4EiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=jWlKI+d9U26D62QZ5TIa0eNgsTnXHbjmgSmNagYvY+M=;
        fh=N2H2zGIwg6wxsGvJSdLbUlk7tQI0CzOF+cEb8Z5scRc=;
        b=MJljQbwgQmn/PIBcmnjNxNmuYqajTdf6+OqJozN0PH5pNKMa2rKznJ4kyIotvuBcll
         Aav7celuudYet52tgpKEh+Gs1GeGyani4WFzzLiUputIe6UQ+joIOmSWAw77/wRA77Os
         Ulqu4f6JTNoSa110zWjzpsnICd8fr3Y+oajjg5mZCipTyZxURmhGiW6ad+lftFLVkDXh
         QAk02IAlrMfxjThwjl4MfamA+FnKUd+zD8zb24c+wSQ+s2HIxJyN3o4XqqkHOFclo4hl
         nWSxVWE3bUH/6Q7w2LYR0JEj0I7tFLivaeIV9l1VRWrVUbZRlOxFlpcqBhBDV0lqDQN2
         2NIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce882aa8si984807585a.20.2024.06.24.18.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 18:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLvKV-0001oR-Gr; Mon, 24 Jun 2024 21:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sLvKS-0001mz-Rx; Mon, 24 Jun 2024 21:50:41 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sLvKQ-000106-Ap; Mon, 24 Jun 2024 21:50:40 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 25 Jun
 2024 09:50:28 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 Jun
 2024 09:50:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Jun 2024 09:50:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 0/2] Fix coverity issues for AST2700
Date: Tue, 25 Jun 2024 09:50:26 +0800
Message-ID: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +KjgkipFnmJZ

change from v1:
aspeed/soc: coverity defect: DIVIDE_BY_ZERO
aspeed/sdmc: coverity defect: Control flow issues (DEADCODE)

change from v2:
add more commit log from reviewer, Cédric.

Jamin Lin (2):
  aspeed/soc: Fix possible divide by zero
  aspeed/sdmc: Remove extra R_MAIN_STATUS case

 hw/arm/aspeed_ast27x0.c | 6 ++++++
 hw/misc/aspeed_sdmc.c   | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1

