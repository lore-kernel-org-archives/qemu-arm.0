Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1721884njc;
        Thu, 22 May 2025 02:17:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9ptdWG/+OIj5h0eFzKN627CaecLTX2tzyZyHWf5cBsk0TMtJW5QA8lrobRTm0vqiY3Qneh9m/R2XW1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHsA66x7NcHO6DSIZ8uJkdb+pXskj7h2l+io5bjydWJFO7M0T0Uo3DVwisJJSCCP0SySApC
X-Received: by 2002:a05:622a:909:b0:48a:c90f:ce6f with SMTP id d75a77b69052e-494ae350c28mr438169981cf.4.1747905451140;
        Thu, 22 May 2025 02:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905451; cv=none;
        d=google.com; s=arc-20240605;
        b=FvDQ/x6Zc81Ml0mZtIy85eYd6sQ6NFQbAxL7lEzpzv8GFlZ4YpPR7tzZYGnU2pyYk/
         5RF+t/qU3sCRXapCP63qeOyXnS84jLNzPPvLaSrBpaOuuGQpiUHBzJqgjerGKZw/lVHS
         i0y1UxwjPm83T4cLPCQllOMbqQvNLQkCZ6+b2g1W8QpZXSuPuKoVLCpvebqrKtayn2d1
         /pDfztaiOMUIDl3n2MDZdbTH9P3/uYaPASsV3NyKWzQK4nJwjazYlp0CpYmVEs/LtM4I
         IGJtbV2KtzwMABqx9Z4Yk2LSekXWRqZ6WiD6sg85+njTsYggYIYDueaodzpIqRwfWvKk
         oMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=QBlOxKmH+mRAtOGELlx2ZtBnhuFFQ8WHSSPeTypbPVU=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=Dv1n7hSVSCE0n3JuGoYibTUSbfcwjW/ktq624D3q2Vfz107TGXYI/QMz+7mr4vEWOr
         6Cp6tUs/v6yQ0k69uneTtdauj0bq2NBUiCprCPeHVTJDvGM9ve7FJ3SxqEuVzYRusZ6Y
         EseM2WMJ+8TdjgxmN23sldF7aBH6Wsi9xvW/puZf40em/M4tvSQNEhpg1LuWTJmwbPuY
         taZ8a1QGO1UyS9BVQdRkQotEFuWGUncKd4o74KRTKj6yIW99QivSoXeknXyezG4D1IJA
         Ll3e95jqE+ai7UXSTgGM4b1khB1ZRVxcYUhf41G98zFdkaUgtPUsWtsNtPP9Ia1PxqRn
         BuXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09c3854si148175056d6.409.2025.05.22.02.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uI238-0006Zg-41; Thu, 22 May 2025 05:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI235-0006YS-3U; Thu, 22 May 2025 05:17:11 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI232-0003Jw-G8; Thu, 22 May 2025 05:17:10 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:01 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v4 0/6] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
Date: Thu, 22 May 2025 17:16:54 +0800
Message-ID: <20250522091701.354185-1-steven_lee@aspeedtech.com>
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
X-TUID: hEEGq4v3p0Dc

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

Steven Lee (6):
  hw/arm/aspeed_ast2700-fc: Fix null pointer dereference in ca35 init
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

