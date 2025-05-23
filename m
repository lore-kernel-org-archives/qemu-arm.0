Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2413703njc;
        Fri, 23 May 2025 02:32:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcxxZ/iLV5gEl8XMM5Jnq0BSpHh4/LyrD5GwMKeBUka+Vuhlaj9KKYo3dxtACTA2tRj773WUzb+nTw3w==@linaro.org
X-Google-Smtp-Source: AGHT+IE5jJGZWRizWVW20OHAc4G0jh7hBkfpw/OSv8sOeJvL0gOmyQQF8l6ciGpCn4MZJ6Cotp8d
X-Received: by 2002:a05:620a:f05:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7cd47fda616mr4083565685a.57.1747992733505;
        Fri, 23 May 2025 02:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747992733; cv=none;
        d=google.com; s=arc-20240605;
        b=P/Di3j6QcEY2e1zc/03zrfd/cgn9dUIavOSSDXuzvC1SdlIa6TGHUC2aBQiylJFM/q
         60SN4hcOJG8/WOrB1j0us8g/ozsOWFc0zlPO3ezRRUxTPMS/0ES9Z3D7KMXisf040vZb
         y9CMoqjFb/PtQQLEHox4pos2+pf5PXyEY96nzM+x0vfZhksFliS072ou34ErrNvxh3Uh
         eIwi3Z/B7Pn3x3ur9mlBL17LyukeQiX4xQ1vKfUU7J+LQRb8UPhSTNQTxRaMIW03ysb1
         ziOtyMrPD/LT2mG4SjqB+7FUT6y2fKWqxIA68Ok/9kyeS3BVrPMDioK45riMOpba5ODz
         qMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=rxXNps4CfbgFGYx+uBq3rAGl2BxF6IxdMKKeeEaY+uw=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=Nbi19TL7goACkZKAS+iMz1qHIY0SEUGSQM8mnxUI1AKKhYZ+fB5fRaP+1SI2WdBgGT
         X7cR3Aa6lpW+7AbAS60SI4NZtjebWRuZL1GVKSEvLppSZnJiG/4iH4sqLehPFGh/LpYJ
         Fp/BZCcf/1mpFcZLnM12cYiul9TonYDabGyhHT/XaD+1pgeT4TSdv+wzPHFeAvqWsnL0
         z48uhos3ujfswbEVyTs8P9O4E3DCEDBOZk7+SYmYtfCaJSVvPQrCoJ0LB/mwar1gEgzx
         A1x48WWA98/EGfm9tC6+OUDLSxy/gjPQRg3vSPUHDezV+9UWkQQq2DspJ+tTjOw2DT8N
         pdwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cedfd7d766si248858685a.16.2025.05.23.02.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 02:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uIOku-0005Cy-Kk; Fri, 23 May 2025 05:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOks-0005Cf-QF; Fri, 23 May 2025 05:31:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uIOkq-0005Md-Du; Fri, 23 May 2025 05:31:54 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 May
 2025 17:31:44 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 May 2025 17:31:44 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v5 0/6] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
Date: Fri, 23 May 2025 17:31:37 +0800
Message-ID: <20250523093144.991408-1-steven_lee@aspeedtech.com>
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
X-TUID: tsOtUX66xZwd

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

v4:
- Split the first patch "Fix null pointer dereference" into two patches.
- Remove the patch "hw/arm/aspeed_ast27x0: Fix unimplemented
  region overlap with vbootrom".

v5:
- Rewrote the commit message for the first patch to:
    "hw/arm/aspeed_ast2700-fc: Add network support".

Steven Lee (6):
  hw/arm/aspeed_ast2700-fc: Add network support
  hw/arm/aspeed_ast2700-fc: Reduce ca35 ram size to align with ast2700a1
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

