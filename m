Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp113442wrt;
        Mon, 10 Dec 2018 19:11:40 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U6Ndw3bjjkLHQ9AmUrCqVNgkH+iXqSv8jgHFEmqhpSSvQKCbeNm3hdJLqex6vzTpmkuS3f
X-Received: by 2002:aed:30c4:: with SMTP id 62mr13863717qtf.290.1544497900606;
        Mon, 10 Dec 2018 19:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544497900; cv=none;
        d=google.com; s=arc-20160816;
        b=kqU/k3yYSXYmWbI6SrWRRreiYKqZUYCIO9RWxRNVEibaJV50IzE5dlDVtlY3Vz2fyZ
         ukf9dgRjXAHWKu/ginqWTWZvOG6fXYFjFRhWtYgRswHAiSFcDKbXzzTNjLW9/p5Tilov
         0pUWT0Zk7Dsv2Uj3o9e5lkCAO4mbJ7CiKZcVZF2/HobACpV1Pbo64Jv1aovgHgrJ2jRT
         //zMAh7c6KDjLRC1wPi+h+9iHPdthWLswOTQX6CwmR6g1vpQWCbRi85UCqYAFWa4M9/X
         WjClYCze7MLUX2OrAFS04caVo104su2Zyu+AD4YWnBFlFgUDhF7G1MizTDlbEwDaZOp8
         eCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pb5+jVVNJsNI3JA0nV5CinYknhkN874Qxbuuj6Kuexk=;
        b=uSQeAKRlmz4sB+cu7//pQN2P5aZb1sIGCh8sjmgHG8CffJFotPwujmTogn1hdiutRK
         DnzpRm+ioF5PQmE8LtqvBqYworpstYKQOp+158nERbYKC8Wnlsn7rPjMDPOrS4cYUhHw
         +n2lsyZaSewW3lwM3FDBDNGHJLnoj4+CsMYyK/dLv/q1mVgVVNn4aUq0+aQn46jDtkpn
         jMcd74xt7n2D9i9tS5WkgKPqTS3CFRsR6PLtFerJJfMrXGsJ60conNAT0OYpo6fijrPS
         8G0qwZhqvv8hFYEN/PPIerzh69E+2O3AxGbJG4DEuEmeoTM2vTF6EWX93ro3RWO6NSW2
         I4KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B+uOiSpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z34si2233281qvg.50.2018.12.10.19.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 19:11:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B+uOiSpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWYSS-0003Xu-1s
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 22:11:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gWYRx-0003O9-2b
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 22:11:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gWYRv-0005WL-Ur
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 22:11:09 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gWYRv-0005Vf-Nv; Mon, 10 Dec 2018 22:11:07 -0500
Received: by mail-pg1-x542.google.com with SMTP id z11so5960987pgu.0;
	Mon, 10 Dec 2018 19:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pb5+jVVNJsNI3JA0nV5CinYknhkN874Qxbuuj6Kuexk=;
	b=B+uOiSpY5V1/jTweNByp6jphnQVIechY8sCrPJ1TPLNrc1q6x9Ij2pfHiUOgBB7vSJ
	NQ2ssFyPRilOz3JhM+m/JTZw7zETzZWz8YT7Dfg6kQGbko15F4LbJxu3ip7+OaZFeE4y
	cC9sLbMDHU+frfOuVSo39fzDt9Exs7IdqKSI1xONhw7tHOPdhCNpGqITrbU3/FpNKg5/
	19ExQQcr36ef1g0rHHEA8If7P+TeP3e9gXtLw8MY1d9QOO2Tu8CJE4GAdX2PHM9Kgld4
	EpaR7IxEVQElhhRgwJJU7h0ZvxTWO3/9lxr8UY6bQN1uX6XgHcJ829bIznt4f1qxfCpW
	uG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pb5+jVVNJsNI3JA0nV5CinYknhkN874Qxbuuj6Kuexk=;
	b=TiLA1Nr6WOy99fsdgu/r1QXD2O5jSW3LC1GQH1vxUD+TLRZVdhL4SIpgFiRvemvpK5
	exWVOzjCTZS5HsiZyiwrm6x9JD8aPpFQy/46t98xH9+4yi2XilodF8rqBviTva/BSx2u
	m/1Ff9jg7Zhc4Tr/CVeLXA9rOiX/ssmapKg0eH0oja/SU5u1Poraj0z9PJBBL3UHM6TB
	w/z14+kveAT8wis9Ffwwuwoz8Gous3EohG7aBvc/gX0RP6LS1Ltc+7oqtq/adAbht7dF
	nJqVEOPgvsvxBgTnqdXgszL9lR1I9AxnSJ7kngKE/w92YoCq5v8aTC9n3CZVbp+Piwya
	It6w==
X-Gm-Message-State: AA+aEWaaZwSZLOgfz0NQhTNLnCbqvJu3pVDgQ34AWdeSAi/d69jp2ugY
	HxkEoM4hnfM/X2C8XN8P4M0=
X-Received: by 2002:a63:ac46:: with SMTP id z6mr13091538pgn.162.1544497866766; 
	Mon, 10 Dec 2018 19:11:06 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
	by smtp.gmail.com with ESMTPSA id
	r80sm18142826pfa.111.2018.12.10.19.11.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Dec 2018 19:11:06 -0800 (PST)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 11 Dec 2018 13:41:00 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue, 11 Dec 2018 13:40:43 +1030
Message-Id: <20181211031044.27628-2-joel@jms.id.au>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181211031044.27628-1-joel@jms.id.au>
References: <20181211031044.27628-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH 1/2] aspeed: Add syscon-poweroff to guest device
 tree
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGaKMIzXrp+N

This adds a node to the guest's device tree that allows it to cause Qemu
to exit when the guest shuts down.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 515898548284..00060d44ad51 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,8 +21,10 @@
 #include "hw/i2c/smbus.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/device_tree.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
+#include <libfdt.h>
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -126,6 +128,36 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     g_free(storage);
 }
 
+static void fdt_add_shutdown_node(void *fdt)
+{
+    const char *nodename = "/syscon-poweroff";
+    uint32_t phandle;
+    int offset;
+
+    /* Find the scu phandle */
+    offset = fdt_path_offset(fdt, "/ahb/apb/syscon@1e6e2000");
+    if (offset < 0) {
+        error_report("%s couldn't find syscon, guest shutdown unavailable: %s",
+                     __func__, fdt_strerror(offset));
+        return;
+    }
+    phandle = fdt_get_phandle(fdt, offset);
+
+    /* Add syscon-poweroff node and use 0x1A0, an un-used SCU register */
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cells(fdt, nodename, "regmap", phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "offset", 0x1A0);
+    qemu_fdt_setprop_cells(fdt, nodename, "value", 1);
+}
+
+static void aspeed_board_modify_dtb(const struct arm_boot_info *binfo,
+                                    void *fdt)
+{
+    fdt_add_shutdown_node(fdt);
+}
+
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       Error **errp)
 {
@@ -228,6 +260,7 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.kernel_cmdline = machine->kernel_cmdline;
     aspeed_board_binfo.ram_size = ram_size;
     aspeed_board_binfo.loader_start = sc->info->sdram_base;
+    aspeed_board_binfo.modify_dtb = aspeed_board_modify_dtb;
 
     if (cfg->i2c_init) {
         cfg->i2c_init(bmc);
-- 
2.19.1

