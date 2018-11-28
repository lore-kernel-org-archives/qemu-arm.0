Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp808185wrt;
        Wed, 28 Nov 2018 01:35:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W1zH6ONAOGfxwc85E6wrdp8O+PFV5w+tPEPE9CoOenLDGK03DxhXYfcRReT3v7DmJvzJI6
X-Received: by 2002:a25:cd04:: with SMTP id d4-v6mr17116831ybf.189.1543397758468;
        Wed, 28 Nov 2018 01:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543397758; cv=none;
        d=google.com; s=arc-20160816;
        b=AEsKLqFfTMxEiXa8X5wXjb/Ey4U75zoXbHf5el4DJRLYp1vMLOFJR8CSy8ShGo7Xn2
         HfqXEfu+sjFdd8VhGZz6xQdIw7WkNLcH3I4rWEFc6rND2h2g/GEjlUyiAU16C+vdjhq4
         ayLFMXR7J36T55rT/rK1BIXDfl1VDrNOX0k6Xbl1uvW7knPnnJyAXz793wo3ugsyhZ3g
         VlLE4tf8dANBugENtUNdvblNu7KGGEd48DQVvUDAoXAF41AvVj2HfM84oshy6+MzDsJH
         qTtAKrsg5J0wVCI6SwrGlOm3ZPvGCP+NNU5k+6OAlI8eGWso7CaadzxtRjlwSUIDlHra
         JFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=B45Z5CxGlvsCpc4p85mBjzPvImDDhjDoExDhBG6H3eI=;
        b=UJAfXnAKOcIE9OsjDdZ043V4GnxlL/D7e3PgNf6+LvM6kPO53A+NbMJvX5gqJpoVgw
         O6kKo3ghCRLveFckNSsIfGWjBNqeSIuUA3TebxXeQd/DOsTev16w7aufKBtcygZofMEt
         VpL+7+73lk1E0E13R5XVG9kheZXgC5fidkazMpz7caKdPw1IA2F+kEYpSGnM9PSNVsGm
         sVeW9HxNyPBKamVPGYqfbYWz6DLQXCBApMCvDWr0AUNA013uGjT1yMlgGm7UTU157P3j
         yafjyOo6Wr4BGi7XGU/wyoc8sqEUNNV+7RhNyb1CdnsShrPL8WIfnEKSBlFiY0l3GU+J
         /u5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c85si4889382ywb.423.2018.11.28.01.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 01:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRwGD-0004z6-Ut
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 04:35:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gRwG5-0004yF-3A
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 04:35:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gRwFz-0000PM-F4
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 04:35:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:5017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gRwFy-0000OX-IA; Wed, 28 Nov 2018 04:35:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9045ABBA0;
	Wed, 28 Nov 2018 09:35:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-167.ams2.redhat.com [10.36.116.167])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DD105D6AA;
	Wed, 28 Nov 2018 09:35:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Wed, 28 Nov 2018 10:35:36 +0100
Message-Id: <1543397736-8198-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 28 Nov 2018 09:35:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.1?] hw/arm/aspeed: Fix build issue with
 clang 3.4
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H24+OXlEUKTX

When using clang 3.4.2, compilation of QEMU fails like this:

  CC      aarch64-softmmu/hw/arm/aspeed.o
hw/arm/aspeed.c:36:3: error: redefinition of typedef 'AspeedBoardState' is a C11
      feature [-Werror,-Wtypedef-redefinition]
} AspeedBoardState;
  ^
include/hw/arm/aspeed.h:14:33: note: previous definition is here
typedef struct AspeedBoardState AspeedBoardState;
                                ^
1 error generated.
make[1]: *** [hw/arm/aspeed.o] Error 1
make: *** [subdir-aarch64-softmmu] Error 2

Remove the duplicated typedef to fix this issue.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6b33ecd..5158985 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -29,11 +29,11 @@ static struct arm_boot_info aspeed_board_binfo = {
     .nb_cpus = 1,
 };
 
-typedef struct AspeedBoardState {
+struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram;
     MemoryRegion max_ram;
-} AspeedBoardState;
+};
 
 /* Palmetto hardware value: 0x120CE416 */
 #define PALMETTO_BMC_HW_STRAP1 (                                        \
-- 
1.8.3.1

