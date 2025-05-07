Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3695210njj;
        Wed, 7 May 2025 03:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj6s7hUJTdGfeCj12tS89GZgM5JYxGRYFtRUqCAZPyxchAv1pjnzLddPl+B3vZqU+tZQFRrbZQZLrxuw==@linaro.org
X-Google-Smtp-Source: AGHT+IHIY7QRtr56Kbg26F7+hMJ1wWo3iuR7VKtKsOLbMTychrGZqvXcUcXZvyY9OG5KO+t+fbaD
X-Received: by 2002:a05:620a:44d4:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7caf7387d0dmr405071185a.23.1746612629599;
        Wed, 07 May 2025 03:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746612629; cv=none;
        d=google.com; s=arc-20240605;
        b=dNyTi+3RZrqKowsK5TdcObvIVDJTD7qLzIWmWaTDVfS6Q/DRwNvPbeHkyUzTO+ZWmf
         kQewri4xuRpp3ZvLSm/p5l95bMRcCVYl46jHL3McI7UuNWtT0r52v3XWGcSOcZDMzhP1
         DnMg17dai99AtOMw6Ooyw2hp+EbDYgdX6dK77OTapeyZoimR6eC10JmR09SrnNL0oz54
         WCgxh/VWO4hkhGgL8oVOBzZpnOM9i2d4oNmQI/FDcH8FQc3T/2UW2iKYoBLRgC8Mm3cf
         nEvwOHkP3gxSkD1pMFvyL5ew3lA4F5VLz/3Wc8OM6FXGDRwvPgUZLysPF6aHcRcHH02o
         VlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=kN8kUf8yR/+M902hFP2siJPo8DKRxUF3QT1c9Xx7Sjc=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=XzV6f0GkYoz+i/v6vVQutuRVNZjMpdqkvHAnaUHDXrP19JZsCexZMnrwLW6iHV8sKn
         ggT5BgypMQA/QWoSU9m7LeJ5qnTrmKwQqOFG02n4FWvth/GsTKivvPFfQsygEo5wbLW2
         dMXV0kdg4f8NAQVqEY+sJDGVNVCHWnmgwQ0gccuH3vrufMMqfc8T5o3Eehk9C0Irb6xT
         YS0f3BZsqyDDYOs7NhLt2zkNVnjoGlMKCRGDi3lD4cnhVpigCRJvqquKtJ2NGkNIrF2x
         vTWKRPyiAxLBc6XqJozicBW5BrCe/YfmO55WsQdZIVUwfMdR0l6M11ptY9lvAgiUXyT8
         zSyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf7594ddbsi166535885a.283.2025.05.07.03.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 03:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCbjF-0005YD-H5; Wed, 07 May 2025 06:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjD-0005Sl-5A; Wed, 07 May 2025 06:10:15 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjA-0004CR-HS; Wed, 07 May 2025 06:10:14 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 May
 2025 18:10:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 May 2025 18:10:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 0/3] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
Date: Wed, 7 May 2025 18:10:02 +0800
Message-ID: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: WIZQiu7gbWrl

Clang's sanitizer reports a runtime error when booting with
'-net nic -net user', due to a null pointer being passed
to memory_region_find(), which subsequently triggers a crash in
flatview_lookup().

The root cause is that CA35 memory region is not mapped to system
memory. In addition, unconfigured NICs (due to missing peers)
lead to a cascade of warnings and possibly misbehavior.

Fix by:
- Reduce ca35 ram size to 1GiB to match the ast2700a1-evb.
- Map ca35_memory into system memory
- Add nic configuration in ast2700fc's ca35 init function.

Steven Lee (3):
  hw/arm/aspeed_ast2700-fc: Fix null pointer dereference in ca35 init
  hw/arm/aspeed_ast27x0: Fix unimplemented region overlap with vbootrom
  docs: Remove ast2700fc from Aspeed family boards

 docs/system/arm/aspeed.rst |  2 +-
 hw/arm/aspeed_ast27x0-fc.c | 16 ++++++++++++++--
 hw/arm/aspeed_ast27x0.c    |  4 ++--
 3 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.34.1

