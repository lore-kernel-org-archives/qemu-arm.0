Received: by 10.182.105.169 with SMTP id gn9csp909963obb;
        Thu, 29 Oct 2015 22:37:50 -0700 (PDT)
X-Received: by 10.140.91.135 with SMTP id z7mr7282783qgd.91.1446183470324;
        Thu, 29 Oct 2015 22:37:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j185si4529608qhc.70.2015.10.29.22.37.50
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 22:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs2Nq-0000ra-1D
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 01:37:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LR-0005Jq-DA
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LO-0002Ou-C4
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:21 -0400
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:33934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zs2LO-0002Op-6G; Fri, 30 Oct 2015 01:35:18 -0400
Received: by padhk11 with SMTP id hk11so63266432pad.1;
	Thu, 29 Oct 2015 22:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5XN/Vwe1uFCF8PD6ZrwPhiamaoHBUr868rxGSwyX+O0=;
	b=bBnxVpRcXWJ/fl8pT4h80WXgNNoSceQxIvVToWUrrBh81/fnrLJlbF2aE/HZqJS1qK
	BoCfXKqNKegBA+tjFiqmXJiti8yJd8JEyqxNC3ulRr6vIwvCvSGF8GEhKD+KH1XbDYnI
	hzIo64fQETCckZef2LSGIQ6jPuNld1VGkjW+5d26fZ3YLfdhQZG4z2HiSj1MrX/dJ/5i
	6M3epB1KX5El3jxwEFIaD9aczaLfJHuND53xqdgDRh+H7VqEmC0pYmVbx5VvYP6gA9un
	A9jMAPaZJu35sn4K5B+1fACr1WhQXON2A9gBKJhYQ4/iHyNC5NbF+34h/4AMyFUSRwSj
	5Dnw==
X-Received: by 10.66.220.69 with SMTP id pu5mr6460354pac.59.1446183317759;
	Thu, 29 Oct 2015 22:35:17 -0700 (PDT)
Received: from pcrost-box.hsd1.ca.comcast.net
	(c-24-130-130-137.hsd1.ca.comcast.net. [24.130.130.137])
	by smtp.gmail.com with ESMTPSA id
	yi8sm5604313pab.22.2015.10.29.22.35.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 22:35:16 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 22:34:56 -0700
Message-Id: <b9b9bb8f1c307c1ef8a3f26ff1f34fabb34b332e.1446182614.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::229
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH v2 1/5] arm: boot: Adjust indentation of FIXUP
	comments
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zLFf49pEC+mc

These comments start immediately after the current longest name in the
list. Tab them out to the next tab stop to give a little breathing room
and prepare for FIXUP_BOARD_SETUP which will require more indent.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1:
s/comment/comments in commit message.

 hw/arm/boot.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index bef451b..2a151e2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -28,14 +28,14 @@
 #define KERNEL64_LOAD_ADDR 0x00080000
 
 typedef enum {
-    FIXUP_NONE = 0,   /* do nothing */
-    FIXUP_TERMINATOR, /* end of insns */
-    FIXUP_BOARDID,    /* overwrite with board ID number */
-    FIXUP_ARGPTR,     /* overwrite with pointer to kernel args */
-    FIXUP_ENTRYPOINT, /* overwrite with kernel entry point */
-    FIXUP_GIC_CPU_IF, /* overwrite with GIC CPU interface address */
-    FIXUP_BOOTREG,    /* overwrite with boot register address */
-    FIXUP_DSB,        /* overwrite with correct DSB insn for cpu */
+    FIXUP_NONE = 0,     /* do nothing */
+    FIXUP_TERMINATOR,   /* end of insns */
+    FIXUP_BOARDID,      /* overwrite with board ID number */
+    FIXUP_ARGPTR,       /* overwrite with pointer to kernel args */
+    FIXUP_ENTRYPOINT,   /* overwrite with kernel entry point */
+    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
+    FIXUP_BOOTREG,      /* overwrite with boot register address */
+    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
     FIXUP_MAX,
 } FixupType;
 
-- 
1.9.1

