Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp193048lfk;
        Thu, 21 Apr 2022 22:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxco0qRfeaH4lI7REcBE7gfbB2iEPl56cKekHnkoMcXmFDRzFfRevPukDdZd2e7QF6UbiGQ
X-Received: by 2002:a37:6711:0:b0:69e:6ca8:a321 with SMTP id b17-20020a376711000000b0069e6ca8a321mr1634893qkc.88.1650604854961;
        Thu, 21 Apr 2022 22:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650604854; cv=none;
        d=google.com; s=arc-20160816;
        b=iXgtYN9tmeAzjxd788fWbCbQuMky7Dvmo6BCRqAeSPDx7SvnhHFxwNuTijlt9VoNYO
         HxKji12aqjyFCpg93ZSg9PjNWJyx9LxJLfwv43t7UR5t+0J5ldwElNDayfnF2gA0FYYP
         lQdoUsTTW+zFaqHRULv9Qeze9aT9Bern+ObfNzMt8L+IWEuzSthaEmCkyGDW65d1UOKB
         H8jcYE4viyUsCXQb0y3lteIX4v9osNsXSvCYCT6/seyYvFS1C0hbx89i6fR/5YO98uYl
         mBuujJn0vycyWwUtRFpoQxWHDOfPXUgvntRuLtjIt3tSvdYsrOLeIsWj50W9WIRlacdi
         dQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=59sI+GazBXlZ/e0fPtD3zKTfWVckgfPrT6OuhtI+PHY=;
        b=L3D2+5aLR9sefBjkMvdUaFUcjtKLuFNDjcs8dkUXOWL+JJJanvFsYMh5Tgkx5t1gGx
         mWSH+lg0T6T0uEkg9BCL8Vo0vLZInpBV3+jxggYqwVZpkYqYFBjS23wOCjOD780gCv1r
         f82zz0Hr654J4biYQ+2txwraP+ZDl8J5HioV8VzXYPKceopvsflen/elSu7y1beNQrj7
         gCTDLrXJmtP5oYqTcKZQuWu8nAmMS0tg9KVvjtkqVjX7eh6os+92Xl09oFTN/shlklGX
         FAwbuGFDYiQmztzJ0GyrVpSWnPKerS7B5tla9ts5snBUN5FjtiLYWRSFLs04XgUFCFbk
         JuXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l62-20020a37a241000000b00699cdb9bc0esi1855787qke.121.2022.04.21.22.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 22:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhliw-0003CH-Eo
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 01:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nhli9-0002Kt-Ni; Fri, 22 Apr 2022 01:20:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:12868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nhli7-0002ZF-4p; Fri, 22 Apr 2022 01:20:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23M56xaP058495;
 Fri, 22 Apr 2022 13:06:59 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 Apr
 2022 13:19:10 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v5 0/3] aspeed/hace: Support AST2600 HACE
Date: Fri, 22 Apr 2022 13:19:06 +0800
Message-ID: <20220422051909.27540-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23M56xaP058495
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PKOaiIhuaTws

This patch series implements ast2600 hace engine with accumulative mode
and unit test against to it.

Verified with following models
- AST2600 with OpenBmc VERSION_ID=2.12.0-dev-660-g4c7b3e692-dirty
  - check hash verification in uboot and check whether qemu crashed
    during openbmc web gui login.
- AST1030 with ASPEED zephyr SDK v1.04
  - run `hash sha256` command in zephyr shell to verify aspeed hace.

Please help to review.

Thanks,
Steven

Changes in v5:
- Move iov cache related variables into AspeedHACEState.
- Update vmstate and reset_handler for new added attributes in
  AspeedHACEState.

Steven Lee (3):
  aspeed/hace: Support HMAC Key Buffer register.
  aspeed/hace: Support AST2600 HACE
  tests/qtest: Add test for Aspeed HACE accumulative mode

 hw/misc/aspeed_hace.c          | 139 +++++++++++++++++++++++++++++--
 include/hw/misc/aspeed_hace.h  |   5 ++
 tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+), 5 deletions(-)

-- 
2.17.1

