Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3628616wrq;
        Mon, 2 Jul 2018 06:06:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfKwiFLhKznpz/2+jtWm0AYS5mpZ+LsBS5Nf8SvlBne/ssFm5D56Sgat8Q9HXHBjueIUo9R
X-Received: by 2002:a37:9a41:: with SMTP id c62-v6mr22061509qke.395.1530536797215;
        Mon, 02 Jul 2018 06:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530536797; cv=none;
        d=google.com; s=arc-20160816;
        b=NHDs13ifsxayEph1wsJXDXKGbW0pRcP0hRhkKFru8LiKLJYKF8HgjDCTGwaUrX/TAO
         +ZSVS9KxVWOJg/3TKsPpXTNIxyghyAAiHEfiReGzMKPVXB7q/7lYU7m5F8e/GYDTTcTH
         VePJ4vQIeCy0dFt3p0UrkOG6fQqvZ8VHBgQK8IUrS5lbkO4Y6UvDPtCEZyATS7cO57ow
         0uaVYRZrmdXYt19RfIkEqwXw+3tRghAu5ShrDvMRfCOFIkKU3ti3ibookjm7B0Mjsi2C
         LVaZZWFXfzb21ewvwLzE4gu6wRSmMIhcvJvct9/YDksJXslE2R8CPPileIDED0x/sEOr
         WDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=H+FUr4qHvUA867dg3lmzVA9AQSGUiWMEMMFCT01poTI=;
        b=QZ+oTmFOkKne57ehIVgjQmnUldklZbO6VvaqJ9y+gTgfGH136Swuz514bM966RsafU
         HX21L4uY2VGtLKZ5H82nHD/53sZDErd5C88bEVNFIqYLTLZ9dAWB963Xdv/Cr17N8ODt
         ezRDmfBRzuSuj3XpwuTyApVX8/g3W1wFuTXhOxfwDdJdTLktPCbrtH2qj/uEzL0NuPwl
         jXmyttL8AmQ+dAnFuRUou9H1V1D2og7JS1jx7Gx5npgHG9UO+csHwfeusus5SSHdEJF5
         sSqM4+D4nsgrYMFjd1ocAZgFW9imyhqHw0ZHYUdLQv8fg+wH7Wu8SvMJFAVAA8c6s5js
         Bqng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33-v6si787138qvb.246.2018.07.02.06.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 06:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZyXM-00027X-Na
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 09:06:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fZyXA-00025v-0p
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 09:06:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fZyX2-0006vu-El
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 09:06:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fZyX2-0006rX-7R; Mon, 02 Jul 2018 09:06:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fZyWt-0001Eh-DC; Mon, 02 Jul 2018 14:06:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  2 Jul 2018 14:06:05 +0100
Message-Id: <20180702130605.13611-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0] boards.h: Remove doc comment reference
 to nonexistent function
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
Cc: Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gMPNxcL2ji2S

commit b08199c6fbea1 accidentally added a reference to a doc
comment to a nonexistent memory_region_allocate_aux_memory().
This was a leftover from a previous version of the patchset
which defined memory_region_allocate_aux_memory() for
"allocate RAM MemoryRegion and register it for migration"
and left "memory_region_init_ram()" with its original semantics
of "allocate RAM MR but do not register for migration". In
the end we decided on the approach of "memory_region_init_ram()
registers the MR for migration, and memory_region_init_ram_nomigrate()
is a new function which does not", but this comment change
got left in by mistake. Revert that part of the commit.

Reported-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Doesn't strictly need to go into 3.0, but it's a trivial
doc comment fix...

 include/hw/boards.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 79069ddcbec..d139a431a67 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -35,8 +35,7 @@
  *
  * Smaller pieces of memory (display RAM, static RAMs, etc) don't need
  * to be backed via the -mem-path memory backend and can simply
- * be created via memory_region_allocate_aux_memory() or
- * memory_region_init_ram().
+ * be created via memory_region_init_ram().
  */
 void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
                                           const char *name,
-- 
2.17.1

